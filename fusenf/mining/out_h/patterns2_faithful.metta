;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           canonical_substrate.jsonl (2302 records; 2154 carry at least one pattern) — patterns2.jsonl: 7766 patterns, the miner's inventory; this view mines nothing
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 6037 constant-lifted (shape-stratum) patterns are an addition
;;   closure             closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit)
;;   meta-node           (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (2 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …))
;;   proposals           closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter, kept in the JSONL and the counts, but a one-atom pack is a rename, so they are not rendered
;;
;; RECORD FORMAT (every record is one unit = one rooted subtree)
;;   ;; <pattern id>  support <records> (occ <matches>)  size <atoms>  root <variable> (<kind>)  depth <d>
;;   ;;   e.g. <up to three supporting record ids>
;;   (Implication <the unit as a conjunctive query> (Mn<Name> <root> <other variables>))
;;     = the pack rule the proposal would become (naming provisional; the gauntlet decides); a subsumed
;;     unit carries no rule and is rendered as its bare query under a 'subsumed by' note
;; Sections: CLOSED UNITS (the meta-node proposals) then SUBSUMED UNITS (a larger unit on the same records
;; contains them); each sorted by support desc, then pattern id. Single-atom units are not rendered.

;; ==================== CLOSED UNITS: 728 of 1454 rooted-subtree units (k = 4, support >= 3 of 2302 records) ====================

;; p200025  support 232 (occ 271)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000045 tierB-000049
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnAgent_Past $e0 $x0))

;; p200030  support 195 (occ 224)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000018 tierB-000034
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_Patient $e0 $x0))

;; p200036  support 154 (occ 171)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000021 tierB-000047
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_Theme $e0 $x0))

;; p200048  support 114 (occ 122)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000101
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_Theme $e0 $x0 $x1))

;; p200075  support 74 (occ 84)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (MnAgent_Patient $e0 $x0 $x1))

;; p200100  support 62 (occ 68)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(Implication (And (Location $e0 $x0) (Past $e0)) (MnLocation_Past $e0 $x0))

;; p200105  support 60 (occ 64)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000145
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme $e0 $x0 $x1))

;; p200112  support 58 (occ 60)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000036 tierB-000098
(Implication (And (Agent $e0 $x0) (Ongoing $e0)) (MnAgent_Ongoing $e0 $x0))

;; p200137  support 51 (occ 58)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000073 tierB-000170
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient $e0 $x0 $x1))

;; p200160  support 46 (occ 50)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(Implication (And (Past $e0) (Theme $e0 $e1)) (MnPast_ThemeEv $e0 $e1))

;; p200163  support 45 (occ 49)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000124 tierB-000134 tierB-000191
(Implication (And (Experiencer $e0 $x0) (Past $e0)) (MnExperiencer_Past $e0 $x0))

;; p200196  support 40 (occ 40)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))

;; p200209  support 38 (occ 38)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(Implication (And (Goal $e0 $x0) (Past $e0)) (MnGoal_Past $e0 $x0))

;; p200210  support 38 (occ 40)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(Implication (And (Ongoing $e0) (Past $e0)) (MnOngoing_Past $e0))

;; p200214  support 37 (occ 41)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(Implication (And (Ongoing $e0) (Patient $e0 $x0)) (MnOngoing_Patient $e0 $x0))

;; p200243  support 33 (occ 38)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (MnAgent_Location $e0 $x0 $x1))

;; p200263  support 30 (occ 46)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnAgentOfPerson $e0 $x0))

;; p200292  support 28 (occ 30)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Experiencer $e0 $x0) (Result $e1 $e0)) (MnResultEvOfExperiencer $e1 $e0 $x0))

;; p200293  support 28 (occ 32)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(Implication (And (Location $e0 $x0) (Ongoing $e0)) (MnLocation_Ongoing $e0 $x0))

;; p200320  support 27 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (MnAgent_ThemeEv $e0 $e1 $x0))

;; p200321  support 27 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(Implication (And (Holder $e0 $x0) (Member $e0 have)) (MnHolder_Have $e0 $x0))

;; p200322  support 27 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(Implication (And (Past $e0) (Result $e0 $e1)) (MnPast_ResultEv $e0 $e1))

;; p200323  support 27 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Patient $e0 $x0) (Result $e0 $e1)) (MnPatient_ResultEv $e0 $e1 $x0))

;; p200337  support 26 (occ 26)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; p200379  support 24 (occ 27)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(Implication (And (Agent $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfAgent $e1 $e0 $x0))

;; p200380  support 24 (occ 26)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfOngoing $e1 $e0))

;; p200425  support 20 (occ 30)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001813
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0)) (MnAgentOfPerson_Past $e0 $x0))

;; p200431  support 20 (occ 20)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(Implication (And (Past $e0) (Source $e0 $x0)) (MnPast_Source $e0 $x0))

;; p200451  support 19 (occ 21)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; p200463  support 19 (occ 21)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; p200466  support 19 (occ 21)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000770 tierB-000978 tierB-001507
(Implication (And (Agent $e0 $x0) (Member $x0 thing)) (MnAgentOfThing $e0 $x0))

;; p200480  support 18 (occ 21)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; p200493  support 18 (occ 21)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(Implication (And (Location $e0 $x0) (Patient $e0 $x1)) (MnLocation_Patient $e0 $x0 $x1))

;; p200494  support 18 (occ 19)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Theme $e0 $x0)) (MnThemeOfThing $e0 $x0))

;; p200517  support 17 (occ 17)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; p200535  support 17 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1)) (MnAgent_Goal $e0 $x0 $x1))

;; p200536  support 17 (occ 17)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierB-000966 tierC-000017 tierC-000018
(Implication (And (Member $x0 person) (Possession $x1 $x0)) (MnPossessionOfPerson $x1 $x0))

;; p200577  support 16 (occ 19)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnAgent_Location_Past $e0 $x0 $x1))

;; p200578  support 16 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; p200582  support 16 (occ 18)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(Implication (And (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfPatient $e1 $e0 $x0))

;; p200611  support 15 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0)) (MnExperiencer_Ongoing $e0 $x0))

;; p200612  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000269
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; p200613  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000416 tierB-000520 tierB-000574
(Implication (And (Ongoing $e0) (Theme $e0 $x0)) (MnOngoing_Theme $e0 $x0))

;; p200651  support 14 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (MnLocation_Theme $e0 $x0 $x1))

;; p200652  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; p200653  support 14 (occ 16)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(Implication (And (Possession $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPossession $e0 $x0 $x1))

;; p200720  support 13 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; p200727  support 13 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (MnExperiencer_Location $e0 $x0 $x1))

;; p200728  support 13 (occ 18)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(Implication (And (Member $e0 build) (Patient $e0 $x0)) (MnBuild_Patient $e0 $x0))

;; p200785  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; p200830  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0)) (MnAgent_Ongoing_Past $e0 $x0))

;; p200844  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(Implication (And (Before $e0 $e1) (Past $e1)) (MnBeforeEvOfPast_p200844 $e0 $e1))

;; p200845  support 12 (occ 14)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnThemeOfCardinalityNum $e0 $x0))

;; p200846  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0)) (MnHave_Past $e0))

;; p200848  support 12 (occ 14)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000082 tierB-000370 tierB-000389
(Implication (And (Member $x0 thing) (Patient $e0 $x0)) (MnPatientOfThing $e0 $x0))

;; p200899  support 11 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfOngoing $e0 $e1 $x0))

;; p200900  support 11 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p200924  support 11 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnAgent_Location_Ongoing $e0 $x0 $x1))

;; p200925  support 11 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; p200926  support 11 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; p200936  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(Implication (And (Future $e0) (Patient $e0 $x0)) (MnFuture_Patient $e0 $x0))

;; p200937  support 11 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(Implication (And (Instrument $e0 $x0) (Patient $e0 $x1)) (MnInstrument_Patient $e0 $x0 $x1))

;; p201043  support 10 (occ 12)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201063  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(Implication (And (Agent $e0 $x0) (Future $e0)) (MnAgent_Future $e0 $x0))

;; p201064  support 10 (occ 19)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $x0 company)) (MnAgentOfCompany $e0 $x0))

;; p201065  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; p201066  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; p201067  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001582
(Implication (And (Member $e0 become) (Patient $e0 $x0)) (MnBecome_Patient $e0 $x0))

;; p201068  support 10 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
(Implication (And (Member $e0 begin) (Past $e0)) (MnBegin_Past $e0))

;; p201069  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; p201070  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; p201071  support 10 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(Implication (And (Past $e0) (To $e0 $e1)) (MnPast_ToEv $e0 $e1))

;; p201102  support 9 (occ 11)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201103  support 9 (occ 11)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201104  support 9 (occ 11)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; p201105  support 9 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; p201166  support 9 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1)) (MnAgentOfPerson_Patient $e0 $x0 $x1))

;; p201167  support 9 (occ 12)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000978 tierB-001661 tierB-001881
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1)) (MnAgentOfThing_Theme $e0 $x0 $x1))

;; p201169  support 9 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(Implication (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfPatient $e0 $e1 $x0))

;; p201219  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnAgent_Ongoing_Patient $e0 $x0 $x1))

;; p201220  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; p201221  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000148 tierB-000381
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Past $e0)) (MnLocation_Ongoing_Past $e0 $x0))

;; p201223  support 9 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierC-000045
(Implication (And (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_Patient $e0 $x0))

;; p201225  support 9 (occ 11)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(Implication (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p201240  support 9 (occ 11)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person)) (MnAgentOfGroupOfPerson $e0 $x0))

;; p201241  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_Recipient $e0 $x0 $x1))

;; p201244  support 9 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000370 tierB-000842 tierB-000960
(Implication (And (Experiencer $e0 $x0) (Member $x0 thing)) (MnExperiencerOfThing $e0 $x0))

;; p201247  support 9 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
(Implication (And (Member $e0 kill) (Patient $e0 $x0)) (MnKill_Patient $e0 $x0))

;; p201248  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000325 tierB-000539
(Implication (And (Member $e0 make) (Past $e0)) (MnMake_Past $e0))

;; p201249  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnStart_Patient $e0 $x0))

;; p201250  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000866 tierB-000938
(Implication (And (Member $e0 use) (Theme $e0 $x0)) (MnUse_Theme $e0 $x0))

;; p201251  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000080 tierB-000246
(Implication (And (Obligated $e0) (Theme $e0 $x0)) (MnObligated_Theme $e0 $x0))

;; p201252  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000150 tierB-000769 tierB-000775
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_Recipient $e0 $x0))

;; p201344  support 8 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0)) (MnAgentOfGroupOfPerson_Past $e0 $x0))

;; p201345  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0)) (MnHave_ThemeOfCardinalityNum $e0 $x0))

;; p201446  support 8 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-001867 tierC-000045
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_Build_Patient $e0 $x0 $x1))

;; p201476  support 8 (occ 8)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(Implication (And (Again $e0) (Past $e0)) (MnAgain_Past $e0))

;; p201477  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000410 tierB-000587 tierB-000648
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnAgentOfGroupOfChild $e0 $x0))

;; p201479  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_Make $e0 $x0))

;; p201480  support 8 (occ 18)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001512 tierC-000017 tierC-000018
(Implication (And (Agent $e0 $x0) (Possession $x0 $x1)) (MnAgentOfPossession $e0 $x0 $x1))

;; p201481  support 8 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (To $e0 $e1)) (MnAgent_ToEv $e0 $e1 $x0))

;; p201482  support 8 (occ 10)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (To $e1 $e0)) (MnToEvOfAgent $e1 $e0 $x0))

;; p201483  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(Implication (And (Future $e0) (Theme $e0 $x0)) (MnFuture_Theme $e0 $x0))

;; p201484  support 8 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000393 tierB-000412
(Implication (And (GroupOf $x0 person) (Patient $e0 $x0)) (MnPatientOfGroupOfPerson $e0 $x0))

;; p201485  support 8 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000706 tierC-000243
(Implication (And (Location $e0 $x0) (Member $e0 find)) (MnLocation_Find $e0 $x0))

;; p201486  support 8 (occ 10)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(Implication (And (Location $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfLocation $e1 $e0 $x0))

;; p201487  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Patient $e0 $x0)) (MnMannerQuickly_Patient $e0 $x0))

;; p201488  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001079 tierB-001582
(Implication (And (Member $e0 become) (Past $e0)) (MnBecome_Past $e0))

;; p201489  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierB-001817
(Implication (And (Member $e0 become) (Result $e0 $e1)) (MnBecome_ResultEv $e0 $e1))

;; p201490  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; p201491  support 8 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierB-001995 tierC-000009
(Implication (And (Member $e0 produce) (Patient $e0 $x0)) (MnProduce_Patient $e0 $x0))

;; p201492  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000978
(Implication (And (Member $e0 take) (Theme $e0 $x0)) (MnTake_Theme $e0 $x0))

;; p201493  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(Implication (And (Member $e0 try) (Past $e0)) (MnTry_Past $e0))

;; p201494  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Theme $e0 $e1)) (MnTry_ThemeEv $e0 $e1))

;; p201495  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001601 tierB-001962 tierC-000089
(Implication (And (Member $e0 write) (Patient $e0 $x0)) (MnWrite_Patient $e0 $x0))

;; p201496  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(Implication (And (Obligated $e0) (Patient $e0 $x0)) (MnObligated_Patient $e0 $x0))

;; p201497  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(Implication (And (Past $e0) (Stimulus $e0 $x0)) (MnPast_Stimulus $e0 $x0))

;; p201498  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(Implication (And (Patient $e0 $x0) (Source $e0 $x1)) (MnPatient_Source $e0 $x0 $x1))

;; p201545  support 7 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1)) (MnAgentOfPerson_Past_Patient $e0 $x0 $x1))

;; p201670  support 7 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001932
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_Past $e0 $x0))

;; p201671  support 7 (occ 17)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
(Implication (And (Agent $e0 $x0) (Member $x1 person) (Possession $x0 $x1)) (MnAgentOfPossessionOfPerson $e0 $x0 $x1))

;; p201673  support 7 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001130
(Implication (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p201674  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfCardinalityNum $e0 $x0))

;; p201676  support 7 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001582 tierB-001817 tierC-000001
(Implication (And (Experiencer $e0 $x0) (Member $e1 become) (Result $e1 $e0)) (MnBecome_ResultEvOfExperiencer $e1 $e0 $x0))

;; p201677  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfThing $e0 $x0))

;; p201679  support 7 (occ 9)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001836 tierB-001900 tierC-000047
(Implication (And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0)) (MnPast_ThemeOfPossession $e0 $x0 $x1))

;; p201767  support 7 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2)) (MnAgent_Location_Patient $e0 $x0 $x1 $x2))

;; p201768  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1)) (MnAgent_Make_Patient $e0 $x0 $x1))

;; p201769  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0)) (MnMannerQuickly_Past_Patient $e0 $x0))

;; p201770  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001582 tierC-000001
(Implication (And (Member $e0 become) (Past $e0) (Patient $e0 $x0)) (MnBecome_Past_Patient $e0 $x0))

;; p201771  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001582 tierB-001817 tierC-000001
(Implication (And (Member $e0 become) (Patient $e0 $x0) (Result $e0 $e1)) (MnBecome_Patient_ResultEv $e0 $e1 $x0))

;; p201772  support 7 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
(Implication (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0)) (MnKill_Past_Patient $e0 $x0))

;; p201773  support 7 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierC-000009 tierC-000010
(Implication (And (Member $e0 produce) (Past $e0) (Patient $e0 $x0)) (MnProduce_Past_Patient $e0 $x0))

;; p201774  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
(Implication (And (Member $e0 write) (Past $e0) (Patient $e0 $x0)) (MnWrite_Past_Patient $e0 $x0))

