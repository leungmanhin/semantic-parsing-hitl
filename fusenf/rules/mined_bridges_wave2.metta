; ===== FUSE-NF wave-2 mined bridges (P4 GAUNTLET ROUND 2, VALIDATED ONLY) =====
; generated 2026-08-14 by mining/wave2/export_bridges2.py from rules/validated2.jsonl
; load beside seeded_rules.metta and mined_bridges_wave1.metta;
; all proof names are unique (mined_w2_*).
; meta-node expansions are the decompressor for packed consolidated KBs:
;   (Mn... $C $v ...) |- each original component atom, STV 1.0 0.99.

; ----- meta-node expansions (§4.3.3 subtree-collapse, validated packs) -----
; mn0001 MnEvAgThPast  applications 111, marginal savings 109 atoms (net strict +95)
(: mined_w2_exp_MnEvAgThPast_0 (Implication (MnEvAgThPast $C $v $x1 $x2) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgThPast_1 (Implication (MnEvAgThPast $C $v $x1 $x2) (Agent $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgThPast_2 (Implication (MnEvAgThPast $C $v $x1 $x2) (Theme $C $x2)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgThPast_3 (Implication (MnEvAgThPast $C $v $x1 $x2) (Past $C)) (STV 1.0 0.99))
; mn0002 MnEvAgPatPast  applications 72, marginal savings 72 atoms (net strict +58)
(: mined_w2_exp_MnEvAgPatPast_0 (Implication (MnEvAgPatPast $C $v $x1 $x2) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgPatPast_1 (Implication (MnEvAgPatPast $C $v $x1 $x2) (Agent $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgPatPast_2 (Implication (MnEvAgPatPast $C $v $x1 $x2) (Patient $C $x2)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgPatPast_3 (Implication (MnEvAgPatPast $C $v $x1 $x2) (Past $C)) (STV 1.0 0.99))
; mn0003 MnEvAgRecTh  applications 38, marginal savings 38 atoms (net strict +24)
(: mined_w2_exp_MnEvAgRecTh_0 (Implication (MnEvAgRecTh $C $v $x1 $x2 $x3) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgRecTh_1 (Implication (MnEvAgRecTh $C $v $x1 $x2 $x3) (Agent $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgRecTh_2 (Implication (MnEvAgRecTh $C $v $x1 $x2 $x3) (Recipient $C $x2)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgRecTh_3 (Implication (MnEvAgRecTh $C $v $x1 $x2 $x3) (Theme $C $x3)) (STV 1.0 0.99))
; mn0005 MnEvAgTh  applications 179, marginal savings 165 atoms (net strict +154)
(: mined_w2_exp_MnEvAgTh_0 (Implication (MnEvAgTh $C $v $x1 $x2) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgTh_1 (Implication (MnEvAgTh $C $v $x1 $x2) (Agent $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgTh_2 (Implication (MnEvAgTh $C $v $x1 $x2) (Theme $C $x2)) (STV 1.0 0.99))
; mn0007 MnEvAgPat  applications 44, marginal savings 44 atoms (net strict +33)
(: mined_w2_exp_MnEvAgPat_0 (Implication (MnEvAgPat $C $v $x1 $x2) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgPat_1 (Implication (MnEvAgPat $C $v $x1 $x2) (Agent $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAgPat_2 (Implication (MnEvAgPat $C $v $x1 $x2) (Patient $C $x2)) (STV 1.0 0.99))
; mn0008 MnEvExpLoc  applications 38, marginal savings 38 atoms (net strict +27)
(: mined_w2_exp_MnEvExpLoc_0 (Implication (MnEvExpLoc $C $v $x1 $x2) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvExpLoc_1 (Implication (MnEvExpLoc $C $v $x1 $x2) (Experiencer $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvExpLoc_2 (Implication (MnEvExpLoc $C $v $x1 $x2) (Location $C $x2)) (STV 1.0 0.99))
; mn0009 MnEvPatPast  applications 25, marginal savings 25 atoms (net strict +14)
(: mined_w2_exp_MnEvPatPast_0 (Implication (MnEvPatPast $C $v $x1) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvPatPast_1 (Implication (MnEvPatPast $C $v $x1) (Patient $C $x1)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvPatPast_2 (Implication (MnEvPatPast $C $v $x1) (Past $C)) (STV 1.0 0.99))
; mn0011 MnEvTh  applications 76, marginal savings 74 atoms (net strict +66)
(: mined_w2_exp_MnEvTh_0 (Implication (MnEvTh $C $v $x1) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvTh_1 (Implication (MnEvTh $C $v $x1) (Theme $C $x1)) (STV 1.0 0.99))
; mn0012 MnEvAg  applications 60, marginal savings 60 atoms (net strict +52)
(: mined_w2_exp_MnEvAg_0 (Implication (MnEvAg $C $v $x1) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvAg_1 (Implication (MnEvAg $C $v $x1) (Agent $C $x1)) (STV 1.0 0.99))
; mn0013 MnEvPat  applications 45, marginal savings 40 atoms (net strict +32)
(: mined_w2_exp_MnEvPat_0 (Implication (MnEvPat $C $v $x1) (Member $C $v)) (STV 1.0 0.99))
(: mined_w2_exp_MnEvPat_1 (Implication (MnEvPat $C $v $x1) (Patient $C $x1)) (STV 1.0 0.99))

; ----- lexical equivalences (§4.3.5 AE pairs judged genuine) -----
; car <-> automobile   AE cosine 0.99, support 4, judged same-truth
(: mined_w2_lex_car_automobile (Implication (Member $x car) (Member $x automobile)) (STV 1.0 0.9))
(: mined_w2_lex_automobile_car (Implication (Member $x automobile) (Member $x car)) (STV 1.0 0.9))
; doctor <-> physician   AE cosine 0.99, support 4, judged same-truth
; ASYMMETRIC TVs per owner decision 2026-08-21 (judges: hypernym pair, physician SUBSET-OF doctor
; — doctor also covers dentists/vets/PhDs): the entailed direction physician->doctor keeps 0.9;
; doctor->physician demoted to 0.7 ("near-synonymous in this corpus's usage" — honest recall aid).
(: mined_w2_lex_doctor_physician (Implication (Member $x doctor) (Member $x physician)) (STV 1.0 0.7))
(: mined_w2_lex_physician_doctor (Implication (Member $x physician) (Member $x doctor)) (STV 1.0 0.9))
