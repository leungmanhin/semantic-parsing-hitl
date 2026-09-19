;; FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   align_faithful.jsonl   (every mapping: unit / role / residue / profile, with support, control support, examples)
;;   align_faithful_pairs.jsonl   (one line per pair: the renaming, matched / near / unmatched atoms, quality)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   pairs           172 paraphrase pairs + 0 control pairs from ../corpora/tierC.jsonl; control support of a
;;                   mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (a measurement column)
;;                   over canonical_substrate.jsonl; 26 paraphrase pairs parse identically
;;   alignment       exact maximum-common-subgraph: every injective skolem renaming within each stream, maximising identical
;;                   atoms then near-identical atoms (one head or constant differs), first renaming on a tie;
;;                   greedy assignment above 5040 renamings (0 pairs)
;;   subtrees        the 1454 §4.3.1 faithful units instantiated on each side (k = 4)
;;   roles           binary heads on an aligned event centre (class links excluded), matched by aligned centre + filler
;;   residue         atoms matched on neither side, keyed by canonical form + the smallest unit instance around them
;;   consistency     support = distinct equivalence classes; PASS at >= 3
;;
;; RECORD FORMAT
;;   ;; [unit(, shape-parallel)]  A ~ B   support <classes> (control <classes>)   gate: PASS|FAIL
;;   ;;   A: <query A>   e.g. <class a b>      B: <query B>      substitution: <atom of B> -> <atom of A>
;;   (Implication <A> (Mn… vars))  (Implication <B> (Mn… vars))     = the two subtrees unified under one provisional meta-node
;;   ;; [role]  <majority> ~ <minority>   support …   gate: …      (Implication (<minority> $e $x) (<majority> $e $x))
;;   ;; [residue]  <atom> in <context unit>   support … occurrences … head on other side …   gate: …
;;   (Implication <context unit> <context unit without the atom>)   = the modifier-pruning rule it would become
;; Unit mappings first (PASS, then FAIL, by support), then role mappings, then residue; identity mappings are
;; summarised per unit in the .md and the JSONL (kind 'profile'). Naming and direction provisional, the gauntlet decides.

;; ==================== UNIT MAPPINGS: 3 pass of 124 non-identity mappings (117 shape-parallel) ====================

;; [unit, shape-parallel]  p200011 ~ p200012   support 5 (control 0)   gate: PASS
;;   A: (Patient $e0 $x0)   e.g. tierC-000133 tierC-000134
;;   B: (Theme $e0 $x0)
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (Patient $e0 $x0) (MnPatientOrTheme $e0 $x0))
(Implication (Theme $e0 $x0) (MnPatientOrTheme $e0 $x0))

;; [unit, shape-parallel]  p200009 ~ p200011   support 4 (control 0)   gate: PASS
;;   A: (Agent $e0 $x0)   e.g. tierC-000001 tierC-000002
;;   B: (Patient $e0 $x0)
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrPatient $e0 $x0))
(Implication (Patient $e0 $x0) (MnAgentOrPatient $e0 $x0))

;; [unit, shape-parallel]  p200030 ~ p200036   support 3 (control 0)   gate: PASS
;;   A: (And (Past $e0) (Patient $e0 $x0))   e.g. tierC-000229 tierC-000230
;;   B: (And (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_PatientOrTheme $e0 $x0))
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_PatientOrTheme $e0 $x0))

;; [unit, shape-parallel]  p202878 ~ p207302   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000075 tierC-000076
;;   B: (And (Member $e0 succeed) (Past $e0))
;;   substitution: (Member $e0 succeed) -> (Member $e0 follow)
(Implication (And (Member $e0 follow) (Past $e0)) (MnPast_FollowOrSucceed $e0))
(Implication (And (Member $e0 succeed) (Past $e0)) (MnPast_FollowOrSucceed $e0))

;; [unit, shape-parallel]  p201087 ~ p207655   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 follow)   e.g. tierC-000075 tierC-000076
;;   B: (Member $e0 succeed)
;;   substitution: (Member $e0 succeed) -> (Member $e0 follow)
(Implication (Member $e0 follow) (MnFollowOrSucceed $e0))
(Implication (Member $e0 succeed) (MnFollowOrSucceed $e0))

;; [unit, shape-parallel]  p200012 ~ p200133   support 2 (control 0)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierC-000019 tierC-000020
;;   B: (Goal $e0 $x0)
;;   substitution: (Goal $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrGoal $e0 $x0))
(Implication (Goal $e0 $x0) (MnThemeOrGoal $e0 $x0))

;; [unit, shape-parallel]  p200009 ~ p200038   support 1 (control 0)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierC-000121 tierC-000122
;;   B: (Experiencer $e0 $x0)
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrExperiencer $e0 $x0))
(Implication (Experiencer $e0 $x0) (MnAgentOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200009 ~ p200249   support 1 (control 0)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierC-000257 tierC-000258
;;   B: (Source $e0 $x0)
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrSource $e0 $x0))
(Implication (Source $e0 $x0) (MnAgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p200009 ~ p200012   support 1 (control 0)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierC-000113 tierC-000114
;;   B: (Theme $e0 $x0)
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrTheme $e0 $x0))
(Implication (Theme $e0 $x0) (MnAgentOrTheme $e0 $x0))

;; [unit, shape-parallel]  p204685 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Also appear $e0)   e.g. tierC-000127 tierC-000128
;;   B: (Also perform $e0)
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (Also appear $e0) (MnAppearOrPerform $e0))
(Implication (Also perform $e0) (MnAppearOrPerform $e0))

;; [unit, shape-parallel]  p205979 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e0 $e1) (Past $e1))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Experiencer $e0 $x0) (Past $e1))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e0 $e1) (Past $e1)) (MnBefore_Past_AgentOrExperiencer $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Experiencer $e0 $x0) (Past $e1)) (MnBefore_Past_AgentOrExperiencer $e0 $e1 $x0))

;; [unit, shape-parallel]  p202849 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e0 $e1))   e.g. tierC-000121 tierC-000122
;;   B: (And (Before $e0 $e1) (Experiencer $e0 $x0))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e0 $e1)) (MnBefore_AgentOrExperiencer $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Experiencer $e0 $x0)) (MnBefore_AgentOrExperiencer $e0 $e1 $x0))

;; [unit, shape-parallel]  p203046 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1))   e.g. tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e1 $x0))
;;   substitution: (Patient $e1 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0) (Past $e1)) (MnPast_Past_AgentOrPatient $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Past $e0) (Past $e1) (Patient $e1 $x0)) (MnPast_Past_AgentOrPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p204278 ~ p206824   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0))   e.g. tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0))
;;   substitution: (Patient $e1 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e0)) (MnAgentOrPatient $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Past $e1) (Patient $e1 $x0)) (MnAgentOrPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p203710 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1))   e.g. tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Past $e0) (Patient $e1 $x0))
;;   substitution: (Patient $e1 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e1 $e0) (Past $e1)) (MnAgentOrPatient $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Past $e0) (Patient $e1 $x0)) (MnAgentOrPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p202190 ~ p207200   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Before $e1 $e0))   e.g. tierC-000001 tierC-000002
;;   B: (And (Before $e0 $e1) (Patient $e1 $x0))
;;   substitution: (Patient $e1 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Before $e1 $e0)) (MnAgentOrPatient $e0 $x0 $e1))
(Implication (And (Before $e0 $e1) (Patient $e1 $x0)) (MnAgentOrPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p201812 ~ p202197   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Can $e0))   e.g. tierC-000237 tierC-000238
;;   B: (And (Can $e0) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Can $e0)) (MnCan_AgentOrPatient $e0 $x0))
(Implication (And (Can $e0) (Patient $e0 $x0)) (MnCan_AgentOrPatient $e0 $x0))

;; [unit]  p201344 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))   e.g. tierC-000001 tierC-000002
;;   B: (And (GroupOf $x0 people) (Past $e0) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0)) (MnPast_OrGroupOfPatient $e0 $x0))
(Implication (And (GroupOf $x0 people) (Past $e0) (Patient $e0 $x0)) (MnPast_OrGroupOfPatient $x0 $e0))

;; [unit]  p201240 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 person))   e.g. tierC-000001 tierC-000002
;;   B: (And (GroupOf $x0 people) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 person)) (MnOrGroupOfPatient $e0 $x0))
(Implication (And (GroupOf $x0 people) (Patient $e0 $x0)) (MnOrGroupOfPatient $x0 $e0))

;; [unit, shape-parallel]  p204829 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Member $x0 company))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Member $x0 company)) (MnAgent_Member_Member_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Member $x0 company)) (MnAgent_Member_Member_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206648 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Past $e0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Past $e0)) (MnAgent_Member_Past_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Past $e0)) (MnAgent_Member_Past_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206649 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x1))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))

;; [unit, shape-parallel]  p206796 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $e0 build)) (MnAgent_Member_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $e0 build)) (MnAgent_Member_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p204830 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Past $e0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Past $e0)) (MnAgent_Member_Past_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Past $e0)) (MnAgent_Member_Past_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p204831 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Patient $e0 $x1))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))

