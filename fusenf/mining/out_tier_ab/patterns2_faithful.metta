;; FUSE-NF §4.3.1 Frequent Subtree Mining — FAITHFUL view — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   patterns2_faithful.jsonl  (every unit with its fields and supporting record ids)
;;   patterns2.jsonl           (the miner's full inventory this view is cut from)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate           canonical_substrate.jsonl (2352 records; 2187 carry at least one pattern) — patterns2.jsonl: 7216 patterns, the miner's inventory; this view mines nothing
;;   size threshold      k = 4 atoms per pattern (the miner's --k)
;;   minimum support     3 records (document support; occurrences reported beside it)
;;   pattern language    skolems as per-stream variables $e#/$x#/$f# with canonical numbering; constants verbatim; <num>/<str> wildcards; ~NEG marks a denied atom; surface-record and Implication atoms excluded
;;   rooted subtree      atoms read as edges centre -> other arguments (a unary atom is an attribute of its node); exactly one node without a parent (the root), every other node with exactly one parent; joins (a node under two parents) are excluded
;;   constants verbatim  n_lifted = 0 only; the 4967 constant-lifted (shape-stratum) patterns are an addition
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

;; ==================== CLOSED UNITS: 1395 of 2125 rooted-subtree units (931 proposals; k = 4, support >= 3 of 2352 records) ====================

;; p200004  support 606 (occ 669)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past $e0)

;; p200006  support 551 (occ 595)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 $x0)

;; p200011  support 413 (occ 427)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   single atom; not a proposal (a one-atom pack is a rename)
(Theme $e0 $x0)

;; p200017  support 327 (occ 340)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   single atom; not a proposal (a one-atom pack is a rename)
(Patient $e0 $x0)

;; p200022  support 235 (occ 238)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_Theme $e0 $x0 $x1))

;; p200024  support 223 (occ 238)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnAgent_Past $e0 $x0))

;; p200036  support 162 (occ 165)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_Patient $e0 $x0))

;; p200038  support 145 (occ 149)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   single atom; not a proposal (a one-atom pack is a rename)
(Ongoing $e0)

;; p200040  support 140 (occ 145)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_Theme $e0 $x0))

;; p200045  support 137 (occ 147)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000098 tierA-000128 tierA-000129
;;   single atom; not a proposal (a one-atom pack is a rename)
(Experiencer $e0 $x0)

;; p200049  support 126 (occ 134)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   single atom; not a proposal (a one-atom pack is a rename)
(Location $e0 $x0)

;; p200061  support 95 (occ 97)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (MnAgent_Patient $e0 $x0 $x1))

;; p200075  support 75 (occ 76)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000023 tierB-000055 tierB-000080
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 thing)

;; p200076  support 75 (occ 78)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000187
;;   single atom; not a proposal (a one-atom pack is a rename)
(Theme $e0 $e1)

;; p200078  support 74 (occ 76)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   single atom; not a proposal (a one-atom pack is a rename)
(Cardinality $x0 <num>)

;; p200084  support 68 (occ 69)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme $e0 $x0 $x1))

;; p200093  support 61 (occ 64)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000032 tierB-000116
;;   single atom; not a proposal (a one-atom pack is a rename)
(LocatedIn $x0 $x1)

;; p200098  support 58 (occ 63)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(Implication (And (Location $e0 $x0) (Past $e0)) (MnLocation_Past $e0 $x0))

;; p200105  support 56 (occ 56)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000036 tierB-000098
(Implication (And (Agent $e0 $x0) (Ongoing $e0)) (MnAgent_Ongoing $e0 $x0))

;; p200113  support 52 (occ 53)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient $e0 $x0 $x1))

;; p200116  support 52 (occ 52)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   single atom; not a proposal (a one-atom pack is a rename)
(Goal $e0 $x0)

;; p200125  support 47 (occ 48)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   single atom; not a proposal (a one-atom pack is a rename)
(Recipient $e0 $x0)

;; p200127  support 46 (occ 50)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (MnAgent_Location $e0 $x0 $x1))

;; p200137  support 44 (occ 44)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   single atom; not a proposal (a one-atom pack is a rename)
(Future $e0)

;; p200145  support 43 (occ 45)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(Implication (And (Past $e0) (Theme $e0 $e1)) (MnPast_ThemeEv $e0 $e1))

;; p200149  support 42 (occ 46)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000124 tierB-000134 tierB-000191
(Implication (And (Experiencer $e0 $x0) (Past $e0)) (MnExperiencer_Past $e0 $x0))

;; p200154  support 41 (occ 41)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   single atom; not a proposal (a one-atom pack is a rename)
(Possession $x0 $x1)

;; p200158  support 40 (occ 40)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   single atom; not a proposal (a one-atom pack is a rename)
(Source $e0 $x0)

;; p200168  support 38 (occ 39)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000172 tierB-000202
;;   single atom; not a proposal (a one-atom pack is a rename)
(PartOf $x0 $x1)

;; p200177  support 37 (occ 37)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_Recipient $e0 $x0 $x1))

;; p200178  support 37 (occ 37)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(Implication (And (Goal $e0 $x0) (Past $e0)) (MnGoal_Past $e0 $x0))

;; p200179  support 37 (occ 39)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(Implication (And (Ongoing $e0) (Past $e0)) (MnOngoing_Past $e0))

;; p200191  support 36 (occ 38)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000206 tierB-000228
;;   single atom; not a proposal (a one-atom pack is a rename)
(Result $e0 $e1)

;; p200199  support 35 (occ 37)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(Implication (And (Ongoing $e0) (Patient $e0 $x0)) (MnOngoing_Patient $e0 $x0))

;; p200200  support 35 (occ 35)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 have)

;; p200204  support 34 (occ 34)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   single atom; not a proposal (a one-atom pack is a rename)
(Holder $e0 $x0)

;; p200216  support 33 (occ 33)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000187
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (MnAgent_ThemeEv $e0 $e1 $x0))

;; p200217  support 33 (occ 33)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(Implication (And (Member $e0 have) (Theme $e0 $x0)) (MnHave_Theme $e0 $x0))

;; p200224  support 32 (occ 32)  size 1  root $e0 (event)  depth 0
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   single atom; not a proposal (a one-atom pack is a rename)
(Might $e0)

;; p200231  support 31 (occ 31)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000086 tierA-000087
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnHolder_Theme $e0 $x0 $x1))

;; p200240  support 30 (occ 30)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Recipient $e0 $x0) (Theme $e0 $x1)) (MnRecipient_Theme $e0 $x0 $x1))

;; p200242  support 30 (occ 33)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000040 tierB-000126 tierB-000191
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 person)

;; p200296  support 26 (occ 26)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 make)

;; p200297  support 26 (occ 26)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000037 tierB-000080 tierB-000144
;;   single atom; not a proposal (a one-atom pack is a rename)
(Obligated $e0)

;; p200305  support 25 (occ 27)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnThemeOfCardinalityNum $e0 $x0))

;; p200306  support 25 (occ 27)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(Implication (And (Location $e0 $x0) (Ongoing $e0)) (MnLocation_Ongoing $e0 $x0))

;; p200319  support 24 (occ 24)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Recipient_Theme $e0 $x0 $x1 $x2))

;; p200338  support 23 (occ 23)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1)) (MnHolder_Have_Theme $e0 $x0 $x1))

;; p200341  support 23 (occ 25)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Experiencer $e0 $x0) (Result $e1 $e0)) (MnResultEvOfExperiencer $e1 $e0 $x0))

;; p200343  support 23 (occ 23)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(Implication (And (Past $e0) (Result $e0 $e1)) (MnPast_ResultEv $e0 $e1))

;; p200345  support 23 (occ 23)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000053 tierA-000058 tierA-000063
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 start)

;; p200378  support 22 (occ 22)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfOngoing $e1 $e0))

;; p200379  support 22 (occ 24)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(Implication (And (Patient $e0 $x0) (Result $e0 $e1)) (MnPatient_ResultEv $e0 $e1 $x0))

;; p200389  support 21 (occ 21)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000078 tierA-000108
(Implication (And (Agent $e0 $x0) (Might $e0)) (MnAgent_Might $e0 $x0))

;; p200391  support 21 (occ 22)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 child)

;; p200392  support 21 (occ 21)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 new)

;; p200404  support 20 (occ 21)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(Implication (And (Agent $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfAgent $e1 $e0 $x0))

;; p200406  support 20 (occ 24)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 work)

;; p200418  support 19 (occ 19)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000183 tierA-000184
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1)) (MnAgent_Goal $e0 $x0 $x1))

;; p200419  support 19 (occ 19)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(Implication (And (Past $e0) (Source $e0 $x0)) (MnPast_Source $e0 $x0))

;; p200422  support 19 (occ 19)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000025 tierB-000156 tierB-000299
;;   single atom; not a proposal (a one-atom pack is a rename)
(Can $e0)

;; p200435  support 18 (occ 18)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Future $e0) (Patient $e0 $x0)) (MnFuture_Patient $e0 $x0))

;; p200436  support 18 (occ 19)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_Theme $e0 $x0))

;; p200442  support 18 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000114 tierB-000174
;;   single atom; not a proposal (a one-atom pack is a rename)
(Stimulus $e0 $x0)

;; p200443  support 18 (occ 18)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $e0 $e1)

;; p200453  support 17 (occ 17)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(Implication (And (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing $e1 $e0))

;; p200461  support 17 (occ 18)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_Theme $e0 $x0))

;; p200468  support 17 (occ 17)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfPatient $e1 $e0 $x0))

;; p200474  support 17 (occ 17)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000055 tierA-000057
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 begin)

;; p200475  support 17 (occ 17)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000268 tierB-000282
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 use)

;; p200476  support 17 (occ 17)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000048 tierB-000293 tierB-000371
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 house)

;; p200477  support 17 (occ 17)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 school)

;; p200490  support 16 (occ 17)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(Implication (And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent $e1 $e0 $x0))

;; p200500  support 16 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEv $e0 $e1 $x0))

;; p200511  support 16 (occ 16)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000177
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 walk)

;; p200512  support 16 (occ 16)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000133 tierB-000196
;;   single atom; not a proposal (a one-atom pack is a rename)
(SubsetOf $x0 $x1)

;; p200540  support 15 (occ 16)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnAgentOfCardinalityNum $e0 $x0))

;; p200541  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
(Implication (And (Agent $e0 $x0) (Future $e0)) (MnAgent_Future $e0 $x0))

;; p200542  support 15 (occ 17)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0)) (MnExperiencer_Ongoing $e0 $x0))

;; p200543  support 15 (occ 15)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000073 tierB-000269
(Implication (And (Member $e0 make) (Patient $e0 $x0)) (MnMake_Patient $e0 $x0))

;; p200546  support 15 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 decide)

;; p200547  support 15 (occ 16)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000263 tierB-000344 tierB-000670
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 room)

;; p200566  support 14 (occ 16)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p200579  support 14 (occ 14)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Buy_Past_Theme $e0 $x0 $x1))

;; p200582  support 14 (occ 16)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnAgent_Location_Past $e0 $x0 $x1))

;; p200592  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Agent $e0 $x0) (Source $e0 $x1)) (MnAgent_Source $e0 $x0 $x1))

;; p200593  support 14 (occ 16)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (MnExperiencer_Location $e0 $x0 $x1))

;; p200594  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(Implication (And (Location $e0 $x0) (Patient $e0 $x1)) (MnLocation_Patient $e0 $x0 $x1))

;; p200595  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000043 tierB-000192 tierB-000199
(Implication (And (Member $e0 start) (Past $e0)) (MnStart_Past $e0))

;; p200596  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000087 tierA-000108 tierA-000112
(Implication (And (Might $e0) (Theme $e0 $x0)) (MnMight_Theme $e0 $x0))

;; p200597  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000416 tierB-000520 tierB-000574
(Implication (And (Ongoing $e0) (Theme $e0 $x0)) (MnOngoing_Theme $e0 $x0))

;; p200598  support 14 (occ 14)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
(Implication (And (Possession $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPossession $e0 $x0 $x1))

;; p200603  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000222 tierB-000392
;;   single atom; not a proposal (a one-atom pack is a rename)
(Instrument $e0 $x0)

;; p200604  support 14 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 give)

;; p200605  support 14 (occ 15)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 go)

;; p200606  support 14 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 require)

;; p200607  support 14 (occ 14)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000056 tierB-000425 tierB-000446
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 door)

;; p200639  support 13 (occ 13)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0)) (MnPast_ResultEvOfExperiencer $e1 $e0 $x0))

;; p200662  support 13 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0)) (MnAgent_Goal_Past $e0 $x0 $x1))

;; p200663  support 13 (occ 13)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000108 tierA-000112 tierA-000122
(Implication (And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1)) (MnAgent_Might_Theme $e0 $x0 $x1))

;; p200671  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
(Implication (And (Member $e0 destroy) (Patient $e0 $x0)) (MnDestroy_Patient $e0 $x0))

;; p200672  support 13 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnGive_Recipient $e0 $x0))

;; p200673  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Member $e0 give) (Theme $e0 $x0)) (MnGive_Theme $e0 $x0))

;; p200674  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000053 tierA-000058 tierA-000063
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnStart_Patient $e0 $x0))

;; p200675  support 13 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_Recipient $e0 $x0))

;; p200676  support 13 (occ 13)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnSource_Theme $e0 $x0 $x1))

;; p200684  support 13 (occ 14)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000418
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 get)

;; p200685  support 13 (occ 13)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000182
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 take)

;; p200686  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000328 tierA-000332 tierA-000336
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 big)

;; p200687  support 13 (occ 13)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000316 tierB-000338 tierB-000628
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 person)

;; p200733  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(Implication (And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing $e0 $e1))

;; p200757  support 12 (occ 12)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Give_Recipient_Theme $e0 $x0 $x1 $x2))

;; p200763  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0)) (MnAgent_Ongoing_Past $e0 $x0))

;; p200765  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(Implication (And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnPast_Patient_ResultEv $e0 $e1 $x0))

;; p200777  support 12 (occ 12)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnAgentOfGroupOfChild $e0 $x0))

;; p200779  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_Make $e0 $x0))

;; p200781  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (MnLocation_Theme $e0 $x0 $x1))

;; p200795  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000152 tierB-000238 tierB-000255
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 come)

;; p200796  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 discover)

;; p200797  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000090 tierA-000095
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 need)

;; p200798  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 teach)

;; p200799  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000391 tierA-000396 tierA-000400
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 car)

;; p200800  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 depot)

;; p200801  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000375 tierA-000377 tierA-000378
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 physician)

;; p200802  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000307 tierB-000650 tierB-000843
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 problem)

;; p200803  support 12 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000351 tierB-000429
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 weather)

;; p200804  support 12 (occ 12)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000016 tierB-000126 tierB-000285
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past (LocatedIn $x0 $x1))

;; p200805  support 12 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 now)

;; p200826  support 11 (occ 11)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfCardinalityNum $e0 $x0))

;; p200844  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach)) (MnAgent_Teach $e0 $x0))

;; p200845  support 11 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000315 tierA-000316
(Implication (And (Location $e0 $x0) (Member $e0 work)) (MnLocation_Work $e0 $x0))

;; p200846  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
(Implication (And (Member $e0 answer) (Theme $e0 $x0)) (MnAnswer_Theme $e0 $x0))

;; p200847  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierA-000086 tierA-000087
(Implication (And (Member $e0 require) (Theme $e0 $x0)) (MnRequire_Theme $e0 $x0))

;; p200848  support 11 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Member $e0 teach) (Recipient $e0 $x0)) (MnTeach_Recipient $e0 $x0))

;; p200861  support 11 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000049 tierB-000107
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $e0 $x0)

;; p200862  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000162 tierB-000483 tierB-001020
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 thing)

;; p200863  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 quickly)

;; p200865  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000398 tierB-000004 tierB-000100
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 leave)

;; p200866  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 try)

;; p200867  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 board)

;; p200868  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 hall)

;; p200869  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000793 tierB-001182 tierB-001316
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 man)

;; p200870  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000494 tierB-000576 tierB-000589
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 place)

;; p200871  support 11 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000016 tierB-000047 tierB-000335
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 table)

;; p200872  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000182 tierA-000186 tierA-000191
;;   single atom; not a proposal (a one-atom pack is a rename)
(Patient $e0 $e1)

;; p200873  support 11 (occ 12)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 (Hour <num>))

;; p200925  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Answer_Theme $e0 $x0 $x1))

;; p200926  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)) (MnAgent_Destroy_Patient $e0 $x0 $x1))

;; p200927  support 10 (occ 10)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_Recipient $e0 $x0 $x1))

;; p200934  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (MnAgent_Decide $e0 $x0))

;; p200936  support 10 (occ 12)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x0 school)) (MnAgentOfSchool $e0 $x0))

;; p200937  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(Implication (And (Manner $e0 quickly) (Past $e0)) (MnMannerQuickly_Past $e0))

;; p200938  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000055 tierA-000057
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnBegin_Patient $e0 $x0))

;; p200939  support 10 (occ 11)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(Implication (And (Member $e0 go) (Past $e0)) (MnGo_Past $e0))

;; p200940  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0)) (MnHave_Past $e0))

;; p200941  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Member $e0 lend) (Theme $e0 $x0)) (MnLend_Theme $e0 $x0))

;; p200942  support 10 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Patient $e0 $x0)) (MnPatientOfDoor $e0 $x0))

;; p200953  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 arrive)

;; p200955  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 sell)

;; p200956  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bank)

;; p200957  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000458 tierB-000703
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 book)

;; p200958  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000073 tierB-000250
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cat)

;; p200959  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 crate)

;; p200960  support 10 (occ 10)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fire)

;; p200961  support 10 (occ 12)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000024 tierB-000137 tierB-000527
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 good)

;; p200962  support 10 (occ 11)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000277 tierB-000668
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 tree)

;; p200966  support 9 (occ 9)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(Implication (And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfOngoing $e0 $e1))

;; p201016  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201056  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnAgent_Location_Ongoing $e0 $x0 $x1))

;; p201057  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)) (MnAgent_Decide_Theme $e0 $x0 $x1))

;; p201058  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Discover_Theme $e0 $x0 $x1))

;; p201059  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Lend_Theme $e0 $x0 $x1))

;; p201060  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Theme $e0 $x0 $x1))

;; p201061  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Source_Theme $e0 $x0 $x1 $x2))

;; p201062  support 9 (occ 11)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000008 tierB-000148 tierB-000381
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Past $e0)) (MnLocation_Ongoing_Past $e0 $x0))

;; p201063  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(Implication (And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnLocation_Past_Patient $e0 $x0 $x1))

;; p201064  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(Implication (And (Member $e0 have) (Past $e0) (Theme $e0 $x0)) (MnHave_Past_Theme $e0 $x0))

;; p201077  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_Arrive $e0 $x0))

;; p201078  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000143 tierA-000145 tierA-000148
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_Cancel $e0 $x0))

;; p201081  support 9 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
(Implication (And (Agent $e0 $x0) (Member $x0 board)) (MnAgentOfBoard $e0 $x0))

;; p201082  support 9 (occ 11)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnAgentOfPerson $e0 $x0))

;; p201083  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(Implication (And (Instrument $e0 $x0) (Past $e0)) (MnInstrument_Past $e0 $x0))

;; p201084  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000177
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnLocation_Walk $e0 $x0))

;; p201087  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000325 tierB-000539
(Implication (And (Member $e0 make) (Past $e0)) (MnMake_Past $e0))

;; p201088  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnRepair_Patient $e0 $x0))

;; p201089  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnSell_Theme $e0 $x0))

;; p201090  support 9 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
(Implication (And (Member $x0 new) (Theme $e0 $x0)) (MnThemeOfNew $e0 $x0))

;; p201091  support 9 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Theme $e0 $x0)) (MnThemeOfThing $e0 $x0))

;; p201092  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
(Implication (And (Might $e0) (Patient $e0 $x0)) (MnMight_Patient $e0 $x0))

;; p201093  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000080 tierB-000246
(Implication (And (Obligated $e0) (Theme $e0 $x0)) (MnObligated_Theme $e0 $x0))

;; p201112  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   single atom; not a proposal (a one-atom pack is a rename)
(Beneficiary $e0 $x0)

;; p201114  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cause)

;; p201115  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-000609
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 fall)

;; p201116  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 hear)

;; p201117  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000160 tierB-000648
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 play)

;; p201119  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-000253
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 study)

;; p201120  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000904 tierB-001016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beautiful)

;; p201121  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000153 tierB-000546 tierB-000680
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 city)

;; p201122  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000340 tierB-000537 tierB-000871
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 dog)

;; p201123  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000339 tierA-000343 tierA-000347
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 huge)

;; p201124  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ledger)

;; p201125  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000267 tierB-000334 tierB-000471
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 old)

;; p201126  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000294 tierB-000468 tierB-000582
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 road)

;; p201127  support 9 (occ 9)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000370 tierB-000792 tierB-000797
;;   single atom; not a proposal (a one-atom pack is a rename)
(Only $x0 $e0)

;; p201128  support 9 (occ 9)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000495 tierB-000517 tierB-001521
;;   single atom; not a proposal (a one-atom pack is a rename)
(Probably $e0)

;; p201129  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   single atom; not a proposal (a one-atom pack is a rename)
(Stimulus $e0 $e1)

;; p201172  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1)) (MnAgentOfSchool_Theme $e0 $x0 $x1))

;; p201173  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p201174  support 8 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0)) (MnHolder_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p201218  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Abandon_Theme $e0 $x0 $x1))

;; p201219  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Reject_Theme $e0 $x0 $x1))

;; p201220  support 8 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Repair_Patient $e0 $x0 $x1))

;; p201221  support 8 (occ 8)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0)) (MnThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201245  support 8 (occ 10)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person)) (MnAgentOfGroupOfPerson $e0 $x0))

;; p201247  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $e0 cause)) (MnAgent_Cause $e0 $x0))

;; p201250  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnAgent_Walk $e0 $x0))

;; p201251  support 8 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
(Implication (And (Agent $e0 $x0) (Member $e0 work)) (MnAgent_Work $e0 $x0))

;; p201252  support 8 (occ 8)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000377 tierA-000380
(Implication (And (Agent $e0 $x0) (Member $x0 physician)) (MnAgentOfPhysician $e0 $x0))

;; p201253  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(Implication (And (Future $e0) (Theme $e0 $x0)) (MnFuture_Theme $e0 $x0))

;; p201254  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
(Implication (And (Holder $e0 $x0) (Member $e0 require)) (MnHolder_Require $e0 $x0))

;; p201255  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(Implication (And (Instrument $e0 $x0) (Patient $e0 $x1)) (MnInstrument_Patient $e0 $x0 $x1))

;; p201256  support 8 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Location $e0 $x0) (Member $x0 ledger)) (MnLocationOfLedger $e0 $x0))

;; p201257  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Patient $e0 $x0)) (MnMannerQuickly_Patient $e0 $x0))

;; p201259  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000182
(Implication (And (Member $e0 begin) (Past $e0)) (MnBegin_Past $e0))

;; p201260  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000189 tierB-000421
(Implication (And (Member $e0 hear) (Past $e0)) (MnHear_Past $e0))

;; p201262  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(Implication (And (Member $e0 try) (Past $e0)) (MnTry_Past $e0))

;; p201263  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Theme $e0 $e1)) (MnTry_ThemeEv $e0 $e1))

;; p201264  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(Implication (And (Obligated $e0) (Patient $e0 $x0)) (MnObligated_Patient $e0 $x0))

;; p201265  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(Implication (And (Past $e0) (Stimulus $e0 $x0)) (MnPast_Stimulus $e0 $x0))

;; p201266  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(Implication (And (Past $e0) (To $e0 $e1)) (MnPast_ToEv $e0 $e1))

;; p201267  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(Implication (And (Patient $e0 $x0) (Source $e0 $x1)) (MnPatient_Source $e0 $x0 $x1))

;; p201289  support 8 (occ 8)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Again $e0)

;; p201290  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   single atom; not a proposal (a one-atom pack is a rename)
(Before $x0 $e0)

;; p201292  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000187 tierA-000191
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 decision)

;; p201293  support 8 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 live)

;; p201294  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 postpone)

;; p201296  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000390 tierA-000392 tierA-000393
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 automobile)

;; p201297  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 crew)

;; p201298  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000322 tierB-000615 tierB-000677
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 garden)

;; p201299  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 museum)

;; p201300  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000456 tierB-000722 tierB-000937
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sky)

;; p201301  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 song)

;; p201302  support 8 (occ 8)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 storm)

;; p201303  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000093 tierB-000240 tierB-000734
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $e0 $x0)

;; p201305  support 7 (occ 7)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p201306  support 7 (occ 7)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0)) (MnPast_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p201307  support 7 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(Implication (And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfOngoing $e0 $e1 $x0))

;; p201308  support 7 (occ 7)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(Implication (And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1)) (MnBegin_Past_ThemeEvOfOngoing $e0 $e1))

;; p201388  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierA-000109 tierA-000110
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1)) (MnAgentOfCardinalityNum_Theme $e0 $x0 $x1))

;; p201389  support 7 (occ 8)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0)) (MnAgentOfGroupOfPerson_Past $e0 $x0))

;; p201390  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
(Implication (And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1)) (MnAgentOfBoard_Theme $e0 $x0 $x1))

;; p201391  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOfDepot_Theme $e0 $x0 $x1))

;; p201392  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Past $e0)) (MnAgentOfSchool_Past $e0 $x0))

;; p201394  support 7 (occ 7)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(Implication (And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfPatient $e0 $e1 $x0))

;; p201445  support 7 (occ 7)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnPotteryStudioOfInheritanceStudio $x0))

;; p201468  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_Cancel_Patient $e0 $x0 $x1))

;; p201469  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1)) (MnAgent_Make_Patient $e0 $x0 $x1))

;; p201470  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Postpone_Theme $e0 $x0 $x1))

;; p201471  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1)) (MnAgent_Teach_Theme $e0 $x0 $x1))

;; p201472  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnAgent_Ongoing_Patient $e0 $x0 $x1))

;; p201473  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(Implication (And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0)) (MnMannerQuickly_Past_Patient $e0 $x0))

;; p201475  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
(Implication (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnLend_Recipient_Theme $e0 $x0 $x1))

;; p201476  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnRepair_Past_Patient $e0 $x0))

;; p201477  support 7 (occ 7)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(Implication (And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p201509  support 7 (occ 7)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(Implication (And (Again $e0) (Past $e0)) (MnAgain_Past $e0))

;; p201510  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1)) (MnAgent_Beneficiary $e0 $x0 $x1))

;; p201514  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000770 tierB-000978 tierB-001507
(Implication (And (Agent $e0 $x0) (Member $x0 thing)) (MnAgentOfThing $e0 $x0))

;; p201515  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Beneficiary $e0 $x0) (Past $e0)) (MnBeneficiary_Past $e0 $x0))

;; p201516  support 7 (occ 7)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift)) (MnCardinalityNum_GroupOfForklift $x0))

;; p201517  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
(Implication (And (Goal $e0 $x0) (Member $e0 walk)) (MnGoal_Walk $e0 $x0))

;; p201518  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(Implication (And (Goal $e0 $x0) (Patient $e0 $x1)) (MnGoal_Patient $e0 $x0 $x1))

;; p201521  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000255 tierB-000277
(Implication (And (Member $e0 come) (Past $e0)) (MnCome_Past $e0))

;; p201522  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Patient $e0 $x0)) (MnFall_Patient $e0 $x0))

;; p201523  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Stimulus $e0 $x0)) (MnHear_Stimulus $e0 $x0))

;; p201524  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
(Implication (And (Member $e0 kill) (Patient $e0 $x0)) (MnKill_Patient $e0 $x0))

;; p201526  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000173 tierB-000325 tierB-000951
(Implication (And (Member $e0 make) (Ongoing $e0)) (MnMake_Ongoing $e0))

;; p201527  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(Implication (And (Member $e0 make) (Result $e0 $e1)) (MnMake_ResultEv $e0 $e1))

;; p201530  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000309 tierB-000942
(Implication (And (Member $e0 take) (Past $e0)) (MnTake_Past $e0))

;; p201532  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000324 tierB-000805
(Implication (And (Member $e0 walk) (Past $e0)) (MnWalk_Past $e0))

;; p201533  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000082 tierB-000370 tierB-000389
(Implication (And (Member $x0 thing) (Patient $e0 $x0)) (MnPatientOfThing $e0 $x0))

;; p201534  support 7 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(Implication (And (Ongoing $e0) (Result $e0 $e1)) (MnOngoing_ResultEv $e0 $e1))

;; p201535  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Past $e0) (Through $e0 $x0)) (MnPast_Through $e0 $x0))

;; p201536  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
(Implication (And (Theme $e0 $e1) (Theme $e1 $x0)) (MnThemeEvOfTheme $e0 $e1 $x0))

;; p201563  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   single atom; not a proposal (a one-atom pack is a rename)
(CoAgent $e0 $x0)

;; p201564  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 egg)

;; p201566  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
;;   single atom; not a proposal (a one-atom pack is a rename)
(In $e0 $x0)

;; p201567  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000098 tierB-000139 tierB-000517
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 change)

;; p201569  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-000425
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 open)

;; p201570  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 reach)

;; p201571  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 receive)

;; p201572  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001302 tierB-001334
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 sleep)

;; p201573  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 turn)

;; p201574  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 case)

;; p201575  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 chef)

;; p201576  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000762 tierB-000853 tierB-000986
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 company)

;; p201577  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000376 tierA-000381 tierA-000386
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 doctor)

;; p201578  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000009 tierB-000368 tierB-000403
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 food)

;; p201579  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 kiln)

;; p201580  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 point)

;; p201582  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 recipe)

;; p201583  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 roof)

;; p201584  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000408 tierB-000739 tierB-001058
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 town)

;; p201585  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000032 tierB-000618 tierB-000650
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 water)

;; p201587  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 morning)

;; p201593  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Theme $e0 $x1)) (MnBeneficiaryOfHall_Past_Theme $e0 $x0 $x1))

;; p201594  support 6 (occ 6)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0))

;; p201695  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1)) (MnAgentOfPhysician_Theme $e0 $x0 $x1))

;; p201696  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000189 tierB-001251
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1)) (MnAgent_ThemeOfNew $e0 $x0 $x1))

;; p201700  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(Implication (And (Member $x0 door) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfDoor $e0 $x0))

;; p201701  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfKiln $e0 $x0))

