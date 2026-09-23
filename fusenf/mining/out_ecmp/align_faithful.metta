;; FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (validation instrument) — readable MeTTa RENDERING
;; EVIDENCE, never loaded and never a rule: (Unifiable A B) says the two forms recur between sentences known to mean
;; the same (support = distinct paraphrase classes) and how often between sentences known to differ (control);
;; (OneSided X) says a region occurs in one parse only. Turning a licensed unification into a rewrite of the KB is
;; build_candidates' job. The record of truth is
;;   align_faithful.jsonl   (every record: substitution-factor / substitution-joint / role / role-lost / drop / element)
;;   align_faithful_pairs.jsonl   (one line per pair: the renaming, common subgraph, substitutions, one-sided regions)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   pairs           233 paraphrase pairs + 468 control pairs from ../corpora/tierA.jsonl; control support of a
;;                   key = classes where it occurs in a control pair but in none of the class's paraphrase pairs (a measurement column)
;;                   over out_ecmp/canonical_iteme.jsonl; 49 paraphrase pairs parse identically
;;   alignment       the edit script: every injective skolem renaming within each stream, maximising identical atoms then
;;                   near atoms (one relabel), first renaming on a tie; greedy assignment above 5040 renamings (0 pairs)
;;   regions         atoms outside the common part grouped by shared node symbols the common part does not hold; anchors never merge
;;   substitutions   regions linked by relabels + same-side regions on the same anchors (a co-dependent edit is one substitution);
;;                   recorded as each FACTOR (one relabel) and as the JOINT key (both sides + anchors)
;;   one-sided       regions with no relabel link; diagnostic; reattach / head-on-other-side flags per occurrence
;;   consistency     support = distinct equivalence classes; PASS at >= 3; LICENSED = PASS with zero control support
;;
;; RECORD FORMAT
;;   ;; [factor|joint|role]  support <classes> (control <classes>) [alone <classes>] [co-dependent]   gate: LICENSED|JOINT-ONLY|CONTESTED|FAIL   e.g. <class a b>
;;   gate LICENSED = pass, zero control support, (a factor) attested alone at least once; JOINT-ONLY = a factor never attested alone,
;;   licensed only inside its joint; CONTESTED = pass with control support
;;   (Unifiable <form A> <form B>)            ; joint keys carry their anchors in the comment
;;   ;; [one-sided]  support … occurrences … reattach … head on other side …   gate: PASS|FAIL
;;   (OneSided <atoms>)
;; Licensed first inside each section, then joint-only, then contested, then the rest by support.

;; ==================== SUBSTITUTIONS — FACTORS: 16 licensed / 30 pass of 138 ====================

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000001 tierA-000003
(Unifiable (Member $e0 buy) (Member $e0 acquire))

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000052 tierA-000054
(Unifiable (Member $e0 commence) (Member $e0 begin))

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000002 tierA-000003
(Unifiable (Member $e0 purchase) (Member $e0 acquire))

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000001 tierA-000002
(Unifiable (Member $e0 purchase) (Member $e0 buy))

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000052 tierA-000053
(Unifiable (Member $e0 start) (Member $e0 begin))

;; [factor]  support 4 (control 0)  alone 4  joint contexts 0   gate: LICENSED   e.g. tierA-000053 tierA-000054
(Unifiable (Member $e0 start) (Member $e0 commence))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 1   gate: LICENSED   e.g. tierA-000143 tierA-000144
(Unifiable (Member $e0 cancel) (Member $e0 call_off))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000128 tierA-000129
(Unifiable (Member $e0 find_out) (Member $e0 discover))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000099 tierA-000100
(Unifiable (Member $e0 give_up) (Member $e0 abandon))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000114 tierA-000115
(Unifiable (Member $e0 put_off) (Member $e0 postpone))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 1   gate: LICENSED   e.g. tierA-000084 tierA-000085
(Unifiable (Member $e0 require) (Member $e0 need))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000158 tierA-000159
(Unifiable (Member $e0 turn_down) (Member $e0 reject))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000390 tierA-000391
(Unifiable (Member $x0 car) (Member $x0 automobile))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000351 tierA-000352
(Unifiable (Member $x0 hard) (Member $x0 difficult))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000327 tierA-000328
(Unifiable (Member $x0 large) (Member $x0 big))

;; [factor]  support 3 (control 0)  alone 3  joint contexts 0   gate: LICENSED   e.g. tierA-000375 tierA-000376
(Unifiable (Member $x0 physician) (Member $x0 doctor))

;; [factor]  support 9 (control 0)  alone 0  joint contexts 4   gate: JOINT-ONLY   e.g. tierA-000261 tierA-000262
(Unifiable (Agent $e0 $x0) (Source $e0 $x0))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 2   gate: JOINT-ONLY   e.g. tierA-000185 tierA-000186
(Unifiable (Member $e0 make) (Member $e0 decide))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 2   gate: JOINT-ONLY   e.g. tierA-000185 tierA-000187
(Unifiable (Member $e0 reach) (Member $e0 decide))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000186 tierA-000187
(Unifiable (Member $e0 reach) (Member $e0 make))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000003 tierA-000004
(Unifiable (Member $e0 sell) (Member $e0 acquire))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000001 tierA-000004
(Unifiable (Member $e0 sell) (Member $e0 buy))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000002 tierA-000004
(Unifiable (Member $e0 sell) (Member $e0 purchase))