;; [unit, shape-parallel]  p205990 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x0 company)) (MnAgent_Member_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x0 company)) (MnAgent_Member_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p204832 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x1 hotel) (Patient $e0 $x1))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Member $x1 hotel) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Member $x1 hotel) (Patient $e0 $x1)) (MnAgent_Member_Patient_EskisehirOrTurkey $e0 $x0 $x1))

;; [unit, shape-parallel]  p206650 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_EskisehirOrTurkey $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_EskisehirOrTurkey $e0 $x0 $x1))

;; [unit, shape-parallel]  p206797 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Past $e0)) (MnAgent_Past_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Past $e0)) (MnAgent_Past_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206798 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey) (Patient $e0 $x1))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir) (Patient $e0 $x1)) (MnAgent_Patient_EskisehirOrTurkey $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey) (Patient $e0 $x1)) (MnAgent_Patient_EskisehirOrTurkey $e0 $x0 $x1))

;; [unit, shape-parallel]  p207158 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 eskisehir))   e.g. tierC-000045 tierC-000046
;;   B: (And (Agent $e0 $x0) (Location $e0 turkey))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Agent $e0 $x0) (Location $e0 eskisehir)) (MnAgent_EskisehirOrTurkey $e0 $x0))
(Implication (And (Agent $e0 $x0) (Location $e0 turkey)) (MnAgent_EskisehirOrTurkey $e0 $x0))

;; [unit]  p206651 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0) (Patient $e0 $x1)) (MnManner_Past_OrSourceTheme $e0 $x0 $x1))
(Implication (And (Manner $e0 directly) (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnManner_Past_OrSourceTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p206799 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Past $e0) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Manner $e0 directly) (Past $e0)) (MnManner_Past_AgentOrSource $e0 $x0))
(Implication (And (Manner $e0 directly) (Past $e0) (Source $e0 $x0)) (MnManner_Past_AgentOrSource $e0 $x0))

;; [unit]  p206800 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Manner $e0 directly) (Patient $e0 $x1)) (MnManner_OrSourceTheme $e0 $x0 $x1))
(Implication (And (Manner $e0 directly) (Source $e0 $x0) (Theme $e0 $x1)) (MnManner_OrSourceTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p207159 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Manner $e0 directly))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Manner $e0 directly)) (MnManner_AgentOrSource $e0 $x0))
(Implication (And (Manner $e0 directly) (Source $e0 $x0)) (MnManner_AgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p206807 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1))   e.g. tierC-000019 tierC-000020
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 lead))
;;   substitution: (Goal $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $e0 lead) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrGoal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 lead)) (MnAgent_Member_ThemeOrGoal $e0 $x0 $x1))

;; [unit, shape-parallel]  p200425 ~ p206018   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 person) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 person) (Past $e0)) (MnMember_Past_AgentOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 person) (Past $e0)) (MnMember_Past_AgentOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200263 ~ p202865   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierC-000121 tierC-000122
;;   B: (And (Experiencer $e0 $x0) (Member $x0 person))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnMember_AgentOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 person)) (MnMember_AgentOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200263 ~ p202216   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 person))   e.g. tierC-000237 tierC-000238
;;   B: (And (Member $x0 person) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (MnMember_AgentOrPatient $e0 $x0))
(Implication (And (Member $x0 person) (Patient $e0 $x0)) (MnMember_AgentOrPatient $x0 $e0))

;; [unit, shape-parallel]  p201167 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000019 tierC-000020
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x0 thing))
;;   substitution: (Goal $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrGoal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x0 thing)) (MnAgent_Member_ThemeOrGoal $e0 $x0 $x1))

;; [unit, shape-parallel]  p201167 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1))   e.g. tierC-000113 tierC-000114
;;   B: (And (Agent $e0 $x0) (Member $x0 ivory) (Theme $e0 $x1))
;;   substitution: (Member $x0 ivory) -> (Member $x0 thing)
(Implication (And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1)) (MnAgent_Theme_ThingOrIvory $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 ivory) (Theme $e0 $x1)) (MnAgent_Theme_ThingOrIvory $e0 $x0 $x1))

;; [unit, shape-parallel]  p200466 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 thing))   e.g. tierC-000113 tierC-000114
;;   B: (And (Agent $e0 $x0) (Member $x0 ivory))
;;   substitution: (Member $x0 ivory) -> (Member $x0 thing)
(Implication (And (Agent $e0 $x0) (Member $x0 thing)) (MnAgent_ThingOrIvory $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 ivory)) (MnAgent_ThingOrIvory $e0 $x0))

;; [unit]  p200137 ~ p202783   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1)) (MnPast_OrSourceTheme $e0 $x0 $x1))
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnPast_OrSourceTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p200025 ~ p200163   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000121 tierC-000122
;;   B: (And (Experiencer $e0 $x0) (Past $e0))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Past $e0)) (MnPast_AgentOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200025 ~ p200030   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000001 tierC-000002
;;   B: (And (Past $e0) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrPatient $e0 $x0))
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_AgentOrPatient $e0 $x0))

;; [unit, shape-parallel]  p200025 ~ p200431   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Past $e0) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrSource $e0 $x0))
(Implication (And (Past $e0) (Source $e0 $x0)) (MnPast_AgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p200025 ~ p200036   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000113 tierC-000114
;;   B: (And (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrTheme $e0 $x0))
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_AgentOrTheme $e0 $x0))

;; [unit]  p200075 ~ p202222   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Patient $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (MnOrSourceTheme $e0 $x0 $x1))
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnOrSourceTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p200048 ~ p200535   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000019 tierC-000020
;;   B: (And (Agent $e0 $x0) (Goal $e0 $x1))
;;   substitution: (Goal $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_ThemeOrGoal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1)) (MnAgent_ThemeOrGoal $e0 $x0 $x1))

;; [unit, shape-parallel]  p207189 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 jica) (Member $e0 fund))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 jica) (Member $e0 finance))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 jica) (Member $e0 fund)) (MnAgent_FundOrFinance $e0))
(Implication (And (Agent $e0 jica) (Member $e0 finance)) (MnAgent_FundOrFinance $e0))

;; [unit, shape-parallel]  p204482 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Past $e0))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Also appear $e0) (Past $e0)) (MnPast_AppearOrPerform $e0))
(Implication (And (Also perform $e0) (Past $e0)) (MnPast_AppearOrPerform $e0))

;; [unit, shape-parallel]  p204861 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal) (Past $e0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Past $e0)) (MnFor_Member_Past_PortrayOrPortrayal $e0 $e1))
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal) (Past $e0)) (MnFor_Member_Past_PortrayOrPortrayal $e0 $e1))

;; [unit, shape-parallel]  p204862 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal) (Theme $e0 $x0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray) (Theme $e0 $x0)) (MnFor_Member_Theme_PortrayOrPortrayal $e0 $e1 $x0))
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal) (Theme $e0 $x0)) (MnFor_Member_Theme_PortrayOrPortrayal $e0 $e1 $x0))

;; [unit, shape-parallel]  p206022 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portray)) (MnFor_Member_PortrayOrPortrayal $e0 $e1))
(Implication (And (For $e0 $e1) (Member $e0 win) (Member $e1 portrayal)) (MnFor_Member_PortrayOrPortrayal $e0 $e1))

;; [unit, shape-parallel]  p204863 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e1 portrayal) (Member $x0 emmy) (Theme $e0 $x0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e1 portray) (Member $x0 emmy) (Theme $e0 $x0)) (MnFor_Member_Theme_PortrayOrPortrayal $e0 $e1 $x0))
(Implication (And (For $e0 $e1) (Member $e1 portrayal) (Member $x0 emmy) (Theme $e0 $x0)) (MnFor_Member_Theme_PortrayOrPortrayal $e0 $e1 $x0))

;; [unit, shape-parallel]  p204864 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e1 portrayal) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e1 portray) (Past $e0) (Theme $e0 $x0)) (MnFor_Past_Theme_PortrayOrPortrayal $e0 $e1 $x0))
(Implication (And (For $e0 $e1) (Member $e1 portrayal) (Past $e0) (Theme $e0 $x0)) (MnFor_Past_Theme_PortrayOrPortrayal $e0 $e1 $x0))

;; [unit, shape-parallel]  p206023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e1 portray) (Past $e0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e1 portrayal) (Past $e0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e1 portray) (Past $e0)) (MnFor_Past_PortrayOrPortrayal $e0 $e1))
(Implication (And (For $e0 $e1) (Member $e1 portrayal) (Past $e0)) (MnFor_Past_PortrayOrPortrayal $e0 $e1))

;; [unit, shape-parallel]  p206024 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e1 portrayal) (Theme $e0 $x0))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e1 portray) (Theme $e0 $x0)) (MnFor_Theme_PortrayOrPortrayal $e0 $e1 $x0))
(Implication (And (For $e0 $e1) (Member $e1 portrayal) (Theme $e0 $x0)) (MnFor_Theme_PortrayOrPortrayal $e0 $e1 $x0))