;; p201812  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000156 tierB-000556 tierB-000745
(Implication (And (Agent $e0 $x0) (Can $e0)) (MnAgent_Can $e0 $x0))

;; p201813  support 7 (occ 7)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001685 tierC-000181 tierC-000182
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 child)) (MnCardinalityNum_GroupOfChild $x0))

;; p201815  support 7 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000191 tierB-001160 tierB-001485
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 person)) (MnExperiencerOfGroupOfPerson $e0 $x0))

;; p201816  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(Implication (And (For $e0 $e1) (Past $e0)) (MnForEv_Past $e0 $e1))

;; p201817  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(Implication (And (For $e0 $x0) (Past $e0)) (MnFor_Past $e0 $x0))

;; p201818  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(Implication (And (Goal $e0 $x0) (Patient $e0 $x1)) (MnGoal_Patient $e0 $x0 $x1))

;; p201820  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000255 tierB-000277
(Implication (And (Member $e0 come) (Past $e0)) (MnCome_Past $e0))

;; p201821  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Patient $e0 $x0)) (MnFall_Patient $e0 $x0))

;; p201822  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(Implication (And (Member $e0 find) (Theme $e0 $x0)) (MnFind_Theme $e0 $x0))

;; p201823  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Stimulus $e0 $x0)) (MnHear_Stimulus $e0 $x0))

;; p201825  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000173 tierB-000325 tierB-000951
(Implication (And (Member $e0 make) (Ongoing $e0)) (MnMake_Ongoing $e0))

;; p201826  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(Implication (And (Member $e0 make) (Result $e0 $e1)) (MnMake_ResultEv $e0 $e1))

;; p201827  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-001487
(Implication (And (Member $e0 open) (Patient $e0 $x0)) (MnOpen_Patient $e0 $x0))

;; p201829  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
(Implication (And (Member $e0 take) (Past $e0)) (MnTake_Past $e0))

;; p201830  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000324 tierB-000805
(Implication (And (Member $e0 walk) (Past $e0)) (MnWalk_Past $e0))

;; p201832  support 7 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(Implication (And (Ongoing $e0) (Result $e0 $e1)) (MnOngoing_ResultEv $e0 $e1))

;; p201833  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000229 tierB-001066 tierB-001243
(Implication (And (PartOf $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPartOf $e0 $x0 $x1))

;; p201834  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Past $e0) (Through $e0 $x0)) (MnPast_Through $e0 $x0))

;; p201891  support 6 (occ 10)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000017 tierC-000018 tierC-000123
(Implication (And (Agent $e0 $x0) (Member $x1 person) (Past $e0) (Possession $x0 $x1)) (MnAgentOfPossessionOfPerson_Past $e0 $x0 $x1))

;; p201892  support 6 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001697
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p201893  support 6 (occ 8)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001394
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p202010  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-001130 tierC-000045
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Patient $e0 $x1)) (MnAgentOfCompany_Patient $e0 $x0 $x1))

;; p202013  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000133 tierB-000379 tierB-000797
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfCardinalityNum $e0 $x0))

;; p202014  support 6 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000412 tierB-000771
(Implication (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfGroupOfPerson $e0 $x0))

;; p202015  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfDoor $e0 $x0))

;; p202016  support 6 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000389 tierB-001520 tierC-000119
(Implication (And (Member $x0 thing) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfThing $e0 $x0))

;; p202114  support 6 (occ 10)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierC-000045 tierC-000046
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Past $e0) (Patient $e0 $x1)) (MnAgent_Build_Past_Patient $e0 $x0 $x1))

;; p202136  support 6 (occ 8)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfAgent-Location $e1 $e0 $x0 $x1))

;; p202139  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnExperiencer_Location_Ongoing $e0 $x0 $x1))

;; p202140  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnExperiencer_Location_Past $e0 $x0 $x1))

;; p202141  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(Implication (And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnLocation_Past_Theme $e0 $x0 $x1))

;; p202142  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierC-000001
(Implication (And (Member $e0 become) (Past $e0) (Result $e0 $e1)) (MnBecome_Past_ResultEv $e0 $e1))

;; p202143  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0)) (MnHear_Past_Stimulus $e0 $x0))

;; p202144  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(Implication (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1)) (MnPast_Patient_Source $e0 $x0 $x1))

;; p202190  support 6 (occ 6)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
(Implication (And (Agent $e0 $x0) (Before $e1 $e0)) (MnBeforeEvOfAgent $e1 $e0 $x0))

;; p202191  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come)) (MnAgent_Come $e0 $x0))

;; p202192  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000584 tierC-000095
(Implication (And (Agent $e0 $x0) (Member $e0 follow)) (MnAgent_Follow $e0 $x0))

;; p202193  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(Implication (And (Agent $e0 $x0) (Member $e0 use)) (MnAgent_Use $e0 $x0))

;; p202194  support 6 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001416 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $x0 man)) (MnAgentOfMan $e0 $x0))

;; p202195  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(Implication (And (Agent $e0 $x0) (Source $e0 $x1)) (MnAgent_Source $e0 $x0 $x1))

;; p202196  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-001989 tierC-000017
(Implication (And (As $e0 $x0) (Past $e0)) (MnAs_Past $e0 $x0))

;; p202197  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(Implication (And (Can $e0) (Patient $e0 $x0)) (MnCan_Patient $e0 $x0))

;; p202198  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000745
(Implication (And (Can $e0) (Theme $e0 $x0)) (MnCan_Theme $e0 $x0))

;; p202199  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(Implication (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1)) (MnCardinalityNum_SubsetOf $x0 $x1))

;; p202200  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Probably $e0)) (MnExperiencer_Probably $e0 $x0))

;; p202201  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Theme $e0 $e1)) (MnExperiencer_ThemeEv $e0 $e1 $x0))

;; p202202  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000938 tierB-000962 tierC-000277
(Implication (And (For $e0 $e1) (Theme $e0 $x0)) (MnForEv_Theme $e0 $e1 $x0))

;; p202203  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go)) (MnGoal_Go $e0 $x0))

;; p202204  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Theme $e0 $x1)) (MnGoal_Theme $e0 $x0 $x1))

;; p202205  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(Implication (And (In $e0 $x0) (Past $e0)) (MnIn_Past $e0 $x0))

;; p202206  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live)) (MnLocation_Live $e0 $x0))

;; p202207  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
(Implication (And (Member $e0 bear) (Past $e0)) (MnBear_Past $e0))

;; p202208  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0)) (MnCapture_Past $e0))

;; p202209  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000517 tierB-001491
(Implication (And (Member $e0 change) (Patient $e0 $x0)) (MnChange_Patient $e0 $x0))

;; p202210  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Past $e0)) (MnFall_Past $e0))

;; p202211  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
(Implication (And (Member $e0 find) (Past $e0)) (MnFind_Past $e0))

;; p202212  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000577 tierB-000672 tierB-000890
(Implication (And (Member $e0 get) (Past $e0)) (MnGet_Past $e0))

;; p202213  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
(Implication (And (Member $e0 receive) (Past $e0)) (MnReceive_Past $e0))

;; p202214  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Patient $e0 $x0)) (MnTurn_Patient $e0 $x0))

;; p202215  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierB-000867 tierB-001515
(Implication (And (Member $e0 work) (Past $e0)) (MnWork_Past $e0))

;; p202216  support 6 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000237
(Implication (And (Member $x0 person) (Patient $e0 $x0)) (MnPatientOfPerson $e0 $x0))

;; p202217  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000041 tierC-000042 tierC-000099
(Implication (And (Member $x0 person) (Theme $e0 $x0)) (MnThemeOfPerson $e0 $x0))

;; p202218  support 6 (occ 6)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000080 tierB-000147 tierB-001143
(Implication (And (Obligated $e0) (Past $e0)) (MnObligated_Past $e0))

;; p202219  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(Implication (And (Past $e0) (Patient $e0 $e1)) (MnPast_PatientEv $e0 $e1))

;; p202220  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(Implication (And (Past $e0) (Time $e0 yesterday)) (MnPast_TimeYesterday $e0))

;; p202221  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Patient $e0 $x0) (Theme $e0 $e1)) (MnPatient_ThemeEv $e0 $e1 $x0))

;; p202222  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000400 tierB-000781 tierB-001325
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnSource_Theme $e0 $x0 $x1))

;; p202223  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(Implication (And (Theme $e0 $x0) (To $e0 $e1)) (MnTheme_ToEv $e0 $e1 $x0))

;; p202333  support 5 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Begin_ThemeEvOfOngoing $e0 $e1 $x0))

;; p202334  support 5 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0)) (MnBegin_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p202335  support 5 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0)) (MnBegin_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p202336  support 5 (occ 9)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierC-000045 tierC-000046
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Past $e0) (Patient $e0 $x1)) (MnAgentOfCompany_Past_Patient $e0 $x0 $x1))

;; p202339  support 5 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001582 tierC-000001 tierC-000158
(Implication (And (Experiencer $e0 $x0) (Member $e1 become) (Past $e1) (Result $e1 $e0)) (MnBecome_Past_ResultEvOfExperiencer $e1 $e0 $x0))

;; p202342  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing-Patient $e0 $e1 $x0))

;; p202558  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierB-001283 tierB-001933
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfLocation $e0 $e1 $x0 $x1))

;; p202560  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(Implication (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0)) (MnAgentOfBoy_Past $e0 $x0))

;; p202561  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000745 tierC-000047 tierC-000048
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Theme $e0 $x1)) (MnAgentOfPerson_Theme $e0 $x0 $x1))

;; p202562  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001994 tierC-000159 tierC-000160
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0)) (MnAgentOfThing_Past $e0 $x0))

;; p202564  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0)) (MnPast_ToEvOfAgent $e1 $e0 $x0))

;; p202570  support 5 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000353
(Implication (And (Member $x0 person) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfPerson $e0 $x0))

;; p202571  support 5 (occ 5)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPatient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p202724  support 5 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnAgent_Begin_Past_ThemeEv $e0 $e1 $x0))

;; p202725  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1)) (MnHolder_Have_Past_Theme $e0 $x0 $x1))

;; p202726  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001582 tierC-000001 tierC-000158
(Implication (And (Member $e0 become) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnBecome_Past_Patient_ResultEv $e0 $e1 $x0))

;; p202760  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come) (Past $e0)) (MnAgent_Come_Past $e0 $x0))

;; p202761  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000584 tierC-000095 tierC-000096
(Implication (And (Agent $e0 $x0) (Member $e0 follow) (Theme $e0 $x1)) (MnAgent_Follow_Theme $e0 $x0 $x1))

;; p202762  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(Implication (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1)) (MnAgent_Past_Recipient $e0 $x0 $x1))

;; p202763  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(Implication (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1)) (MnAgent_Past_Source $e0 $x0 $x1))

;; p202764  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1)) (MnAgent_Past_Through $e0 $x0 $x1))

;; p202765  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1)) (MnAgent_Past_ToEv $e0 $e1 $x0))

;; p202766  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfAgent-Patient $e1 $e0 $x0 $x1))

;; p202767  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierC-000277 tierC-000278
(Implication (And (For $e0 $e1) (Past $e0) (Theme $e0 $x0)) (MnForEv_Past_Theme $e0 $e1 $x0))

;; p202768  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go) (Past $e0)) (MnGoal_Go_Past $e0 $x0))

;; p202769  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnGoal_Past_Theme $e0 $x0 $x1))

;; p202772  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000392 tierB-001143 tierB-001429
(Implication (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnInstrument_Past_Patient $e0 $x0 $x1))

;; p202773  support 5 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierC-000279 tierC-000280
(Implication (And (Location $e0 $x0) (Member $e0 find) (Theme $e0 $x1)) (MnLocation_Find_Theme $e0 $x0 $x1))

;; p202774  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnLocation_Ongoing_Patient $e0 $x0 $x1))

;; p202775  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0)) (MnCapture_Past_Theme $e0 $x0))

;; p202776  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000609 tierB-000779 tierB-001306
(Implication (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0)) (MnFall_Past_Patient $e0 $x0))

;; p202777  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000964 tierB-001339
(Implication (And (Member $e0 make) (Past $e0) (Patient $e0 $x0)) (MnMake_Past_Patient $e0 $x0))

;; p202778  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(Implication (And (Member $e0 present) (Past $e0) (Theme $e0 $x0)) (MnPresent_Past_Theme $e0 $x0))

;; p202779  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(Implication (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0)) (MnReceive_Past_Theme $e0 $x0))

;; p202780  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(Implication (And (Member $e0 start) (Past $e0) (Patient $e0 $x0)) (MnStart_Past_Patient $e0 $x0))

;; p202781  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Past $e0) (Theme $e0 $e1)) (MnTry_Past_ThemeEv $e0 $e1))

;; p202782  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
(Implication (And (Member $e0 win) (Past $e0) (Theme $e0 $x0)) (MnWin_Past_Theme $e0 $x0))

;; p202783  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001325 tierB-001540
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnPast_Source_Theme $e0 $x0 $x1))

;; p202849  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001302 tierC-000122
(Implication (And (Agent $e0 $x0) (Before $e0 $e1)) (MnAgent_BeforeEv $e0 $e1 $x0))

;; p202850  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnAgentOfCardinalityNum $e0 $x0))

;; p202852  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001089 tierB-001283
(Implication (And (Agent $e0 $x0) (Member $e0 cause)) (MnAgent_Cause $e0 $x0))

;; p202853  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000298 tierB-000713
(Implication (And (Agent $e0 $x0) (Member $e0 leave)) (MnAgent_Leave $e0 $x0))

;; p202854  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000648 tierB-001125
(Implication (And (Agent $e0 $x0) (Member $e0 play)) (MnAgent_Play $e0 $x0))

;; p202855  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001156 tierB-001901 tierC-000127
(Implication (And (Agent $e0 $x0) (Member $e0 sing)) (MnAgent_Sing $e0 $x0))

;; p202856  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000225 tierB-000710 tierB-001984
(Implication (And (Agent $e0 $x0) (Member $e0 study)) (MnAgent_Study $e0 $x0))

;; p202857  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierB-000978 tierB-001726
(Implication (And (Agent $e0 $x0) (Member $e0 take)) (MnAgent_Take $e0 $x0))

;; p202858  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001205
(Implication (And (Agent $e0 $x0) (Member $e0 watch)) (MnAgent_Watch $e0 $x0))

;; p202860  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(Implication (And (Agent $e0 $x0) (Result $e0 $e1)) (MnAgent_ResultEv $e0 $e1 $x0))

;; p202862  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(Implication (And (Already $e0) (Patient $e0 $x0)) (MnAlready_Patient $e0 $x0))

;; p202863  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(Implication (And (Before $x0 $e0) (Past $e0)) (MnBeforeEvOfPast_p202863 $x0 $e0))

;; p202864  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001334 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep)) (MnExperiencer_Sleep $e0 $x0))

;; p202865  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001258 tierC-000013 tierC-000014
(Implication (And (Experiencer $e0 $x0) (Member $x0 person)) (MnExperiencerOfPerson $e0 $x0))

;; p202866  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(Implication (And (Experiencer $e0 $x0) (Source $e0 $x1)) (MnExperiencer_Source $e0 $x0 $x1))

;; p202867  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(Implication (And (Experiencer $e0 $x0) (Time $e0 today)) (MnExperiencer_TimeToday $e0 $x0))

;; p202868  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000162 tierB-000483 tierB-001069
(Implication (And (GroupOf $x0 thing) (Theme $e0 $x0)) (MnThemeOfGroupOfThing $e0 $x0))

;; p202870  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(Implication (And (LocatedIn $x0 $x1) (Location $e0 $x0)) (MnLocationOfLocatedIn $e0 $x0 $x1))

;; p202871  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(Implication (And (LocatedIn $x0 $x1) (Patient $e0 $x0)) (MnPatientOfLocatedIn $e0 $x0 $x1))