;; [factor]  support 4 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000186 tierA-000187
(Unifiable (Theme $e0 $e1) (Patient $e0 $e1))

;; [factor]  support 3 (control 0)  alone 0  joint contexts 2   gate: JOINT-ONLY   e.g. tierA-000207 tierA-000208
(Unifiable (Member $e0 give) (Member $e0 answer))

;; [factor]  support 3 (control 0)  alone 0  joint contexts 2   gate: JOINT-ONLY   e.g. tierA-000296 tierA-000297
(Unifiable (Member $e0 lend) (Member $e0 borrow))

;; [factor]  support 3 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000261 tierA-000262
(Unifiable (Member $e0 receive) (Member $e0 give))

;; [factor]  support 3 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000281 tierA-000282
(Unifiable (Member $e0 teach) (Member $e0 learn))

;; [factor]  support 3 (control 0)  alone 0  joint contexts 1   gate: JOINT-ONLY   e.g. tierA-000339 tierA-000340
(Unifiable (Member $x0 huge) (Member $x0 big))

;; [factor]  support 12 (control 1)  alone 0  joint contexts 6   gate: CONTESTED   e.g. tierA-000001 tierA-000004
(Unifiable (Agent $e0 $x0) (Recipient $e0 $x0))

;; [factor]  support 2 (control 0)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000241 tierA-000242
(Unifiable (Member $e0 arrive) (Member $e0 arrival))

;; [factor]  support 2 (control 0)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000253 tierA-000254
(Unifiable (Member $e0 kick_the_bucket) (Member $e0 die))

;; [factor]  support 2 (control 0)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000030 tierA-000031
(Unifiable (Member $e0 mend) (Member $e0 fix))

;; [factor]  support 2 (control 1)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000076 tierA-000077
(Unifiable (Member $e0 permit) (Member $e0 allow))

;; [factor]  support 2 (control 0)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000029 tierA-000030
(Unifiable (Member $e0 repair) (Member $e0 fix))

;; [factor]  support 2 (control 0)  alone 2  joint contexts 0   gate: FAIL   e.g. tierA-000029 tierA-000031
(Unifiable (Member $e0 repair) (Member $e0 mend))

;; [factor]  support 2 (control 0)  alone 0  joint contexts 1   gate: FAIL   e.g. tierA-000363 tierA-000364
(Unifiable (Member $x0 tired) (Member $x0 exhausted))

;; [factor]  support 2 (control 3)  alone 0  joint contexts 1   gate: FAIL   e.g. tierA-000207 tierA-000208
(Unifiable (Theme $e0 $x0) (Recipient $e0 $x0))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 1   gate: FAIL   e.g. tierA-000084 tierA-000085
(Unifiable (Agent $e0 $x0) (Holder $e0 $x0))

;; [factor]  support 1 (control 0)  alone 0  joint contexts 1   gate: FAIL   e.g. tierA-000297 tierA-000298
(Unifiable (Agent $e0 ravi) (Member $e0 lend))

;; [factor]  support 1 (control 0)  alone 0  joint contexts 1   gate: FAIL   e.g. tierA-000296 tierA-000297
(Unifiable (Agent $e0 ravi) (Recipient $e0 ravi))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000217 tierA-000218
(Unifiable (Member $x0 caller) (Member $x0 answer))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000022 tierA-000024
(Unifiable (Ordinal $x0 <num> buy) (Ordinal $x0 <num> acquire))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000023 tierA-000024
(Unifiable (Ordinal $x0 <num> purchase) (Ordinal $x0 <num> acquire))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000022 tierA-000023
(Unifiable (Ordinal $x0 <num> purchase) (Ordinal $x0 <num> buy))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000024 tierA-000025
(Unifiable (Ordinal $x0 <num> sell) (Ordinal $x0 <num> acquire))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000022 tierA-000025
(Unifiable (Ordinal $x0 <num> sell) (Ordinal $x0 <num> buy))

;; [factor]  support 1 (control 0)  alone 1  joint contexts 0   gate: FAIL   e.g. tierA-000023 tierA-000025
(Unifiable (Ordinal $x0 <num> sell) (Ordinal $x0 <num> purchase))

;; [factor]  support 1 (control 0)  alone 0  joint contexts 1   gate: FAIL   e.g. tierA-000297 tierA-000298
(Unifiable (Recipient $e0 ravi) (Member $e0 borrow))

;; [factor]  support 1 (control 3)  alone 1  joint contexts 1   gate: FAIL   e.g. tierA-000143 tierA-000145
(Unifiable (Theme $e0 $x0) (Patient $e0 $x0))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (Experiencer $e0 $x0))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (Goal $e0 $x0))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (Location $e0 $x0))

;; [factor]  support 0 (control 5)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (Patient $e0 $x0))

;; [factor]  support 0 (control 5)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (Theme $e0 $x0))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Cardinality $x0 <num>) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Holder $e0 $x0) (Experiencer $e0 $x0))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 confirm) (Member $e0 call_off))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 confirm) (Member $e0 cancel))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 continue) (Member $e0 abandon))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 cross) (Member $e0 avoid))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 decision) (Member $e0 decide))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 depart) (Member $e0 arrival))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 depart) (Member $e0 arrive))

;; [factor]  support 0 (control 3)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 end) (Member $e0 begin))

