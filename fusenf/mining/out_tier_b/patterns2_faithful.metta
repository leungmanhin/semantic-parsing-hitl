;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           canonical_substrate.jsonl (1950 records; 1799 carry at least one pattern) — patterns2.jsonl: 4391 patterns, the miner's inventory; this view mines nothing
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 3361 constant-lifted (shape-stratum) patterns are an addition
;;   closure             closed = no larger faithful unit with exactly the same supporting records contains it (its atoms embed under a renaming of variables); two different units on the same records are both closed; computed within this view (the miner's own flag ranges over the full inventory, lifted patterns and joins included, and is kept as miner_dominated); closed units are the meta-node proposals, subsumed units the same evidence in fewer atoms (subsumed_by names the covering unit)
;;   meta-node           (Mn<Name> <root> <other variables>) for proposals = closed units of size >= 2 — Name = the unit's heads and constants in atom order along the tree (Member / GroupOf give their constant, roles their name, Ev / Fn for an event- or function-valued filler, Of<spec> for a filler with atoms of its own, ~NEG a Neg suffix; root tokens joined with '_', tokens inside a nested spec with '-'), the pattern id appended when two units would share a name (2 here); provisional; pack rule = (Implication (And <atoms>) (Mn<Name> …))
;;   proposals           closed units of size >= 2 (flag `proposal`); a subsumed unit is the same evidence in fewer atoms and is rendered for reading only; single-atom units are subtrees by the letter and are rendered in their section without a rule, since a one-atom pack is a rename
;;
;; RECORD FORMAT (every record is one unit = one rooted subtree)
;;   ;; <pattern id>  support <records> (occ <matches>)  size <atoms>  root <variable> (<kind>)  depth <d>
;;   ;;   e.g. <up to three supporting record ids>
;;   (Implication <the unit as a conjunctive query> (Mn<Name> <root> <other variables>))
;;     = the pack rule the proposal would become (naming provisional; the gauntlet decides); a unit that is
;;     not a proposal (subsumed, or a single atom) carries no rule and is rendered as its bare query under a note
;; Sections: CLOSED UNITS (proposals = the closed units of size >= 2; closed single atoms listed with them) then
;; SUBSUMED UNITS (a larger unit on the same records contains them); each sorted by support desc, then pattern id.

;; ==================== CLOSED UNITS: 808 of 945 rooted-subtree units (465 proposals; k = 4, support >= 3 of 1950 records) ====================

;; p200004  support 569 (occ 632)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000002 tierB-000005
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past $e0)

;; p200009  support 317 (occ 359)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000018 tierB-000028
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 $x0)

;; p200011  support 267 (occ 280)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000005 tierB-000016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Patient $e0 $x0)

;; p200012  support 245 (occ 258)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000021 tierB-000037
;;   single atom; not a proposal (a one-atom pack is a rename)
(Theme $e0 $x0)

;; p200021  support 190 (occ 205)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000045 tierB-000049
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnAgent_Past $e0 $x0))

;; p200027  support 151 (occ 154)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000018 tierB-000034
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_Patient $e0 $x0))

;; p200029  support 145 (occ 149)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   single atom; not a proposal (a one-atom pack is a rename)
(Ongoing $e0)

;; p200036  support 129 (occ 139)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000040 tierB-000124
;;   single atom; not a proposal (a one-atom pack is a rename)
(Experiencer $e0 $x0)

;; p200040  support 114 (occ 119)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000021 tierB-000047
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_Theme $e0 $x0))

;; p200048  support 93 (occ 98)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000036
;;   single atom; not a proposal (a one-atom pack is a rename)
(Location $e0 $x0)

;; p200050  support 89 (occ 92)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000101
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_Theme $e0 $x0 $x1))

;; p200059  support 75 (occ 76)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000023 tierB-000055 tierB-000080
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 thing)

;; p200072  support 66 (occ 69)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
;;   single atom; not a proposal (a one-atom pack is a rename)
(Theme $e0 $e1)

;; p200079  support 61 (occ 63)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (MnAgent_Patient $e0 $x0 $x1))

;; p200081  support 61 (occ 64)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000032 tierB-000116
;;   single atom; not a proposal (a one-atom pack is a rename)
(LocatedIn $x0 $x1)

;; p200084  support 58 (occ 63)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(Implication (And (Location $e0 $x0) (Past $e0)) (MnLocation_Past $e0 $x0))

;; p200086  support 56 (occ 56)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000036 tierB-000098
(Implication (And (Agent $e0 $x0) (Ongoing $e0)) (MnAgent_Ongoing $e0 $x0))

;; p200106  support 48 (occ 48)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000040 tierB-000111 tierB-000135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Goal $e0 $x0)

;; p200111  support 46 (occ 47)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000091 tierB-000145
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme $e0 $x0 $x1))

;; p200115  support 45 (occ 47)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000101 tierB-000133 tierB-000267
;;   single atom; not a proposal (a one-atom pack is a rename)
(Cardinality $x0 <num>)

;; p200121  support 43 (occ 45)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(Implication (And (Past $e0) (Theme $e0 $e1)) (MnPast_ThemeEv $e0 $e1))

;; p200124  support 42 (occ 46)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000124 tierB-000134 tierB-000191
(Implication (And (Experiencer $e0 $x0) (Past $e0)) (MnExperiencer_Past $e0 $x0))

;; p200128  support 41 (occ 42)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000073 tierB-000170
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient $e0 $x0 $x1))

;; p200132  support 38 (occ 39)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000172 tierB-000202
;;   single atom; not a proposal (a one-atom pack is a rename)
(PartOf $x0 $x1)

;; p200140  support 37 (occ 37)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(Implication (And (Goal $e0 $x0) (Past $e0)) (MnGoal_Past $e0 $x0))

;; p200141  support 37 (occ 39)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(Implication (And (Ongoing $e0) (Past $e0)) (MnOngoing_Past $e0))

;; p200149  support 36 (occ 38)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000206 tierB-000228
;;   single atom; not a proposal (a one-atom pack is a rename)
(Result $e0 $e1)

;; p200158  support 35 (occ 37)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(Implication (And (Ongoing $e0) (Patient $e0 $x0)) (MnOngoing_Patient $e0 $x0))

;; p200159  support 35 (occ 35)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 have)

;; p200171  support 33 (occ 33)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))

;; p200178  support 32 (occ 32)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000082 tierB-000100 tierB-000108
;;   single atom; not a proposal (a one-atom pack is a rename)
(Future $e0)

;; p200179  support 32 (occ 32)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000122 tierB-000246 tierB-000423
;;   single atom; not a proposal (a one-atom pack is a rename)
(Possession $x0 $x1)

;; p200187  support 31 (occ 31)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000230
;;   single atom; not a proposal (a one-atom pack is a rename)
(Source $e0 $x0)

;; p200192  support 30 (occ 33)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000040 tierB-000126 tierB-000191
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 person)

;; p200219  support 27 (occ 29)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (MnAgent_Location $e0 $x0 $x1))

;; p200232  support 26 (occ 26)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000037 tierB-000080 tierB-000144
;;   single atom; not a proposal (a one-atom pack is a rename)
(Obligated $e0)

;; p200242  support 25 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(Implication (And (Location $e0 $x0) (Ongoing $e0)) (MnLocation_Ongoing $e0 $x0))

;; p200256  support 24 (occ 24)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (MnAgent_ThemeEv $e0 $e1 $x0))

;; p200278  support 23 (occ 23)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; p200283  support 23 (occ 25)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Experiencer $e0 $x0) (Result $e1 $e0)) (MnResultEvOfExperiencer $e1 $e0 $x0))

;; p200286  support 23 (occ 23)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(Implication (And (Past $e0) (Result $e0 $e1)) (MnPast_ResultEv $e0 $e1))

;; p200322  support 22 (occ 22)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfOngoing $e1 $e0))

;; p200323  support 22 (occ 24)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Patient $e0 $x0) (Result $e0 $e1)) (MnPatient_ResultEv $e0 $e1 $x0))

;; p200325  support 22 (occ 22)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000173
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 make)

;; p200343  support 20 (occ 21)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(Implication (And (Agent $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfAgent $e1 $e0 $x0))

;; p200359  support 19 (occ 19)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(Implication (And (Past $e0) (Source $e0 $x0)) (MnPast_Source $e0 $x0))

;; p200361  support 19 (occ 19)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000025 tierB-000156 tierB-000299
;;   single atom; not a proposal (a one-atom pack is a rename)
(Can $e0)

;; p200362  support 19 (occ 19)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 start)

;; p200378  support 18 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000114 tierB-000174
;;   single atom; not a proposal (a one-atom pack is a rename)
(Stimulus $e0 $x0)

;; p200379  support 18 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $e0 $e1)

;; p200390  support 17 (occ 17)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; p200407  support 17 (occ 17)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000268 tierB-000282
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 use)

;; p200408  support 17 (occ 17)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierB-000293 tierB-000371
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 house)

;; p200423  support 16 (occ 17)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; p200436  support 16 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; p200442  support 16 (occ 16)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1)) (MnAgent_Goal $e0 $x0 $x1))

;; p200449  support 16 (occ 16)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000133 tierB-000196
;;   single atom; not a proposal (a one-atom pack is a rename)
(SubsetOf $x0 $x1)

;; p200469  support 15 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0)) (MnExperiencer_Ongoing $e0 $x0))

;; p200470  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000269
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; p200472  support 15 (occ 16)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000263 tierB-000344 tierB-000670
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 room)

;; p200493  support 14 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnAgent_Location_Past $e0 $x0 $x1))

;; p200498  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(Implication (And (Location $e0 $x0) (Patient $e0 $x1)) (MnLocation_Patient $e0 $x0 $x1))

;; p200499  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; p200500  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000416 tierB-000520 tierB-000574
(Implication (And (Ongoing $e0) (Theme $e0 $x0)) (MnOngoing_Theme $e0 $x0))

;; p200501  support 14 (occ 14)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(Implication (And (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfPatient $e1 $e0 $x0))

;; p200505  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000222 tierB-000392
;;   single atom; not a proposal (a one-atom pack is a rename)
(Instrument $e0 $x0)

;; p200506  support 14 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 go)

;; p200507  support 14 (occ 14)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000056 tierB-000425 tierB-000446
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 door)

;; p200508  support 14 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000150 tierB-000485 tierB-000547
;;   single atom; not a proposal (a one-atom pack is a rename)
(Recipient $e0 $x0)

;; p200530  support 13 (occ 13)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; p200545  support 13 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; p200554  support 13 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000418
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 get)

;; p200555  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000288 tierB-000728 tierB-000958
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 new)

;; p200556  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000316 tierB-000338 tierB-000628
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 person)

;; p200584  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; p200600  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0)) (MnAgent_Ongoing_Past $e0 $x0))

;; p200601  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; p200624  support 12 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000410 tierB-000587 tierB-000634
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 child)

;; p200625  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000152 tierB-000238 tierB-000255
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 come)

;; p200626  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000307 tierB-000650 tierB-000843
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 problem)

;; p200627  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000351 tierB-000429
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 weather)

;; p200628  support 12 (occ 12)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000016 tierB-000126 tierB-000285
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past (LocatedIn $x0 $x1))

;; p200629  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 now)

;; p200667  support 11 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (MnExperiencer_Location $e0 $x0 $x1))

;; p200668  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(Implication (And (Future $e0) (Patient $e0 $x0)) (MnFuture_Patient $e0 $x0))

;; p200678  support 11 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000049 tierB-000107
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $e0 $x0)

;; p200679  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000162 tierB-000483 tierB-001020
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 thing)

;; p200680  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 quickly)

;; p200681  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 try)

;; p200682  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000793 tierB-001182 tierB-001316
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 man)

;; p200683  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000494 tierB-000576 tierB-000589
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 place)

;; p200684  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000016 tierB-000047 tierB-000335
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 table)

;; p200729  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(Implication (And (Agent $e0 $x0) (Future $e0)) (MnAgent_Future $e0 $x0))

;; p200730  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; p200731  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; p200732  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0)) (MnHave_Past $e0))

;; p200733  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; p200744  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 begin)