;; p201758  support 6 (occ 6)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight)) (MnYardFloodlightOfInheritanceFloodlight $x0))

;; p201766  support 6 (occ 6)  size 1  root feed_pipe (constant)  depth 1
;;   e.g. tierA-000046 tierA-000047 tierA-000048
;;   single atom; not a proposal (a one-atom pack is a rename)
(Inheritance feed_pipe pipe)

;; p201775  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Lend_Recipient_Theme $e0 $x0 $x1 $x2))

;; p201776  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1)) (MnAgent_Repair_Past_Patient $e0 $x0 $x1))

;; p201777  support 6 (occ 6)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Teach_Recipient_Theme $e0 $x0 $x1 $x2))

;; p201792  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 $x2)) (MnAgent_Location_Theme $e0 $x0 $x1 $x2))

;; p201794  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1)) (MnAgent_Order_Theme $e0 $x0 $x1))

;; p201798  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0)) (MnExperiencer_Location_Ongoing $e0 $x0 $x1))

;; p201799  support 6 (occ 8)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0)) (MnExperiencer_Location_Past $e0 $x0 $x1))

;; p201800  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000086 tierA-000087 tierA-000088
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1)) (MnHolder_Require_Theme $e0 $x0 $x1))

;; p201801  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(Implication (And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnLocation_Past_Theme $e0 $x0 $x1))

;; p201802  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(Implication (And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0)) (MnHear_Past_Stimulus $e0 $x0))

;; p201804  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(Implication (And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1)) (MnPast_Patient_Source $e0 $x0 $x1))

;; p201837  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1)) (MnAgent_CoAgent $e0 $x0 $x1))

;; p201838  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come)) (MnAgent_Come $e0 $x0))

;; p201839  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000398 tierB-000100 tierB-000298
(Implication (And (Agent $e0 $x0) (Member $e0 leave)) (MnAgent_Leave $e0 $x0))

;; p201841  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000174 tierA-000178 tierA-000182
(Implication (And (Agent $e0 $x0) (Member $e0 take)) (MnAgent_Take $e0 $x0))

;; p201842  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000376 tierA-000381 tierA-000386
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnAgentOfDoctor $e0 $x0))

;; p201843  support 6 (occ 9)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001416 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $x0 man)) (MnAgentOfMan $e0 $x0))

;; p201846  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000084 tierA-000085 tierA-000086
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg)) (MnCardinalityNum_GroupOfEgg $x0))

;; p201847  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(Implication (And (Cardinality $x0 <num>) (SubsetOf $x0 $x1)) (MnCardinalityNum_SubsetOf $x0 $x1))

;; p201848  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000191 tierB-001160 tierB-001485
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 person)) (MnExperiencerOfGroupOfPerson $e0 $x0))

;; p201849  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Theme $e0 $e1)) (MnExperiencer_ThemeEv $e0 $e1 $x0))

;; p201850  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go)) (MnGoal_Go $e0 $x0))

;; p201851  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Theme $e0 $x1)) (MnGoal_Theme $e0 $x0 $x1))

;; p201853  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (GroupOf $x0 lemon) (Member $x0 crate)) (MnGroupOfLemon_Crate $x0))

;; p201854  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live)) (MnLocation_Live $e0 $x0))

;; p201855  support 6 (occ 6)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierB-000942
(Implication (And (Location $e0 $x0) (Theme $e1 $e0)) (MnThemeEvOfLocation $e1 $e0 $x0))

;; p201856  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0)) (MnCapture_Past $e0))

;; p201857  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000187 tierA-000191
(Implication (And (Member $e0 decision) (Theme $e0 $x0)) (MnDecision_Theme $e0 $x0))

;; p201858  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000609 tierB-000779
(Implication (And (Member $e0 fall) (Past $e0)) (MnFall_Past $e0))

;; p201859  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000577 tierB-000672 tierB-000890
(Implication (And (Member $e0 get) (Past $e0)) (MnGet_Past $e0))

;; p201861  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Member $e0 receive) (Theme $e0 $x0)) (MnReceive_Theme $e0 $x0))

;; p201862  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000978
(Implication (And (Member $e0 take) (Theme $e0 $x0)) (MnTake_Theme $e0 $x0))

;; p201863  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Patient $e0 $x0)) (MnTurn_Patient $e0 $x0))

;; p201864  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000866 tierB-000938
(Implication (And (Member $e0 use) (Theme $e0 $x0)) (MnUse_Theme $e0 $x0))

;; p201865  support 6 (occ 6)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
(Implication (And (Member $x0 budget) (Possession $x0 next_year)) (MnBudget_PossessionNextYear $x0))

;; p201867  support 6 (occ 6)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000080 tierB-000147 tierB-001143
(Implication (And (Obligated $e0) (Past $e0)) (MnObligated_Past $e0))

;; p201868  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(Implication (And (Past $e0) (Patient $e0 $e1)) (MnPast_PatientEv $e0 $e1))

;; p201869  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(Implication (And (Past $e0) (Time $e0 yesterday)) (MnPast_TimeYesterday $e0))

;; p201870  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Patient $e0 $x0) (Theme $e0 $e1)) (MnPatient_ThemeEv $e0 $e1 $x0))

;; p201913  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000805 tierB-000969 tierB-001547
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 $e1)

;; p201914  support 6 (occ 6)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000218 tierB-000616
;;   single atom; not a proposal (a one-atom pack is a rename)
(Already $e0)

;; p201915  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000599 tierB-000892 tierB-001212
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $x0 $x1)

;; p201916  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-000622 tierB-001271
;;   single atom; not a proposal (a one-atom pack is a rename)
(From $x0 $x1)

;; p201918  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000656 tierB-000712
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 student)

;; p201919  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Like $e0 $x0)

;; p201920  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 block)

;; p201922  support 6 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000079 tierB-000188 tierB-000218
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 close)

;; p201923  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001236 tierB-001520 tierB-001721
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 do)

;; p201924  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000858
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 help)

;; p201925  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 learn)

;; p201927  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000327 tierB-000550
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 talk)

;; p201928  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 wait)

;; p201929  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-000651
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 watch)

;; p201930  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 boy)

;; p201932  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000160 tierB-001021 tierB-001114
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 child)

;; p201933  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 club)

;; p201934  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 committee)

;; p201935  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 electrician)

;; p201936  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000196 tierA-000197 tierA-000198
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 family)

;; p201937  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000687 tierB-000792 tierB-000798
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 floor)

;; p201938  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 gate)

;; p201939  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000145 tierB-000383 tierB-000981
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 horse)

;; p201940  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000190 tierA-000191 tierA-000192
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 judge)

;; p201941  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000327 tierA-000331 tierA-000335
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 large)

;; p201942  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000266 tierA-000267 tierA-000268
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 library)

;; p201943  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000561 tierB-000685 tierB-000708
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 light)

;; p201944  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 mechanic)

;; p201945  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 pilot)

;; p201946  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000180 tierB-000498 tierB-000841
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 rain)

;; p201947  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 search)

;; p201948  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000805 tierB-000951 tierB-001384
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sound)

;; p201949  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 squad)

;; p201950  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000882 tierB-001111
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 street)

;; p201951  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000212 tierA-000213 tierA-000214
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 tower)

;; p201952  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000261 tierB-000343 tierB-000560
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wall)

;; p201953  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000082 tierB-001123 tierB-001169
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 whole)

;; p201954  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 winner)

;; p201955  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wreck)

;; p201957  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000097 tierB-000201 tierB-000790
;;   single atom; not a proposal (a one-atom pack is a rename)
(On $e0 $x0)

;; p201959  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 (Weekday sunday))

;; p201968  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall)) (MnAgentOfSchool_BeneficiaryOfHall $e0 $x0 $x1))

;; p201969  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0)) (MnAgentOfSchool_Beneficiary_Past $e0 $x0 $x1))

;; p201970  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2)) (MnAgentOfSchool_Beneficiary_Theme $e0 $x0 $x1 $x2))

;; p201971  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0)) (MnAgent_BeneficiaryOfHall_Past $e0 $x0 $x1))

;; p201972  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2)) (MnAgent_BeneficiaryOfHall_Theme $e0 $x0 $x1 $x2))

;; p201973  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Theme $e0 $x1)) (MnAgentOfCardinalityNum-GroupOfClimber_Theme $e0 $x0 $x1))

;; p201974  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgentOfCardinalityNum_ThemeOfNorthRoute $e0 $x0 $x1))

;; p201975  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1)) (MnAgent_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0 $x1))

;; p201976  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOfDepot_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p201977  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgentOfGroupOfClimber_ThemeOfNorthRoute $e0 $x0 $x1))

;; p201978  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOfDepot_ThemeOfGroupOfForklift $e0 $x0 $x1))

;; p201979  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfGroupOfForklift $e0 $x0 $x1))

;; p201980  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Agent $e0 $x0) (Inheritance north_route north) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_ThemeOfNorthRouteOfInheritanceNorth $e0 $x0 $x1))

;; p201981  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Agent $e0 $x0) (Inheritance north_route route) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_ThemeOfNorthRouteOfInheritanceRoute $e0 $x0 $x1))

;; p201982  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0)) (MnAgentOfPotteryStudioOfInheritanceStudio_Past $e0 $x0))

;; p201983  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgentOfPotteryStudioOfInheritanceStudio_Theme $e0 $x0 $x1))

;; p201984  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1)) (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight $e0 $x0 $x1))

;; p201985  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point) (Theme $e0 $x2)) (MnAgent_LocationOfPoint_Theme $e0 $x0 $x1 $x2))

;; p201986  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
(Implication (And (Agent $e0 $x0) (Member $x0 club) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgentOfClub_ThemeOfTournament $e0 $x0 $x1))

;; p201987  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1)) (MnAgentOfDepot_Past_Theme $e0 $x0 $x1))

;; p201988  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1)) (MnAgentOfElectrician_PatientOfYardFloodlight $e0 $x0 $x1))

;; p201989  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1)) (MnAgentOfElectrician_Past_Patient $e0 $x0 $x1))

;; p201990  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgentOfPotteryStudio_ThemeOfKiln $e0 $x0 $x1))

;; p201991  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1)) (MnAgentOfPotteryStudio_Past_Theme $e0 $x0 $x1))

;; p201992  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1)) (MnAgentOfSchool_Past_Theme $e0 $x0 $x1))

;; p201993  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfKiln $e0 $x0 $x1))

;; p201994  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_PatientOfYardFloodlight $e0 $x0 $x1))

;; p201995  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1)) (MnBeneficiaryOfHall_ThemeOfProjector $e0 $x0 $x1))

;; p201996  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_ThemeOfProjector $e0 $x0 $x1))

;; p201997  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfGroupOfLemon-Crate $e0 $x0))

;; p201998  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
(Implication (And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september))) (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember $e0 $x0))

;; p201999  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
(Implication (And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0)) (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute $e0 $x0))

;; p202000  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
(Implication (And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn)) (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn $e0 $x0))

;; p202001  support 5 (occ 5)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfYardFloodlightOfInheritanceFloodlight $e0 $x0))

;; p202002  support 5 (occ 5)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_ThemeEvOfOngoing-Patient $e0 $e1 $x0))

;; p202281  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000174 tierA-000178 tierB-000942
(Implication (And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfLocation $e0 $e1 $x0 $x1))

;; p202282  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
(Implication (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1)) (MnAgentOfAutomobile_Theme $e0 $x0 $x1))

;; p202283  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(Implication (And (Agent $e0 $x0) (Member $x0 boy) (Past $e0)) (MnAgentOfBoy_Past $e0 $x0))

;; p202288  support 5 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001813
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0)) (MnAgentOfPerson_Past $e0 $x0))

;; p202289  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1)) (MnAgentOfPerson_Patient $e0 $x0 $x1))

;; p202294  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1)) (MnAgent_ThemeOfSong $e0 $x0 $x1))

;; p202298  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
(Implication (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0)) (MnRequire_ThemeOfCardinalityNum $e0 $x0))

;; p202299  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfCardinalityNum $e0 $x0))

;; p202312  support 5 (occ 5)  size 3  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
(Implication (And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0)) (MnTender_PossessionOfFirm $x1 $x0))

;; p202315  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(Implication (And (Member $x0 thing) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfThing $e0 $x0))

;; p202318  support 5 (occ 5)  size 3  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPatient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p202454  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
(Implication (And (Inheritance afternoon_session session) (Member $x0 afternoon_session)) (MnAfternoonSessionOfInheritanceSession $x0))

;; p202456  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal)) (MnDressRehearsalOfInheritanceRehearsal $x0))

;; p202457  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
(Implication (And (Inheritance evening_flight flight) (Member $x0 evening_flight)) (MnEveningFlightOfInheritanceFlight $x0))

;; p202458  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
(Implication (And (Inheritance loan_application application) (Member $x0 loan_application)) (MnLoanApplicationOfInheritanceApplication $x0))

;; p202461  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
(Implication (And (Inheritance rescue_team team) (Member $x0 rescue_team)) (MnRescueTeamOfInheritanceTeam $x0))

;; p202463  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
(Implication (And (Inheritance summer_fair fair) (Member $x0 summer_fair)) (MnSummerFairOfInheritanceFair $x0))

;; p202490  support 5 (occ 5)  size 2  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
(Implication (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing)) (MnInheritanceMonthly_InheritanceServicing monthly_servicing))

;; p202543  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0) (Theme $e0 $x2)) (MnAgent_Beneficiary_Past_Theme $e0 $x0 $x1 $x2))

;; p202544  support 5 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(Implication (And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1)) (MnHolder_Have_Past_Theme $e0 $x0 $x1))

;; p202567  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2)) (MnAgent_CoAgent_Location $e0 $x0 $x1 $x2))

;; p202568  support 5 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000319
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work)) (MnAgent_Location_Work $e0 $x0 $x1))

;; p202569  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(Implication (And (Agent $e0 $x0) (Member $e0 come) (Past $e0)) (MnAgent_Come_Past $e0 $x0))

;; p202570  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
(Implication (And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1)) (MnAgent_Examine_Theme $e0 $x0 $x1))

;; p202571  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
(Implication (And (Agent $e0 $x0) (Member $e0 sign) (Patient $e0 $x1)) (MnAgent_Sign_Patient $e0 $x0 $x1))

;; p202572  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(Implication (And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1)) (MnAgent_Past_Recipient $e0 $x0 $x1))

;; p202573  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(Implication (And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1)) (MnAgent_Past_Source $e0 $x0 $x1))

;; p202574  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Implication (And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1)) (MnAgent_Past_Through $e0 $x0 $x1))

;; p202575  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Theme $e0 $x0)) (MnThemeOfCardinalityNum-GroupOfEgg $e0 $x0))

;; p202576  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(Implication (And (Goal $e0 $x0) (Member $e0 go) (Past $e0)) (MnGoal_Go_Past $e0 $x0))

;; p202577  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(Implication (And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnGoal_Past_Theme $e0 $x0 $x1))

;; p202581  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Implication (And (Member $e0 capture) (Past $e0) (Theme $e0 $x0)) (MnCapture_Past_Theme $e0 $x0))

;; p202582  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000609 tierB-000779 tierB-001306
(Implication (And (Member $e0 fall) (Past $e0) (Patient $e0 $x0)) (MnFall_Past_Patient $e0 $x0))

;; p202583  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
(Implication (And (Member $e0 kill) (Past $e0) (Patient $e0 $x0)) (MnKill_Past_Patient $e0 $x0))

;; p202584  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000073 tierB-000964 tierB-001339
(Implication (And (Member $e0 make) (Past $e0) (Patient $e0 $x0)) (MnMake_Past_Patient $e0 $x0))

;; p202585  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnSell_Past_Theme $e0 $x0))

;; p202586  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(Implication (And (Member $e0 start) (Past $e0) (Patient $e0 $x0)) (MnStart_Past_Patient $e0 $x0))

;; p202587  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(Implication (And (Member $e0 try) (Past $e0) (Theme $e0 $e1)) (MnTry_Past_ThemeEv $e0 $e1))

;; p202588  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
(Implication (And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0)) (MnThemeOfBudget-PossessionNextYear $e0 $x0))

;; p202589  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnPast_Recipient_Theme $e0 $x0 $x1))

;; p202649  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000156 tierB-000556 tierB-000745
(Implication (And (Agent $e0 $x0) (Can $e0)) (MnAgent_Can $e0 $x0))

;; p202651  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
(Implication (And (Agent $e0 $x0) (Member $e0 block)) (MnAgent_Block $e0 $x0))

;; p202653  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000160 tierB-000648 tierB-001125
(Implication (And (Agent $e0 $x0) (Member $e0 play)) (MnAgent_Play $e0 $x0))

;; p202654  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
(Implication (And (Agent $e0 $x0) (Member $e0 reach)) (MnAgent_Reach $e0 $x0))

;; p202655  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Agent $e0 $x0) (Member $e0 receive)) (MnAgent_Receive $e0 $x0))

;; p202657  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001205
(Implication (And (Agent $e0 $x0) (Member $e0 watch)) (MnAgent_Watch $e0 $x0))

;; p202662  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000196 tierA-000197 tierA-000198
(Implication (And (Agent $e0 $x0) (Member $x0 family)) (MnAgentOfFamily $e0 $x0))

;; p202663  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
(Implication (And (Agent $e0 $x0) (Member $x0 fire)) (MnAgentOfFire $e0 $x0))

;; p202664  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
(Implication (And (Agent $e0 $x0) (Member $x0 judge)) (MnAgentOfJudge $e0 $x0))

;; p202665  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
(Implication (And (Agent $e0 $x0) (Member $x0 pilot)) (MnAgentOfPilot $e0 $x0))

;; p202667  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
(Implication (And (Agent $e0 $x0) (Member $x0 tutor)) (MnAgentOfTutor $e0 $x0))

;; p202668  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000182 tierA-000186 tierA-000191
(Implication (And (Agent $e0 $x0) (Patient $e0 $e1)) (MnAgent_PatientEv $e0 $e1 $x0))

;; p202669  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(Implication (And (Agent $e0 $x0) (Result $e0 $e1)) (MnAgent_ResultEv $e0 $e1 $x0))

;; p202670  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
(Implication (And (Agent $e0 $x0) (Theme $e0 glazing)) (MnAgent_ThemeGlazing $e0 $x0))

;; p202672  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
(Implication (And (Agent $e0 $x0) (Time $e0 (Hour <num>))) (MnAgent_Time(HourNum $e0 $x0))

;; p202673  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(Implication (And (Already $e0) (Patient $e0 $x0)) (MnAlready_Patient $e0 $x0))

;; p202674  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 child)) (MnCardinalityNum_GroupOfChild $x0))

;; p202679  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001003 tierB-001334 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep)) (MnExperiencer_Sleep $e0 $x0))

;; p202680  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(Implication (And (Experiencer $e0 $x0) (Source $e0 $x1)) (MnExperiencer_Source $e0 $x0 $x1))

;; p202683  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000393 tierB-000412
(Implication (And (GroupOf $x0 person) (Patient $e0 $x0)) (MnPatientOfGroupOfPerson $e0 $x0))

;; p202684  support 5 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000162 tierB-000483 tierB-001069
(Implication (And (GroupOf $x0 thing) (Theme $e0 $x0)) (MnThemeOfGroupOfThing $e0 $x0))

;; p202686  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(Implication (And (In $e0 $x0) (Past $e0)) (MnIn_Past $e0 $x0))

;; p202689  support 5 (occ 5)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Location $e0 $x0) (Stimulus $e1 $e0)) (MnStimulusEvOfLocation $e1 $e0 $x0))

;; p202691  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000517 tierB-001491
(Implication (And (Member $e0 change) (Patient $e0 $x0)) (MnChange_Patient $e0 $x0))

;; p202692  support 5 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
(Implication (And (Member $e0 contain) (Theme $e0 $x0)) (MnContain_Theme $e0 $x0))

;; p202693  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000253 tierA-000255 tierA-000257
(Implication (And (Member $e0 die) (Patient $e0 $x0)) (MnDie_Patient $e0 $x0))

;; p202694  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000056 tierA-000060 tierA-000071
(Implication (And (Member $e0 end) (Patient $e0 $x0)) (MnEnd_Patient $e0 $x0))

;; p202696  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0)) (MnGet_Ongoing $e0))

;; p202697  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(Implication (And (Member $e0 get) (Patient $e0 $x0)) (MnGet_Patient $e0 $x0))

;; p202698  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000370 tierB-000748
(Implication (And (Member $e0 get) (Result $e0 $e1)) (MnGet_ResultEv $e0 $e1))

;; p202700  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000298 tierB-000425 tierB-000704
(Implication (And (Member $e0 leave) (Past $e0)) (MnLeave_Past $e0))

;; p202701  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000114 tierB-000339
(Implication (And (Member $e0 need) (Theme $e0 $e1)) (MnNeed_ThemeEv $e0 $e1))

;; p202702  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000056 tierB-000302 tierB-001487
(Implication (And (Member $e0 open) (Patient $e0 $x0)) (MnOpen_Patient $e0 $x0))

;; p202705  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001334 tierB-001753
(Implication (And (Member $e0 sleep) (Ongoing $e0)) (MnSleep_Ongoing $e0))

;; p202706  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
(Implication (And (Member $e0 stand) (Past $e0)) (MnStand_Past $e0))

;; p202707  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000203 tierB-000225 tierB-001084
(Implication (And (Member $e0 study) (Ongoing $e0)) (MnStudy_Ongoing $e0))

;; p202708  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0)) (MnTurn_Past $e0))

;; p202709  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000419 tierB-000867 tierB-001515
(Implication (And (Member $e0 work) (Past $e0)) (MnWork_Past $e0))

;; p202712  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000191 tierA-000192
(Implication (And (Member $x0 case) (Theme $e0 $x0)) (MnThemeOfCase $e0 $x0))

;; p202714  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
(Implication (And (Member $x0 file) (Member $x0 missing)) (MnFile_Missing $x0))

;; p202716  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Member $x0 gearbox) (Member $x0 seized)) (MnGearbox_Seized $x0))

;; p202719  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
(Implication (And (Member $x0 roof) (Theme $e0 $x0)) (MnThemeOfRoof $e0 $x0))

;; p202723  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(Implication (And (Member $x0 sound) (Patient $e0 $x0)) (MnPatientOfSound $e0 $x0))

;; p202727  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000229 tierB-001066 tierB-001243
(Implication (And (PartOf $x0 $x1) (Theme $e0 $x0)) (MnThemeOfPartOf $e0 $x0 $x1))

;; p202728  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(Implication (And (Past $e0) (Stimulus $e0 $e1)) (MnPast_StimulusEv $e0 $e1))

;; p202729  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(Implication (And (Past $e0) (Time $e0 (Year <num>))) (MnPast_Time(YearNum $e0))

;; p202730  support 5 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(Implication (And (Past $e0) (TimeAtMost $e0 (Year <num>))) (MnPast_TimeAtMost(YearNum $e0))

;; p202797  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-000867 tierB-001782
;;   single atom; not a proposal (a one-atom pack is a rename)
(During $e0 $e1)

;; p202798  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000295 tierB-000705 tierB-000959
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 book)

;; p202799  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001316 tierB-001457 tierB-001530
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 boy)

;; p202801  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001252 tierB-001284 tierB-001697
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 cloud)

;; p202802  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000085 tierB-000615 tierB-001450
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 flower)

;; p202803  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 sample)

;; p202804  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000378 tierB-000653
;;   single atom; not a proposal (a one-atom pack is a rename)
(Location $e0 here)

;; p202805  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001084
;;   single atom; not a proposal (a one-atom pack is a rename)
(Measure $e0 duration <num> year)

;; p202806  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001079
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 become)

;; p202809  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-000616
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 eat)

;; p202812  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 look)

;; p202813  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 provide)

;; p202814  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 purchase)

;; p202815  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 say)

;; p202818  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-000792
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 stop)

;; p202819  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000782 tierB-001008
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 swim)

;; p202820  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000434 tierB-000667 tierB-000830
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 travel)

;; p202821  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000250 tierB-000626 tierB-000846
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 want)

;; p202823  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 airline)

;; p202825  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 apprentice)

;; p202826  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 archive)

;; p202827  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000748 tierB-000790 tierB-001594
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bad)

;; p202828  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000335 tierA-000336 tierA-000337
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bench)

;; p202829  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000541 tierB-001509
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 black)

;; p202830  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000937 tierB-001124
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 blue)

;; p202831  support 5 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000083 tierB-000475 tierB-000541
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 box)

;; p202832  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bridge)

;; p202833  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 caller)

;; p202834  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 chart)

;; p202835  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 clerk)

;; p202836  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 coach)

;; p202837  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000912 tierB-001821
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 corner)

;; p202838  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 council)

;; p202839  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 departure)

;; p202840  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000351 tierA-000355 tierA-000359
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 difficult)

;; p202841  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 diver)

;; p202843  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 driver)

;; p202844  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000353 tierA-000362 tierB-000246
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 easy)

;; p202845  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 editor)

;; p202849  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 flood)

;; p202850  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 footbridge)

;; p202851  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000233 tierB-000369 tierB-000386
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fridge)

;; p202852  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-000861 tierB-000918
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 full)

;; p202853  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 gallery)

;; p202855  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 generator)

;; p202856  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 greenhouse)

;; p202857  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000352 tierA-000356 tierA-000360
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 hard)

;; p202858  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 intern)

;; p202859  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 lane)

;; p202860  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000122 tierB-000608 tierB-000728
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 language)

;; p202861  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 last)

;; p202862  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 lathe)

;; p202864  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 lunch)

;; p202865  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 manifest)

;; p202866  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 manuscript)

;; p202868  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 neighbour)

;; p202870  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000177 tierA-000178 tierA-000179
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 nurse)

;; p202871  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000306 tierA-000307 tierA-000308
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 painting)

;; p202872  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 panel)

;; p202873  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 permit)

;; p202874  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 potter)

;; p202876  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 proposal)

;; p202877  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 query)

;; p202879  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 scan)

;; p202882  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000329 tierA-000338 tierB-000647
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 small)

;; p202884  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 survey)

;; p202887  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000238 tierB-000808 tierB-000900
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 train)

;; p202889  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 vet)

;; p202890  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 vote)

;; p202891  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000138 tierB-001190 tierB-001459
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 way)

;; p202892  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000062 tierB-001163 tierB-001306
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wind)

;; p202893  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000090 tierB-000108 tierB-001275
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 world)

;; p202894  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   single atom; not a proposal (a one-atom pack is a rename)
(Of $x0 $x1)

;; p202895  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   single atom; not a proposal (a one-atom pack is a rename)
(Ordinal $x0 <num> scan)

;; p202896  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
;;   single atom; not a proposal (a one-atom pack is a rename)
(Over $e0 $x0)

;; p202897  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000089 tierB-000919 tierB-001016
;;   single atom; not a proposal (a one-atom pack is a rename)
(Still $e0)

;; p202902  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 today)

;; p202904  support 5 (occ 5)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000224 tierB-000439 tierB-000726
;;   single atom; not a proposal (a one-atom pack is a rename)
(Yet $e0)

;; p202913  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2)) (MnAgent_Beneficiary_ThemeOfProjector $e0 $x0 $x1 $x2))

;; p202914  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Buy_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p202915  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1)) (MnAgentOfChef_ThemeOfGroupOfLemon $e0 $x0 $x1))

;; p202916  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1)) (MnAgent_ThemeOfGroupOfLemon-Crate $e0 $x0 $x1))

;; p202917  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfGroupOfLemon $e0 $x0 $x1))

;; p202918  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
(Implication (And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_PatientOfAfternoonSessionOfInheritanceSession $e0 $x0 $x1))

;; p202919  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
(Implication (And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team) (Theme $e0 $x1)) (MnAgentOfRescueTeamOfInheritanceTeam_Theme $e0 $x0 $x1))

;; p202920  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
(Implication (And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1)) (MnAgent_PatientOfSummerFairOfInheritanceFair $e0 $x0 $x1))

;; p202921  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x1 point)) (MnAgent_LocationOfPoint_Discover $e0 $x0 $x1))

;; p202922  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist) (Member $x1 survey)) (MnAgentOfBiologist_LocationOfSurvey $e0 $x0 $x1))

;; p202923  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point)) (MnAgentOfDiver_LocationOfPoint $e0 $x0 $x1))

;; p202924  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2)) (MnAgentOfDiver_Location_Theme $e0 $x0 $x1 $x2))

;; p202925  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2)) (MnAgent_Location_ThemeOfWreck $e0 $x0 $x1 $x2))

;; p202926  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
(Implication (And (Agent $e0 $x0) (Member $e0 block) (Member $x1 lane) (Theme $e0 $x1)) (MnAgent_Block_ThemeOfLane $e0 $x0 $x1))

;; p202927  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1)) (MnAgent_Make_PatientEvOfDecision $e0 $e1 $x0))

;; p202928  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1)) (MnAgent_Reach_ThemeEvOfDecision $e0 $e1 $x0))

;; p202929  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Start_ThemeEvOfOngoing $e0 $e1 $x0))

;; p202930  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0)) (MnStart_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p202931  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0)) (MnStart_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p202932  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
(Implication (And (Agent $e0 $x0) (Member $x0 board) (Member $x1 vote) (Theme $e0 $x1)) (MnAgentOfBoard_ThemeOfVote $e0 $x0 $x1))

;; p202933  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1)) (MnAgentOfChef_ThemeOfCrate $e0 $x0 $x1))

;; p202934  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1)) (MnAgentOfChef_Past_Theme $e0 $x0 $x1))

;; p202935  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
(Implication (And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1)) (MnAgentOfCouncil_PatientOfSummerFair $e0 $x0 $x1))

;; p202936  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Agent $e0 $x0) (Member $x0 diver) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgentOfDiver_ThemeOfWreck $e0 $x0 $x1))

;; p202937  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
(Implication (And (Agent $e0 $x0) (Member $x0 editor) (Member $x1 manuscript) (Theme $e0 $x1)) (MnAgentOfEditor_ThemeOfManuscript $e0 $x0 $x1))

;; p202939  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
(Implication (And (Agent $e0 $x0) (Member $x0 firm) (Member $x1 tender) (Theme $e0 $x1)) (MnAgentOfFirm_ThemeOfTender $e0 $x0 $x1))

;; p202941  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
(Implication (And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 file) (Theme $e0 $x1)) (MnAgentOfIntern_ThemeOfFile $e0 $x0 $x1))

;; p202942  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
(Implication (And (Agent $e0 $x0) (Member $x0 intern) (Member $x1 missing) (Theme $e0 $x1)) (MnAgentOfIntern_ThemeOfMissing $e0 $x0 $x1))