;; [factor]  support 0 (control 3)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 end) (Member $e0 commence))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 error) (Member $e0 auditor))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 fix) (Member $e0 break))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 forbid) (Member $e0 allow))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 give_up) (Member $e0 continue))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 ignore) (Member $e0 examine))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 mend) (Member $e0 break))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 order) (Member $e0 cancel))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 permit) (Member $e0 forbid))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 postpone) (Member $e0 advance))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 put_off) (Member $e0 advance))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 reject) (Member $e0 accept))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 repair) (Member $e0 break))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 save) (Member $e0 cause))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 save) (Member $e0 destroy))

;; [factor]  support 0 (control 3)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 start) (Member $e0 end))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 survive) (Member $e0 die))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 survive) (Member $e0 kick_the_bucket))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 take) (Member $e0 sprint))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 take) (Member $e0 stroll))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 turn_down) (Member $e0 accept))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 wait) (Member $e0 leave))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 walk) (Member $e0 sprint))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 walk) (Member $e0 stroll))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $e0 work) (Member $e0 compete))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 automobile) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 car) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 clerk) (Member $x0 answer))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 countersignature) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 depot) (Member $x0 crew))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 difficult) ~NEG (Member $x0 difficult))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 doctor) (Member $x0 chart))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 easy) (Member $x0 difficult))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 error) (Member $x0 auditor))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 exhausted) (Member $x0 energetic))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 exhausted) ~NEG (Member $x0 exhausted))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 fire) (Member $x0 archive))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 foreman) (Member $x0 driver))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 hard) (Member $x0 difficult) ~NEG)

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 hard) (Member $x0 easy))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 huge) ~NEG (Member $x0 big))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 huge) ~NEG (Member $x0 huge))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 judge) (Member $x0 case))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 ladder) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 large) ~NEG (Member $x0 big))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 large) ~NEG (Member $x0 large))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 loan_application) (Member $x0 bank))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 manuscript) (Member $x0 editor))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 medal) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 painting) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 physician) (Member $x0 chart))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 potter) (Member $x0 apprentice))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 projector) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 query) (Member $x0 clerk))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 small) (Member $x0 big))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 small) (Member $x0 large))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 squad) (Member $x0 coach))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 storm) (Member $x0 greenhouse))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 tiny) (Member $x0 big))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 tiny) (Member $x0 huge))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 tired) (Member $x0 energetic))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 tired) (Member $x0 exhausted) ~NEG)

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 vet) (Member $x0 answer))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 vet) (Member $x0 caller))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 ward) (Member $x0 nurse))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 whistle) (Cardinality $x0 <num>))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 wreck) (Member $x0 diver))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Member $x0 yard_floodlight) (Member $x0 electrician))

;; [factor]  support 0 (control 4)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Might $e0) (Future $e0))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Ordinal $x0 <num> buy) (Ordinal $x0 <num> buy))

;; [factor]  support 0 (control 5)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Source $e0 $x0) (Recipient $e0 $x0))

;; [factor]  support 0 (control 2)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Theme $e0 $x0) (Location $e0 $x0))

;; [factor]  support 0 (control 1)  alone 0  joint contexts 0   gate: FAIL   e.g. 
(Unifiable (Theme $e0 (And (Agent $x1 north) (Member $x1 move) (Member $x0 family) (Theme $x1 $x0))) (Theme $e0 (And (Agent $x0 $x1) (Goal $x0 north) (Member $x0 move))))

;; ==================== SUBSTITUTIONS — JOINT KEYS: 9 licensed / 9 pass of 91 ====================

;; [joint]  support 4 (control 0)  factors 2  co-dependent  anchors $e0 $x0   gate: LICENSED   e.g. tierA-000003 tierA-000004
(Unifiable (And (Agent $e0 $x0) (Member $e0 acquire)) (And (Member $e0 sell) (Recipient $e0 $x0)))

;; [joint]  support 4 (control 0)  factors 2  co-dependent  anchors $e0 $x0   gate: LICENSED   e.g. tierA-000001 tierA-000004
(Unifiable (And (Agent $e0 $x0) (Member $e0 buy)) (And (Member $e0 sell) (Recipient $e0 $x0)))

;; [joint]  support 4 (control 0)  factors 2  co-dependent  anchors $e0 $x0   gate: LICENSED   e.g. tierA-000002 tierA-000004
(Unifiable (And (Agent $e0 $x0) (Member $e0 purchase)) (And (Member $e0 sell) (Recipient $e0 $x0)))

;; [joint]  support 4 (control 0)  factors 2  co-dependent  anchors $e0 $e1   gate: LICENSED   e.g. tierA-000186 tierA-000187
(Unifiable (And (Member $e0 reach) (Theme $e0 $e1)) (And (Member $e0 make) (Patient $e0 $e1)))

;; [joint]  support 3 (control 0)  factors 3  co-dependent  anchors $e0 $x0 $x1   gate: LICENSED   e.g. tierA-000261 tierA-000262
(Unifiable (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)))

;; [joint]  support 3 (control 0)  factors 3  co-dependent  anchors $e0 $x0 $x1   gate: LICENSED   e.g. tierA-000281 tierA-000282
(Unifiable (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)))

;; [joint]  support 3 (control 0)  factors 1  co-dependent  anchors $e0 $x0   gate: LICENSED   e.g. tierA-000185 tierA-000186
(Unifiable (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) (And (Member $e0 decide) (Theme $e0 $x0)))