;; p200745  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000100 tierB-000298
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 leave)

;; p200746  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 take)

;; p200747  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000458 tierB-000703
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 book)

;; p200748  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000073 tierB-000250
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cat)

;; p200749  support 10 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000137 tierB-000527
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 good)

;; p200750  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000277 tierB-000668
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 tree)

;; p200754  support 9 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; p200800  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfOngoing $e0 $e1 $x0))

;; p200829  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnAgent_Location_Ongoing $e0 $x0 $x1))

;; p200830  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; p200831  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000148 tierB-000381
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Past $e0)) (MnLocation_Ongoing_Past $e0 $x0))

;; p200832  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; p200833  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; p200846  support 9 (occ 11)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnAgentOfPerson $e0 $x0))

;; p200847  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_Recipient $e0 $x0 $x1))

;; p200848  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; p200849  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000325 tierB-000539
(Implication (And (Member $e0 make) (Past $e0)) (MnMake_Past $e0))

;; p200850  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnStart_Patient $e0 $x0))

;; p200851  support 9 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Theme $e0 $x0)) (MnThemeOfThing $e0 $x0))

;; p200852  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000080 tierB-000246
(Implication (And (Obligated $e0) (Theme $e0 $x0)) (MnObligated_Theme $e0 $x0))

;; p200853  support 9 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000150 tierB-000769 tierB-000775
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_Recipient $e0 $x0))

;; p200864  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-000609
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 fall)

;; p200865  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 hear)

;; p200866  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000061 tierB-000086 tierB-000107
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 need)

;; p200867  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000160 tierB-000648
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 play)

;; p200868  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-000253
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 study)

;; p200869  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000212 tierB-000419
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 work)

;; p200870  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000904 tierB-001016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beautiful)

;; p200871  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000190 tierB-000327
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 car)

;; p200872  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000153 tierB-000546 tierB-000680
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 city)

;; p200873  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000340 tierB-000537 tierB-000871
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 dog)

;; p200874  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000267 tierB-000334 tierB-000471
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 old)

;; p200875  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000294 tierB-000468 tierB-000582
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 road)

;; p200876  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000370 tierB-000792 tierB-000797
;;   single atom; not a proposal (a one-atom pack is a rename)
(Only $x0 $e0)

;; p200877  support 9 (occ 9)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000495 tierB-000517 tierB-001521
;;   single atom; not a proposal (a one-atom pack is a rename)
(Probably $e0)

;; p200938  support 8 (occ 8)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p200961  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000410 tierB-000587 tierB-000648
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnAgentOfGroupOfChild $e0 $x0))

;; p200962  support 8 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person)) (MnAgentOfGroupOfPerson $e0 $x0))

;; p200963  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_Make $e0 $x0))

;; p200964  support 8 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnThemeOfCardinalityNum $e0 $x0))

;; p200965  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(Implication (And (Future $e0) (Theme $e0 $x0)) (MnFuture_Theme $e0 $x0))

;; p200966  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(Implication (And (Instrument $e0 $x0) (Patient $e0 $x1)) (MnInstrument_Patient $e0 $x0 $x1))

;; p200967  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Patient $e0 $x0)) (MnMannerQuickly_Patient $e0 $x0))

;; p200968  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
(Implication (And (Member $e0 begin) (Past $e0)) (MnBegin_Past $e0))

;; p200969  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; p200970  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(Implication (And (Member $e0 try) (Past $e0)) (MnTry_Past $e0))

;; p200971  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Theme $e0 $e1)) (MnTry_ThemeEv $e0 $e1))

;; p200972  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(Implication (And (Obligated $e0) (Patient $e0 $x0)) (MnObligated_Patient $e0 $x0))

;; p200973  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(Implication (And (Past $e0) (Stimulus $e0 $x0)) (MnPast_Stimulus $e0 $x0))

;; p200974  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(Implication (And (Past $e0) (To $e0 $e1)) (MnPast_ToEv $e0 $e1))

;; p200975  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(Implication (And (Patient $e0 $x0) (Source $e0 $x1)) (MnPatient_Source $e0 $x0 $x1))

;; p200995  support 8 (occ 8)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Again $e0)

;; p200996  support 8 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 live)

;; p200997  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000324
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 walk)

;; p200998  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000322 tierB-000615 tierB-000677
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 garden)

;; p200999  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000456 tierB-000722 tierB-000937
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sky)

;; p201000  support 8 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000302 tierB-000315
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 (Hour <num>))

;; p201001  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000093 tierB-000240 tierB-000734
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $e0 $x0)

;; p201003  support 7 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201004  support 7 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201005  support 7 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; p201054  support 7 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0)) (MnAgentOfGroupOfPerson_Past $e0 $x0))

;; p201056  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(Implication (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfPatient $e0 $e1 $x0))

;; p201108  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1)) (MnAgent_Make_Patient $e0 $x0 $x1))

;; p201109  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnAgent_Ongoing_Patient $e0 $x0 $x1))

;; p201110  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0)) (MnMannerQuickly_Past_Patient $e0 $x0))

;; p201112  support 7 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(Implication (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p201138  support 7 (occ 7)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(Implication (And (Again $e0) (Past $e0)) (MnAgain_Past $e0))

;; p201140  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000770 tierB-000978 tierB-001507
(Implication (And (Agent $e0 $x0) (Member $x0 thing)) (MnAgentOfThing $e0 $x0))

;; p201141  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(Implication (And (Goal $e0 $x0) (Patient $e0 $x1)) (MnGoal_Patient $e0 $x0 $x1))

;; p201142  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (MnLocation_Theme $e0 $x0 $x1))

;; p201144  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000255 tierB-000277
(Implication (And (Member $e0 come) (Past $e0)) (MnCome_Past $e0))

;; p201145  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Patient $e0 $x0)) (MnFall_Patient $e0 $x0))

;; p201146  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Stimulus $e0 $x0)) (MnHear_Stimulus $e0 $x0))

;; p201147  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
(Implication (And (Member $e0 kill) (Patient $e0 $x0)) (MnKill_Patient $e0 $x0))

;; p201148  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000173 tierB-000325 tierB-000951
(Implication (And (Member $e0 make) (Ongoing $e0)) (MnMake_Ongoing $e0))

;; p201149  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(Implication (And (Member $e0 make) (Result $e0 $e1)) (MnMake_ResultEv $e0 $e1))

;; p201150  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
(Implication (And (Member $e0 take) (Past $e0)) (MnTake_Past $e0))

;; p201151  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000324 tierB-000805
(Implication (And (Member $e0 walk) (Past $e0)) (MnWalk_Past $e0))

;; p201152  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000082 tierB-000370 tierB-000389
(Implication (And (Member $x0 thing) (Patient $e0 $x0)) (MnPatientOfThing $e0 $x0))

;; p201153  support 7 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(Implication (And (Ongoing $e0) (Result $e0 $e1)) (MnOngoing_ResultEv $e0 $e1))

;; p201154  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Past $e0) (Through $e0 $x0)) (MnPast_Through $e0 $x0))

;; p201155  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(Implication (And (Possession $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPossession $e0 $x0 $x1))

;; p201171  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
;;   single atom; not a proposal (a one-atom pack is a rename)
(In $e0 $x0)

;; p201172  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000098 tierB-000139 tierB-000517
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 change)

;; p201174  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-000425
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 open)

;; p201175  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001302 tierB-001334
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 sleep)

;; p201176  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 turn)

;; p201177  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000746 tierB-000890
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 big)

;; p201178  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000762 tierB-000853 tierB-000986
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 company)

;; p201179  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000009 tierB-000368 tierB-000403
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 food)

;; p201180  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000408 tierB-000739 tierB-001058
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 town)

;; p201181  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000032 tierB-000618 tierB-000650
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 water)

;; p201253  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfDoor $e0 $x0))

;; p201309  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnExperiencer_Location_Ongoing $e0 $x0 $x1))

;; p201310  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnExperiencer_Location_Past $e0 $x0 $x1))

;; p201311  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(Implication (And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnLocation_Past_Theme $e0 $x0 $x1))

;; p201312  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0)) (MnHear_Past_Stimulus $e0 $x0))

;; p201313  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(Implication (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1)) (MnPast_Patient_Source $e0 $x0 $x1))

;; p201341  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come)) (MnAgent_Come $e0 $x0))

;; p201342  support 6 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001416 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $x0 man)) (MnAgentOfMan $e0 $x0))

;; p201343  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(Implication (And (Agent $e0 $x0) (Source $e0 $x1)) (MnAgent_Source $e0 $x0 $x1))

;; p201344  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(Implication (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1)) (MnCardinalityNum_SubsetOf $x0 $x1))

;; p201345  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000191 tierB-001160 tierB-001485
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 person)) (MnExperiencerOfGroupOfPerson $e0 $x0))

;; p201346  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Theme $e0 $e1)) (MnExperiencer_ThemeEv $e0 $e1 $x0))

;; p201347  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go)) (MnGoal_Go $e0 $x0))

;; p201348  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Theme $e0 $x1)) (MnGoal_Theme $e0 $x0 $x1))

;; p201349  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live)) (MnLocation_Live $e0 $x0))

;; p201350  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0)) (MnCapture_Past $e0))

;; p201351  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Past $e0)) (MnFall_Past $e0))

;; p201352  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000577 tierB-000672 tierB-000890
(Implication (And (Member $e0 get) (Past $e0)) (MnGet_Past $e0))

;; p201353  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000978
(Implication (And (Member $e0 take) (Theme $e0 $x0)) (MnTake_Theme $e0 $x0))

;; p201354  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Patient $e0 $x0)) (MnTurn_Patient $e0 $x0))

;; p201355  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000866 tierB-000938
(Implication (And (Member $e0 use) (Theme $e0 $x0)) (MnUse_Theme $e0 $x0))

;; p201356  support 6 (occ 6)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000080 tierB-000147 tierB-001143
(Implication (And (Obligated $e0) (Past $e0)) (MnObligated_Past $e0))

;; p201357  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(Implication (And (Past $e0) (Patient $e0 $e1)) (MnPast_PatientEv $e0 $e1))

;; p201358  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(Implication (And (Past $e0) (Time $e0 yesterday)) (MnPast_TimeYesterday $e0))

;; p201359  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Patient $e0 $x0) (Theme $e0 $e1)) (MnPatient_ThemeEv $e0 $e1 $x0))

;; p201399  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000805 tierB-000969 tierB-001547
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 $e1)

;; p201400  support 6 (occ 6)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000218 tierB-000616
;;   single atom; not a proposal (a one-atom pack is a rename)
(Already $e0)

;; p201401  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000599 tierB-000892 tierB-001212
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $x0 $x1)

;; p201402  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-000622 tierB-001271
;;   single atom; not a proposal (a one-atom pack is a rename)
(From $x0 $x1)

;; p201403  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000656 tierB-000712
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 student)

;; p201404  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Like $e0 $x0)

;; p201406  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001089
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cause)

;; p201407  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000079 tierB-000188 tierB-000218
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 close)

;; p201408  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001236 tierB-001520 tierB-001721
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 do)

;; p201409  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000858
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 help)

;; p201410  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000257 tierB-000326 tierB-000784
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 sell)

;; p201411  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000327 tierB-000550
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 talk)

;; p201412  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-000651
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 watch)

;; p201413  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 boy)

;; p201414  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000160 tierB-001021 tierB-001114
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 child)

;; p201415  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000687 tierB-000792 tierB-000798
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 floor)

;; p201416  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000145 tierB-000383 tierB-000981
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 horse)

;; p201417  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000230 tierB-000316 tierB-000576
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 huge)

;; p201418  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000561 tierB-000685 tierB-000708
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 light)

;; p201419  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000180 tierB-000498 tierB-000841
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 rain)

;; p201420  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000297 tierB-000546 tierB-000782
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 school)

;; p201421  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000805 tierB-000951 tierB-001384
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sound)

;; p201422  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000882 tierB-001111
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 street)

;; p201423  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000261 tierB-000343 tierB-000560
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wall)

;; p201424  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000082 tierB-001123 tierB-001169
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 whole)