;; [unit, shape-parallel]  p207218 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (For $e0 $e1) (Member $e1 portray))   e.g. tierC-000301 tierC-000302
;;   B: (And (For $e0 $e1) (Member $e1 portrayal))
;;   substitution: (Member $e1 portrayal) -> (Member $e1 portray)
(Implication (And (For $e0 $e1) (Member $e1 portray)) (MnFor_PortrayOrPortrayal $e0 $e1))
(Implication (And (For $e0 $e1) (Member $e1 portrayal)) (MnFor_PortrayOrPortrayal $e0 $e1))

;; [unit, shape-parallel]  p202014 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000001 tierC-000002
;;   B: (And (GroupOf $x0 people) (Past $e0) (Patient $e0 $x0))
;;   substitution: (GroupOf $x0 people) -> (GroupOf $x0 person)
(Implication (And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_PersonOrPeople $x0 $e0))
(Implication (And (GroupOf $x0 people) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_PersonOrPeople $x0 $e0))

;; [unit, shape-parallel]  p201484 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 person) (Patient $e0 $x0))   e.g. tierC-000001 tierC-000002
;;   B: (And (GroupOf $x0 people) (Patient $e0 $x0))
;;   substitution: (GroupOf $x0 people) -> (GroupOf $x0 person)
(Implication (And (GroupOf $x0 person) (Patient $e0 $x0)) (MnPatient_PersonOrPeople $x0 $e0))
(Implication (And (GroupOf $x0 people) (Patient $e0 $x0)) (MnPatient_PersonOrPeople $x0 $e0))

;; [unit, shape-parallel]  p204889 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0)) (MnMember_Member_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Member $e0 build) (Member $x0 hotel) (Patient $e0 $x0)) (MnMember_Member_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206660 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $e0 build) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Member $e0 build) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206833 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $e0 build) (Past $e0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $e0 build) (Past $e0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Past $e0)) (MnMember_Past_EskisehirOrTurkey $e0))
(Implication (And (Location $e0 turkey) (Member $e0 build) (Past $e0)) (MnMember_Past_EskisehirOrTurkey $e0))

;; [unit, shape-parallel]  p206834 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $e0 build) (Patient $e0 $x0)) (MnMember_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Member $e0 build) (Patient $e0 $x0)) (MnMember_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p207241 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $e0 build))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $e0 build))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $e0 build)) (MnMember_EskisehirOrTurkey $e0))
(Implication (And (Location $e0 turkey) (Member $e0 build)) (MnMember_EskisehirOrTurkey $e0))

;; [unit, shape-parallel]  p204890 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Member $x0 hotel) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206037 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Member $x0 hotel) (Patient $e0 $x0)) (MnMember_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Member $x0 hotel) (Patient $e0 $x0)) (MnMember_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206835 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p207242 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Past $e0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Past $e0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Past $e0)) (MnPast_EskisehirOrTurkey $e0))
(Implication (And (Location $e0 turkey) (Past $e0)) (MnPast_EskisehirOrTurkey $e0))

;; [unit, shape-parallel]  p207243 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 eskisehir) (Patient $e0 $x0))   e.g. tierC-000045 tierC-000046
;;   B: (And (Location $e0 turkey) (Patient $e0 $x0))
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (And (Location $e0 eskisehir) (Patient $e0 $x0)) (MnPatient_EskisehirOrTurkey $e0 $x0))
(Implication (And (Location $e0 turkey) (Patient $e0 $x0)) (MnPatient_EskisehirOrTurkey $e0 $x0))

;; [unit, shape-parallel]  p206836 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Manner $e0 directly) (Past $e0) (Patient $e0 $x0)) (MnManner_Past_PatientOrTheme $e0 $x0))
(Implication (And (Manner $e0 directly) (Past $e0) (Theme $e0 $x0)) (MnManner_Past_PatientOrTheme $e0 $x0))

;; [unit, shape-parallel]  p207246 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 directly) (Patient $e0 $x0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Manner $e0 directly) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Manner $e0 directly) (Patient $e0 $x0)) (MnManner_PatientOrTheme $e0 $x0))
(Implication (And (Manner $e0 directly) (Theme $e0 $x0)) (MnManner_PatientOrTheme $e0 $x0))

;; [unit, shape-parallel]  p204517 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Member $e0 perform) (Past $e0))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Member $e0 appear) (Past $e0)) (MnPast_AppearOrPerform $e0))
(Implication (And (Member $e0 perform) (Past $e0)) (MnPast_AppearOrPerform $e0))

;; [unit, shape-parallel]  p207253 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 avoid) (Theme $e0 $x0))   e.g. tierC-000123 tierC-000124
;;   B: (And (Member $e0 prevent) (Theme $e0 $x0))
;;   substitution: (Member $e0 prevent) -> (Member $e0 avoid)
(Implication (And (Member $e0 avoid) (Theme $e0 $x0)) (MnTheme_AvoidOrPrevent $e0 $x0))
(Implication (And (Member $e0 prevent) (Theme $e0 $x0)) (MnTheme_AvoidOrPrevent $e0 $x0))

;; [unit, shape-parallel]  p201067 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 become) (Patient $e0 $x0))   e.g. tierC-000237 tierC-000238
;;   B: (And (Agent $e0 $x0) (Member $e0 become))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 become) (Patient $e0 $x0)) (MnMember_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 become)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204522 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 change) (Past $e0))   e.g. tierC-000011 tierC-000012
;;   B: (And (Member $e0 change_mind) (Past $e0))
;;   substitution: (Member $e0 change_mind) -> (Member $e0 change)
(Implication (And (Member $e0 change) (Past $e0)) (MnPast_ChangeOrChangeMind $e0))
(Implication (And (Member $e0 change_mind) (Past $e0)) (MnPast_ChangeOrChangeMind $e0))

;; [unit, shape-parallel]  p204523 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 conduct) (Past $e0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 hold) (Past $e0))
;;   substitution: (Member $e0 hold) -> (Member $e0 conduct)
(Implication (And (Member $e0 conduct) (Past $e0)) (MnPast_ConductOrHold $e0))
(Implication (And (Member $e0 hold) (Past $e0)) (MnPast_ConductOrHold $e0))

;; [unit, shape-parallel]  p204312 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_DirectOrStage $e0 $x0))
(Implication (And (Member $e0 stage) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_DirectOrStage $e0 $x0))

;; [unit, shape-parallel]  p204526 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Past $e0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Past $e0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Past $e0)) (MnPast_DirectOrStage $e0))
(Implication (And (Member $e0 stage) (Past $e0)) (MnPast_DirectOrStage $e0))

;; [unit]  p202876 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000137 tierC-000138
;;   B: (And (Member $e0 address) (Theme $e0 $x0))
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 address) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p202876 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Patient $e0 $x0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnPatient_DirectOrStage $e0 $x0))
(Implication (And (Member $e0 stage) (Patient $e0 $x0)) (MnPatient_DirectOrStage $e0 $x0))

;; [unit, shape-parallel]  p207275 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 form) (Patient $e0 $x0))   e.g. tierC-000163 tierC-000164
;;   B: (And (Agent $e0 $x0) (Member $e0 form))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 form) (Patient $e0 $x0)) (MnMember_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 form)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p207279 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 hold) (Patient $e0 $x0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 conduct) (Patient $e0 $x0))
;;   substitution: (Member $e0 conduct) -> (Member $e0 hold)
(Implication (And (Member $e0 hold) (Patient $e0 $x0)) (MnPatient_HoldOrConduct $e0 $x0))
(Implication (And (Member $e0 conduct) (Patient $e0 $x0)) (MnPatient_HoldOrConduct $e0 $x0))

;; [unit, shape-parallel]  p207279 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 hold) (Patient $e0 $x0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 pray) (Patient $e0 $x0))
;;   substitution: (Member $e0 pray) -> (Member $e0 hold)
(Implication (And (Member $e0 hold) (Patient $e0 $x0)) (MnPatient_HoldOrPray $e0 $x0))
(Implication (And (Member $e0 pray) (Patient $e0 $x0)) (MnPatient_HoldOrPray $e0 $x0))

;; [unit, shape-parallel]  p207284 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lead) (Theme $e0 $x0))   e.g. tierC-000019 tierC-000020
;;   B: (And (Goal $e0 $x0) (Member $e0 lead))
;;   substitution: (Goal $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 lead) (Theme $e0 $x0)) (MnMember_ThemeOrGoal $e0 $x0))
(Implication (And (Goal $e0 $x0) (Member $e0 lead)) (MnMember_ThemeOrGoal $e0 $x0))