;; p202872  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(Implication (And (Measure $e0 duration <num> year) (Past $e0)) (MnMeasureDurationNumYear_Past $e0))

;; p202874  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
(Implication (And (Member $e0 contain) (Theme $e0 $x0)) (MnContain_Theme $e0 $x0))

;; p202875  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(Implication (And (Member $e0 create) (Patient $e0 $x0)) (MnCreate_Patient $e0 $x0))

;; p202876  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000138
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnDirect_Patient $e0 $x0))

;; p202877  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(Implication (And (Member $e0 draw) (Past $e0)) (MnDraw_Past $e0))

;; p202878  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierC-000076 tierC-000095
(Implication (And (Member $e0 follow) (Past $e0)) (MnFollow_Past $e0))

;; p202880  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0)) (MnGet_Ongoing $e0))

;; p202881  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(Implication (And (Member $e0 get) (Patient $e0 $x0)) (MnGet_Patient $e0 $x0))

;; p202882  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000748
(Implication (And (Member $e0 get) (Result $e0 $e1)) (MnGet_ResultEv $e0 $e1))

;; p202883  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000425 tierB-000704
(Implication (And (Member $e0 leave) (Past $e0)) (MnLeave_Past $e0))

;; p202884  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000114 tierB-000339
(Implication (And (Member $e0 need) (Theme $e0 $e1)) (MnNeed_ThemeEv $e0 $e1))

;; p202888  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-001153 tierB-001563
(Implication (And (Member $e0 run) (Past $e0)) (MnRun_Past $e0))

;; p202889  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000326 tierB-000784 tierB-000975
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnSell_Theme $e0 $x0))

;; p202890  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
(Implication (And (Member $e0 sing) (Past $e0)) (MnSing_Past $e0))

;; p202891  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001334 tierB-001753
(Implication (And (Member $e0 sleep) (Ongoing $e0)) (MnSleep_Ongoing $e0))

;; p202892  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
(Implication (And (Member $e0 stand) (Past $e0)) (MnStand_Past $e0))

;; p202893  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-001084
(Implication (And (Member $e0 study) (Ongoing $e0)) (MnStudy_Ongoing $e0))

;; p202894  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0)) (MnTurn_Past $e0))

;; p202897  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(Implication (And (Member $x0 bad) (Patient $e0 $x0)) (MnPatientOfBad $e0 $x0))

;; p202898  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001005 tierB-001687
(Implication (And (Member $x0 house) (Theme $e0 $x0)) (MnThemeOfHouse $e0 $x0))

;; p202899  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(Implication (And (Member $x0 new) (Theme $e0 $x0)) (MnThemeOfNew $e0 $x0))

;; p202900  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001642 tierB-001920 tierB-001997
(Implication (And (Member $x0 room) (Patient $e0 $x0)) (MnPatientOfRoom $e0 $x0))

;; p202901  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(Implication (And (Member $x0 sound) (Patient $e0 $x0)) (MnPatientOfSound $e0 $x0))

;; p202902  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(Implication (And (Past $e0) (Stimulus $e0 $e1)) (MnPast_StimulusEv $e0 $e1))

;; p202903  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(Implication (And (Past $e0) (Time $e0 (Year <num>))) (MnPast_Time(YearNum $e0))

;; p202904  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-001894
(Implication (And (Past $e0) (Time $e0 night)) (MnPast_TimeNight $e0))

;; p202905  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(Implication (And (Past $e0) (TimeAtMost $e0 (Year <num>))) (MnPast_TimeAtMost(YearNum $e0))

;; p202908  support 5 (occ 7)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(Implication (And (Theme $e0 $x0) (To $e1 $e0)) (MnToEvOfTheme $e1 $e0 $x0))

;; p203046  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
(Implication (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1)) (MnBeforeEvOfAgent-Past_Past $e1 $e0 $x0))

;; p203047  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (GroupOf $x1 view) (Member $x0 thing) (Theme $e0 $x1)) (MnAgentOfThing_ThemeOfGroupOfView $e0 $x0 $x1))

;; p203048  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (GroupOf $x1 view) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfGroupOfView $e0 $x0 $x1))

;; p203049  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (GroupOf $x1 view) (Possession $x1 free_soil_party) (Theme $e0 $x1)) (MnAgent_ThemeOfGroupOfView-PossessionFreeSoilParty $e0 $x0 $x1))

;; p203050  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (GroupOf $x1 view) (Possession $x1 republican_party) (Theme $e0 $x1)) (MnAgent_ThemeOfGroupOfView-PossessionRepublicanParty $e0 $x0 $x1))

;; p203053  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Member $x0 company)) (MnAgentOfCompany_LocationKazakhstan_Build $e0 $x0))

;; p203054  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_LocationKazakhstan_Past $e0 $x0))

;; p203055  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company) (Patient $e0 $x1)) (MnAgentOfCompany_LocationKazakhstan_Patient $e0 $x0 $x1))

;; p203056  support 4 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfLocation-Ongoing $e0 $e1 $x0 $x1))

;; p203063  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_Build_Past $e0 $x0))

;; p203064  support 4 (occ 8)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company) (Patient $e0 $x1)) (MnAgentOfCompany_Build_Patient $e0 $x0 $x1))

;; p203065  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Member $e0 build) (Member $x1 hotel) (Patient $e0 $x1)) (MnAgent_Build_PatientOfHotel $e0 $x0 $x1))

;; p203066  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Start_ThemeEvOfOngoing $e0 $e1 $x0))

;; p203067  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p203068  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0)) (MnStart_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p203069  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Member $x1 hotel) (Patient $e0 $x1)) (MnAgentOfCompany_PatientOfHotel $e0 $x0 $x1))

;; p203070  support 4 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Past $e0) (Theme $e0 $x1)) (MnAgentOfThing_Past_Theme $e0 $x0 $x1))

;; p203071  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Possession $x1 free_soil_party) (Theme $e0 $x1)) (MnAgentOfThing_ThemeOfPossessionFreeSoilParty $e0 $x0 $x1))

;; p203072  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Possession $x1 republican_party) (Theme $e0 $x1)) (MnAgentOfThing_ThemeOfPossessionRepublicanParty $e0 $x0 $x1))

;; p203073  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Member $x1 hotel) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_PatientOfHotel $e0 $x0 $x1))

;; p203074  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Member free_soil_party party) (Possession $x1 free_soil_party) (Theme $e0 $x1)) (MnAgent_ThemeOfPossessionFreeSoilPartyOfParty $e0 $x0 $x1))

;; p203075  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Member republican_party party) (Possession $x1 republican_party) (Theme $e0 $x1)) (MnAgent_ThemeOfPossessionRepublicanPartyOfParty $e0 $x0 $x1))

;; p203076  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Past $e0) (Possession $x1 free_soil_party) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfPossessionFreeSoilParty $e0 $x0 $x1))

;; p203077  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Agent $e0 $x0) (Past $e0) (Possession $x1 republican_party) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfPossessionRepublicanParty $e0 $x0 $x1))

;; p203078  support 4 (occ 6)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001773 tierC-000025
(Implication (And (Agent $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Patient $e1 $e0 $x0 $x1))

;; p203079  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0)) (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild $e0 $x0))

;; p203080  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0)) (MnHave_ThemeOfCardinalityNum-GroupOfChild $e0 $x0))

;; p203081  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
(Implication (And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0)) (MnHolderKristoffer_Have_ThemeOfCardinalityNum $e0 $x0))

;; p203082  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001412 tierC-000181
(Implication (And (Cardinality $x0 <num>) (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_ThemeOfCardinalityNum $e0 $x0))

;; p203087  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0)) (MnForEv_Win_ThemeOfEmmy $e0 $e1 $x0))

;; p203088  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0)) (MnForEv_Past_ThemeOfEmmy $e0 $e1 $x0))

;; p203089  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
(Implication (And (GroupOf $x0 child) (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0)) (MnHolderKristoffer_Have_ThemeOfGroupOfChild $e0 $x0))

;; p203092  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (GroupOf $x0 view) (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0)) (MnThemeOfGroupOfView-PossessionFreeSoilPartyOfParty $e0 $x0))

;; p203093  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (GroupOf $x0 view) (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0)) (MnThemeOfGroupOfView-PossessionRepublicanPartyOfParty $e0 $x0))

;; p203094  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (GroupOf $x0 view) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0)) (MnPast_ThemeOfGroupOfView-PossessionFreeSoilParty $e0 $x0))

;; p203095  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (GroupOf $x0 view) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0)) (MnPast_ThemeOfGroupOfView-PossessionRepublicanParty $e0 $x0))

;; p203096  support 4 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
(Implication (And (Location $e0 $x0) (Member $e0 find) (Member $x1 thing) (Theme $e0 $x1)) (MnLocation_Find_ThemeOfThing $e0 $x0 $x1))

;; p203107  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Member $e0 build) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0)) (MnBuild_Past_PatientOfHotel $e0 $x0))

;; p203111  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1)) (MnStart_Patient_ThemeEvOfOngoing $e0 $e1 $x0))

;; p203113  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (Member $e0 win) (Member $x0 emmy) (Past $e0) (Theme $e0 $x0)) (MnWin_Past_ThemeOfEmmy $e0 $x0))

;; p203116  support 4 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000047 tierC-000048 tierC-000235
(Implication (And (Member $x0 person) (Past $e0) (Possession $x1 $x0) (Theme $e0 $x1)) (MnPast_ThemeOfPossessionOfPerson $e0 $x0 $x1))

;; p203119  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Member free_soil_party party) (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0)) (MnPast_ThemeOfPossessionFreeSoilPartyOfParty $e0 $x0))

;; p203120  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
(Implication (And (Member republican_party party) (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0)) (MnPast_ThemeOfPossessionRepublicanPartyOfParty $e0 $x0))

;; p203712  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000587 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0)) (MnAgentOfGroupOfChild_Ongoing $e0 $x0))

;; p203718  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(Implication (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0)) (MnAgentOfCat_Past $e0 $x0))

;; p203719  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1)) (MnAgentOfMan_Patient $e0 $x0 $x1))

;; p203721  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1)) (MnAgent_ThemeOfNew $e0 $x0 $x1))

;; p203724  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
(Implication (And (But $e0 $e1) (Past $e0) (Past $e1)) (MnButEvOfPast_Past $e0 $e1))

;; p203729  support 4 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierB-000748 tierB-001594 tierC-000241
(Implication (And (Experiencer $e0 $x0) (Member $x0 bad) (Result $e1 $e0)) (MnResultEvOfExperiencerOfBad $e1 $e0 $x0))

;; p203733  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000393 tierB-000412 tierC-000353
(Implication (And (GroupOf $x0 person) (Member $e0 kill) (Patient $e0 $x0)) (MnKill_PatientOfGroupOfPerson $e0 $x0))

;; p203737  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(Implication (And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfLocatedIn $e0 $x0 $x1))

;; p203739  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(Implication (And (Location $e0 $x0) (Member $x0 table) (Past $e0)) (MnLocationOfTable_Past $e0 $x0))

;; p203744  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
(Implication (And (Member $e0 bad) (Patient $e1 $x0) (Result $e1 $e0)) (MnPatient_ResultEvOfBad $e1 $e0 $x0))

;; p203750  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-001487 tierB-001523
(Implication (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0)) (MnOpen_PatientOfDoor $e0 $x0))

;; p203753  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
(Implication (And (Member $x0 bad) (Patient $e0 $x0) (Result $e0 $e1)) (MnPatientOfBad_ResultEv $e0 $e1 $x0))

;; p203755  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000121
(Implication (And (Member $x0 family) (Member $x1 person) (Possession $x0 $x1)) (MnFamily_PossessionOfPerson $x0 $x1))

;; p203757  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(Implication (And (Member $x0 new) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfNew $e0 $x0))

;; p203758  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000099 tierC-000100 tierC-000123
(Implication (And (Member $x0 person) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfPerson $e0 $x0))

;; p203760  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-001384 tierB-001894
(Implication (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfSound $e0 $x0))

;; p203765  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(Implication (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfOf $e0 $x0 $x1))

;; p203766  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(Implication (And (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnPast_ThemeEvOfPast $e0 $e1))

;; p203767  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(Implication (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1)) (MnPast_PatientOfSubsetOf $e0 $x0 $x1))

;; p203770  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierC-000123
(Implication (And (Past $e0) (Theme $e1 $x0) (To $e0 $e1)) (MnPast_ToEvOfTheme $e0 $e1 $x0))

;; p204124  support 4 (occ 4)  size 2  root regional_unit (constant)  depth 1
;;   e.g. tierC-000031 tierC-000032 tierC-000081
(Implication (And (Inheritance regional_unit regional) (Inheritance regional_unit unit)) (MnInheritanceRegional_InheritanceUnit regional_unit))

;; p204216  support 4 (occ 6)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Location-Ongoing $e1 $e0 $x0 $x1))

;; p204217  support 4 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-001649 tierC-000353
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0) (Patient $e0 $x2)) (MnAgent_Location_Past_Patient $e0 $x0 $x1 $x2))

;; p204218  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Past $e0)) (MnAgent_LocationKazakhstan_Build_Past $e0 $x0))

;; p204219  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_LocationKazakhstan_Build_Patient $e0 $x0 $x1))

;; p204220  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x1)) (MnAgent_LocationKazakhstan_Past_Patient $e0 $x0 $x1))

;; p204221  support 4 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
(Implication (And (Agent $e0 $x0) (Member $e0 kill) (Past $e0) (Patient $e0 $x1)) (MnAgent_Kill_Past_Patient $e0 $x0 $x1))

;; p204222  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnAgent_Start_Past_ThemeEv $e0 $e1 $x0))

;; p204223  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e0 win) (Past $e0) (Theme $e0 $x0)) (MnForEv_Win_Past_Theme $e0 $e1 $x0))

;; p204224  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
(Implication (And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnLocationKazakhstan_Build_Past_Patient $e0 $x0))

;; p204282  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(Implication (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1)) (MnAgent_Contain_Theme $e0 $x0 $x1))

;; p204283  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(Implication (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0)) (MnAgent_Jump_Past $e0 $x0))

;; p204286  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001156 tierB-001901 tierC-000127
(Implication (And (Agent $e0 $x0) (Member $e0 sing) (Past $e0)) (MnAgent_Sing_Past $e0 $x0))

;; p204289  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(Implication (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0)) (MnAgent_Swim_Ongoing $e0 $x0))

;; p204290  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierB-000978 tierC-000071
(Implication (And (Agent $e0 $x0) (Member $e0 take) (Theme $e0 $x1)) (MnAgent_Take_Theme $e0 $x0 $x1))

;; p204292  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(Implication (And (Already $e0) (Past $e0) (Patient $e0 $x0)) (MnAlready_Past_Patient $e0 $x0))

;; p204295  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
(Implication (And (Experiencer $e0 $x0) (Member $e0 bad) (Result $e1 $e0)) (MnResultEvOfExperiencer-Bad $e1 $e0 $x0))

;; p204296  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001334 tierB-001753 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0)) (MnExperiencer_Sleep_Ongoing $e0 $x0))

;; p204298  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0)) (MnExperiencer_Ongoing_Past $e0 $x0))

;; p204301  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(Implication (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0)) (MnGoal_Walk_Past $e0 $x0))

;; p204302  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(Implication (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnGoal_Past_Patient $e0 $x0 $x1))

;; p204306  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000706 tierC-000243
(Implication (And (Location $e0 $x0) (Member $e0 find) (Past $e0)) (MnLocation_Find_Past $e0 $x0))

;; p204311  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001568 tierC-000199 tierC-000200
(Implication (And (Member $e0 bear) (Past $e0) (Patient $e0 $x0)) (MnBear_Past_Patient $e0 $x0))