;; p202943  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1)) (MnAgentOfMechanic_PatientOfGearbox $e0 $x0 $x1))

;; p202944  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1)) (MnAgentOfMechanic_PatientOfSeized $e0 $x0 $x1))

;; p202945  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1)) (MnAgentOfMechanic_Past_Patient $e0 $x0 $x1))

;; p202946  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
(Implication (And (Agent $e0 $x0) (Member $x0 panel) (Member $x1 proposal) (Theme $e0 $x1)) (MnAgentOfPanel_ThemeOfProposal $e0 $x0 $x1))

;; p202947  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1)) (MnAgentOfPerson_Past_Patient $e0 $x0 $x1))

;; p202948  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
(Implication (And (Agent $e0 $x0) (Member $x0 rescue_team) (Member $x1 search) (Theme $e0 $x1)) (MnAgentOfRescueTeam_ThemeOfSearch $e0 $x0 $x1))

;; p202949  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1)) (MnAgentOfSchool_ThemeOfProjector $e0 $x0 $x1))

;; p202950  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
(Implication (And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgentOfTutor_PatientOfAfternoonSession $e0 $x0 $x1))

;; p202951  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
(Implication (And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfCrate $e0 $x0 $x1))

;; p202952  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
(Implication (And (Agent $e0 $x0) (Member $x1 file) (Member $x1 missing) (Theme $e0 $x1)) (MnAgent_ThemeOfFile-Missing $e0 $x0 $x1))

;; p202953  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x1 gearbox) (Member $x1 seized) (Patient $e0 $x1)) (MnAgent_PatientOfGearbox-Seized $e0 $x0 $x1))

;; p202954  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x1 gearbox) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_PatientOfGearbox $e0 $x0 $x1))

;; p202955  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
(Implication (And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfProjector $e0 $x0 $x1))

;; p202957  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Agent $e0 $x0) (Member $x1 seized) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_PatientOfSeized $e0 $x0 $x1))

;; p202959  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000858 tierB-000942 tierB-001697
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_Past_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p202960  support 4 (occ 4)  size 4  root $x0 (entity)  depth 4
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1)) (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal $x0 $e0 $x1))

;; p202961  support 4 (occ 4)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Before $x0 $e0) (Member $x0 lunch) (Member $x1 dress_rehearsal) (Patient $e0 $x1)) (MnBeforeEvOfPatientOfDressRehearsal_Lunch $x0 $e0 $x1))

;; p202962  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0)) (MnHolder_ThemeOfCardinalityNum-GroupOfEgg $e0 $x0 $x1))

;; p202963  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0)) (MnRequire_ThemeOfCardinalityNum-GroupOfEgg $e0 $x0))

;; p202964  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnHolder_Require_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p202965  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0)) (MnHolderOfRecipe_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p202966  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_ThemeOfCardinalityNum $e0 $x0))

;; p202967  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x1 ledger) (Stimulus $e0 $e1)) (MnExperiencer_StimulusEvOfLocationOfLedger $e0 $e1 $x0 $x1))

;; p202968  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
(Implication (And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0)) (MnFuture_PatientOfAppleHarvestOfInheritanceHarvest $e0 $x0))

;; p202969  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
(Implication (And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september))) (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember $e0 $x0))

;; p202970  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0)) (MnHolderOfRecipe_ThemeOfGroupOfEgg $e0 $x0 $x1))

;; p202971  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point) (Theme $e0 $x1)) (MnLocationOfPoint_Discover_Theme $e0 $x0 $x1))

;; p202972  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
(Implication (And (Location $e0 $x0) (Member $x0 point) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocationOfPoint_ThemeOfWreck $e0 $x0 $x1))

;; p202975  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(Implication (And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1)) (MnStart_Patient_ThemeEvOfOngoing $e0 $e1 $x0))

;; p202977  support 4 (occ 4)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
(Implication (And (Member $x0 firm) (Member $x1 tender) (Possession $x1 $x0) (Theme $e0 $x1)) (MnThemeOfTender-PossessionOfFirm $e0 $x0 $x1))

;; p202978  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
(Implication (And (Member $x0 gearbox) (Member $x0 seized) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfGearbox-Seized $e0 $x0))

;; p202979  support 4 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
(Implication (And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning)) (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning $e0 $x0))

;; p202980  support 4 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001394
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0)) (MnPast_ThemeEvOfOngoing-Patient $e1 $e0 $x0))

;; p203430  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000006 tierB-000738 tierB-000772
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0)) (MnAgentOfCardinalityNum_Past $e0 $x0))

;; p203431  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000587 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0)) (MnAgentOfGroupOfChild_Ongoing $e0 $x0))

;; p203433  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Theme $e0 $x1)) (MnAgent_ThemeOfGroupOfSample $e0 $x0 $x1))

;; p203441  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(Implication (And (Agent $e0 $x0) (Member $x0 cat) (Past $e0)) (MnAgentOfCat_Past $e0 $x0))

;; p203444  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgentOfClerk_Theme $e0 $x0 $x1))

;; p203446  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
(Implication (And (Agent $e0 $x0) (Member $x0 delegation) (Time $e0 (Weekday thursday))) (MnAgentOfDelegation_Time(WeekdayThursday $e0 $x0))

;; p203451  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1)) (MnAgentOfMan_Patient $e0 $x0 $x1))

;; p203454  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Theme $e0 $x1)) (MnAgentOfMuseum_Theme $e0 $x0 $x1))

;; p203456  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000213 tierA-000214
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Theme $e0 $x1)) (MnAgentOfPilot_Theme $e0 $x0 $x1))

;; p203461  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1)) (MnAgent_ThemeOfDrill $e0 $x0 $x1))

;; p203464  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1)) (MnAgent_ThemeOfGenerator $e0 $x0 $x1))

;; p203466  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgent_ThemeOfManifest $e0 $x0 $x1))

;; p203471  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
(Implication (And (Agent $e0 $x0) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_ThemeOfScan $e0 $x0 $x1))

;; p203479  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_ThemeOfOrdinalNumScan $e0 $x0 $x1))

;; p203483  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0)) (MnHave_ThemeOfCardinalityNum $e0 $x0))

;; p203484  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000004 tierA-000265 tierA-000280
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p203490  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
(Implication (And (Holder $e0 $x0) (Member $x0 permit) (Theme $e0 $x1)) (MnHolderOfPermit_Theme $e0 $x0 $x1))

;; p203494  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
(Implication (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0))

;; p203497  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger)) (MnLocationOfLedger_Error $e0 $x0))

;; p203499  support 4 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(Implication (And (Location $e0 $x0) (Member $x0 table) (Past $e0)) (MnLocationOfTable_Past $e0 $x0))

;; p203506  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000056 tierB-001487 tierB-001523
(Implication (And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0)) (MnOpen_PatientOfDoor $e0 $x0))

;; p203507  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
(Implication (And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1)) (MnDeparture_PossessionOfFerry $x0 $x1))

;; p203512  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(Implication (And (Member $x0 new) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfNew $e0 $x0))

;; p203514  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000805 tierB-001384 tierB-001894
(Implication (And (Member $x0 sound) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfSound $e0 $x0))

;; p203515  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(Implication (And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfOf $e0 $x0 $x1))

;; p203516  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(Implication (And (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnPast_ThemeEvOfPast $e0 $e1))

;; p203517  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(Implication (And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1)) (MnPast_PatientOfSubsetOf $e0 $x0 $x1))

;; p203725  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
(Implication (And (GroupOf $x0 soil_sample) (Inheritance soil_sample sample)) (MnGroupOfSoilSampleOfInheritanceSample $x0))

;; p203728  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000363 tierA-000364 tierA-000365
(Implication (And (Inheritance night_crew crew) (Member $x0 night_crew)) (MnNightCrewOfInheritanceCrew $x0))

;; p203729  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000347 tierA-000348 tierA-000349
(Implication (And (Inheritance spoil_mound mound) (Member $x0 spoil_mound)) (MnSpoilMoundOfInheritanceMound $x0))

;; p203763  support 4 (occ 4)  size 1  root night_delivery (constant)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   single atom; not a proposal (a one-atom pack is a rename)
(Inheritance night_delivery delivery)

;; p203790  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Theme $e0 $x2)) (MnAgent_Location_Discover_Theme $e0 $x0 $x1 $x2))

;; p203791  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1)) (MnAgent_Acquire_Past_Theme $e0 $x0 $x1))

;; p203792  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1)) (MnAgent_Purchase_Past_Theme $e0 $x0 $x1))

;; p203793  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Receive_Source_Theme $e0 $x0 $x1 $x2))

;; p203794  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(Implication (And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1)) (MnAgent_Start_Past_ThemeEv $e0 $e1 $x0))

;; p203795  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Teach_Recipient_ThemeGlazing $e0 $x0 $x1))

;; p203796  support 4 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnSell_Past_Recipient_Theme $e0 $x0 $x1))

;; p203834  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive)) (MnAgent_Future_Arrive $e0 $x0))

;; p203835  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000181 tierA-000183 tierB-000324
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 walk)) (MnAgent_Goal_Walk $e0 $x0 $x1))

;; p203837  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000173 tierA-000177 tierA-000180
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk)) (MnAgent_Location_Walk $e0 $x0 $x1))

;; p203841  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1)) (MnAgent_Cause_ThemeEv $e0 $e1 $x0))

;; p203842  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(Implication (And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1)) (MnAgent_Contain_Theme $e0 $x0 $x1))

;; p203843  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(Implication (And (Agent $e0 $x0) (Member $e0 jump) (Past $e0)) (MnAgent_Jump_Past $e0 $x0))

;; p203852  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(Implication (And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0)) (MnAgent_Swim_Ongoing $e0 $x0))

;; p203856  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(Implication (And (Already $e0) (Past $e0) (Patient $e0 $x0)) (MnAlready_Past_Patient $e0 $x0))

;; p203857  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001334 tierB-001753 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0)) (MnExperiencer_Sleep_Ongoing $e0 $x0))

;; p203858  support 4 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(Implication (And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0)) (MnExperiencer_Ongoing_Past $e0 $x0))

;; p203860  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(Implication (And (Goal $e0 $x0) (Member $e0 walk) (Past $e0)) (MnGoal_Walk_Past $e0 $x0))

;; p203861  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(Implication (And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnGoal_Past_Patient $e0 $x0 $x1))

;; p203862  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000392 tierB-001143 tierB-001429
(Implication (And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnInstrument_Past_Patient $e0 $x0 $x1))

;; p203865  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0)) (MnGet_Ongoing_Patient $e0 $x0))

;; p203866  support 4 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(Implication (And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1)) (MnGet_Ongoing_ResultEv $e0 $e1))

;; p203867  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(Implication (And (Member $e0 make) (Past $e0) (Result $e0 $e1)) (MnMake_Past_ResultEv $e0 $e1))

;; p203873  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000942 tierB-000987
(Implication (And (Member $e0 take) (Past $e0) (Theme $e0 $x0)) (MnTake_Past_Theme $e0 $x0))

;; p203875  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Implication (And (Member $e0 turn) (Past $e0) (Patient $e0 $x0)) (MnTurn_Past_Patient $e0 $x0))

;; p203878  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
(Implication (And (Member $x0 new) (Member $x0 roof) (Theme $e0 $x0)) (MnThemeOfNew-Roof $e0 $x0))

;; p203881  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(Implication (And (Ongoing $e0) (Past $e0) (Theme $e0 $x0)) (MnOngoing_Past_Theme $e0 $x0))

;; p203882  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1)) (MnPast_Patient_ThemeEv $e0 $e1 $x0))

;; p203883  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001325 tierB-001540
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnPast_Source_Theme $e0 $x0 $x1))

;; p203999  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(Implication (And (Agent $e0 $x0) (For $e0 $x1)) (MnAgent_For $e0 $x0 $x1))

;; p204000  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy)) (MnAgentOfGroupOfBoy $e0 $x0))

;; p204001  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(Implication (And (Agent $e0 $x0) (GroupOf $x0 student)) (MnAgentOfGroupOfStudent $e0 $x0))

;; p204003  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000076 tierA-000078
(Implication (And (Agent $e0 $x0) (Member $e0 allow)) (MnAgent_Allow $e0 $x0))

;; p204005  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000410 tierB-001551
(Implication (And (Agent $e0 $x0) (Member $e0 eat)) (MnAgent_Eat $e0 $x0))

;; p204006  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
(Implication (And (Agent $e0 $x0) (Member $e0 fly)) (MnAgent_Fly $e0 $x0))

;; p204008  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000769 tierB-001260 tierB-001262
(Implication (And (Agent $e0 $x0) (Member $e0 provide)) (MnAgent_Provide $e0 $x0))

;; p204012  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $e0 try)) (MnAgent_Try $e0 $x0))

;; p204013  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(Implication (And (Agent $e0 $x0) (Member $e0 use)) (MnAgent_Use $e0 $x0))

;; p204014  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000145
(Implication (And (Agent $e0 $x0) (Member $x0 airline)) (MnAgentOfAirline $e0 $x0))

;; p204019  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000185 tierA-000186 tierA-000187
(Implication (And (Agent $e0 $x0) (Member $x0 committee)) (MnAgentOfCommittee $e0 $x0))

;; p204020  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001130
(Implication (And (Agent $e0 $x0) (Member $x0 company)) (MnAgentOfCompany $e0 $x0))

;; p204026  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
(Implication (And (Agent $e0 $x0) (Member $x0 flood)) (MnAgentOfFlood $e0 $x0))

;; p204032  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
(Implication (And (Agent $e0 $x0) (Member $x0 storm)) (MnAgentOfStorm $e0 $x0))

;; p204033  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(Implication (And (Agent $e0 $x0) (Over $e0 $x1)) (MnAgent_Over $e0 $x0 $x1))

;; p204036  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(Implication (And (Before $e0 $e1) (Past $e1)) (MnBeforeEvOfPast_p204036 $e0 $e1))

;; p204039  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(Implication (And (Can $e0) (Patient $e0 $x0)) (MnCan_Patient $e0 $x0))

;; p204040  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-000745
(Implication (And (Can $e0) (Theme $e0 $x0)) (MnCan_Theme $e0 $x0))

;; p204041  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(Implication (And (Cardinality $x0 <num>) (LocatedIn $x0 $x1)) (MnCardinalityNum_LocatedIn $x0 $x1))

;; p204042  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(Implication (And (During $e0 $x0) (Past $e0)) (MnDuring_Past $e0 $x0))

;; p204043  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(Implication (And (Experiencer $e0 $x0) (Like $e0 $x1)) (MnExperiencer_Like $e0 $x0 $x1))

;; p204044  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000174 tierB-000339 tierB-000455
(Implication (And (Experiencer $e0 $x0) (Member $e0 need)) (MnExperiencer_Need $e0 $x0))

;; p204045  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
(Implication (And (Experiencer $e0 $x0) (Member $e0 wait)) (MnExperiencer_Wait $e0 $x0))

;; p204046  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(Implication (And (Experiencer $e0 $x0) (Possession $x0 $x1)) (MnExperiencerOfPossession $e0 $x0 $x1))

;; p204047  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(Implication (And (Experiencer $e0 $x0) (Probably $e0)) (MnExperiencer_Probably $e0 $x0))

;; p204049  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Time $e0 now)) (MnExperiencer_TimeNow $e0 $x0))

;; p204051  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierB-000437
(Implication (And (Future $e0) (Time $e0 (Hour <num>))) (MnFuture_Time(HourNum $e0))

;; p204056  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000615 tierB-000760 tierB-001208
(Implication (And (LocatedIn $x0 $x1) (Member $x1 garden)) (MnLocatedInOfGarden $x0 $x1))

;; p204057  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(Implication (And (LocatedIn $x0 $x1) (PartOf $x1 $x2)) (MnLocatedInOfPartOf $x0 $x1 $x2))

;; p204058  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(Implication (And (LocatedIn $x0 $x1) (Patient $e0 $x0)) (MnPatientOfLocatedIn $e0 $x0 $x1))

;; p204063  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000137 tierA-000313 tierA-000322
(Implication (And (Location $e0 $x0) (Might $e0)) (MnLocation_Might $e0 $x0))

;; p204066  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-000740 tierB-001582
(Implication (And (Member $e0 become) (Patient $e0 $x0)) (MnBecome_Patient $e0 $x0))

;; p204068  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0)) (MnCause_Past $e0))

;; p204070  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000054 tierA-000059 tierA-000064
(Implication (And (Member $e0 commence) (Patient $e0 $x0)) (MnCommence_Patient $e0 $x0))

;; p204071  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(Implication (And (Member $e0 decide) (Past $e0)) (MnDecide_Past $e0))

;; p204074  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001520 tierB-001721 tierB-001735
(Implication (And (Member $e0 do) (Patient $e0 $x0)) (MnDo_Patient $e0 $x0))

;; p204075  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
(Implication (And (Member $e0 find) (Past $e0)) (MnFind_Past $e0))

;; p204077  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000398 tierB-000704 tierB-000713
(Implication (And (Member $e0 leave) (Theme $e0 $x0)) (MnLeave_Theme $e0 $x0))

;; p204079  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
(Implication (And (Member $e0 pass) (Past $e0)) (MnPass_Past $e0))

;; p204083  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001035 tierB-001595
(Implication (And (Member $e0 receive) (Past $e0)) (MnReceive_Past $e0))

;; p204085  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001441
(Implication (And (Member $e0 say) (Past $e0)) (MnSay_Past $e0))

;; p204087  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000125 tierB-001515
(Implication (And (Member $e0 stop) (Past $e0)) (MnStop_Past $e0))

;; p204090  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0)) (MnTry_Ongoing $e0))

;; p204091  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Result $e0 $e1)) (MnTurn_ResultEv $e0 $e1))

;; p204092  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(Implication (And (Member $e0 use) (To $e0 $e1)) (MnUse_ToEv $e0 $e1))

;; p204093  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Member $e0 walk) (Ongoing $e0)) (MnWalk_Ongoing $e0))

;; p204095  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000335 tierA-000336 tierA-000337
(Implication (And (Member $x0 bench) (Member $x0 new)) (MnBench_New $x0))

;; p204099  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
(Implication (And (Member $x0 elm) (Member $x0 last)) (MnElm_Last $x0))

;; p204102  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000230 tierB-000890 tierB-001163
(Implication (And (Member $x0 fire) (Patient $e0 $x0)) (MnPatientOfFire $e0 $x0))

;; p204106  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000441 tierB-001005 tierB-001687
(Implication (And (Member $x0 house) (Theme $e0 $x0)) (MnThemeOfHouse $e0 $x0))

;; p204107  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000026 tierA-000027
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy)) (MnKiln_OrdinalNumBuy $x0))

;; p204108  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000297 tierA-000298
(Implication (And (Member $x0 ladder) (Theme $e0 $x0)) (MnThemeOfLadder $e0 $x0))

;; p204114  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
(Implication (And (Member $x0 painting) (Theme $e0 $x0)) (MnThemeOfPainting $e0 $x0))

;; p204121  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000176 tierB-000277 tierB-001476
(Implication (And (Member $x0 tree) (Patient $e0 $x0)) (MnPatientOfTree $e0 $x0))

;; p204125  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000517 tierB-001891 tierB-001910
(Implication (And (Ongoing $e0) (Probably $e0)) (MnOngoing_Probably $e0))

;; p204126  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(Implication (And (Ongoing $e0) (Source $e0 $x0)) (MnOngoing_Source $e0 $x0))

;; p204127  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(Implication (And (Ongoing $e0) (Theme $e0 $e1)) (MnOngoing_ThemeEv $e0 $e1))

;; p204129  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Over $e0 $x0) (Past $e0)) (MnOver_Past $e0 $x0))

;; p204131  support 4 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(Implication (And (Past $e0) (TimeAtLeast $e0 (Year <num>))) (MnPast_TimeAtLeast(YearNum $e0))

;; p204137  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(Implication (And (Theme $e0 $x0) (To $e0 $e1)) (MnTheme_ToEv $e0 $e1 $x0))

;; p204241  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000407 tierB-000518 tierB-000604
;;   single atom; not a proposal (a one-atom pack is a rename)
(Degree $x0 quantity excessive)

;; p204244  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000206 tierB-000238 tierB-000313
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> day)

;; p204245  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000938
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $e0 $e1)

;; p204246  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000308 tierB-000555 tierB-001455
;;   single atom; not a proposal (a one-atom pack is a rename)
(For $x0 $e0)

;; p204247  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000463 tierB-000513 tierB-001553
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 day)

;; p204248  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 girl)

;; p204249  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000098 tierB-000832 tierB-001246
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 leaf)

;; p204250  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000243 tierB-000277 tierB-001068
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 man)

;; p204251  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000194 tierB-000794 tierB-001080
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 pupil)

;; p204252  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000225 tierB-000533 tierB-001251
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 scientist)

;; p204254  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000274 tierB-001058 tierB-001695
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 soldier)

;; p204255  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000518 tierB-000972 tierB-001495
;;   single atom; not a proposal (a one-atom pack is a rename)
(LocatedIn $x0 here)

;; p204256  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001496 tierB-001572
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 immediately)

;; p204257  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000407 tierB-000947
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 often)

;; p204258  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-000921 tierB-001766
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 well)

;; p204261  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000401 tierB-000171 tierB-000246
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 avoid)

;; p204262  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000144 tierA-000149 tierA-000154
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 call_off)

;; p204264  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000102 tierA-000113 tierB-000930
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 continue)

;; p204265  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000702 tierB-000809 tierB-001166
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cover)

;; p204266  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-000502 tierB-000738
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cry)

;; p204267  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000163 tierB-000450 tierB-000556
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 enter)

;; p204271  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000026 tierB-000231 tierB-000584
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 follow)

;; p204272  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 give_up)

;; p204273  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000999 tierB-001238
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 good)

;; p204274  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000087 tierB-001363 tierB-001708
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 happen)

;; p204275  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 increase)

;; p204277  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000040 tierB-000105 tierB-001086
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 lead)

;; p204279  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001683
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 present)

;; p204280  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 put_off)

;; p204281  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000044 tierB-000168 tierB-000916
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 ready)

;; p204282  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-000339 tierB-001153
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 run)

;; p204283  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000864 tierB-000910 tierB-000915
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 serve)

;; p204284  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000624 tierB-001536 tierB-001621
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 war)

;; p204285  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000971 tierB-001004 tierB-001601
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 write)

;; p204286  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 answer)

;; p204287  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 auditor)

;; p204288  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000376 tierB-000678 tierB-001503
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beauty)

;; p204290  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000339 tierA-000340 tierA-000341
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 boiler)

;; p204291  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000712 tierB-001430 tierB-001528
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 bus)

;; p204292  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000355 tierA-000356 tierA-000357
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 calibration)

;; p204293  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000794 tierB-000814 tierB-001612
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 class)

;; p204294  support 4 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000504 tierB-000849 tierB-001177
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 computer)

;; p204295  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 countersignature)

;; p204296  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000367 tierA-000368 tierA-000369
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 courier)

;; p204297  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cracked)

;; p204298  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001052 tierB-001108 tierB-001169
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 crowd)

;; p204299  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000082
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 curator)

;; p204301  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000359 tierA-000360 tierA-000361
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 descent)

;; p204303  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 elder)

;; p204306  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 foreman)

;; p204307  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 founder)

;; p204308  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000317
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 frame)

;; p204309  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000239
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 freight)

;; p204310  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000319 tierB-000783 tierB-001280
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 girl)

;; p204311  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000176 tierB-000474 tierB-001308
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ground)

;; p204312  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000331 tierA-000332 tierA-000333
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 hatch)

;; p204314  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000149 tierB-000767 tierB-000836
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 hotel)

;; p204315  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-001234 tierB-001246
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ivy)

;; p204317  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001114 tierB-001208 tierB-001480
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 lady)

;; p204318  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 licence)

;; p204319  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000036 tierB-000783 tierB-001280
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 little)

;; p204320  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000119 tierB-000244 tierB-000574
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 matter)

;; p204321  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000524 tierB-001257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 middle)

;; p204322  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000520 tierB-001253 tierB-001555
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 movie)

;; p204323  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 mural)

;; p204325  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000567 tierB-000932 tierB-000992
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 original)

;; p204326  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000646 tierB-001152 tierB-001381
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 party)

;; p204327  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000876 tierB-001070 tierB-001077
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 picture)

;; p204328  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000181 tierA-000182 tierA-000183
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 pier)

;; p204329  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 plane)

;; p204330  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ranger)

;; p204331  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 recruit)

;; p204332  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000019 tierB-000832 tierB-001268
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 red)

;; p204333  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000351 tierA-000352 tierA-000353
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 repair)

;; p204334  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ridge)

;; p204335  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000416 tierB-000468 tierB-000470
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 river)

;; p204336  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000134 tierB-000767 tierB-001296
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sea)

;; p204337  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000173 tierA-000174 tierA-000175
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 shepherd)

;; p204338  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000100 tierB-000605 tierB-000835
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ship)

;; p204339  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000343 tierA-000344 tierA-000345
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 skylight)

;; p204340  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000154 tierB-000383 tierB-000445
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 snow)

;; p204342  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000218 tierB-000324 tierB-001044
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 store)

;; p204343  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000825 tierB-001218 tierB-001838
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 sun)

;; p204344  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000932 tierB-001134 tierB-001447
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 system)

;; p204345  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 trainer)

;; p204346  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000116 tierB-001317 tierB-001706
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 village)

;; p204347  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001204 tierB-001324 tierB-001444
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 war)

;; p204348  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000177 tierA-000178 tierA-000179
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ward)

;; p204349  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000265 tierB-000984 tierB-001161
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 windshield)

;; p204351  support 4 (occ 4)  size 1  root $e0 (event)  depth 0
;;   e.g. tierB-000450 tierB-000971 tierB-001687
;;   single atom; not a proposal (a one-atom pack is a rename)
(Permitted $e0)

;; p204352  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000799 tierB-001111 tierB-001628
;;   single atom; not a proposal (a one-atom pack is a rename)
(ProportionOf $x0 $x1 most)

;; p204356  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-000917
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 night)

;; p204357  support 4 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001171 tierB-001275 tierB-001387
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 this_year)

;; p204358  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000212 tierB-000686 tierB-001588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 tonight)

;; p204360  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000913 tierB-001673
;;   single atom; not a proposal (a one-atom pack is a rename)
(To $x0 $x1)

;; p204387  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school)) (MnAgentOfSchool_Beneficiary_Buy $e0 $x0 $x1))

;; p204388  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall)) (MnAgent_BeneficiaryOfHall_Buy $e0 $x0 $x1))

;; p204389  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon)) (MnAgentOfCardinalityNum-GroupOfClimber_Abandon $e0 $x0))

;; p204390  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgentOfCardinalityNum_Abandon_Theme $e0 $x0 $x1))

;; p204391  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000265 tierA-000280 tierA-000310
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfCardinalityNum $e0 $x0 $x1 $x2))

;; p204392  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x0 biologist)) (MnAgentOfBiologist_CoAgent_Location $e0 $x0 $x1 $x2))

;; p204393  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x1 ranger)) (MnAgent_CoAgentOfRanger_Location $e0 $x0 $x1 $x2))

;; p204394  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $x2 survey)) (MnAgent_CoAgent_LocationOfSurvey $e0 $x0 $x1 $x2))

;; p204395  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist) (Member $x1 ranger)) (MnAgentOfBiologist_CoAgentOfRanger $e0 $x0 $x1))

;; p204398  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation) (Time $e0 (Weekday thursday))) (MnAgentOfDelegation_Future_Time(WeekdayThursday $e0 $x0))

;; p204399  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgentOfGroupOfClimber_Abandon_Theme $e0 $x0 $x1))

;; p204400  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
(Implication (And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample) (Instrument $e0 post)) (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost $e0 $x0))

;; p204401  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_Teach_RecipientOfGroupOfChild $e0 $x0 $x1))

;; p204402  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1)) (MnAgentOfElder_RecipientOfGroupOfChild $e0 $x0 $x1))

;; p204403  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_RecipientOfGroupOfChild_Theme $e0 $x0 $x1 $x2))

;; p204404  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Buy_ThemeOfGroupOfForklift $e0 $x0 $x1))

;; p204405  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 examine) (Theme $e0 $x1)) (MnAgent_Examine_ThemeOfGroupOfSample $e0 $x0 $x1))

;; p204406  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000382 tierA-000384
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 physician) (Theme $e0 $x1)) (MnAgentOfPhysician_ThemeOfGroupOfSample $e0 $x0 $x1))

;; p204407  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
(Implication (And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Theme $e0 $x1)) (MnAgent_ThemeOfEveningFlightOfInheritanceFlight $e0 $x0 $x1))

;; p204408  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
(Implication (And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 loan_application) (Theme $e0 $x1)) (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication $e0 $x0 $x1))

;; p204409  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
(Implication (And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Member $x0 licence) (Theme $e0 night_delivery)) (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery $e0 $x0))

;; p204410  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio)) (MnAgentOfPotteryStudioOfInheritanceStudio_Buy $e0 $x0))

;; p204411  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver)) (MnAgentOfDiver_Location_Discover $e0 $x0 $x1))

;; p204412  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 biologist)) (MnAgentOfBiologist_Location_Work $e0 $x0 $x1))

;; p204413  support 3 (occ 4)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x1 survey)) (MnAgent_LocationOfSurvey_Work $e0 $x0 $x1))

;; p204414  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Member $x1 hall)) (MnAgentOfCurator_LocationOfHall $e0 $x0 $x1))

;; p204415  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator) (Theme $e0 photography)) (MnAgentOfCurator_Location_ThemePhotography $e0 $x0 $x1))

;; p204416  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder) (Member $x1 frame)) (MnAgentOfWelder_LocationOfFrame $e0 $x0 $x1))

;; p204417  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall) (Theme $e0 photography)) (MnAgent_LocationOfHall_ThemePhotography $e0 $x0 $x1))

;; p204419  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm) (Theme $e0 $x1)) (MnAgentOfFirm_Abandon_Theme $e0 $x0 $x1))

;; p204420  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_Abandon_ThemeOfNorthRoute $e0 $x0 $x1))

;; p204422  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 tender) (Theme $e0 $x1)) (MnAgent_Abandon_ThemeOfTender $e0 $x0 $x1))

;; p204424  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgentOfClerk_Answer_Theme $e0 $x0 $x1))