;; [unit, shape-parallel]  p204533 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 play) (Theme $e0 $x0))   e.g. tierC-000229 tierC-000230
;;   B: (And (Member $e0 play) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 play) (Theme $e0 $x0)) (MnMember_ThemeOrPatient $e0 $x0))
(Implication (And (Member $e0 play) (Patient $e0 $x0)) (MnMember_ThemeOrPatient $e0 $x0))

;; [unit, shape-parallel]  p204534 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 replace) (Past $e0))   e.g. tierC-000099 tierC-000100
;;   B: (And (Member $e0 dissolve) (Past $e0))
;;   substitution: (Member $e0 dissolve) -> (Member $e0 replace)
(Implication (And (Member $e0 replace) (Past $e0)) (MnPast_ReplaceOrDissolve $e0))
(Implication (And (Member $e0 dissolve) (Past $e0)) (MnPast_ReplaceOrDissolve $e0))

;; [unit, shape-parallel]  p204534 ~ p207302   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 replace) (Past $e0))   e.g. tierC-000099 tierC-000100
;;   B: (And (Member $e0 succeed) (Past $e0))
;;   substitution: (Member $e0 succeed) -> (Member $e0 replace)
(Implication (And (Member $e0 replace) (Past $e0)) (MnPast_ReplaceOrSucceed $e0))
(Implication (And (Member $e0 succeed) (Past $e0)) (MnPast_ReplaceOrSucceed $e0))

;; [unit, shape-parallel]  p204537 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 speak) (Past $e0))   e.g. tierC-000093 tierC-000094
;;   B: (And (Member $e0 voice) (Past $e0))
;;   substitution: (Member $e0 voice) -> (Member $e0 speak)
(Implication (And (Member $e0 speak) (Past $e0)) (MnPast_SpeakOrVoice $e0))
(Implication (And (Member $e0 voice) (Past $e0)) (MnPast_SpeakOrVoice $e0))

;; [unit, shape-parallel]  p202215 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 work) (Past $e0))   e.g. tierC-000079 tierC-000080
;;   B: (And (Member $e0 active) (Past $e0))
;;   substitution: (Member $e0 active) -> (Member $e0 work)
(Implication (And (Member $e0 work) (Past $e0)) (MnPast_WorkOrActive $e0))
(Implication (And (Member $e0 active) (Past $e0)) (MnPast_WorkOrActive $e0))

;; [unit, shape-parallel]  p206045 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 house) (Past $e0) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $x0 muslim_house) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $x0 muslim_house) -> (Member $x0 house)
(Implication (And (Member $x0 house) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_HouseOrMuslimHouse $x0 $e0))
(Implication (And (Member $x0 muslim_house) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_HouseOrMuslimHouse $x0 $e0))

;; [unit, shape-parallel]  p202898 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 house) (Theme $e0 $x0))   e.g. tierC-000095 tierC-000096
;;   B: (And (Member $x0 muslim_house) (Theme $e0 $x0))
;;   substitution: (Member $x0 muslim_house) -> (Member $x0 house)
(Implication (And (Member $x0 house) (Theme $e0 $x0)) (MnTheme_HouseOrMuslimHouse $x0 $e0))
(Implication (And (Member $x0 muslim_house) (Theme $e0 $x0)) (MnTheme_HouseOrMuslimHouse $x0 $e0))

;; [unit, shape-parallel]  p203116 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 person) (Past $e0) (Possession $x1 $x0) (Theme $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $x0 person) (Past $e0) (Patient $e0 $x1) (Possession $x1 $x0))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Member $x0 person) (Past $e0) (Possession $x1 $x0) (Theme $e0 $x1)) (MnMember_Past_Possession_ThemeOrPatient $x0 $e0 $x1))
(Implication (And (Member $x0 person) (Past $e0) (Patient $e0 $x1) (Possession $x1 $x0)) (MnMember_Past_Possession_ThemeOrPatient $x0 $e0 $x1))

;; [unit, shape-parallel]  p203759 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 person) (Possession $x1 $x0) (Theme $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $x0 person) (Patient $e0 $x1) (Possession $x1 $x0))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Member $x0 person) (Possession $x1 $x0) (Theme $e0 $x1)) (MnMember_Possession_ThemeOrPatient $x0 $x1 $e0))
(Implication (And (Member $x0 person) (Patient $e0 $x1) (Possession $x1 $x0)) (MnMember_Possession_ThemeOrPatient $x0 $e0 $x1))

;; [unit, shape-parallel]  p200494 ~ p200848   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 thing) (Theme $e0 $x0))   e.g. tierC-000137 tierC-000138
;;   B: (And (Member $x0 thing) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 thing) (Theme $e0 $x0)) (MnMember_ThemeOrPatient $x0 $e0))
(Implication (And (Member $x0 thing) (Patient $e0 $x0)) (MnMember_ThemeOrPatient $x0 $e0))

;; [unit, shape-parallel]  p201679 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Past $e0) (Patient $e0 $x0) (Possession $x0 $x1))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Past $e0) (Possession $x0 $x1) (Theme $e0 $x0)) (MnPast_Possession_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Past $e0) (Patient $e0 $x0) (Possession $x0 $x1)) (MnPast_Possession_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200036 ~ p200209   support 1 (control 0)   gate: FAIL
;;   A: (And (Past $e0) (Theme $e0 $x0))   e.g. tierC-000243 tierC-000244
;;   B: (And (Goal $e0 $x0) (Past $e0))
;;   substitution: (Goal $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOrGoal $e0 $x0))
(Implication (And (Goal $e0 $x0) (Past $e0)) (MnPast_ThemeOrGoal $e0 $x0))

;; [unit, shape-parallel]  p200653 ~ p207338   support 1 (control 0)   gate: FAIL
;;   A: (And (Possession $x0 $x1) (Theme $e0 $x0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Patient $e0 $x0) (Possession $x0 $x1))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Possession $x0 $x1) (Theme $e0 $x0)) (MnPossession_ThemeOrPatient $x0 $x1 $e0))
(Implication (And (Patient $e0 $x0) (Possession $x0 $x1)) (MnPossession_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200233 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (GroupOf $x0 person)   e.g. tierC-000001 tierC-000002
;;   B: (GroupOf $x0 people)
;;   substitution: (GroupOf $x0 people) -> (GroupOf $x0 person)
(Implication (GroupOf $x0 person) (MnPersonOrPeople $x0))
(Implication (GroupOf $x0 people) (MnPersonOrPeople $x0))

;; [unit, shape-parallel]  p200233 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (GroupOf $x0 person)   e.g. tierC-000171 tierC-000172
;;   B: (Member $x0 expedition)
;;   substitution: (Member $x0 expedition) -> (GroupOf $x0 person)
(Implication (GroupOf $x0 person) (MnPersonOrExpedition $x0))
(Implication (Member $x0 expedition) (MnPersonOrExpedition $x0))

;; [unit, shape-parallel]  p207614 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Location $e0 eskisehir)   e.g. tierC-000045 tierC-000046
;;   B: (Location $e0 turkey)
;;   substitution: (Location $e0 turkey) -> (Location $e0 eskisehir)
(Implication (Location $e0 eskisehir) (MnEskisehirOrTurkey $e0))
(Implication (Location $e0 turkey) (MnEskisehirOrTurkey $e0))

;; [unit, shape-parallel]  p202976 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 appear)   e.g. tierC-000127 tierC-000128
;;   B: (Member $e0 perform)
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (Member $e0 appear) (MnAppearOrPerform $e0))
(Implication (Member $e0 perform) (MnAppearOrPerform $e0))

;; [unit, shape-parallel]  p204710 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 avoid)   e.g. tierC-000123 tierC-000124
;;   B: (Member $e0 prevent)
;;   substitution: (Member $e0 prevent) -> (Member $e0 avoid)
(Implication (Member $e0 avoid) (MnAvoidOrPrevent $e0))
(Implication (Member $e0 prevent) (MnAvoidOrPrevent $e0))

;; [unit, shape-parallel]  p201529 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 change)   e.g. tierC-000011 tierC-000012
;;   B: (Member $e0 change_mind)
;;   substitution: (Member $e0 change_mind) -> (Member $e0 change)
(Implication (Member $e0 change) (MnChangeOrChangeMind $e0))
(Implication (Member $e0 change_mind) (MnChangeOrChangeMind $e0))

;; [unit, shape-parallel]  p202285 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 direct)   e.g. tierC-000137 tierC-000138
;;   B: (Member $e0 address)
;;   substitution: (Member $e0 address) -> (Member $e0 direct)
(Implication (Member $e0 direct) (MnDirectOrAddress $e0))
(Implication (Member $e0 address) (MnDirectOrAddress $e0))

;; [unit, shape-parallel]  p202285 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 direct)   e.g. tierC-000091 tierC-000092
;;   B: (Member $e0 stage)
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (Member $e0 direct) (MnDirectOrStage $e0))
(Implication (Member $e0 stage) (MnDirectOrStage $e0))

;; [unit, shape-parallel]  p207633 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 fund)   e.g. tierC-000245 tierC-000246
;;   B: (Member $e0 finance)
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (Member $e0 fund) (MnFundOrFinance $e0))
(Implication (Member $e0 finance) (MnFundOrFinance $e0))