;; p201425  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000097 tierB-000201 tierB-000790
;;   single atom; not a proposal (a one-atom pack is a rename)
(On $e0 $x0)

;; p201435  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing-Patient $e0 $e1 $x0))

;; p201561  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(Implication (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0)) (MnAgentOfBoy_Past $e0 $x0))

;; p201562  support 5 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001813
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0)) (MnAgentOfPerson_Past $e0 $x0))

;; p201563  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1)) (MnAgentOfPerson_Patient $e0 $x0 $x1))

;; p201564  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001130
(Implication (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p201565  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfCardinalityNum $e0 $x0))

;; p201568  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfThing $e0 $x0))

;; p201570  support 5 (occ 5)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPatient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p201653  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1)) (MnHolder_Have_Past_Theme $e0 $x0 $x1))

;; p201668  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come) (Past $e0)) (MnAgent_Come_Past $e0 $x0))

;; p201669  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(Implication (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1)) (MnAgent_Past_Recipient $e0 $x0 $x1))

;; p201670  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(Implication (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1)) (MnAgent_Past_Source $e0 $x0 $x1))

;; p201671  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1)) (MnAgent_Past_Through $e0 $x0 $x1))

;; p201672  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go) (Past $e0)) (MnGoal_Go_Past $e0 $x0))

;; p201673  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnGoal_Past_Theme $e0 $x0 $x1))

;; p201676  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0)) (MnCapture_Past_Theme $e0 $x0))

;; p201677  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000609 tierB-000779 tierB-001306
(Implication (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0)) (MnFall_Past_Patient $e0 $x0))

;; p201678  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
(Implication (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0)) (MnKill_Past_Patient $e0 $x0))

;; p201679  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000964 tierB-001339
(Implication (And (Member $e0 make) (Past $e0) (Patient $e0 $x0)) (MnMake_Past_Patient $e0 $x0))

;; p201680  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(Implication (And (Member $e0 start) (Past $e0) (Patient $e0 $x0)) (MnStart_Past_Patient $e0 $x0))

;; p201681  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Past $e0) (Theme $e0 $e1)) (MnTry_Past_ThemeEv $e0 $e1))

;; p201728  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000156 tierB-000556 tierB-000745
(Implication (And (Agent $e0 $x0) (Can $e0)) (MnAgent_Can $e0 $x0))

;; p201729  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnAgentOfCardinalityNum $e0 $x0))

;; p201730  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001089 tierB-001283
(Implication (And (Agent $e0 $x0) (Member $e0 cause)) (MnAgent_Cause $e0 $x0))

;; p201731  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000298 tierB-000713
(Implication (And (Agent $e0 $x0) (Member $e0 leave)) (MnAgent_Leave $e0 $x0))

;; p201732  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000648 tierB-001125
(Implication (And (Agent $e0 $x0) (Member $e0 play)) (MnAgent_Play $e0 $x0))

;; p201733  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001205
(Implication (And (Agent $e0 $x0) (Member $e0 watch)) (MnAgent_Watch $e0 $x0))

;; p201736  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(Implication (And (Agent $e0 $x0) (Result $e0 $e1)) (MnAgent_ResultEv $e0 $e1 $x0))

;; p201738  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(Implication (And (Already $e0) (Patient $e0 $x0)) (MnAlready_Patient $e0 $x0))

;; p201741  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001334 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep)) (MnExperiencer_Sleep $e0 $x0))

;; p201742  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(Implication (And (Experiencer $e0 $x0) (Source $e0 $x1)) (MnExperiencer_Source $e0 $x0 $x1))

;; p201743  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000393 tierB-000412
(Implication (And (GroupOf $x0 person) (Patient $e0 $x0)) (MnPatientOfGroupOfPerson $e0 $x0))

;; p201744  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000162 tierB-000483 tierB-001069
(Implication (And (GroupOf $x0 thing) (Theme $e0 $x0)) (MnThemeOfGroupOfThing $e0 $x0))

;; p201746  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(Implication (And (In $e0 $x0) (Past $e0)) (MnIn_Past $e0 $x0))

;; p201748  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000517 tierB-001491
(Implication (And (Member $e0 change) (Patient $e0 $x0)) (MnChange_Patient $e0 $x0))

;; p201749  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
(Implication (And (Member $e0 contain) (Theme $e0 $x0)) (MnContain_Theme $e0 $x0))

;; p201750  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0)) (MnGet_Ongoing $e0))

;; p201751  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(Implication (And (Member $e0 get) (Patient $e0 $x0)) (MnGet_Patient $e0 $x0))

;; p201752  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000748
(Implication (And (Member $e0 get) (Result $e0 $e1)) (MnGet_ResultEv $e0 $e1))

;; p201754  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000425 tierB-000704
(Implication (And (Member $e0 leave) (Past $e0)) (MnLeave_Past $e0))

;; p201755  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000114 tierB-000339
(Implication (And (Member $e0 need) (Theme $e0 $e1)) (MnNeed_ThemeEv $e0 $e1))

;; p201756  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-001487
(Implication (And (Member $e0 open) (Patient $e0 $x0)) (MnOpen_Patient $e0 $x0))

;; p201757  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000326 tierB-000784 tierB-000975
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnSell_Theme $e0 $x0))

;; p201758  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001334 tierB-001753
(Implication (And (Member $e0 sleep) (Ongoing $e0)) (MnSleep_Ongoing $e0))

;; p201759  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
(Implication (And (Member $e0 stand) (Past $e0)) (MnStand_Past $e0))

;; p201760  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-001084
(Implication (And (Member $e0 study) (Ongoing $e0)) (MnStudy_Ongoing $e0))

;; p201761  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0)) (MnTurn_Past $e0))

;; p201762  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierB-000867 tierB-001515
(Implication (And (Member $e0 work) (Past $e0)) (MnWork_Past $e0))

;; p201763  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(Implication (And (Member $x0 new) (Theme $e0 $x0)) (MnThemeOfNew $e0 $x0))

;; p201764  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(Implication (And (Member $x0 sound) (Patient $e0 $x0)) (MnPatientOfSound $e0 $x0))

;; p201765  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000229 tierB-001066 tierB-001243
(Implication (And (PartOf $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPartOf $e0 $x0 $x1))

;; p201766  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(Implication (And (Past $e0) (Stimulus $e0 $e1)) (MnPast_StimulusEv $e0 $e1))

;; p201767  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(Implication (And (Past $e0) (Time $e0 (Year <num>))) (MnPast_Time(YearNum $e0))

;; p201768  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(Implication (And (Past $e0) (TimeAtMost $e0 (Year <num>))) (MnPast_TimeAtMost(YearNum $e0))

;; p201769  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000400 tierB-000781 tierB-001325
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnSource_Theme $e0 $x0 $x1))

;; p201816  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-000867 tierB-001782
;;   single atom; not a proposal (a one-atom pack is a rename)
(During $e0 $e1)

;; p201817  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000705 tierB-000959
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 book)

;; p201818  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001316 tierB-001457 tierB-001530
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 boy)

;; p201819  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001252 tierB-001284 tierB-001697
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 cloud)

;; p201820  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000085 tierB-000615 tierB-001450
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 flower)

;; p201821  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000378 tierB-000653
;;   single atom; not a proposal (a one-atom pack is a rename)
(Location $e0 here)

;; p201822  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001084
;;   single atom; not a proposal (a one-atom pack is a rename)
(Measure $e0 duration <num> year)

;; p201823  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001079
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 become)

;; p201825  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-000616
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 eat)

;; p201826  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 look)

;; p201827  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 provide)

;; p201828  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 say)

;; p201830  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-000792
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 stop)

;; p201831  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000782 tierB-001008
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 swim)

;; p201832  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000434 tierB-000667 tierB-000830
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 travel)

;; p201833  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000250 tierB-000626 tierB-000846
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 want)

;; p201834  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000748 tierB-000790 tierB-001594
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bad)

;; p201835  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000302 tierB-000931 tierB-001435
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bank)

;; p201836  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000541 tierB-001509
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 black)

;; p201837  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000937 tierB-001124
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 blue)

;; p201838  support 5 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000475 tierB-000541
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 box)

;; p201839  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000912 tierB-001821
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 corner)

;; p201840  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000838 tierB-000890 tierB-000922
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fire)

;; p201841  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000233 tierB-000369 tierB-000386
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fridge)

;; p201842  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-000861 tierB-000918
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 full)

;; p201843  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000122 tierB-000608 tierB-000728
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 language)

;; p201844  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000238 tierB-000808 tierB-000900
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 train)

;; p201845  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000138 tierB-001190 tierB-001459
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 way)

;; p201846  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000062 tierB-001163 tierB-001306
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wind)

;; p201847  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000090 tierB-000108 tierB-001275
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 world)

;; p201848  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   single atom; not a proposal (a one-atom pack is a rename)
(Of $x0 $x1)

;; p201849  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
;;   single atom; not a proposal (a one-atom pack is a rename)
(Over $e0 $x0)

;; p201850  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000089 tierB-000919 tierB-001016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Still $e0)

;; p201853  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 today)

;; p201855  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000224 tierB-000439 tierB-000726
;;   single atom; not a proposal (a one-atom pack is a rename)
(Yet $e0)

;; p201863  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Start_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201864  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201865  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0)) (MnStart_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p201866  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1)) (MnAgentOfPerson_Past_Patient $e0 $x0 $x1))

;; p201867  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001697
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p201869  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1)) (MnStart_Patient_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201871  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001394
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p202094  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000587 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0)) (MnAgentOfGroupOfChild_Ongoing $e0 $x0))

;; p202096  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(Implication (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0)) (MnAgentOfCat_Past $e0 $x0))

;; p202097  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1)) (MnAgentOfMan_Patient $e0 $x0 $x1))

;; p202098  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1)) (MnAgent_ThemeOfNew $e0 $x0 $x1))

;; p202099  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0)) (MnHave_ThemeOfCardinalityNum $e0 $x0))

;; p202100  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000133 tierB-000379 tierB-000797
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfCardinalityNum $e0 $x0))

;; p202102  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(Implication (And (Location $e0 $x0) (Member $x0 table) (Past $e0)) (MnLocationOfTable_Past $e0 $x0))

;; p202103  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-001487 tierB-001523
(Implication (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0)) (MnOpen_PatientOfDoor $e0 $x0))

;; p202104  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(Implication (And (Member $x0 new) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfNew $e0 $x0))

;; p202105  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-001384 tierB-001894
(Implication (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfSound $e0 $x0))

;; p202106  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(Implication (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfOf $e0 $x0 $x1))

;; p202107  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(Implication (And (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnPast_ThemeEvOfPast $e0 $e1))

;; p202108  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(Implication (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1)) (MnPast_PatientOfSubsetOf $e0 $x0 $x1))

;; p202265  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnAgent_Start_Past_ThemeEv $e0 $e1 $x0))

;; p202296  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(Implication (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1)) (MnAgent_Contain_Theme $e0 $x0 $x1))

;; p202297  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(Implication (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0)) (MnAgent_Jump_Past $e0 $x0))

;; p202300  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(Implication (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0)) (MnAgent_Swim_Ongoing $e0 $x0))

;; p202301  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(Implication (And (Already $e0) (Past $e0) (Patient $e0 $x0)) (MnAlready_Past_Patient $e0 $x0))

;; p202302  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001334 tierB-001753 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0)) (MnExperiencer_Sleep_Ongoing $e0 $x0))

;; p202303  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0)) (MnExperiencer_Ongoing_Past $e0 $x0))

;; p202304  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(Implication (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0)) (MnGoal_Walk_Past $e0 $x0))

;; p202305  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(Implication (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnGoal_Past_Patient $e0 $x0 $x1))

;; p202306  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000392 tierB-001143 tierB-001429
(Implication (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnInstrument_Past_Patient $e0 $x0 $x1))

;; p202307  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0)) (MnGet_Ongoing_Patient $e0 $x0))

;; p202308  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1)) (MnGet_Ongoing_ResultEv $e0 $e1))

;; p202309  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(Implication (And (Member $e0 make) (Past $e0) (Result $e0 $e1)) (MnMake_Past_ResultEv $e0 $e1))