;; p204425  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot) (Theme $e0 $x1)) (MnAgentOfPilot_Answer_Theme $e0 $x0 $x1))

;; p204426  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Answer_ThemeOfQuery $e0 $x0 $x1))

;; p204427  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 tower) (Theme $e0 $x1)) (MnAgent_Answer_ThemeOfTower $e0 $x0 $x1))

;; p204428  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
(Implication (And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight) (Time $e0 (Hour <num>))) (MnAgentOfFreight_Arrive_Time(HourNum $e0 $x0))

;; p204429  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1)) (MnAgent_Begin_ThemeEvOfOngoing $e0 $e1 $x0))

;; p204430  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0)) (MnAgentOfDepot_Buy_Past $e0 $x0))

;; p204431  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOfDepot_Buy_Theme $e0 $x0 $x1))

;; p204433  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0)) (MnAgentOfPotteryStudio_Buy_Past $e0 $x0))

;; p204434  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgentOfPotteryStudio_Buy_Theme $e0 $x0 $x1))

;; p204435  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0)) (MnAgentOfSchool_Buy_Past $e0 $x0))

;; p204436  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1)) (MnAgentOfSchool_Buy_Theme $e0 $x0 $x1))

;; p204438  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Buy_ThemeOfKiln $e0 $x0 $x1))

;; p204441  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1)) (MnAgentOfCouncil_Cancel_Patient $e0 $x0 $x1))

;; p204442  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1)) (MnAgentOfTutor_Cancel_Patient $e0 $x0 $x1))

;; p204443  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Cancel_PatientOfAfternoonSession $e0 $x0 $x1))

;; p204444  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1)) (MnAgent_Cancel_PatientOfSummerFair $e0 $x0 $x1))

;; p204445  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1)) (MnAgent_Cause_ThemeEvOfDestroy $e0 $e1 $x0))

;; p204446  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_Cause_ThemeEvOfPatient $e0 $e1 $x0 $x1))

;; p204447  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board) (Theme $e0 $x1)) (MnAgentOfBoard_Decide_Theme $e0 $x0 $x1))

;; p204448  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x1)) (MnAgentOfJudge_Decide_Theme $e0 $x0 $x1))

;; p204449  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 budget) (Theme $e0 $x1)) (MnAgent_Decide_ThemeOfBudget $e0 $x0 $x1))

;; p204450  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 case) (Theme $e0 $x1)) (MnAgent_Decide_ThemeOfCase $e0 $x0 $x1))

;; p204451  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Possession $x1 next_year) (Theme $e0 $x1)) (MnAgent_Decide_ThemeOfPossessionNextYear $e0 $x0 $x1))

;; p204452  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000229 tierB-001163
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 fire) (Patient $e0 $x1)) (MnAgentOfFire_Destroy_Patient $e0 $x0 $x1))

;; p204453  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1)) (MnAgentOfDiver_Discover_Theme $e0 $x0 $x1))

;; p204454  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern) (Theme $e0 $x1)) (MnAgentOfIntern_Discover_Theme $e0 $x0 $x1))

;; p204455  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 file) (Theme $e0 $x1)) (MnAgent_Discover_ThemeOfFile $e0 $x0 $x1))

;; p204456  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 missing) (Theme $e0 $x1)) (MnAgent_Discover_ThemeOfMissing $e0 $x0 $x1))

;; p204457  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Discover_ThemeOfWreck $e0 $x0 $x1))

;; p204458  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1)) (MnAgentOfSchool_Give_Recipient $e0 $x0 $x1))

;; p204459  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1)) (MnAgentOfSchool_Give_Theme $e0 $x0 $x1))

;; p204460  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1)) (MnAgentOfTrainer_Give_Recipient $e0 $x0 $x1))

;; p204461  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1)) (MnAgentOfTrainer_Give_Theme $e0 $x0 $x1))

;; p204462  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Give_ThemeOfAnswer $e0 $x0 $x1))

;; p204463  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgent_Give_ThemeOfManifest $e0 $x0 $x1))

;; p204464  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1)) (MnAgent_Give_RecipientOfRecruit $e0 $x0 $x1))

;; p204465  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1)) (MnAgent_Give_RecipientOfWinner $e0 $x0 $x1))

;; p204466  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1)) (MnAgentOfMuseum_Lend_Recipient $e0 $x0 $x1))

;; p204467  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1)) (MnAgentOfMuseum_Lend_Theme $e0 $x0 $x1))

;; p204468  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnAgentOfNeighbour_Lend_RecipientRavi $e0 $x0))

;; p204469  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1)) (MnAgentOfNeighbour_Lend_Theme $e0 $x0 $x1))

;; p204470  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1)) (MnAgent_Lend_RecipientOfGallery $e0 $x0 $x1))

;; p204471  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1)) (MnAgent_Lend_ThemeOfGenerator $e0 $x0 $x1))

;; p204472  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x1)) (MnAgent_Make_PatientEvOfTheme $e0 $e1 $x0 $x1))

;; p204473  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Order_ThemeOfScan $e0 $x0 $x1))

;; p204474  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Order_ThemeOfOrdinalNumScan $e0 $x0 $x1))

;; p204475  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1)) (MnAgentOfClub_Postpone_Theme $e0 $x0 $x1))

;; p204476  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgent_Postpone_ThemeOfTournament $e0 $x0 $x1))

;; p204477  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x1)) (MnAgent_Reach_ThemeEvOfTheme $e0 $e1 $x0 $x1))

;; p204478  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
(Implication (And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 chart) (Patient $e0 $x1)) (MnAgent_Sign_PatientOfChart $e0 $x0 $x1))

;; p204479  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Recipient $e0 $x1)) (MnAgentOfElder_Teach_Recipient $e0 $x0 $x1))

;; p204480  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Theme $e0 $x1)) (MnAgentOfElder_Teach_Theme $e0 $x0 $x1))

;; p204481  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1)) (MnAgentOfPotter_Teach_Recipient $e0 $x0 $x1))

;; p204482  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing)) (MnAgentOfPotter_Teach_ThemeGlazing $e0 $x0))

;; p204483  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_Teach_RecipientOfApprentice $e0 $x0 $x1))

;; p204484  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1)) (MnAgent_Teach_ThemeOfDrill $e0 $x0 $x1))

;; p204485  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 song) (Theme $e0 $x1)) (MnAgent_Teach_ThemeOfSong $e0 $x0 $x1))

;; p204486  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0)) (MnBegin_ThemeEvOfAgent-Ongoing $e1 $e0 $x0))

;; p204487  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0)) (MnBegin_Past_ThemeEvOfAgent $e1 $e0 $x0))

;; p204488  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1)) (MnAgent_PatientEvOfDecision-Theme $e0 $e1 $x0 $x1))

;; p204489  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1)) (MnAgent_ThemeEvOfDecision-Theme $e0 $e1 $x0 $x1))

;; p204490  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $e1 destroy) (Patient $e1 $x1) (Theme $e0 $e1)) (MnAgent_ThemeEvOfDestroy-Patient $e0 $e1 $x0 $x1))

;; p204491  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
(Implication (And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Theme $e0 $x1)) (MnAgentOfAirline_ThemeOfEveningFlight $e0 $x0 $x1))

;; p204492  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
(Implication (And (Agent $e0 $x0) (Member $x0 bank) (Member $x1 loan_application) (Theme $e0 $x1)) (MnAgentOfBank_ThemeOfLoanApplication $e0 $x0 $x1))

;; p204493  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $x0 board) (Member $x1 budget) (Theme $e0 $x1)) (MnAgentOfBoard_ThemeOfBudget $e0 $x0 $x1))

;; p204494  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $x0 board) (Possession $x1 next_year) (Theme $e0 $x1)) (MnAgentOfBoard_ThemeOfPossessionNextYear $e0 $x0 $x1))

;; p204495  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1)) (MnAgentOfClerk_ThemeOfQuery $e0 $x0 $x1))

;; p204496  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Member $x1 song) (Theme $e0 $x1)) (MnAgentOfElder_ThemeOfSong $e0 $x0 $x1))

;; p204497  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgentOfElder_Recipient_Theme $e0 $x0 $x1 $x2))

;; p204499  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
(Implication (And (Agent $e0 $x0) (Member $x0 ferry) (Member $x1 departure) (Theme $e0 $x1)) (MnAgentOfFerry_ThemeOfDeparture $e0 $x0 $x1))

;; p204501  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
(Implication (And (Agent $e0 $x0) (Member $x0 judge) (Member $x1 case) (Theme $e0 $x1)) (MnAgentOfJudge_ThemeOfCase $e0 $x0 $x1))

;; p204502  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Member $x1 gallery) (Recipient $e0 $x1)) (MnAgentOfMuseum_RecipientOfGallery $e0 $x0 $x1))

;; p204503  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgentOfMuseum_Recipient_Theme $e0 $x0 $x1 $x2))

;; p204504  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnAgentOfNeighbour_RecipientRavi_Theme $e0 $x0 $x1))

;; p204505  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1)) (MnAgentOfPhysician_ThemeOfScan $e0 $x0 $x1))

;; p204506  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000387 tierA-000388
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgentOfPhysician_ThemeOfOrdinalNumScan $e0 $x0 $x1))

;; p204507  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Theme $e0 $x1)) (MnAgentOfPilot_ThemeOfTower $e0 $x0 $x1))

;; p204508  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgentOfPotter_RecipientOfApprentice $e0 $x0 $x1))

;; p204509  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgentOfPotter_Recipient_ThemeGlazing $e0 $x0 $x1))

;; p204510  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy $e0 $x0 $x1))

;; p204511  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 winner) (Recipient $e0 $x1)) (MnAgentOfSchool_RecipientOfWinner $e0 $x0 $x1))

;; p204512  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgentOfSchool_Recipient_Theme $e0 $x0 $x1 $x2))

;; p204513  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Member $x1 recruit) (Recipient $e0 $x1)) (MnAgentOfTrainer_RecipientOfRecruit $e0 $x0 $x1))

;; p204514  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgentOfTrainer_Recipient_Theme $e0 $x0 $x1 $x2))

;; p204515  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
(Implication (And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday))) (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday $e0 $x0))

;; p204516  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Agent $e0 $x0) (Member $x1 answer) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfAnswer $e0 $x0 $x1 $x2))

;; p204517  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_RecipientOfApprentice_ThemeGlazing $e0 $x0 $x1))

;; p204518  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $x1 budget) (Possession $x1 next_year) (Theme $e0 $x1)) (MnAgent_ThemeOfBudget-PossessionNextYear $e0 $x0 $x1))

;; p204520  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfDrill $e0 $x0 $x1 $x2))

;; p204521  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_RecipientOfGallery_Theme $e0 $x0 $x1 $x2))

;; p204522  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfGenerator $e0 $x0 $x1 $x2))

;; p204523  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_ThemeOfKiln-OrdinalNumBuy $e0 $x0 $x1))

;; p204524  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfManifest $e0 $x0 $x1 $x2))

;; p204525  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(Implication (And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfNew $e0 $x0 $x1))

;; p204526  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_RecipientOfRecruit_Theme $e0 $x0 $x1 $x2))

;; p204527  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_ThemeOfSong $e0 $x0 $x1 $x2))

;; p204528  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_RecipientOfWinner_Theme $e0 $x0 $x1 $x2))

;; p204529  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_ThemeOfOrdinalNumBuy $e0 $x0 $x1))

;; p204530  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
(Implication (And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger)) (MnAgentDara_LocationOfLedger_Work $e0 $x0))

;; p204531  support 3 (occ 3)  size 4  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Before $x0 $e0) (Future $e0) (Member $x0 lunch) (Patient $e0 $x1)) (MnBeforeEvOfFuture-Patient_Lunch $x0 $e0 $x1))

;; p204532  support 3 (occ 3)  size 4  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Before $x0 $e0) (Future $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1)) (MnBeforeEvOfFuture-PatientOfDressRehearsal $x0 $e0 $x1))

;; p204533  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0)) (MnBeneficiaryOfHall_Buy_Past $e0 $x0))

;; p204534  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiaryOfHall_Buy_Theme $e0 $x0 $x1))

;; p204535  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnBuy_ThemeOfCardinalityNum-GroupOfForklift $e0 $x0))

;; p204536  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0)) (MnHolder_Have_ThemeOfCardinalityNum $e0 $x0 $x1))

;; p204537  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
(Implication (And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger) (Member $x1 survey)) (MnCoAgentOfRanger_LocationOfSurvey $e0 $x0 $x1))

;; p204538  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x1 gate)) (MnExperiencer_LocationOfGate_Wait $e0 $x0 $x1))

;; p204539  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 discover) (Stimulus $e0 $e1)) (MnExperiencer_Discover_StimulusEvOfLocation $e0 $e1 $x0 $x1))

;; p204540  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 error) (Stimulus $e0 $e1)) (MnExperiencer_StimulusEvOfLocation-Error $e0 $e1 $x0 $x1))

;; p204541  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 auditor) (Stimulus $e0 $e1)) (MnExperiencerOfAuditor_StimulusEvOfLocation $e0 $e1 $x0 $x1))

;; p204542  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Experiencer $e0 $x0) (Member $e1 error) (Member $x0 auditor) (Stimulus $e0 $e1)) (MnExperiencerOfAuditor_StimulusEvOfError $e0 $e1 $x0))

;; p204544  support 3 (occ 4)  size 4  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0)) (MnGet_Ongoing_ResultEvOfExperiencer $e1 $e0 $x0))

;; p204549  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
(Implication (And (Future $e0) (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0)) (MnFuture_PatientOfDressRehearsalOfInheritanceRehearsal $e0 $x0))

;; p204550  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTeach_RecipientOfGroupOfChild_Theme $e0 $x0 $x1))

;; p204551  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (GroupOf $x0 child) (Member $x1 song) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnRecipientOfGroupOfChild_ThemeOfSong $e0 $x0 $x1))

;; p204552  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnHolder_Require_ThemeOfGroupOfEgg $e0 $x0 $x1))

;; p204553  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_ThemeOfGroupOfForklift $e0 $x0))

;; p204554  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0 $x0))

;; p204555  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly $e0 $x0))

;; p204556  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceServicing $e0 $x0))

;; p204557  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit) (Theme $e0 $x1)) (MnHolderOfPermit_Require_Theme $e0 $x0 $x1))

;; p204558  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1)) (MnHolderOfRecipe_Require_Theme $e0 $x0 $x1))

;; p204559  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
(Implication (And (Holder $e0 $x0) (Member $x0 permit) (Member $x1 countersignature) (Theme $e0 $x1)) (MnHolderOfPermit_ThemeOfCountersignature $e0 $x0 $x1))

;; p204560  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000155 tierA-000156
(Implication (And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnCancel_PatientOfAfternoonSessionOfInheritanceSession $e0 $x0))

;; p204561  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
(Implication (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing)) (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing $e0))

;; p204562  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnAbandon_ThemeOfNorthRouteOfInheritanceNorth $e0 $x0))

;; p204563  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000111 tierA-000112
(Implication (And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnAbandon_ThemeOfNorthRouteOfInheritanceRoute $e0 $x0))

;; p204564  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000150 tierA-000152
(Implication (And (Inheritance summer_fair fair) (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0)) (MnCancel_PatientOfSummerFairOfInheritanceFair $e0 $x0))

;; p204566  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Discover_ThemeOfWreck $e0 $x0 $x1))

;; p204567  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
(Implication (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnStimulusEvOfLocationOfLedger-Error $e1 $e0 $x0))

;; p204568  support 3 (occ 3)  size 4  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000130 tierA-000132
(Implication (And (Location $e0 $x0) (Member $e1 discover) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnDiscover_StimulusEvOfLocationOfLedger $e1 $e0 $x0))

;; p204569  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000106 tierA-000108
(Implication (And (Member $e0 abandon) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1)) (MnAbandon_ThemeOfPossessionOfFirm $e0 $x0 $x1))

;; p204570  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
(Implication (And (Member $e0 abandon) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0)) (MnAbandon_ThemeOfTender-Possession $e0 $x0 $x1))

;; p204572  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnBuy_Past_ThemeOfKiln $e0 $x0))

;; p204574  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
(Implication (And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1)) (MnCause_ThemeEvOfDestroy-Patient $e0 $e1 $x0))

;; p204575  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
(Implication (And (Member $e0 decide) (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0)) (MnDecide_ThemeOfBudget-PossessionNextYear $e0 $x0))

;; p204576  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
(Implication (And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0) (Theme $e0 $x0)) (MnMake_PatientEvOfDecision-Theme $e1 $e0 $x0))

;; p204577  support 3 (occ 3)  size 4  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
(Implication (And (Member $e0 decision) (Member $e1 reach) (Theme $e0 $x0) (Theme $e1 $e0)) (MnReach_ThemeEvOfDecision-Theme $e1 $e0 $x0))

;; p204578  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
(Implication (And (Member $e0 discover) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0)) (MnDiscover_ThemeOfFile-Missing $e0 $x0))

;; p204579  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
(Implication (And (Member $e0 give) (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnGive_Recipient_ThemeOfAnswer $e0 $x0 $x1))

;; p204580  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
(Implication (And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnGive_Recipient_ThemeOfManifest $e0 $x0 $x1))

;; p204581  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
(Implication (And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_RecipientOfRecruit_Theme $e0 $x0 $x1))

;; p204582  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
(Implication (And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGive_RecipientOfWinner_Theme $e0 $x0 $x1))

;; p204583  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
(Implication (And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnLend_RecipientOfGallery_Theme $e0 $x0 $x1))

;; p204584  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
(Implication (And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnLend_Recipient_ThemeOfGenerator $e0 $x0 $x1))

;; p204587  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(Implication (And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnStart_Past_ThemeEvOfPatient $e0 $e1 $x0))

;; p204588  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(Implication (And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1)) (MnStop_Past_ThemeEvOfPast $e0 $e1))

;; p204589  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
(Implication (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnTeach_RecipientOfApprentice_ThemeGlazing $e0 $x0))

;; p204590  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
(Implication (And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnTeach_Recipient_ThemeOfDrill $e0 $x0 $x1))

;; p204591  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
(Implication (And (Member $e0 teach) (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnTeach_Recipient_ThemeOfSong $e0 $x0 $x1))

;; p204592  support 3 (occ 3)  size 4  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
(Implication (And (Member $x0 departure) (Member $x1 ferry) (Possession $x0 $x1) (Theme $e0 $x0)) (MnThemeOfDeparture-PossessionOfFerry $e0 $x0 $x1))

;; p204593  support 3 (occ 3)  size 4  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfKiln-OrdinalNumBuy $e0 $x0))

;; p204595  support 3 (occ 3)  size 4  root $e1 (event)  depth 1
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(Implication (And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0)) (MnPast_Patient_ThemeEvOfOngoing $e1 $e0 $x0))

;; p205524  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000184 tierB-001534
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Goal $e0 $x1)) (MnAgentOfCardinalityNum_Goal $e0 $x0 $x1))

;; p205531  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1)) (MnAgent_ResultEvOfExperiencer $e0 $e1 $x0 $x1))

;; p205533  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001457 tierB-001530 tierB-001840
(Implication (And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0)) (MnAgentOfGroupOfBoy_Ongoing $e0 $x0))

;; p205534  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1)) (MnAgentOfGroupOfChild_Location $e0 $x0 $x1))

;; p205535  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000648 tierB-001125 tierB-001433
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play)) (MnAgentOfGroupOfChild_Play $e0 $x0))

;; p205572  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0)) (MnTry_ThemeEvOfAgent $e1 $e0 $x0))

;; p205575  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000391 tierA-000400 tierB-000713
(Implication (And (Agent $e0 $x0) (Member $x0 car) (Theme $e0 $x1)) (MnAgentOfCar_Theme $e0 $x0 $x1))

;; p205576  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000762 tierB-000853 tierB-001932
(Implication (And (Agent $e0 $x0) (Member $x0 company) (Past $e0)) (MnAgentOfCompany_Past $e0 $x0))

;; p205578  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000381 tierA-000386 tierB-000339
(Implication (And (Agent $e0 $x0) (Member $x0 doctor) (Theme $e0 $x1)) (MnAgentOfDoctor_Theme $e0 $x0 $x1))

;; p205586  support 3 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001773 tierB-001801 tierB-001803
(Implication (And (Agent $e0 $x0) (Member $x0 man) (Past $e0)) (MnAgentOfMan_Past $e0 $x0))

;; p205590  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(Implication (And (Agent $e0 $x0) (Member $x0 plane) (Past $e0)) (MnAgentOfPlane_Past $e0 $x0))

;; p205594  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000224 tierB-000775
(Implication (And (Agent $e0 $x0) (Member $x0 storm) (Patient $e0 $x1)) (MnAgentOfStorm_Patient $e0 $x0 $x1))

;; p205595  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000978 tierB-001661 tierB-001881
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1)) (MnAgentOfThing_Theme $e0 $x0 $x1))

;; p205598  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
(Implication (And (Agent $e0 $x0) (Member $x0 vet) (Theme $e0 $x1)) (MnAgentOfVet_Theme $e0 $x0 $x1))

;; p205603  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
(Implication (And (Agent $e0 $x0) (Member $x1 bridge) (Theme $e0 $x1)) (MnAgent_ThemeOfBridge $e0 $x0 $x1))

;; p205609  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1)) (MnAgent_PatientOfDoor $e0 $x0 $x1))

;; p205613  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1)) (MnAgent_ThemeOfMedal $e0 $x0 $x1))

;; p205614  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000307 tierA-000308
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1)) (MnAgent_ThemeOfPainting $e0 $x0 $x1))

;; p205618  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1)) (MnAgent_ThemeOfWhistle $e0 $x0 $x1))

;; p205621  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001066 tierB-001243 tierB-001586
(Implication (And (Agent $e0 $x0) (PartOf $x1 $x2) (Theme $e0 $x1)) (MnAgent_ThemeOfPartOf $e0 $x0 $x1 $x2))

;; p205622  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(Implication (And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0)) (MnPast_StimulusEvOfAgent $e1 $e0 $x0))

;; p205623  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e1) (To $e1 $e0)) (MnPast_ToEvOfAgent $e1 $e0 $x0))

;; p205629  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1)) (MnBeforeEvOfPast_Past $e0 $e1))

;; p205639  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0)) (MnLeave_ResultEvOfExperiencer $e1 $e0 $x0))

;; p205641  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0)) (MnTurn_ResultEvOfExperiencer $e1 $e0 $x0))

;; p205649  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000412 tierB-000771
(Implication (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfGroupOfPerson $e0 $x0))

;; p205658  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
(Implication (And (Inheritance feed_pipe pipe) (Member $x0 cracked) (Member $x0 feed_pipe)) (MnCracked_FeedPipeOfInheritancePipe $x0))

;; p205662  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(Implication (And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfLocatedIn $e0 $x0 $x1))

;; p205664  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Implication (And (Location $e0 $x0) (Member $e0 live) (Member $x0 house)) (MnLocationOfHouse_Live $e0 $x0))

;; p205685  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
(Implication (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0)) (MnDestroy_PatientOfArchive $e0 $x0))

;; p205686  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
(Implication (And (Member $e0 destroy) (Member $x0 footbridge) (Patient $e0 $x0)) (MnDestroy_PatientOfFootbridge $e0 $x0))

;; p205687  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
(Implication (And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0)) (MnDestroy_PatientOfGreenhouse $e0 $x0))

;; p205697  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000300
(Implication (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0)) (MnLend_ThemeOfLadder $e0 $x0))

;; p205712  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(Implication (And (Member $x0 fire) (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOfFire $e0 $x0))

;; p205716  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(Implication (And (Member $x0 picture) (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOfPicture $e0 $x0))

;; p205719  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001520 tierB-001622 tierB-001761
(Implication (And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0)) (MnObligated_PatientOfThing $e0 $x0))

;; p205721  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(Implication (And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1)) (MnOngoing_ThemeEvOfPatient $e0 $e1 $x0))

;; p205723  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(Implication (And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1)) (MnPast_ThemeEvOfRecipient $e0 $e1 $x0))

;; p205724  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(Implication (And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0)) (MnPast_ThemeEvOfTheme $e0 $e1 $x0))

;; p206104  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Implication (And (Inheritance living_room room) (Member $x0 living_room)) (MnLivingRoomOfInheritanceRoom $x0))

;; p206157  support 3 (occ 3)  size 1  root dung_beetle (constant)  depth 1
;;   e.g. tierB-000059 tierB-001735 tierB-001833
;;   single atom; not a proposal (a one-atom pack is a rename)
(Inheritance dung_beetle beetle)

;; p206190  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0)) (MnAgent_Beneficiary_Buy_Past $e0 $x0 $x1))

;; p206191  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2)) (MnAgent_Beneficiary_Buy_Theme $e0 $x0 $x1 $x2))

;; p206192  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 work)) (MnAgent_CoAgent_Location_Work $e0 $x0 $x1 $x2))

;; p206193  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0)) (MnAgent_Goal_Come_Past $e0 $x0 $x1))

;; p206194  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(Implication (And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1)) (MnAgent_Begin_Past_ThemeEv $e0 $e1 $x0))

;; p206195  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(Implication (And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1)) (MnAgent_Capture_Past_Theme $e0 $x0 $x1))

;; p206196  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Might $e0) (Theme $e0 $x1)) (MnAgent_Decide_Might_Theme $e0 $x0 $x1))

;; p206197  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnAgent_Lend_RecipientRavi_Theme $e0 $x0 $x1))

;; p206198  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001068 tierB-001120 tierB-001961
(Implication (And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1)) (MnAgent_Ongoing_Past_Theme $e0 $x0 $x1))

;; p206199  support 3 (occ 3)  size 4  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Buy_Past_Theme $e0 $x0 $x1))

;; p206200  support 3 (occ 5)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-001041 tierB-001078 tierB-001753
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0)) (MnExperiencer_Location_Ongoing_Past $e0 $x0 $x1))

;; p206201  support 3 (occ 4)  size 4  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(Implication (And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1)) (MnGet_Ongoing_Patient_ResultEv $e0 $e1 $x0))

;; p206280  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 child)) (MnAgentOfCardinalityNum-GroupOfChild $e0 $x0))

;; p206282  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(Implication (And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1)) (MnAgent_Future_Theme $e0 $x0 $x1))

;; p206285  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2)) (MnAgent_Goal_Theme $e0 $x0 $x1 $x2))

;; p206286  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(Implication (And (Agent $e0 $x0) (Goal $e0 home) (Past $e0)) (MnAgent_GoalHome_Past $e0 $x0))

;; p206287  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2)) (MnAgent_Location_Patient $e0 $x0 $x1 $x2))

;; p206294  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(Implication (And (Agent $e0 $x0) (Member $e0 cause) (Past $e0)) (MnAgent_Cause_Past $e0 $x0))

;; p206296  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(Implication (And (Agent $e0 $x0) (Member $e0 draw) (Past $e0)) (MnAgent_Draw_Past $e0 $x0))

;; p206297  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1)) (MnAgent_GiveUp_Theme $e0 $x0 $x1))

;; p206298  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1)) (MnAgent_Learn_Source $e0 $x0 $x1))

;; p206300  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001182 tierB-001457 tierB-001754
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0)) (MnAgent_Make_Ongoing $e0 $x0))

;; p206301  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(Implication (And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0)) (MnAgent_Play_Ongoing $e0 $x0))

;; p206302  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1)) (MnAgent_PutOff_Theme $e0 $x0 $x1))

;; p206303  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierB-000607 tierB-001436
(Implication (And (Agent $e0 $x0) (Member $e0 require) (Theme $e0 $x1)) (MnAgent_Require_Theme $e0 $x0 $x1))

;; p206304  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000469 tierB-000470 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Past $e0)) (MnAgent_Try_Past $e0 $x0))

;; p206305  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1)) (MnAgent_Try_ThemeEv $e0 $e1 $x0))

;; p206306  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
(Implication (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1)) (MnAgent_TurnDown_Theme $e0 $x0 $x1))

;; p206307  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
(Implication (And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1)) (MnAgent_Watch_Theme $e0 $x0 $x1))

;; p206309  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(Implication (And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0)) (MnAgent_Over_Past $e0 $x0 $x1))

;; p206310  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(Implication (And (Agent $e0 $x0) (Past $e0) (To $e0 $e1)) (MnAgent_Past_ToEv $e0 $e1 $x0))

;; p206311  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1)) (MnAgent_Patient_ResultEv $e0 $e1 $x0 $x1))

;; p206312  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0)) (MnThemeEvOfAgent-Patient $e1 $e0 $x0 $x1))

;; p206322  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-000455 tierB-001496
(Implication (And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1)) (MnExperiencer_Need_ThemeEv $e0 $e1 $x0))

;; p206323  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000063 tierA-000068 tierB-001816
(Implication (And (Future $e0) (Member $e0 start) (Patient $e0 $x0)) (MnFuture_Start_Patient $e0 $x0))

;; p206324  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(Implication (And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0)) (MnGoal_MannerQuickly_Past $e0 $x0))

;; p206327  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0)) (MnLocation_Walk_Ongoing $e0 $x0))

;; p206328  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(Implication (And (Location $e0 $x0) (Member $e0 walk) (Past $e0)) (MnLocation_Walk_Past $e0 $x0))

;; p206329  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
(Implication (And (Location $e0 $x0) (Member $e0 work) (Might $e0)) (MnLocation_Work_Might $e0 $x0))

;; p206330  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(Implication (And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1)) (MnLocation_Ongoing_Patient $e0 $x0 $x1))

;; p206331  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
(Implication (And (Measure $x0 age <num> year) (Member $x0 founder) (Patient $e0 $x0)) (MnPatientOfMeasureAgeNumYear-Founder $e0 $x0))

;; p206332  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
(Implication (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0)) (MnBegin_Might_Patient $e0 $x0))

;; p206333  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
(Implication (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1)) (MnBorrow_Source_Theme $e0 $x0 $x1))

;; p206334  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(Implication (And (Member $e0 cause) (Past $e0) (Patient $e0 $x0)) (MnCause_Past_Patient $e0 $x0))

;; p206335  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(Implication (And (Member $e0 create) (Past $e0) (Patient $e0 $x0)) (MnCreate_Past_Patient $e0 $x0))

;; p206340  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(Implication (And (Member $e0 eat) (Past $e0) (Patient $e0 $x0)) (MnEat_Past_Patient $e0 $x0))

;; p206341  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(Implication (And (Member $e0 fall) (Past $e0) (Source $e0 $x0)) (MnFall_Past_Source $e0 $x0))