;; [unit, shape-parallel]  p207634 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 give)   e.g. tierC-000111 tierC-000112
;;   B: (Member $e0 give_up)
;;   substitution: (Member $e0 give_up) -> (Member $e0 give)
(Implication (Member $e0 give) (MnGiveOrGiveUp $e0))
(Implication (Member $e0 give_up) (MnGiveOrGiveUp $e0))

;; [unit, shape-parallel]  p204725 ~ p204714   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 hold)   e.g. tierC-000283 tierC-000284
;;   B: (Member $e0 conduct)
;;   substitution: (Member $e0 conduct) -> (Member $e0 hold)
(Implication (Member $e0 hold) (MnHoldOrConduct $e0))
(Implication (Member $e0 conduct) (MnHoldOrConduct $e0))

;; [unit, shape-parallel]  p204725 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 hold)   e.g. tierC-000283 tierC-000284
;;   B: (Member $e0 pray)
;;   substitution: (Member $e0 pray) -> (Member $e0 hold)
(Implication (Member $e0 hold) (MnHoldOrPray $e0))
(Implication (Member $e0 pray) (MnHoldOrPray $e0))

;; [unit, shape-parallel]  p202983 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 portray)   e.g. tierC-000301 tierC-000302
;;   B: (Member $e0 portrayal)
;;   substitution: (Member $e0 portrayal) -> (Member $e0 portray)
(Implication (Member $e0 portray) (MnPortrayOrPortrayal $e0))
(Implication (Member $e0 portrayal) (MnPortrayOrPortrayal $e0))

;; [unit, shape-parallel]  p204732 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 replace)   e.g. tierC-000099 tierC-000100
;;   B: (Member $e0 dissolve)
;;   substitution: (Member $e0 dissolve) -> (Member $e0 replace)
(Implication (Member $e0 replace) (MnReplaceOrDissolve $e0))
(Implication (Member $e0 dissolve) (MnReplaceOrDissolve $e0))

;; [unit, shape-parallel]  p204732 ~ p207655   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 replace)   e.g. tierC-000099 tierC-000100
;;   B: (Member $e0 succeed)
;;   substitution: (Member $e0 succeed) -> (Member $e0 replace)
(Implication (Member $e0 replace) (MnReplaceOrSucceed $e0))
(Implication (Member $e0 succeed) (MnReplaceOrSucceed $e0))

;; [unit, shape-parallel]  p202292 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 speak)   e.g. tierC-000093 tierC-000094
;;   B: (Member $e0 voice)
;;   substitution: (Member $e0 voice) -> (Member $e0 speak)
(Implication (Member $e0 speak) (MnSpeakOrVoice $e0))
(Implication (Member $e0 voice) (MnSpeakOrVoice $e0))

;; [unit, shape-parallel]  p200433 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 use)   e.g. tierC-000005 tierC-000006
;;   B: (Theme $e0 banach_mackey_topology) ~NEG
;;   substitution: (Theme $e0 banach_mackey_topology) ~NEG -> (Member $e0 use)
(Implication (Member $e0 use) (MnUseOrBanachMackeyTopology $e0))
(Implication (Theme $e0 banach_mackey_topology) ~NEG (MnUseOrBanachMackeyTopology $e0))

;; [unit, shape-parallel]  p200433 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 use)   e.g. tierC-000005 tierC-000006
;;   B: (Theme $e0 weak_arens_space_topology) ~NEG
;;   substitution: (Theme $e0 weak_arens_space_topology) ~NEG -> (Member $e0 use)
(Implication (Member $e0 use) (MnUseOrWeakArensSpaceTopology $e0))
(Implication (Theme $e0 weak_arens_space_topology) ~NEG (MnUseOrWeakArensSpaceTopology $e0))

;; [unit, shape-parallel]  p200960 ~ p207619   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 work)   e.g. tierC-000079 tierC-000080
;;   B: (Member $e0 active)
;;   substitution: (Member $e0 active) -> (Member $e0 work)
(Implication (Member $e0 work) (MnWorkOrActive $e0))
(Implication (Member $e0 active) (MnWorkOrActive $e0))

;; [unit, shape-parallel]  p200434 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 house)   e.g. tierC-000095 tierC-000096
;;   B: (Member $x0 muslim_house)
;;   substitution: (Member $x0 muslim_house) -> (Member $x0 house)
(Implication (Member $x0 house) (MnHouseOrMuslimHouse $x0))
(Implication (Member $x0 muslim_house) (MnHouseOrMuslimHouse $x0))

;; [unit, shape-parallel]  p202300 ~ p204750   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 large)   e.g. tierC-000019 tierC-000020
;;   B: (Member $x0 great)
;;   substitution: (Member $x0 great) -> (Member $x0 large)
(Implication (Member $x0 large) (MnLargeOrGreat $x0))
(Implication (Member $x0 great) (MnLargeOrGreat $x0))

;; [unit, shape-parallel]  p200049 ~ p204743   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 thing)   e.g. tierC-000345 tierC-000346
;;   B: (Member $x0 country)
;;   substitution: (Member $x0 country) -> (Member $x0 thing)
(Implication (Member $x0 thing) (MnThingOrCountry $x0))
(Implication (Member $x0 country) (MnThingOrCountry $x0))

;; [unit, shape-parallel]  p200049 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 thing)   e.g. tierC-000113 tierC-000114
;;   B: (Member $x0 ivory)
;;   substitution: (Member $x0 ivory) -> (Member $x0 thing)
(Implication (Member $x0 thing) (MnThingOrIvory $x0))
(Implication (Member $x0 ivory) (MnThingOrIvory $x0))

;; [unit, shape-parallel]  p200128 ~ p200164   support 1 (control 0)   gate: FAIL
;;   A: (Possession $x0 $x1)   e.g. tierC-000265 tierC-000266
;;   B: (PartOf $x0 $x1)
;;   substitution: (PartOf $x0 $x1) -> (Possession $x0 $x1)
(Implication (Possession $x0 $x1) (MnPossessionOrPartOf $x0 $x1))
(Implication (PartOf $x0 $x1) (MnPossessionOrPartOf $x0 $x1))

;; [unit, shape-parallel]  p200012 ~ p200051   support 1 (control 0)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierC-000063 tierC-000064
;;   B: (Location $e0 $x0)
;;   substitution: (Location $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrLocation $e0 $x0))
(Implication (Location $e0 $x0) (MnThemeOrLocation $e0 $x0))

;; ==================== ROLE MAPPINGS: 4 pass of 11 non-identity; 16 lost-role records ====================

;; [role]  Theme ~ Patient   support 6 (control 0)   occurrences 181 / 97   gate: PASS   e.g. tierC-000099 tierC-000100
(Implication (Patient $e $x) (Theme $e $x))

;; [role]  Agent ~ Patient   support 4 (control 0)   occurrences 252 / 97   gate: PASS   e.g. tierC-000001 tierC-000002
(Implication (Patient $e $x) (Agent $e $x))

;; [role]  Agent ~ Theme   support 4 (control 0)   occurrences 252 / 181   gate: PASS   e.g. tierC-000017 tierC-000018
(Implication (Theme $e $x) (Agent $e $x))

;; [role]  Agent ~ Experiencer   support 3 (control 0)   occurrences 252 / 37   gate: PASS   e.g. tierC-000035 tierC-000036
(Implication (Experiencer $e $x) (Agent $e $x))

;; [role]  Holder ~ CoAgent   support 2 (control 0)   occurrences 10 / 10   gate: FAIL   e.g. tierC-000181 tierC-000182
(Implication (CoAgent $e $x) (Holder $e $x))

;; [role]  Theme ~ Goal   support 2 (control 0)   occurrences 181 / 16   gate: FAIL   e.g. tierC-000019 tierC-000020
(Implication (Goal $e $x) (Theme $e $x))

;; [role]  Theme ~ Location   support 2 (control 0)   occurrences 181 / 75   gate: FAIL   e.g. tierC-000047 tierC-000048
(Implication (Location $e $x) (Theme $e $x))

;; [role]  Agent ~ Source   support 1 (control 0)   occurrences 252 / 5   gate: FAIL   e.g. tierC-000257 tierC-000258
(Implication (Source $e $x) (Agent $e $x))

;; [role]  In ~ During   support 1 (control 0)   occurrences 27 / 2   gate: FAIL   e.g. tierC-000151 tierC-000152
(Implication (During $e $x) (In $e $x))

;; [role]  Location ~ At   support 1 (control 0)   occurrences 75 / 4   gate: FAIL   e.g. tierC-000271 tierC-000272
(Implication (At $e $x) (Location $e $x))

;; [role]  Location ~ In   support 1 (control 0)   occurrences 75 / 27   gate: FAIL   e.g. tierC-000259 tierC-000260
(Implication (In $e $x) (Location $e $x))