;; [joint]  support 3 (control 0)  factors 1  co-dependent  anchors $e0 $x0   gate: LICENSED   e.g. tierA-000185 tierA-000187
(Unifiable (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) (And (Member $e0 decide) (Theme $e0 $x0)))

;; [joint]  support 3 (control 0)  factors 1  co-dependent  anchors $x0   gate: LICENSED   e.g. tierA-000339 tierA-000340
(Unifiable (Member $x0 huge) (And (Degree $x0 big very) (Member $x0 big)))

;; [joint]  support 2 (control 0)  factors 3  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. tierA-000301 tierA-000302
(Unifiable (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)))

;; [joint]  support 2 (control 0)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. tierA-000207 tierA-000208
(Unifiable (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) (And (Member $e0 answer) (Theme $e0 $x0)))

;; [joint]  support 2 (control 0)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. tierA-000363 tierA-000364
(Unifiable (Member $x0 exhausted) (And (Degree $x0 tired very) (Member $x0 tired)))

;; [joint]  support 1 (control 0)  factors 3  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. tierA-000296 tierA-000297
(Unifiable (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0)))

;; [joint]  support 1 (control 0)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. tierA-000084 tierA-000085
(Unifiable (And (Agent $e0 $x0) (Member $e0 require)) (And (Holder $e0 $x0) (Member $e0 need)))

;; [joint]  support 1 (control 0)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. tierA-000144 tierA-000145
(Unifiable (And (Member $e0 cancel) (Patient $e0 $x0)) (And (Member $e0 call_off) (Theme $e0 $x0)))

;; [joint]  support 1 (control 0)  factors 1  co-dependent  anchors $e0   gate: FAIL   e.g. tierA-000217 tierA-000218
(Unifiable (And (Member $e0 give) (Member $x0 caller) (Recipient $e0 $x0)) (Member $e0 answer))

;; [joint]  support 1 (control 0)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. tierA-000196 tierA-000197
(Unifiable (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) (And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))))

;; [joint]  support 1 (control 0)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. tierA-000196 tierA-000198
(Unifiable (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) (And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))))

;; [joint]  support 0 (control 1)  factors 1  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (Agent $e0 $x0) (And (Holder $e0 $x0) (Might $e0)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Goal $e0 $x1)) (And (Agent $e0 $x1) (Goal $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Goal $e0 $x1)) (And (Agent $e1 $x1) (Goal $e0 $x0) (Member $e1 take) (Patient $e1 $e0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Location $e0 $x1)) (And (Agent $e1 $x1) (Location $e0 $x0) (Member $e1 take) (Theme $e1 $e0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 block) (Member $x0 car) (Theme $e0 $x1)) (And (And (Agent $x2 $x0) (Member $x2 block) (Theme $x2 $x1)) ~NEG (Member $x0 automobile)))

;; [joint]  support 0 (control 1)  factors 4  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 acquire) (Ordinal $x0 <num> acquire) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 4  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) (And (Member $e0 sell) (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 3  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 acquire) (Theme $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 3  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 cross) (Member $x0 car) (Theme $e0 $x1)) (And (And (Agent $x2 $x0) (Member $x2 cross) (Theme $x2 $x1)) ~NEG (Member $x0 automobile)))

;; [joint]  support 0 (control 1)  factors 1  anchors $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 examine) (Member $x0 doctor) (Theme $e0 $x1)) (And (And (Agent $x2 $x0) (Member $x2 examine) (Theme $x2 $x1)) ~NEG (Member $x0 physician)))

;; [joint]  support 0 (control 1)  factors 4  anchors $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 leave) (Member $x0 automobile) (Theme $e0 $x1)) (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x0 car)))

;; [joint]  support 0 (control 1)  factors 3  co-dependent  anchors $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 leave) (Theme $e0 $x1)) (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors —   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Member $x0 family) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) (And (Agent $e1 north) (Member $e1 decide) (Theme $e1 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1)))))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1)) (And (Agent $e0 $x1) (Member $e0 decide) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 4  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 purchase) (Ordinal $x1 <num> purchase) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 buy) (Ordinal $x1 <num> buy) (Theme $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 3  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 buy) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors —   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Member $x0 family) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) (And (Agent $e1 north) (Member $e1 decide) (Theme $e1 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1)))))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1)) (And (Agent $e0 $x1) (Member $e0 decide) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 3  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 fix) (Patient $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 3  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 mend) (Patient $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 sign) (Member $x0 doctor) (Patient $e0 $x1)) (And (And (Agent $x2 $x0) (Member $x2 sign) (Patient $x2 $x1)) ~NEG (Member $x0 physician)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 survive)) (And (Member $e0 die) (Patient $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 survive)) (And (Member $e0 kick_the_bucket) (Patient $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 3  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $e0 teach) (Might $e0) (Recipient $e0 $x1)) (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $x0 family) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) (And (Agent $e0 north) (Theme $e0 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1)))))

;; [joint]  support 0 (control 1)  factors 3  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Member $x1 physician) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Member $x1 doctor) (Theme $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 2  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Patient $e0 $x1)) (And (Agent $e0 $x1) (Patient $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Patient $e0 $x1)) (And (Agent $e1 $x1) (Member $e1 cause) (Patient $e0 $x0) (Theme $e1 $e0)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Recipient $e0 ravi)) (And (Agent $e0 ravi) (Recipient $e0 $x0)))