;; p204312  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000297
(Implication (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0)) (MnDirect_Past_Patient $e0 $x0))

;; p204313  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
(Implication (And (Member $e0 discover) (Past $e0) (Theme $e0 $x0)) (MnDiscover_Past_Theme $e0 $x0))

;; p204314  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0)) (MnGet_Ongoing_Patient $e0 $x0))

;; p204315  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1)) (MnGet_Ongoing_ResultEv $e0 $e1))

;; p204316  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(Implication (And (Member $e0 make) (Past $e0) (Result $e0 $e1)) (MnMake_Past_ResultEv $e0 $e1))

;; p204317  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-001487 tierC-000285
(Implication (And (Member $e0 open) (Past $e0) (Patient $e0 $x0)) (MnOpen_Past_Patient $e0 $x0))

;; p204319  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000987
(Implication (And (Member $e0 take) (Past $e0) (Theme $e0 $x0)) (MnTake_Past_Theme $e0 $x0))

;; p204320  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0)) (MnTurn_Past_Patient $e0 $x0))

;; p204321  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(Implication (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0)) (MnOngoing_Past_Theme $e0 $x0))

;; p204322  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1)) (MnPast_Patient_ThemeEv $e0 $e1 $x0))

;; p204323  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000730 tierC-000123
(Implication (And (Past $e0) (Theme $e0 $x0) (To $e0 $e1)) (MnPast_Theme_ToEv $e0 $e1 $x0))

;; p204457  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(Implication (And (Agent $e0 $x0) (For $e0 $x1)) (MnAgent_For $e0 $x0 $x1))

;; p204458  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy)) (MnAgentOfGroupOfBoy $e0 $x0))

;; p204459  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(Implication (And (Agent $e0 $x0) (GroupOf $x0 student)) (MnAgentOfGroupOfStudent $e0 $x0))

;; p204461  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierC-000227
(Implication (And (Agent $e0 $x0) (Member $e0 add)) (MnAgent_Add $e0 $x0))

;; p204463  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-001551
(Implication (And (Agent $e0 $x0) (Member $e0 eat)) (MnAgent_Eat $e0 $x0))

;; p204464  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
(Implication (And (Agent $e0 $x0) (Member $e0 fly)) (MnAgent_Fly $e0 $x0))

;; p204467  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
(Implication (And (Agent $e0 $x0) (Member $e0 lead)) (MnAgent_Lead $e0 $x0))

;; p204468  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
(Implication (And (Agent $e0 $x0) (Member $e0 provide)) (MnAgent_Provide $e0 $x0))

;; p204469  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000784 tierB-000975 tierC-000197
(Implication (And (Agent $e0 $x0) (Member $e0 sell)) (MnAgent_Sell $e0 $x0))

;; p204472  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $e0 try)) (MnAgent_Try $e0 $x0))

;; p204473  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001004 tierB-001962 tierC-000089
(Implication (And (Agent $e0 $x0) (Member $e0 write)) (MnAgent_Write $e0 $x0))

;; p204475  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000520 tierB-001302 tierC-000017
(Implication (And (Agent $e0 $x0) (Member $x0 family)) (MnAgentOfFamily $e0 $x0))

;; p204476  support 4 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001004 tierB-001743 tierC-000123
(Implication (And (Agent $e0 $x0) (Member $x0 father)) (MnAgentOfFather $e0 $x0))

;; p204477  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001800 tierB-001885 tierC-000217
(Implication (And (Agent $e0 $x0) (Member $x0 government)) (MnAgentOfGovernment $e0 $x0))

;; p204478  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(Implication (And (Agent $e0 $x0) (Over $e0 $x1)) (MnAgent_Over $e0 $x0 $x1))

;; p204482  support 4 (occ 5)  size 2  root appear (constant)  depth 1
;;   e.g. tierC-000050 tierC-000128 tierC-000259
(Implication (And (Also appear $e0) (Past $e0)) (MnAlsoEvOfPast appear $e0))

;; p204485  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000556 tierB-001266 tierC-000353
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 person)) (MnCardinalityNum_GroupOfPerson $x0))

;; p204486  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(Implication (And (Cardinality $x0 <num>) (LocatedIn $x0 $x1)) (MnCardinalityNum_LocatedIn $x0 $x1))

;; p204487  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e0)) (MnDuringEv_Past $e0 $e1))

;; p204488  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e1)) (MnDuringEvOfPast $e0 $e1))

;; p204489  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(Implication (And (During $e0 $x0) (Past $e0)) (MnDuring_Past $e0 $x0))

;; p204490  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(Implication (And (Experiencer $e0 $x0) (Like $e0 $x1)) (MnExperiencer_Like $e0 $x0 $x1))

;; p204492  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000174 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Member $e0 need)) (MnExperiencer_Need $e0 $x0))

;; p204494  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(Implication (And (Experiencer $e0 $x0) (Possession $x0 $x1)) (MnExperiencerOfPossession $e0 $x0 $x1))

;; p204495  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-001515 tierB-001977 tierC-000001
(Implication (And (Experiencer $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfExperiencer $e1 $e0 $x0))

;; p204496  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Time $e0 now)) (MnExperiencer_TimeNow $e0 $x0))

;; p204505  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000615 tierB-000760 tierB-001208
(Implication (And (LocatedIn $x0 $x1) (Member $x1 garden)) (MnLocatedInOfGarden $x0 $x1))

;; p204506  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(Implication (And (LocatedIn $x0 $x1) (PartOf $x1 $x2)) (MnLocatedInOfPartOf $x0 $x1 $x2))

;; p204507  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001091 tierC-000135 tierC-000136
(Implication (And (Location $e0 $x0) (Location $e0 $x1)) (MnLocation_Location $e0 $x0 $x1))

;; p204508  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001753 tierC-000041
(Implication (And (Location $e0 $x0) (Member $e0 sleep)) (MnLocation_Sleep $e0 $x0))

;; p204509  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnLocation_Walk $e0 $x0))

;; p204511  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000111 tierC-000112 tierC-000121
(Implication (And (Location $e0 japan) (Past $e0)) (MnLocationJapan_Past $e0))

;; p204515  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000353
(Implication (And (Manner $e0 directly) (Past $e0)) (MnMannerDirectly_Past $e0))

;; p204516  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierC-000231
(Implication (And (Member $e0 add) (Theme $e0 $x0)) (MnAdd_Theme $e0 $x0))

;; p204517  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000050 tierC-000128 tierC-000259
(Implication (And (Member $e0 appear) (Past $e0)) (MnAppear_Past $e0))

;; p204520  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-000849
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_Theme $e0 $x0))

;; p204521  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0)) (MnCause_Past $e0))

;; p204522  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001217 tierB-001803
(Implication (And (Member $e0 change) (Past $e0)) (MnChange_Past $e0))

;; p204523  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000177 tierC-000284 tierC-000341
(Implication (And (Member $e0 conduct) (Past $e0)) (MnConduct_Past $e0))

;; p204524  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(Implication (And (Member $e0 decide) (Past $e0)) (MnDecide_Past $e0))

;; p204525  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierB-001967 tierC-000199
(Implication (And (Member $e0 die) (Patient $e0 $x0)) (MnDie_Patient $e0 $x0))

;; p204529  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001520 tierB-001721 tierB-001735
(Implication (And (Member $e0 do) (Patient $e0 $x0)) (MnDo_Patient $e0 $x0))

;; p204532  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
(Implication (And (Member $e0 pass) (Past $e0)) (MnPass_Past $e0))

;; p204533  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000648 tierB-000816
(Implication (And (Member $e0 play) (Theme $e0 $x0)) (MnPlay_Theme $e0 $x0))

;; p204534  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000099 tierC-000100 tierC-000359
(Implication (And (Member $e0 replace) (Past $e0)) (MnReplace_Past $e0))

;; p204535  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000607 tierB-001436 tierB-001566
(Implication (And (Member $e0 require) (Theme $e0 $x0)) (MnRequire_Theme $e0 $x0))

;; p204536  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
(Implication (And (Member $e0 say) (Past $e0)) (MnSay_Past $e0))

;; p204537  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierC-000023 tierC-000024
(Implication (And (Member $e0 speak) (Past $e0)) (MnSpeak_Past $e0))

;; p204538  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-001515
(Implication (And (Member $e0 stop) (Past $e0)) (MnStop_Past $e0))

;; p204539  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000292 tierC-000253
(Implication (And (Member $e0 study) (Past $e0)) (MnStudy_Past $e0))

;; p204541  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0)) (MnTry_Ongoing $e0))

;; p204542  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Result $e0 $e1)) (MnTurn_ResultEv $e0 $e1))

;; p204543  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(Implication (And (Member $e0 use) (To $e0 $e1)) (MnUse_ToEv $e0 $e1))

;; p204544  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Member $e0 walk) (Ongoing $e0)) (MnWalk_Ongoing $e0))

;; p204545  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000846 tierB-001988 tierC-000311
(Implication (And (Member $e0 want) (Past $e0)) (MnWant_Past $e0))

;; p204549  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000176 tierB-000277 tierB-001476
(Implication (And (Member $x0 tree) (Patient $e0 $x0)) (MnPatientOfTree $e0 $x0))

;; p204551  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000517 tierB-001891 tierB-001910
(Implication (And (Ongoing $e0) (Probably $e0)) (MnOngoing_Probably $e0))

;; p204552  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(Implication (And (Ongoing $e0) (Source $e0 $x0)) (MnOngoing_Source $e0 $x0))

;; p204553  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(Implication (And (Ongoing $e0) (Theme $e0 $e1)) (MnOngoing_ThemeEv $e0 $e1))

;; p204554  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Over $e0 $x0) (Past $e0)) (MnOver_Past $e0 $x0))

;; p204556  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(Implication (And (Past $e0) (TimeAtLeast $e0 (Year <num>))) (MnPast_TimeAtLeast(YearNum $e0))

;; p204558  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001064 tierB-001624 tierC-000241
(Implication (And (Patient $e0 $x0) (Time $e0 now)) (MnPatient_TimeNow $e0 $x0))

;; p204561  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(Implication (And (Theme $e0 $e1) (Theme $e1 $x0)) (MnThemeEvOfTheme $e0 $e1 $x0))

;; p204824  support 3 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1) (Theme $e0 $x2)) (MnAgent_ThemeOfGroupOfView_Theme $e0 $x0 $x1 $x2))

;; p204827  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Location $e1 $e0 $x0 $x1))

;; p204829  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company)) (MnAgentOfCompany_LocationEskisehir_Build $e0 $x0))

;; p204830  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_LocationEskisehir_Past $e0 $x0))

;; p204831  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1)) (MnAgentOfCompany_LocationEskisehir_Patient $e0 $x0 $x1))

;; p204832  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1)) (MnAgent_LocationEskisehir_PatientOfHotel $e0 $x0 $x1))

;; p204833  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfLocation $e0 $e1 $x0 $x1))

;; p204834  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Patient $e1 $x2) (Theme $e0 $e1)) (MnAgent_ThemeEvOfLocation-Patient $e0 $e1 $x0 $x1 $x2))

;; p204836  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
(Implication (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Past $e0)) (MnAgentOfPerson_Write_Past $e0 $x0))

;; p204837  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
(Implication (And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person) (Patient $e0 $x1)) (MnAgentOfPerson_Write_Patient $e0 $x0 $x1))

;; p204838  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1) (Theme $e0 $x2)) (MnAgentOfThing_Theme_Theme $e0 $x0 $x1 $x2))

;; p204839  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfNew $e0 $x0 $x1))

;; p204840  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfOngoing-Patient $e0 $e1 $x0 $x1))

;; p204843  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e1 $x1) (To $e0 $e1)) (MnAgent_Past_ToEvOfTheme $e0 $e1 $x0 $x1))

;; p204845  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e0 $x1) (To $e1 $e0)) (MnPast_ToEvOfAgent-Theme $e1 $e0 $x0 $x1))

;; p204846  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1) (Theme $e0 $x2)) (MnAgent_ThemeOfPossessionFreeSoilParty_Theme $e0 $x0 $x1 $x2))

;; p204847  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1) (Theme $e0 $x2)) (MnAgent_ThemeOfPossessionRepublicanParty_Theme $e0 $x0 $x1 $x2))

;; p204848  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e0 $x0)) (MnBeforeEvOfPast_Past_Patient $e0 $e1 $x0))

;; p204849  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p204850  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000838 tierC-000353 tierC-000354
(Implication (And (Cardinality $x0 <num>) (Location $e0 $x1) (Past $e0) (Patient $e0 $x0)) (MnLocation_Past_PatientOfCardinalityNum $e0 $x0 $x1))

;; p204852  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
(Implication (And (Experiencer $e0 $x0) (Member $e0 bad) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer-Bad $e1 $e0 $x0))

;; p204854  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0)) (MnGet_Ongoing_ResultEvOfExperiencer $e1 $e0 $x0))

;; p204859  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierB-001594 tierC-000241 tierC-000242
(Implication (And (Experiencer $e0 $x0) (Member $x0 bad) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencerOfBad $e1 $e0 $x0))

;; p204861  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0)) (MnForEvOfPortray_Win_Past $e0 $e1))

;; p204862  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0)) (MnForEvOfPortray_Win_Theme $e0 $e1 $x0))

;; p204863  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0)) (MnForEvOfPortray_ThemeOfEmmy $e0 $e1 $x0))

;; p204864  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
(Implication (And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0)) (MnForEvOfPortray_Past_Theme $e0 $e1 $x0))

;; p204865  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000412 tierC-000353 tierC-000354
(Implication (And (GroupOf $x0 person) (Member $e0 kill) (Past $e0) (Patient $e0 $x0)) (MnKill_Past_PatientOfGroupOfPerson $e0 $x0))

;; p204875  support 3 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1)) (MnPast_ThemeOfGroupOfView_Theme $e0 $x0 $x1))

;; p204876  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (GroupOf $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfGroupOfView-PossessionFreeSoilParty_Theme $e0 $x0 $x1))

;; p204877  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (GroupOf $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfGroupOfView-PossessionRepublicanParty_Theme $e0 $x0 $x1))

;; p204878  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (GroupOf $x0 view) (Possession $x1 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfGroupOfView_ThemeOfPossessionFreeSoilParty $e0 $x0 $x1))

;; p204879  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (GroupOf $x0 view) (Possession $x1 republican_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfGroupOfView_ThemeOfPossessionRepublicanParty $e0 $x0 $x1))

;; p204882  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfLocation-Ongoing $e1 $e0 $x0))

;; p204883  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Location $e0 $x0) (Past $e1) (Patient $e0 $x1) (Theme $e1 $e0)) (MnPast_ThemeEvOfLocation-Patient $e1 $e0 $x0 $x1))

;; p204889  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0)) (MnLocationEskisehir_Build_PatientOfHotel $e0 $x0))

;; p204890  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0)) (MnLocationEskisehir_Past_PatientOfHotel $e0 $x0))

;; p204893  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
(Implication (And (Member $e0 bad) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0)) (MnPast_Patient_ResultEvOfBad $e1 $e0 $x0))

;; p204894  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000358
(Implication (And (Member $e0 bear) (Member $x0 person) (Past $e0) (Patient $e0 $x0)) (MnBear_Past_PatientOfPerson $e0 $x0))

;; p204895  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
(Implication (And (Member $e0 begin) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1)) (MnBegin_ThemeEvOfOngoing-Patient $e0 $e1 $x0))

;; p204896  support 3 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
(Implication (And (Member $e0 begin) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfPatient $e0 $e1 $x0))

;; p204901  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfPatient $e0 $e1 $x0))

;; p204902  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(Implication (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnStop_Past_ThemeEvOfPast $e0 $e1))

;; p204903  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
(Implication (And (Member $x0 bad) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_PatientOfBad_ResultEv $e0 $e1 $x0))