;; p202311  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000987
(Implication (And (Member $e0 take) (Past $e0) (Theme $e0 $x0)) (MnTake_Past_Theme $e0 $x0))

;; p202312  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0)) (MnTurn_Past_Patient $e0 $x0))

;; p202313  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(Implication (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0)) (MnOngoing_Past_Theme $e0 $x0))

;; p202314  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1)) (MnPast_Patient_ThemeEv $e0 $e1 $x0))

;; p202315  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001325 tierB-001540
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnPast_Source_Theme $e0 $x0 $x1))

;; p202401  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(Implication (And (Agent $e0 $x0) (For $e0 $x1)) (MnAgent_For $e0 $x0 $x1))

;; p202402  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy)) (MnAgentOfGroupOfBoy $e0 $x0))

;; p202403  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(Implication (And (Agent $e0 $x0) (GroupOf $x0 student)) (MnAgentOfGroupOfStudent $e0 $x0))

;; p202405  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-001551
(Implication (And (Agent $e0 $x0) (Member $e0 eat)) (MnAgent_Eat $e0 $x0))

;; p202406  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
(Implication (And (Agent $e0 $x0) (Member $e0 fly)) (MnAgent_Fly $e0 $x0))

;; p202408  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
(Implication (And (Agent $e0 $x0) (Member $e0 provide)) (MnAgent_Provide $e0 $x0))

;; p202411  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $e0 try)) (MnAgent_Try $e0 $x0))

;; p202412  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(Implication (And (Agent $e0 $x0) (Member $e0 use)) (MnAgent_Use $e0 $x0))

;; p202414  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $x0 company)) (MnAgentOfCompany $e0 $x0))

;; p202415  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(Implication (And (Agent $e0 $x0) (Over $e0 $x1)) (MnAgent_Over $e0 $x0 $x1))

;; p202417  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(Implication (And (Before $e0 $e1) (Past $e1)) (MnBeforeEvOfPast_p202417 $e0 $e1))

;; p202418  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(Implication (And (Can $e0) (Patient $e0 $x0)) (MnCan_Patient $e0 $x0))

;; p202419  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000745
(Implication (And (Can $e0) (Theme $e0 $x0)) (MnCan_Theme $e0 $x0))

;; p202420  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(Implication (And (Cardinality $x0 <num>) (LocatedIn $x0 $x1)) (MnCardinalityNum_LocatedIn $x0 $x1))

;; p202421  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(Implication (And (During $e0 $x0) (Past $e0)) (MnDuring_Past $e0 $x0))

;; p202422  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(Implication (And (Experiencer $e0 $x0) (Like $e0 $x1)) (MnExperiencer_Like $e0 $x0 $x1))

;; p202423  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000174 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Member $e0 need)) (MnExperiencer_Need $e0 $x0))

;; p202424  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(Implication (And (Experiencer $e0 $x0) (Possession $x0 $x1)) (MnExperiencerOfPossession $e0 $x0 $x1))

;; p202425  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Probably $e0)) (MnExperiencer_Probably $e0 $x0))

;; p202426  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Time $e0 now)) (MnExperiencer_TimeNow $e0 $x0))

;; p202428  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000615 tierB-000760 tierB-001208
(Implication (And (LocatedIn $x0 $x1) (Member $x1 garden)) (MnLocatedInOfGarden $x0 $x1))

;; p202429  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(Implication (And (LocatedIn $x0 $x1) (PartOf $x1 $x2)) (MnLocatedInOfPartOf $x0 $x1 $x2))

;; p202430  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(Implication (And (LocatedIn $x0 $x1) (Patient $e0 $x0)) (MnPatientOfLocatedIn $e0 $x0 $x1))

;; p202431  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnLocation_Walk $e0 $x0))

;; p202433  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(Implication (And (Location $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfLocation $e1 $e0 $x0))

;; p202434  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001582
(Implication (And (Member $e0 become) (Patient $e0 $x0)) (MnBecome_Patient $e0 $x0))

;; p202435  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-000849
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_Theme $e0 $x0))

;; p202436  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0)) (MnCause_Past $e0))

;; p202437  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(Implication (And (Member $e0 decide) (Past $e0)) (MnDecide_Past $e0))

;; p202438  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001520 tierB-001721 tierB-001735
(Implication (And (Member $e0 do) (Patient $e0 $x0)) (MnDo_Patient $e0 $x0))

;; p202439  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
(Implication (And (Member $e0 find) (Past $e0)) (MnFind_Past $e0))

;; p202441  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
(Implication (And (Member $e0 pass) (Past $e0)) (MnPass_Past $e0))

;; p202442  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
(Implication (And (Member $e0 receive) (Past $e0)) (MnReceive_Past $e0))

;; p202443  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000607 tierB-001436 tierB-001566
(Implication (And (Member $e0 require) (Theme $e0 $x0)) (MnRequire_Theme $e0 $x0))

;; p202444  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
(Implication (And (Member $e0 say) (Past $e0)) (MnSay_Past $e0))

;; p202445  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-001515
(Implication (And (Member $e0 stop) (Past $e0)) (MnStop_Past $e0))

;; p202447  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0)) (MnTry_Ongoing $e0))

;; p202448  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Result $e0 $e1)) (MnTurn_ResultEv $e0 $e1))

;; p202449  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(Implication (And (Member $e0 use) (To $e0 $e1)) (MnUse_ToEv $e0 $e1))

;; p202450  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Member $e0 walk) (Ongoing $e0)) (MnWalk_Ongoing $e0))

;; p202451  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001005 tierB-001687
(Implication (And (Member $x0 house) (Theme $e0 $x0)) (MnThemeOfHouse $e0 $x0))

;; p202452  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000176 tierB-000277 tierB-001476
(Implication (And (Member $x0 tree) (Patient $e0 $x0)) (MnPatientOfTree $e0 $x0))

;; p202454  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000517 tierB-001891 tierB-001910
(Implication (And (Ongoing $e0) (Probably $e0)) (MnOngoing_Probably $e0))

;; p202455  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(Implication (And (Ongoing $e0) (Source $e0 $x0)) (MnOngoing_Source $e0 $x0))

;; p202456  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(Implication (And (Ongoing $e0) (Theme $e0 $e1)) (MnOngoing_ThemeEv $e0 $e1))

;; p202457  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Over $e0 $x0) (Past $e0)) (MnOver_Past $e0 $x0))

;; p202459  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(Implication (And (Past $e0) (TimeAtLeast $e0 (Year <num>))) (MnPast_TimeAtLeast(YearNum $e0))

;; p202462  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(Implication (And (Theme $e0 $e1) (Theme $e1 $x0)) (MnThemeEvOfTheme $e0 $e1 $x0))

;; p202464  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(Implication (And (Theme $e0 $x0) (To $e0 $e1)) (MnTheme_ToEv $e0 $e1 $x0))

;; p202555  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001130 tierB-001222 tierB-001531
;;   single atom; not a proposal (a one-atom pack is a rename)
(Before $x0 $e0)

;; p202556  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000407 tierB-000518 tierB-000604
;;   single atom; not a proposal (a one-atom pack is a rename)
(Degree $x0 quantity excessive)

;; p202559  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000238 tierB-000313
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> day)

;; p202560  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000938
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $e0 $e1)

;; p202561  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000308 tierB-000555 tierB-001455
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $x0 $e0)

;; p202562  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000463 tierB-000513 tierB-001553
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 day)

;; p202563  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 girl)

;; p202564  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000098 tierB-000832 tierB-001246
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 leaf)

;; p202565  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000243 tierB-000277 tierB-001068
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 man)

;; p202566  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000194 tierB-000794 tierB-001080
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 pupil)

;; p202567  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000225 tierB-000533 tierB-001251
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 scientist)

;; p202568  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000274 tierB-001058 tierB-001695
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 soldier)

;; p202569  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000518 tierB-000972 tierB-001495
;;   single atom; not a proposal (a one-atom pack is a rename)
(LocatedIn $x0 here)

;; p202570  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001496 tierB-001572
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 immediately)

;; p202571  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000407 tierB-000947
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 often)

;; p202572  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000921 tierB-001766
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 well)

;; p202573  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001440
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 arrive)

;; p202575  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000702 tierB-000809 tierB-001166
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cover)

;; p202576  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000502 tierB-000738
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cry)

;; p202578  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000163 tierB-000450 tierB-000556
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 enter)

;; p202581  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000026 tierB-000231 tierB-000584
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 follow)

;; p202582  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000999 tierB-001238
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 good)

;; p202583  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000087 tierB-001363 tierB-001708
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 happen)

;; p202584  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 increase)

;; p202586  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000040 tierB-000105 tierB-001086
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 lead)

;; p202588  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001683
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 present)

;; p202589  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000168 tierB-000916
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 ready)

;; p202592  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-000339 tierB-001153
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 run)

;; p202593  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000864 tierB-000910 tierB-000915
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 serve)

;; p202594  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000624 tierB-001536 tierB-001621
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 war)

;; p202595  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000971 tierB-001004 tierB-001601
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 write)

;; p202596  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000376 tierB-000678 tierB-001503
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beauty)

;; p202597  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000712 tierB-001430 tierB-001528
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bus)

;; p202598  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000794 tierB-000814 tierB-001612
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 class)

;; p202599  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000504 tierB-000849 tierB-001177
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 computer)

;; p202600  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001052 tierB-001108 tierB-001169
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 crowd)

;; p202601  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000049 tierB-000339 tierB-000666
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 doctor)

;; p202602  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000319 tierB-000783 tierB-001280
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 girl)

;; p202603  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000474 tierB-001308
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ground)

;; p202604  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000149 tierB-000767 tierB-000836
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 hotel)

;; p202605  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-001234 tierB-001246
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ivy)

;; p202606  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001114 tierB-001208 tierB-001480
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 lady)

;; p202607  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000036 tierB-000783 tierB-001280
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 little)

;; p202608  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000119 tierB-000244 tierB-000574
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 matter)

;; p202609  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000524 tierB-001257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 middle)

;; p202610  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000520 tierB-001253 tierB-001555
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 movie)

;; p202611  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000567 tierB-000932 tierB-000992
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 original)

;; p202612  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000646 tierB-001152 tierB-001381
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 party)

;; p202613  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000876 tierB-001070 tierB-001077
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 picture)

;; p202614  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 plane)

;; p202615  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000832 tierB-001268
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 red)

;; p202616  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000416 tierB-000468 tierB-000470
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 river)

;; p202617  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000134 tierB-000767 tierB-001296
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sea)

;; p202618  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000100 tierB-000605 tierB-000835
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ship)

;; p202619  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000154 tierB-000383 tierB-000445
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 snow)

;; p202620  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000768 tierB-001156 tierB-001556
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 song)

;; p202621  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000218 tierB-000324 tierB-001044
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 store)

;; p202622  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000825 tierB-001218 tierB-001838
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sun)

;; p202623  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000932 tierB-001134 tierB-001447
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 system)

;; p202624  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000116 tierB-001317 tierB-001706
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 village)

;; p202625  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001204 tierB-001324 tierB-001444
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 war)

;; p202626  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000265 tierB-000984 tierB-001161
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 windshield)

;; p202627  support 4 (occ 4)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000218 tierB-000969 tierB-000978
;;   single atom; not a proposal (a one-atom pack is a rename)
(Might $e0)

;; p202628  support 4 (occ 4)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000450 tierB-000971 tierB-001687
;;   single atom; not a proposal (a one-atom pack is a rename)
(Permitted $e0)

;; p202629  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000799 tierB-001111 tierB-001628
;;   single atom; not a proposal (a one-atom pack is a rename)
(ProportionOf $x0 $x1 most)

;; p202630  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-000917
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 night)

;; p202631  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001171 tierB-001275 tierB-001387
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 this_year)

;; p202632  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000212 tierB-000686 tierB-001588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 tonight)

;; p202634  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000913 tierB-001673
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $x0 $x1)

;; p202662  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Begin_ThemeEvOfOngoing $e0 $e1 $x0))

;; p202663  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0)) (MnBegin_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p202664  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0)) (MnBegin_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p202665  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfNew $e0 $x0 $x1))