;; [role-lost]  Theme ~ none   support 13 (control 0)   gate: PASS   e.g. tierC-000001 tierC-000002
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Agent ~ none   support 12 (control 0)   gate: PASS   e.g. tierC-000055 tierC-000056
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Location ~ none   support 8 (control 0)   gate: PASS   e.g. tierC-000045 tierC-000046
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Patient ~ none   support 4 (control 0)   gate: PASS   e.g. tierC-000133 tierC-000134
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Manner ~ none   support 3 (control 0)   gate: PASS   e.g. tierC-000005 tierC-000006
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  As ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000099 tierC-000100
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Beneficiary ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  In ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  To ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  During ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000231 tierC-000232
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Goal ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Instrument ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000213 tierC-000214
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Possession ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Recipient ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Source ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Time ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000243 tierC-000244
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; ==================== RESIDUE: 5 pass of 556 records ====================

;; [residue]  (Past $e0)   support 6 (control 0)   occurrences 7   head on other side 5   gate: PASS   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 $x0)   support 4 (control 0)   occurrences 5   head on other side 3   gate: PASS   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 $x1)   support 3 (control 0)   occurrences 3   head on other side 2   gate: PASS   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $x0)   support 3 (control 0)   occurrences 3   head on other side 1   gate: PASS   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $x0) in (And (Agent $e0 $x0) (Theme $e0 $x1))   support 3 (control 0)   occurrences 3   head on other side 2   gate: PASS   e.g. tierC-000021 tierC-000022
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (And (Agent $e0 $x0) (Theme $e0 $x1)))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 person))   support 2 (control 0)   occurrences 2   head on other side 1   gate: FAIL   e.g. tierC-000237 tierC-000238
(Implication (And (Agent $e0 $x0) (Member $x0 person)) (Member $x0 person))

;; [residue]  (Also $x0 $e0)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000133 tierC-000134
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Experiencer $e0 $x0)   support 2 (control 0)   occurrences 2   head on other side 1   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance metropolitan_statistical_area area)   support 2 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000275 tierC-000276
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance paper_factory factory)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance paper_mill mill)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 government)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 western)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past $e0) in (And (Member $e0 have) (Past $e0))   support 2 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000181 tierC-000182
(Implication (And (Member $e0 have) (Past $e0)) (Member $e0 have))

;; [residue]  (Patient $e0 $x0)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Result $e0 $e1) in (And (Member $e0 become) (Result $e0 $e1))   support 2 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
(Implication (And (Member $e0 become) (Result $e0 $e1)) (Member $e0 become))

;; [residue]  (Again $e0) in (And (Again $e0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000229 tierC-000230
(Implication (And (Again $e0) (Past $e0)) (Past $e0))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Can $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000149 tierC-000150
(Implication (And (Agent $e0 $x0) (Can $e0)) (Can $e0))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $e0 sing))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
(Implication (And (Agent $e0 $x0) (Member $e0 sing)) (Member $e0 sing))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $e0 win))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000277 tierC-000278
(Implication (And (Agent $e0 $x0) (Member $e0 win)) (Member $e0 win))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Possession $x0 $x1))   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
(Implication (And (Agent $e0 $x0) (Possession $x0 $x1)) (Possession $x0 $x1))

