; ===== FUSE-NF loop-2 mined bridges (P4 GAUNTLET ROUND 3, VALIDATED ONLY) =====
; generated 2026-08-21 by mining/export_bridges3.py from rules/validated3.jsonl;
; audit-retired rules excluded per rules/retired.jsonl: ['r30009', 'r30011', 'r30013']
; load beside seeded_rules.metta, mined_bridges_wave1.metta and
; mined_bridges_wave2.metta; proof names unique (mined_w3_*).

; ----- lexical equivalences (loop-2 singleton-mined, judge-validated) -----
; rate_of_flow <-> flow_rate   loop-2 singleton, judges unanimous
(: mined_w3_lex_rate_of_flow_flow_rate (Implication (Member $x rate_of_flow) (Member $x flow_rate)) (STV 1.0 0.75))
(: mined_w3_lex_flow_rate_rate_of_flow (Implication (Member $x flow_rate) (Member $x rate_of_flow)) (STV 1.0 0.75))
; train_station <-> railway_station   loop-2 singleton, judges unanimous
(: mined_w3_lex_train_station_railway_station (Implication (Member $x train_station) (Member $x railway_station)) (STV 1.0 0.75))
(: mined_w3_lex_railway_station_train_station (Implication (Member $x railway_station) (Member $x train_station)) (STV 1.0 0.75))

; ----- role bridges (loop-2 flip witnesses, class-conditioned; wave-1 form) -----
(: mined_w3_role_finish_tp (Implication (And (Member $e finish) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w3_role_finish_pt (Implication (And (Member $e finish) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
(: mined_w3_role_spend_tp (Implication (And (Member $e spend) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w3_role_spend_pt (Implication (And (Member $e spend) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
(: mined_w3_role_train_tp (Implication (And (Member $e train) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w3_role_train_pt (Implication (And (Member $e train) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