;; [joint]  support 0 (control 4)  factors 2  co-dependent  anchors $e0 $x0 $x1   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 $x0) (Theme $e0 $x1)) (And (Agent $e0 $x1) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e1 $x0   gate: FAIL   e.g. 
(Unifiable (And (Agent $e0 bo) (Member $e0 work) (Theme $e0 $x0) (Theme $e1 $x0)) (And (CoAgent $e1 bo) (Location $e1 $x0) (Might $e1)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Goal $e1 $x0) (Member $e0 take) (Member $e1 walk) (Patient $e0 $e1)) (And (Goal $e0 $x0) (Member $e0 stroll)))

;; [joint]  support 0 (control 1)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Holder $e0 $x0) (Member $e0 need)) (And (Experiencer $e0 $x0) (Member $e0 require) (Might $e0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Location $e1 $x0) (Member $e0 take) (Member $e1 walk) (Theme $e0 $e1)) (And (Location $e0 $x0) (Member $e0 sprint)))

;; [joint]  support 0 (control 1)  factors 2  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 arrive) (Might $e0)) (And (Future $e0) (Member $e0 arrival)))

;; [joint]  support 0 (control 2)  factors 2  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 begin) (Might $e0)) (And (Future $e0) (Member $e0 commence)))

;; [joint]  support 0 (control 2)  factors 2  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 begin) (Might $e0)) (And (Future $e0) (Member $e0 start)))

;; [joint]  support 0 (control 2)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 cancel) (Might $e0)) (Member $e0 call_off))

;; [joint]  support 0 (control 1)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 confirm) (Theme $e0 $x0)) (And (Member $e0 call_off) (Patient $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 confirm) (Theme $e0 $x0)) (And (Member $e0 cancel) (Patient $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 give) (Member $x0 query) (Recipient $e0 $x0)) (Member $e0 answer))

;; [joint]  support 0 (control 2)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) (And (Member $e0 answer) (Might $e0) (Theme $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 lend) (Recipient $e0 $x0)) (And (Member $e0 borrow) (Source $e0 $x0)))

;; [joint]  support 0 (control 3)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)))

;; [joint]  support 0 (control 3)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 receive) (Source $e0 $x0)) (And (Member $e0 give) (Recipient $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 require) (Might $e0)) (Member $e0 need))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 save) (Theme $e0 $x0)) (And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1)))

;; [joint]  support 0 (control 2)  factors 2  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 save) (Theme $e0 $x0)) (And (Member $e0 destroy) (Patient $e0 $x0)))

;; [joint]  support 0 (control 2)  factors 2  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (And (Member $e0 teach) (Recipient $e0 $x0)) (And (Member $e0 learn) (Source $e0 $x0)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (Holder $e0 $x0) (And (Experiencer $e0 $x0) (Might $e0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 commence) (And (Member $e0 begin) (Might $e0)))

;; [joint]  support 0 (control 2)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 find_out) (And (Member $e0 discover) (Might $e0)))

;; [joint]  support 0 (control 2)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 give_up) (And (Member $e0 abandon) (Might $e0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 kick_the_bucket) (And (Member $e0 die) (Might $e0)))

;; [joint]  support 0 (control 2)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 permit) (And (Member $e0 allow) (Might $e0)))

;; [joint]  support 0 (control 2)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 put_off) (And (Member $e0 postpone) (Might $e0)))