;; p206342  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(Implication (And (Member $e0 find) (Past $e0) (Theme $e0 $x0)) (MnFind_Past_Theme $e0 $x0))

;; p206344  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(Implication (And (Member $e0 increase) (Past $e0) (Patient $e0 $x0)) (MnIncrease_Past_Patient $e0 $x0))

;; p206345  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(Implication (And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1)) (MnLeave_Patient_ResultEv $e0 $e1 $x0))

;; p206347  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000951 tierB-001182 tierB-001457
(Implication (And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0)) (MnMake_Ongoing_Patient $e0 $x0))

;; p206348  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(Implication (And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1)) (MnMake_Ongoing_ResultEv $e0 $e1))

;; p206349  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(Implication (And (Member $e0 present) (Past $e0) (Theme $e0 $x0)) (MnPresent_Past_Theme $e0 $x0))

;; p206350  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(Implication (And (Member $e0 receive) (Past $e0) (Theme $e0 $x0)) (MnReceive_Past_Theme $e0 $x0))

;; p206351  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(Implication (And (Member $e0 stand) (Ongoing $e0) (Past $e0)) (MnStand_Ongoing_Past $e0))

;; p206352  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(Implication (And (Member $e0 stick) (Past $e0) (Patient $e0 $x0)) (MnStick_Past_Patient $e0 $x0))

;; p206354  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(Implication (And (Member $e0 try) (Ongoing $e0) (Past $e0)) (MnTry_Ongoing_Past $e0))

;; p206355  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-001675
(Implication (And (Member $e0 turn) (Past $e0) (Result $e0 $e1)) (MnTurn_Past_ResultEv $e0 $e1))

;; p206356  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(Implication (And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1)) (MnTurn_Patient_ResultEv $e0 $e1 $x0))

;; p206357  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(Implication (And (Member $e0 walk) (Ongoing $e0) (Past $e0)) (MnWalk_Ongoing_Past $e0))

;; p206360  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(Implication (And (Ongoing $e0) (Past $e0) (Patient $e0 $x0)) (MnOngoing_Past_Patient $e0 $x0))

;; p206361  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(Implication (And (Ongoing $e0) (Past $e0) (Result $e0 $e1)) (MnOngoing_Past_ResultEv $e0 $e1))

;; p206580  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(Implication (And (Agent $e0 $e1) (Theme $e1 $x0)) (MnAgentEvOfTheme $e0 $e1 $x0))

;; p206582  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000225 tierB-001251 tierB-001984
(Implication (And (Agent $e0 $x0) (GroupOf $x0 scientist)) (MnAgentOfGroupOfScientist $e0 $x0))

;; p206584  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(Implication (And (Agent $e0 $x0) (GroupOf $x0 soldier)) (MnAgentOfGroupOfSoldier $e0 $x0))

;; p206586  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000242 tierA-000246 tierB-000005
(Implication (And (Agent $e0 $x0) (Member $e0 arrival)) (MnAgent_Arrival $e0 $x0))

;; p206588  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000144 tierA-000149 tierA-000154
(Implication (And (Agent $e0 $x0) (Member $e0 call_off)) (MnAgent_CallOff $e0 $x0))

;; p206590  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000950 tierB-001205 tierB-001926
(Implication (And (Agent $e0 $x0) (Member $e0 close)) (MnAgent_Close $e0 $x0))

;; p206591  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000102 tierA-000113 tierB-000930
(Implication (And (Agent $e0 $x0) (Member $e0 continue)) (MnAgent_Continue $e0 $x0))

;; p206592  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000244 tierA-000247 tierB-001927
(Implication (And (Agent $e0 $x0) (Member $e0 depart)) (MnAgent_Depart $e0 $x0))

;; p206595  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001183 tierB-001496 tierB-001628
(Implication (And (Agent $e0 $x0) (Member $e0 go)) (MnAgent_Go $e0 $x0))

;; p206597  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000077 tierA-000081
(Implication (And (Agent $e0 $x0) (Member $e0 permit)) (MnAgent_Permit $e0 $x0))

;; p206600  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000339 tierB-001153 tierB-001563
(Implication (And (Agent $e0 $x0) (Member $e0 run)) (MnAgent_Run $e0 $x0))

;; p206601  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000231 tierA-000235 tierB-001285
(Implication (And (Agent $e0 $x0) (Member $e0 save)) (MnAgent_Save $e0 $x0))

;; p206602  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000225 tierB-000710 tierB-001984
(Implication (And (Agent $e0 $x0) (Member $e0 study)) (MnAgent_Study $e0 $x0))

;; p206603  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000550 tierB-001219 tierB-001666
(Implication (And (Agent $e0 $x0) (Member $e0 talk)) (MnAgent_Talk $e0 $x0))

;; p206606  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001430 tierB-001528 tierB-001739
(Implication (And (Agent $e0 $x0) (Member $x0 bus)) (MnAgentOfBus $e0 $x0))

;; p206608  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierB-001720
(Implication (And (Agent $e0 $x0) (Member $x0 coach)) (MnAgentOfCoach $e0 $x0))

;; p206609  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000049 tierA-000302 tierA-000304
(Implication (And (Agent $e0 $x0) (Member $x0 crew)) (MnAgentOfCrew $e0 $x0))

;; p206611  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001086 tierB-001551 tierB-001892
(Implication (And (Agent $e0 $x0) (Member $x0 dog)) (MnAgentOfDog $e0 $x0))

;; p206612  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000272 tierA-000274 tierB-000237
(Implication (And (Agent $e0 $x0) (Member $x0 driver)) (MnAgentOfDriver $e0 $x0))

;; p206618  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000177 tierA-000178 tierB-000028
(Implication (And (Agent $e0 $x0) (Member $x0 nurse)) (MnAgentOfNurse $e0 $x0))

;; p206621  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
(Implication (And (Agent $e0 $x0) (Member $x0 shepherd)) (MnAgentOfShepherd $e0 $x0))

;; p206626  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(Implication (And (Agent $e0 $x0) (Obligated $e0)) (MnAgent_Obligated $e0 $x0))

;; p206629  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(Implication (And (Agent $e0 $x0) (SubsetOf $x0 $x1)) (MnAgentOfSubsetOf $e0 $x0 $x1))

;; p206636  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
(Implication (And (Agent $e0 ana) (Member $e0 work)) (MnAgentAna_Work $e0))

;; p206637  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(Implication (And (Agent $e0 baya) (Past $e0)) (MnAgentBaya_Past $e0))

;; p206638  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(Implication (And (Agent $e0 daniel) (Past $e0)) (MnAgentDaniel_Past $e0))

;; p206641  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Ongoing $e0)) (MnAgentDavid_Ongoing $e0))

;; p206642  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Implication (And (Agent $e0 david) (Past $e0)) (MnAgentDavid_Past $e0))

;; p206643  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(Implication (And (Agent $e0 felix) (Past $e0)) (MnAgentFelix_Past $e0))

;; p206644  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(Implication (And (Agent $e0 mark) (Past $e0)) (MnAgentMark_Past $e0))

;; p206645  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(Implication (And (Agent $e0 matthew) (Past $e0)) (MnAgentMatthew_Past $e0))

;; p206646  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(Implication (And (Agent $e0 michael) (Past $e0)) (MnAgentMichael_Past $e0))

;; p206647  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(Implication (And (Agent $e0 pietro) (Past $e0)) (MnAgentPietro_Past $e0))

;; p206648  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(Implication (And (Agent $e0 ziri) (Ongoing $e0)) (MnAgentZiri_Ongoing $e0))

;; p206649  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(Implication (And (At $e0 $x0) (Past $e0)) (MnAt_Past $e0 $x0))

;; p206652  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(Implication (And (Before $x0 $e0) (Past $e0)) (MnBeforeEvOfPast_p206652 $x0 $e0))

;; p206654  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000319 tierB-001094
(Implication (And (Can $e0) (Member $e0 help)) (MnCan_Help $e0))

;; p206655  support 3 (occ 3)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000299 tierB-001094 tierB-001767
(Implication (And (Can $e0) (Past $e0)) (MnCan_Past $e0))

;; p206656  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000133 tierB-000738 tierB-000814
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 girl)) (MnCardinalityNum_GroupOfGirl $x0))

;; p206660  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e0)) (MnDuringEv_Past $e0 $e1))

;; p206661  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(Implication (And (During $e0 $e1) (Past $e1)) (MnDuringEvOfPast $e0 $e1))

;; p206662  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(Implication (And (Experiencer $e0 $x0) (Future $e0)) (MnExperiencer_Future $e0 $x0))

;; p206663  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001496 tierB-001685 tierB-001945
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 child)) (MnExperiencerOfGroupOfChild $e0 $x0))

;; p206664  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(Implication (And (Experiencer $e0 $x0) (Member $e0 beautiful)) (MnExperiencer_Beautiful $e0 $x0))

;; p206666  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(Implication (And (Experiencer $e0 $x0) (Member $e0 look)) (MnExperiencer_Look $e0 $x0))

;; p206667  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000144 tierB-000419 tierB-001515
(Implication (And (Experiencer $e0 $x0) (Member $e0 work)) (MnExperiencer_Work $e0 $x0))

;; p206669  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000250 tierB-001003 tierB-001334
(Implication (And (Experiencer $e0 $x0) (Member $x0 cat)) (MnExperiencerOfCat $e0 $x0))

;; p206670  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(Implication (And (Experiencer $e0 $x0) (Member $x0 door)) (MnExperiencerOfDoor $e0 $x0))

;; p206671  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000370 tierB-000842 tierB-000960
(Implication (And (Experiencer $e0 $x0) (Member $x0 thing)) (MnExperiencerOfThing $e0 $x0))

;; p206672  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000495 tierB-000565 tierB-000748
(Implication (And (Experiencer $e0 $x0) (Member $x0 weather)) (MnExperiencerOfWeather $e0 $x0))

;; p206673  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(Implication (And (Experiencer $e0 $x0) (Time $e0 today)) (MnExperiencer_TimeToday $e0 $x0))

;; p206674  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(Implication (And (For $e0 $e1) (Past $e0)) (MnForEv_Past $e0 $e1))

;; p206675  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(Implication (And (For $e0 $x0) (Ongoing $e0)) (MnFor_Ongoing $e0 $x0))

;; p206676  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(Implication (And (For $e0 $x0) (Past $e0)) (MnFor_Past $e0 $x0))

;; p206679  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(Implication (And (Future $e0) (Time $e0 tomorrow)) (MnFuture_TimeTomorrow $e0))

;; p206682  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000181 tierA-000182 tierA-000184
(Implication (And (Goal $e0 $x0) (Member $x0 pier)) (MnGoalOfPier $e0 $x0))

;; p206683  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(Implication (And (Goal $e0 bed) (Member $e0 go)) (MnGoalBed_Go $e0))

;; p206686  support 3 (occ 3)  size 2  root (LocatedIn (constant)  depth 2
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(Implication (And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1))) (MnPastOfGroupOfPerson (LocatedIn $x0 $x1))

;; p206687  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001721 tierB-001816 tierB-001893
(Implication (And (GroupOf $x0 thing) (Patient $e0 $x0)) (MnPatientOfGroupOfThing $e0 $x0))

;; p206688  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000085 tierA-000090 tierA-000095
(Implication (And (Holder $e0 $x0) (Member $e0 need)) (MnHolder_Need $e0 $x0))

;; p206691  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(Implication (And (Like $e0 $x0) (Member $e0 look)) (MnLike_Look $e0 $x0))

;; p206692  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(Implication (And (LocatedIn $x0 $x1) (Location $e0 $x0)) (MnLocationOfLocatedIn $e0 $x0 $x1))

;; p206693  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000153 tierB-000546 tierB-000680
(Implication (And (LocatedIn $x0 $x1) (Member $x1 city)) (MnLocatedInOfCity $x0 $x1))

;; p206694  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(Implication (And (LocatedIn $x0 $x1) (Member $x1 full)) (MnLocatedInOfFull $x0 $x1))

;; p206695  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierB-000619 tierB-001410 tierB-001492
(Implication (And (LocatedIn $x0 $x1) (Member $x1 table)) (MnLocatedInOfTable $x0 $x1))

;; p206696  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(Implication (And (LocatedIn $x0 $x1) (Theme $e0 $x0)) (MnThemeOfLocatedIn $e0 $x0 $x1))

;; p206702  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000173 tierA-000174 tierA-000175
(Implication (And (Location $e0 $x0) (Member $x0 ridge)) (MnLocationOfRidge $e0 $x0))

;; p206703  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(Implication (And (Location $e0 $x0) (PartOf $x0 $x1)) (MnLocationOfPartOf $e0 $x0 $x1))

;; p206705  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Past $e0)) (MnLocationHere_Past $e0))

;; p206706  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000378 tierB-000653 tierB-001705
(Implication (And (Location $e0 here) (Patient $e0 $x0)) (MnLocationHere_Patient $e0 $x0))

;; p206707  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000666 tierB-001572 tierB-001743
(Implication (And (Manner $e0 immediately) (Past $e0)) (MnMannerImmediately_Past $e0))

;; p206708  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(Implication (And (Measure $e0 duration <num> year) (Past $e0)) (MnMeasureDurationNumYear_Past $e0))

;; p206711  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000161 tierA-000172 tierB-000328
(Implication (And (Member $e0 accept) (Theme $e0 $x0)) (MnAccept_Theme $e0 $x0))

;; p206712  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(Implication (And (Member $e0 approve) (Theme $e0 $x0)) (MnApprove_Theme $e0 $x0))

;; p206713  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000444 tierB-001992
(Implication (And (Member $e0 arrive) (Past $e0)) (MnArrive_Past $e0))

;; p206715  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000401 tierB-000246 tierB-000674
(Implication (And (Member $e0 avoid) (Theme $e0 $x0)) (MnAvoid_Theme $e0 $x0))

;; p206716  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
(Implication (And (Member $e0 bear) (Past $e0)) (MnBear_Past $e0))

;; p206717  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000352 tierB-001079 tierB-001582
(Implication (And (Member $e0 become) (Past $e0)) (MnBecome_Past $e0))

;; p206718  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001079 tierB-001582 tierB-001817
(Implication (And (Member $e0 become) (Result $e0 $e1)) (MnBecome_ResultEv $e0 $e1))

;; p206722  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
(Implication (And (Member $e0 break_out) (Past $e0)) (MnBreakOut_Past $e0))

;; p206723  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(Implication (And (Member $e0 build) (Patient $e0 $x0)) (MnBuild_Patient $e0 $x0))

;; p206724  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000149 tierA-000154 tierB-000498
(Implication (And (Member $e0 call_off) (Patient $e0 $x0)) (MnCallOff_Patient $e0 $x0))

;; p206726  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-001217 tierB-001803
(Implication (And (Member $e0 change) (Past $e0)) (MnChange_Past $e0))

;; p206727  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000218 tierB-000950 tierB-001926
(Implication (And (Member $e0 close) (Patient $e0 $x0)) (MnClose_Patient $e0 $x0))

;; p206728  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001697 tierB-001949
(Implication (And (Member $e0 come) (Patient $e0 $x0)) (MnCome_Patient $e0 $x0))

;; p206729  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000677 tierB-001774 tierB-001949
(Implication (And (Member $e0 come) (Source $e0 $x0)) (MnCome_Source $e0 $x0))

;; p206730  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000809 tierB-001166 tierB-001541
(Implication (And (Member $e0 cover) (Patient $e0 $x0)) (MnCover_Patient $e0 $x0))

;; p206740  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000194 tierB-000456 tierB-001905
(Implication (And (Member $e0 fall) (Ongoing $e0)) (MnFall_Ongoing $e0))

;; p206743  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000418 tierB-000672 tierB-001325
(Implication (And (Member $e0 get) (Theme $e0 $x0)) (MnGet_Theme $e0 $x0))

;; p206745  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000299 tierB-000858 tierB-001094
(Implication (And (Member $e0 help) (Past $e0)) (MnHelp_Past $e0))

;; p206746  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
(Implication (And (Member $e0 hold_up) (Past $e0)) (MnHoldUp_Past $e0))

;; p206750  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000287 tierA-000292 tierB-000608
(Implication (And (Member $e0 learn) (Theme $e0 $x0)) (MnLearn_Theme $e0 $x0))

;; p206754  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
(Implication (And (Member $e0 pick_up) (Past $e0)) (MnPickUp_Past $e0))

;; p206756  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000648 tierB-000816
(Implication (And (Member $e0 play) (Theme $e0 $x0)) (MnPlay_Theme $e0 $x0))

;; p206760  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(Implication (And (Member $e0 read) (Theme $e0 $x0)) (MnRead_Theme $e0 $x0))

;; p206762  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000178 tierB-001153 tierB-001563
(Implication (And (Member $e0 run) (Past $e0)) (MnRun_Past $e0))

;; p206763  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000080 tierB-000865 tierB-001626
(Implication (And (Member $e0 say) (Theme $e0 $x0)) (MnSay_Theme $e0 $x0))

;; p206764  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
(Implication (And (Member $e0 sing) (Past $e0)) (MnSing_Past $e0))

;; p206765  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
(Implication (And (Member $e0 solve) (Patient $e0 $x0)) (MnSolve_Patient $e0 $x0))

;; p206770  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000327 tierB-000550 tierB-001666
(Implication (And (Member $e0 talk) (Past $e0)) (MnTalk_Past $e0))

;; p206771  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-000995 tierB-001618
(Implication (And (Member $e0 travel) (Past $e0)) (MnTravel_Past $e0))

;; p206773  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000651 tierB-001720 tierB-001800
(Implication (And (Member $e0 watch) (Past $e0)) (MnWatch_Past $e0))

;; p206779  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(Implication (And (Member $x0 bad) (Patient $e0 $x0)) (MnPatientOfBad $e0 $x0))

;; p206780  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(Implication (And (Member $x0 big) (Patient $e0 $x0)) (MnPatientOfBig $e0 $x0))

;; p206781  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000937 tierB-001124 tierB-001940
(Implication (And (Member $x0 blue) (Member $x0 sky)) (MnBlue_Sky $x0))

;; p206782  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(Implication (And (Member $x0 bottom) (PartOf $x0 $x1)) (MnBottom_PartOf $x0 $x1))

;; p206794  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000371 tierB-000471 tierB-001887
(Implication (And (Member $x0 house) (Patient $e0 $x0)) (MnPatientOfHouse $e0 $x0))

;; p206795  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000685 tierB-001106 tierB-001756
(Implication (And (Member $x0 light) (Patient $e0 $x0)) (MnPatientOfLight $e0 $x0))

;; p206799  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000935 tierB-001202 tierB-001910
(Implication (And (Member $x0 problem) (Patient $e0 $x0)) (MnPatientOfProblem $e0 $x0))

;; p206802  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001642 tierB-001920 tierB-001997
(Implication (And (Member $x0 room) (Patient $e0 $x0)) (MnPatientOfRoom $e0 $x0))

;; p206803  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(Implication (And (Member $x0 thing) (Stimulus $e0 $x0)) (MnStimulusOfThing $e0 $x0))

;; p206805  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000517 tierB-000748 tierB-001491
(Implication (And (Member $x0 weather) (Patient $e0 $x0)) (MnPatientOfWeather $e0 $x0))

;; p206808  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierB-000797 tierB-001452 tierB-001809
(Implication (And (Only $x0 $e0) (Past $e0)) (MnOnlyEvOfPast $x0 $e0))

;; p206811  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(Implication (And (PartOf $x0 $x1) (Patient $e0 $x0)) (MnPatientOfPartOf $e0 $x0 $x1))

;; p206813  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-000264 tierB-001894
(Implication (And (Past $e0) (Time $e0 night)) (MnPast_TimeNight $e0))

;; p206814  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000631 tierB-000808 tierB-001762
(Implication (And (Past $e0) (Time $e0 today)) (MnPast_TimeToday $e0))

;; p206815  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(Implication (And (Past $e0) (With $e0 $x0)) (MnPast_With $e0 $x0))

;; p206817  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(Implication (And (Patient $e0 $x0) (Probably $e0)) (MnPatient_Probably $e0 $x0))

;; p206818  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(Implication (And (Patient $e0 $x0) (To $e1 $e0)) (MnToEvOfPatient $e1 $e0 $x0))

;; p206822  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001177 tierB-001566 tierB-001922
(Implication (And (Theme $e0 $x0) (To $e0 $x1)) (MnTheme_To $e0 $x0 $x1))

;; p206823  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(Implication (And (Theme $e0 $x0) (To $e1 $e0)) (MnToEvOfTheme $e1 $e0 $x0))

;; p207026  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000248 tierB-000343 tierB-000786
;;   single atom; not a proposal (a one-atom pack is a rename)
(Against $e0 $x0)

;; p207027  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001044 tierB-001117 tierB-001767
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 adriano)

;; p207033  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000025 tierB-000524 tierB-000563
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 elias)

;; p207035  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000987 tierB-001675
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 gustavo)

;; p207036  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000406 tierB-000412 tierB-000564
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 ivan)

;; p207037  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000313 tierB-000327 tierB-001449
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 linda)

;; p207039  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000107 tierB-000450 tierB-000588
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 martino)

;; p207040  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000002 tierB-000021 tierB-000048
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 mary)

;; p207042  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000219 tierB-000257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 mennad)

;; p207045  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000137 tierB-000240 tierB-000273
;;   single atom; not a proposal (a one-atom pack is a rename)
(Agent $e0 william)

;; p207048  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000463 tierB-001314 tierB-001337
;;   single atom; not a proposal (a one-atom pack is a rename)
(But $e0 $e1)

;; p207049  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-000964 tierB-001832
;;   single atom; not a proposal (a one-atom pack is a rename)
(But $e0 $x0)

;; p207050  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000340 tierA-000344 tierA-000348
;;   single atom; not a proposal (a one-atom pack is a rename)
(Degree $x0 big very)

;; p207051  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000791 tierB-000917 tierB-001051
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> week)

;; p207052  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000393 tierB-000559 tierB-001967
;;   single atom; not a proposal (a one-atom pack is a rename)
(Every $e0 <num> year)

;; p207053  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001016 tierB-001523 tierB-001966
;;   single atom; not a proposal (a one-atom pack is a rename)
(Experiencer $e0 $e1)

;; p207056  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001260 tierB-001730
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 city)

;; p207057  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000335 tierB-000338 tierB-000815
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 cookie)

;; p207058  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000796 tierB-001519 tierB-001955
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 dish)

;; p207059  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000066 tierB-000267 tierB-000550
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 friend)

;; p207060  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000120 tierB-000409 tierB-001591
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 measure)

;; p207061  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000193 tierB-000414 tierB-001479
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 noise)

;; p207062  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001351 tierB-001426 tierB-001449
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 question)

;; p207063  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000018 tierB-000913 tierB-001699
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 road)

;; p207064  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001394 tierB-001632 tierB-001886
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 tree)

;; p207065  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000864 tierB-001295 tierB-001760
;;   single atom; not a proposal (a one-atom pack is a rename)
(GroupOf $x0 woman)

;; p207066  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-000816 tierB-001909
;;   single atom; not a proposal (a one-atom pack is a rename)
(In $e0 $e1)

;; p207068  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000374 tierB-000398 tierB-001800
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 carefully)

;; p207069  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000465 tierB-000466 tierB-001149
;;   single atom; not a proposal (a one-atom pack is a rename)
(Manner $e0 really)

;; p207070  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000593 tierB-000647
;;   single atom; not a proposal (a one-atom pack is a rename)
(Measure $e0 duration <num> day)

;; p207075  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000345 tierB-000673 tierB-001688
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 attack)

;; p207076  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001605 tierB-001610 tierB-001928
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 base)

;; p207081  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000427 tierB-000636 tierB-001013
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 bring)

;; p207083  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000344 tierB-000930 tierB-001735
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 climb)

;; p207085  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000399 tierA-000400 tierB-000227
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 cross)

;; p207087  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000925 tierB-001535 tierB-001648
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 difficult)

;; p207089  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000946 tierB-000993
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 drink)

;; p207090  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000129 tierA-000134 tierA-000139
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 find_out)

;; p207091  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000228 tierB-001384 tierB-001512
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 grow)

;; p207093  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000689 tierB-001449 tierB-001843
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 know)

;; p207094  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000759 tierB-001149 tierB-001989
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 mean)

;; p207097  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000208 tierB-001358 tierB-001995
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 produce)

;; p207098  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000470 tierB-001120 tierB-001386
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 pull)

;; p207101  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000115 tierB-000686 tierB-000980
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 see)

;; p207102  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001218 tierB-001933 tierB-001977
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 shine)

;; p207103  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000256 tierB-000813 tierB-001813
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 shoot)

;; p207106  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000053 tierB-000271 tierB-001068
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 speak)

;; p207108  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000132 tierB-000147 tierB-001471
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 take_off)

;; p207110  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000114 tierB-000816 tierB-001909
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 understand)

;; p207111  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001318 tierB-001396 tierB-001801
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 wear)

;; p207112  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000145 tierB-000730 tierB-001345
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $e0 win)

;; p207113  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000033 tierB-000692 tierB-001806
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 accident)

;; p207114  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-000360 tierB-001043
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 atmosphere)

;; p207115  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000170 tierB-001843 tierB-001964
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 author)

;; p207116  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000103 tierB-000343 tierB-001092
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ball)

;; p207117  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000221 tierB-001081 tierB-001775
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 beach)

;; p207119  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000676 tierB-001385 tierB-001688
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 building)

;; p207120  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000330 tierB-000619 tierB-001040
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 camera)

;; p207121  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000476 tierB-000687 tierB-001925
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ceiling)

;; p207122  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000143 tierB-000202 tierB-000739
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 church)

;; p207123  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000205 tierB-000261 tierB-000362
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cold)

;; p207124  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000387 tierB-000781 tierB-001000
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 concert)

;; p207125  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000462 tierB-000942 tierB-001663
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 cook)

;; p207126  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000207 tierB-001546 tierB-001928
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 country)

;; p207127  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000251 tierB-001146 tierB-001519
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 day)

;; p207128  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001002 tierB-001053 tierB-001186
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 desk)

;; p207129  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000025 tierB-001455 tierB-001831
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 difference)

;; p207130  support 3 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000285 tierB-001022 tierB-001529
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 different)

;; p207131  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000021 tierB-001587 tierB-001634
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 dress)

;; p207132  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001259 tierB-001322 tierB-001582
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 earth)

;; p207133  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000949 tierB-001232 tierB-001336
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fact)

;; p207135  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000774 tierB-001153 tierB-001490
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 field)

;; p207136  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000505 tierB-001017 tierB-001295
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 film)

;; p207137  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fitter)

;; p207138  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000872 tierB-000923 tierB-000977
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 flower)

;; p207139  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000141 tierB-000609 tierB-000929
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 forest)

;; p207140  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000423 tierB-000871 tierB-001399
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 fox)

;; p207141  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000498 tierB-001610 tierB-001845
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 game)

;; p207142  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000548 tierB-001800 tierB-001885
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 government)

;; p207143  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000522 tierB-001329 tierB-001470
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 great)

;; p207144  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000248 tierB-000551 tierB-000664
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 king)

;; p207145  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000604 tierB-001291 tierB-001403
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 kitchen)

;; p207146  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000288 tierB-001762 tierB-001848
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 law)

;; p207147  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001120 tierB-001383
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 line)

;; p207150  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000073 tierB-000352 tierB-000695
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 noise)

;; p207151  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000573 tierB-000722 tierB-001257
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 ocean)

;; p207152  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000252 tierB-000332 tierB-001572
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 opportunity)

;; p207153  support 3 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000202 tierB-000792 tierB-001738
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 other)

;; p207154  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001250 tierB-001638
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 page)

;; p207155  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000569 tierB-001239 tierB-001331
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 park)

;; p207156  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000049 tierB-001263 tierB-001498
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 patient)

;; p207157  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000394 tierB-000535 tierB-000714
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 plant)

;; p207158  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000150 tierB-000256 tierB-000547
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 police)

;; p207159  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000005 tierB-000617 tierB-001716
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 population)

;; p207160  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000224 tierB-000306 tierB-000777
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 report)

;; p207161  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000521 tierB-000902 tierB-001180
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 right)

;; p207162  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000230 tierB-000503 tierB-000734
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 spider)

;; p207163  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000081 tierB-000706 tierB-001699
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 station)

;; p207164  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000156 tierB-001223 tierB-001453
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 strong)

;; p207165  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000700 tierB-000749 tierB-001219
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 teacher)

;; p207166  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001108 tierB-001266 tierB-001573
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 theater)

;; p207167  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000208 tierB-000356 tierB-001166
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 top)

;; p207168  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000128 tierB-000437 tierB-001878
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 treaty)

;; p207169  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000694 tierB-000745 tierB-001223
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 truth)

;; p207170  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000510 tierB-000931 tierB-001569
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 valuable)

;; p207174  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000039 tierB-001055 tierB-001752
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 wood)

;; p207175  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000879 tierB-001389 tierB-001980
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 work)

;; p207176  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000367 tierB-000832 tierB-001890
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 yellow)

;; p207177  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000602 tierB-001773 tierB-001870
;;   single atom; not a proposal (a one-atom pack is a rename)
(Member $x0 young)

;; p207178  support 3 (occ 3)  size 1  root (LocatedIn (constant)  depth 1
;;   e.g. tierB-000664 tierB-001207 tierB-001292
;;   single atom; not a proposal (a one-atom pack is a rename)
(Past (LocatedIn $x0 there))

;; p207179  support 3 (occ 3)  size 1  root (Member (constant)  depth 1
;;   e.g. tierB-000495 tierB-001170 tierB-001521
;;   single atom; not a proposal (a one-atom pack is a rename)
(Probably (Member $x0 good))

;; p207180  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000124 tierB-000196 tierB-000723
;;   single atom; not a proposal (a one-atom pack is a rename)
(ProportionOf $x0 $x1 some)

;; p207182  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000229 tierB-001518 tierB-001745
;;   single atom; not a proposal (a one-atom pack is a rename)
(RestOf $x0 $x1)

;; p207183  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000908 tierB-000997 tierB-001031
;;   single atom; not a proposal (a one-atom pack is a rename)
(Start $e0 (Year <num>))

;; p207188  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000251 tierB-000828 tierB-000903
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 $x0)

;; p207189  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000168 tierB-000699 tierB-001440
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 soon)

;; p207190  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000260
;;   single atom; not a proposal (a one-atom pack is a rename)
(Time $e0 that_autumn)

