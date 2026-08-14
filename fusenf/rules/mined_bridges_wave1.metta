; ===== FUSE-NF wave-1 mined bridges (PRE-GAUNTLET CANDIDATES) =====
; generated 2026-08-14 by mining/export_bridges.py from out/align_rules.jsonl (§4.3.4) + out/slots.jsonl (§4.3.2)
; status: mined + negative-control-checked, NOT yet P4-validated;
;   confidence is support-based (c = min(0.9, 0.7+0.05*support)) and
;   provisional — the P4 gauntlet re-scores or rejects each rule.
; load beside seeded_rules.metta; all proof names are unique (mined_w1_*).
; KNOWN ENGINE GAP (repro: bug_conj_reuses_rule_premise_minimal.py): a query
;   conjunction that re-asserts a premise of the rule deriving another of its
;   conjuncts currently returns [] — e.g. asking (And (Member $e cancel)
;   (Patient $e $x)) when Patient was derived FROM (Member $e cancel). The
;   derived atom itself and conjunctions with non-premise atoms bind fine.

; ----- lexical equivalences (§4.3.4 lexical-collapse) -----
; acquire <-> buy   support 4 (8 pairs), slot-cos 0.93, e.g. tierA-000001|tierA-000003
(: mined_w1_lex_buy_acquire (Implication (Member $x buy) (Member $x acquire)) (STV 1.0 0.9))
(: mined_w1_lex_acquire_buy (Implication (Member $x acquire) (Member $x buy)) (STV 1.0 0.9))
; begin <-> commence   support 4 (4 pairs), slot-cos 0.96, e.g. tierA-000052|tierA-000054
(: mined_w1_lex_commence_begin (Implication (Member $x commence) (Member $x begin)) (STV 1.0 0.9))
(: mined_w1_lex_begin_commence (Implication (Member $x begin) (Member $x commence)) (STV 1.0 0.9))
; begin <-> start   support 4 (4 pairs), slot-cos 0.96, e.g. tierA-000052|tierA-000053
(: mined_w1_lex_start_begin (Implication (Member $x start) (Member $x begin)) (STV 1.0 0.9))
(: mined_w1_lex_begin_start (Implication (Member $x begin) (Member $x start)) (STV 1.0 0.9))
; buy <-> purchase   support 4 (8 pairs), slot-cos 0.93, e.g. tierA-000001|tierA-000002
(: mined_w1_lex_purchase_buy (Implication (Member $x purchase) (Member $x buy)) (STV 1.0 0.9))
(: mined_w1_lex_buy_purchase (Implication (Member $x buy) (Member $x purchase)) (STV 1.0 0.9))
; commence <-> start   support 4 (4 pairs), slot-cos 1.00, e.g. tierA-000053|tierA-000054
(: mined_w1_lex_start_commence (Implication (Member $x start) (Member $x commence)) (STV 1.0 0.9))
(: mined_w1_lex_commence_start (Implication (Member $x commence) (Member $x start)) (STV 1.0 0.9))
; abandon <-> give_up   support 3 (6 pairs), slot-cos 0.98, e.g. tierA-000099|tierA-000100
(: mined_w1_lex_give_up_abandon (Implication (Member $x give_up) (Member $x abandon)) (STV 1.0 0.85))
(: mined_w1_lex_abandon_give_up (Implication (Member $x abandon) (Member $x give_up)) (STV 1.0 0.85))
; big <-> large   support 3 (3 pairs), no slot data, e.g. tierA-000327|tierA-000328
(: mined_w1_lex_large_big (Implication (Member $x large) (Member $x big)) (STV 1.0 0.85))
(: mined_w1_lex_big_large (Implication (Member $x big) (Member $x large)) (STV 1.0 0.85))
; call_off <-> cancel   support 3 (5 pairs), slot-cos 0.96, e.g. tierA-000143|tierA-000144
(: mined_w1_lex_cancel_call_off (Implication (Member $x cancel) (Member $x call_off)) (STV 1.0 0.85))
(: mined_w1_lex_call_off_cancel (Implication (Member $x call_off) (Member $x cancel)) (STV 1.0 0.85))
; difficult <-> hard   support 3 (3 pairs), no slot data, e.g. tierA-000351|tierA-000352
(: mined_w1_lex_hard_difficult (Implication (Member $x hard) (Member $x difficult)) (STV 1.0 0.85))
(: mined_w1_lex_difficult_hard (Implication (Member $x difficult) (Member $x hard)) (STV 1.0 0.85))
; discover <-> find_out   support 3 (6 pairs), no slot data, e.g. tierA-000128|tierA-000129
(: mined_w1_lex_find_out_discover (Implication (Member $x find_out) (Member $x discover)) (STV 1.0 0.85))
(: mined_w1_lex_discover_find_out (Implication (Member $x discover) (Member $x find_out)) (STV 1.0 0.85))
; need <-> require   support 3 (5 pairs), slot-cos 0.85, e.g. tierA-000085|tierA-000086
(: mined_w1_lex_require_need (Implication (Member $x require) (Member $x need)) (STV 1.0 0.85))
(: mined_w1_lex_need_require (Implication (Member $x need) (Member $x require)) (STV 1.0 0.85))
; postpone <-> put_off   support 3 (5 pairs), slot-cos 0.98, e.g. tierA-000114|tierA-000115
(: mined_w1_lex_put_off_postpone (Implication (Member $x put_off) (Member $x postpone)) (STV 1.0 0.85))
(: mined_w1_lex_postpone_put_off (Implication (Member $x postpone) (Member $x put_off)) (STV 1.0 0.85))
; reject <-> turn_down   support 3 (6 pairs), slot-cos 0.93, e.g. tierA-000158|tierA-000159
(: mined_w1_lex_turn_down_reject (Implication (Member $x turn_down) (Member $x reject)) (STV 1.0 0.85))
(: mined_w1_lex_reject_turn_down (Implication (Member $x reject) (Member $x turn_down)) (STV 1.0 0.85))
; allow <-> permit   support 2 (2 pairs), slot-cos 0.94, e.g. tierA-000076|tierA-000077
(: mined_w1_lex_permit_allow (Implication (Member $x permit) (Member $x allow)) (STV 1.0 0.8))
(: mined_w1_lex_allow_permit (Implication (Member $x allow) (Member $x permit)) (STV 1.0 0.8))
; arrival <-> arrive   support 2 (2 pairs), slot-cos 0.48, e.g. tierA-000241|tierA-000242
(: mined_w1_lex_arrive_arrival (Implication (Member $x arrive) (Member $x arrival)) (STV 1.0 0.8))
(: mined_w1_lex_arrival_arrive (Implication (Member $x arrival) (Member $x arrive)) (STV 1.0 0.8))
; die <-> kick_the_bucket   support 2 (2 pairs), no slot data, e.g. tierA-000253|tierA-000254
(: mined_w1_lex_kick_the_bucket_die (Implication (Member $x kick_the_bucket) (Member $x die)) (STV 1.0 0.8))
(: mined_w1_lex_die_kick_the_bucket (Implication (Member $x die) (Member $x kick_the_bucket)) (STV 1.0 0.8))
; endorse <-> support   support 2 (2 pairs), no slot data, e.g. tierC-000159|tierC-000160
(: mined_w1_lex_support_endorse (Implication (Member $x support) (Member $x endorse)) (STV 1.0 0.8))
(: mined_w1_lex_endorse_support (Implication (Member $x endorse) (Member $x support)) (STV 1.0 0.8))
; fix <-> mend   support 2 (2 pairs), no slot data, e.g. tierA-000030|tierA-000031
(: mined_w1_lex_mend_fix (Implication (Member $x mend) (Member $x fix)) (STV 1.0 0.8))
(: mined_w1_lex_fix_mend (Implication (Member $x fix) (Member $x mend)) (STV 1.0 0.8))
; fix <-> repair   support 2 (4 pairs), no slot data, e.g. tierA-000029|tierA-000030
(: mined_w1_lex_repair_fix (Implication (Member $x repair) (Member $x fix)) (STV 1.0 0.8))
(: mined_w1_lex_fix_repair (Implication (Member $x fix) (Member $x repair)) (STV 1.0 0.8))
; follow <-> succeed   support 2 (2 pairs), slot-cos 0.44, e.g. tierC-000075|tierC-000076
(: mined_w1_lex_succeed_follow (Implication (Member $x succeed) (Member $x follow)) (STV 1.0 0.8))
(: mined_w1_lex_follow_succeed (Implication (Member $x follow) (Member $x succeed)) (STV 1.0 0.8))
; mend <-> repair   support 2 (4 pairs), no slot data, e.g. tierA-000029|tierA-000031
(: mined_w1_lex_repair_mend (Implication (Member $x repair) (Member $x mend)) (STV 1.0 0.8))
(: mined_w1_lex_mend_repair (Implication (Member $x mend) (Member $x repair)) (STV 1.0 0.8))