;; [joint]  support 0 (control 1)  factors 1  anchors $e0   gate: FAIL   e.g. 
(Unifiable (Member $e0 start) (And (Member $e0 begin) (Might $e0)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (Member $e0 work) (And (CoAgent $e0 $x0) (Member $e0 compete)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 automobile) (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 car) (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 countersignature) (And (Cardinality $x0 <num>) (GroupOf $x0 countersignature)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 energetic) (And (Degree $x0 tired very) (Member $x0 tired)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 exhausted) ~NEG (And (Degree $x0 tired very) (Member $x0 tired)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 huge) ~NEG (And (Degree $x0 big very) (Member $x0 big)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 ladder) (And (Cardinality $x0 <num>) (GroupOf $x0 ladder)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 medal) (And (Cardinality $x0 <num>) (GroupOf $x0 medal)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 painting) (And (Cardinality $x0 <num>) (GroupOf $x0 painting)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 projector) (And (Cardinality $x0 <num>) (GroupOf $x0 projector)))

;; [joint]  support 0 (control 2)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 tiny) (And (Degree $x0 big very) (Member $x0 big)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $x0   gate: FAIL   e.g. 
(Unifiable (Member $x0 whistle) (And (Cardinality $x0 <num>) (GroupOf $x0 whistle)))

;; [joint]  support 0 (control 1)  factors 1  co-dependent  anchors $e0 $x0   gate: FAIL   e.g. 
(Unifiable (Theme $e0 $x0) (And (Location $e0 $x0) (Might $e0)))

;; ==================== ROLES: 2 licensed / 3 pass of 13; 6 lost-role records ====================

;; [role]  Agent ~ Recipient   support 13 (control 0)   occurrences 247 / 36   gate: LICENSED   e.g. tierA-000001 tierA-000004
(Unifiable (Recipient $e $x) (Agent $e $x))

;; [role]  Agent ~ Source   support 9 (control 0)   occurrences 247 / 9   gate: LICENSED   e.g. tierA-000261 tierA-000262
(Unifiable (Source $e $x) (Agent $e $x))

;; [role]  Theme ~ Patient   support 5 (control 3)   occurrences 200 / 65   gate: CONTESTED   e.g. tierA-000143 tierA-000145
(Unifiable (Patient $e $x) (Theme $e $x))

;; [role]  Theme ~ Recipient   support 2 (control 3)   occurrences 200 / 36   gate: FAIL   e.g. tierA-000207 tierA-000208
(Unifiable (Recipient $e $x) (Theme $e $x))

;; [role]  Agent ~ Holder   support 1 (control 0)   occurrences 247 / 11   gate: FAIL   e.g. tierA-000084 tierA-000085
(Unifiable (Holder $e $x) (Agent $e $x))

;; [role]  Agent ~ Experiencer   support 0 (control 1)   occurrences 247 / 8   gate: FAIL   e.g. 
(Unifiable (Experiencer $e $x) (Agent $e $x))

;; [role]  Agent ~ Goal   support 0 (control 1)   occurrences 247 / 4   gate: FAIL   e.g. 
(Unifiable (Goal $e $x) (Agent $e $x))

;; [role]  Agent ~ Location   support 0 (control 1)   occurrences 247 / 36   gate: FAIL   e.g. 
(Unifiable (Location $e $x) (Agent $e $x))

;; [role]  Agent ~ Patient   support 0 (control 5)   occurrences 247 / 65   gate: FAIL   e.g. 
(Unifiable (Patient $e $x) (Agent $e $x))

;; [role]  Agent ~ Theme   support 0 (control 5)   occurrences 247 / 200   gate: FAIL   e.g. 
(Unifiable (Theme $e $x) (Agent $e $x))

;; [role]  Holder ~ Experiencer   support 0 (control 1)   occurrences 11 / 8   gate: FAIL   e.g. 
(Unifiable (Experiencer $e $x) (Holder $e $x))

;; [role]  Recipient ~ Source   support 0 (control 5)   occurrences 36 / 9   gate: FAIL   e.g. 
(Unifiable (Source $e $x) (Recipient $e $x))

;; [role]  Theme ~ Location   support 0 (control 2)   occurrences 200 / 36   gate: FAIL   e.g. 
(Unifiable (Location $e $x) (Theme $e $x))

;; [role-lost]  Agent ~ none   support 6 (control 2)   gate: PASS   e.g. tierA-000173 tierA-000174
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; [role-lost]  CoAgent ~ none   support 4 (control 0)   gate: PASS   e.g. tierA-000311 tierA-000312
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; [role-lost]  Theme ~ none   support 4 (control 2)   gate: PASS   e.g. tierA-000185 tierA-000186
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; [role-lost]  Goal ~ none   support 0 (control 1)   gate: FAIL   e.g. 
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; [role-lost]  Location ~ none   support 0 (control 2)   gate: FAIL   e.g. 
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; [role-lost]  Patient ~ none   support 0 (control 2)   gate: FAIL   e.g. 
;;   the other side has no atom on the aligned centre and filler (see the one-sided records)

;; ==================== ONE-SIDED (diagnostic): 2 pass of 155 ====================

;; [one-sided]  support 6 (control 0)   occurrences 9   reattach 9   head on other side 9   anchors $e0 $x0   gate: PASS   e.g. tierA-000173 tierA-000174
(OneSided (Agent $e0 $x0))

;; [one-sided]  support 3 (control 0)   occurrences 6   reattach 6   head on other side 0   anchors $e1 $x0   gate: PASS   e.g. tierA-000222 tierA-000223
(OneSided (And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1)))

;; [one-sided]  support 2 (control 0)   occurrences 5   reattach 0   head on other side 5   anchors $x0 $x1   gate: FAIL   e.g. tierA-000315 tierA-000316
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work)))

;; [one-sided]  support 2 (control 0)   occurrences 2   reattach 2   head on other side 0   anchors $e1 $x0   gate: FAIL   e.g. tierA-000173 tierA-000174
(OneSided (And (Agent $e0 $x0) (Member $e0 take) (Theme $e0 $e1)))

;; [one-sided]  support 2 (control 0)   occurrences 3   reattach 0   head on other side 0   anchors $e0 $x0   gate: FAIL   e.g. tierA-000315 tierA-000316
(OneSided (CoAgent $e0 $x0))

;; [one-sided]  support 1 (control 0)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. tierA-000072 tierA-000073
(OneSided (And (Agent $e0 $x0) (Member $e0 permit) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday))))

;; [one-sided]  support 1 (control 0)   occurrences 3   reattach 0   head on other side 0   anchors feed_pipe   gate: FAIL   e.g. tierA-000046 tierA-000049
(OneSided (And (Agent $e0 $x0) (Member $e0 repair) (Member $x0 crew) (Member $x1 cracked) (Member $x1 feed_pipe) (Patient $e0 $x1)))

;; [one-sided]  support 1 (control 0)   occurrences 1   reattach 1   head on other side 0   anchors $e1 $x0   gate: FAIL   e.g. tierA-000181 tierA-000182
(OneSided (And (Agent $e0 $x0) (Member $e0 take) (Patient $e0 $e1)))