;; [residue]  (Agent $e0 amateur_barbershop_harmony_society)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 gilles_thibaut)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000131 tierC-000132
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 government_of_kenya)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 government_of_uganda)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 indooroopilly_line)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 j_augustus_knapp)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000231 tierC-000232
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 jon_bon_jovi)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 jones)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 karen)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000071 tierC-000072
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 ralph)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 roger)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000269 tierC-000270
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 wilson)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000277 tierC-000278
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Also add $e0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000227 tierC-000228
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Also celebrate $e0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000133 tierC-000134
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Also paint $e0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000293 tierC-000294
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Can $x0) (For $x0 $x2) (GroupOf $x1 recombinant_colony) (GroupOf $x2 reason) (Member $x0 contain) (Theme $x0 $x3)) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000073 tierC-000074
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (CardinalityPhrase $x2 <str>) (For $x0 $x2) (GroupOf $x1 recombinant_colony) (GroupOf $x2 reason) (Member $x0 contain) (Might $x0) (Theme $x0 $x3)) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000073 tierC-000074
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 morrow) (Can $x0) (Member $x0 mean) (Or (And (Member $x1 next_day) (Theme $x0 $x1)) (And (Member $x2 future) (Theme $x0 $x2))))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000195 tierC-000196
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 morrow) (Can $x0) (Member $x0 mean) (Or (Theme $x0 next_day) (Theme $x0 future)))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000195 tierC-000196
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Member $x0 consider) (Theme $x0 (Member $x1 objective))) ~NEG   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000233 tierC-000234
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (As $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (As $e0 pedo_transfer_function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (As $e0 scott_wells)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000359 tierC-000360
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (As $x0 pedotransfer_function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Beneficiary $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Beneficiary $e0 morel)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Between veymandoo_kandu laamu_atoll thaa_atoll)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000309 tierC-000310
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Between veymandoo_kandu thaa_atoll laamu_atoll)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000309 tierC-000310
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Cause phonological_factor regressive_assimilation)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Condition phonological_factor regressive_assimilation)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ConditionalProperty intradermal_injection helpful focal_neuropathy)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree $e0 celebrated highly)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree $x0 competitive_activity mainly)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree $x0 low generally)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree $x0 recreational_sport mainly)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree intradermal_injection painful chronically)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree person important mostly)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree person important numerically)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree synthetic_instrument software_defined purely)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000207 tierC-000208
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (During $e0 $e1) in (And (During $e0 $e1) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000231 tierC-000232
(Implication (And (During $e0 $e1) (Past $e0)) (Past $e0))

;; [residue]  (Experiencer $e0 $x0) in (And (Experiencer $e0 $x0) (GroupOf $x0 person))   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
(Implication (And (Experiencer $e0 $x0) (GroupOf $x0 person)) (GroupOf $x0 person))

;; [residue]  (Experiencer $e0 $x0) in (And (Experiencer $e0 $x0) (Member $x0 person))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000237 tierC-000238
(Implication (And (Experiencer $e0 $x0) (Member $x0 person)) (Member $x0 person))

;; [residue]  (Experiencer $e0 $x0) in (And (Experiencer $e0 $x0) (Member $x0 thing))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
(Implication (And (Experiencer $e0 $x0) (Member $x0 thing)) (Member $x0 thing))

;; [residue]  (For $e0 oscar)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (For $x0 oscar)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (For $x0 shopping)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (For russian_market_1 shopping)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (For russian_market_2 shopping)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (From $x0 $x1)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (From paniqui $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (From paniqui manila)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Goal $e0 indonesia)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Goal $e0 loren)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 activity)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 chinese_drama)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 empirical_relationship)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 group)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 immigrant)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 parent)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 part)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000135 tierC-000136
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 view)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000355 tierC-000356
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 whig)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000087 tierC-000088
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In $e0 $x0) in (And (Experiencer $e0 $x0) (In $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
(Implication (And (Experiencer $e0 $x0) (In $e0 $x1)) (And (Experiencer $e0 $x0) (In $e0 $x1)))

;; [residue]  (In $e0 chess)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In $e0 chess_play)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In $e0 traditional_chinese_drama)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (In intradermal_injection focal_neuropathy)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance $x0 legal)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance academic_administrator academic)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance academic_administrator administrator)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance announcer (can announce))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance autonomous_region autonomous)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance autonomous_region region)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance border_section section)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance cat_fight fight)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000019 tierC-000020
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance central_arm arm)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance central_arm central)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance chess_play play)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance chinese_drama chinese)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance chinese_drama drama)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance city_network network)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance civil_community civil)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance civil_community community)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance civil_parish civil)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance civil_parish parish)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance competitive_activity activity)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance competitive_activity competitive)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance designation_convention convention)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000173 tierC-000174
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance empirical_relationship empirical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance empirical_relationship relationship)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance english_administrator administrator)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance english_administrator english)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance fluid_mechanics mechanics)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000153 tierC-000154
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance focal_neuropathy chronic)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance focal_neuropathy painful)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance former_municipality municipality)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000031 tierC-000032
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance french_singer french)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000137 tierC-000138
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance french_singer singer)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000137 tierC-000138
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance geological_party_leader leader)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance homentropic_current current)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000153 tierC-000154
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance homentropic_current homentropic)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000153 tierC-000154
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance homentropic_flow flow)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000153 tierC-000154
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance homentropic_flow homentropic)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000153 tierC-000154
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance ice_cone cone)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000197 tierC-000198
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance ice_cream_cone cone)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000197 tierC-000198
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indentured_person indentured)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indentured_person person)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indigenous_american american)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indigenous_american indigenous)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indonesian_immigrant immigrant)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indonesian_immigrant indonesian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance international_balance_of_political_power balance)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance international_balance_of_political_power international)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance intradermal_injection helpful)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance intradermal_injection painful)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance lead_singer lead)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_phrase logical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_phrase phrase)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_proposition logical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_proposition proposition)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance main_songwriting_unit unit)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance mental_world mental)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000233 tierC-000234
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance mental_world world)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000233 tierC-000234
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance metropolitan_statistical_area metropolitan)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000275 tierC-000276
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance metropolitan_statistical_area statistical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000249 tierC-000250
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance msm_model model)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000267 tierC-000268
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance muslim_house house)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000095 tierC-000096
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance muslim_house muslim)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000095 tierC-000096
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance naming_convention convention)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000173 tierC-000174
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance nanobrewery brewery)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000285 tierC-000286
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance native_american american)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance native_american native)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance natural_forest forest)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance natural_forest natural)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance natural_lowland_forest forest)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance natural_lowland_forest lowland)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance natural_lowland_forest natural)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance occupational_group group)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedo_transfer_function function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedotransfer_function function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance polish_russian_treaty polish)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000281 tierC-000282
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance polish_russian_treaty polish_russian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000281 tierC-000282
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance polish_russian_treaty russian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000281 tierC-000282
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance political_power political)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance political_power power)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance popular_culture culture)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance potential_partner partner)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance presented_in_scale scale)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000213 tierC-000214
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pyrite_content content)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000265 tierC-000266
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance right_tributary right)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance right_tributary tributary)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance russian_market market)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance russian_market russian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance seafaring_nation nation)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance seafaring_nation seafaring)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance songwriting_unit unit)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sporting_activity activity)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sporting_activity sporting)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance stock_exchange exchange)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sunni_community community)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000117 tierC-000118
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sunni_community sunni)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000117 tierC-000118
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance synthetic_instrument software_defined)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000207 tierC-000208
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance traditional_chinese_drama drama)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance weak_arens_space_topology weak)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000005 tierC-000006
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Instrument $e0 $e1)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000071 tierC-000072
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Instrument $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000213 tierC-000214
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Instrument $e0 $x0) in (And (Agent $e0 $x0) (Instrument $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000071 tierC-000072
(Implication (And (Agent $e0 $x0) (Instrument $e0 $x1)) (And (Agent $e0 $x0) (Instrument $e0 $x1)))

;; [residue]  (Instrument $e0 $x0) in (And (Instrument $e0 $x0) (Member $e0 build))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000213 tierC-000214
(Implication (And (Instrument $e0 $x0) (Member $e0 build)) (Member $e0 build))

;; [residue]  (LocatedIn $x0 canton_thurgau)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 denmark)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000125 tierC-000126
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 eskisehir)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 europe)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 issaquah_creek)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000063 tierC-000064
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 kenya)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn $x0 lessos)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn albania $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn albania santander_department)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn canton_thurgau switzerland)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn chittoor andhra_pradesh)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000141 tierC-000142
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn chittoor_district andhra_pradesh)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000141 tierC-000142
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn chongqing wanzhou)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn chongqing wanzhou_district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn corrientes argentina)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn corrientes_province argentina)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn des_moines warren_county_west_des_moines_ia_metropolitan_statistical_area)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000189 tierC-000190
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn des_moines warren_county_west_des_moines_msa_ia)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000189 tierC-000190
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn dianchi_lake china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn eschenz $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn eschenz frauenfeld_district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn eskisehir turkey)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn frauenfeld_district thurgau)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn gareccio italy)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000047 tierC-000048
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn indentured_person $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn kazakhstan turkey)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000291 tierC-000292
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn laamu_atoll maldives)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000309 tierC-000310
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn lake_dianchi china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn madicea romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn olt_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn peru huancavelica)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn purul_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn river_frasin romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn rotunda_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn russian_market_2 $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn saladas_department corrientes)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn saladas_department corrientes_province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn santander_department $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn straja_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn thurgau switzerland)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn wanzhou china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn wanzhou_district china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn xinjiang_uyghur yarkand_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn xinjiang_uyghur_autonomous_region yarkand_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn yarkand_river $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (LocatedIn yarkand_river western_china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0) in (And (Agent $e0 $x0) (Location $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000353 tierC-000354
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (And (Agent $e0 $x0) (Location $e0 $x1)))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Location $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
(Implication (And (Location $e0 $x0) (Location $e0 $x1)) (Location $e0 $x1))

;; [residue]  (Location $e0 denmark)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000125 tierC-000126
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 japan) in (And (Location $e0 japan) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000111 tierC-000112
(Implication (And (Location $e0 japan) (Past $e0)) (Past $e0))

;; [residue]  (Location $e0 julian_ashton_art_school)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000253 tierC-000254
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 lake_dianchi)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 turkey)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000291 tierC-000292
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 western_europe)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Manner $e0 first)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000111 tierC-000112
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Manner $e0 jointly)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 bear)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000357 tierC-000358
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 bring)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 build)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000213 tierC-000214
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 celebrated)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 competitive_activity)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 direct)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 encourage)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 form)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 french)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 help)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000071 tierC-000072
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 illustrate)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000231 tierC-000232
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 include)   support 1 (control 0)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 indigenous)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 influence)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 inomaru)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000237 tierC-000238
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 post)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 refer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 relate)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 serve)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 sporting_activity)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 start)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000125 tierC-000126
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 study)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000253 tierC-000254
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 task)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 work)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 banach_mackey_topology)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000005 tierC-000006
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 border_section)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 central)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 department)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 destined)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 expedition)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000171 tierC-000172
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 former)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 geological)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 help)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000071 tierC-000072
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 indonesian)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 inomaru)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000237 tierC-000238
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 international)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 isostructural)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000163 tierC-000164
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 listed_building)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 low)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000069 tierC-000070
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 main)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 mainstream_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 mind)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000011 tierC-000012
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 moist)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 msm_model)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000267 tierC-000268
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 muslim)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000095 tierC-000096
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 natural_lowland_forest)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 neighbouring)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000117 tierC-000118
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 other)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000117 tierC-000118
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 party)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 person) in (And (Member $x0 person) (Possession $x1 $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000235 tierC-000236
(Implication (And (Member $x0 person) (Possession $x1 $x0)) (Possession $x1 $x0))

;; [residue]  (Member $x0 plantation)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 potential)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 president)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 professional)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 provincial_capital)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 random)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000261 tierC-000262
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 refer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 representation)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000271 tierC-000272
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 russian_market)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 scale)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000213 tierC-000214
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 season)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000243 tierC-000244
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 social_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 songwriting_unit)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 sunni)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000117 tierC-000118
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 thing)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000149 tierC-000150
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 weak_arens_space_topology)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000005 tierC-000006
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 wilson)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000277 tierC-000278
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 world)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000233 tierC-000234
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member alexander_valley_ava ava)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000307 tierC-000308
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member amateur_barbershop_harmony_society society)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member armaan_jain actor)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member armaan_jain nephew)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member barbershop_harmony_society amateur)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member barbershop_harmony_society society)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member canton_thurgau canton)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member castle_peak_bay bay)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chittoor district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000141 tierC-000142
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chittoor_district district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000141 tierC-000142
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chongqing site)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member city_network network)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member corrientes province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member corrientes_province province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000219 tierC-000220
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member cranoe civil_community)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member cranoe civil_parish)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member dianchi_lake lake)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member east_coast_railway department)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000105 tierC-000106
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member east_coast_railway division)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000105 tierC-000106
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member frasin_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member frasin_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member frauenfeld_district district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member government_of_kenya government)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member government_of_uganda government)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member henry_l_taylor architect)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000119 tierC-000120
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member huancavelica peruvian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member huancavelica province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member indooroopilly line)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member indooroopilly_line line)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member ipswich_line line)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member ipswich_rosewood city_network)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member janmashtmi festival)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000133 tierC-000134
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member janmashtmi_festival festival)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000133 tierC-000134
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member jon_bon_jovi lead_singer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member khurda_road road)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000105 tierC-000106
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lake_dianchi lake)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lessos_border_section_uganda section)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lessos_kenya border_section)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lessos_uganda border_section)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member madicea river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member madicea_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member manila provincial_capital)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member methoni former_municipality)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000031 tierC-000032
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member methoni municipality) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000031 tierC-000032
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member msm model)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000267 tierC-000268
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member new_york_stock_exchange exchange)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member new_york_stock_exchange stock_exchange)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member nikhil_nanda nephew)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member olt river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member olt tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member olt_river right_tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member olt_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member oraciu_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member pascu river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member pascu_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member patricia_kaas french)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000137 tierC-000138
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member patricia_kaas french_singer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000137 tierC-000138
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member patricia_kaas singer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000137 tierC-000138
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member peak_bay_castle castle)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member peru province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member ranbir_kapoor nephew)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_frasin river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_frasin tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_oraciu river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_rotunda river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_rotunda tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member rosewood_line line)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member rotunda_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member rotunda_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member russian_market_1 market)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member russian_market_2 market)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member santander_department department)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member springfield station)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member springfield_station station)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member thurgau canton)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member wanzhou district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member wanzhou_district district)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member warren_county_west_des_moines_ia_metropolitan_statistical_area metropolitan_statistical_area)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000189 tierC-000190
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member warren_county_west_des_moines_msa_ia metropolitan_statistical_area)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000189 tierC-000190
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member william_ewer governor)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000099 tierC-000100
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member wine_country country)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000307 tierC-000308
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member xinjiang_uyghur autonomous_region)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member xinjiang_uyghur river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member xinjiang_uyghur_autonomous_region river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000143 tierC-000144
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Most old alexander son)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000075 tierC-000076
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Of $x0 karen)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000071 tierC-000072
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Ongoing $e0) in (And (Location $e0 $x0) (Ongoing $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000279 tierC-000280
(Implication (And (Location $e0 $x0) (Ongoing $e0)) (Location $e0 $x0))

;; [residue]  (Ongoing $e0) in (And (Member $e0 work) (Ongoing $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000079 tierC-000080
(Implication (And (Member $e0 work) (Ongoing $e0)) (Member $e0 work))

;; [residue]  (Only lake_dianchi $e0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Only phonological_factor (Cause phonological_factor regressive_assimilation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Only phonological_factor (Condition phonological_factor regressive_assimilation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Or (Member $x0 subtropical) (Member $x0 tropical))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000339 tierC-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Ordinal $x0 <num> give)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000111 tierC-000112
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Outside tuen_mun castle_peak_bay)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Outside tuen_mun peak_bay_castle)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 cameron)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000011 tierC-000012
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 kenya)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000245 tierC-000246
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 manila)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 uganda)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 yunnan)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf armaan_jain $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf indooroopilly_line city_network)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf ipswich_line city_network)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf lemnia lutoasa_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf main_songwriting_unit $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf new_york_stock_exchange nyse_group)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf nikhil_nanda $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf nyse_group new_york_stock_exchange)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf olt madicea)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf pustnic_river oraciu_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf pustnic_river river_oraciu)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf ranbir_kapoor $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf river_frasin straja_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf river_rotunda purul_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf rosewood_line city_network)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf valea_voenilor_river pascu_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past $e0) in (And (Agent $e0 $x0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000071 tierC-000072
(Implication (And (Agent $e0 $x0) (Past $e0)) (Agent $e0 $x0))

;; [residue]  (Past $e0) in (And (Past $e0) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000315 tierC-000316
(Implication (And (Past $e0) (Patient $e0 $x0)) (Patient $e0 $x0))

;; [residue]  (Past (Degree $x0 celebrated highly))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Inheritance person important))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (KindProperty indentured_person numerically_important))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (LocatedIn vanga_kingdom bengal))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member $x0 chapel))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member asserson active))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000079 tierC-000080
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member astrid_ingeborg_tuominen parent))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member astrid_ingeborg_tuominen sergeant_major))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member chuck_robb democrat))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member david_david announcer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member david_ross announcer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member george_allen republican))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member henry_l_taylor architect))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000119 tierC-000120
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member james_david_edgar speaker))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member james_david_edgar spokesman))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member jon_bon_jovi lead_singer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member methoni municipality))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000031 tierC-000032
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member michele_emmer father))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member michele_michele_emmer father))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member mike_morton geological_party_leader))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member mike_morton leader))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member oates person))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000023 tierC-000024
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member robb democrat))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member rudolf_mikael_friberg parent))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_bain speaker))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_bain spokesman))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_fothergill academic))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_fothergill academic_administrator))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_fothergill english))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member thomas_fothergill english_administrator))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000085 tierC-000086
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member vanga_kingdom nation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member vanga_kingdom seafaring))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member vanga_kingdom seafaring_nation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Most old alexander son))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000075 tierC-000076
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Ordinal $x0 <num> bear))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000357 tierC-000358
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Ordinal $x0 <num> son))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000357 tierC-000358
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Ordinal vanga_kingdom <num> nation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Ordinal vanga_kingdom <num> seafaring_nation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (PartOf astrid_ingeborg_tuominen $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (PartOf rudolf_mikael_friberg $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession alexander james_of_barrochan))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000075 tierC-000076
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession astrid_ingeborg_tuominen $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession elisabeth_of_berg henry_vi))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000323 tierC-000324
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession michele_emmer luciano_emmer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession michele_michele_emmer luciano_emmer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession mike_morton $x0))   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession rudolf_mikael_friberg $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession vanga_kingdom bengal))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000299 tierC-000300
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 $x0) in (And (Can $e0) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000267 tierC-000268
(Implication (And (Can $e0) (Patient $e0 $x0)) (Can $e0))

;; [residue]  (Patient $e0 $x0) in (And (Member $e0 change) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000011 tierC-000012
(Implication (And (Member $e0 change) (Patient $e0 $x0)) (Member $e0 change))

;; [residue]  (Patient $e0 $x0) in (And (Member $e0 form) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
(Implication (And (Member $e0 form) (Patient $e0 $x0)) (Member $e0 form))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 person) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000357 tierC-000358
(Implication (And (Member $x0 person) (Patient $e0 $x0)) (Member $x0 person))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 room) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000213 tierC-000214
(Implication (And (Member $x0 room) (Patient $e0 $x0)) (Member $x0 room))

;; [residue]  (Patient $e0 chinese_dumpling)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 main_songwriting_unit)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 msm)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000267 tierC-000268
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient intradermal_injection botulinum_toxin)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $e0 philosophy)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 $x1) in (And (Member $x0 person) (Possession $x1 $x0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000129 tierC-000130
(Implication (And (Member $x0 person) (Possession $x1 $x0)) (And (Member $x0 person) (Possession $x1 $x0)))

;; [residue]  (Possession $x0 dora_smith)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000289 tierC-000290
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 frauenfeld)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000155 tierC-000156
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 free_soil_party) in (And (GroupOf $x0 view) (Possession $x0 free_soil_party))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000355 tierC-000356
(Implication (And (GroupOf $x0 view) (Possession $x0 free_soil_party)) (GroupOf $x0 view))