;; p204905  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfPossessionFreeSoilPartyOfParty_Theme $e0 $x0 $x1))

;; p204906  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfPossessionRepublicanPartyOfParty_Theme $e0 $x0 $x1))

;; p204909  support 3 (occ 3)  size 4  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPast_Patient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p204911  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnPast_ThemeOfPossessionFreeSoilParty_Theme $e0 $x0 $x1))

;; p204912  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnPast_ThemeOfPossessionRepublicanParty_Theme $e0 $x0 $x1))

;; p204913  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Possession $x0 free_soil_party) (Possession $x1 republican_party) (Theme $e0 $x0) (Theme $e0 $x1)) (MnThemeOfPossessionFreeSoilParty_ThemeOfPossessionRepublicanParty $e0 $x0 $x1))

;; p205979  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001302 tierC-000122
(Implication (And (Agent $e0 $x0) (Before $e0 $e1) (Past $e1)) (MnAgent_BeforeEvOfPast $e0 $e1 $x0))

;; p205980  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000738 tierB-000772 tierB-001534
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0)) (MnAgentOfCardinalityNum_Past $e0 $x0))

;; p205981  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p205985  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1)) (MnAgent_ResultEvOfExperiencer $e0 $e1 $x0 $x1))

;; p205986  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001457 tierB-001530 tierB-001840
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0)) (MnAgentOfGroupOfBoy_Ongoing $e0 $x0))

;; p205987  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1)) (MnAgentOfGroupOfChild_Location $e0 $x0 $x1))

;; p205988  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000648 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play)) (MnAgentOfGroupOfChild_Play $e0 $x0))

;; p205989  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierC-000041 tierC-000042
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 person)) (MnAgentOfPerson_Location $e0 $x0 $x1))

;; p205992  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0)) (MnTry_ThemeEvOfAgent $e1 $e0 $x0))

;; p205993  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001302 tierC-000017 tierC-000018
(Implication (And (Agent $e0 $x0) (Member $x0 family) (Past $e0)) (MnAgentOfFamily_Past $e0 $x0))

;; p205994  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001743 tierC-000123 tierC-000124
(Implication (And (Agent $e0 $x0) (Member $x0 father) (Past $e0)) (MnAgentOfFather_Past $e0 $x0))

;; p205995  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001773 tierB-001801 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Past $e0)) (MnAgentOfMan_Past $e0 $x0))

;; p205996  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(Implication (And (Agent $e0 $x0) (Member $x0 plane) (Past $e0)) (MnAgentOfPlane_Past $e0 $x0))

;; p205997  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1)) (MnAgent_PatientOfDoor $e0 $x0 $x1))

;; p205998  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001040 tierC-000123 tierC-000124
(Implication (And (Agent $e0 $x0) (Member $x1 thing) (Theme $e0 $x1)) (MnAgent_ThemeOfThing $e0 $x0 $x1))

;; p205999  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001066 tierB-001243 tierB-001586
(Implication (And (Agent $e0 $x0) (PartOf $x1 $x2) (Theme $e0 $x1)) (MnAgent_ThemeOfPartOf $e0 $x0 $x1 $x2))

;; p206000  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(Implication (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0)) (MnPast_StimulusEvOfAgent $e1 $e0 $x0))

;; p206002  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001900 tierC-000117 tierC-000118
(Implication (And (Agent $e0 $x0) (Possession $x1 $x2) (Theme $e0 $x1)) (MnAgent_ThemeOfPossession $e0 $x0 $x1 $x2))

;; p206006  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
(Implication (And (Because $e0 $e1) (Past $e0) (Past $e1)) (MnBecauseEvOfPast_Past $e0 $e1))

;; p206007  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierC-000121 tierC-000122
(Implication (And (Before $e0 $e1) (Measure $e0 duration <num> year) (Past $e1)) (MnBeforeEvOfPast_MeasureDurationNumYear $e0 $e1))

;; p206011  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001782 tierB-001809 tierC-000231
(Implication (And (During $e0 $e1) (Past $e0) (Past $e1)) (MnDuringEvOfPast_Past $e0 $e1))

;; p206015  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0)) (MnLeave_ResultEvOfExperiencer $e1 $e0 $x0))

;; p206017  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0)) (MnTurn_ResultEvOfExperiencer $e1 $e0 $x0))

;; p206018  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000013 tierC-000014 tierC-000121
(Implication (And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0)) (MnExperiencerOfPerson_Past $e0 $x0))

;; p206021  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001515 tierB-001977 tierC-000001
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfExperiencer $e1 $e0 $x0))

;; p206032  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house)) (MnLocationOfHouse_Live $e0 $x0))

;; p206033  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001003 tierC-000041 tierC-000042
(Implication (And (Location $e0 $x0) (Member $e0 sleep) (Member $x0 couch)) (MnLocationOfCouch_Sleep $e0 $x0))

;; p206034  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierC-000243 tierC-000244
(Implication (And (Location $e0 $x0) (Member $x0 bench) (Past $e0)) (MnLocationOfBench_Past $e0 $x0))

;; p206044  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(Implication (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfFire $e0 $x0))

;; p206045  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001690 tierC-000095
(Implication (And (Member $x0 house) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfHouse $e0 $x0))

;; p206046  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(Implication (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfPicture $e0 $x0))

;; p206047  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001156 tierC-000011 tierC-000012
(Implication (And (Member $x0 song) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfSong $e0 $x0))

;; p206048  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001520 tierB-001622 tierB-001761
(Implication (And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0)) (MnObligated_PatientOfThing $e0 $x0))

;; p206049  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnOngoing_ThemeEvOfPatient $e0 $e1 $x0))

;; p206052  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(Implication (And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfRecipient $e0 $e1 $x0))

;; p206053  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(Implication (And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0)) (MnPast_ThemeEvOfTheme $e0 $e1 $x0))

;; p206419  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Implication (And (Inheritance living_room room) (Member $x0 living_room)) (MnLivingRoomOfInheritanceRoom $x0))

;; p206538  support 3 (occ 3)  size 2  root metropolitan_statistical_area (constant)  depth 1
;;   e.g. tierC-000249 tierC-000250 tierC-000275
(Implication (And (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan)) (MnInheritanceArea_InheritanceMetropolitan metropolitan_statistical_area))

;; p206645  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0)) (MnAgent_Goal_Come_Past $e0 $x0 $x1))

;; p206646  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Patient $e0 $x2)) (MnAgent_Location_Ongoing_Patient $e0 $x0 $x1 $x2))

;; p206647  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2) (Theme $e1 $e0)) (MnThemeEvOfAgent-Location-Patient $e1 $e0 $x0 $x1 $x2))

;; p206648  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0)) (MnAgent_LocationEskisehir_Build_Past $e0 $x0))

;; p206649  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_LocationEskisehir_Build_Patient $e0 $x0 $x1))

;; p206650  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1)) (MnAgent_LocationEskisehir_Past_Patient $e0 $x0 $x1))

;; p206651  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
(Implication (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1)) (MnAgent_MannerDirectly_Past_Patient $e0 $x0 $x1))

;; p206652  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(Implication (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1)) (MnAgent_Capture_Past_Theme $e0 $x0 $x1))

;; p206653  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
(Implication (And (Agent $e0 $x0) (Member $e0 spend) (Past $e0) (Theme $e0 $x1)) (MnAgent_Spend_Past_Theme $e0 $x0 $x1))

;; p206654  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
(Implication (And (Agent $e0 $x0) (Member $e0 write) (Past $e0) (Patient $e0 $x1)) (MnAgent_Write_Past_Patient $e0 $x0 $x1))

;; p206655  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001961
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Past_Theme $e0 $x0 $x1))

;; p206656  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing-Patient $e1 $e0 $x0 $x1))

;; p206657  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1) (Theme $e0 $x2)) (MnAgent_Past_Theme_Theme $e0 $x0 $x1 $x2))

;; p206658  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0)) (MnExperiencer_Location_Ongoing_Past $e0 $x0 $x1))

;; p206659  support 3 (occ 5)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfLocation-Ongoing-Patient $e1 $e0 $x0 $x1))

;; p206660  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnLocationEskisehir_Build_Past_Patient $e0 $x0))

;; p206661  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnGet_Ongoing_Patient_ResultEv $e0 $e1 $x0))

;; p206792  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(Implication (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1)) (MnAgent_Future_Theme $e0 $x0 $x1))

;; p206794  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2)) (MnAgent_Goal_Theme $e0 $x0 $x1 $x2))

;; p206795  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(Implication (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0)) (MnAgent_GoalHome_Past $e0 $x0))

;; p206803  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0)) (MnAgent_Cause_Past $e0 $x0))

;; p206804  support 3 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000728 tierC-000025 tierC-000026
(Implication (And (Agent $e0 $x0) (Member $e0 create) (Patient $e0 $x1)) (MnAgent_Create_Patient $e0 $x0 $x1))

;; p206805  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(Implication (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0)) (MnAgent_Draw_Past $e0 $x0))

;; p206806  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierC-000095 tierC-000096
(Implication (And (Agent $e0 $x0) (Member $e0 follow) (Past $e0)) (MnAgent_Follow_Past $e0 $x0))

;; p206807  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
(Implication (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1)) (MnAgent_Lead_Theme $e0 $x0 $x1))

;; p206808  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001182 tierB-001457 tierB-001754
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0)) (MnAgent_Make_Ongoing $e0 $x0))

;; p206809  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(Implication (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0)) (MnAgent_Play_Ongoing $e0 $x0))

;; p206812  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Past $e0)) (MnAgent_Try_Past $e0 $x0))

;; p206813  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1)) (MnAgent_Try_ThemeEv $e0 $e1 $x0))

;; p206814  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001243 tierC-000173 tierC-000174
(Implication (And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $x1)) (MnAgent_Use_Theme $e0 $x0 $x1))

;; p206815  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
(Implication (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1)) (MnAgent_Watch_Theme $e0 $x0 $x1))

;; p206816  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
(Implication (And (Agent $e0 $x0) (Member $e0 welcome) (Past $e0)) (MnAgent_Welcome_Past $e0 $x0))

;; p206819  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0)) (MnAgent_Over_Past $e0 $x0 $x1))

;; p206820  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1)) (MnAgent_Patient_ResultEv $e0 $e1 $x0 $x1))

;; p206824  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001134 tierB-001302 tierC-000002
(Implication (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0)) (MnBeforeEvOfPast-Patient $e0 $e1 $x0))

;; p206825  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-001667 tierC-000014
(Implication (And (Experiencer $e0 $x0) (In $e0 $x1) (Past $e0)) (MnExperiencer_In_Past $e0 $x0 $x1))

;; p206826  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-000455 tierB-001496
(Implication (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1)) (MnExperiencer_Need_ThemeEv $e0 $e1 $x0))

;; p206827  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(Implication (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0)) (MnGoal_MannerQuickly_Past $e0 $x0))

;; p206829  support 3 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000072 tierC-000213 tierC-000214
(Implication (And (Instrument $e0 $x0) (Member $e0 build) (Patient $e0 $x1)) (MnInstrument_Build_Patient $e0 $x0 $x1))

;; p206830  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0)) (MnLocation_Walk_Ongoing $e0 $x0))

;; p206831  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Past $e0)) (MnLocation_Walk_Past $e0 $x0))

;; p206837  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierC-000231 tierC-000232
(Implication (And (Member $e0 add) (Past $e0) (Theme $e0 $x0)) (MnAdd_Past_Theme $e0 $x0))

;; p206838  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; p206839  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0)) (MnCause_Past_Patient $e0 $x0))

;; p206840  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001803 tierC-000011
(Implication (And (Member $e0 change) (Past $e0) (Patient $e0 $x0)) (MnChange_Past_Patient $e0 $x0))

;; p206841  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
(Implication (And (Member $e0 compose) (Past $e0) (Patient $e0 $x0)) (MnCompose_Past_Patient $e0 $x0))

;; p206842  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(Implication (And (Member $e0 create) (Past $e0) (Patient $e0 $x0)) (MnCreate_Past_Patient $e0 $x0))

;; p206843  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
(Implication (And (Member $e0 design) (Past $e0) (Patient $e0 $x0)) (MnDesign_Past_Patient $e0 $x0))

;; p206844  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierC-000199 tierC-000200
(Implication (And (Member $e0 die) (Past $e0) (Patient $e0 $x0)) (MnDie_Past_Patient $e0 $x0))

;; p206845  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(Implication (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0)) (MnEat_Past_Patient $e0 $x0))

;; p206846  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(Implication (And (Member $e0 fall) (Past $e0) (Source $e0 $x0)) (MnFall_Past_Source $e0 $x0))

;; p206847  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(Implication (And (Member $e0 find) (Past $e0) (Theme $e0 $x0)) (MnFind_Past_Theme $e0 $x0))

;; p206849  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(Implication (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0)) (MnIncrease_Past_Patient $e0 $x0))

;; p206850  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1)) (MnLeave_Patient_ResultEv $e0 $e1 $x0))

;; p206851  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000951 tierB-001182 tierB-001457
(Implication (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0)) (MnMake_Ongoing_Patient $e0 $x0))

;; p206852  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(Implication (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1)) (MnMake_Ongoing_ResultEv $e0 $e1))

;; p206854  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(Implication (And (Member $e0 stand) (Ongoing $e0) (Past $e0)) (MnStand_Ongoing_Past $e0))

;; p206855  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(Implication (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0)) (MnStick_Past_Patient $e0 $x0))

;; p206857  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0) (Past $e0)) (MnTry_Ongoing_Past $e0))

;; p206858  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-001675
(Implication (And (Member $e0 turn) (Past $e0) (Result $e0 $e1)) (MnTurn_Past_ResultEv $e0 $e1))

;; p206859  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1)) (MnTurn_Patient_ResultEv $e0 $e1 $x0))

;; p206860  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(Implication (And (Member $e0 walk) (Ongoing $e0) (Past $e0)) (MnWalk_Ongoing_Past $e0))

;; p206861  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(Implication (And (Ongoing $e0) (Past $e0) (Patient $e0 $x0)) (MnOngoing_Past_Patient $e0 $x0))

;; p206862  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(Implication (And (Ongoing $e0) (Past $e0) (Result $e0 $e1)) (MnOngoing_Past_ResultEv $e0 $e1))

;; p206864  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001894 tierC-000283 tierC-000284
(Implication (And (Past $e0) (Patient $e0 $x0) (Time $e0 night)) (MnPast_Patient_TimeNight $e0 $x0))

;; p207152  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(Implication (And (Agent $e0 $e1) (Theme $e1 $x0)) (MnAgentEvOfTheme $e0 $e1 $x0))

;; p207153  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierC-000121 tierC-000122
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1)) (MnAgent_CoAgent $e0 $x0 $x1))

;; p207155  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000225 tierB-001251 tierB-001984
(Implication (And (Agent $e0 $x0) (GroupOf $x0 scientist)) (MnAgentOfGroupOfScientist $e0 $x0))

;; p207156  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(Implication (And (Agent $e0 $x0) (GroupOf $x0 soldier)) (MnAgentOfGroupOfSoldier $e0 $x0))

;; p207157  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000556 tierB-001250 tierC-000072
(Implication (And (Agent $e0 $x0) (Instrument $e0 $x1)) (MnAgent_Instrument $e0 $x0 $x1))

;; p207160  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-001440 tierB-001992
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_Arrive $e0 $x0))

;; p207162  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000950 tierB-001205 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $e0 close)) (MnAgent_Close $e0 $x0))

;; p207165  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001183 tierB-001496 tierB-001628
(Implication (And (Agent $e0 $x0) (Member $e0 go)) (MnAgent_Go $e0 $x0))

;; p207166  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierC-000197 tierC-000198
(Implication (And (Agent $e0 $x0) (Member $e0 move)) (MnAgent_Move $e0 $x0))