;; p202666  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p202668  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0)) (MnGet_Ongoing_ResultEvOfExperiencer $e1 $e0 $x0))

;; p202674  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfPatient $e0 $e1 $x0))

;; p202675  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(Implication (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnStop_Past_ThemeEvOfPast $e0 $e1))

;; p202677  support 3 (occ 3)  size 4  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPast_Patient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p203242  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000738 tierB-000772 tierB-001534
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0)) (MnAgentOfCardinalityNum_Past $e0 $x0))

;; p203243  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p203247  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1)) (MnAgent_ResultEvOfExperiencer $e0 $e1 $x0 $x1))

;; p203248  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001457 tierB-001530 tierB-001840
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0)) (MnAgentOfGroupOfBoy_Ongoing $e0 $x0))

;; p203249  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1)) (MnAgentOfGroupOfChild_Location $e0 $x0 $x1))

;; p203250  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000648 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play)) (MnAgentOfGroupOfChild_Play $e0 $x0))

;; p203251  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000942 tierB-001283 tierB-001933
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfLocation $e0 $e1 $x0 $x1))

;; p203253  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0)) (MnTry_ThemeEvOfAgent $e1 $e0 $x0))

;; p203254  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001932
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_Past $e0 $x0))

;; p203255  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001773 tierB-001801 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Past $e0)) (MnAgentOfMan_Past $e0 $x0))

;; p203256  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(Implication (And (Agent $e0 $x0) (Member $x0 plane) (Past $e0)) (MnAgentOfPlane_Past $e0 $x0))

;; p203257  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000978 tierB-001661 tierB-001881
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1)) (MnAgentOfThing_Theme $e0 $x0 $x1))

;; p203258  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1)) (MnAgent_PatientOfDoor $e0 $x0 $x1))

;; p203259  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001066 tierB-001243 tierB-001586
(Implication (And (Agent $e0 $x0) (PartOf $x1 $x2) (Theme $e0 $x1)) (MnAgent_ThemeOfPartOf $e0 $x0 $x1 $x2))

;; p203260  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(Implication (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0)) (MnPast_StimulusEvOfAgent $e1 $e0 $x0))

;; p203261  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0)) (MnPast_ToEvOfAgent $e1 $e0 $x0))

;; p203264  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p203269  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0)) (MnLeave_ResultEvOfExperiencer $e1 $e0 $x0))

;; p203271  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0)) (MnTurn_ResultEvOfExperiencer $e1 $e0 $x0))

;; p203274  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000412 tierB-000771
(Implication (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfGroupOfPerson $e0 $x0))

;; p203275  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(Implication (And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfLocatedIn $e0 $x0 $x1))

;; p203276  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house)) (MnLocationOfHouse_Live $e0 $x0))

;; p203278  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(Implication (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfFire $e0 $x0))

;; p203279  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(Implication (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfPicture $e0 $x0))

;; p203280  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001520 tierB-001622 tierB-001761
(Implication (And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0)) (MnObligated_PatientOfThing $e0 $x0))

;; p203281  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnOngoing_ThemeEvOfPatient $e0 $e1 $x0))

;; p203282  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(Implication (And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfRecipient $e0 $e1 $x0))

;; p203283  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(Implication (And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0)) (MnPast_ThemeEvOfTheme $e0 $e1 $x0))

;; p203527  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Implication (And (Inheritance living_room room) (Member $x0 living_room)) (MnLivingRoomOfInheritanceRoom $x0))

;; p203575  support 3 (occ 3)  size 1  root dung_beetle (constant)  depth 1
;;   e.g. tierB-000059 tierB-001735 tierB-001833
;;   single atom; not a proposal (a one-atom pack is a rename)
(Inheritance dung_beetle beetle)

;; p203608  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0)) (MnAgent_Goal_Come_Past $e0 $x0 $x1))

;; p203609  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnAgent_Begin_Past_ThemeEv $e0 $e1 $x0))

;; p203610  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(Implication (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1)) (MnAgent_Capture_Past_Theme $e0 $x0 $x1))

;; p203611  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001961
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Past_Theme $e0 $x0 $x1))

;; p203612  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0)) (MnExperiencer_Location_Ongoing_Past $e0 $x0 $x1))

;; p203613  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnGet_Ongoing_Patient_ResultEv $e0 $e1 $x0))

;; p203676  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(Implication (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1)) (MnAgent_Future_Theme $e0 $x0 $x1))

;; p203678  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2)) (MnAgent_Goal_Theme $e0 $x0 $x1 $x2))

;; p203679  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(Implication (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0)) (MnAgent_GoalHome_Past $e0 $x0))

;; p203680  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2)) (MnAgent_Location_Patient $e0 $x0 $x1 $x2))

;; p203685  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0)) (MnAgent_Cause_Past $e0 $x0))

;; p203686  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(Implication (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0)) (MnAgent_Draw_Past $e0 $x0))

;; p203687  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001182 tierB-001457 tierB-001754
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0)) (MnAgent_Make_Ongoing $e0 $x0))

;; p203688  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(Implication (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0)) (MnAgent_Play_Ongoing $e0 $x0))

;; p203689  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Past $e0)) (MnAgent_Try_Past $e0 $x0))

;; p203690  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1)) (MnAgent_Try_ThemeEv $e0 $e1 $x0))

;; p203691  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
(Implication (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1)) (MnAgent_Watch_Theme $e0 $x0 $x1))

;; p203692  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0)) (MnAgent_Over_Past $e0 $x0 $x1))

;; p203693  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1)) (MnAgent_Past_ToEv $e0 $e1 $x0))

;; p203694  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1)) (MnAgent_Patient_ResultEv $e0 $e1 $x0 $x1))

;; p203695  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfAgent-Patient $e1 $e0 $x0 $x1))

;; p203696  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-000455 tierB-001496
(Implication (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1)) (MnExperiencer_Need_ThemeEv $e0 $e1 $x0))

;; p203697  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(Implication (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0)) (MnGoal_MannerQuickly_Past $e0 $x0))

;; p203699  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0)) (MnLocation_Walk_Ongoing $e0 $x0))

;; p203700  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Past $e0)) (MnLocation_Walk_Past $e0 $x0))

;; p203701  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnLocation_Ongoing_Patient $e0 $x0 $x1))

;; p203702  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; p203703  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0)) (MnCause_Past_Patient $e0 $x0))

;; p203704  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(Implication (And (Member $e0 create) (Past $e0) (Patient $e0 $x0)) (MnCreate_Past_Patient $e0 $x0))

;; p203705  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(Implication (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0)) (MnEat_Past_Patient $e0 $x0))

;; p203706  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(Implication (And (Member $e0 fall) (Past $e0) (Source $e0 $x0)) (MnFall_Past_Source $e0 $x0))

;; p203707  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(Implication (And (Member $e0 find) (Past $e0) (Theme $e0 $x0)) (MnFind_Past_Theme $e0 $x0))

;; p203709  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(Implication (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0)) (MnIncrease_Past_Patient $e0 $x0))

;; p203710  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1)) (MnLeave_Patient_ResultEv $e0 $e1 $x0))

;; p203711  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000951 tierB-001182 tierB-001457
(Implication (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0)) (MnMake_Ongoing_Patient $e0 $x0))

;; p203712  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(Implication (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1)) (MnMake_Ongoing_ResultEv $e0 $e1))

;; p203713  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(Implication (And (Member $e0 present) (Past $e0) (Theme $e0 $x0)) (MnPresent_Past_Theme $e0 $x0))

;; p203714  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(Implication (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0)) (MnReceive_Past_Theme $e0 $x0))

;; p203715  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(Implication (And (Member $e0 stand) (Ongoing $e0) (Past $e0)) (MnStand_Ongoing_Past $e0))

;; p203716  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(Implication (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0)) (MnStick_Past_Patient $e0 $x0))

;; p203718  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0) (Past $e0)) (MnTry_Ongoing_Past $e0))

;; p203719  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-001675
(Implication (And (Member $e0 turn) (Past $e0) (Result $e0 $e1)) (MnTurn_Past_ResultEv $e0 $e1))

;; p203720  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1)) (MnTurn_Patient_ResultEv $e0 $e1 $x0))

;; p203721  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(Implication (And (Member $e0 walk) (Ongoing $e0) (Past $e0)) (MnWalk_Ongoing_Past $e0))

;; p203722  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(Implication (And (Ongoing $e0) (Past $e0) (Patient $e0 $x0)) (MnOngoing_Past_Patient $e0 $x0))

;; p203723  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(Implication (And (Ongoing $e0) (Past $e0) (Result $e0 $e1)) (MnOngoing_Past_ResultEv $e0 $e1))

;; p203901  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(Implication (And (Agent $e0 $e1) (Theme $e1 $x0)) (MnAgentEvOfTheme $e0 $e1 $x0))

;; p203903  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000225 tierB-001251 tierB-001984
(Implication (And (Agent $e0 $x0) (GroupOf $x0 scientist)) (MnAgentOfGroupOfScientist $e0 $x0))

;; p203904  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(Implication (And (Agent $e0 $x0) (GroupOf $x0 soldier)) (MnAgentOfGroupOfSoldier $e0 $x0))

;; p203905  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-001440 tierB-001992
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_Arrive $e0 $x0))

;; p203908  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000950 tierB-001205 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $e0 close)) (MnAgent_Close $e0 $x0))

;; p203910  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001183 tierB-001496 tierB-001628
(Implication (And (Agent $e0 $x0) (Member $e0 go)) (MnAgent_Go $e0 $x0))

;; p203911  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-001153 tierB-001563
(Implication (And (Agent $e0 $x0) (Member $e0 run)) (MnAgent_Run $e0 $x0))

;; p203912  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000225 tierB-000710 tierB-001984
(Implication (And (Agent $e0 $x0) (Member $e0 study)) (MnAgent_Study $e0 $x0))

;; p203913  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000942 tierB-000978 tierB-001726
(Implication (And (Agent $e0 $x0) (Member $e0 take)) (MnAgent_Take $e0 $x0))

;; p203914  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000550 tierB-001219 tierB-001666
(Implication (And (Agent $e0 $x0) (Member $e0 talk)) (MnAgent_Talk $e0 $x0))

;; p203915  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000324 tierB-001219
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnAgent_Walk $e0 $x0))

;; p203916  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001134 tierB-001813 tierB-001873
(Implication (And (Agent $e0 $x0) (Member $e0 work)) (MnAgent_Work $e0 $x0))

;; p203917  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001430 tierB-001528 tierB-001739
(Implication (And (Agent $e0 $x0) (Member $x0 bus)) (MnAgentOfBus $e0 $x0))

;; p203918  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000049 tierB-000339 tierB-000793
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnAgentOfDoctor $e0 $x0))

;; p203919  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001086 tierB-001551 tierB-001892
(Implication (And (Agent $e0 $x0) (Member $x0 dog)) (MnAgentOfDog $e0 $x0))

;; p203921  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(Implication (And (Agent $e0 $x0) (Obligated $e0)) (MnAgent_Obligated $e0 $x0))

;; p203923  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(Implication (And (Agent $e0 $x0) (SubsetOf $x0 $x1)) (MnAgentOfSubsetOf $e0 $x0 $x1))

;; p203926  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(Implication (And (Agent $e0 baya) (Past $e0)) (MnAgentBaya_Past $e0))

;; p203927  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(Implication (And (Agent $e0 daniel) (Past $e0)) (MnAgentDaniel_Past $e0))

;; p203928  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Ongoing $e0)) (MnAgentDavid_Ongoing $e0))

;; p203929  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Past $e0)) (MnAgentDavid_Past $e0))

;; p203930  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(Implication (And (Agent $e0 felix) (Past $e0)) (MnAgentFelix_Past $e0))

;; p203931  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(Implication (And (Agent $e0 mark) (Past $e0)) (MnAgentMark_Past $e0))

;; p203932  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(Implication (And (Agent $e0 matthew) (Past $e0)) (MnAgentMatthew_Past $e0))

;; p203933  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(Implication (And (Agent $e0 michael) (Past $e0)) (MnAgentMichael_Past $e0))

;; p203934  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(Implication (And (Agent $e0 pietro) (Past $e0)) (MnAgentPietro_Past $e0))