;; [residue]  (Possession $x0 free_soil_party) in (And (Member free_soil_party party) (Possession $x0 free_soil_party))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000355 tierC-000356
(Implication (And (Member free_soil_party party) (Possession $x0 free_soil_party)) (Member free_soil_party party))

;; [residue]  (Possession $x0 logical_phrase)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 new_york_stock_exchange)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 nyse_group)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 political_power)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000257 tierC-000258
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 santander)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000263 tierC-000264
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 technetium)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000163 tierC-000164
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession alexander james_of_barrochan)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000075 tierC-000076
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession frasin_river straja_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession lemnia_river lutoasa_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession ma_smith dora_smith)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000289 tierC-000290
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession mike_morton $x0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000033 tierC-000034
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession olt_river madicea_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession rotunda_river purul_river)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession valea_voenilor pascu)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession will dora_smith)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000289 tierC-000290
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ProportionOf $x0 $x1 most)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ProportionOf $x0 $x1 some)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000135 tierC-000136
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Recipient $e0 loren)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Similar $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Similar russian_market_2 russian_market_1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 mainstream_media)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 social_media)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (SubsetOf $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000237 tierC-000238
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1) in (And (Agent $e0 $x0) (Theme $e0 $e1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000001 tierC-000002
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (Agent $e0 $x0))

;; [residue]  (Theme $e0 $x0) in (And (Holder $e0 $x0) (Theme $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000271 tierC-000272
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (And (Holder $e0 $x0) (Theme $e0 $x1)))

;; [residue]  (Theme $e0 $x0) in (And (Member $e0 use) (Theme $e0 $x0))   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000005 tierC-000006
(Implication (And (Member $e0 use) (Theme $e0 $x0)) (Member $e0 use))

;; [residue]  (Theme $e0 (Member $x0 french))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 armaan_jain)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 chinese_dumpling)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000351 tierC-000352
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 gareccio)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000047 tierC-000048
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 industrialization)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000087 tierC-000088
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 inomaru)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000237 tierC-000238
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 issaquah_creek)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000063 tierC-000064
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 lessos_kenya)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000217 tierC-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 maurice)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 nikhil_nanda)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 ranbir_kapoor)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 representation)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000271 tierC-000272
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 springfield_station)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000185 tierC-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 william_ewer)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000099 tierC-000100
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme intradermal_injection botulinum_toxin)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000243 tierC-000244
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 modern_times)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 this_season)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000243 tierC-000244
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (To $e0 $e1) in (And (Agent $e0 $x0) (To $e0 $e1))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000237 tierC-000238
(Implication (And (Agent $e0 $x0) (To $e0 $e1)) (Agent $e0 $x0))

;; [residue]  (To $e0 prostitution)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (To $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (While (Condition phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)