;; p207167  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-001153 tierB-001563
(Implication (And (Agent $e0 $x0) (Member $e0 run)) (MnAgent_Run $e0 $x0))

;; p207168  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000864 tierC-000053 tierC-000054
(Implication (And (Agent $e0 $x0) (Member $e0 serve)) (MnAgent_Serve $e0 $x0))

;; p207169  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierC-000041 tierC-000042
(Implication (And (Agent $e0 $x0) (Member $e0 sleep)) (MnAgent_Sleep $e0 $x0))

;; p207171  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000550 tierB-001219 tierB-001666
(Implication (And (Agent $e0 $x0) (Member $e0 talk)) (MnAgent_Talk $e0 $x0))

;; p207172  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000324 tierB-001219
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnAgent_Walk $e0 $x0))

;; p207174  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierB-001345 tierC-000277
(Implication (And (Agent $e0 $x0) (Member $e0 win)) (MnAgent_Win $e0 $x0))

;; p207175  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001813 tierB-001873
(Implication (And (Agent $e0 $x0) (Member $e0 work)) (MnAgent_Work $e0 $x0))

;; p207176  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001430 tierB-001528 tierB-001739
(Implication (And (Agent $e0 $x0) (Member $x0 bus)) (MnAgentOfBus $e0 $x0))

;; p207177  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000049 tierB-000339 tierB-000793
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnAgentOfDoctor $e0 $x0))

;; p207178  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001086 tierB-001551 tierB-001892
(Implication (And (Agent $e0 $x0) (Member $x0 dog)) (MnAgentOfDog $e0 $x0))

;; p207180  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(Implication (And (Agent $e0 $x0) (Obligated $e0)) (MnAgent_Obligated $e0 $x0))

;; p207182  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(Implication (And (Agent $e0 $x0) (SubsetOf $x0 $x1)) (MnAgentOfSubsetOf $e0 $x0 $x1))

;; p207183  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(Implication (And (Agent $e0 baya) (Past $e0)) (MnAgentBaya_Past $e0))

;; p207184  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(Implication (And (Agent $e0 daniel) (Past $e0)) (MnAgentDaniel_Past $e0))

;; p207185  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Ongoing $e0)) (MnAgentDavid_Ongoing $e0))

;; p207186  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Past $e0)) (MnAgentDavid_Past $e0))

;; p207187  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(Implication (And (Agent $e0 felix) (Past $e0)) (MnAgentFelix_Past $e0))

;; p207188  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierC-000041 tierC-000042
(Implication (And (Agent $e0 jessica) (Theme $e0 $e1)) (MnAgentJessica_ThemeEv $e0 $e1))

;; p207189  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000217 tierC-000218 tierC-000245
(Implication (And (Agent $e0 jica) (Member $e0 fund)) (MnAgentJica_Fund $e0))

;; p207190  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(Implication (And (Agent $e0 mark) (Past $e0)) (MnAgentMark_Past $e0))

;; p207191  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(Implication (And (Agent $e0 matthew) (Past $e0)) (MnAgentMatthew_Past $e0))

;; p207192  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(Implication (And (Agent $e0 michael) (Past $e0)) (MnAgentMichael_Past $e0))

;; p207193  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(Implication (And (Agent $e0 pietro) (Past $e0)) (MnAgentPietro_Past $e0))

;; p207194  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(Implication (And (Agent $e0 ziri) (Ongoing $e0)) (MnAgentZiri_Ongoing $e0))

;; p207195  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(Implication (And (At $e0 $x0) (Past $e0)) (MnAt_Past $e0 $x0))

;; p207201  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001696 tierB-001867 tierC-000179
(Implication (And (Beneficiary $e0 $x0) (Patient $e0 $x1)) (MnBeneficiary_Patient $e0 $x0 $x1))

;; p207202  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-001094
(Implication (And (Can $e0) (Member $e0 help)) (MnCan_Help $e0))

;; p207203  support 3 (occ 3)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000299 tierB-001094 tierB-001767
(Implication (And (Can $e0) (Past $e0)) (MnCan_Past $e0))

;; p207204  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 girl)) (MnCardinalityNum_GroupOfGirl $x0))

;; p207205  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001985 tierC-000261 tierC-000262
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 way)) (MnCardinalityNum_GroupOfWay $x0))

;; p207206  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001332 tierC-000121 tierC-000122
(Implication (And (CoAgent $e0 $x0) (Past $e0)) (MnCoAgent_Past $e0 $x0))

;; p207207  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(Implication (And (Experiencer $e0 $x0) (Future $e0)) (MnExperiencer_Future $e0 $x0))

;; p207208  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001496 tierB-001685 tierB-001945
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 child)) (MnExperiencerOfGroupOfChild $e0 $x0))

;; p207210  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierC-000097 tierC-000098
(Implication (And (Experiencer $e0 $x0) (Location $e0 europe)) (MnExperiencer_LocationEurope $e0 $x0))

;; p207211  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(Implication (And (Experiencer $e0 $x0) (Member $e0 beautiful)) (MnExperiencer_Beautiful $e0 $x0))

;; p207212  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(Implication (And (Experiencer $e0 $x0) (Member $e0 look)) (MnExperiencer_Look $e0 $x0))

;; p207213  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000419 tierB-001515
(Implication (And (Experiencer $e0 $x0) (Member $e0 work)) (MnExperiencer_Work $e0 $x0))

;; p207214  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000227 tierC-000125 tierC-000126
(Implication (And (Experiencer $e0 $x0) (Member $x0 bridge)) (MnExperiencerOfBridge $e0 $x0))

;; p207215  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000250 tierB-001003 tierB-001334
(Implication (And (Experiencer $e0 $x0) (Member $x0 cat)) (MnExperiencerOfCat $e0 $x0))

;; p207216  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Member $x0 door)) (MnExperiencerOfDoor $e0 $x0))

;; p207217  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000495 tierB-000565 tierB-000748
(Implication (And (Experiencer $e0 $x0) (Member $x0 weather)) (MnExperiencerOfWeather $e0 $x0))

;; p207219  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(Implication (And (For $e0 $x0) (Ongoing $e0)) (MnFor_Ongoing $e0 $x0))

;; p207220  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(Implication (And (Future $e0) (Time $e0 tomorrow)) (MnFuture_TimeTomorrow $e0))

;; p207223  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(Implication (And (Goal $e0 bed) (Member $e0 go)) (MnGoalBed_Go $e0))

;; p207225  support 3 (occ 3)  size 2  root (LocatedIn (constant)  depth 2
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(Implication (And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1))) (MnPastOfGroupOfPerson (LocatedIn $x0 $x1))

;; p207226  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001721 tierB-001816 tierB-001893
(Implication (And (GroupOf $x0 thing) (Patient $e0 $x0)) (MnPatientOfGroupOfThing $e0 $x0))

;; p207227  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000205 tierC-000261 tierC-000262
(Implication (And (In $e0 $x0) (Theme $e0 $x1)) (MnIn_Theme $e0 $x0 $x1))

;; p207229  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(Implication (And (Like $e0 $x0) (Member $e0 look)) (MnLike_Look $e0 $x0))

;; p207230  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000756 tierC-000343 tierC-000344
(Implication (And (LocatedIn $x0 $x1) (Member $x0 thing)) (MnLocatedIn_Thing $x0 $x1))

;; p207231  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000153 tierB-000546 tierB-000680
(Implication (And (LocatedIn $x0 $x1) (Member $x1 city)) (MnLocatedInOfCity $x0 $x1))

;; p207232  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(Implication (And (LocatedIn $x0 $x1) (Member $x1 full)) (MnLocatedInOfFull $x0 $x1))

;; p207233  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000619 tierB-001410 tierB-001492
(Implication (And (LocatedIn $x0 $x1) (Member $x1 table)) (MnLocatedInOfTable $x0 $x1))

;; p207234  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(Implication (And (LocatedIn $x0 $x1) (Theme $e0 $x0)) (MnThemeOfLocatedIn $e0 $x0 $x1))

;; p207238  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001706 tierC-000133 tierC-000134
(Implication (And (Location $e0 $x0) (Member $x0 village)) (MnLocationOfVillage $e0 $x0))

;; p207240  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(Implication (And (Location $e0 $x0) (PartOf $x0 $x1)) (MnLocationOfPartOf $e0 $x0 $x1))

;; p207244  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Past $e0)) (MnLocationHere_Past $e0))

;; p207245  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Patient $e0 $x0)) (MnLocationHere_Patient $e0 $x0))

;; p207247  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001572 tierB-001743
(Implication (And (Manner $e0 immediately) (Past $e0)) (MnMannerImmediately_Past $e0))

;; p207248  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierC-000235 tierC-000236
(Implication (And (Manner $e0 well) (Past $e0)) (MnMannerWell_Past $e0))

;; p207249  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001956 tierC-000235 tierC-000236
(Implication (And (Manner $e0 well) (Theme $e0 $x0)) (MnMannerWell_Theme $e0 $x0))

;; p207251  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(Implication (And (Member $e0 approve) (Theme $e0 $x0)) (MnApprove_Theme $e0 $x0))

;; p207252  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001992
(Implication (And (Member $e0 arrive) (Past $e0)) (MnArrive_Past $e0))

;; p207253  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000246 tierB-000674 tierC-000124
(Implication (And (Member $e0 avoid) (Theme $e0 $x0)) (MnAvoid_Theme $e0 $x0))

;; p207254  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000182 tierB-001048 tierB-001394
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnBegin_Patient $e0 $x0))

;; p207255  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
(Implication (And (Member $e0 break_out) (Past $e0)) (MnBreakOut_Past $e0))

;; p207256  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000427 tierB-000636 tierC-000351
(Implication (And (Member $e0 bring) (Past $e0)) (MnBring_Past $e0))

;; p207259  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000950 tierB-001926
(Implication (And (Member $e0 close) (Patient $e0 $x0)) (MnClose_Patient $e0 $x0))

;; p207260  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001697 tierB-001949
(Implication (And (Member $e0 come) (Patient $e0 $x0)) (MnCome_Patient $e0 $x0))

;; p207261  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001774 tierB-001949
(Implication (And (Member $e0 come) (Source $e0 $x0)) (MnCome_Source $e0 $x0))

;; p207264  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000809 tierB-001166 tierB-001541
(Implication (And (Member $e0 cover) (Patient $e0 $x0)) (MnCover_Patient $e0 $x0))

;; p207266  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001149 tierC-000261 tierC-000262
(Implication (And (Member $e0 define) (Theme $e0 $x0)) (MnDefine_Theme $e0 $x0))

;; p207272  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-001905
(Implication (And (Member $e0 fall) (Ongoing $e0)) (MnFall_Ongoing $e0))

;; p207274  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000780 tierC-000179 tierC-000180
(Implication (And (Member $e0 form) (Past $e0)) (MnForm_Past $e0))

;; p207275  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000780 tierC-000163 tierC-000179
(Implication (And (Member $e0 form) (Patient $e0 $x0)) (MnForm_Patient $e0 $x0))

;; p207276  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000418 tierB-000672 tierB-001325
(Implication (And (Member $e0 get) (Theme $e0 $x0)) (MnGet_Theme $e0 $x0))

;; p207277  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000115 tierC-000209 tierC-000210
(Implication (And (Member $e0 go) (To $e0 $e1)) (MnGo_ToEv $e0 $e1))

;; p207278  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000858 tierB-001094
(Implication (And (Member $e0 help) (Past $e0)) (MnHelp_Past $e0))

;; p207279  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierC-000283 tierC-000284
(Implication (And (Member $e0 hold) (Patient $e0 $x0)) (MnHold_Patient $e0 $x0))

;; p207280  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
(Implication (And (Member $e0 hold_up) (Past $e0)) (MnHoldUp_Past $e0))

;; p207283  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000258 tierC-000351
(Implication (And (Member $e0 influence) (Past $e0)) (MnInfluence_Past $e0))

;; p207287  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000704 tierB-000713 tierB-001350
(Implication (And (Member $e0 leave) (Theme $e0 $x0)) (MnLeave_Theme $e0 $x0))

;; p207288  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
(Implication (And (Member $e0 pick_up) (Past $e0)) (MnPickUp_Past $e0))

;; p207290  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierC-000229 tierC-000230
(Implication (And (Member $e0 play) (Past $e0)) (MnPlay_Past $e0))

;; p207291  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(Implication (And (Member $e0 read) (Theme $e0 $x0)) (MnRead_Theme $e0 $x0))

;; p207292  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000688 tierC-000255 tierC-000256
(Implication (And (Member $e0 return) (Past $e0)) (MnReturn_Past $e0))

;; p207293  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000311 tierC-000095 tierC-000096
(Implication (And (Member $e0 rule) (Past $e0)) (MnRule_Past $e0))

;; p207294  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001626
(Implication (And (Member $e0 say) (Theme $e0 $x0)) (MnSay_Theme $e0 $x0))

;; p207295  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
(Implication (And (Member $e0 solve) (Patient $e0 $x0)) (MnSolve_Patient $e0 $x0))

;; p207302  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000075 tierC-000100 tierC-000338
(Implication (And (Member $e0 succeed) (Past $e0)) (MnSucceed_Past $e0))

;; p207303  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000700 tierC-000017 tierC-000018
(Implication (And (Member $e0 suggest) (Past $e0)) (MnSuggest_Past $e0))

;; p207304  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001234 tierC-000109 tierC-000110
(Implication (And (Member $e0 take_over) (Past $e0)) (MnTakeOver_Past $e0))

;; p207305  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000327 tierB-000550 tierB-001666
(Implication (And (Member $e0 talk) (Past $e0)) (MnTalk_Past $e0))

;; p207306  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000078 tierC-000209 tierC-000210
(Implication (And (Member $e0 talk) (To $e1 $e0)) (MnToEvOfTalk $e1 $e0))

;; p207307  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-000995 tierB-001618
(Implication (And (Member $e0 travel) (Past $e0)) (MnTravel_Past $e0))

;; p207308  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000651 tierB-001720 tierB-001800
(Implication (And (Member $e0 watch) (Past $e0)) (MnWatch_Past $e0))

;; p207311  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000212 tierC-000079
(Implication (And (Member $e0 work) (Ongoing $e0)) (MnWork_Ongoing $e0))

;; p207312  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(Implication (And (Member $x0 big) (Patient $e0 $x0)) (MnPatientOfBig $e0 $x0))

;; p207313  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000937 tierB-001124 tierB-001940
(Implication (And (Member $x0 blue) (Member $x0 sky)) (MnBlue_Sky $x0))

;; p207314  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(Implication (And (Member $x0 bottom) (PartOf $x0 $x1)) (MnBottom_PartOf $x0 $x1))

;; p207316  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierC-000115 tierC-000116
(Implication (And (Member $x0 house) (Member $x0 large)) (MnHouse_Large $x0))

;; p207317  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000371 tierB-000471 tierB-001887
(Implication (And (Member $x0 house) (Patient $e0 $x0)) (MnPatientOfHouse $e0 $x0))

;; p207318  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000685 tierB-001106 tierB-001756
(Implication (And (Member $x0 light) (Patient $e0 $x0)) (MnPatientOfLight $e0 $x0))

;; p207320  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001087 tierC-000341 tierC-000342
(Implication (And (Member $x0 orchestra) (Theme $e0 $x0)) (MnThemeOfOrchestra $e0 $x0))

;; p207322  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000935 tierB-001202 tierB-001910
(Implication (And (Member $x0 problem) (Patient $e0 $x0)) (MnPatientOfProblem $e0 $x0))

;; p207324  support 3 (occ 3)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierB-001223 tierC-000339 tierC-000340
(Implication (And (Member $x0 thing) (Possession $x1 $x0)) (MnPossessionOfThing $x1 $x0))