;; p203935  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(Implication (And (Agent $e0 ziri) (Ongoing $e0)) (MnAgentZiri_Ongoing $e0))

;; p203936  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(Implication (And (At $e0 $x0) (Past $e0)) (MnAt_Past $e0 $x0))

;; p203938  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(Implication (And (Before $x0 $e0) (Past $e0)) (MnBeforeEvOfPast_p203938 $x0 $e0))

;; p203939  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-001094
(Implication (And (Can $e0) (Member $e0 help)) (MnCan_Help $e0))

;; p203940  support 3 (occ 3)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000299 tierB-001094 tierB-001767
(Implication (And (Can $e0) (Past $e0)) (MnCan_Past $e0))

;; p203941  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 girl)) (MnCardinalityNum_GroupOfGirl $x0))

;; p203942  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e0)) (MnDuringEv_Past $e0 $e1))

;; p203943  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e1)) (MnDuringEvOfPast $e0 $e1))

;; p203944  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(Implication (And (Experiencer $e0 $x0) (Future $e0)) (MnExperiencer_Future $e0 $x0))

;; p203945  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001496 tierB-001685 tierB-001945
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 child)) (MnExperiencerOfGroupOfChild $e0 $x0))

;; p203946  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(Implication (And (Experiencer $e0 $x0) (Member $e0 beautiful)) (MnExperiencer_Beautiful $e0 $x0))

;; p203947  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(Implication (And (Experiencer $e0 $x0) (Member $e0 look)) (MnExperiencer_Look $e0 $x0))

;; p203948  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000419 tierB-001515
(Implication (And (Experiencer $e0 $x0) (Member $e0 work)) (MnExperiencer_Work $e0 $x0))

;; p203949  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000250 tierB-001003 tierB-001334
(Implication (And (Experiencer $e0 $x0) (Member $x0 cat)) (MnExperiencerOfCat $e0 $x0))

;; p203950  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Member $x0 door)) (MnExperiencerOfDoor $e0 $x0))

;; p203951  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000370 tierB-000842 tierB-000960
(Implication (And (Experiencer $e0 $x0) (Member $x0 thing)) (MnExperiencerOfThing $e0 $x0))

;; p203952  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000495 tierB-000565 tierB-000748
(Implication (And (Experiencer $e0 $x0) (Member $x0 weather)) (MnExperiencerOfWeather $e0 $x0))

;; p203953  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(Implication (And (Experiencer $e0 $x0) (Time $e0 today)) (MnExperiencer_TimeToday $e0 $x0))

;; p203954  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(Implication (And (For $e0 $e1) (Past $e0)) (MnForEv_Past $e0 $e1))

;; p203955  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(Implication (And (For $e0 $x0) (Ongoing $e0)) (MnFor_Ongoing $e0 $x0))

;; p203956  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(Implication (And (For $e0 $x0) (Past $e0)) (MnFor_Past $e0 $x0))

;; p203957  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(Implication (And (Future $e0) (Time $e0 tomorrow)) (MnFuture_TimeTomorrow $e0))

;; p203960  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(Implication (And (Goal $e0 bed) (Member $e0 go)) (MnGoalBed_Go $e0))

;; p203962  support 3 (occ 3)  size 2  root (LocatedIn (constant)  depth 2
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(Implication (And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1))) (MnPastOfGroupOfPerson (LocatedIn $x0 $x1))

;; p203963  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001721 tierB-001816 tierB-001893
(Implication (And (GroupOf $x0 thing) (Patient $e0 $x0)) (MnPatientOfGroupOfThing $e0 $x0))

;; p203964  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(Implication (And (Like $e0 $x0) (Member $e0 look)) (MnLike_Look $e0 $x0))

;; p203965  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(Implication (And (LocatedIn $x0 $x1) (Location $e0 $x0)) (MnLocationOfLocatedIn $e0 $x0 $x1))

;; p203966  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000153 tierB-000546 tierB-000680
(Implication (And (LocatedIn $x0 $x1) (Member $x1 city)) (MnLocatedInOfCity $x0 $x1))

;; p203967  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(Implication (And (LocatedIn $x0 $x1) (Member $x1 full)) (MnLocatedInOfFull $x0 $x1))

;; p203968  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000619 tierB-001410 tierB-001492
(Implication (And (LocatedIn $x0 $x1) (Member $x1 table)) (MnLocatedInOfTable $x0 $x1))

;; p203969  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(Implication (And (LocatedIn $x0 $x1) (Theme $e0 $x0)) (MnThemeOfLocatedIn $e0 $x0 $x1))

;; p203971  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(Implication (And (Location $e0 $x0) (PartOf $x0 $x1)) (MnLocationOfPartOf $e0 $x0 $x1))

;; p203972  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Past $e0)) (MnLocationHere_Past $e0))

;; p203973  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Patient $e0 $x0)) (MnLocationHere_Patient $e0 $x0))

;; p203974  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001572 tierB-001743
(Implication (And (Manner $e0 immediately) (Past $e0)) (MnMannerImmediately_Past $e0))

;; p203975  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(Implication (And (Measure $e0 duration <num> year) (Past $e0)) (MnMeasureDurationNumYear_Past $e0))

;; p203976  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(Implication (And (Member $e0 approve) (Theme $e0 $x0)) (MnApprove_Theme $e0 $x0))

;; p203977  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001992
(Implication (And (Member $e0 arrive) (Past $e0)) (MnArrive_Past $e0))

;; p203978  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
(Implication (And (Member $e0 bear) (Past $e0)) (MnBear_Past $e0))

;; p203979  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001079 tierB-001582
(Implication (And (Member $e0 become) (Past $e0)) (MnBecome_Past $e0))

;; p203980  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierB-001817
(Implication (And (Member $e0 become) (Result $e0 $e1)) (MnBecome_ResultEv $e0 $e1))

;; p203981  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000182 tierB-001048 tierB-001394
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnBegin_Patient $e0 $x0))

;; p203982  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
(Implication (And (Member $e0 break_out) (Past $e0)) (MnBreakOut_Past $e0))

;; p203983  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(Implication (And (Member $e0 build) (Patient $e0 $x0)) (MnBuild_Patient $e0 $x0))

;; p203986  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001217 tierB-001803
(Implication (And (Member $e0 change) (Past $e0)) (MnChange_Past $e0))

;; p203987  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000950 tierB-001926
(Implication (And (Member $e0 close) (Patient $e0 $x0)) (MnClose_Patient $e0 $x0))

;; p203988  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001697 tierB-001949
(Implication (And (Member $e0 come) (Patient $e0 $x0)) (MnCome_Patient $e0 $x0))

;; p203989  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001774 tierB-001949
(Implication (And (Member $e0 come) (Source $e0 $x0)) (MnCome_Source $e0 $x0))

;; p203990  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000809 tierB-001166 tierB-001541
(Implication (And (Member $e0 cover) (Patient $e0 $x0)) (MnCover_Patient $e0 $x0))

;; p203996  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-001905
(Implication (And (Member $e0 fall) (Ongoing $e0)) (MnFall_Ongoing $e0))

;; p203999  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000418 tierB-000672 tierB-001325
(Implication (And (Member $e0 get) (Theme $e0 $x0)) (MnGet_Theme $e0 $x0))

;; p204000  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000858 tierB-001094
(Implication (And (Member $e0 help) (Past $e0)) (MnHelp_Past $e0))

;; p204001  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
(Implication (And (Member $e0 hold_up) (Past $e0)) (MnHoldUp_Past $e0))

;; p204006  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000704 tierB-000713 tierB-001350
(Implication (And (Member $e0 leave) (Theme $e0 $x0)) (MnLeave_Theme $e0 $x0))

;; p204007  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
(Implication (And (Member $e0 pick_up) (Past $e0)) (MnPickUp_Past $e0))

;; p204009  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000648 tierB-000816
(Implication (And (Member $e0 play) (Theme $e0 $x0)) (MnPlay_Theme $e0 $x0))

;; p204012  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(Implication (And (Member $e0 read) (Theme $e0 $x0)) (MnRead_Theme $e0 $x0))

;; p204014  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-001153 tierB-001563
(Implication (And (Member $e0 run) (Past $e0)) (MnRun_Past $e0))

;; p204015  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001626
(Implication (And (Member $e0 say) (Theme $e0 $x0)) (MnSay_Theme $e0 $x0))

;; p204016  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
(Implication (And (Member $e0 sing) (Past $e0)) (MnSing_Past $e0))

;; p204017  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
(Implication (And (Member $e0 solve) (Patient $e0 $x0)) (MnSolve_Patient $e0 $x0))

;; p204022  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000327 tierB-000550 tierB-001666
(Implication (And (Member $e0 talk) (Past $e0)) (MnTalk_Past $e0))

;; p204023  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-000995 tierB-001618
(Implication (And (Member $e0 travel) (Past $e0)) (MnTravel_Past $e0))

;; p204024  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000651 tierB-001720 tierB-001800
(Implication (And (Member $e0 watch) (Past $e0)) (MnWatch_Past $e0))

;; p204026  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(Implication (And (Member $x0 bad) (Patient $e0 $x0)) (MnPatientOfBad $e0 $x0))

;; p204027  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(Implication (And (Member $x0 big) (Patient $e0 $x0)) (MnPatientOfBig $e0 $x0))

;; p204028  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000937 tierB-001124 tierB-001940
(Implication (And (Member $x0 blue) (Member $x0 sky)) (MnBlue_Sky $x0))

;; p204029  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(Implication (And (Member $x0 bottom) (PartOf $x0 $x1)) (MnBottom_PartOf $x0 $x1))

;; p204031  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000371 tierB-000471 tierB-001887
(Implication (And (Member $x0 house) (Patient $e0 $x0)) (MnPatientOfHouse $e0 $x0))

;; p204032  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000685 tierB-001106 tierB-001756
(Implication (And (Member $x0 light) (Patient $e0 $x0)) (MnPatientOfLight $e0 $x0))

;; p204034  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000935 tierB-001202 tierB-001910
(Implication (And (Member $x0 problem) (Patient $e0 $x0)) (MnPatientOfProblem $e0 $x0))

;; p204035  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001642 tierB-001920 tierB-001997
(Implication (And (Member $x0 room) (Patient $e0 $x0)) (MnPatientOfRoom $e0 $x0))

;; p204036  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(Implication (And (Member $x0 thing) (Stimulus $e0 $x0)) (MnStimulusOfThing $e0 $x0))

;; p204037  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000517 tierB-000748 tierB-001491
(Implication (And (Member $x0 weather) (Patient $e0 $x0)) (MnPatientOfWeather $e0 $x0))

;; p204038  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(Implication (And (Might $e0) (Patient $e0 $x0)) (MnMight_Patient $e0 $x0))

;; p204039  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000797 tierB-001452 tierB-001809
(Implication (And (Only $x0 $e0) (Past $e0)) (MnOnlyEvOfPast $x0 $e0))

;; p204041  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(Implication (And (PartOf $x0 $x1) (Patient $e0 $x0)) (MnPatientOfPartOf $e0 $x0 $x1))

;; p204043  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-001894
(Implication (And (Past $e0) (Time $e0 night)) (MnPast_TimeNight $e0))

;; p204044  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000631 tierB-000808 tierB-001762
(Implication (And (Past $e0) (Time $e0 today)) (MnPast_TimeToday $e0))

;; p204045  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(Implication (And (Past $e0) (With $e0 $x0)) (MnPast_With $e0 $x0))

;; p204046  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(Implication (And (Patient $e0 $x0) (Probably $e0)) (MnPatient_Probably $e0 $x0))

;; p204047  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(Implication (And (Patient $e0 $x0) (To $e1 $e0)) (MnToEvOfPatient $e1 $e0 $x0))

;; p204050  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001177 tierB-001566 tierB-001922
(Implication (And (Theme $e0 $x0) (To $e0 $x1)) (MnTheme_To $e0 $x0 $x1))

;; p204051  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(Implication (And (Theme $e0 $x0) (To $e1 $e0)) (MnToEvOfTheme $e1 $e0 $x0))