;; ==================== SUBSUMED UNITS: 730 of 2125 rooted-subtree units (0 proposals; k = 4, support >= 3 of 2352 records) ====================

;; p200342  support 23 (occ 23)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000142 tierB-000408 tierB-000492
;;   subsumed by p200338 (MnHolder_Have_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have))

;; p200441  support 18 (occ 19)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200436 (MnBuy_Theme); not a proposal
(Member $e0 buy)

;; p200467  support 17 (occ 18)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200461 (MnBuy_Past_Theme); not a proposal
(And (Member $e0 buy) (Past $e0))

;; p200583  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200579 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))

;; p200584  support 14 (occ 14)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200579 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p200591  support 14 (occ 14)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000001 tierA-000005 tierA-000006
;;   subsumed by p200579 (MnAgent_Buy_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy))

;; p200683  support 13 (occ 13)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   subsumed by p200671 (MnDestroy_Patient); not a proposal
(Member $e0 destroy)

;; p200761  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200757 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))

;; p200762  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200757 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))

;; p200764  support 12 (occ 12)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200757 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p200778  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p200757 (MnAgent_Give_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give))

;; p200782  support 12 (occ 12)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000465
;;   subsumed by p200733 (MnStart_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Theme $e0 $e1))

;; p200864  support 11 (occ 11)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   subsumed by p200846 (MnAnswer_Theme); not a proposal
(Member $e0 answer)

;; p200933  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000207 tierA-000209 tierA-000210
;;   subsumed by p200925 (MnAgent_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer))

;; p200935  support 10 (occ 10)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000222 tierA-000224 tierA-000226
;;   subsumed by p200926 (MnAgent_Destroy_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 destroy))

;; p200954  support 10 (occ 10)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p200941 (MnLend_Theme); not a proposal
(Member $e0 lend)

;; p201065  support 9 (occ 9)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000199 tierB-000265 tierB-000534
;;   subsumed by p200966 (MnStart_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p201079  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201058 (MnAgent_Discover_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover))

;; p201080  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p201059 (MnAgent_Lend_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend))

;; p201085  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000185 tierA-000189 tierA-000190
;;   subsumed by p201057 (MnAgent_Decide_Theme); not a proposal
(And (Member $e0 decide) (Theme $e0 $x0))

;; p201086  support 9 (occ 9)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p201058 (MnAgent_Discover_Theme); not a proposal
(And (Member $e0 discover) (Theme $e0 $x0))

;; p201113  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000143 tierA-000145 tierA-000148
;;   subsumed by p201078 (MnAgent_Cancel); not a proposal
(Member $e0 cancel)

;; p201118  support 9 (occ 9)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201088 (MnRepair_Patient); not a proposal
(Member $e0 repair)

;; p201246  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   subsumed by p201218 (MnAgent_Abandon_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 abandon))

;; p201248  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   subsumed by p201219 (MnAgent_Reject_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 reject))

;; p201249  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201220 (MnAgent_Repair_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 repair))

;; p201258  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   subsumed by p201218 (MnAgent_Abandon_Theme); not a proposal
(And (Member $e0 abandon) (Theme $e0 $x0))

;; p201261  support 8 (occ 8)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   subsumed by p201219 (MnAgent_Reject_Theme); not a proposal
(And (Member $e0 reject) (Theme $e0 $x0))

;; p201291  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000099 tierA-000101 tierA-000104
;;   subsumed by p201218 (MnAgent_Abandon_Theme); not a proposal
(Member $e0 abandon)

;; p201295  support 8 (occ 8)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000158 tierA-000160 tierA-000162
;;   subsumed by p201219 (MnAgent_Reject_Theme); not a proposal
(Member $e0 reject)

;; p201393  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201308 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p201457  support 7 (occ 7)  size 1  root pottery_studio (constant)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201445 (MnPotteryStudioOfInheritanceStudio); not a proposal
(Inheritance pottery_studio studio)

;; p201474  support 7 (occ 7)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201308 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p201512  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   subsumed by p201470 (MnAgent_Postpone_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 postpone))

;; p201513  support 7 (occ 7)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201391 (MnAgentOfDepot_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 depot))

;; p201519  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000173 tierB-000240
;;   subsumed by p201308 (MnBegin_Past_ThemeEvOfOngoing); not a proposal
(And (Member $e0 begin) (Theme $e0 $e1))

;; p201520  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000145 tierA-000148 tierA-000150
;;   subsumed by p201468 (MnAgent_Cancel_Patient); not a proposal
(And (Member $e0 cancel) (Patient $e0 $x0))

;; p201525  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000300 tierA-000301 tierA-000303
;;   subsumed by p201475 (MnLend_Recipient_Theme); not a proposal
(And (Member $e0 lend) (Recipient $e0 $x0))

;; p201528  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000114 tierA-000116 tierA-000119
;;   subsumed by p201470 (MnAgent_Postpone_Theme); not a proposal
(And (Member $e0 postpone) (Theme $e0 $x0))

;; p201529  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201476 (MnRepair_Past_Patient); not a proposal
(And (Member $e0 repair) (Past $e0))

;; p201531  support 7 (occ 7)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p201471 (MnAgent_Teach_Theme); not a proposal
(And (Member $e0 teach) (Theme $e0 $x0))

;; p201565  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201516 (MnCardinalityNum_GroupOfForklift); not a proposal
(GroupOf $x0 forklift)

;; p201568  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000393 tierB-000412
;;   subsumed by p201524 (MnKill_Patient); not a proposal
(Member $e0 kill)

;; p201581  support 7 (occ 7)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201445 (MnPotteryStudioOfInheritanceStudio); not a proposal
(Member $x0 pottery_studio)

;; p201586  support 7 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   subsumed by p201535 (MnPast_Through); not a proposal
(Through $e0 $x0)

;; p201697  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201593 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0))

;; p201698  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201593 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall) (Theme $e0 $x1))

;; p201699  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201594 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))

;; p201767  support 6 (occ 6)  size 1  root yard_floodlight (constant)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201758 (MnYardFloodlightOfInheritanceFloodlight); not a proposal
(Inheritance yard_floodlight floodlight)

;; p201793  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p201775 (MnAgent_Lend_Recipient_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))

;; p201795  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000029 tierA-000032 tierA-000034
;;   subsumed by p201776 (MnAgent_Repair_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))

;; p201796  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201593 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201797  support 6 (occ 6)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201594 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201803  support 6 (occ 6)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p201777 (MnAgent_Teach_Recipient_Theme); not a proposal
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p201840  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p201794 (MnAgent_Order_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 order))

;; p201844  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201593 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $x0 hall))

;; p201845  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201593 (MnBeneficiaryOfHall_Past_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Theme $e0 $x1))

;; p201852  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201594 (MnPast_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Theme $e0 $x0))

;; p201860  support 6 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p201794 (MnAgent_Order_Theme); not a proposal
(And (Member $e0 order) (Theme $e0 $x0))

;; p201866  support 6 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201701 (MnPast_ThemeOfKiln); not a proposal
(And (Member $x0 kiln) (Theme $e0 $x0))

;; p201917  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201853 (MnGroupOfLemon_Crate); not a proposal
(GroupOf $x0 lemon)

;; p201921  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   subsumed by p201856 (MnCapture_Past); not a proposal
(Member $e0 capture)

;; p201926  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p201794 (MnAgent_Order_Theme); not a proposal
(Member $e0 order)

;; p201931  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p201865 (MnBudget_PossessionNextYear); not a proposal
(Member $x0 budget)

;; p201956  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201758 (MnYardFloodlightOfInheritanceFloodlight); not a proposal
(Member $x0 yard_floodlight)

;; p201958  support 6 (occ 6)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p201865 (MnBudget_PossessionNextYear); not a proposal
(Possession $x0 next_year)

;; p201960  support 6 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000237 tierB-000327 tierB-000565
;;   subsumed by p201869 (MnPast_TimeYesterday); not a proposal
(Time $e0 yesterday)

;; p202274  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201968 (MnAgentOfSchool_BeneficiaryOfHall); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school))

;; p202275  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201968 (MnAgentOfSchool_BeneficiaryOfHall); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall))

;; p202277  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201973 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Theme $e0 $x1))

;; p202278  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201975 (MnAgent_ThemeOfCardinalityNum-GroupOfForklift); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))

;; p202279  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201982 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio))

;; p202280  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201985 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 point))

;; p202284  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201986 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x0 club) (Theme $e0 $x1))

;; p202285  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000002 tierA-000003
;;   subsumed by p201987 (MnAgentOfDepot_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))

;; p202286  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201989 (MnAgentOfElectrician_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0))

;; p202287  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201988 (MnAgentOfElectrician_PatientOfYardFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician) (Patient $e0 $x1))

;; p202290  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201982 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0))

;; p202291  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201983 (MnAgentOfPotteryStudioOfInheritanceStudio_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1))

;; p202292  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201990 (MnAgentOfPotteryStudio_ThemeOfKiln); not a proposal
(And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1))

;; p202293  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201974 (MnAgentOfCardinalityNum_ThemeOfNorthRoute); not a proposal
(And (Agent $e0 $x0) (Member $x1 north_route) (Theme $e0 $x1))

;; p202295  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201986 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x1 tournament) (Theme $e0 $x1))

;; p202296  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201984 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Patient $e0 $x1))

;; p202297  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201995 (MnBeneficiaryOfHall_ThemeOfProjector); not a proposal
(And (Beneficiary $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p202300  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201997 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x0))

;; p202301  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p202302  support 5 (occ 5)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201999 (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute); not a proposal
(And (Inheritance north_route north) (Inheritance north_route route) (Member $x0 north_route))

;; p202303  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201980 (MnAgent_ThemeOfNorthRouteOfInheritanceNorth); not a proposal
(And (Inheritance north_route north) (Member $x0 north_route) (Theme $e0 $x0))

;; p202304  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201981 (MnAgent_ThemeOfNorthRouteOfInheritanceRoute); not a proposal
(And (Inheritance north_route route) (Member $x0 north_route) (Theme $e0 $x0))

;; p202305  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p202306  support 5 (occ 5)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201984 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p202307  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201985 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Location $e0 $x0) (Member $x0 point) (Theme $e0 $x1))

;; p202309  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierB-000265 tierB-000942 tierB-001446
;;   subsumed by p202002 (MnStart_ThemeEvOfOngoing-Patient); not a proposal
(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202310  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p202311  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201997 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Member $x0 crate) (Past $e0) (Theme $e0 $x0))

;; p202313  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201996 (MnBeneficiary_Past_ThemeOfProjector); not a proposal
(And (Member $x0 projector) (Past $e0) (Theme $e0 $x0))

;; p202314  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Member $x0 shoreline_survey) (Patient $e0 $x0) (Time $e0 dawn))

;; p202316  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201994 (MnAgent_Past_PatientOfYardFloodlight); not a proposal
(And (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))

;; p202455  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest))

;; p202459  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201980 (MnAgent_ThemeOfNorthRouteOfInheritanceNorth); not a proposal
(And (Inheritance north_route north) (Member $x0 north_route))

;; p202460  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201981 (MnAgent_ThemeOfNorthRouteOfInheritanceRoute); not a proposal
(And (Inheritance north_route route) (Member $x0 north_route))

;; p202462  support 5 (occ 5)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Inheritance shoreline_survey survey) (Member $x0 shoreline_survey))

;; p202491  support 5 (occ 5)  size 2  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201999 (MnThemeOfNorthRouteOfInheritanceNorth-InheritanceRoute); not a proposal
(And (Inheritance north_route north) (Inheritance north_route route))

;; p202508  support 5 (occ 5)  size 1  root afternoon_session (constant)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202454 (MnAfternoonSessionOfInheritanceSession); not a proposal
(Inheritance afternoon_session session)

;; p202509  support 5 (occ 5)  size 1  root apple_harvest (constant)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(Inheritance apple_harvest harvest)

;; p202510  support 5 (occ 5)  size 1  root dress_rehearsal (constant)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202456 (MnDressRehearsalOfInheritanceRehearsal); not a proposal
(Inheritance dress_rehearsal rehearsal)

;; p202511  support 5 (occ 5)  size 1  root evening_flight (constant)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   subsumed by p202457 (MnEveningFlightOfInheritanceFlight); not a proposal
(Inheritance evening_flight flight)

;; p202512  support 5 (occ 5)  size 1  root loan_application (constant)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p202458 (MnLoanApplicationOfInheritanceApplication); not a proposal
(Inheritance loan_application application)

;; p202513  support 5 (occ 5)  size 1  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p202490 (MnInheritanceMonthly_InheritanceServicing); not a proposal
(Inheritance monthly_servicing monthly)

;; p202514  support 5 (occ 5)  size 1  root monthly_servicing (constant)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p202490 (MnInheritanceMonthly_InheritanceServicing); not a proposal
(Inheritance monthly_servicing servicing)

;; p202515  support 5 (occ 5)  size 1  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201980 (MnAgent_ThemeOfNorthRouteOfInheritanceNorth); not a proposal
(Inheritance north_route north)

;; p202516  support 5 (occ 5)  size 1  root north_route (constant)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201981 (MnAgent_ThemeOfNorthRouteOfInheritanceRoute); not a proposal
(Inheritance north_route route)

;; p202517  support 5 (occ 5)  size 1  root rescue_team (constant)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202461 (MnRescueTeamOfInheritanceTeam); not a proposal
(Inheritance rescue_team team)

;; p202518  support 5 (occ 5)  size 1  root shoreline_survey (constant)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(Inheritance shoreline_survey survey)

;; p202519  support 5 (occ 5)  size 1  root summer_fair (constant)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202463 (MnSummerFairOfInheritanceFair); not a proposal
(Inheritance summer_fair fair)

;; p202564  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201969 (MnAgentOfSchool_Beneficiary_Past); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0))

;; p202565  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201970 (MnAgentOfSchool_Beneficiary_Theme); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Theme $e0 $x2))

;; p202566  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201973 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p202578  support 5 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201997 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x0))

;; p202579  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202544 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))

;; p202580  support 5 (occ 5)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202544 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p202650  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201973 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber))

;; p202652  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p202570 (MnAgent_Examine_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 examine))

;; p202656  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p202571 (MnAgent_Sign_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 sign))

;; p202658  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000392 tierA-000398
;;   subsumed by p202282 (MnAgentOfAutomobile_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 automobile))

;; p202659  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000305 tierB-000337 tierB-000340
;;   subsumed by p202283 (MnAgentOfBoy_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 boy))

;; p202660  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201986 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Agent $e0 $x0) (Member $x0 club))

;; p202661  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201988 (MnAgentOfElectrician_PatientOfYardFloodlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 electrician))

;; p202666  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000023 tierA-000024
;;   subsumed by p201982 (MnAgentOfPotteryStudioOfInheritanceStudio_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 pottery_studio))

;; p202671  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000500 tierB-000656 tierB-000782
;;   subsumed by p202574 (MnAgent_Past_Through); not a proposal
(And (Agent $e0 $x0) (Through $e0 $x1))

;; p202675  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201973 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(And (Cardinality $x0 <num>) (GroupOf $x0 climber))

;; p202676  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000320 tierB-000779 tierB-000838
;;   subsumed by p202299 (MnPast_PatientOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Patient $e0 $x0))

;; p202677  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000318 tierA-000319
;;   subsumed by p202567 (MnAgent_CoAgent_Location); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1))

;; p202681  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000085 tierA-000086
;;   subsumed by p202575 (MnThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Theme $e0 $x0))

;; p202682  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201997 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (GroupOf $x0 lemon) (Theme $e0 $x0))

;; p202685  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000665 tierB-000797 tierB-001264
;;   subsumed by p202544 (MnHolder_Have_Past_Theme); not a proposal
(And (Holder $e0 $x0) (Past $e0))

;; p202688  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p201985 (MnAgent_LocationOfPoint_Theme); not a proposal
(And (Location $e0 $x0) (Member $x0 point))

;; p202690  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000636 tierB-000852
;;   subsumed by p202581 (MnCapture_Past_Theme); not a proposal
(And (Member $e0 capture) (Theme $e0 $x0))

;; p202695  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p202570 (MnAgent_Examine_Theme); not a proposal
(And (Member $e0 examine) (Theme $e0 $x0))

;; p202699  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000067 tierB-000412 tierB-001197
;;   subsumed by p202583 (MnKill_Past_Patient); not a proposal
(And (Member $e0 kill) (Past $e0))

;; p202703  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p202585 (MnSell_Past_Theme); not a proposal
(And (Member $e0 sell) (Past $e0))

;; p202704  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p202571 (MnAgent_Sign_Patient); not a proposal
(And (Member $e0 sign) (Patient $e0 $x0))

;; p202710  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p202711  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p202588 (MnThemeOfBudget-PossessionNextYear); not a proposal
(And (Member $x0 budget) (Theme $e0 $x0))

;; p202713  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p201997 (MnPast_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Member $x0 crate) (Theme $e0 $x0))

;; p202715  support 5 (occ 5)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202312 (MnTender_PossessionOfFirm); not a proposal
(And (Member $x0 firm) (Possession $x1 $x0))

;; p202717  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201974 (MnAgentOfCardinalityNum_ThemeOfNorthRoute); not a proposal
(And (Member $x0 north_route) (Theme $e0 $x0))

;; p202718  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201995 (MnBeneficiaryOfHall_ThemeOfProjector); not a proposal
(And (Member $x0 projector) (Theme $e0 $x0))

;; p202721  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Member $x0 shoreline_survey) (Patient $e0 $x0))

;; p202722  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000292 tierA-000293
;;   subsumed by p202294 (MnAgent_ThemeOfSong); not a proposal
(And (Member $x0 song) (Theme $e0 $x0))

;; p202724  support 5 (occ 5)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202312 (MnTender_PossessionOfFirm); not a proposal
(And (Member $x0 tender) (Possession $x0 $x1))

;; p202725  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201986 (MnAgentOfClub_ThemeOfTournament); not a proposal
(And (Member $x0 tournament) (Theme $e0 $x0))

;; p202726  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000035 tierA-000036 tierA-000037
;;   subsumed by p201984 (MnAgent_PatientOfYardFloodlightOfInheritanceFloodlight); not a proposal
(And (Member $x0 yard_floodlight) (Patient $e0 $x0))

;; p202731  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Month september)))

;; p202732  support 5 (occ 5)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(And (Patient $e0 $x0) (Time $e0 dawn))

;; p202733  support 5 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000202 tierA-000203
;;   subsumed by p202588 (MnThemeOfBudget-PossessionNextYear); not a proposal
(And (Possession $x0 next_year) (Theme $e0 $x0))

;; p202800  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201973 (MnAgentOfCardinalityNum-GroupOfClimber_Theme); not a proposal
(GroupOf $x0 climber)

;; p202807  support 5 (occ 7)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000454 tierB-000768
;;   subsumed by p202692 (MnContain_Theme); not a proposal
(Member $e0 contain)

;; p202808  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000253 tierA-000255 tierA-000257
;;   subsumed by p202693 (MnDie_Patient); not a proposal
(Member $e0 die)

;; p202810  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000056 tierA-000060 tierA-000071
;;   subsumed by p202694 (MnEnd_Patient); not a proposal
(Member $e0 end)

;; p202811  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p202570 (MnAgent_Examine_Theme); not a proposal
(Member $e0 examine)

;; p202816  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p202571 (MnAgent_Sign_Patient); not a proposal
(Member $e0 sign)

;; p202817  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-000712 tierB-001299
;;   subsumed by p202706 (MnStand_Past); not a proposal
(Member $e0 stand)

;; p202822  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202454 (MnAfternoonSessionOfInheritanceSession); not a proposal
(Member $x0 afternoon_session)

;; p202824  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(Member $x0 apple_harvest)

;; p202842  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202456 (MnDressRehearsalOfInheritanceRehearsal); not a proposal
(Member $x0 dress_rehearsal)

;; p202846  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000143 tierA-000144 tierA-000145
;;   subsumed by p202457 (MnEveningFlightOfInheritanceFlight); not a proposal
(Member $x0 evening_flight)

;; p202847  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202714 (MnFile_Missing); not a proposal
(Member $x0 file)

;; p202848  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202312 (MnTender_PossessionOfFirm); not a proposal
(Member $x0 firm)

;; p202854  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202716 (MnGearbox_Seized); not a proposal
(Member $x0 gearbox)

;; p202863  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p202458 (MnLoanApplicationOfInheritanceApplication); not a proposal
(Member $x0 loan_application)

;; p202867  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202714 (MnFile_Missing); not a proposal
(Member $x0 missing)

;; p202869  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000109 tierA-000110 tierA-000111
;;   subsumed by p201974 (MnAgentOfCardinalityNum_ThemeOfNorthRoute); not a proposal
(Member $x0 north_route)

;; p202875  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p201995 (MnBeneficiaryOfHall_ThemeOfProjector); not a proposal
(Member $x0 projector)

;; p202878  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202461 (MnRescueTeamOfInheritanceTeam); not a proposal
(Member $x0 rescue_team)

;; p202880  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202716 (MnGearbox_Seized); not a proposal
(Member $x0 seized)

;; p202881  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(Member $x0 shoreline_survey)

;; p202883  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202463 (MnSummerFairOfInheritanceFair); not a proposal
(Member $x0 summer_fair)

;; p202885  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202312 (MnTender_PossessionOfFirm); not a proposal
(Member $x0 tender)

;; p202886  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000123 tierA-000124 tierA-000125
;;   subsumed by p201986 (MnAgentOfClub_ThemeOfTournament); not a proposal
(Member $x0 tournament)

;; p202888  support 5 (occ 5)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202667 (MnAgentOfTutor); not a proposal
(Member $x0 tutor)

;; p202898  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000282 tierA-000283
;;   subsumed by p202670 (MnAgent_ThemeGlazing); not a proposal
(Theme $e0 glazing)

;; p202899  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p201998 (MnPatientOfAppleHarvestOfInheritanceHarvest_Time(MonthSeptember); not a proposal
(Time $e0 (Month september))

;; p202900  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000139 tierB-000309 tierB-000373
;;   subsumed by p202729 (MnPast_Time(YearNum); not a proposal
(Time $e0 (Year <num>))

;; p202901  support 5 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000052 tierA-000053 tierA-000054
;;   subsumed by p202000 (MnPatientOfShorelineSurveyOfInheritanceSurvey_TimeDawn); not a proposal
(Time $e0 dawn)

;; p202903  support 5 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001031
;;   subsumed by p202730 (MnPast_TimeAtMost(YearNum); not a proposal
(TimeAtMost $e0 (Year <num>))

;; p203432  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p202915 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1))

;; p203434  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202919 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Inheritance rescue_team team) (Member $x0 rescue_team))

;; p203435  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p202922 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist))

;; p203436  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202923 (MnAgentOfDiver_LocationOfPoint); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver))

;; p203437  support 4 (occ 5)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p202922 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p203438  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p202927 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1))

;; p203439  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p202928 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1))

;; p203440  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p202930 (MnStart_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))

;; p203442  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p202934 (MnAgentOfChef_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef) (Past $e0))

;; p203443  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p202915 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1))

;; p203445  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202935 (MnAgentOfCouncil_PatientOfSummerFair); not a proposal
(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))

;; p203447  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202924 (MnAgentOfDiver_Location_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 diver) (Theme $e0 $x1))

;; p203448  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p202937 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x0 editor) (Theme $e0 $x1))

;; p203449  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202939 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x0 firm) (Theme $e0 $x1))

;; p203450  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202941 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x0 intern) (Theme $e0 $x1))

;; p203452  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202945 (MnAgentOfMechanic_Past_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0))

;; p203453  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202943 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic) (Patient $e0 $x1))

;; p203455  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p202946 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x0 panel) (Theme $e0 $x1))

;; p203457  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202919 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 rescue_team) (Theme $e0 $x1))

;; p203458  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202950 (MnAgentOfTutor_PatientOfAfternoonSession); not a proposal
(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))

;; p203459  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202918 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))

;; p203460  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p202916 (MnAgent_ThemeOfGroupOfLemon-Crate); not a proposal
(And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1))

;; p203462  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202941 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x1 file) (Theme $e0 $x1))

;; p203463  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202943 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x1 gearbox) (Patient $e0 $x1))

;; p203465  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p202926 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Agent $e0 $x0) (Member $x1 lane) (Theme $e0 $x1))

;; p203467  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p202937 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x1 manuscript) (Theme $e0 $x1))

;; p203468  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202942 (MnAgentOfIntern_ThemeOfMissing); not a proposal
(And (Agent $e0 $x0) (Member $x1 missing) (Theme $e0 $x1))

;; p203469  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000009 tierA-000010
;;   subsumed by p202913 (MnAgent_Beneficiary_ThemeOfProjector); not a proposal
(And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))

;; p203470  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p202946 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x1 proposal) (Theme $e0 $x1))

;; p203472  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202948 (MnAgentOfRescueTeam_ThemeOfSearch); not a proposal
(And (Agent $e0 $x0) (Member $x1 search) (Theme $e0 $x1))

;; p203473  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202944 (MnAgentOfMechanic_PatientOfSeized); not a proposal
(And (Agent $e0 $x0) (Member $x1 seized) (Patient $e0 $x1))

;; p203474  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202920 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))

;; p203476  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202939 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x1 tender) (Theme $e0 $x1))

;; p203477  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   subsumed by p202932 (MnAgentOfBoard_ThemeOfVote); not a proposal
(And (Agent $e0 $x0) (Member $x1 vote) (Theme $e0 $x1))

;; p203478  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202925 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Agent $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p203480  support 4 (occ 4)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202961 (MnBeforeEvOfPatientOfDressRehearsal_Lunch); not a proposal
(And (Before $x0 $e0) (Member $x0 lunch) (Patient $e0 $x1))

;; p203481  support 4 (occ 4)  size 3  root $x0 (entity)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202960 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))

;; p203482  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p202914 (MnAgent_Buy_ThemeOfCardinalityNum); not a proposal
(And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))

;; p203486  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p202967 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Experiencer $e0 $x0) (Location $e1 $x1) (Stimulus $e0 $e1))

;; p203487  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p202968 (MnFuture_PatientOfAppleHarvestOfInheritanceHarvest); not a proposal
(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))

;; p203488  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p202962 (MnHolder_ThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))

;; p203489  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000084 tierA-000086 tierA-000087
;;   subsumed by p202963 (MnRequire_ThemeOfCardinalityNum-GroupOfEgg); not a proposal
(And (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))

;; p203491  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p202965 (MnHolderOfRecipe_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1))

;; p203492  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202918 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p203493  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202960 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p203495  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202920 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p203496  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p202921 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point))

;; p203498  support 4 (occ 4)  size 3  root $e1 (event)  depth 3
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p202967 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Location $e0 $x0) (Member $x0 ledger) (Stimulus $e1 $e0))

;; p203500  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202925 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Location $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))

;; p203501  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p202926 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $e0 block) (Member $x0 lane) (Theme $e0 $x0))

;; p203504  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p202927 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0))

;; p203505  support 4 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p202928 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0))

;; p203508  support 4 (occ 4)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202977 (MnThemeOfTender-PossessionOfFirm); not a proposal
(And (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))

;; p203509  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202954 (MnAgent_Past_PatientOfGearbox); not a proposal
(And (Member $x0 gearbox) (Past $e0) (Patient $e0 $x0))

;; p203510  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p203511  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 morning))

;; p203513  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202957 (MnAgent_Past_PatientOfSeized); not a proposal
(And (Member $x0 seized) (Past $e0) (Patient $e0 $x0))

;; p203726  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p203494 (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p203727  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p203494 (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p203762  support 4 (occ 4)  size 1  root night_crew (constant)  depth 1
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   subsumed by p203728 (MnNightCrewOfInheritanceCrew); not a proposal
(Inheritance night_crew crew)

;; p203764  support 4 (occ 4)  size 1  root soil_sample (constant)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203725 (MnGroupOfSoilSampleOfInheritanceSample); not a proposal
(Inheritance soil_sample sample)

;; p203765  support 4 (occ 4)  size 1  root spoil_mound (constant)  depth 1
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   subsumed by p203729 (MnSpoilMoundOfInheritanceMound); not a proposal
(Inheritance spoil_mound mound)

;; p203836  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p202921 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover))

;; p203838  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))

;; p203839  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))

;; p203840  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p202926 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Agent $e0 $x0) (Member $e0 block) (Theme $e0 $x1))

;; p203844  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p202927 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1))

;; p203845  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))

;; p203846  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))

;; p203847  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p202928 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1))

;; p203848  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p203793 (MnAgent_Receive_Source_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))

;; p203849  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p203793 (MnAgent_Receive_Source_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1))

;; p203850  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p203794 (MnAgent_Start_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0))

;; p203851  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p202929 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p203853  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203795 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing))

;; p203855  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203795 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 glazing))

;; p203859  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p202969 (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember); not a proposal
(And (Future $e0) (Patient $e0 $x0) (Time $e0 (Month september)))

;; p203863  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p202971 (MnLocationOfPoint_Discover_Theme); not a proposal
(And (Location $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))

;; p203864  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))

;; p203868  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))

;; p203869  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p203793 (MnAgent_Receive_Source_Theme); not a proposal
(And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1))

;; p203870  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203796 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))

;; p203871  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203796 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p203872  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000265 tierB-001446 tierB-001816
;;   subsumed by p202975 (MnStart_Patient_ThemeEvOfOngoing); not a proposal
(And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))

;; p203874  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203795 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p203876  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202952 (MnAgent_ThemeOfFile-Missing); not a proposal
(And (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))

;; p203877  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202953 (MnAgent_PatientOfGearbox-Seized); not a proposal
(And (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x0))

;; p203880  support 4 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202977 (MnThemeOfTender-PossessionOfFirm); not a proposal
(And (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203885  support 4 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p204002  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 acquire))

;; p204004  support 4 (occ 6)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000101 tierB-000768 tierB-001254
;;   subsumed by p203842 (MnAgent_Contain_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 contain))

;; p204007  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p203843 (MnAgent_Jump_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 jump))

;; p204009  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 purchase))

;; p204010  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000738 tierB-000942 tierB-001169
;;   subsumed by p202929 (MnAgent_Start_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 start))

;; p204011  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p203852 (MnAgent_Swim_Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 swim))

;; p204015  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p202922 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Agent $e0 $x0) (Member $x0 biologist))

;; p204016  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000073 tierB-000381 tierB-001183
;;   subsumed by p203441 (MnAgentOfCat_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 cat))