;; p207325  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(Implication (And (Member $x0 thing) (Stimulus $e0 $x0)) (MnStimulusOfThing $e0 $x0))

;; p207326  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000517 tierB-000748 tierB-001491
(Implication (And (Member $x0 weather) (Patient $e0 $x0)) (MnPatientOfWeather $e0 $x0))

;; p207327  support 3 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001980 tierC-000235 tierC-000236
(Implication (And (Member $x0 work) (Theme $e0 $x0)) (MnThemeOfWork $e0 $x0))

;; p207328  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(Implication (And (Might $e0) (Patient $e0 $x0)) (MnMight_Patient $e0 $x0))

;; p207329  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000797 tierB-001452 tierB-001809
(Implication (And (Only $x0 $e0) (Past $e0)) (MnOnlyEvOfPast $x0 $e0))

;; p207332  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(Implication (And (PartOf $x0 $x1) (Patient $e0 $x0)) (MnPatientOfPartOf $e0 $x0 $x1))

;; p207334  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000193 tierC-000194 tierC-000316
(Implication (And (Past $e0) (Time $e0 later)) (MnPast_TimeLater $e0))

;; p207335  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001486 tierC-000241 tierC-000242
(Implication (And (Past $e0) (Time $e0 now)) (MnPast_TimeNow $e0))

;; p207336  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000631 tierB-000808 tierB-001762
(Implication (And (Past $e0) (Time $e0 today)) (MnPast_TimeToday $e0))

;; p207337  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(Implication (And (Past $e0) (With $e0 $x0)) (MnPast_With $e0 $x0))

;; p207338  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001384 tierC-000257
(Implication (And (Patient $e0 $x0) (Possession $x0 $x1)) (MnPatientOfPossession $e0 $x0 $x1))

;; p207339  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(Implication (And (Patient $e0 $x0) (Probably $e0)) (MnPatient_Probably $e0 $x0))

;; p207341  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(Implication (And (Patient $e0 $x0) (To $e1 $e0)) (MnToEvOfPatient $e1 $e0 $x0))

;; p207345  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001177 tierB-001566 tierB-001922
(Implication (And (Theme $e0 $x0) (To $e0 $x1)) (MnTheme_To $e0 $x0 $x1))

;; ==================== SUBSUMED UNITS: 226 of 1454 rooted-subtree units (k = 4, support >= 3 of 2302 records) ====================

;; p200339  support 26 (occ 26)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   subsumed by p200337 (MnHolder_Have_Theme); not a proposal
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200847  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
;;   subsumed by p200785 (MnStart_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Theme $e0 $e1))

;; p200935  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
;;   subsumed by p200900 (MnBeforeEvOfPast_Past); not a proposal
(And (Before $e0 $e1) (Past $e0))

;; p201168  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201104 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p201222  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201104 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p201224  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
;;   subsumed by p201105 (MnStart_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p201245  support 9 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201104 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Theme $e0 $e1))

;; p201246  support 9 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierC-000045
;;   subsumed by p201223 (MnBuild_Past_Patient); not a proposal
(And (Member $e0 build) (Past $e0))

;; p201478  support 8 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-001867 tierC-000045
;;   subsumed by p201446 (MnAgent_Build_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 build))

;; p201814  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
;;   subsumed by p201674 (MnPast_PatientOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Patient $e0 $x0))

;; p201824  support 7 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
;;   subsumed by p201772 (MnKill_Past_Patient); not a proposal
(And (Member $e0 kill) (Past $e0))

;; p201828  support 7 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierC-000009 tierC-000010
;;   subsumed by p201773 (MnProduce_Past_Patient); not a proposal
(And (Member $e0 produce) (Past $e0))

;; p201831  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   subsumed by p201774 (MnWrite_Past_Patient); not a proposal
(And (Member $e0 write) (Past $e0))

;; p202011  support 6 (occ 10)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000017 tierC-000018 tierC-000123
;;   subsumed by p201891 (MnAgentOfPossessionOfPerson_Past); not a proposal
(And (Agent $e0 $x0) (Past $e0) (Possession $x0 $x1))

;; p202137  support 6 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierC-000045 tierC-000046
;;   subsumed by p202114 (MnAgent_Build_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 build) (Past $e0))

;; p202559  support 5 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202334 (MnBegin_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))

;; p202569  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   subsumed by p202342 (MnStart_ThemeEvOfOngoing-Patient); not a proposal
(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202758  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202724 (MnAgent_Begin_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))

;; p202759  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202333 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p202770  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202725 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))

;; p202771  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202725 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p202851  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202333 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin))

;; p202859  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   subsumed by p202560 (MnAgentOfBoy_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 boy))

;; p202861  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   subsumed by p202764 (MnAgent_Past_Through); not a proposal
(And (Agent $e0 $x0) (Through $e0 $x1))

;; p202869  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202725 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0))

;; p202873  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   subsumed by p202775 (MnCapture_Past_Theme); not a proposal
(And (Member $e0 capture) (Theme $e0 $x0))

;; p202879  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000584 tierC-000095 tierC-000096
;;   subsumed by p202761 (MnAgent_Follow_Theme); not a proposal
(And (Member $e0 follow) (Theme $e0 $x0))

;; p202885  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p202778 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Past $e0))

;; p202886  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p202778 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Theme $e0 $x0))

;; p202887  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
;;   subsumed by p202779 (MnReceive_Past_Theme); not a proposal
(And (Member $e0 receive) (Theme $e0 $x0))

;; p202895  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
;;   subsumed by p202782 (MnWin_Past_Theme); not a proposal
(And (Member $e0 win) (Past $e0))

;; p202896  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierC-000277 tierC-000278
;;   subsumed by p202782 (MnWin_Past_Theme); not a proposal
(And (Member $e0 win) (Theme $e0 $x0))

;; p203710  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   subsumed by p203046 (MnBeforeEvOfAgent-Past_Past); not a proposal
(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1))

;; p203713  support 4 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203047 (MnAgentOfThing_ThemeOfGroupOfView); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 view) (Theme $e0 $x1))

;; p203714  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203053 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $x0 company))

;; p203716  support 4 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203053 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Member $e0 build) (Member $x0 company))

;; p203717  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p203067 (MnStart_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))

;; p203720  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203065 (MnAgent_Build_PatientOfHotel); not a proposal
(And (Agent $e0 $x0) (Member $x1 hotel) (Patient $e0 $x1))

;; p203722  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203049 (MnAgent_ThemeOfGroupOfView-PossessionFreeSoilParty); not a proposal
(And (Agent $e0 $x0) (Possession $x1 free_soil_party) (Theme $e0 $x1))

;; p203723  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203050 (MnAgent_ThemeOfGroupOfView-PossessionRepublicanParty); not a proposal
(And (Agent $e0 $x0) (Possession $x1 republican_party) (Theme $e0 $x1))

;; p203725  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203079 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Cardinality $x0 <num>) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203730  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203087 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (For $e0 $e1) (Member $x0 emmy) (Theme $e0 $x0))

;; p203731  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203079 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p203732  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203080 (MnHave_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Member $e0 have) (Theme $e0 $x0))

;; p203734  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203092 (MnThemeOfGroupOfView-PossessionFreeSoilPartyOfParty); not a proposal
(And (GroupOf $x0 view) (Member free_soil_party party) (Possession $x0 free_soil_party))

;; p203735  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203093 (MnThemeOfGroupOfView-PossessionRepublicanPartyOfParty); not a proposal
(And (GroupOf $x0 view) (Member republican_party party) (Possession $x0 republican_party))

;; p203736  support 4 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203048 (MnAgent_Past_ThemeOfGroupOfView); not a proposal
(And (GroupOf $x0 view) (Past $e0) (Theme $e0 $x0))

;; p203740  support 4 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   subsumed by p203096 (MnLocation_Find_ThemeOfThing); not a proposal
(And (Location $e0 $x0) (Member $x1 thing) (Theme $e0 $x1))

;; p203746  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203065 (MnAgent_Build_PatientOfHotel); not a proposal
(And (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))

;; p203749  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000279 tierC-000280 tierC-000313
;;   subsumed by p203096 (MnLocation_Find_ThemeOfThing); not a proposal
(And (Member $e0 find) (Member $x0 thing) (Theme $e0 $x0))

;; p203751  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203087 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (Member $e0 win) (Member $x0 emmy) (Theme $e0 $x0))

;; p203754  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203088 (MnForEv_Past_ThemeOfEmmy); not a proposal
(And (Member $x0 emmy) (Past $e0) (Theme $e0 $x0))

;; p203756  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203073 (MnAgent_Past_PatientOfHotel); not a proposal
(And (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))

;; p203759  support 4 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000047 tierC-000048 tierC-000235
;;   subsumed by p203116 (MnPast_ThemeOfPossessionOfPerson); not a proposal
(And (Member $x0 person) (Possession $x1 $x0) (Theme $e0 $x1))

;; p203763  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203074 (MnAgent_ThemeOfPossessionFreeSoilPartyOfParty); not a proposal
(And (Member free_soil_party party) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203764  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203075 (MnAgent_ThemeOfPossessionRepublicanPartyOfParty); not a proposal
(And (Member republican_party party) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203768  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203076 (MnAgent_Past_ThemeOfPossessionFreeSoilParty); not a proposal
(And (Past $e0) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p203769  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203077 (MnAgent_Past_ThemeOfPossessionRepublicanParty); not a proposal
(And (Past $e0) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p203992  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203074 (MnAgent_ThemeOfPossessionFreeSoilPartyOfParty); not a proposal
(And (Member free_soil_party party) (Possession $x0 free_soil_party))

;; p203993  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203075 (MnAgent_ThemeOfPossessionRepublicanPartyOfParty); not a proposal
(And (Member republican_party party) (Possession $x0 republican_party))

;; p204278  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000688 tierC-000001 tierC-000121
;;   subsumed by p203046 (MnBeforeEvOfAgent-Past_Past); not a proposal
(And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0))

;; p204279  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203053 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Member $e0 build))

;; p204280  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203054 (MnAgentOfCompany_LocationKazakhstan_Past); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Past $e0))

;; p204281  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203055 (MnAgentOfCompany_LocationKazakhstan_Patient); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan) (Patient $e0 $x1))

;; p204284  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   subsumed by p204221 (MnAgent_Kill_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 kill) (Past $e0))

;; p204285  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   subsumed by p204221 (MnAgent_Kill_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 kill) (Patient $e0 $x1))

;; p204287  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p204222 (MnAgent_Start_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0))

;; p204288  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p203066 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p204294  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203079 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 child) (Theme $e0 $x0))

;; p204299  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p204223 (MnForEv_Win_Past_Theme); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Past $e0))

;; p204300  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203087 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Theme $e0 $x0))

;; p204303  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203049 (MnAgent_ThemeOfGroupOfView-PossessionFreeSoilParty); not a proposal
(And (GroupOf $x0 view) (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p204304  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203050 (MnAgent_ThemeOfGroupOfView-PossessionRepublicanParty); not a proposal
(And (GroupOf $x0 view) (Possession $x0 republican_party) (Theme $e0 $x0))

;; p204305  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203081 (MnHolderKristoffer_Have_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 kristoffer) (Member $e0 have) (Theme $e0 $x0))

;; p204307  support 4 (occ 6)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001933 tierC-000025
;;   subsumed by p203056 (MnAgent_ThemeEvOfLocation-Ongoing); not a proposal
(And (Location $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; p204308  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p204218 (MnAgent_LocationKazakhstan_Build_Past); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build) (Past $e0))

;; p204309  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p204219 (MnAgent_LocationKazakhstan_Build_Patient); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build) (Patient $e0 $x0))

;; p204310  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p204220 (MnAgent_LocationKazakhstan_Past_Patient); not a proposal
(And (Location $e0 kazakhstan) (Past $e0) (Patient $e0 $x0))

;; p204318  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
;;   subsumed by p203111 (MnStart_Patient_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))

;; p204460  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203053 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 kazakhstan))

;; p204462  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
;;   subsumed by p204282 (MnAgent_Contain_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 contain))

;; p204465  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p204283 (MnAgent_Jump_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 jump))

;; p204466  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001197 tierB-001399 tierC-000353
;;   subsumed by p204221 (MnAgent_Kill_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 kill))

;; p204470  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p203066 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start))

;; p204471  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p204289 (MnAgent_Swim_Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 swim))

;; p204474  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
;;   subsumed by p203718 (MnAgentOfCat_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 cat))

;; p204480  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000616 tierB-001000
;;   subsumed by p204292 (MnAlready_Past_Patient); not a proposal
(And (Already $e0) (Past $e0))

;; p204483  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   subsumed by p203724 (MnButEvOfPast_Past); not a proposal
(And (But $e0 $e1) (Past $e0))

;; p204484  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000161 tierC-000162 tierC-000243
;;   subsumed by p203724 (MnButEvOfPast_Past); not a proposal
(And (But $e0 $e1) (Past $e1))

;; p204491  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   subsumed by p204295 (MnResultEvOfExperiencer-Bad); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 bad))

;; p204493  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   subsumed by p203729 (MnResultEvOfExperiencerOfBad); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 bad))

;; p204497  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203087 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (For $e0 $e1) (Member $e0 win))

;; p204498  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
;;   subsumed by p204301 (MnGoal_Walk_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 walk))

;; p204499  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203079 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (GroupOf $x0 child) (Theme $e0 $x0))

;; p204500  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203049 (MnAgent_ThemeOfGroupOfView-PossessionFreeSoilParty); not a proposal
(And (GroupOf $x0 view) (Possession $x0 free_soil_party))

;; p204501  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203050 (MnAgent_ThemeOfGroupOfView-PossessionRepublicanParty); not a proposal
(And (GroupOf $x0 view) (Possession $x0 republican_party))

;; p204502  support 4 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203047 (MnAgentOfThing_ThemeOfGroupOfView); not a proposal
(And (GroupOf $x0 view) (Theme $e0 $x0))

;; p204503  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203081 (MnHolderKristoffer_Have_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 kristoffer) (Member $e0 have))

;; p204504  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000181 tierC-000182 tierC-000239
;;   subsumed by p203079 (MnHolderKristoffer_ThemeOfCardinalityNum-GroupOfChild); not a proposal
(And (Holder $e0 kristoffer) (Theme $e0 $x0))

;; p204510  support 4 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
;;   subsumed by p203739 (MnLocationOfTable_Past); not a proposal
(And (Location $e0 $x0) (Member $x0 table))

;; p204512  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203053 (MnAgentOfCompany_LocationKazakhstan_Build); not a proposal
(And (Location $e0 kazakhstan) (Member $e0 build))

;; p204513  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203054 (MnAgentOfCompany_LocationKazakhstan_Past); not a proposal
(And (Location $e0 kazakhstan) (Past $e0))

;; p204514  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203055 (MnAgentOfCompany_LocationKazakhstan_Patient); not a proposal
(And (Location $e0 kazakhstan) (Patient $e0 $x0))

;; p204518  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierC-000241
;;   subsumed by p203744 (MnPatient_ResultEvOfBad); not a proposal
(And (Member $e0 bad) (Result $e1 $e0))

;; p204519  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001568 tierC-000199 tierC-000200
;;   subsumed by p204311 (MnBear_Past_Patient); not a proposal
(And (Member $e0 bear) (Patient $e0 $x0))

;; p204526  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000010 tierC-000091 tierC-000297
;;   subsumed by p204312 (MnDirect_Past_Patient); not a proposal
(And (Member $e0 direct) (Past $e0))

;; p204527  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   subsumed by p204313 (MnDiscover_Past_Theme); not a proposal
(And (Member $e0 discover) (Past $e0))

;; p204528  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000658 tierB-001251 tierC-000111
;;   subsumed by p204313 (MnDiscover_Past_Theme); not a proposal
(And (Member $e0 discover) (Theme $e0 $x0))