;; p204215  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000248 tierB-000343 tierB-000786
;;   single atom; not a proposal (a one-atom pack is a rename)
(Against $e0 $x0)

;; p204216  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001044 tierB-001117 tierB-001767
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 adriano)

;; p204220  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000524 tierB-000563
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 elias)

;; p204222  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000987 tierB-001675
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 gustavo)

;; p204223  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000406 tierB-000412 tierB-000564
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 ivan)

;; p204224  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000327 tierB-001449
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 linda)

;; p204226  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000450 tierB-000588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 martino)

;; p204227  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000021 tierB-000048
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 mary)

;; p204229  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000219 tierB-000257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 mennad)

;; p204232  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000137 tierB-000240 tierB-000273
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 william)

;; p204235  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000374 tierB-001696 tierB-001867
;;   single atom; not a proposal (a one-atom pack is a rename)
(Beneficiary $e0 $x0)

;; p204236  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000463 tierB-001314 tierB-001337
;;   single atom; not a proposal (a one-atom pack is a rename)
(But $e0 $e1)

;; p204237  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-000964 tierB-001832
;;   single atom; not a proposal (a one-atom pack is a rename)
(But $e0 $x0)

;; p204238  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000917 tierB-001051
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> week)

;; p204239  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000393 tierB-000559 tierB-001967
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> year)

;; p204240  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001016 tierB-001523 tierB-001966
;;   single atom; not a proposal (a one-atom pack is a rename)
(Experiencer $e0 $e1)

;; p204243  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001260 tierB-001730
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 city)

;; p204244  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000335 tierB-000338 tierB-000815
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 cookie)

;; p204245  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-001519 tierB-001955
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 dish)

;; p204246  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000066 tierB-000267 tierB-000550
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 friend)

;; p204247  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000120 tierB-000409 tierB-001591
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 measure)

;; p204248  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000193 tierB-000414 tierB-001479
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 noise)

;; p204249  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001351 tierB-001426 tierB-001449
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 question)

;; p204250  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000018 tierB-000913 tierB-001699
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 road)

;; p204251  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001394 tierB-001632 tierB-001886
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 tree)

;; p204252  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000864 tierB-001295 tierB-001760
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 woman)

;; p204253  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-000816 tierB-001909
;;   single atom; not a proposal (a one-atom pack is a rename)
(In $e0 $e1)

;; p204254  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000374 tierB-000398 tierB-001800
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 carefully)

;; p204255  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000465 tierB-000466 tierB-001149
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 really)

;; p204256  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000593 tierB-000647
;;   single atom; not a proposal (a one-atom pack is a rename)
(Measure $e0 duration <num> day)

;; p204258  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000345 tierB-000673 tierB-001688
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 attack)

;; p204259  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000171 tierB-000246 tierB-000674
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 avoid)

;; p204260  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001605 tierB-001610 tierB-001928
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 base)

;; p204264  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000427 tierB-000636 tierB-001013
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 bring)

;; p204266  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000344 tierB-000930 tierB-001735
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 climb)

;; p204268  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-001535 tierB-001648
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 difficult)

;; p204270  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000946 tierB-000993
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 drink)

;; p204271  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-001384 tierB-001512
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 grow)

;; p204273  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000689 tierB-001449 tierB-001843
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 know)

;; p204274  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000282 tierB-000608
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 learn)

;; p204275  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000759 tierB-001149 tierB-001989
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 mean)

;; p204277  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierB-001358 tierB-001995
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 produce)

;; p204278  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001120 tierB-001386
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 pull)

;; p204279  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001082 tierB-001488
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 reach)

;; p204281  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000115 tierB-000686 tierB-000980
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 see)

;; p204282  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001218 tierB-001933 tierB-001977
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 shine)

;; p204283  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000813 tierB-001813
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 shoot)

;; p204286  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000053 tierB-000271 tierB-001068
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 speak)

;; p204288  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000132 tierB-000147 tierB-001471
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 take_off)

;; p204289  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000114 tierB-000816 tierB-001909
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 understand)

;; p204290  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000712 tierB-001557
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 wait)

;; p204291  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001318 tierB-001396 tierB-001801
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 wear)

;; p204292  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierB-000730 tierB-001345
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 win)

;; p204293  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000033 tierB-000692 tierB-001806
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 accident)

;; p204294  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-000360 tierB-001043
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 atmosphere)

;; p204295  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000170 tierB-001843 tierB-001964
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 author)

;; p204296  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000103 tierB-000343 tierB-001092
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ball)

;; p204297  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000221 tierB-001081 tierB-001775
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beach)

;; p204299  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000676 tierB-001385 tierB-001688
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 building)

;; p204300  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000330 tierB-000619 tierB-001040
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 camera)

;; p204301  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000687 tierB-001925
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ceiling)

;; p204302  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000143 tierB-000202 tierB-000739
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 church)

;; p204303  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000261 tierB-000362
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cold)

;; p204304  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000781 tierB-001000
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 concert)

;; p204305  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000462 tierB-000942 tierB-001663
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cook)

;; p204306  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001546 tierB-001928
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 country)

;; p204307  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000251 tierB-001146 tierB-001519
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 day)

;; p204308  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001002 tierB-001053 tierB-001186
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 desk)

;; p204309  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000025 tierB-001455 tierB-001831
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 difference)

;; p204310  support 3 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-001022 tierB-001529
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 different)

;; p204311  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000021 tierB-001587 tierB-001634
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 dress)

;; p204312  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001259 tierB-001322 tierB-001582
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 earth)

;; p204313  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000246 tierB-001432 tierB-001488
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 easy)

;; p204314  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000949 tierB-001232 tierB-001336
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fact)

;; p204315  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000774 tierB-001153 tierB-001490
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 field)

;; p204316  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000505 tierB-001017 tierB-001295
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 film)

;; p204317  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000923 tierB-000977
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 flower)

;; p204318  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000609 tierB-000929
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 forest)

;; p204319  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000423 tierB-000871 tierB-001399
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fox)

;; p204320  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000498 tierB-001610 tierB-001845
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 game)

;; p204321  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000548 tierB-001800 tierB-001885
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 government)

;; p204322  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000522 tierB-001329 tierB-001470
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 great)

;; p204323  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000248 tierB-000551 tierB-000664
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 king)

;; p204324  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000604 tierB-001291 tierB-001403
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 kitchen)

;; p204325  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierB-001666 tierB-001925
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 large)

;; p204326  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000288 tierB-001762 tierB-001848
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 law)

;; p204327  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001120 tierB-001383
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 line)

;; p204329  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001423 tierB-001647 tierB-001653
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 museum)

;; p204330  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000073 tierB-000352 tierB-000695
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 noise)

;; p204331  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000573 tierB-000722 tierB-001257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ocean)

;; p204332  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000252 tierB-000332 tierB-001572
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 opportunity)

;; p204333  support 3 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000792 tierB-001738
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 other)

;; p204334  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001250 tierB-001638
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 page)

;; p204335  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000569 tierB-001239 tierB-001331
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 park)

;; p204336  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000049 tierB-001263 tierB-001498
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 patient)

;; p204337  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-000535 tierB-000714
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 plant)

;; p204338  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000150 tierB-000256 tierB-000547
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 police)

;; p204339  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000005 tierB-000617 tierB-001716
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 population)

;; p204340  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000224 tierB-000306 tierB-000777
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 report)

;; p204341  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000521 tierB-000902 tierB-001180
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 right)

;; p204342  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000633 tierB-001110 tierB-001919
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 roof)

;; p204343  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000647 tierB-000975 tierB-001651
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 small)

;; p204344  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000230 tierB-000503 tierB-000734
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 spider)

;; p204345  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000706 tierB-001699
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 station)

;; p204346  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000134 tierB-000775 tierB-001531
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 storm)

;; p204347  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000156 tierB-001223 tierB-001453
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 strong)

;; p204348  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000700 tierB-000749 tierB-001219
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 teacher)

;; p204349  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001108 tierB-001266 tierB-001573
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 theater)

;; p204350  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000208 tierB-000356 tierB-001166
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 top)

;; p204351  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000128 tierB-000437 tierB-001878
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 treaty)

;; p204352  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000694 tierB-000745 tierB-001223
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 truth)

;; p204353  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000510 tierB-000931 tierB-001569
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 valuable)

;; p204354  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000039 tierB-001055 tierB-001752
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wood)

;; p204355  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000879 tierB-001389 tierB-001980
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 work)

;; p204356  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000832 tierB-001890
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 yellow)

;; p204357  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000602 tierB-001773 tierB-001870
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 young)

;; p204358  support 3 (occ 3)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000664 tierB-001207 tierB-001292
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past (LocatedIn $x0 there))

;; p204359  support 3 (occ 3)  size 1  root (Member (constant)  depth 1
;;   e.g. tierB-000495 tierB-001170 tierB-001521
;;   single atom; not a proposal (a one-atom pack is a rename)
(Probably (Member $x0 good))

;; p204360  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000196 tierB-000723
;;   single atom; not a proposal (a one-atom pack is a rename)
(ProportionOf $x0 $x1 some)

;; p204361  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000229 tierB-001518 tierB-001745
;;   single atom; not a proposal (a one-atom pack is a rename)
(RestOf $x0 $x1)

;; p204362  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000908 tierB-000997 tierB-001031
;;   single atom; not a proposal (a one-atom pack is a rename)
(Start $e0 (Year <num>))

;; p204363  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000251 tierB-000828 tierB-000903
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 $x0)

;; p204364  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000559 tierB-000917 tierB-000939
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 (Weekday sunday))

;; p204365  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000303 tierB-000598
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 morning)

;; p204366  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000699 tierB-001440
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 soon)

;; ==================== SUBSUMED UNITS: 137 of 945 rooted-subtree units (0 proposals; k = 4, support >= 3 of 1950 records) ====================

;; p200284  support 23 (occ 23)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   subsumed by p200278 (MnHolder_Have_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have))

;; p200285  support 23 (occ 23)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   subsumed by p200278 (MnHolder_Have_Theme); not a proposal
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200289  support 23 (occ 23)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   subsumed by p200278 (MnHolder_Have_Theme); not a proposal
(Holder $e0 $x0)

;; p200611  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
;;   subsumed by p200584 (MnStart_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Theme $e0 $e1))

;; p200834  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
;;   subsumed by p200754 (MnStart_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p201055  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201005 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p201111  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201005 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p201143  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201005 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Theme $e0 $e1))

;; p201173  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
;;   subsumed by p201147 (MnKill_Patient); not a proposal
(Member $e0 kill)

;; p201182  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   subsumed by p201154 (MnPast_Through); not a proposal
(Through $e0 $x0)

;; p201405  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   subsumed by p201350 (MnCapture_Past); not a proposal
(Member $e0 capture)

;; p201426  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
;;   subsumed by p201357 (MnPast_PatientEv); not a proposal
(Patient $e0 $e1)

;; p201427  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
;;   subsumed by p201358 (MnPast_TimeYesterday); not a proposal
(Time $e0 yesterday)

;; p201567  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   subsumed by p201435 (MnStart_ThemeEvOfOngoing-Patient); not a proposal
(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201674  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p201653 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))

;; p201675  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p201653 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201734  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   subsumed by p201561 (MnAgentOfBoy_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 boy))

;; p201737  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   subsumed by p201671 (MnAgent_Past_Through); not a proposal
(And (Agent $e0 $x0) (Through $e0 $x1))

;; p201739  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
;;   subsumed by p201565 (MnPast_PatientOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Patient $e0 $x0))

;; p201745  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p201653 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0))

;; p201747  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   subsumed by p201676 (MnCapture_Past_Theme); not a proposal
(And (Member $e0 capture) (Theme $e0 $x0))

;; p201753  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
;;   subsumed by p201678 (MnKill_Past_Patient); not a proposal
(And (Member $e0 kill) (Past $e0))

;; p201824  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
;;   subsumed by p201749 (MnContain_Theme); not a proposal
(Member $e0 contain)

;; p201829  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
;;   subsumed by p201759 (MnStand_Past); not a proposal
(Member $e0 stand)

;; p201851  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
;;   subsumed by p201766 (MnPast_StimulusEv); not a proposal
(Stimulus $e0 $e1)