;; [one-sided]  support 1 (control 0)   occurrences 2   reattach 0   head on other side 1   anchors $x0   gate: FAIL   e.g. tierA-000311 tierA-000312
(OneSided (And (Agent $e0 bo) (Member $e0 work) (Theme $e0 $x0)))

;; [one-sided]  support 1 (control 0)   occurrences 3   reattach 0   head on other side 2   anchors $x0   gate: FAIL   e.g. tierA-000323 tierA-000324
(OneSided (And (Agent $e0 nils) (Location $e0 $x0) (Member $e0 work)))

;; [one-sided]  support 1 (control 0)   occurrences 3   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. tierA-000371 tierA-000372
(OneSided (And (Degree diver tired very) (Inheritance diver tired)))

;; [one-sided]  support 1 (control 0)   occurrences 1   reattach 0   head on other side 0   anchors $e0   gate: FAIL   e.g. tierA-000311 tierA-000312
(OneSided (CoAgent $e0 bo))

;; [one-sided]  support 1 (control 0)   occurrences 2   reattach 0   head on other side 0   anchors $e0   gate: FAIL   e.g. tierA-000323 tierA-000324
(OneSided (CoAgent $e0 nils))

;; [one-sided]  support 1 (control 0)   occurrences 3   reattach 0   head on other side 1   anchors —   gate: FAIL   e.g. tierA-000371 tierA-000372
(OneSided (Inheritance diver exhausted))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x2 projector) (Past $e0) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x2 projector) (Past $e0) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x2 projector) (Past $e0) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (CoAgent $e0 $x2) (Location $e0 $x1) (Member $e0 work) (Member $x0 welder) (Member $x2 fitter)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive) (Time $e0 (Hour <num>))))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $e0 acquire) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $e0 buy) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $e0 purchase) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Instrument $e0 post) (Member $e0 arrival)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Instrument $e0 post) (Member $e0 arrive)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 allow) (Theme $e0 photography)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 permit) (Theme $e0 photography)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 fitter)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 welder)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Location $e1 $x1) (Member $e0 take) (Member $e1 walk) (Theme $e0 $e1)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 allow) (Member $x0 warden) (Might $e0) (Theme $e0 visitor) (Time $e0 (Weekday sunday))))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 night_delivery   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 allow) (Theme $e0 night_delivery)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 block) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1 $x2   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 call_off) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 call_off) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 2)   occurrences 3   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 cancel) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x1) (Theme $e0 $e1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 cross) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 new) (Member $x1 roof) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 find_out) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 fix) (Member $x1 gearbox) (Member $x1 seized) (Past $e0) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 forbid) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday))))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 foreman) (Member $x2 driver) (Recipient $e0 $x2) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Member $x2 medal) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Member $x1 recruit) (Member $x2 whistle) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 give) (Member $x2 answer) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 coach) (Member $x2 drill) (Source $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 elder) (Member $x2 song) (Source $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1 $x2   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Member $x1 new) (Member $x1 roof) (Patient $e0 $e1) (Theme $e1 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 mend) (Member $x1 gearbox) (Member $x1 seized) (Past $e0) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 night_delivery   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 permit) (Theme $e0 night_delivery)))