;; p204017  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000015 tierA-000016 tierA-000017
;;   subsumed by p202915 (MnAgentOfChef_ThemeOfGroupOfLemon); not a proposal
(And (Agent $e0 $x0) (Member $x0 chef))

;; p204018  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000208 tierA-000209
;;   subsumed by p203444 (MnAgentOfClerk_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 clerk))

;; p204021  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202935 (MnAgentOfCouncil_PatientOfSummerFair); not a proposal
(And (Agent $e0 $x0) (Member $x0 council))

;; p204022  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p203446 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Member $x0 delegation))

;; p204023  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202923 (MnAgentOfDiver_LocationOfPoint); not a proposal
(And (Agent $e0 $x0) (Member $x0 diver))

;; p204024  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p202937 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Agent $e0 $x0) (Member $x0 editor))

;; p204025  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202939 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Agent $e0 $x0) (Member $x0 firm))

;; p204027  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202941 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Agent $e0 $x0) (Member $x0 intern))

;; p204028  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202943 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Agent $e0 $x0) (Member $x0 mechanic))

;; p204029  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p203454 (MnAgentOfMuseum_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 museum))

;; p204030  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p202946 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Agent $e0 $x0) (Member $x0 panel))

;; p204031  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202919 (MnAgentOfRescueTeamOfInheritanceTeam_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 rescue_team))

;; p204034  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p203446 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Time $e0 (Weekday thursday)))

;; p204035  support 4 (occ 4)  size 2  root $e0 (event)  depth 0
;;   e.g. tierB-000034 tierB-000616 tierB-001000
;;   subsumed by p203856 (MnAlready_Past_Patient); not a proposal
(And (Already $e0) (Past $e0))

;; p204037  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202961 (MnBeforeEvOfPatientOfDressRehearsal_Lunch); not a proposal
(And (Before $x0 $e0) (Member $x0 lunch))

;; p204038  support 4 (occ 4)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202960 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Before $x0 $e0) (Patient $e0 $x1))

;; p204048  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p202967 (MnExperiencer_StimulusEvOfLocationOfLedger); not a proposal
(And (Experiencer $e0 $x0) (Stimulus $e0 $e1))

;; p204050  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000241
;;   subsumed by p203834 (MnAgent_Future_Arrive); not a proposal
(And (Future $e0) (Member $e0 arrive))

;; p204052  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000067 tierA-000068 tierA-000069
;;   subsumed by p202969 (MnFuture_PatientOfAppleHarvest_Time(MonthSeptember); not a proposal
(And (Future $e0) (Time $e0 (Month september)))

;; p204053  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p203433 (MnAgent_ThemeOfGroupOfSample); not a proposal
(And (GroupOf $x0 sample) (Theme $e0 $x0))

;; p204054  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p203490 (MnHolderOfPermit_Theme); not a proposal
(And (Holder $e0 $x0) (Member $x0 permit))

;; p204055  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000085 tierA-000086 tierA-000087
;;   subsumed by p202965 (MnHolderOfRecipe_ThemeOfCardinalityNum); not a proposal
(And (Holder $e0 $x0) (Member $x0 recipe))

;; p204059  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000133 tierA-000135 tierA-000136
;;   subsumed by p202921 (MnAgent_LocationOfPoint_Discover); not a proposal
(And (Location $e0 $x0) (Member $e0 discover))

;; p204060  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p203497 (MnLocationOfLedger_Error); not a proposal
(And (Location $e0 $x0) (Member $e0 error))

;; p204061  support 4 (occ 5)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p202922 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(And (Location $e0 $x0) (Member $x0 survey))

;; p204062  support 4 (occ 6)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000047 tierB-000502 tierB-001041
;;   subsumed by p203499 (MnLocationOfTable_Past); not a proposal
(And (Location $e0 $x0) (Member $x0 table))

;; p204064  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Past $e0))

;; p204065  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(And (Member $e0 acquire) (Theme $e0 $x0))

;; p204067  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p202926 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $e0 block) (Theme $e0 $x0))

;; p204069  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p203841 (MnAgent_Cause_ThemeEv); not a proposal
(And (Member $e0 cause) (Theme $e0 $e1))

;; p204072  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p202927 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 decision) (Patient $e1 $e0))

;; p204073  support 4 (occ 4)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p202928 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 decision) (Theme $e1 $e0))

;; p204076  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p203843 (MnAgent_Jump_Past); not a proposal
(And (Member $e0 jump) (Past $e0))

;; p204078  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000186 tierA-000191 tierA-000197
;;   subsumed by p202927 (MnAgent_Make_PatientEvOfDecision); not a proposal
(And (Member $e0 make) (Patient $e0 $e1))

;; p204080  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Past $e0))

;; p204081  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000002 tierA-000009 tierA-000016
;;   subsumed by p203792 (MnAgent_Purchase_Past_Theme); not a proposal
(And (Member $e0 purchase) (Theme $e0 $x0))

;; p204082  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000187 tierA-000192 tierA-000198
;;   subsumed by p202928 (MnAgent_Reach_ThemeEvOfDecision); not a proposal
(And (Member $e0 reach) (Theme $e0 $e1))

;; p204084  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000262 tierA-000272 tierA-000277
;;   subsumed by p203793 (MnAgent_Receive_Source_Theme); not a proposal
(And (Member $e0 receive) (Source $e0 $x0))

;; p204086  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000004 tierA-000011 tierA-000018
;;   subsumed by p203796 (MnSell_Past_Recipient_Theme); not a proposal
(And (Member $e0 sell) (Recipient $e0 $x0))

;; p204088  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000782 tierB-001008 tierB-001268
;;   subsumed by p203852 (MnAgent_Swim_Ongoing); not a proposal
(And (Member $e0 swim) (Ongoing $e0))

;; p204089  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203795 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Member $e0 teach) (Theme $e0 glazing))

;; p204094  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000154 tierA-000155
;;   subsumed by p202918 (MnAgent_PatientOfAfternoonSessionOfInheritanceSession); not a proposal
(And (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p204096  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   subsumed by p203507 (MnDeparture_PossessionOfFerry); not a proposal
(And (Member $x0 departure) (Possession $x0 $x1))

;; p204097  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p202960 (MnBeforeEvOfPatientOfDressRehearsalOfInheritanceRehearsal); not a proposal
(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p204098  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   subsumed by p203461 (MnAgent_ThemeOfDrill); not a proposal
(And (Member $x0 drill) (Theme $e0 $x0))

;; p204100  support 4 (occ 4)  size 2  root $x1 (entity)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   subsumed by p203507 (MnDeparture_PossessionOfFerry); not a proposal
(And (Member $x0 ferry) (Possession $x1 $x0))

;; p204101  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202941 (MnAgentOfIntern_ThemeOfFile); not a proposal
(And (Member $x0 file) (Theme $e0 $x0))

;; p204103  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202943 (MnAgentOfMechanic_PatientOfGearbox); not a proposal
(And (Member $x0 gearbox) (Patient $e0 $x0))

;; p204104  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000302 tierA-000303
;;   subsumed by p203464 (MnAgent_ThemeOfGenerator); not a proposal
(And (Member $x0 generator) (Theme $e0 $x0))

;; p204105  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Member $x0 hearing) (Patient $e0 $x0))

;; p204109  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000390 tierA-000391 tierA-000392
;;   subsumed by p202926 (MnAgent_Block_ThemeOfLane); not a proposal
(And (Member $x0 lane) (Theme $e0 $x0))

;; p204110  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000272 tierA-000273
;;   subsumed by p203466 (MnAgent_ThemeOfManifest); not a proposal
(And (Member $x0 manifest) (Theme $e0 $x0))

;; p204111  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000158 tierA-000159 tierA-000160
;;   subsumed by p202937 (MnAgentOfEditor_ThemeOfManuscript); not a proposal
(And (Member $x0 manuscript) (Theme $e0 $x0))

;; p204112  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000139 tierA-000140
;;   subsumed by p202942 (MnAgentOfIntern_ThemeOfMissing); not a proposal
(And (Member $x0 missing) (Theme $e0 $x0))

;; p204113  support 4 (occ 4)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000185 tierA-000186 tierA-000187
;;   subsumed by p203878 (MnThemeOfNew-Roof); not a proposal
(And (Member $x0 new) (Member $x0 roof))

;; p204115  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000168 tierA-000169 tierA-000170
;;   subsumed by p202946 (MnAgentOfPanel_ThemeOfProposal); not a proposal
(And (Member $x0 proposal) (Theme $e0 $x0))

;; p204116  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p203471 (MnAgent_ThemeOfScan); not a proposal
(And (Member $x0 scan) (Theme $e0 $x0))

;; p204117  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000099 tierA-000100 tierA-000101
;;   subsumed by p202948 (MnAgentOfRescueTeam_ThemeOfSearch); not a proposal
(And (Member $x0 search) (Theme $e0 $x0))

;; p204118  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000029 tierA-000030 tierA-000031
;;   subsumed by p202944 (MnAgentOfMechanic_PatientOfSeized); not a proposal
(And (Member $x0 seized) (Patient $e0 $x0))

;; p204119  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000149 tierA-000150
;;   subsumed by p202920 (MnAgent_PatientOfSummerFairOfInheritanceFair); not a proposal
(And (Member $x0 summer_fair) (Patient $e0 $x0))

;; p204120  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000105 tierA-000106
;;   subsumed by p202939 (MnAgentOfFirm_ThemeOfTender); not a proposal
(And (Member $x0 tender) (Theme $e0 $x0))

;; p204122  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000114 tierA-000115 tierA-000116
;;   subsumed by p202932 (MnAgentOfBoard_ThemeOfVote); not a proposal
(And (Member $x0 vote) (Theme $e0 $x0))

;; p204123  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000134 tierA-000135
;;   subsumed by p202925 (MnAgent_Location_ThemeOfWreck); not a proposal
(And (Member $x0 wreck) (Theme $e0 $x0))

;; p204124  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000409 tierB-001070 tierB-001262
;;   subsumed by p203515 (MnPast_ThemeOfOf); not a proposal
(And (Of $x0 $x1) (Theme $e0 $x0))

;; p204128  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p203479 (MnAgent_ThemeOfOrdinalNumScan); not a proposal
(And (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p204130  support 4 (occ 5)  size 2  root $e1 (event)  depth 1
;;   e.g. tierB-000030 tierB-000087 tierB-001515
;;   subsumed by p203516 (MnPast_ThemeEvOfPast); not a proposal
(And (Past $e0) (Theme $e1 $e0))

;; p204132  support 4 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000196 tierB-000320 tierB-000779
;;   subsumed by p203517 (MnPast_PatientOfSubsetOf); not a proposal
(And (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p204133  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 (Weekday monday)))

;; p204134  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Patient $e0 $x0) (Time $e0 morning))

;; p204136  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p203795 (MnAgent_Teach_Recipient_ThemeGlazing); not a proposal
(And (Recipient $e0 $x0) (Theme $e0 glazing))

;; p204138  support 4 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(And (Time $e0 (Weekday monday)) (Time $e0 morning))

;; p204240  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001134
;;   subsumed by p204036 (MnBeforeEvOfPast_p204036); not a proposal
(Before $e0 $e1)

;; p204243  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000411 tierB-000844 tierB-001017
;;   subsumed by p204042 (MnDuring_Past); not a proposal
(During $e0 $x0)

;; p204253  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p203725 (MnGroupOfSoilSampleOfInheritanceSample); not a proposal
(GroupOf $x0 soil_sample)

;; p204259  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000003 tierA-000010 tierA-000017
;;   subsumed by p203791 (MnAgent_Acquire_Past_Theme); not a proposal
(Member $e0 acquire)

;; p204260  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000075 tierA-000076 tierA-000078
;;   subsumed by p204003 (MnAgent_Allow); not a proposal
(Member $e0 allow)

;; p204263  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000054 tierA-000059 tierA-000064
;;   subsumed by p204070 (MnCommence_Patient); not a proposal
(Member $e0 commence)

;; p204268  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p203497 (MnLocationOfLedger_Error); not a proposal
(Member $e0 error)

;; p204269  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-000706
;;   subsumed by p204075 (MnFind_Past); not a proposal
(Member $e0 find)

;; p204270  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000045 tierB-000121 tierB-000801
;;   subsumed by p204006 (MnAgent_Fly); not a proposal
(Member $e0 fly)

;; p204276  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000871 tierB-000889 tierB-001530
;;   subsumed by p203843 (MnAgent_Jump_Past); not a proposal
(Member $e0 jump)

;; p204278  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000649 tierB-001008 tierB-001762
;;   subsumed by p204079 (MnPass_Past); not a proposal
(Member $e0 pass)

;; p204289  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000319 tierA-000320 tierA-000321
;;   subsumed by p202922 (MnAgentOfBiologist_LocationOfSurvey); not a proposal
(Member $x0 biologist)

;; p204300  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p203446 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(Member $x0 delegation)

;; p204302  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000286 tierA-000287 tierA-000288
;;   subsumed by p203461 (MnAgent_ThemeOfDrill); not a proposal
(Member $x0 drill)

;; p204304  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000257 tierA-000258 tierA-000259
;;   subsumed by p204099 (MnElm_Last); not a proposal
(Member $x0 elm)

;; p204305  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000119 tierA-000120 tierA-000121
;;   subsumed by p203507 (MnDeparture_PossessionOfFerry); not a proposal
(Member $x0 ferry)

;; p204313  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(Member $x0 hearing)

;; p204316  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000296 tierA-000297 tierA-000298
;;   subsumed by p204108 (MnThemeOfLadder); not a proposal
(Member $x0 ladder)

;; p204324  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000363 tierA-000364 tierA-000365
;;   subsumed by p203728 (MnNightCrewOfInheritanceCrew); not a proposal
(Member $x0 night_crew)

;; p204341  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000347 tierA-000348 tierA-000349
;;   subsumed by p203729 (MnSpoilMoundOfInheritanceMound); not a proposal
(Member $x0 spoil_mound)

;; p204350  support 4 (occ 4)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000022 tierA-000026 tierA-000027
;;   subsumed by p204107 (MnKiln_OrdinalNumBuy); not a proposal
(Ordinal $x0 <num> buy)

;; p204353  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p203494 (MnThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(Theme $e0 monthly_servicing)

;; p204354  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000057 tierA-000058 tierA-000059
;;   subsumed by p202979 (MnPatientOfHearing_Time(WeekdayMonday_TimeMorning); not a proposal
(Time $e0 (Weekday monday))

;; p204355  support 4 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000243
;;   subsumed by p203446 (MnAgentOfDelegation_Time(WeekdayThursday); not a proposal
(Time $e0 (Weekday thursday))

;; p204359  support 4 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000215 tierB-000799 tierB-001629
;;   subsumed by p204131 (MnPast_TimeAtLeast(YearNum); not a proposal
(TimeAtLeast $e0 (Year <num>))

;; p205525  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p204389 (MnAgentOfCardinalityNum-GroupOfClimber_Abandon); not a proposal
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon))

;; p205526  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p204392 (MnAgentOfBiologist_CoAgent_Location); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x0 biologist))

;; p205527  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p204393 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $x1 ranger))

;; p205532  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p204398 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation))

;; p205536  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p204389 (MnAgentOfCardinalityNum-GroupOfClimber_Abandon); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon))

;; p205537  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p204400 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Inheritance soil_sample sample))

;; p205538  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p204400 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample) (Instrument $e0 post))

;; p205539  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204401 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1))

;; p205540  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p205542  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204414 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 curator))

;; p205543  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204416 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 welder))

;; p205544  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204416 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 frame))

;; p205545  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204414 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 hall))

;; p205546  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204419 (MnAgentOfFirm_Abandon_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm))

;; p205548  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204424 (MnAgentOfClerk_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk))

;; p205549  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204425 (MnAgentOfPilot_Answer_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot))

;; p205550  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204428 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 freight))

;; p205551  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p204430 (MnAgentOfDepot_Buy_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))

;; p205552  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204410 (MnAgentOfPotteryStudioOfInheritanceStudio_Buy); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))

;; p205553  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204387 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))

;; p205555  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   subsumed by p204441 (MnAgentOfCouncil_Cancel_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))

;; p205556  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   subsumed by p204442 (MnAgentOfTutor_Cancel_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))

;; p205557  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204447 (MnAgentOfBoard_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board))

;; p205558  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204448 (MnAgentOfJudge_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))

;; p205559  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000229 tierB-001163
;;   subsumed by p204452 (MnAgentOfFire_Destroy_Patient); not a proposal
(And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 fire))

;; p205560  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   subsumed by p204411 (MnAgentOfDiver_Location_Discover); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver))

;; p205561  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204454 (MnAgentOfIntern_Discover_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern))

;; p205562  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204458 (MnAgentOfSchool_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))

;; p205563  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204460 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))

;; p205564  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204466 (MnAgentOfMuseum_Lend_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum))

;; p205565  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))

;; p205566  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   subsumed by p204475 (MnAgentOfClub_Postpone_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club))

;; p205567  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204479 (MnAgentOfElder_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder))

;; p205568  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204481 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter))

;; p205569  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   subsumed by p204412 (MnAgentOfBiologist_Location_Work); not a proposal
(And (Agent $e0 $x0) (Member $e0 work) (Member $x0 biologist))

;; p205570  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p204486 (MnBegin_ThemeEvOfAgent-Ongoing); not a proposal
(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))

;; p205571  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204445 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Agent $e0 $x0) (Member $e1 destroy) (Theme $e0 $e1))

;; p205573  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p204491 (MnAgentOfAirline_ThemeOfEveningFlight); not a proposal
(And (Agent $e0 $x0) (Member $x0 airline) (Theme $e0 $x1))

;; p205574  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204492 (MnAgentOfBank_ThemeOfLoanApplication); not a proposal
(And (Agent $e0 $x0) (Member $x0 bank) (Theme $e0 $x1))

;; p205577  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204415 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Member $x0 curator) (Theme $e0 photography))

;; p205579  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204402 (MnAgentOfElder_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1))

;; p205580  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204480 (MnAgentOfElder_Teach_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder) (Theme $e0 $x1))

;; p205581  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204499 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x0 ferry) (Theme $e0 $x1))

;; p205582  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000229 tierB-001163
;;   subsumed by p204452 (MnAgentOfFire_Destroy_Patient); not a proposal
(And (Agent $e0 $x0) (Member $x0 fire) (Patient $e0 $x1))

;; p205583  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204428 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $x0 freight) (Time $e0 (Hour <num>)))

;; p205584  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204448 (MnAgentOfJudge_Decide_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 judge) (Theme $e0 $x1))

;; p205585  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Member $x0 licence) (Theme $e0 night_delivery))

;; p205587  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204466 (MnAgentOfMuseum_Lend_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1))

;; p205588  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))

;; p205589  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204469 (MnAgentOfNeighbour_Lend_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1))

;; p205591  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204481 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1))

;; p205592  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204482 (MnAgentOfPotter_Teach_ThemeGlazing); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing))

;; p205593  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204458 (MnAgentOfSchool_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1))

;; p205596  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204460 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1))

;; p205597  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204461 (MnAgentOfTrainer_Give_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer) (Theme $e0 $x1))

;; p205599  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden) (Theme $e0 visitor))

;; p205600  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden) (Time $e0 (Weekday sunday)))

;; p205601  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204462 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))

;; p205602  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204483 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1))

;; p205604  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204449 (MnAgent_Decide_ThemeOfBudget); not a proposal
(And (Agent $e0 $x0) (Member $x1 budget) (Theme $e0 $x1))

;; p205605  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204450 (MnAgent_Decide_ThemeOfCase); not a proposal
(And (Agent $e0 $x0) (Member $x1 case) (Theme $e0 $x1))

;; p205606  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204478 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Agent $e0 $x0) (Member $x1 chart) (Patient $e0 $x1))

;; p205608  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204499 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x1 departure) (Theme $e0 $x1))

;; p205610  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p204407 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Agent $e0 $x0) (Member $x1 evening_flight) (Theme $e0 $x1))

;; p205611  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204470 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1))

;; p205612  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204408 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Agent $e0 $x0) (Member $x1 loan_application) (Theme $e0 $x1))

;; p205615  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204426 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1))

;; p205616  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204464 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1))

;; p205617  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204427 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Agent $e0 $x0) (Member $x1 tower) (Theme $e0 $x1))

;; p205619  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204465 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1))

;; p205620  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204510 (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy); not a proposal
(And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))

;; p205624  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204472 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Agent $e0 $x0) (Patient $e0 $e1) (Theme $e1 $x1))

;; p205625  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204451 (MnAgent_Decide_ThemeOfPossessionNextYear); not a proposal
(And (Agent $e0 $x0) (Possession $x1 next_year) (Theme $e0 $x1))

;; p205626  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204477 (MnAgent_Reach_ThemeEvOfTheme); not a proposal
(And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $x1))

;; p205627  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0) (Member $x0 ledger))

;; p205630  support 3 (occ 3)  size 3  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204531 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0) (Member $x0 lunch))

;; p205631  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204388 (MnAgent_BeneficiaryOfHall_Buy); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))

;; p205632  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p204393 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x0 ranger))

;; p205633  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p204394 (MnAgent_CoAgent_LocationOfSurvey); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $x1 survey))

;; p205634  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204538 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 gate))

;; p205635  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204540 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 error) (Stimulus $e0 $e1))

;; p205637  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p204544 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))

;; p205642  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204541 (MnExperiencerOfAuditor_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 auditor) (Stimulus $e0 $e1))

;; p205644  support 3 (occ 4)  size 3  root $e1 (event)  depth 2
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p204544 (MnGet_Ongoing_ResultEvOfExperiencer); not a proposal
(And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))

;; p205645  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204532 (MnBeforeEvOfFuture-PatientOfDressRehearsal); not a proposal
(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))

;; p205646  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204401 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0))

;; p205647  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204403 (MnAgent_RecipientOfGroupOfChild_Theme); not a proposal
(And (GroupOf $x0 child) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205648  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000001 tierA-000005 tierA-000007
;;   subsumed by p204404 (MnAgent_Buy_ThemeOfGroupOfForklift); not a proposal
(And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))

;; p205650  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000380 tierA-000381 tierA-000382
;;   subsumed by p204405 (MnAgent_Examine_ThemeOfGroupOfSample); not a proposal
(And (GroupOf $x0 sample) (Member $e0 examine) (Theme $e0 $x0))

;; p205651  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204554 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))

;; p205652  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204554 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))

;; p205653  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000091 tierA-000092
;;   subsumed by p204557 (MnHolderOfPermit_Require_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit))

;; p205654  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000086 tierA-000087 tierA-000088
;;   subsumed by p204558 (MnHolderOfRecipe_Require_Theme); not a proposal
(And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe))

;; p205655  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204555 (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly); not a proposal
(And (Holder $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing))

;; p205656  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p204559 (MnHolderOfPermit_ThemeOfCountersignature); not a proposal
(And (Holder $e0 $x0) (Member $x1 countersignature) (Theme $e0 $x1))

;; p205657  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p204407 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Theme $e0 $x0))

;; p205659  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204408 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Inheritance loan_application application) (Member $x0 loan_application) (Theme $e0 $x0))

;; p205660  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204561 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing monthly) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p205661  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204561 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))

;; p205665  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204538 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $e0 wait) (Member $x0 gate))

;; p205667  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 ledger))

;; p205668  support 3 (occ 4)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000320 tierA-000322
;;   subsumed by p204413 (MnAgent_LocationOfSurvey_Work); not a proposal
(And (Location $e0 $x0) (Member $e0 work) (Member $x0 survey))

;; p205669  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204539 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Location $e0 $x0) (Member $e1 discover) (Stimulus $e1 $e0))

;; p205670  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204417 (MnAgent_LocationOfHall_ThemePhotography); not a proposal
(And (Location $e0 $x0) (Member $x0 hall) (Theme $e0 photography))

;; p205671  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000109 tierA-000111 tierA-000112
;;   subsumed by p204420 (MnAgent_Abandon_ThemeOfNorthRoute); not a proposal
(And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))

;; p205672  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204422 (MnAgent_Abandon_ThemeOfTender); not a proposal
(And (Member $e0 abandon) (Member $x0 tender) (Theme $e0 $x0))

;; p205673  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000104 tierA-000106 tierA-000108
;;   subsumed by p204569 (MnAbandon_ThemeOfPossessionOfFirm); not a proposal
(And (Member $e0 abandon) (Possession $x0 $x1) (Theme $e0 $x0))

;; p205674  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204426 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0))

;; p205675  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204427 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Member $e0 answer) (Member $x0 tower) (Theme $e0 $x0))

;; p205676  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204438 (MnAgent_Buy_ThemeOfKiln); not a proposal
(And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))

;; p205678  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000153 tierA-000155 tierA-000156
;;   subsumed by p204443 (MnAgent_Cancel_PatientOfAfternoonSession); not a proposal
(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))

;; p205679  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000148 tierA-000150 tierA-000152
;;   subsumed by p204444 (MnAgent_Cancel_PatientOfSummerFair); not a proposal
(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))

;; p205680  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204445 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Member $e0 cause) (Member $e1 destroy) (Theme $e0 $e1))

;; p205681  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204446 (MnAgent_Cause_ThemeEvOfPatient); not a proposal
(And (Member $e0 cause) (Patient $e1 $x0) (Theme $e0 $e1))

;; p205682  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204449 (MnAgent_Decide_ThemeOfBudget); not a proposal
(And (Member $e0 decide) (Member $x0 budget) (Theme $e0 $x0))

;; p205683  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000190 tierA-000193 tierA-000194
;;   subsumed by p204450 (MnAgent_Decide_ThemeOfCase); not a proposal
(And (Member $e0 decide) (Member $x0 case) (Theme $e0 $x0))

;; p205684  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000201 tierA-000204 tierA-000206
;;   subsumed by p204451 (MnAgent_Decide_ThemeOfPossessionNextYear); not a proposal
(And (Member $e0 decide) (Possession $x0 next_year) (Theme $e0 $x0))

;; p205688  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204455 (MnAgent_Discover_ThemeOfFile); not a proposal
(And (Member $e0 discover) (Member $x0 file) (Theme $e0 $x0))

;; p205689  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000138 tierA-000140 tierA-000141
;;   subsumed by p204456 (MnAgent_Discover_ThemeOfMissing); not a proposal
(And (Member $e0 discover) (Member $x0 missing) (Theme $e0 $x0))

;; p205690  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000133 tierA-000135 tierA-000137
;;   subsumed by p204457 (MnAgent_Discover_ThemeOfWreck); not a proposal
(And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0))

;; p205691  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204462 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))

;; p205692  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   subsumed by p204463 (MnAgent_Give_ThemeOfManifest); not a proposal
(And (Member $e0 give) (Member $x0 manifest) (Theme $e0 $x0))

;; p205693  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204464 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0))

;; p205694  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204465 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0))

;; p205695  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204470 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0))

;; p205696  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p204471 (MnAgent_Lend_ThemeOfGenerator); not a proposal
(And (Member $e0 lend) (Member $x0 generator) (Theme $e0 $x0))

;; p205698  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204472 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x0))

;; p205699  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p204473 (MnAgent_Order_ThemeOfScan); not a proposal
(And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0))

;; p205700  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000385 tierA-000386 tierA-000387
;;   subsumed by p204474 (MnAgent_Order_ThemeOfOrdinalNumScan); not a proposal
(And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0))

;; p205701  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000123 tierA-000125 tierA-000126
;;   subsumed by p204476 (MnAgent_Postpone_ThemeOfTournament); not a proposal
(And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0))

;; p205702  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204477 (MnAgent_Reach_ThemeEvOfTheme); not a proposal
(And (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x0))

;; p205703  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204478 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Member $e0 sign) (Member $x0 chart) (Patient $e0 $x0))

;; p205704  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204588 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))

;; p205705  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204483 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0))

;; p205706  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p204484 (MnAgent_Teach_ThemeOfDrill); not a proposal
(And (Member $e0 teach) (Member $x0 drill) (Theme $e0 $x0))

;; p205707  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204485 (MnAgent_Teach_ThemeOfSong); not a proposal
(And (Member $e0 teach) (Member $x0 song) (Theme $e0 $x0))

;; p205708  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204516 (MnAgent_Recipient_ThemeOfAnswer); not a proposal
(And (Member $x0 answer) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205709  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204517 (MnAgent_RecipientOfApprentice_ThemeGlazing); not a proposal
(And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))

;; p205710  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000286 tierA-000288 tierA-000289
;;   subsumed by p204520 (MnAgent_Recipient_ThemeOfDrill); not a proposal
(And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205711  support 3 (occ 3)  size 3  root $e0 (event)  depth 3
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204592 (MnThemeOfDeparture-PossessionOfFerry); not a proposal
(And (Member $x0 ferry) (Possession $x1 $x0) (Theme $e0 $x1))

;; p205713  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204521 (MnAgent_RecipientOfGallery_Theme); not a proposal
(And (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205714  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000301 tierA-000303 tierA-000304
;;   subsumed by p204522 (MnAgent_Recipient_ThemeOfGenerator); not a proposal
(And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205715  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000271 tierA-000273 tierA-000274
;;   subsumed by p204524 (MnAgent_Recipient_ThemeOfManifest); not a proposal
(And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205717  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204526 (MnAgent_RecipientOfRecruit_Theme); not a proposal
(And (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205718  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204527 (MnAgent_Recipient_ThemeOfSong); not a proposal
(And (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))

;; p205720  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204528 (MnAgent_RecipientOfWinner_Theme); not a proposal
(And (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))

;; p205722  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204529 (MnAgent_Past_ThemeOfOrdinalNumBuy); not a proposal
(And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))

;; p206103  support 3 (occ 3)  size 2  root $x0 (entity)  depth 2
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   subsumed by p205658 (MnCracked_FeedPipeOfInheritancePipe); not a proposal
(And (Inheritance feed_pipe pipe) (Member $x0 feed_pipe))

;; p206105  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Inheritance night_delivery delivery) (Theme $e0 night_delivery))

;; p206158  support 3 (occ 3)  size 1  root living_room (constant)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   subsumed by p206104 (MnLivingRoomOfInheritanceRoom); not a proposal
(Inheritance living_room room)

;; p206279  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204387 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))

;; p206281  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p206192 (MnAgent_CoAgent_Location_Work); not a proposal
(And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 work))

;; p206283  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p204398 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Agent $e0 $x0) (Future $e0) (Time $e0 (Weekday thursday)))

;; p206284  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206193 (MnAgent_Goal_Come_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))

;; p206288  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204415 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Location $e0 $x1) (Theme $e0 photography))