;; p204530  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p204283 (MnAgent_Jump_Past); not a proposal
(And (Member $e0 jump) (Past $e0))

;; p204531  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-001487 tierC-000285
;;   subsumed by p204317 (MnOpen_Past_Patient); not a proposal
(And (Member $e0 open) (Past $e0))

;; p204540  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p204289 (MnAgent_Swim_Ongoing); not a proposal
(And (Member $e0 swim) (Ongoing $e0))

;; p204546  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p203087 (MnForEv_Win_ThemeOfEmmy); not a proposal
(And (Member $x0 emmy) (Theme $e0 $x0))

;; p204547  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierC-000017 tierC-000018 tierC-000121
;;   subsumed by p203755 (MnFamily_PossessionOfPerson); not a proposal
(And (Member $x0 family) (Possession $x0 $x1))

;; p204548  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000046 tierC-000291
;;   subsumed by p203065 (MnAgent_Build_PatientOfHotel); not a proposal
(And (Member $x0 hotel) (Patient $e0 $x0))

;; p204550  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   subsumed by p203765 (MnPast_ThemeOfOf); not a proposal
(And (Of $x0 $x1) (Theme $e0 $x0))

;; p204555  support 4 (occ 5)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
;;   subsumed by p203766 (MnPast_ThemeEvOfPast); not a proposal
(And (Past $e0) (Theme $e1 $e0))

;; p204557  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
;;   subsumed by p203767 (MnPast_PatientOfSubsetOf); not a proposal
(And (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p204559  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203049 (MnAgent_ThemeOfGroupOfView-PossessionFreeSoilParty); not a proposal
(And (Possession $x0 free_soil_party) (Theme $e0 $x0))

;; p204560  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000355
;;   subsumed by p203050 (MnAgent_ThemeOfGroupOfView-PossessionRepublicanParty); not a proposal
(And (Possession $x0 republican_party) (Theme $e0 $x0))

;; p205990  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204829 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company))

;; p205991  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   subsumed by p204836 (MnAgentOfPerson_Write_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 write) (Member $x0 person))

;; p206004  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   subsumed by p204843 (MnAgent_Past_ToEvOfTheme); not a proposal
(And (Agent $e0 $x0) (Theme $e1 $x1) (To $e0 $e1))

;; p206008  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   subsumed by p204848 (MnBeforeEvOfPast_Past_Patient); not a proposal
(And (Before $e0 $e1) (Past $e1) (Patient $e0 $x0))

;; p206009  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
;;   subsumed by p204849 (MnHolder_Have_ThemeOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p206010  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000838 tierC-000353 tierC-000354
;;   subsumed by p204850 (MnLocation_Past_PatientOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Location $e0 $x1) (Patient $e0 $x0))

;; p206013  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p204854 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))

;; p206020  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p204854 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))

;; p206022  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p204861 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e0 win) (Member $e1 portray))

;; p206023  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p204861 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e1 portray) (Past $e0))

;; p206024  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p204862 (MnForEvOfPortray_Win_Theme); not a proposal
(And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0))

;; p206028  support 3 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204824 (MnAgent_ThemeOfGroupOfView_Theme); not a proposal
(And (GroupOf $x0 view) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206035  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   subsumed by p204827 (MnPast_ThemeEvOfAgent-Location); not a proposal
(And (Location $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; p206037  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204832 (MnAgent_LocationEskisehir_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0))

;; p206038  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   subsumed by p204852 (MnPast_ResultEvOfExperiencer-Bad); not a proposal
(And (Member $e0 bad) (Past $e1) (Result $e1 $e0))

;; p206039  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000199 tierC-000200 tierC-000358
;;   subsumed by p204894 (MnBear_Past_PatientOfPerson); not a proposal
(And (Member $e0 bear) (Member $x0 person) (Patient $e0 $x0))

;; p206040  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001394 tierC-000025 tierC-000026
;;   subsumed by p204895 (MnBegin_ThemeEvOfOngoing-Patient); not a proposal
(And (Member $e0 begin) (Patient $e1 $x0) (Theme $e0 $e1))

;; p206042  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204902 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))

;; p206043  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001594 tierC-000241 tierC-000242
;;   subsumed by p204903 (MnPast_PatientOfBad_ResultEv); not a proposal
(And (Member $x0 bad) (Past $e0) (Patient $e0 $x0))

;; p206054  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204846 (MnAgent_ThemeOfPossessionFreeSoilParty_Theme); not a proposal
(And (Possession $x0 free_soil_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206055  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204847 (MnAgent_ThemeOfPossessionRepublicanParty_Theme); not a proposal
(And (Possession $x0 republican_party) (Theme $e0 $x0) (Theme $e0 $x1))

;; p206793  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206645 (MnAgent_Goal_Come_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))

;; p206796  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204829 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build))

;; p206797  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204830 (MnAgentOfCompany_LocationEskisehir_Past); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0))

;; p206798  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204831 (MnAgentOfCompany_LocationEskisehir_Patient); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1))

;; p206799  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   subsumed by p206651 (MnAgent_MannerDirectly_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))

;; p206800  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   subsumed by p206651 (MnAgent_MannerDirectly_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))

;; p206801  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206652 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))

;; p206802  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206652 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))

;; p206810  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 spend) (Past $e0))

;; p206811  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 spend) (Theme $e0 $x1))

;; p206817  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   subsumed by p204836 (MnAgentOfPerson_Write_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 write) (Past $e0))

;; p206818  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001962 tierC-000089 tierC-000090
;;   subsumed by p204837 (MnAgentOfPerson_Write_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 write) (Patient $e0 $x1))

;; p206821  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204824 (MnAgent_ThemeOfGroupOfView_Theme); not a proposal
(And (Agent $e0 $x0) (Theme $e0 $x1) (Theme $e0 $x2))

;; p206822  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierC-000123 tierC-000124
;;   subsumed by p204845 (MnPast_ToEvOfAgent-Theme); not a proposal
(And (Agent $e0 $x0) (Theme $e0 $x1) (To $e1 $e0))

;; p206823  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   subsumed by p204848 (MnBeforeEvOfPast_Past_Patient); not a proposal
(And (Before $e0 $e1) (Past $e0) (Patient $e0 $x0))

;; p206828  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206645 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))

;; p206832  support 3 (occ 5)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierC-000025 tierC-000026
;;   subsumed by p204834 (MnAgent_ThemeEvOfLocation-Patient); not a proposal
(And (Location $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p206833  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p206648 (MnAgent_LocationEskisehir_Build_Past); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build) (Past $e0))

;; p206834  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204889 (MnLocationEskisehir_Build_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0))

;; p206835  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204890 (MnLocationEskisehir_Past_PatientOfHotel); not a proposal
(And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0))

;; p206836  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   subsumed by p206651 (MnAgent_MannerDirectly_Past_Patient); not a proposal
(And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))

;; p206848  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p206661 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))

;; p206853  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Member $e0 spend) (Past $e0) (Theme $e0 $x0))

;; p206856  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204902 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))

;; p206863  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p206661 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p206865  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204875 (MnPast_ThemeOfGroupOfView_Theme); not a proposal
(And (Past $e0) (Theme $e0 $x0) (Theme $e0 $x1))

;; p207154  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p206795 (MnAgent_GoalHome_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 home))

;; p207158  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204829 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Agent $e0 $x0) (Location $e0 eskisehir))

;; p207159  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   subsumed by p206651 (MnAgent_MannerDirectly_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Manner $e0 directly))

;; p207161  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206652 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture))

;; p207163  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000728 tierC-000025 tierC-000026
;;   subsumed by p206804 (MnAgent_Create_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 create))

;; p207164  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p206805 (MnAgent_Draw_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 draw))

;; p207170  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 spend))

;; p207173  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
;;   subsumed by p206816 (MnAgent_Welcome_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 welcome))

;; p207179  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   subsumed by p205996 (MnAgentOfPlane_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 plane))

;; p207181  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
;;   subsumed by p206000 (MnPast_StimulusEvOfAgent); not a proposal
(And (Agent $e0 $x0) (Stimulus $e1 $e0))

;; p207196  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   subsumed by p206006 (MnBecauseEvOfPast_Past); not a proposal
(And (Because $e0 $e1) (Past $e0))

;; p207197  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001625 tierC-000311 tierC-000312
;;   subsumed by p206006 (MnBecauseEvOfPast_Past); not a proposal
(And (Because $e0 $e1) (Past $e1))

;; p207198  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierC-000121 tierC-000122
;;   subsumed by p206007 (MnBeforeEvOfPast_MeasureDurationNumYear); not a proposal
(And (Before $e0 $e1) (Measure $e0 duration <num> year))

;; p207199  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierC-000001 tierC-000002
;;   subsumed by p204848 (MnBeforeEvOfPast_Past_Patient); not a proposal
(And (Before $e0 $e1) (Patient $e0 $x0))

;; p207200  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001134 tierB-001302 tierC-000002
;;   subsumed by p206824 (MnBeforeEvOfPast-Patient); not a proposal
(And (Before $e0 $e1) (Patient $e1 $x0))

;; p207209  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-001667 tierC-000014
;;   subsumed by p206825 (MnExperiencer_In_Past); not a proposal
(And (Experiencer $e0 $x0) (In $e0 $x1))

;; p207218  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierC-000277 tierC-000278 tierC-000301
;;   subsumed by p204861 (MnForEvOfPortray_Win_Past); not a proposal
(And (For $e0 $e1) (Member $e1 portray))

;; p207221  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
;;   subsumed by p206827 (MnGoal_MannerQuickly_Past); not a proposal
(And (Goal $e0 $x0) (Manner $e0 quickly))

;; p207222  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206645 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come))

;; p207224  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p206795 (MnAgent_GoalHome_Past); not a proposal
(And (Goal $e0 home) (Past $e0))

;; p207228  support 3 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000072 tierC-000213 tierC-000214
;;   subsumed by p206829 (MnInstrument_Build_Patient); not a proposal
(And (Instrument $e0 $x0) (Member $e0 build))

;; p207235  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierC-000243 tierC-000244
;;   subsumed by p206034 (MnLocationOfBench_Past); not a proposal
(And (Location $e0 $x0) (Member $x0 bench))

;; p207236  support 3 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001003 tierC-000041 tierC-000042
;;   subsumed by p206033 (MnLocationOfCouch_Sleep); not a proposal
(And (Location $e0 $x0) (Member $x0 couch))

;; p207237  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   subsumed by p206032 (MnLocationOfHouse_Live); not a proposal
(And (Location $e0 $x0) (Member $x0 house))

;; p207241  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204829 (MnAgentOfCompany_LocationEskisehir_Build); not a proposal
(And (Location $e0 eskisehir) (Member $e0 build))

;; p207242  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204830 (MnAgentOfCompany_LocationEskisehir_Past); not a proposal
(And (Location $e0 eskisehir) (Past $e0))

;; p207243  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000045 tierC-000291 tierC-000292
;;   subsumed by p204831 (MnAgentOfCompany_LocationEskisehir_Patient); not a proposal
(And (Location $e0 eskisehir) (Patient $e0 $x0))

;; p207246  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000257 tierC-000353 tierC-000354
;;   subsumed by p206651 (MnAgent_MannerDirectly_Past_Patient); not a proposal
(And (Manner $e0 directly) (Patient $e0 $x0))

;; p207250  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierC-000231 tierC-000232
;;   subsumed by p206837 (MnAdd_Past_Theme); not a proposal
(And (Member $e0 add) (Past $e0))

;; p207257  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
;;   subsumed by p206838 (MnBuy_Past_Theme); not a proposal
(And (Member $e0 buy) (Past $e0))

;; p207258  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   subsumed by p206839 (MnCause_Past_Patient); not a proposal
(And (Member $e0 cause) (Patient $e0 $x0))

;; p207262  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   subsumed by p206841 (MnCompose_Past_Patient); not a proposal
(And (Member $e0 compose) (Past $e0))

;; p207263  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001575 tierC-000131 tierC-000132
;;   subsumed by p206841 (MnCompose_Past_Patient); not a proposal
(And (Member $e0 compose) (Patient $e0 $x0))

;; p207265  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p206842 (MnCreate_Past_Patient); not a proposal
(And (Member $e0 create) (Past $e0))

;; p207267  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   subsumed by p206843 (MnDesign_Past_Patient); not a proposal
(And (Member $e0 design) (Past $e0))

;; p207268  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000119 tierC-000120 tierC-000184
;;   subsumed by p206843 (MnDesign_Past_Patient); not a proposal
(And (Member $e0 design) (Patient $e0 $x0))

;; p207269  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000838 tierC-000199 tierC-000200
;;   subsumed by p206844 (MnDie_Past_Patient); not a proposal
(And (Member $e0 die) (Past $e0))

;; p207270  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p206845 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Past $e0))

;; p207271  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p206845 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Patient $e0 $x0))

;; p207273  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
;;   subsumed by p206846 (MnFall_Past_Source); not a proposal
(And (Member $e0 fall) (Source $e0 $x0))

;; p207281  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p206849 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Past $e0))

;; p207282  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p206849 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Patient $e0 $x0))

;; p207284  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001086 tierB-001782 tierC-000019
;;   subsumed by p206807 (MnAgent_Lead_Theme); not a proposal
(And (Member $e0 lead) (Theme $e0 $x0))

;; p207285  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p206850 (MnLeave_Patient_ResultEv); not a proposal
(And (Member $e0 leave) (Patient $e0 $x0))

;; p207286  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p206015 (MnLeave_ResultEvOfExperiencer); not a proposal
(And (Member $e0 leave) (Result $e0 $e1))

;; p207289  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
;;   subsumed by p206809 (MnAgent_Play_Ongoing); not a proposal
(And (Member $e0 play) (Ongoing $e0))

;; p207296  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Member $e0 spend) (Past $e0))

;; p207297  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001146 tierC-000047 tierC-000048
;;   subsumed by p206653 (MnAgent_Spend_Past_Theme); not a proposal
(And (Member $e0 spend) (Theme $e0 $x0))

;; p207298  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
;;   subsumed by p206854 (MnStand_Ongoing_Past); not a proposal
(And (Member $e0 stand) (Ongoing $e0))

;; p207299  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p206855 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Past $e0))

;; p207300  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p206855 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Patient $e0 $x0))

;; p207301  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204902 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Theme $e0 $e1))

;; p207309  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
;;   subsumed by p206815 (MnAgent_Watch_Theme); not a proposal
(And (Member $e0 watch) (Theme $e0 $x0))

;; p207310  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001868 tierC-000087 tierC-000088
;;   subsumed by p206816 (MnAgent_Welcome_Past); not a proposal
(And (Member $e0 welcome) (Past $e0))

;; p207315  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
;;   subsumed by p206044 (MnPast_PatientOfFire); not a proposal
(And (Member $x0 fire) (Patient $e0 $x0))

;; p207321  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
;;   subsumed by p206046 (MnPast_ThemeOfPicture); not a proposal
(And (Member $x0 picture) (Theme $e0 $x0))

;; p207323  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001156 tierC-000011 tierC-000012
;;   subsumed by p206047 (MnPast_ThemeOfSong); not a proposal
(And (Member $x0 song) (Theme $e0 $x0))

;; p207340  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001894 tierC-000283 tierC-000284
;;   subsumed by p206864 (MnPast_Patient_TimeNight); not a proposal
(And (Patient $e0 $x0) (Time $e0 night))

;; p207343  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
;;   subsumed by p206052 (MnPast_ThemeEvOfRecipient); not a proposal
(And (Recipient $e0 $x0) (Theme $e1 $e0))

;; p207344  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierC-000159 tierC-000160 tierC-000356
;;   subsumed by p204824 (MnAgent_ThemeOfGroupOfView_Theme); not a proposal
(And (Theme $e0 $x0) (Theme $e0 $x1))