; ----- structural bridges (§4.3.4 structural-alt) -----
; au0007   support 4 (4 pairs), witnesses {"K0": {"chef": 1, "depot": 1, "pottery_studio": 1, "school": 1}}, e.g. tierA-000003|tierA-000004
(: mined_w1_str_au0007_f (Implication (And (Agent $c $x0) (Member $c acquire)) (And (Member $c sell) (Recipient $c $x0))) (STV 1.0 0.9))
(: mined_w1_str_au0007_b (Implication (And (Member $c sell) (Recipient $c $x0)) (And (Agent $c $x0) (Member $c acquire))) (STV 1.0 0.9))
; au0008   support 4 (8 pairs), witnesses {"K0": {"chef": 2, "depot": 2, "pottery_studio": 2, "school": 2}}, e.g. tierA-000001|tierA-000004
(: mined_w1_str_au0008_f (Implication (And (Agent $c $x0) (Member $c buy)) (And (Member $c sell) (Recipient $c $x0))) (STV 1.0 0.9))
(: mined_w1_str_au0008_b (Implication (And (Member $c sell) (Recipient $c $x0)) (And (Agent $c $x0) (Member $c buy))) (STV 1.0 0.9))
; au0009   support 4 (4 pairs), witnesses {"K0": {"chef": 1, "depot": 1, "pottery_studio": 1, "school": 1}}, e.g. tierA-000002|tierA-000004
(: mined_w1_str_au0009_f (Implication (And (Agent $c $x0) (Member $c purchase)) (And (Member $c sell) (Recipient $c $x0))) (STV 1.0 0.9))
(: mined_w1_str_au0009_b (Implication (And (Member $c sell) (Recipient $c $x0)) (And (Agent $c $x0) (Member $c purchase))) (STV 1.0 0.9))
; au0010   support 4 (4 pairs), witnesses {"K0": {"decision": 4}}, e.g. tierA-000186|tierA-000187
(: mined_w1_str_au0010_f (Implication (And (Member $c make) (Member $e0 decision) (Patient $c $e0)) (And (Member $c reach) (Theme $c $e0))) (STV 1.0 0.9))
(: mined_w1_str_au0010_b (Implication (And (Member $c reach) (Member $e0 decision) (Theme $c $e0)) (And (Member $c make) (Patient $c $e0))) (STV 1.0 0.9))
; au0020   support 3 (6 pairs), witnesses {"K0": {"fire": 2, "flood": 2, "storm": 2}}, e.g. tierA-000222|tierA-000223
(: mined_w1_str_au0020_b (Implication (And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $c)) (Agent $c $x0)) (STV 1.0 0.85))
; au0025   support 3 (3 pairs), witnesses -, e.g. tierA-000339|tierA-000340
(: mined_w1_str_au0025_f (Implication (And (Degree $c big very) (Member $c big)) (Member $c huge)) (STV 1.0 0.85))
(: mined_w1_str_au0025_b (Implication (Member $c huge) (And (Degree $c big very) (Member $c big))) (STV 1.0 0.85))
; au0026   support 3 (3 pairs), witnesses {"K0": {"caller": 1, "query": 1, "tower": 1}}, e.g. tierA-000207|tierA-000208
(: mined_w1_str_au0026_b (Implication (And (Member $c give) (Member $x1 answer) (Recipient $c $x0) (Theme $c $x1)) (And (Member $c answer) (Theme $c $x0))) (STV 1.0 0.85))
; au0027   support 3 (3 pairs), witnesses {"K0": {"caller": 1, "query": 1, "tower": 1}}, e.g. tierA-000208|tierA-000209
(: mined_w1_str_au0027_b (Implication (And (Member $c give) (Member $x0 answer) (Recipient $c $x1) (Theme $c $x0)) (And (Member $c answer) (Theme $c $x1))) (STV 1.0 0.85))
; au0028   support 3 (5 pairs), witnesses {"K0": {"budget": 2, "case": 2, "new": 1}}, e.g. tierA-000185|tierA-000186
(: mined_w1_str_au0028_b (Implication (And (Member $c make) (Member $e0 decision) (Patient $c $e0) (Theme $e0 $x0)) (And (Member $c decide) (Theme $c $x0))) (STV 1.0 0.85))
; au0029   support 3 (5 pairs), witnesses {"K0": {"budget": 2, "case": 2, "new": 1}}, e.g. tierA-000185|tierA-000187
(: mined_w1_str_au0029_b (Implication (And (Member $c reach) (Member $e0 decision) (Theme $c $e0) (Theme $e0 $x0)) (And (Member $c decide) (Theme $c $x0))) (STV 1.0 0.85))
; au0038   support 2 (2 pairs), witnesses {"K0": {"nurse": 1, "shepherd": 1}}, e.g. tierA-000173|tierA-000174
(: mined_w1_str_au0038_b (Implication (And (Agent $e0 $x0) (Member $e0 take) (Member $x0 nurse) (Theme $e0 $c)) (Agent $c $x0)) (STV 1.0 0.8))
; au0044   support 2 (2 pairs), witnesses -, e.g. tierC-000181|tierC-000182
(: mined_w1_str_au0044_f (Implication (And (CoAgent $c karen) (Past $c)) (Holder $c karen)) (STV 1.0 0.8))
(: mined_w1_str_au0044_b (Implication (Holder $c karen) (And (CoAgent $c karen) (Past $c))) (STV 1.0 0.8))
; au0046   support 2 (2 pairs), witnesses -, e.g. tierC-000045|tierC-000046
(: mined_w1_str_au0046_f (Implication (Inheritance paper_factory factory) (Inheritance paper_mill mill)) (STV 1.0 0.8))
(: mined_w1_str_au0046_b (Implication (Inheritance paper_mill mill) (Inheritance paper_factory factory)) (STV 1.0 0.8))