;; [one-sided]  support 0 (control 2)   occurrences 3   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Member $x1 new) (Member $x1 roof) (Theme $e0 $e1) (Theme $e1 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 driver) (Member $x2 foreman) (Source $e0 $x2) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit) (Member $x1 trainer) (Member $x2 whistle) (Source $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 medal) (Member $x2 school) (Source $e0 $x2) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors feed_pipe   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 repair) (Member $x0 cracked) (Member $x0 feed_pipe) (Member $x1 crew) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 repair) (Member $x1 gearbox) (Member $x1 seized) (Past $e0) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 sign) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 coach) (Member $x2 drill) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Member $x2 song) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 ana) (CoAgent $e0 bo) (Member $e0 work) (Theme $e0 $x0)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 ana) (Member $e0 work) (Theme $e0 $x0)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 dara) (CoAgent $e0 nils) (Location $e0 $x0) (Member $e0 work)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $e0 dara) (Location $e0 $x0) (Member $e0 work)))

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Agent $x0 $x1) (Member $x0 give) (Member $x1 trainer) (Member $x2 whistle) (Member $x3 recruit) (Recipient $x0 $x3) (Theme $x0 $x2)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 5   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (CardinalityPhrase $x2 <str>) (GroupOf $x2 lemon) (Member $x1 buy) (Member $x2 crate) (Past $x1) (Theme $x1 $x2)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (Future $x1) (Member $x1 arrive) (Time $x1 (Hour <num>))) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 night_delivery   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (Member $x1 allow) (Theme $x1 night_delivery)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (Member $x1 decide) (Member $x2 new) (Member $x2 roof) (Theme $x1 $x2)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (Member $x1 decide) (Theme $x1 (And (Agent $x2 $x0) (Goal $x2 north) (Member $x2 move)))) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 4   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x0) (Member $x1 repair) (Member $x2 gearbox) (Member $x2 seized) (Past $x1) (Patient $x1 $x2)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x2) (CoAgent $x1 $x3) (Location $x1 $x0) (Member $x1 work) (Member $x2 welder) (Member $x3 fitter)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x2) (Member $x1 give) (Member $x2 foreman) (Member $x3 driver) (Recipient $x1 $x3) (Theme $x1 $x0)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x2) (Member $x1 give) (Member $x2 school) (Member $x3 medal) (Recipient $x1 $x0) (Theme $x1 $x3)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x2) (Member $x1 teach) (Member $x2 coach) (Member $x3 drill) (Recipient $x1 $x0) (Theme $x1 $x3)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 $x2) (Member $x1 teach) (Member $x2 elder) (Member $x3 song) (Recipient $x1 $x0) (Theme $x1 $x3)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 ana) (CoAgent $x1 bo) (Location $x1 $x0) (Member $x1 work)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Agent $x1 dara) (CoAgent $x1 nils) (Location $x1 $x0) (Member $x1 work)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 5   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Beneficiary $x2 $x1) (Member $x2 buy) (Member $x3 projector) (Past $x2) (Theme $x2 $x3)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Location $x2 $x1) (Member $x2 allow) (Theme $x2 photography)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Location $x2 $x1) (Member $x2 walk)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 abandon) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 answer) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 block) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 cancel) (Patient $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 cross) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 4   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 decide) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 destroy) (Patient $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 discover) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 examine) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 5   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 postpone) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 reject) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 repair) (Patient $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Agent $x2 $x0) (Member $x2 sign) (Patient $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 6   reattach 0   head on other side 0   anchors $x0 $x1 $x2   gate: FAIL   e.g. 
(OneSided (And (Agent $x3 $x0) (Member $x3 lend) (Recipient $x3 $x1) (Theme $x3 $x2)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors feed_pipe   gate: FAIL   e.g. 
(OneSided (And (And (Agent $x0 $x1) (Member $x0 repair) (Patient $x0 $x2)) ~NEG (Member $x1 crew) (Member $x2 cracked) (Member $x2 feed_pipe)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Before $x0 $e0) (Future $e0) (Member $e0 begin) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Before $x0 $e0) (Future $e0) (Member $e0 commence) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Before $x0 $e0) (Future $e0) (Member $e0 start) (Patient $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Before $x0 $x2) (Future $x2) (Member $x2 begin) (Patient $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x2 projector) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x2)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $e0 $x0   gate: FAIL   e.g. 
(OneSided (And (Experiencer $e1 $x0) (Member $e1 discover) (Stimulus $e1 $e0)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $e0 $x0   gate: FAIL   e.g. 
(OneSided (And (Experiencer $e1 $x0) (Member $e1 find_out) (Stimulus $e1 $e0)))

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $e0 $x0   gate: FAIL   e.g. 
(OneSided (And (Experiencer $x1 $x0) (Member $x1 discover) (Stimulus $x1 $e0)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0 monthly_servicing   gate: FAIL   e.g. 
(OneSided (And (Experiencer $x1 $x0) (Member $x1 require) (Theme $x1 monthly_servicing)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (GroupOf $x1 lemon) (Member $e0 sell) (Member $x1 crate) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Holder $e0 $x0) (Member $e0 need) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0 monthly_servicing   gate: FAIL   e.g. 
(OneSided (And (Holder $e0 $x0) (Member $e0 need) (Theme $e0 monthly_servicing)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0 monthly_servicing   gate: FAIL   e.g. 
(OneSided (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 monthly_servicing)))

;; [one-sided]  support 0 (control 1)   occurrences 3   reattach 0   head on other side 0   anchors $x0 $x1   gate: FAIL   e.g. 
(OneSided (And (Holder $x2 $x0) (Member $x2 require) (Theme $x2 $x1)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Measure $x0 age <num> year) (Member $x1 die) (Patient $x1 $x0)) ~NEG)

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Member $e0 begin) (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Member $e0 commence) (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Member $e0 die) (Patient $e0 $x0) (Time $e0 that_autumn)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Member $e0 die) (Patient $e0 $x0)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Member $e0 kick_the_bucket) (Patient $e0 $x0) (Time $e0 that_autumn)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Member $e0 kick_the_bucket) (Patient $e0 $x0)))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors —   gate: FAIL   e.g. 
(OneSided (And (Member $e0 start) (Member $x0 hearing) (Patient $e0 $x0) (Time $e0 (Weekday monday)) (Time $e0 morning)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (And (Member $x1 die) (Patient $x1 $x0) (Time $x1 that_autumn)) ~NEG)

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Degree $x0 big very))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Degree $x0 tired very))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Measure $x0 age <num> year))

;; [one-sided]  support 0 (control 4)   occurrences 4   reattach 0   head on other side 4   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 big))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 2   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 difficult))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 1   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 exhausted))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 2   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 hard))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 2   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 huge))

;; [one-sided]  support 0 (control 2)   occurrences 2   reattach 0   head on other side 2   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 large))

;; [one-sided]  support 0 (control 1)   occurrences 1   reattach 0   head on other side 1   anchors $x0   gate: FAIL   e.g. 
(OneSided (Member $x0 tired))

;; [one-sided]  support 0 (control 21)   occurrences 36   reattach 0   head on other side 0   anchors $e0   gate: FAIL   e.g. 
(OneSided (Might $e0))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Might (Member $x0 difficult)))

;; [one-sided]  support 0 (control 1)   occurrences 2   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Might (Member $x0 exhausted)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Might (Member $x0 huge)))

;; [one-sided]  support 0 (control 2)   occurrences 4   reattach 0   head on other side 0   anchors $x0   gate: FAIL   e.g. 
(OneSided (Might (Member $x0 large)))