;; p201852  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
;;   subsumed by p201767 (MnPast_Time(YearNum); not a proposal
(Time $e0 (Year <num>))

;; p201854  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
;;   subsumed by p201768 (MnPast_TimeAtMost(YearNum); not a proposal
(TimeAtMost $e0 (Year <num>))

;; p202095  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p201864 (MnStart_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))

;; p202298  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p202265 (MnAgent_Start_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0))

;; p202299  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p201863 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p202310  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
;;   subsumed by p201869 (MnStart_Patient_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202404  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
;;   subsumed by p202296 (MnAgent_Contain_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 contain))

;; p202407  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p202297 (MnAgent_Jump_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 jump))

;; p202409  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p201863 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start))

;; p202410  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p202300 (MnAgent_Swim_Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 swim))

;; p202413  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
;;   subsumed by p202096 (MnAgentOfCat_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 cat))

;; p202416  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000616 tierB-001000
;;   subsumed by p202301 (MnAlready_Past_Patient); not a proposal
(And (Already $e0) (Past $e0))

;; p202427  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
;;   subsumed by p202304 (MnGoal_Walk_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 walk))

;; p202432  support 4 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
;;   subsumed by p202102 (MnLocationOfTable_Past); not a proposal
(And (Location $e0 $x0) (Member $x0 table))

;; p202440  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p202297 (MnAgent_Jump_Past); not a proposal
(And (Member $e0 jump) (Past $e0))

;; p202446  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p202300 (MnAgent_Swim_Ongoing); not a proposal
(And (Member $e0 swim) (Ongoing $e0))

;; p202453  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   subsumed by p202106 (MnPast_ThemeOfOf); not a proposal
(And (Of $x0 $x1) (Theme $e0 $x0))

;; p202458  support 4 (occ 5)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
;;   subsumed by p202107 (MnPast_ThemeEvOfPast); not a proposal
(And (Past $e0) (Theme $e1 $e0))

;; p202460  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
;;   subsumed by p202108 (MnPast_PatientOfSubsetOf); not a proposal
(And (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202554  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
;;   subsumed by p202417 (MnBeforeEvOfPast_p202417); not a proposal
(Before $e0 $e1)

;; p202558  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
;;   subsumed by p202421 (MnDuring_Past); not a proposal
(During $e0 $x0)

;; p202574  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-000849
;;   subsumed by p202435 (MnBuy_Theme); not a proposal
(Member $e0 buy)

;; p202577  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
;;   subsumed by p202437 (MnDecide_Past); not a proposal
(Member $e0 decide)

;; p202579  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
;;   subsumed by p202439 (MnFind_Past); not a proposal
(Member $e0 find)

;; p202580  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
;;   subsumed by p202406 (MnAgent_Fly); not a proposal
(Member $e0 fly)

;; p202585  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p202297 (MnAgent_Jump_Past); not a proposal
(Member $e0 jump)

;; p202587  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
;;   subsumed by p202441 (MnPass_Past); not a proposal
(Member $e0 pass)

;; p202590  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
;;   subsumed by p202442 (MnReceive_Past); not a proposal
(Member $e0 receive)

;; p202591  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000607 tierB-001436 tierB-001566
;;   subsumed by p202443 (MnRequire_Theme); not a proposal
(Member $e0 require)

;; p202633  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
;;   subsumed by p202459 (MnPast_TimeAtLeast(YearNum); not a proposal
(TimeAtLeast $e0 (Year <num>))

;; p203252  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202663 (MnBegin_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))

;; p203265  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
;;   subsumed by p202666 (MnHolder_Have_ThemeOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p203267  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p202668 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))

;; p203273  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p202668 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))

;; p203277  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p202675 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))

;; p203576  support 3 (occ 3)  size 1  root living_room (constant)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   subsumed by p203527 (MnLivingRoomOfInheritanceRoom); not a proposal
(Inheritance living_room room)

;; p203677  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p203608 (MnAgent_Goal_Come_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))

;; p203681  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p203609 (MnAgent_Begin_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))

;; p203682  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202662 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p203683  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p203610 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))

;; p203684  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p203610 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))

;; p203698  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p203608 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))

;; p203708  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p203613 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))

;; p203717  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p202675 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))

;; p203724  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p203613 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p203902  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p203679 (MnAgent_GoalHome_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 home))

;; p203906  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p202662 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin))

;; p203907  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p203610 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture))

;; p203909  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p203686 (MnAgent_Draw_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 draw))

;; p203920  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   subsumed by p203256 (MnAgentOfPlane_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 plane))

;; p203922  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
;;   subsumed by p203260 (MnPast_StimulusEvOfAgent); not a proposal
(And (Agent $e0 $x0) (Stimulus $e1 $e0))

;; p203924  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   subsumed by p203693 (MnAgent_Past_ToEv); not a proposal
(And (Agent $e0 $x0) (To $e0 $e1))

;; p203925  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   subsumed by p203261 (MnPast_ToEvOfAgent); not a proposal
(And (Agent $e0 $x0) (To $e1 $e0))

;; p203937  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
;;   subsumed by p203264 (MnBeforeEvOfPast_Past); not a proposal
(And (Before $e0 $e1) (Past $e0))

;; p203958  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
;;   subsumed by p203697 (MnGoal_MannerQuickly_Past); not a proposal
(And (Goal $e0 $x0) (Manner $e0 quickly))

;; p203959  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p203608 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come))

;; p203961  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p203679 (MnAgent_GoalHome_Past); not a proposal
(And (Goal $e0 home) (Past $e0))

;; p203970  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   subsumed by p203276 (MnLocationOfHouse_Live); not a proposal
(And (Location $e0 $x0) (Member $x0 house))

;; p203984  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000367 tierB-000368 tierB-001690
;;   subsumed by p203702 (MnBuy_Past_Theme); not a proposal
(And (Member $e0 buy) (Past $e0))

;; p203985  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   subsumed by p203703 (MnCause_Past_Patient); not a proposal
(And (Member $e0 cause) (Patient $e0 $x0))

;; p203991  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p203704 (MnCreate_Past_Patient); not a proposal
(And (Member $e0 create) (Past $e0))

;; p203992  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p203704 (MnCreate_Past_Patient); not a proposal
(And (Member $e0 create) (Patient $e0 $x0))

;; p203993  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p203686 (MnAgent_Draw_Past); not a proposal
(And (Member $e0 draw) (Past $e0))

;; p203994  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p203705 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Past $e0))

;; p203995  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p203705 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Patient $e0 $x0))

;; p203997  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
;;   subsumed by p203706 (MnFall_Past_Source); not a proposal
(And (Member $e0 fall) (Source $e0 $x0))

;; p203998  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
;;   subsumed by p203707 (MnFind_Past_Theme); not a proposal
(And (Member $e0 find) (Theme $e0 $x0))

;; p204002  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p203709 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Past $e0))

;; p204003  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p203709 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Patient $e0 $x0))

;; p204004  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p203710 (MnLeave_Patient_ResultEv); not a proposal
(And (Member $e0 leave) (Patient $e0 $x0))

;; p204005  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p203269 (MnLeave_ResultEvOfExperiencer); not a proposal
(And (Member $e0 leave) (Result $e0 $e1))

;; p204008  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
;;   subsumed by p203688 (MnAgent_Play_Ongoing); not a proposal
(And (Member $e0 play) (Ongoing $e0))

;; p204010  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p203713 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Past $e0))

;; p204011  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p203713 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Theme $e0 $x0))

;; p204013  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
;;   subsumed by p203714 (MnReceive_Past_Theme); not a proposal
(And (Member $e0 receive) (Theme $e0 $x0))

;; p204018  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
;;   subsumed by p203715 (MnStand_Ongoing_Past); not a proposal
(And (Member $e0 stand) (Ongoing $e0))

;; p204019  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p203716 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Past $e0))

;; p204020  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p203716 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Patient $e0 $x0))

;; p204021  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p202675 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Theme $e0 $e1))

;; p204025  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
;;   subsumed by p203691 (MnAgent_Watch_Theme); not a proposal
(And (Member $e0 watch) (Theme $e0 $x0))

;; p204030  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
;;   subsumed by p203278 (MnPast_PatientOfFire); not a proposal
(And (Member $x0 fire) (Patient $e0 $x0))

;; p204033  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
;;   subsumed by p203279 (MnPast_ThemeOfPicture); not a proposal
(And (Member $x0 picture) (Theme $e0 $x0))

;; p204049  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
;;   subsumed by p203282 (MnPast_ThemeEvOfRecipient); not a proposal
(And (Recipient $e0 $x0) (Theme $e1 $e0))

;; p204217  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
;;   subsumed by p203926 (MnAgentBaya_Past); not a proposal
(Agent $e0 baya)

;; p204218  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
;;   subsumed by p203927 (MnAgentDaniel_Past); not a proposal
(Agent $e0 daniel)

;; p204219  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
;;   subsumed by p203928 (MnAgentDavid_Ongoing); not a proposal
(Agent $e0 david)

;; p204221  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
;;   subsumed by p203930 (MnAgentFelix_Past); not a proposal
(Agent $e0 felix)

;; p204225  support 3 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
;;   subsumed by p203931 (MnAgentMark_Past); not a proposal
(Agent $e0 mark)

;; p204228  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
;;   subsumed by p203932 (MnAgentMatthew_Past); not a proposal
(Agent $e0 matthew)

;; p204230  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
;;   subsumed by p203933 (MnAgentMichael_Past); not a proposal
(Agent $e0 michael)

;; p204231  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
;;   subsumed by p203934 (MnAgentPietro_Past); not a proposal
(Agent $e0 pietro)

;; p204233  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   subsumed by p203935 (MnAgentZiri_Ongoing); not a proposal
(Agent $e0 ziri)

;; p204234  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
;;   subsumed by p203936 (MnAt_Past); not a proposal
(At $e0 $x0)

;; p204241  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
;;   subsumed by p203960 (MnGoalBed_Go); not a proposal
(Goal $e0 bed)

;; p204242  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p203679 (MnAgent_GoalHome_Past); not a proposal
(Goal $e0 home)

;; p204257  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
;;   subsumed by p203976 (MnApprove_Theme); not a proposal
(Member $e0 approve)

;; p204261  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
;;   subsumed by p203978 (MnBear_Past); not a proposal
(Member $e0 bear)

;; p204262  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
;;   subsumed by p203946 (MnExperiencer_Beautiful); not a proposal
(Member $e0 beautiful)

;; p204263  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
;;   subsumed by p203982 (MnBreakOut_Past); not a proposal
(Member $e0 break_out)

;; p204265  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
;;   subsumed by p203983 (MnBuild_Patient); not a proposal
(Member $e0 build)

;; p204267  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p203704 (MnCreate_Past_Patient); not a proposal
(Member $e0 create)

;; p204269  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p203686 (MnAgent_Draw_Past); not a proposal
(Member $e0 draw)

;; p204272  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
;;   subsumed by p204001 (MnHoldUp_Past); not a proposal
(Member $e0 hold_up)

;; p204276  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
;;   subsumed by p204007 (MnPickUp_Past); not a proposal
(Member $e0 pick_up)

;; p204280  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
;;   subsumed by p204012 (MnRead_Theme); not a proposal
(Member $e0 read)

;; p204284  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
;;   subsumed by p204016 (MnSing_Past); not a proposal
(Member $e0 sing)

;; p204285  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
;;   subsumed by p204017 (MnSolve_Patient); not a proposal
(Member $e0 solve)

;; p204287  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p203716 (MnStick_Past_Patient); not a proposal
(Member $e0 stick)

;; p204298  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
;;   subsumed by p204029 (MnBottom_PartOf); not a proposal
(Member $x0 bottom)

;; p204328  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   subsumed by p203527 (MnLivingRoomOfInheritanceRoom); not a proposal
(Member $x0 living_room)

;; p204367  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
;;   subsumed by p203957 (MnFuture_TimeTomorrow); not a proposal
(Time $e0 tomorrow)

;; p204368  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
;;   subsumed by p204045 (MnPast_With); not a proposal
(With $e0 $x0)