; ----- role bridges (§4.3.2 #23: event classes attested with BOTH
;       Theme and Patient — QA stops depending on the parse's pick) -----
; avoid: Theme n=1, Patient n=1
(: mined_w1_role_avoid_tp (Implication (And (Member $e avoid) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_avoid_pt (Implication (And (Member $e avoid) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; become: Theme n=2, Patient n=6
(: mined_w1_role_become_tp (Implication (And (Member $e become) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_become_pt (Implication (And (Member $e become) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; begin: Theme n=5, Patient n=7
(: mined_w1_role_begin_tp (Implication (And (Member $e begin) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_begin_pt (Implication (And (Member $e begin) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; call_off: Theme n=1, Patient n=2
(: mined_w1_role_call_off_tp (Implication (And (Member $e call_off) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_call_off_pt (Implication (And (Member $e call_off) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; cancel: Theme n=2, Patient n=7
(: mined_w1_role_cancel_tp (Implication (And (Member $e cancel) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_cancel_pt (Implication (And (Member $e cancel) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; change: Theme n=1, Patient n=3
(: mined_w1_role_change_tp (Implication (And (Member $e change) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_change_pt (Implication (And (Member $e change) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; conduct: Theme n=2, Patient n=1
(: mined_w1_role_conduct_tp (Implication (And (Member $e conduct) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_conduct_pt (Implication (And (Member $e conduct) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; leave: Theme n=1, Patient n=1
(: mined_w1_role_leave_tp (Implication (And (Member $e leave) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_leave_pt (Implication (And (Member $e leave) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; start: Theme n=1, Patient n=4
(: mined_w1_role_start_tp (Implication (And (Member $e start) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_start_pt (Implication (And (Member $e start) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
; take: Theme n=4, Patient n=1
(: mined_w1_role_take_tp (Implication (And (Member $e take) (Theme $e $x)) (Patient $e $x)) (STV 1.0 0.8))
(: mined_w1_role_take_pt (Implication (And (Member $e take) (Patient $e $x)) (Theme $e $x)) (STV 1.0 0.8))