;; p206289  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204428 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p206290  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p206194 (MnAgent_Begin_Past_ThemeEv); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))

;; p206291  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p204429 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p206292  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206195 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))

;; p206293  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206195 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))

;; p206295  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p206196 (MnAgent_Decide_Might_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 decide) (Might $e0))

;; p206299  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))

;; p206313  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204504 (MnAgentOfNeighbour_RecipientRavi_Theme); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))

;; p206314  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p206315  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work))

;; p206316  support 3 (occ 3)  size 3  root $x0 (entity)  depth 2
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204531 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0) (Patient $e0 $x1))

;; p206317  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204533 (MnBeneficiaryOfHall_Buy_Past); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))

;; p206318  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204534 (MnBeneficiaryOfHall_Buy_Theme); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))

;; p206319  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p206192 (MnAgent_CoAgent_Location_Work); not a proposal
(And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 work))

;; p206320  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204538 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait))

;; p206321  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204539 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 discover) (Stimulus $e0 $e1))

;; p206325  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206193 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))

;; p206326  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204540 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Location $e0 $x0) (Member $e0 error) (Stimulus $e1 $e0))

;; p206336  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p206196 (MnAgent_Decide_Might_Theme); not a proposal
(And (Member $e0 decide) (Might $e0) (Theme $e0 $x0))

;; p206337  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204488 (MnAgent_PatientEvOfDecision-Theme); not a proposal
(And (Member $e0 decision) (Patient $e1 $e0) (Theme $e0 $x0))

;; p206338  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000187 tierA-000192 tierA-000203
;;   subsumed by p204489 (MnAgent_ThemeEvOfDecision-Theme); not a proposal
(And (Member $e0 decision) (Theme $e0 $x0) (Theme $e1 $e0))

;; p206339  support 3 (occ 3)  size 3  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204490 (MnAgent_ThemeEvOfDestroy-Patient); not a proposal
(And (Member $e0 destroy) (Patient $e0 $x0) (Theme $e1 $e0))

;; p206343  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p206201 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))

;; p206346  support 3 (occ 3)  size 3  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p206197 (MnAgent_Lend_RecipientRavi_Theme); not a proposal
(And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0))

;; p206353  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204588 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))

;; p206358  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204592 (MnThemeOfDeparture-PossessionOfFerry); not a proposal
(And (Member $x0 departure) (Possession $x0 $x1) (Theme $e0 $x0))

;; p206359  support 3 (occ 3)  size 3  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204523 (MnAgent_ThemeOfKiln-OrdinalNumBuy); not a proposal
(And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p206362  support 3 (occ 4)  size 3  root $e0 (event)  depth 1
;;   e.g. tierB-000370 tierB-000748 tierB-001658
;;   subsumed by p206201 (MnGet_Ongoing_Patient_ResultEv); not a proposal
(And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p206581  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p206286 (MnAgent_GoalHome_Past); not a proposal
(And (Agent $e0 $x0) (Goal $e0 home))

;; p206583  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p204400 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (GroupOf $x0 soil_sample))

;; p206585  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p204400 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(And (Agent $e0 $x0) (Instrument $e0 post))

;; p206587  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000485 tierB-001052 tierB-001138
;;   subsumed by p204429 (MnAgent_Begin_ThemeEvOfOngoing); not a proposal
(And (Agent $e0 $x0) (Member $e0 begin))

;; p206589  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000852 tierB-001342 tierB-001990
;;   subsumed by p206195 (MnAgent_Capture_Past_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 capture))

;; p206593  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p206296 (MnAgent_Draw_Past); not a proposal
(And (Agent $e0 $x0) (Member $e0 draw))

;; p206594  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   subsumed by p206297 (MnAgent_GiveUp_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 give_up))

;; p206596  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   subsumed by p206298 (MnAgent_Learn_Source); not a proposal
(And (Agent $e0 $x0) (Member $e0 learn))

;; p206598  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   subsumed by p206302 (MnAgent_PutOff_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 put_off))

;; p206599  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000084 tierB-000607 tierB-001436
;;   subsumed by p206303 (MnAgent_Require_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 require))

;; p206604  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   subsumed by p206306 (MnAgent_TurnDown_Theme); not a proposal
(And (Agent $e0 $x0) (Member $e0 turn_down))

;; p206605  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204492 (MnAgentOfBank_ThemeOfLoanApplication); not a proposal
(And (Agent $e0 $x0) (Member $x0 bank))

;; p206607  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000391 tierA-000400 tierB-000713
;;   subsumed by p205575 (MnAgentOfCar_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 car))

;; p206610  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204414 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Agent $e0 $x0) (Member $x0 curator))

;; p206613  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204402 (MnAgentOfElder_RecipientOfGroupOfChild); not a proposal
(And (Agent $e0 $x0) (Member $x0 elder))

;; p206614  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204499 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Agent $e0 $x0) (Member $x0 ferry))

;; p206615  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204428 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Agent $e0 $x0) (Member $x0 freight))

;; p206616  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Member $x0 licence))

;; p206617  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Member $x0 neighbour))

;; p206619  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000045 tierB-000132 tierB-000298
;;   subsumed by p205590 (MnAgentOfPlane_Past); not a proposal
(And (Agent $e0 $x0) (Member $x0 plane))

;; p206620  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204481 (MnAgentOfPotter_Teach_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 potter))

;; p206622  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204460 (MnAgentOfTrainer_Give_Recipient); not a proposal
(And (Agent $e0 $x0) (Member $x0 trainer))

;; p206623  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000217 tierA-000218 tierA-000219
;;   subsumed by p205598 (MnAgentOfVet_Theme); not a proposal
(And (Agent $e0 $x0) (Member $x0 vet))

;; p206624  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Member $x0 warden))

;; p206625  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204416 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Agent $e0 $x0) (Member $x0 welder))

;; p206627  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Agent $e0 $x0) (Recipient $e0 ravi))

;; p206628  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000316 tierB-001720 tierB-001911
;;   subsumed by p205622 (MnPast_StimulusEvOfAgent); not a proposal
(And (Agent $e0 $x0) (Stimulus $e1 $e0))

;; p206630  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(And (Agent $e0 $x0) (Theme $e0 night_delivery))

;; p206631  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204415 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Agent $e0 $x0) (Theme $e0 photography))

;; p206632  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Theme $e0 visitor))

;; p206633  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Agent $e0 $x0) (Time $e0 (Weekday sunday)))

;; p206634  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   subsumed by p206310 (MnAgent_Past_ToEv); not a proposal
(And (Agent $e0 $x0) (To $e0 $e1))

;; p206635  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000258 tierB-001035 tierB-001867
;;   subsumed by p205623 (MnPast_ToEvOfAgent); not a proposal
(And (Agent $e0 $x0) (To $e1 $e0))

;; p206639  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Location $e0 $x0))

;; p206640  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(And (Agent $e0 dara) (Member $e0 work))

;; p206650  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000412 tierB-000688 tierB-001302
;;   subsumed by p205629 (MnBeforeEvOfPast_Past); not a proposal
(And (Before $e0 $e1) (Past $e0))

;; p206651  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000062 tierA-000063 tierA-000064
;;   subsumed by p204531 (MnBeforeEvOfFuture-Patient_Lunch); not a proposal
(And (Before $x0 $e0) (Future $e0))

;; p206653  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000008 tierA-000012 tierA-000013
;;   subsumed by p204387 (MnAgentOfSchool_Beneficiary_Buy); not a proposal
(And (Beneficiary $e0 $x0) (Member $e0 buy))

;; p206657  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000315 tierA-000319 tierA-000322
;;   subsumed by p206192 (MnAgent_CoAgent_Location_Work); not a proposal
(And (CoAgent $e0 $x0) (Member $e0 work))

;; p206658  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000319 tierA-000321 tierA-000322
;;   subsumed by p204393 (MnAgent_CoAgentOfRanger_Location); not a proposal
(And (CoAgent $e0 $x0) (Member $x0 ranger))

;; p206665  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204539 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $e0 discover))

;; p206668  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204541 (MnExperiencerOfAuditor_StimulusEvOfLocation); not a proposal
(And (Experiencer $e0 $x0) (Member $x0 auditor))

;; p206677  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000063 tierA-000068 tierB-001816
;;   subsumed by p206323 (MnFuture_Start_Patient); not a proposal
(And (Future $e0) (Member $e0 start))

;; p206678  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000241 tierA-000242 tierA-000244
;;   subsumed by p204398 (MnAgentOfDelegation_Future_Time(WeekdayThursday); not a proposal
(And (Future $e0) (Time $e0 (Weekday thursday)))

;; p206680  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001563 tierB-001579 tierB-001902
;;   subsumed by p206324 (MnGoal_MannerQuickly_Past); not a proposal
(And (Goal $e0 $x0) (Manner $e0 quickly))

;; p206681  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000387 tierB-001534 tierB-001963
;;   subsumed by p206193 (MnAgent_Goal_Come_Past); not a proposal
(And (Goal $e0 $x0) (Member $e0 come))

;; p206684  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p206286 (MnAgent_GoalHome_Past); not a proposal
(And (Goal $e0 home) (Past $e0))

;; p206685  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000291 tierA-000293 tierA-000295
;;   subsumed by p204401 (MnAgent_Teach_RecipientOfGroupOfChild); not a proposal
(And (GroupOf $x0 child) (Recipient $e0 $x0))

;; p206689  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204555 (MnHolderOfLathe_ThemeMonthlyServicingOfInheritanceMonthly); not a proposal
(And (Holder $e0 $x0) (Member $x0 lathe))

;; p206690  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000095 tierA-000096
;;   subsumed by p204554 (MnHolder_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Holder $e0 $x0) (Theme $e0 monthly_servicing))

;; p206697  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204538 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $e0 wait))

;; p206698  support 3 (occ 4)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204416 (MnAgentOfWelder_LocationOfFrame); not a proposal
(And (Location $e0 $x0) (Member $x0 frame))

;; p206699  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000395 tierA-000396 tierA-000397
;;   subsumed by p204538 (MnExperiencer_LocationOfGate_Wait); not a proposal
(And (Location $e0 $x0) (Member $x0 gate))

;; p206700  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204414 (MnAgentOfCurator_LocationOfHall); not a proposal
(And (Location $e0 $x0) (Member $x0 hall))

;; p206701  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000048 tierB-000371 tierB-000524
;;   subsumed by p205664 (MnLocationOfHouse_Live); not a proposal
(And (Location $e0 $x0) (Member $x0 house))

;; p206704  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204415 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(And (Location $e0 $x0) (Theme $e0 photography))

;; p206709  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p206331 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Measure $x0 age <num> year) (Member $x0 founder))

;; p206710  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p206331 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Measure $x0 age <num> year) (Patient $e0 $x0))

;; p206714  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000237 tierA-000238 tierA-000240
;;   subsumed by p204428 (MnAgentOfFreight_Arrive_Time(HourNum); not a proposal
(And (Member $e0 arrive) (Time $e0 (Hour <num>)))

;; p206719  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000055 tierA-000066 tierA-000070
;;   subsumed by p206332 (MnBegin_Might_Patient); not a proposal
(And (Member $e0 begin) (Might $e0))

;; p206720  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   subsumed by p206333 (MnBorrow_Source_Theme); not a proposal
(And (Member $e0 borrow) (Source $e0 $x0))

;; p206721  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   subsumed by p206333 (MnBorrow_Source_Theme); not a proposal
(And (Member $e0 borrow) (Theme $e0 $x0))

;; p206725  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000775 tierB-000805 tierB-001649
;;   subsumed by p206334 (MnCause_Past_Patient); not a proposal
(And (Member $e0 cause) (Patient $e0 $x0))

;; p206731  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p206335 (MnCreate_Past_Patient); not a proposal
(And (Member $e0 create) (Past $e0))

;; p206732  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p206335 (MnCreate_Past_Patient); not a proposal
(And (Member $e0 create) (Patient $e0 $x0))

;; p206733  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000189 tierA-000194 tierA-000206
;;   subsumed by p206196 (MnAgent_Decide_Might_Theme); not a proposal
(And (Member $e0 decide) (Might $e0))

;; p206734  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000223 tierA-000228 tierA-000233
;;   subsumed by p204445 (MnAgent_Cause_ThemeEvOfDestroy); not a proposal
(And (Member $e0 destroy) (Theme $e1 $e0))

;; p206735  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000128 tierA-000130 tierA-000132
;;   subsumed by p204539 (MnExperiencer_Discover_StimulusEvOfLocation); not a proposal
(And (Member $e0 discover) (Stimulus $e0 $e1))

;; p206736  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p206296 (MnAgent_Draw_Past); not a proposal
(And (Member $e0 draw) (Past $e0))

;; p206737  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p206340 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Past $e0))

;; p206738  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000338 tierB-000616 tierB-001551
;;   subsumed by p206340 (MnEat_Past_Patient); not a proposal
(And (Member $e0 eat) (Patient $e0 $x0))

;; p206739  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierA-000128 tierA-000129 tierA-000130
;;   subsumed by p204540 (MnExperiencer_StimulusEvOfLocation-Error); not a proposal
(And (Member $e0 error) (Stimulus $e1 $e0))

;; p206741  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000456 tierB-000779 tierB-001364
;;   subsumed by p206341 (MnFall_Past_Source); not a proposal
(And (Member $e0 fall) (Source $e0 $x0))

;; p206742  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000579 tierB-000585 tierB-001139
;;   subsumed by p206342 (MnFind_Past_Theme); not a proposal
(And (Member $e0 find) (Theme $e0 $x0))

;; p206744  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000100 tierA-000105 tierA-000110
;;   subsumed by p206297 (MnAgent_GiveUp_Theme); not a proposal
(And (Member $e0 give_up) (Theme $e0 $x0))

;; p206747  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p206344 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Past $e0))

;; p206748  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000680 tierB-000690 tierB-000965
;;   subsumed by p206344 (MnIncrease_Past_Patient); not a proposal
(And (Member $e0 increase) (Patient $e0 $x0))

;; p206749  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000282 tierA-000287 tierA-000292
;;   subsumed by p206298 (MnAgent_Learn_Source); not a proposal
(And (Member $e0 learn) (Source $e0 $x0))

;; p206751  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p206345 (MnLeave_Patient_ResultEv); not a proposal
(And (Member $e0 leave) (Patient $e0 $x0))

;; p206752  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000004 tierB-000425 tierB-000747
;;   subsumed by p205639 (MnLeave_ResultEvOfExperiencer); not a proposal
(And (Member $e0 leave) (Result $e0 $e1))

;; p206753  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(And (Member $e0 lend) (Recipient $e0 ravi))

;; p206755  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-001125 tierB-001433 tierB-001840
;;   subsumed by p206301 (MnAgent_Play_Ongoing); not a proposal
(And (Member $e0 play) (Ongoing $e0))

;; p206757  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p206349 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Past $e0))

;; p206758  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000876 tierB-001486 tierB-001932
;;   subsumed by p206349 (MnPresent_Past_Theme); not a proposal
(And (Member $e0 present) (Theme $e0 $x0))

;; p206759  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000115 tierA-000120 tierA-000124
;;   subsumed by p206302 (MnAgent_PutOff_Theme); not a proposal
(And (Member $e0 put_off) (Theme $e0 $x0))

;; p206761  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000094 tierA-000096 tierA-000098
;;   subsumed by p204561 (MnRequire_ThemeMonthlyServicingOfInheritanceMonthly-InheritanceServicing); not a proposal
(And (Member $e0 require) (Theme $e0 monthly_servicing))

;; p206766  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000676 tierB-001299 tierB-001604
;;   subsumed by p206351 (MnStand_Ongoing_Past); not a proposal
(And (Member $e0 stand) (Ongoing $e0))

;; p206767  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p206352 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Past $e0))

;; p206768  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p206352 (MnStick_Past_Patient); not a proposal
(And (Member $e0 stick) (Patient $e0 $x0))

;; p206769  support 3 (occ 4)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000030 tierB-001515 tierB-001873
;;   subsumed by p204588 (MnStop_Past_ThemeEvOfPast); not a proposal
(And (Member $e0 stop) (Theme $e0 $e1))

;; p206772  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   subsumed by p206306 (MnAgent_TurnDown_Theme); not a proposal
(And (Member $e0 turn_down) (Theme $e0 $x0))

;; p206774  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierB-000258 tierB-000520 tierB-001800
;;   subsumed by p206307 (MnAgent_Watch_Theme); not a proposal
(And (Member $e0 watch) (Theme $e0 $x0))

;; p206775  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000313 tierA-000322 tierA-000325
;;   subsumed by p206329 (MnLocation_Work_Might); not a proposal
(And (Member $e0 work) (Might $e0))

;; p206776  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000208 tierA-000213 tierA-000218
;;   subsumed by p204462 (MnAgent_Give_ThemeOfAnswer); not a proposal
(And (Member $x0 answer) (Theme $e0 $x0))

;; p206777  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000281 tierA-000283 tierA-000284
;;   subsumed by p204483 (MnAgent_Teach_RecipientOfApprentice); not a proposal
(And (Member $x0 apprentice) (Recipient $e0 $x0))

;; p206778  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000227 tierA-000228 tierA-000229
;;   subsumed by p205685 (MnDestroy_PatientOfArchive); not a proposal
(And (Member $x0 archive) (Patient $e0 $x0))

;; p206783  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000399 tierA-000400 tierA-000401
;;   subsumed by p205603 (MnAgent_ThemeOfBridge); not a proposal
(And (Member $x0 bridge) (Theme $e0 $x0))

;; p206784  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000375 tierA-000376 tierA-000377
;;   subsumed by p204478 (MnAgent_Sign_PatientOfChart); not a proposal
(And (Member $x0 chart) (Patient $e0 $x0))

;; p206785  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000089 tierA-000090 tierA-000091
;;   subsumed by p204559 (MnHolderOfPermit_ThemeOfCountersignature); not a proposal
(And (Member $x0 countersignature) (Theme $e0 $x0))

;; p206786  support 3 (occ 3)  size 2  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   subsumed by p205658 (MnCracked_FeedPipeOfInheritancePipe); not a proposal
(And (Member $x0 cracked) (Member $x0 feed_pipe))

;; p206787  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000119 tierA-000120 tierA-000122
;;   subsumed by p204499 (MnAgentOfFerry_ThemeOfDeparture); not a proposal
(And (Member $x0 departure) (Theme $e0 $x0))

;; p206788  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000143 tierA-000144 tierA-000146
;;   subsumed by p204407 (MnAgent_ThemeOfEveningFlightOfInheritanceFlight); not a proposal
(And (Member $x0 evening_flight) (Theme $e0 $x0))

;; p206790  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000232 tierA-000233 tierA-000234
;;   subsumed by p205686 (MnDestroy_PatientOfFootbridge); not a proposal
(And (Member $x0 footbridge) (Patient $e0 $x0))

;; p206791  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p206331 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(And (Member $x0 founder) (Patient $e0 $x0))

;; p206792  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000306 tierA-000308 tierA-000310
;;   subsumed by p204470 (MnAgent_Lend_RecipientOfGallery); not a proposal
(And (Member $x0 gallery) (Recipient $e0 $x0))

;; p206793  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000222 tierA-000223 tierA-000224
;;   subsumed by p205687 (MnDestroy_PatientOfGreenhouse); not a proposal
(And (Member $x0 greenhouse) (Patient $e0 $x0))

;; p206796  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000163 tierA-000164 tierA-000165
;;   subsumed by p204408 (MnAgent_ThemeOfLoanApplicationOfInheritanceApplication); not a proposal
(And (Member $x0 loan_application) (Theme $e0 $x0))

;; p206797  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   subsumed by p205613 (MnAgent_ThemeOfMedal); not a proposal
(And (Member $x0 medal) (Theme $e0 $x0))

;; p206798  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierB-000876 tierB-001070 tierB-001423
;;   subsumed by p205716 (MnPast_ThemeOfPicture); not a proposal
(And (Member $x0 picture) (Theme $e0 $x0))

;; p206800  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000207 tierA-000209 tierA-000211
;;   subsumed by p204426 (MnAgent_Answer_ThemeOfQuery); not a proposal
(And (Member $x0 query) (Theme $e0 $x0))

;; p206801  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000263 tierA-000265
;;   subsumed by p204464 (MnAgent_Give_RecipientOfRecruit); not a proposal
(And (Member $x0 recruit) (Recipient $e0 $x0))

;; p206804  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000212 tierA-000214 tierA-000215
;;   subsumed by p204427 (MnAgent_Answer_ThemeOfTower); not a proposal
(And (Member $x0 tower) (Theme $e0 $x0))

;; p206806  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   subsumed by p205618 (MnAgent_ThemeOfWhistle); not a proposal
(And (Member $x0 whistle) (Theme $e0 $x0))

;; p206807  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000276 tierA-000278 tierA-000280
;;   subsumed by p204465 (MnAgent_Give_RecipientOfWinner); not a proposal
(And (Member $x0 winner) (Recipient $e0 $x0))

;; p206810  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000022 tierA-000026 tierA-000028
;;   subsumed by p204510 (MnAgentOfPotteryStudio_ThemeOfOrdinalNumBuy); not a proposal
(And (Ordinal $x0 <num> buy) (Theme $e0 $x0))

;; p206816  support 3 (occ 3)  size 2  root $e0 (event)  depth 2
;;   e.g. tierA-000186 tierA-000191 tierA-000202
;;   subsumed by p204472 (MnAgent_Make_PatientEvOfTheme); not a proposal
(And (Patient $e0 $e1) (Theme $e1 $x0))

;; p206820  support 3 (occ 3)  size 2  root $e1 (event)  depth 2
;;   e.g. tierB-000485 tierB-000547 tierB-001219
;;   subsumed by p205723 (MnPast_ThemeEvOfRecipient); not a proposal
(And (Recipient $e0 $x0) (Theme $e1 $e0))

;; p206821  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204504 (MnAgentOfNeighbour_RecipientRavi_Theme); not a proposal
(And (Recipient $e0 ravi) (Theme $e0 $x0))

;; p206824  support 3 (occ 3)  size 2  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(And (Theme $e0 visitor) (Time $e0 (Weekday sunday)))

;; p207028  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000311 tierA-000312 tierA-000313
;;   subsumed by p206636 (MnAgentAna_Work); not a proposal
(Agent $e0 ana)

;; p207029  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000209 tierB-000651 tierB-001538
;;   subsumed by p206637 (MnAgentBaya_Past); not a proposal
(Agent $e0 baya)

;; p207030  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000078 tierB-000201 tierB-000576
;;   subsumed by p206638 (MnAgentDaniel_Past); not a proposal
(Agent $e0 daniel)

;; p207031  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000323 tierA-000324 tierA-000325
;;   subsumed by p204530 (MnAgentDara_LocationOfLedger_Work); not a proposal
(Agent $e0 dara)

;; p207032  support 3 (occ 5)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000117 tierB-000173 tierB-000827
;;   subsumed by p206641 (MnAgentDavid_Ongoing); not a proposal
(Agent $e0 david)

;; p207034  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000148 tierB-000389 tierB-000487
;;   subsumed by p206643 (MnAgentFelix_Past); not a proposal
(Agent $e0 felix)

;; p207038  support 3 (occ 6)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000075 tierB-000239 tierB-000400
;;   subsumed by p206644 (MnAgentMark_Past); not a proposal
(Agent $e0 mark)

;; p207041  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000667 tierB-001023 tierB-001418
;;   subsumed by p206645 (MnAgentMatthew_Past); not a proposal
(Agent $e0 matthew)

;; p207043  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000252 tierB-000929 tierB-001094
;;   subsumed by p206646 (MnAgentMichael_Past); not a proposal
(Agent $e0 michael)

;; p207044  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000138 tierB-000706 tierB-001172
;;   subsumed by p206647 (MnAgentPietro_Past); not a proposal
(Agent $e0 pietro)

;; p207046  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000001 tierB-000008 tierB-000013
;;   subsumed by p206648 (MnAgentZiri_Ongoing); not a proposal
(Agent $e0 ziri)

;; p207047  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000340 tierB-001316 tierB-001572
;;   subsumed by p206649 (MnAt_Past); not a proposal
(At $e0 $x0)

;; p207054  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000012 tierB-001418 tierB-001496
;;   subsumed by p206683 (MnGoalBed_Go); not a proposal
(Goal $e0 bed)

;; p207055  support 3 (occ 4)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000575 tierB-001086 tierB-001743
;;   subsumed by p206286 (MnAgent_GoalHome_Past); not a proposal
(Goal $e0 home)

;; p207067  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000245 tierA-000246 tierA-000247
;;   subsumed by p204400 (MnAgentOfGroupOfSoilSampleOfInheritanceSample_InstrumentPost); not a proposal
(Instrument $e0 post)

;; p207071  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000253 tierA-000254 tierA-000255
;;   subsumed by p206331 (MnPatientOfMeasureAgeNumYear-Founder); not a proposal
(Measure $x0 age <num> year)

;; p207072  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000161 tierA-000172 tierB-000328
;;   subsumed by p206711 (MnAccept_Theme); not a proposal
(Member $e0 accept)

;; p207073  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000037 tierB-000128 tierB-000974
;;   subsumed by p206712 (MnApprove_Theme); not a proposal
(Member $e0 approve)

;; p207074  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000242 tierA-000246 tierB-000005
;;   subsumed by p206586 (MnAgent_Arrival); not a proposal
(Member $e0 arrival)

;; p207077  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000906 tierB-001568 tierB-001812
;;   subsumed by p206716 (MnBear_Past); not a proposal
(Member $e0 bear)

;; p207078  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000565 tierB-000904 tierB-001920
;;   subsumed by p206664 (MnExperiencer_Beautiful); not a proposal
(Member $e0 beautiful)

;; p207079  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000297 tierA-000302 tierA-000307
;;   subsumed by p206333 (MnBorrow_Source_Theme); not a proposal
(Member $e0 borrow)

;; p207080  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-001302 tierB-001641 tierB-001694
;;   subsumed by p206722 (MnBreakOut_Past); not a proposal
(Member $e0 break_out)

;; p207082  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000063 tierB-000932 tierB-001867
;;   subsumed by p206723 (MnBuild_Patient); not a proposal
(Member $e0 build)

;; p207084  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000089 tierB-000728 tierB-000863
;;   subsumed by p206335 (MnCreate_Past_Patient); not a proposal
(Member $e0 create)

;; p207086  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000244 tierA-000247 tierB-001927
;;   subsumed by p206592 (MnAgent_Depart); not a proposal
(Member $e0 depart)

;; p207088  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000781 tierB-001245 tierB-001250
;;   subsumed by p206296 (MnAgent_Draw_Past); not a proposal
(Member $e0 draw)

;; p207092  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000329 tierB-000692 tierB-001801
;;   subsumed by p206746 (MnHoldUp_Past); not a proposal
(Member $e0 hold_up)

;; p207095  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000077 tierA-000081
;;   subsumed by p206597 (MnAgent_Permit); not a proposal
(Member $e0 permit)

;; p207096  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000334 tierB-001040 tierB-001072
;;   subsumed by p206754 (MnPickUp_Past); not a proposal
(Member $e0 pick_up)

;; p207099  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000783 tierB-001221 tierB-001637
;;   subsumed by p206760 (MnRead_Theme); not a proposal
(Member $e0 read)

;; p207100  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000231 tierA-000235 tierB-001285
;;   subsumed by p206601 (MnAgent_Save); not a proposal
(Member $e0 save)

;; p207104  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000827 tierB-001156 tierB-001901
;;   subsumed by p206764 (MnSing_Past); not a proposal
(Member $e0 sing)

;; p207105  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000935 tierB-001202 tierB-001970
;;   subsumed by p206765 (MnSolve_Patient); not a proposal
(Member $e0 solve)

;; p207107  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000383 tierB-000482 tierB-001027
;;   subsumed by p206352 (MnStick_Past_Patient); not a proposal
(Member $e0 stick)

;; p207109  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000159 tierA-000164 tierA-000169
;;   subsumed by p206306 (MnAgent_TurnDown_Theme); not a proposal
(Member $e0 turn_down)

;; p207118  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-000172 tierB-001586 tierB-001638
;;   subsumed by p206782 (MnBottom_PartOf); not a proposal
(Member $x0 bottom)

;; p207134  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000049 tierA-000050 tierA-000051
;;   subsumed by p205658 (MnCracked_FeedPipeOfInheritancePipe); not a proposal
(Member $x0 feed_pipe)

;; p207148  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierB-001573 tierB-001670 tierB-001938
;;   subsumed by p206104 (MnLivingRoomOfInheritanceRoom); not a proposal
(Member $x0 living_room)

;; p207149  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000276 tierA-000277 tierA-000278
;;   subsumed by p205613 (MnAgent_ThemeOfMedal); not a proposal
(Member $x0 medal)

;; p207171  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(Member $x0 warden)

;; p207172  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000315 tierA-000316 tierA-000318
;;   subsumed by p204416 (MnAgentOfWelder_LocationOfFrame); not a proposal
(Member $x0 welder)

;; p207173  support 3 (occ 3)  size 1  root $x0 (entity)  depth 1
;;   e.g. tierA-000261 tierA-000262 tierA-000263
;;   subsumed by p205618 (MnAgent_ThemeOfWhistle); not a proposal
(Member $x0 whistle)

;; p207181  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000296 tierA-000298 tierA-000299
;;   subsumed by p204468 (MnAgentOfNeighbour_Lend_RecipientRavi); not a proposal
(Recipient $e0 ravi)

;; p207185  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000076 tierA-000077 tierA-000078
;;   subsumed by p204409 (MnAgentOfLicence_ThemeNightDeliveryOfInheritanceDelivery); not a proposal
(Theme $e0 night_delivery)

;; p207186  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000080 tierA-000081 tierA-000083
;;   subsumed by p204415 (MnAgentOfCurator_Location_ThemePhotography); not a proposal
(Theme $e0 photography)

;; p207187  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierA-000073 tierA-000074 tierA-000075
;;   subsumed by p204515 (MnAgentOfWarden_ThemeVisitor_Time(WeekdaySunday); not a proposal
(Theme $e0 visitor)

;; p207191  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000100 tierB-000378 tierB-001726
;;   subsumed by p206679 (MnFuture_TimeTomorrow); not a proposal
(Time $e0 tomorrow)

;; p207192  support 3 (occ 3)  size 1  root $e0 (event)  depth 1
;;   e.g. tierB-000193 tierB-001094 tierB-001397
;;   subsumed by p206815 (MnPast_With); not a proposal
(With $e0 $x0)
