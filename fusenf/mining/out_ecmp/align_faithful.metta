;; FUSE-NF §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a unit is a conjunctive query over variables, not an assertion. The record of truth is
;;   align_faithful.jsonl   (every mapping: unit / role / residue / profile, with support, control support, examples)
;;   align_faithful_pairs.jsonl   (one line per pair: the renaming, matched / near / unmatched atoms, quality)
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   pairs           413 paraphrase pairs + 468 control pairs from ../corpora/tierA.jsonl, ../corpora/tierC.jsonl; control support of a
;;                   mapping = classes where it occurs in a control pair but in none of the class's paraphrase pairs (a measurement column)
;;                   over out_ecmp/canonical_iteme.jsonl; 113 paraphrase pairs parse identically
;;   alignment       exact maximum-common-subgraph: every injective skolem renaming within each stream, maximising identical
;;                   atoms then near-identical atoms (one head or constant differs), first renaming on a tie;
;;                   greedy assignment above 5040 renamings (0 pairs)
;;   subtrees        the 1652 §4.3.1 faithful units instantiated on each side (k = 4)
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

;; ==================== UNIT MAPPINGS: 124 pass of 1298 non-identity mappings (977 shape-parallel) ====================

;; [unit, shape-parallel]  p200004 ~ p200071   support 12 (control 1)   gate: PASS
;;   A: (Agent $e0 $x0)   e.g. tierA-000001 tierA-000004
;;   B: (Recipient $e0 $x0)
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrRecipient $e0 $x0))
(Implication (Recipient $e0 $x0) (MnAgentOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p200015 ~ p200091   support 11 (control 1)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200004 ~ p200355   support 10 (control 0)   gate: PASS
;;   A: (Agent $e0 $x0)   e.g. tierC-000257 tierC-000258
;;   B: (Source $e0 $x0)
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrSource $e0 $x0))
(Implication (Source $e0 $x0) (MnAgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p200015 ~ p200490   support 9 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200099 ~ p200561   support 8 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_RecipientOrSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Source $e0 $x1)) (MnAgent_RecipientOrSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200136 ~ p200665   support 7 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_RecipientOrSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_RecipientOrSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p200249 ~ p203271   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p200249 ~ p203272   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p200249 ~ p203282   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnPast_Theme_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnPast_Theme_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200250 ~ p203395   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0)) (MnAgent_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p200250 ~ p203400   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnAgent_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0)) (MnAgent_Past_BuyOrPurchase $e0 $x0))

;; [unit]  p200250 ~ p203438   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnPast_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0)) (MnPast_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p200251 ~ p203396   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p200251 ~ p203401   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p200251 ~ p203440   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnTheme_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200255 ~ p203616   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnAgent_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire)) (MnAgent_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p200255 ~ p203621   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnAgent_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase)) (MnAgent_BuyOrPurchase $e0 $x0))

;; [unit]  p200255 ~ p203714   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnOrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0)) (MnOrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p200482 ~ p203619   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))   e.g. tierA-000185 tierA-000186
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   substitution: (Member $e0 make) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (MnAgent_DecideOrMake $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_DecideOrMake $e0 $x0))

;; [unit, shape-parallel]  p200482 ~ p203622   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 decide))   e.g. tierA-000185 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e0 reach))
;;   substitution: (Member $e0 reach) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (MnAgent_DecideOrReach $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 reach)) (MnAgent_DecideOrReach $e0 $x0))

;; [unit, shape-parallel]  p203272 ~ p203271   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000002 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_PurchaseOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_PurchaseOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p203400 ~ p203395   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))   e.g. tierA-000002 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0)) (MnAgent_Past_PurchaseOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0)) (MnAgent_Past_PurchaseOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p203401 ~ p203396   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))   e.g. tierA-000002 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) (MnAgent_Theme_PurchaseOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1)) (MnAgent_Theme_PurchaseOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p203621 ~ p203616   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 purchase))   e.g. tierA-000002 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Agent $e0 $x0) (Member $e0 purchase)) (MnAgent_PurchaseOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire)) (MnAgent_PurchaseOrAcquire $e0 $x0))

;; [unit]  p201921 ~ p201920   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1))
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1)) (MnAgent_Member_OrMemberPatient $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1)) (MnAgent_Member_OrMemberPatient $e0 $x0 $e1))

;; [unit]  p203402 ~ p203398   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1))
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1)) (MnAgent_OrMemberPatient $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1)) (MnAgent_OrMemberPatient $e0 $x0 $e1))

;; [unit, shape-parallel]  p203622 ~ p203619   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reach))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
;;   substitution: (Member $e0 make) -> (Member $e0 reach)
(Implication (And (Agent $e0 $x0) (Member $e0 reach)) (MnAgent_ReachOrMake $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnAgent_ReachOrMake $e0 $x0))

;; [unit, shape-parallel]  p202782 ~ p202781   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1))
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $e1))

;; [unit, shape-parallel]  p200073 ~ p203451   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnPast_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnPast_Theme_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200033 ~ p203757   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrRecipient $e0 $x0))
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_AgentOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p200400 ~ p201689   support 4 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Patient $e0 $e1))
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (MnAgent_ThemeOrPatient $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Patient $e0 $e1)) (MnAgent_ThemeOrPatient $e0 $x0 $e1))

;; [unit, shape-parallel]  p200832 ~ p203696   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 begin) (Patient $e0 $x0))   e.g. tierA-000052 tierA-000054
;;   B: (And (Member $e0 commence) (Patient $e0 $x0))
;;   substitution: (Member $e0 commence) -> (Member $e0 begin)
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnPatient_BeginOrCommence $e0 $x0))
(Implication (And (Member $e0 commence) (Patient $e0 $x0)) (MnPatient_BeginOrCommence $e0 $x0))

;; [unit, shape-parallel]  p200832 ~ p203717   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 begin) (Patient $e0 $x0))   e.g. tierA-000052 tierA-000053
;;   B: (And (Member $e0 start) (Patient $e0 $x0))
;;   substitution: (Member $e0 start) -> (Member $e0 begin)
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnPatient_BeginOrStart $e0 $x0))
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnPatient_BeginOrStart $e0 $x0))

;; [unit, shape-parallel]  p200252 ~ p203433   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p200252 ~ p203437   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p200252 ~ p203439   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrSell $e0 $x0))
(Implication (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p200256 ~ p203691   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0)) (MnPast_BuyOrAcquire $e0))
(Implication (And (Member $e0 acquire) (Past $e0)) (MnPast_BuyOrAcquire $e0))

;; [unit, shape-parallel]  p200256 ~ p203709   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Member $e0 purchase) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0)) (MnPast_BuyOrPurchase $e0))
(Implication (And (Member $e0 purchase) (Past $e0)) (MnPast_BuyOrPurchase $e0))

;; [unit, shape-parallel]  p200256 ~ p203713   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Past $e0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Past $e0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Past $e0)) (MnPast_BuyOrSell $e0))
(Implication (And (Member $e0 sell) (Past $e0)) (MnPast_BuyOrSell $e0))

;; [unit, shape-parallel]  p200257 ~ p203692   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_BuyOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Theme $e0 $x0)) (MnTheme_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p200257 ~ p203710   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Member $e0 purchase) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_BuyOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Theme $e0 $x0)) (MnTheme_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p200257 ~ p203715   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_BuyOrSell $e0 $x0))
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnTheme_BuyOrSell $e0 $x0))

;; [unit]  p202877 ~ p202876   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0))
(Implication (And (Member $e0 decision) (Member $e1 reach) (Theme $e1 $e0)) (MnMember_OrMemberPatient $e0 $e1))
(Implication (And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0)) (MnMember_OrMemberPatient $e0 $e1))

;; [unit, shape-parallel]  p203698 ~ p203697   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 decision) (Theme $e1 $e0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 decision) (Patient $e1 $e0))
;;   substitution: (Patient $e1 $e0) -> (Theme $e1 $e0)
(Implication (And (Member $e0 decision) (Theme $e1 $e0)) (MnMember_ThemeOrPatient $e0 $e1))
(Implication (And (Member $e0 decision) (Patient $e1 $e0)) (MnMember_ThemeOrPatient $e0 $e1))

;; [unit, shape-parallel]  p203437 ~ p203433   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000002 tierA-000003
;;   B: (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_PurchaseOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_PurchaseOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p203709 ~ p203691   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 purchase) (Past $e0))   e.g. tierA-000002 tierA-000003
;;   B: (And (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Member $e0 purchase) (Past $e0)) (MnPast_PurchaseOrAcquire $e0))
(Implication (And (Member $e0 acquire) (Past $e0)) (MnPast_PurchaseOrAcquire $e0))

;; [unit, shape-parallel]  p203710 ~ p203692   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 purchase) (Theme $e0 $x0))   e.g. tierA-000002 tierA-000003
;;   B: (And (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (And (Member $e0 purchase) (Theme $e0 $x0)) (MnTheme_PurchaseOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Theme $e0 $x0)) (MnTheme_PurchaseOrAcquire $e0 $x0))

;; [unit]  p203711 ~ p203705   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 reach) (Theme $e0 $e1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 make) (Patient $e0 $e1))
(Implication (And (Member $e0 reach) (Theme $e0 $e1)) (MnOrMemberPatient $e0 $e1))
(Implication (And (Member $e0 make) (Patient $e0 $e1)) (MnOrMemberPatient $e0 $e1))

;; [unit]  p203282 ~ p203271   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000003 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnPast_Theme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1)) (MnPast_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p203282 ~ p203272   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000002 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnPast_Theme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1)) (MnPast_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p203438 ~ p203395   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))   e.g. tierA-000003 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit]  p203438 ~ p203400   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))   e.g. tierA-000002 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p203439 ~ p203433   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000003 tierA-000004
;;   B: (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_SellOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_SellOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p203439 ~ p203437   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000002 tierA-000004
;;   B: (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_SellOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_SellOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p203713 ~ p203691   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0))   e.g. tierA-000003 tierA-000004
;;   B: (And (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Past $e0)) (MnPast_SellOrAcquire $e0))
(Implication (And (Member $e0 acquire) (Past $e0)) (MnPast_SellOrAcquire $e0))

;; [unit, shape-parallel]  p203713 ~ p203709   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Past $e0))   e.g. tierA-000002 tierA-000004
;;   B: (And (Member $e0 purchase) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Past $e0)) (MnPast_SellOrPurchase $e0))
(Implication (And (Member $e0 purchase) (Past $e0)) (MnPast_SellOrPurchase $e0))

;; [unit]  p203440 ~ p203396   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000003 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p203440 ~ p203401   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000002 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p203714 ~ p203616   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Recipient $e0 $x0))   e.g. tierA-000003 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire)) (MnOrAgentMember $e0 $x0))

;; [unit]  p203714 ~ p203621   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Recipient $e0 $x0))   e.g. tierA-000002 tierA-000004
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p203715 ~ p203692   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Theme $e0 $x0))   e.g. tierA-000003 tierA-000004
;;   B: (And (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnTheme_SellOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Theme $e0 $x0)) (MnTheme_SellOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p203715 ~ p203710   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 sell) (Theme $e0 $x0))   e.g. tierA-000002 tierA-000004
;;   B: (And (Member $e0 purchase) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 sell)
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnTheme_SellOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Theme $e0 $x0)) (MnTheme_SellOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p203717 ~ p203696   support 4 (control 0)   gate: PASS
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. tierA-000053 tierA-000054
;;   B: (And (Member $e0 commence) (Patient $e0 $x0))
;;   substitution: (Member $e0 commence) -> (Member $e0 start)
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnPatient_StartOrCommence $e0 $x0))
(Implication (And (Member $e0 commence) (Patient $e0 $x0)) (MnPatient_StartOrCommence $e0 $x0))

;; [unit, shape-parallel]  p200573 ~ p203875   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierA-000052 tierA-000054
;;   B: (Member $e0 commence)
;;   substitution: (Member $e0 commence) -> (Member $e0 begin)
(Implication (Member $e0 begin) (MnBeginOrCommence $e0))
(Implication (Member $e0 commence) (MnBeginOrCommence $e0))

;; [unit, shape-parallel]  p200573 ~ p201140   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 begin)   e.g. tierA-000052 tierA-000053
;;   B: (Member $e0 start)
;;   substitution: (Member $e0 start) -> (Member $e0 begin)
(Implication (Member $e0 begin) (MnBeginOrStart $e0))
(Implication (Member $e0 start) (MnBeginOrStart $e0))

;; [unit, shape-parallel]  p200259 ~ p203871   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierA-000001 tierA-000003
;;   B: (Member $e0 acquire)
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (Member $e0 buy) (MnBuyOrAcquire $e0))
(Implication (Member $e0 acquire) (MnBuyOrAcquire $e0))

;; [unit, shape-parallel]  p200259 ~ p203888   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierA-000001 tierA-000002
;;   B: (Member $e0 purchase)
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (Member $e0 buy) (MnBuyOrPurchase $e0))
(Implication (Member $e0 purchase) (MnBuyOrPurchase $e0))

;; [unit, shape-parallel]  p200259 ~ p201139   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 buy)   e.g. tierA-000001 tierA-000004
;;   B: (Member $e0 sell)
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (Member $e0 buy) (MnBuyOrSell $e0))
(Implication (Member $e0 sell) (MnBuyOrSell $e0))

;; [unit, shape-parallel]  p200410 ~ p203884   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 decide)   e.g. tierA-000185 tierA-000186
;;   B: (Member $e0 make)
;;   substitution: (Member $e0 make) -> (Member $e0 decide)
(Implication (Member $e0 decide) (MnDecideOrMake $e0))
(Implication (Member $e0 make) (MnDecideOrMake $e0))

;; [unit, shape-parallel]  p200410 ~ p203889   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 decide)   e.g. tierA-000185 tierA-000187
;;   B: (Member $e0 reach)
;;   substitution: (Member $e0 reach) -> (Member $e0 decide)
(Implication (Member $e0 decide) (MnDecideOrReach $e0))
(Implication (Member $e0 reach) (MnDecideOrReach $e0))

;; [unit, shape-parallel]  p203888 ~ p203871   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 purchase)   e.g. tierA-000002 tierA-000003
;;   B: (Member $e0 acquire)
;;   substitution: (Member $e0 acquire) -> (Member $e0 purchase)
(Implication (Member $e0 purchase) (MnPurchaseOrAcquire $e0))
(Implication (Member $e0 acquire) (MnPurchaseOrAcquire $e0))

;; [unit, shape-parallel]  p203889 ~ p203884   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 reach)   e.g. tierA-000186 tierA-000187
;;   B: (Member $e0 make)
;;   substitution: (Member $e0 make) -> (Member $e0 reach)
(Implication (Member $e0 reach) (MnReachOrMake $e0))
(Implication (Member $e0 make) (MnReachOrMake $e0))

;; [unit, shape-parallel]  p201139 ~ p203871   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 sell)   e.g. tierA-000003 tierA-000004
;;   B: (Member $e0 acquire)
;;   substitution: (Member $e0 acquire) -> (Member $e0 sell)
(Implication (Member $e0 sell) (MnSellOrAcquire $e0))
(Implication (Member $e0 acquire) (MnSellOrAcquire $e0))

;; [unit, shape-parallel]  p201139 ~ p203888   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 sell)   e.g. tierA-000002 tierA-000004
;;   B: (Member $e0 purchase)
;;   substitution: (Member $e0 purchase) -> (Member $e0 sell)
(Implication (Member $e0 sell) (MnSellOrPurchase $e0))
(Implication (Member $e0 purchase) (MnSellOrPurchase $e0))

;; [unit, shape-parallel]  p201140 ~ p203875   support 4 (control 0)   gate: PASS
;;   A: (Member $e0 start)   e.g. tierA-000053 tierA-000054
;;   B: (Member $e0 commence)
;;   substitution: (Member $e0 commence) -> (Member $e0 start)
(Implication (Member $e0 start) (MnStartOrCommence $e0))
(Implication (Member $e0 commence) (MnStartOrCommence $e0))

;; [unit, shape-parallel]  p200219 ~ p201151   support 4 (control 0)   gate: PASS
;;   A: (Theme $e0 $e1)   e.g. tierA-000186 tierA-000187
;;   B: (Patient $e0 $e1)
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (Theme $e0 $e1) (MnThemeOrPatient $e0 $e1))
(Implication (Patient $e0 $e1) (MnThemeOrPatient $e0 $e1))

;; [unit, shape-parallel]  p200661 ~ p205374   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))   e.g. tierA-000099 tierA-000100
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1)) (MnAgent_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p200675 ~ p205530   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))   e.g. tierA-000099 tierA-000100
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon)) (MnAgent_AbandonOrGiveUp $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up)) (MnAgent_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p200558 ~ p205526   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel))   e.g. tierA-000143 tierA-000144
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_CancelOrCallOff $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off)) (MnAgent_CancelOrCallOff $e0 $x0))

;; [unit]  p200326 ~ p205313   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p200329 ~ p205379   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200330 ~ p205409   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200338 ~ p200481   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 give))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $e0 answer))
;;   substitution: (Member $e0 answer) -> (Member $e0 give)
(Implication (And (Agent $e0 $x0) (Member $e0 give)) (MnAgent_GiveOrAnswer $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 answer)) (MnAgent_GiveOrAnswer $e0 $x0))

;; [unit]  p200338 ~ p205614   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 give))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $e0 receive) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 receive) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit]  p200551 ~ p205402   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200559 ~ p205598   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 lend))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 borrow) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p200807 ~ p205378   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))   e.g. tierA-000114 tierA-000115
;;   B: (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Theme_PostponeOrPutOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1)) (MnAgent_Theme_PostponeOrPutOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p200824 ~ p205534   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone))   e.g. tierA-000114 tierA-000115
;;   B: (And (Agent $e0 $x0) (Member $e0 put_off))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone)) (MnAgent_PostponeOrPutOff $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 put_off)) (MnAgent_PostponeOrPutOff $e0 $x0))

;; [unit]  p204067 ~ p204062   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x1)) (MnAgent_Theme_OrMemberPatient $e0 $x0 $e1 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x1)) (MnAgent_Theme_OrMemberPatient $e0 $x0 $e1 $x1))

;; [unit, shape-parallel]  p200663 ~ p205381   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))   e.g. tierA-000158 tierA-000159
;;   B: (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1))
;;   substitution: (Member $e0 turn_down) -> (Member $e0 reject)
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Theme_RejectOrTurnDown $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1)) (MnAgent_Theme_RejectOrTurnDown $e0 $x0 $x1))

;; [unit, shape-parallel]  p200677 ~ p205536   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))   e.g. tierA-000158 tierA-000159
;;   B: (And (Agent $e0 $x0) (Member $e0 turn_down))
;;   substitution: (Member $e0 turn_down) -> (Member $e0 reject)
(Implication (And (Agent $e0 $x0) (Member $e0 reject)) (MnAgent_RejectOrTurnDown $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 turn_down)) (MnAgent_RejectOrTurnDown $e0 $x0))

;; [unit]  p200471 ~ p205376   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200483 ~ p205611   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $e0 learn) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p204077 ~ p204076   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1))
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1)) (MnAgent_Member_Theme_ThemeOrPatient $e0 $x0 $e1 $x1))
(Implication (And (Agent $e0 $x0) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1)) (MnAgent_Member_Theme_ThemeOrPatient $e0 $x0 $e1 $x1))

;; [unit, shape-parallel]  p200679 ~ p205540   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Member $x0 physician))   e.g. tierA-000375 tierA-000376
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor))
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (Member $x0 physician)) (MnAgent_PhysicianOrDoctor $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnAgent_PhysicianOrDoctor $e0 $x0))

;; [unit, shape-parallel]  p204950 ~ p204948   support 3 (control 0)   gate: PASS
;;   A: (And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $x1))   e.g. tierA-000186 tierA-000187
;;   B: (And (Agent $e0 $x0) (Patient $e0 $e1) (Theme $e1 $x1))
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $x1)) (MnAgent_Theme_ThemeOrPatient $e0 $x0 $e1 $x1))
(Implication (And (Agent $e0 $x0) (Patient $e0 $e1) (Theme $e1 $x1)) (MnAgent_Theme_ThemeOrPatient $e0 $x0 $e1 $x1))

;; [unit, shape-parallel]  p200683 ~ p205582   support 3 (control 0)   gate: PASS
;;   A: (And (Holder $e0 $x0) (Member $e0 require))   e.g. tierA-000085 tierA-000086
;;   B: (And (Holder $e0 $x0) (Member $e0 need))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require)) (MnHolder_RequireOrNeed $e0 $x0))
(Implication (And (Holder $e0 $x0) (Member $e0 need)) (MnHolder_RequireOrNeed $e0 $x0))

;; [unit, shape-parallel]  p200685 ~ p205610   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 abandon) (Theme $e0 $x0))   e.g. tierA-000099 tierA-000100
;;   B: (And (Member $e0 give_up) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Theme $e0 $x0)) (MnTheme_AbandonOrGiveUp $e0 $x0))
(Implication (And (Member $e0 give_up) (Theme $e0 $x0)) (MnTheme_AbandonOrGiveUp $e0 $x0))

;; [unit]  p204180 ~ p204179   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 decision) (Member $e1 reach) (Theme $e0 $x0) (Theme $e1 $e0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0) (Theme $e0 $x0))
(Implication (And (Member $e0 decision) (Member $e1 reach) (Theme $e0 $x0) (Theme $e1 $e0)) (MnMember_Theme_OrMemberPatient $e0 $e1 $x0))
(Implication (And (Member $e0 decision) (Member $e1 make) (Patient $e1 $e0) (Theme $e0 $x0)) (MnMember_Theme_OrMemberPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p205405 ~ p205404   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 decision) (Theme $e0 $x0) (Theme $e1 $e0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 decision) (Patient $e1 $e0) (Theme $e0 $x0))
;;   substitution: (Patient $e1 $e0) -> (Theme $e1 $e0)
(Implication (And (Member $e0 decision) (Theme $e0 $x0) (Theme $e1 $e0)) (MnMember_Theme_ThemeOrPatient $e0 $x0 $e1))
(Implication (And (Member $e0 decision) (Patient $e1 $e0) (Theme $e0 $x0)) (MnMember_Theme_ThemeOrPatient $e0 $e1 $x0))

;; [unit]  p200332 ~ p205380   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p200340 ~ p205535   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive))
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 receive)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p200341 ~ p201709   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 give) (Theme $e0 $x0))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $e0 receive) (Theme $e0 $x0))
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (And (Member $e0 give) (Theme $e0 $x0)) (MnTheme_GiveOrReceive $e0 $x0))
(Implication (And (Member $e0 receive) (Theme $e0 $x0)) (MnTheme_GiveOrReceive $e0 $x0))

;; [unit, shape-parallel]  p200488 ~ p201706   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Theme $e0 $x0))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Member $e0 lend) (Theme $e0 $x0)) (MnTheme_LendOrBorrow $e0 $x0))
(Implication (And (Member $e0 borrow) (Theme $e0 $x0)) (MnTheme_LendOrBorrow $e0 $x0))

;; [unit, shape-parallel]  p200836 ~ p205613   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 postpone) (Theme $e0 $x0))   e.g. tierA-000114 tierA-000115
;;   B: (And (Member $e0 put_off) (Theme $e0 $x0))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Member $e0 postpone) (Theme $e0 $x0)) (MnTheme_PostponeOrPutOff $e0 $x0))
(Implication (And (Member $e0 put_off) (Theme $e0 $x0)) (MnTheme_PostponeOrPutOff $e0 $x0))

;; [unit]  p205028 ~ p205024   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x0))
(Implication (And (Member $e0 reach) (Theme $e0 $e1) (Theme $e1 $x0)) (MnTheme_OrMemberPatient $e0 $e1 $x0))
(Implication (And (Member $e0 make) (Patient $e0 $e1) (Theme $e1 $x0)) (MnTheme_OrMemberPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p200687 ~ p205618   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 reject) (Theme $e0 $x0))   e.g. tierA-000158 tierA-000159
;;   B: (And (Member $e0 turn_down) (Theme $e0 $x0))
;;   substitution: (Member $e0 turn_down) -> (Member $e0 reject)
(Implication (And (Member $e0 reject) (Theme $e0 $x0)) (MnTheme_RejectOrTurnDown $e0 $x0))
(Implication (And (Member $e0 turn_down) (Theme $e0 $x0)) (MnTheme_RejectOrTurnDown $e0 $x0))

;; [unit]  p200489 ~ p205532   support 3 (control 0)   gate: PASS
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p205647 ~ p205644   support 3 (control 0)   gate: PASS
;;   A: (And (Theme $e0 $e1) (Theme $e1 $x0))   e.g. tierA-000186 tierA-000187
;;   B: (And (Patient $e0 $e1) (Theme $e1 $x0))
;;   substitution: (Patient $e0 $e1) -> (Theme $e0 $e1)
(Implication (And (Theme $e0 $e1) (Theme $e1 $x0)) (MnTheme_ThemeOrPatient $e0 $e1 $x0))
(Implication (And (Patient $e0 $e1) (Theme $e1 $x0)) (MnTheme_ThemeOrPatient $e0 $e1 $x0))

;; [unit, shape-parallel]  p200696 ~ p203881   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 abandon)   e.g. tierA-000099 tierA-000100
;;   B: (Member $e0 give_up)
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (Member $e0 abandon) (MnAbandonOrGiveUp $e0))
(Implication (Member $e0 give_up) (MnAbandonOrGiveUp $e0))

;; [unit, shape-parallel]  p200574 ~ p205749   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 cancel)   e.g. tierA-000143 tierA-000144
;;   B: (Member $e0 call_off)
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (Member $e0 cancel) (MnCancelOrCallOff $e0))
(Implication (Member $e0 call_off) (MnCancelOrCallOff $e0))

;; [unit, shape-parallel]  p200351 ~ p205754   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 discover)   e.g. tierA-000128 tierA-000129
;;   B: (Member $e0 find_out)
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (Member $e0 discover) (MnDiscoverOrFindOut $e0))
(Implication (Member $e0 find_out) (MnDiscoverOrFindOut $e0))

;; [unit, shape-parallel]  p200352 ~ p200499   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 give)   e.g. tierA-000207 tierA-000208
;;   B: (Member $e0 answer)
;;   substitution: (Member $e0 answer) -> (Member $e0 give)
(Implication (Member $e0 give) (MnGiveOrAnswer $e0))
(Implication (Member $e0 answer) (MnGiveOrAnswer $e0))

;; [unit, shape-parallel]  p200352 ~ p201766   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 give)   e.g. tierA-000261 tierA-000262
;;   B: (Member $e0 receive)
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (Member $e0 give) (MnGiveOrReceive $e0))
(Implication (Member $e0 receive) (MnGiveOrReceive $e0))

;; [unit, shape-parallel]  p200501 ~ p201763   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 lend)   e.g. tierA-000296 tierA-000297
;;   B: (Member $e0 borrow)
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (Member $e0 lend) (MnLendOrBorrow $e0))
(Implication (Member $e0 borrow) (MnLendOrBorrow $e0))

;; [unit, shape-parallel]  p200854 ~ p205759   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 postpone)   e.g. tierA-000114 tierA-000115
;;   B: (Member $e0 put_off)
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (Member $e0 postpone) (MnPostponeOrPutOff $e0))
(Implication (Member $e0 put_off) (MnPostponeOrPutOff $e0))

;; [unit, shape-parallel]  p200699 ~ p205762   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 reject)   e.g. tierA-000158 tierA-000159
;;   B: (Member $e0 turn_down)
;;   substitution: (Member $e0 turn_down) -> (Member $e0 reject)
(Implication (Member $e0 reject) (MnRejectOrTurnDown $e0))
(Implication (Member $e0 turn_down) (MnRejectOrTurnDown $e0))

;; [unit, shape-parallel]  p200502 ~ p205757   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 require)   e.g. tierA-000084 tierA-000085
;;   B: (Member $e0 need)
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (Member $e0 require) (MnRequireOrNeed $e0))
(Implication (Member $e0 need) (MnRequireOrNeed $e0))

;; [unit, shape-parallel]  p200503 ~ p205756   support 3 (control 0)   gate: PASS
;;   A: (Member $e0 teach)   e.g. tierA-000281 tierA-000282
;;   B: (Member $e0 learn)
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (Member $e0 teach) (MnTeachOrLearn $e0))
(Implication (Member $e0 learn) (MnTeachOrLearn $e0))

;; [unit, shape-parallel]  p200702 ~ p205765   support 3 (control 0)   gate: PASS
;;   A: (Member $x0 automobile)   e.g. tierA-000390 tierA-000391
;;   B: (Member $x0 car)
;;   substitution: (Member $x0 car) -> (Member $x0 automobile)
(Implication (Member $x0 automobile) (MnAutomobileOrCar $x0))
(Implication (Member $x0 car) (MnAutomobileOrCar $x0))

;; [unit, shape-parallel]  p200703 ~ p205773   support 3 (control 0)   gate: PASS
;;   A: (Member $x0 big)   e.g. tierA-000339 tierA-000340
;;   B: (Member $x0 huge)
;;   substitution: (Member $x0 huge) -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrHuge $x0))
(Implication (Member $x0 huge) (MnBigOrHuge $x0))

;; [unit, shape-parallel]  p200703 ~ p201795   support 3 (control 0)   gate: PASS
;;   A: (Member $x0 big)   e.g. tierA-000327 tierA-000328
;;   B: (Member $x0 large)
;;   substitution: (Member $x0 large) -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrLarge $x0))
(Implication (Member $x0 large) (MnBigOrLarge $x0))

;; [unit, shape-parallel]  p205771 ~ p205767   support 3 (control 0)   gate: PASS
;;   A: (Member $x0 hard)   e.g. tierA-000351 tierA-000352
;;   B: (Member $x0 difficult)
;;   substitution: (Member $x0 difficult) -> (Member $x0 hard)
(Implication (Member $x0 hard) (MnHardOrDifficult $x0))
(Implication (Member $x0 difficult) (MnHardOrDifficult $x0))

;; [unit, shape-parallel]  p200354 ~ p205768   support 3 (control 0)   gate: PASS
;;   A: (Member $x0 physician)   e.g. tierA-000375 tierA-000376
;;   B: (Member $x0 doctor)
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (Member $x0 physician) (MnPhysicianOrDoctor $x0))
(Implication (Member $x0 doctor) (MnPhysicianOrDoctor $x0))

;; [unit, shape-parallel]  p203617 ~ p205533   support 2 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 allow))   e.g. tierA-000076 tierA-000077
;;   B: (And (Agent $e0 $x0) (Member $e0 permit))
;;   substitution: (Member $e0 permit) -> (Member $e0 allow)
(Implication (And (Agent $e0 $x0) (Member $e0 allow)) (MnAgent_AllowOrPermit $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 permit)) (MnAgent_AllowOrPermit $e0 $x0))

;; [unit, shape-parallel]  p201083 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 arrive))   e.g. tierA-000241 tierA-000242
;;   B: (And (Agent $e0 $x0) (Member $e0 arrival))
;;   substitution: (Member $e0 arrival) -> (Member $e0 arrive)
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_ArriveOrArrival $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 arrival)) (MnAgent_ArriveOrArrival $e0 $x0))

;; [unit, shape-parallel]  p200805 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))   e.g. tierA-000148 tierA-000149
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Patient $e0 $x1))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_Patient_CancelOrCallOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Patient $e0 $x1)) (MnAgent_Patient_CancelOrCallOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p200806 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnAgent_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Theme $e0 $x1)) (MnAgent_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p200823 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover)) (MnAgent_DiscoverOrFindOut $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out)) (MnAgent_DiscoverOrFindOut $e0 $x0))

;; [unit]  p200329 ~ p200470   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))

;; [unit]  p201048 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p201059 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p201049 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))   e.g. tierA-000029 tierA-000030
;;   B: (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrFix $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrFix $e0 $x0 $x1))

;; [unit, shape-parallel]  p201049 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))   e.g. tierA-000029 tierA-000031
;;   B: (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrMend $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrMend $e0 $x0 $x1))

;; [unit, shape-parallel]  p201060 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))   e.g. tierA-000029 tierA-000030
;;   B: (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnAgent_Past_RepairOrFix $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0)) (MnAgent_Past_RepairOrFix $e0 $x0))

;; [unit, shape-parallel]  p201060 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))   e.g. tierA-000029 tierA-000031
;;   B: (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnAgent_Past_RepairOrMend $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0)) (MnAgent_Past_RepairOrMend $e0 $x0))

;; [unit, shape-parallel]  p200664 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   e.g. tierA-000029 tierA-000030
;;   B: (And (Agent $e0 $x0) (Member $e0 fix) (Patient $e0 $x1))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrFix $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 fix) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrFix $e0 $x0 $x1))

;; [unit, shape-parallel]  p200664 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   e.g. tierA-000029 tierA-000031
;;   B: (And (Agent $e0 $x0) (Member $e0 mend) (Patient $e0 $x1))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrMend $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 mend) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrMend $e0 $x0 $x1))

;; [unit, shape-parallel]  p200678 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))   e.g. tierA-000029 tierA-000030
;;   B: (And (Agent $e0 $x0) (Member $e0 fix))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnAgent_RepairOrFix $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 fix)) (MnAgent_RepairOrFix $e0 $x0))

;; [unit, shape-parallel]  p200678 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))   e.g. tierA-000029 tierA-000031
;;   B: (And (Agent $e0 $x0) (Member $e0 mend))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnAgent_RepairOrMend $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 mend)) (MnAgent_RepairOrMend $e0 $x0))

;; [unit]  p201050 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000286 tierA-000287
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p201061 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p201410 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))   e.g. tierA-000390 tierA-000391
;;   B: (And (Agent $e0 $x0) (Member $x0 car) (Theme $e0 $x1))
;;   substitution: (Member $x0 car) -> (Member $x0 automobile)
(Implication (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1)) (MnAgent_Theme_AutomobileOrCar $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 car) (Theme $e0 $x1)) (MnAgent_Theme_AutomobileOrCar $e0 $x0 $x1))

;; [unit, shape-parallel]  p201682 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile))   e.g. tierA-000390 tierA-000391
;;   B: (And (Agent $e0 $x0) (Member $x0 car))
;;   substitution: (Member $x0 car) -> (Member $x0 automobile)
(Implication (And (Agent $e0 $x0) (Member $x0 automobile)) (MnAgent_AutomobileOrCar $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 car)) (MnAgent_AutomobileOrCar $e0 $x0))

;; [unit, shape-parallel]  p200965 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1))   e.g. tierA-000380 tierA-000381
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor) (Theme $e0 $x1))
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1)) (MnAgent_Theme_PhysicianOrDoctor $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 doctor) (Theme $e0 $x1)) (MnAgent_Theme_PhysicianOrDoctor $e0 $x0 $x1))

;; [unit, shape-parallel]  p200015 ~ p200099   support 2 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (MnAgent_ThemeOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201064 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1))   e.g. tierA-000085 tierA-000086
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Theme $e0 $x1))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1)) (MnHolder_Theme_RequireOrNeed $e0 $x0 $x1))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Theme $e0 $x1)) (MnHolder_Theme_RequireOrNeed $e0 $x0 $x1))

;; [unit, shape-parallel]  p200834 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Patient $e0 $x0))   e.g. tierA-000148 tierA-000149
;;   B: (And (Member $e0 call_off) (Patient $e0 $x0))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Member $e0 cancel) (Patient $e0 $x0)) (MnPatient_CancelOrCallOff $e0 $x0))
(Implication (And (Member $e0 call_off) (Patient $e0 $x0)) (MnPatient_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p201707 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. tierA-000253 tierA-000254
;;   B: (And (Member $e0 kick_the_bucket) (Patient $e0 $x0))
;;   substitution: (Member $e0 kick_the_bucket) -> (Member $e0 die)
(Implication (And (Member $e0 die) (Patient $e0 $x0)) (MnPatient_DieOrKickTheBucket $e0 $x0))
(Implication (And (Member $e0 kick_the_bucket) (Patient $e0 $x0)) (MnPatient_DieOrKickTheBucket $e0 $x0))

;; [unit, shape-parallel]  p200564 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Theme $e0 $x0))   e.g. tierA-000133 tierA-000134
;;   B: (And (Member $e0 find_out) (Theme $e0 $x0))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Theme $e0 $x0)) (MnTheme_DiscoverOrFindOut $e0 $x0))
(Implication (And (Member $e0 find_out) (Theme $e0 $x0)) (MnTheme_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p203703 ~ p205617   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 follow) (Past $e0))   e.g. tierC-000075 tierC-000076
;;   B: (And (Member $e0 succeed) (Past $e0))
;;   substitution: (Member $e0 succeed) -> (Member $e0 follow)
(Implication (And (Member $e0 follow) (Past $e0)) (MnPast_FollowOrSucceed $e0))
(Implication (And (Member $e0 succeed) (Past $e0)) (MnPast_FollowOrSucceed $e0))

;; [unit]  p200340 ~ p200486   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))   e.g. tierA-000207 tierA-000208
;;   B: (And (Member $e0 answer) (Theme $e0 $x0))
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 answer) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit]  p200809 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Theme $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p200835 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 $x0))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p201065 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. tierA-000029 tierA-000030
;;   B: (And (Member $e0 fix) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrFix $e0 $x0))
(Implication (And (Member $e0 fix) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrFix $e0 $x0))

;; [unit, shape-parallel]  p201065 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. tierA-000029 tierA-000031
;;   B: (And (Member $e0 mend) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrMend $e0 $x0))
(Implication (And (Member $e0 mend) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrMend $e0 $x0))

;; [unit, shape-parallel]  p201093 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0))   e.g. tierA-000029 tierA-000030
;;   B: (And (Member $e0 fix) (Past $e0))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0)) (MnPast_RepairOrFix $e0))
(Implication (And (Member $e0 fix) (Past $e0)) (MnPast_RepairOrFix $e0))

;; [unit, shape-parallel]  p201093 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0))   e.g. tierA-000029 tierA-000031
;;   B: (And (Member $e0 mend) (Past $e0))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0)) (MnPast_RepairOrMend $e0))
(Implication (And (Member $e0 mend) (Past $e0)) (MnPast_RepairOrMend $e0))

;; [unit, shape-parallel]  p200688 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. tierA-000029 tierA-000030
;;   B: (And (Member $e0 fix) (Patient $e0 $x0))
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnPatient_RepairOrFix $e0 $x0))
(Implication (And (Member $e0 fix) (Patient $e0 $x0)) (MnPatient_RepairOrFix $e0 $x0))

;; [unit, shape-parallel]  p200688 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. tierA-000029 tierA-000031
;;   B: (And (Member $e0 mend) (Patient $e0 $x0))
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnPatient_RepairOrMend $e0 $x0))
(Implication (And (Member $e0 mend) (Patient $e0 $x0)) (MnPatient_RepairOrMend $e0 $x0))

;; [unit, shape-parallel]  p200837 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Member $e0 require) (Theme $e0 $x0)) (MnTheme_RequireOrNeed $e0 $x0))
(Implication (And (Member $e0 need) (Theme $e0 $x0)) (MnTheme_RequireOrNeed $e0 $x0))

;; [unit]  p201066 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 $x1)) (MnTheme_OrAgentMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201094 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Theme $e0 $x0))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $e0 learn) (Theme $e0 $x0))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Member $e0 teach) (Theme $e0 $x0)) (MnTheme_TeachOrLearn $e0 $x0))
(Implication (And (Member $e0 learn) (Theme $e0 $x0)) (MnTheme_TeachOrLearn $e0 $x0))

;; [unit, shape-parallel]  p203873 ~ p205758   support 2 (control 1)   gate: FAIL
;;   A: (Member $e0 allow)   e.g. tierA-000076 tierA-000077
;;   B: (Member $e0 permit)
;;   substitution: (Member $e0 permit) -> (Member $e0 allow)
(Implication (Member $e0 allow) (MnAllowOrPermit $e0))
(Implication (Member $e0 permit) (MnAllowOrPermit $e0))

;; [unit, shape-parallel]  p201134 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 arrive)   e.g. tierA-000241 tierA-000242
;;   B: (Member $e0 arrival)
;;   substitution: (Member $e0 arrival) -> (Member $e0 arrive)
(Implication (Member $e0 arrive) (MnArriveOrArrival $e0))
(Implication (Member $e0 arrival) (MnArriveOrArrival $e0))

;; [unit, shape-parallel]  p201764 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 die)   e.g. tierA-000253 tierA-000254
;;   B: (Member $e0 kick_the_bucket)
;;   substitution: (Member $e0 kick_the_bucket) -> (Member $e0 die)
(Implication (Member $e0 die) (MnDieOrKickTheBucket $e0))
(Implication (Member $e0 kick_the_bucket) (MnDieOrKickTheBucket $e0))

;; [unit, shape-parallel]  p203879 ~ p205761   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 follow)   e.g. tierC-000075 tierC-000076
;;   B: (Member $e0 succeed)
;;   substitution: (Member $e0 succeed) -> (Member $e0 follow)
(Implication (Member $e0 follow) (MnFollowOrSucceed $e0))
(Implication (Member $e0 succeed) (MnFollowOrSucceed $e0))

;; [unit, shape-parallel]  p200700 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 repair)   e.g. tierA-000029 tierA-000030
;;   B: (Member $e0 fix)
;;   substitution: (Member $e0 fix) -> (Member $e0 repair)
(Implication (Member $e0 repair) (MnRepairOrFix $e0))
(Implication (Member $e0 fix) (MnRepairOrFix $e0))

;; [unit, shape-parallel]  p200700 ~ raw   support 2 (control 0)   gate: FAIL
;;   A: (Member $e0 repair)   e.g. tierA-000029 tierA-000031
;;   B: (Member $e0 mend)
;;   substitution: (Member $e0 mend) -> (Member $e0 repair)
(Implication (Member $e0 repair) (MnRepairOrMend $e0))
(Implication (Member $e0 mend) (MnRepairOrMend $e0))

;; [unit, shape-parallel]  p200008 ~ p200071   support 2 (control 3)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierA-000207 tierA-000208
;;   B: (Recipient $e0 $x0)
;;   substitution: (Recipient $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrRecipient $e0 $x0))
(Implication (Recipient $e0 $x0) (MnThemeOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200237   support 1 (control 0)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierA-000084 tierA-000085
;;   B: (Holder $e0 $x0)
;;   substitution: (Holder $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrHolder $e0 $x0))
(Implication (Holder $e0 $x0) (MnAgentOrHolder $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200022   support 1 (control 5)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierC-000163 tierC-000164
;;   B: (Patient $e0 $x0)
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrPatient $e0 $x0))
(Implication (Patient $e0 $x0) (MnAgentOrPatient $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200008   support 1 (control 5)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. tierC-000113 tierC-000114
;;   B: (Theme $e0 $x0)
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrTheme $e0 $x0))
(Implication (Theme $e0 $x0) (MnAgentOrTheme $e0 $x0))

;; [unit, shape-parallel]  p201757 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Also appear $e0)   e.g. tierC-000127 tierC-000128
;;   B: (Also perform $e0)
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (Also appear $e0) (MnAppearOrPerform $e0))
(Implication (Also perform $e0) (MnAppearOrPerform $e0))

;; [unit, shape-parallel]  p203956 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Member $x0 government))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance) (Member $x0 government))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Member $x0 government)) (MnAgent_Agent_Member_FundOrFinance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance) (Member $x0 government)) (MnAgent_Agent_Member_FundOrFinance $e0 $x0))

;; [unit, shape-parallel]  p205306 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x1))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance) (Theme $e0 $x1))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x1)) (MnAgent_Agent_Theme_FundOrFinance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance) (Theme $e0 $x1)) (MnAgent_Agent_Theme_FundOrFinance $e0 $x0 $x1))

;; [unit, shape-parallel]  p205358 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 fund)) (MnAgent_Agent_FundOrFinance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Agent $e0 jica) (Member $e0 finance)) (MnAgent_Agent_FundOrFinance $e0 $x0))

;; [unit]  p203968 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Member $x0 person))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Member $x0 person))
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Member $x0 person)) (MnAgent_Member_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Member $x0 person)) (MnAgent_Member_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p203969 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Past $e0))
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e0)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Past $e0)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p203970 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e1))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Past $e1))
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear) (Past $e1)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform) (Past $e1)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p204865 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform))
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $e1 appear)) (MnAgent_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $e1 perform)) (MnAgent_OrAlsoMember $e0 $x0 $e1))

;; [unit, shape-parallel]  p203971 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $x0 person) (Past $e0))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person) (Past $e0)) (MnAgent_Member_Past_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $x0 person) (Past $e0)) (MnAgent_Member_Past_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p204866 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Member $x0 person))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Member $x0 person)) (MnAgent_Member_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Member $x0 person)) (MnAgent_Member_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p205360 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0) (Past $e0))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Agent $e0 $x0) (Also appear $e0) (Past $e0)) (MnAgent_Past_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Also perform $e0) (Past $e0)) (MnAgent_Past_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p205522 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e0))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Agent $e0 $x0) (Also appear $e0)) (MnAgent_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Also perform $e0)) (MnAgent_AppearOrPerform $e0 $x0))

;; [unit]  p203973 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Member $x0 person))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Member $x0 person))
(Implication (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Member $x0 person)) (MnAgent_Member_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Member $x0 person)) (MnAgent_Member_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p203974 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Past $e0))
(Implication (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e0)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Past $e0)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p203975 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e1))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Past $e1))
(Implication (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear) (Past $e1)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform) (Past $e1)) (MnAgent_Past_OrAlsoMember $e0 $x0 $e1))

;; [unit]  p204867 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform))
(Implication (And (Agent $e0 $x0) (Also appear $e1) (Member $e0 appear)) (MnAgent_OrAlsoMember $e0 $x0 $e1))
(Implication (And (Agent $e0 $x0) (Also perform $e1) (Member $e0 perform)) (MnAgent_OrAlsoMember $e0 $x0 $e1))

;; [unit, shape-parallel]  p203976 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x0 school))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school)) (MnAgent_Beneficiary_Member_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x0 school)) (MnAgent_Beneficiary_Member_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p203976 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x0 school))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school)) (MnAgent_Beneficiary_Member_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x0 school)) (MnAgent_Beneficiary_Member_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p203976 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x1 school) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x0 school)) (MnOrBeneficiaryMemberMemberR $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x1 school) (Recipient $e0 $x1)) (MnOrBeneficiaryMemberMemberR $e0 $x0 $x1))

;; [unit, shape-parallel]  p203977 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x1 hall))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall)) (MnAgent_Beneficiary_Member_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x1 hall)) (MnAgent_Beneficiary_Member_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p203977 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x1 hall))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall)) (MnAgent_Beneficiary_Member_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x1 hall)) (MnAgent_Beneficiary_Member_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p203977 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x1 hall)) (MnOrBeneficiaryMemberMemberR $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Recipient $e0 $x1)) (MnOrBeneficiaryMemberMemberR $e0 $x0 $x1))

;; [unit, shape-parallel]  p205308 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0)) (MnAgent_Beneficiary_Past_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Past $e0)) (MnAgent_Beneficiary_Past_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p205308 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0)) (MnAgent_Beneficiary_Past_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Past $e0)) (MnAgent_Beneficiary_Past_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p205308 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Past $e0)) (MnPast_OrBeneficiaryMemberRecipie $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0) (Recipient $e0 $x1)) (MnPast_OrBeneficiaryMemberRecipie $e0 $x0 $x1))

;; [unit, shape-parallel]  p205309 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Theme $e0 $x2))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_BuyOrAcquire $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_BuyOrAcquire $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p205309 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Theme $e0 $x2))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_BuyOrPurchase $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_BuyOrPurchase $e0 $x0 $x1 $x2))

;; [unit]  p205309 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Theme $e0 $x2)) (MnTheme_OrBeneficiaryMemberRecipie $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnTheme_OrBeneficiaryMemberRecipie $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p205361 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy)) (MnAgent_Beneficiary_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire)) (MnAgent_Beneficiary_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p205361 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy)) (MnAgent_Beneficiary_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase)) (MnAgent_Beneficiary_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p205361 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy)) (MnOrBeneficiaryMemberRecipie $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Recipient $e0 $x1)) (MnOrBeneficiaryMemberRecipie $e0 $x0 $x1))

;; [unit, shape-parallel]  p201162 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 school) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Member $x1 hall)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 school) (Recipient $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201163 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x1 school) (Past $e0) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Past $e0)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $x1 school) (Past $e0) (Recipient $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201164 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x1 school) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Member $x1 school) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p201404 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x1 school) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x0 school)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $x1 school) (Recipient $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201165 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Past $e0)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Past $e0) (Recipient $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201166 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x0 hall) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p201405 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x0 hall) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x1 hall)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Recipient $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201877 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $x1 projector) (Recipient $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x2) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2)) (MnAgentOrRecipient $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Member $x1 projector) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p201622 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0) (Theme $e0 $x2)) (MnPast_Theme_AgentOrRecipient $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnPast_Theme_AgentOrRecipient $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p201633 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Past $e0) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Past $e0)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Past $e0) (Recipient $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201634 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))
(Implication (And (Beneficiary $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnTheme_AgentOrRecipient $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p201675 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Recipient $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p203978 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 give_up))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon)) (MnAgent_Cardinality_GroupOf_AbandonOrGiveUp $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 give_up)) (MnAgent_Cardinality_GroupOf_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p203979 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 give_up) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 give_up) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204868 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 give_up))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon)) (MnAgent_Cardinality_AbandonOrGiveUp $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 give_up)) (MnAgent_Cardinality_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p201169 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201878 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 acquire) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 acquire) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p201878 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 purchase) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 purchase) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p201878 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnOrCardinalityMemberRecipie $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrCardinalityMemberRecipie $x0 $e0 $x1))

;; [unit, shape-parallel]  p201170 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Member $x1 depot) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Member $x1 depot) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p200863 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p200377 ~ p201425   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. tierA-000084 tierA-000085
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Holder $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgentOrHolder $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0)) (MnAgentOrHolder $x0 $e0 $x1))

;; [unit, shape-parallel]  p200377 ~ p202839   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p205364 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive))   e.g. tierA-000241 tierA-000242
;;   B: (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrival))
;;   substitution: (Member $e0 arrival) -> (Member $e0 arrive)
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive)) (MnAgent_Future_ArriveOrArrival $e0 $x0))
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrival)) (MnAgent_Future_ArriveOrArrival $e0 $x0))

;; [unit, shape-parallel]  p203612 ~ p205580   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. tierA-000291 tierA-000292
;;   B: (And (GroupOf $x0 child) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnGroupOf_AgentOrRecipient $e0 $x0))
(Implication (And (GroupOf $x0 child) (Recipient $e0 $x0)) (MnGroupOf_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p203986 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 give_up) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 give_up) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204872 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 give_up))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon)) (MnAgent_GroupOf_AbandonOrGiveUp $e0 $x0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 give_up)) (MnAgent_GroupOf_AbandonOrGiveUp $e0 $x0))

;; [unit]  p203988 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $e0 teach) (Recipient $e0 $x1)) (MnAgent_OrGroupOfMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn) (Source $e0 $x1)) (MnAgent_OrGroupOfMemberSource $e0 $x0 $x1))

;; [unit]  p203989 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $x1 elder) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Member $x0 elder) (Recipient $e0 $x1)) (MnAgent_OrGroupOfMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $x1 elder) (Source $e0 $x1)) (MnAgent_OrGroupOfMemberSource $e0 $x0 $x1))

;; [unit]  p203990 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrGroupOfSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrGroupOfSource $e0 $x0 $x1 $x2))

;; [unit]  p204875 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 child) (Recipient $e0 $x1)) (MnAgent_OrGroupOfSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Source $e0 $x1)) (MnAgent_OrGroupOfSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p203991 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 acquire) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 acquire) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p203991 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 purchase) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 purchase) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p203991 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnOrGroupOfMemberRecipientTh $e0 $x0 $x1))
(Implication (And (GroupOf $x0 forklift) (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrGroupOfMemberRecipientTh $x0 $e0 $x1))

;; [unit, shape-parallel]  p201172 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Member $x1 depot) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 forklift) (Member $x1 depot) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p201173 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 forklift) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201407 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 forklift) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201879 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (GroupOf $x0 lemon) (Member $x1 chef) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 lemon) (Member $x1 chef) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p201880 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (GroupOf $x0 lemon) (Member $x0 crate) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 lemon) (Member $x0 crate) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201881 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (GroupOf $x0 lemon) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 lemon) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202768 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (GroupOf $x0 lemon) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (GroupOf $x0 lemon) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p203993 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 physician) (Theme $e0 $x1))   e.g. tierA-000380 tierA-000381
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 doctor) (Theme $e0 $x1))
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 physician) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_PhysicianOrDoctor $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $x0 doctor) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_PhysicianOrDoctor $e0 $x0 $x1))

;; [unit, shape-parallel]  p203994 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Theme $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Patient $e0 $x1))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Theme $e0 $x1)) (MnAgent_Inheritance_Member_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance evening_flight flight) (Member $x1 evening_flight) (Patient $e0 $x1)) (MnAgent_Inheritance_Member_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p203997 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 acquire) (Member $x0 pottery_studio))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio)) (MnAgent_Inheritance_Member_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 acquire) (Member $x0 pottery_studio)) (MnAgent_Inheritance_Member_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p203997 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 purchase) (Member $x0 pottery_studio))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio)) (MnAgent_Inheritance_Member_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 purchase) (Member $x0 pottery_studio)) (MnAgent_Inheritance_Member_BuyOrPurchase $e0 $x0))

;; [unit]  p203997 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000025
;;   B: (And (Inheritance pottery_studio studio) (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio)) (MnInheritance_Member_OrMemberRecipient $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0)) (MnInheritance_Member_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p201176 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0)) (MnInheritance_Member_Past_AgentOrRecipient $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0)) (MnInheritance_Member_Past_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p201177 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnInheritance_Member_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnInheritance_Member_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201408 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000025
;;   B: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnInheritance_Member_AgentOrRecipient $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Recipient $e0 $x0)) (MnInheritance_Member_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p203998 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Member $x0 diver))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver)) (MnAgent_Location_Member_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Member $x0 diver)) (MnAgent_Location_Member_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p201888 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x1 point))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Member $x1 point))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x1 point)) (MnAgent_Location_Member_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Member $x1 point)) (MnAgent_Location_Member_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p203258 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Theme $e0 $x2))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Theme $e0 $x2))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Theme $e0 $x2)) (MnAgent_Location_Theme_DiscoverOrFindOut $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out) (Theme $e0 $x2)) (MnAgent_Location_Theme_DiscoverOrFindOut $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p203382 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover)) (MnAgent_Location_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 find_out)) (MnAgent_Location_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204006 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm) (Theme $e0 $x1))   e.g. tierA-000104 tierA-000105
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x0 firm) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x0 firm) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204881 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm))   e.g. tierA-000104 tierA-000105
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x0 firm))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x0 firm)) (MnAgent_Member_AbandonOrGiveUp $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x0 firm)) (MnAgent_Member_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p204007 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1))   e.g. tierA-000109 tierA-000110
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x1 north_route) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204009 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 tender) (Theme $e0 $x1))   e.g. tierA-000104 tierA-000105
;;   B: (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x1 tender) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 tender) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Member $x1 tender) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit]  p204011 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 clerk) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 clerk) (Recipient $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204883 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 clerk))
;;   substitution: (Member $e0 give) -> (Member $e0 answer)
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk)) (MnAgent_Member_AnswerOrGive $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 clerk)) (MnAgent_Member_AnswerOrGive $e0 $x0))

;; [unit]  p204012 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot) (Theme $e0 $x1))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 pilot) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot) (Theme $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 pilot) (Recipient $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204884 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 pilot))
;;   substitution: (Member $e0 give) -> (Member $e0 answer)
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 pilot)) (MnAgent_Member_AnswerOrGive $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 pilot)) (MnAgent_Member_AnswerOrGive $e0 $x0))

;; [unit]  p204013 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 query) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 query) (Recipient $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))

;; [unit]  p204014 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 tower) (Theme $e0 $x1))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 tower) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 tower) (Theme $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 tower) (Recipient $e0 $x1)) (MnAgent_Member_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204018 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Member $e0 perform) (Member $x0 person) (Past $e0))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person) (Past $e0)) (MnAgent_Member_Past_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 perform) (Member $x0 person) (Past $e0)) (MnAgent_Member_Past_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p204886 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Member $e0 perform) (Member $x0 person))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Agent $e0 $x0) (Member $e0 appear) (Member $x0 person)) (MnAgent_Member_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 perform) (Member $x0 person)) (MnAgent_Member_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p205368 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Member $e0 perform) (Past $e0))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Agent $e0 $x0) (Member $e0 appear) (Past $e0)) (MnAgent_Past_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 perform) (Past $e0)) (MnAgent_Past_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p205525 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 appear))   e.g. tierC-000127 tierC-000128
;;   B: (And (Agent $e0 $x0) (Member $e0 perform))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Agent $e0 $x0) (Member $e0 appear)) (MnAgent_AppearOrPerform $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 perform)) (MnAgent_AppearOrPerform $e0 $x0))

;; [unit, shape-parallel]  p204020 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204020 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))

;; [unit]  p204020 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Member $x0 depot) (Past $e0) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0)) (MnMember_Past_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 depot) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204021 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204021 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204021 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Member $x0 depot) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Member $x0 depot) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204888 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))   e.g. tierA-000001 tierA-000003
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot)) (MnAgent_Member_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 depot)) (MnAgent_Member_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204888 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))   e.g. tierA-000001 tierA-000002
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot)) (MnAgent_Member_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 depot)) (MnAgent_Member_BuyOrPurchase $e0 $x0))

;; [unit]  p204888 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $e0 sell) (Member $x0 depot) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot)) (MnMember_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 depot) (Recipient $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))

;; [unit]  p204023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0)) (MnMember_Past_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204024 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204024 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204024 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204889 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio)) (MnAgent_Member_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 pottery_studio)) (MnAgent_Member_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204889 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio)) (MnAgent_Member_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 pottery_studio)) (MnAgent_Member_BuyOrPurchase $e0 $x0))

;; [unit]  p204889 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio)) (MnMember_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 pottery_studio) (Recipient $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204025 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school) (Past $e0)) (MnAgent_Member_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204025 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school) (Past $e0)) (MnAgent_Member_Past_BuyOrPurchase $e0 $x0))

;; [unit]  p204025 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $e0 sell) (Member $x0 school) (Past $e0) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Past $e0)) (MnMember_Past_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 school) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204026 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204026 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204026 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $e0 sell) (Member $x0 school) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Member $x0 school) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204890 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000010
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school)) (MnAgent_Member_BuyOrAcquire $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x0 school)) (MnAgent_Member_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204890 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000009
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school)) (MnAgent_Member_BuyOrPurchase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x0 school)) (MnAgent_Member_BuyOrPurchase $e0 $x0))

;; [unit]  p204890 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $e0 sell) (Member $x0 school) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 school)) (MnMember_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 school) (Recipient $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p204028 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x1 kiln) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204028 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x1 kiln) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204028 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 kiln) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1)) (MnOrMemberMemberRecipientThe $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Member $x0 kiln) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberRecipientThe $e0 $x0 $x1))

;; [unit, shape-parallel]  p204031 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))   e.g. tierA-000148 tierA-000149
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 council) (Patient $e0 $x1))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 council) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p204892 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))   e.g. tierA-000148 tierA-000149
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 council))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council)) (MnAgent_Member_CancelOrCallOff $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 council)) (MnAgent_Member_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p204032 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))   e.g. tierA-000153 tierA-000154
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 tutor) (Patient $e0 $x1))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 tutor) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p204893 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))   e.g. tierA-000153 tierA-000154
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 tutor))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor)) (MnAgent_Member_CancelOrCallOff $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x0 tutor)) (MnAgent_Member_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p204033 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))   e.g. tierA-000153 tierA-000154
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x1 afternoon_session) (Patient $e0 $x1))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p204034 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))   e.g. tierA-000148 tierA-000149
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x1 summer_fair) (Patient $e0 $x1))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Member $x1 summer_fair) (Patient $e0 $x1)) (MnAgent_Member_Patient_CancelOrCallOff $e0 $x0 $x1))

;; [unit]  p200805 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))   e.g. tierA-000144 tierA-000145
;;   B: (And (Agent $e0 $x0) (Member $e0 call_off) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 call_off) (Theme $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p200805 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Member $e0 cancel) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Theme $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p204894 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board))   e.g. tierA-000201 tierA-000202
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Member $x0 board))
;;   substitution: (Member $e0 make) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board)) (MnAgent_Member_DecideOrMake $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Member $x0 board)) (MnAgent_Member_DecideOrMake $e0 $x0))

;; [unit, shape-parallel]  p204894 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board))   e.g. tierA-000201 tierA-000203
;;   B: (And (Agent $e0 $x0) (Member $e0 reach) (Member $x0 board))
;;   substitution: (Member $e0 reach) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 board)) (MnAgent_Member_DecideOrReach $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Member $x0 board)) (MnAgent_Member_DecideOrReach $e0 $x0))

;; [unit, shape-parallel]  p204895 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))   e.g. tierA-000190 tierA-000191
;;   B: (And (Agent $e0 $x0) (Member $e0 make) (Member $x0 judge))
;;   substitution: (Member $e0 make) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge)) (MnAgent_Member_DecideOrMake $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 make) (Member $x0 judge)) (MnAgent_Member_DecideOrMake $e0 $x0))

;; [unit, shape-parallel]  p204895 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))   e.g. tierA-000190 tierA-000192
;;   B: (And (Agent $e0 $x0) (Member $e0 reach) (Member $x0 judge))
;;   substitution: (Member $e0 reach) -> (Member $e0 decide)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge)) (MnAgent_Member_DecideOrReach $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 reach) (Member $x0 judge)) (MnAgent_Member_DecideOrReach $e0 $x0))

;; [unit, shape-parallel]  p204042 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 diver) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 diver) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204896 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 diver))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver)) (MnAgent_Member_DiscoverOrFindOut $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 diver)) (MnAgent_Member_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p204043 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern) (Theme $e0 $x1))   e.g. tierA-000138 tierA-000139
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 intern) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 intern) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204897 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern))   e.g. tierA-000138 tierA-000139
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 intern))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 intern)) (MnAgent_Member_DiscoverOrFindOut $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x0 intern)) (MnAgent_Member_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p204044 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 file) (Theme $e0 $x1))   e.g. tierA-000138 tierA-000139
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 file) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 file) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 file) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204045 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 missing) (Theme $e0 $x1))   e.g. tierA-000138 tierA-000139
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 missing) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 missing) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 missing) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204046 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 wreck) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 find_out) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p204047 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government) (Theme $e0 $x1))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Member $e0 finance) (Member $x0 government) (Theme $e0 $x1))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government) (Theme $e0 $x1)) (MnAgent_Member_Theme_FundOrFinance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 finance) (Member $x0 government) (Theme $e0 $x1)) (MnAgent_Member_Theme_FundOrFinance $e0 $x0 $x1))

;; [unit, shape-parallel]  p204898 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Member $e0 finance) (Member $x0 government))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Member $e0 fund) (Member $x0 government)) (MnAgent_Member_FundOrFinance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 finance) (Member $x0 government)) (MnAgent_Member_FundOrFinance $e0 $x0))

;; [unit, shape-parallel]  p205373 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 fund) (Theme $e0 $x1))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Member $e0 finance) (Theme $e0 $x1))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Member $e0 fund) (Theme $e0 $x1)) (MnAgent_Theme_FundOrFinance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 finance) (Theme $e0 $x1)) (MnAgent_Theme_FundOrFinance $e0 $x0 $x1))

;; [unit, shape-parallel]  p205529 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 fund))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 $x0) (Member $e0 finance))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 $x0) (Member $e0 fund)) (MnAgent_FundOrFinance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 finance)) (MnAgent_FundOrFinance $e0 $x0))

;; [unit]  p204048 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 school) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 school) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204049 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $e0 receive) (Member $x0 school) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Member $x0 school) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204899 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $e0 receive) (Member $x0 school) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 receive) (Member $x0 school) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204050 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 trainer) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 trainer) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204051 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $e0 receive) (Member $x0 trainer) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Member $x0 trainer) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204900 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $e0 receive) (Member $x0 trainer) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 receive) (Member $x0 trainer) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204052 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1))   e.g. tierA-000217 tierA-000218
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 caller) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 caller) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p204053 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1))   e.g. tierA-000271 tierA-000272
;;   B: (And (Member $e0 receive) (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))

;; [unit]  p204054 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204055 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200330 ~ p200470   support 1 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   e.g. tierA-000217 tierA-000218
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))
;;   substitution: (Member $e0 answer) -> (Member $e0 give)
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Theme_GiveOrAnswer $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1)) (MnAgent_Theme_GiveOrAnswer $e0 $x0 $x1))

;; [unit, shape-parallel]  p205375 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 influence) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $e0 influence) (Past $e0) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 influence) (Past $e0)) (MnMember_Past_AgentOrSource $e0 $x0))
(Implication (And (Member $e0 influence) (Past $e0) (Source $e0 $x0)) (MnMember_Past_AgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p205531 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 influence))   e.g. tierC-000257 tierC-000258
;;   B: (And (Member $e0 influence) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 influence)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $e0 influence) (Source $e0 $x0)) (MnMember_AgentOrSource $e0 $x0))

;; [unit]  p204056 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 museum) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 museum) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204057 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $e0 borrow) (Member $x0 museum) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Member $x0 museum) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204901 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $e0 borrow) (Member $x0 museum) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 museum)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 borrow) (Member $x0 museum) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204058 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnMember_OrAgentMemberSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_OrAgentMemberSource $e0 $x0))

;; [unit]  p204059 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1)) (MnMember_Theme_OrAgentSource $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentSource $e0 $x0 $x1))

;; [unit]  p204059 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204902 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour)) (MnMember_OrAgentSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_OrAgentSource $e0 $x0))

;; [unit]  p204902 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204060 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 gallery) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204061 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $e0 borrow) (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))

;; [unit]  p205312 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnTheme_OrAgentMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentMemberSource $e0 $x0 $x1))

;; [unit]  p205377 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) (MnOrAgentMemberSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0)) (MnOrAgentMemberSource $e0 $x0))

;; [unit]  p200551 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnTheme_OrAgentSource $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentSource $e0 $x0 $x1))

;; [unit]  p200559 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnOrAgentSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Source $e0 $x0)) (MnOrAgentSource $e0 $x0))

;; [unit, shape-parallel]  p204065 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1))   e.g. tierA-000123 tierA-000124
;;   B: (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x0 club) (Theme $e0 $x1))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrPutOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x0 club) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrPutOff $e0 $x0 $x1))

;; [unit, shape-parallel]  p204903 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club))   e.g. tierA-000123 tierA-000124
;;   B: (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x0 club))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club)) (MnAgent_Member_PostponeOrPutOff $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x0 club)) (MnAgent_Member_PostponeOrPutOff $e0 $x0))

;; [unit, shape-parallel]  p204066 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1))   e.g. tierA-000123 tierA-000124
;;   B: (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x1 tournament) (Theme $e0 $x1))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrPutOff $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrPutOff $e0 $x0 $x1))

;; [unit]  p204069 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Recipient $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 elder) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 elder) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204070 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $e0 learn) (Member $x0 elder) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Member $x0 elder) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204904 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $e0 learn) (Member $x0 elder) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 elder)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Member $x0 elder) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204071 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 potter) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 potter) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204072 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $e0 learn) (Member $x0 potter) (Source $e0 $x0) (Theme $e0 glazing))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing)) (MnMember_Theme_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Member $x0 potter) (Source $e0 $x0) (Theme $e0 glazing)) (MnMember_Theme_OrMemberSource $e0 $x0))

;; [unit]  p204905 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $e0 learn) (Member $x0 potter) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Member $x0 potter) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit]  p204073 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204074 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $e0 learn) (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))

;; [unit]  p204075 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 song) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $e0 learn) (Member $x0 song) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 song) (Theme $e0 $x1)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Member $x0 song) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberSourceTheme $e0 $x0 $x1))

;; [unit]  p203273 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1) (Theme $e0 glazing))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Source $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p203404 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 glazing))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing)) (MnTheme_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 glazing)) (MnTheme_OrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p204079 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Theme $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Patient $e0 $x1))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Theme $e0 $x1)) (MnAgent_Member_Member_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 airline) (Member $x1 evening_flight) (Patient $e0 $x1)) (MnAgent_Member_Member_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204908 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 airline) (Theme $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Member $x0 airline) (Patient $e0 $x1))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 airline) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 airline) (Patient $e0 $x1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p201923 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 chef) (Member $x1 crate) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 chef) (Member $x1 crate) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p201924 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 chef) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 chef) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202783 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 chef) (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0)) (MnMember_Past_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 chef) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p202784 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 chef) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 chef) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p203627 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 chef) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 chef) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p204083 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Member_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Recipient $e0 $x1)) (MnAgent_Member_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p202785 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $x0 clerk) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Recipient $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p205538 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 crew))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $x0 crew) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 crew)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 crew) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p201181 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $x0 depot) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 depot) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201412 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $x0 depot) (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0)) (MnMember_Past_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 depot) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p200760 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $x0 depot) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 depot) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p200760 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $x0 depot) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 depot) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p200825 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot))   e.g. tierA-000001 tierA-000004
;;   B: (And (Member $x0 depot) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 depot) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p200825 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $x0 depot) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 depot) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit, shape-parallel]  p204084 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 elder) (Member $x1 song) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $x0 elder) (Member $x1 song) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Member $x1 song) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 elder) (Member $x1 song) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrSource $x0 $x1 $e0))

;; [unit]  p204085 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (Member $x1 elder) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 elder) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204911 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (Member $x1 elder) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 elder) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204912 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 elder) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $x0 elder) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 elder) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 elder) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205541 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 elder))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $x0 elder) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 elder)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 elder) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit]  p204090 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 museum) (Member $x1 gallery) (Recipient $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x0 gallery) (Member $x1 museum) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Member $x1 gallery) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gallery) (Member $x1 museum) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204091 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x1 museum) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 museum) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204917 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x1 museum) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 museum) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204918 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 museum) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $x0 museum) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 museum) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 museum) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205545 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 museum))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $x0 museum) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 museum)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 museum) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit]  p204092 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnMember_Theme_OrAgentSource $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentSource $e0 $x0 $x1))

;; [unit]  p204092 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. tierA-000297 tierA-000298
;;   B: (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204919 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnMember_OrAgentSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_OrAgentSource $e0 $x0))

;; [unit]  p204919 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))   e.g. tierA-000297 tierA-000298
;;   B: (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnMember_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 borrow) (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_OrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p204920 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 neighbour) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205546 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $x0 neighbour) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 neighbour) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit, shape-parallel]  p204094 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1))   e.g. tierA-000385 tierA-000386
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor) (Member $x1 scan) (Theme $e0 $x1))
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_PhysicianOrDoctor $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 doctor) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_PhysicianOrDoctor $e0 $x0 $x1))

;; [unit, shape-parallel]  p204095 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1))   e.g. tierA-000385 tierA-000386
;;   B: (And (Agent $e0 $x0) (Member $x0 doctor) (Ordinal $x1 <num> scan) (Theme $e0 $x1))
;;   substitution: (Member $x0 doctor) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Ordinal_Theme_PhysicianOrDoctor $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 doctor) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Ordinal_Theme_PhysicianOrDoctor $e0 $x0 $x1))

;; [unit, shape-parallel]  p204096 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Theme $e0 $x1))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Theme $e0 $x1)) (MnAgent_Member_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Member $x1 tower) (Recipient $e0 $x1)) (MnAgent_Member_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p202799 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pilot) (Theme $e0 $x1))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $x0 pilot) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pilot) (Recipient $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit]  p204097 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Member $x1 potter) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Member $x1 potter) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204098 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x1 potter) (Source $e0 $x1) (Theme $e0 glazing))
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 potter) (Source $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204921 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x1 potter) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 potter) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204922 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $x0 potter) (Source $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing)) (MnMember_Theme_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 potter) (Source $e0 $x0) (Theme $e0 glazing)) (MnMember_Theme_AgentOrSource $x0 $e0))

;; [unit, shape-parallel]  p205547 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $x0 potter) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 potter)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 potter) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit, shape-parallel]  p201184 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Member $x1 pottery_studio) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 kiln) (Member $x1 pottery_studio) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p204099 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> acquire) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> acquire) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> acquire) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204099 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> purchase) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> purchase) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> purchase) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204099 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 pottery_studio) (Ordinal $x1 <num> sell) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnMember_Theme_OrOrdinalRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 pottery_studio) (Ordinal $x1 <num> sell) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrOrdinalRecipient $x0 $x1 $e0))

;; [unit, shape-parallel]  p201185 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201415 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0)) (MnMember_Past_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 pottery_studio) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p201416 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 pottery_studio) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201687 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 pottery_studio) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 pottery_studio) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p201941 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 projector) (Member $x1 school) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 projector) (Member $x1 school) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $x1 $e0))

;; [unit]  p204100 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 winner) (Recipient $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x0 winner) (Member $x1 school) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 winner) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 winner) (Member $x1 school) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p201186 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 school) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Past $e0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 school) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Past_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201417 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 school) (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Past $e0)) (MnMember_Past_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 school) (Past $e0) (Recipient $e0 $x0)) (MnMember_Past_AgentOrRecipient $x0 $e0))

;; [unit]  p204101 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x1 school) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 school) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204923 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x1 school) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 school) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200620 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 school) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 school) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p200620 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $x0 school) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 school) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p200680 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 school) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 school) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p200680 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $x0 school) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 school)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 school) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit]  p204102 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 trainer) (Member $x1 recruit) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x0 recruit) (Member $x1 trainer) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Member $x1 recruit) (Recipient $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 recruit) (Member $x1 trainer) (Source $e0 $x1)) (MnAgent_OrMemberMemberSource $e0 $x0 $x1))

;; [unit]  p204103 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x1 trainer) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 trainer) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204924 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x1 trainer) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 trainer) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204925 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 trainer) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $x0 trainer) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 trainer) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 trainer) (Source $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205550 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 trainer))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $x0 trainer) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 trainer)) (MnMember_AgentOrSource $e0 $x0))
(Implication (And (Member $x0 trainer) (Source $e0 $x0)) (MnMember_AgentOrSource $x0 $e0))

;; [unit, shape-parallel]  p204929 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))   e.g. tierA-000217 tierA-000218
;;   B: (And (Agent $e0 $x0) (Member $x1 caller) (Theme $e0 $x1))
;;   substitution: (Member $x1 caller) -> (Member $x1 answer)
(Implication (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrCaller $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 caller) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrCaller $e0 $x0 $x1))

;; [unit]  p204106 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Source $e0 $x1) (Theme $e0 glazing))
(Implication (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Source $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p204930 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p201943 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 crate) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 crate) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202803 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1))   e.g. tierA-000015 tierA-000018
;;   B: (And (Member $x0 crate) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 crate) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204109 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 drill) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Agent $e0 $x0) (Member $x1 drill) (Source $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x2) -> (Recipient $e0 $x2)
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p202804 ~ p205035   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202804 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 drill) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p204937 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 evening_flight) (Theme $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Member $x1 evening_flight) (Patient $e0 $x1))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x1 evening_flight) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 evening_flight) (Patient $e0 $x1)) (MnAgent_Member_ThemeOrPatient $e0 $x0 $x1))

;; [unit]  p204110 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x0 gallery) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 gallery) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204938 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x0 gallery) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 gallery) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gallery) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204111 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 generator) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $x1 generator) (Source $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x2) -> (Recipient $e0 $x2)
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p202807 ~ p205038   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202807 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 generator) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p204112 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> acquire) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> acquire) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> acquire) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204112 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> purchase) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> purchase) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> purchase) (Theme $e0 $x1)) (MnAgent_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204112 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnOrMemberOrdinalRecipientTh $e0 $x0 $x1))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrMemberOrdinalRecipientTh $x0 $e0 $x1))

;; [unit, shape-parallel]  p201187 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 kiln) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p201418 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 kiln) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204113 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 manifest) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. tierA-000271 tierA-000272
;;   B: (And (Agent $e0 $x0) (Member $x1 manifest) (Source $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x2) -> (Recipient $e0 $x2)
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p202810 ~ p205039   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1))   e.g. tierA-000271 tierA-000272
;;   B: (And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202810 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1))   e.g. tierA-000271 tierA-000272
;;   B: (And (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p204940 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $x0 medal) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 medal) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204940 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Member $x0 medal) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 medal) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p204941 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $x0 painting) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 painting) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204941 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Member $x0 painting) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 painting) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p201948 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 projector) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1)) (MnPast_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 projector) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202813 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204942 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1))   e.g. tierA-000207 tierA-000208
;;   B: (And (Agent $e0 $x0) (Member $x1 query) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 query) (Recipient $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit]  p204114 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x0 recruit) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 recruit) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204943 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x0 recruit) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 recruit) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204115 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 song) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (Member $x1 song) (Source $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x2) -> (Recipient $e0 $x2)
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Member_Theme_RecipientOrSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p202818 ~ p205041   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p202818 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $x0 song) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 song) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p204944 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 tower) (Theme $e0 $x1))   e.g. tierA-000212 tierA-000213
;;   B: (And (Agent $e0 $x0) (Member $x1 tower) (Recipient $e0 $x1))
;;   substitution: (Recipient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x1 tower) (Theme $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 tower) (Recipient $e0 $x1)) (MnAgent_Member_ThemeOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204945 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $x0 whistle) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1)) (MnAgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 whistle) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnAgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p204945 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Member $x0 whistle) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1)) (MnAgentOrSource $e0 $x0 $x1))
(Implication (And (Member $x0 whistle) (Source $e0 $x1) (Theme $e0 $x0)) (MnAgentOrSource $x0 $e0 $x1))

;; [unit]  p204116 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x0 winner) (Source $e0 $x1) (Theme $e0 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x0 winner) (Source $e0 $x1) (Theme $e0 $x2)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p204946 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x0 winner) (Source $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 winner) (Source $e0 $x1)) (MnAgent_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p204117 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Ordinal $x1 <num> acquire) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> acquire) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> acquire) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204117 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Ordinal $x1 <num> purchase) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> purchase) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> purchase) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204117 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Ordinal $x0 <num> sell) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnPast_OrOrdinalRecipientTheme $e0 $x0 $x1))
(Implication (And (Ordinal $x0 <num> sell) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_OrOrdinalRecipientTheme $x0 $e0 $x1))

;; [unit, shape-parallel]  p204947 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000024
;;   B: (And (Agent $e0 $x0) (Ordinal $x1 <num> acquire) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> acquire) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> acquire) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204947 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000023
;;   B: (And (Agent $e0 $x0) (Ordinal $x1 <num> purchase) (Theme $e0 $x1))
;;   substitution: (Ordinal $x1 <num> purchase) -> (Ordinal $x1 <num> buy)
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> purchase) (Theme $e0 $x1)) (MnAgent_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit]  p204947 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. tierA-000022 tierA-000025
;;   B: (And (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnOrOrdinalRecipientTheme $e0 $x0 $x1))
(Implication (And (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrOrdinalRecipientTheme $x0 $e0 $x1))

;; [unit, shape-parallel]  p200073 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))   e.g. tierC-000257 tierC-000258
;;   B: (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1)) (MnPast_Theme_AgentOrSource $e0 $x0 $x1))
(Implication (And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1)) (MnPast_Theme_AgentOrSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p200033 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000257 tierC-000258
;;   B: (And (Past $e0) (Source $e0 $x0))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrSource $e0 $x0))
(Implication (And (Past $e0) (Source $e0 $x0)) (MnPast_AgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p200033 ~ p200041   support 1 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. tierC-000113 tierC-000114
;;   B: (And (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrTheme $e0 $x0))
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_AgentOrTheme $e0 $x0))

;; [unit, shape-parallel]  p203407 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 glazing))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_RecipientOrSource $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Source $e0 $x1) (Theme $e0 glazing)) (MnAgent_Theme_RecipientOrSource $e0 $x0 $x1))

;; [unit]  p205383 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnTheme_OrAgentSource $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentSource $e0 $x0 $x1))

;; [unit]  p205554 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Recipient $e0 ravi))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Source $e0 $x0))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi)) (MnOrAgentSource $e0 $x0))
(Implication (And (Agent $e0 ravi) (Source $e0 $x0)) (MnOrAgentSource $e0 $x0))

;; [unit, shape-parallel]  p200015 ~ p200053   support 1 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000143 tierA-000145
;;   B: (And (Agent $e0 $x0) (Patient $e0 $x1))
;;   substitution: (Patient $e0 $x1) -> (Theme $e0 $x1)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnAgent_ThemeOrPatient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (MnAgent_ThemeOrPatient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200015 ~ p200339   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000084 tierA-000085
;;   B: (And (Holder $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Holder $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrHolder $e0 $x0 $x1))
(Implication (And (Holder $e0 $x0) (Theme $e0 $x1)) (MnTheme_AgentOrHolder $e0 $x0 $x1))

;; [unit, shape-parallel]  p201690 ~ p203764   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Recipient $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Theme $e0 glazing)) (MnTheme_AgentOrRecipient $e0 $x0))
(Implication (And (Recipient $e0 $x0) (Theme $e0 glazing)) (MnTheme_AgentOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p201690 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Source $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Source $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Theme $e0 glazing)) (MnTheme_AgentOrSource $e0 $x0))
(Implication (And (Source $e0 $x0) (Theme $e0 glazing)) (MnTheme_AgentOrSource $e0 $x0))

;; [unit, shape-parallel]  p205386 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x0))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 jica) (Member $e0 finance) (Theme $e0 $x0))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 jica) (Member $e0 fund) (Theme $e0 $x0)) (MnAgent_Theme_FundOrFinance $e0 $x0))
(Implication (And (Agent $e0 jica) (Member $e0 finance) (Theme $e0 $x0)) (MnAgent_Theme_FundOrFinance $e0 $x0))

;; [unit, shape-parallel]  p205563 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Agent $e0 jica) (Member $e0 fund))   e.g. tierC-000245 tierC-000246
;;   B: (And (Agent $e0 jica) (Member $e0 finance))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Agent $e0 jica) (Member $e0 fund)) (MnAgent_FundOrFinance $e0))
(Implication (And (Agent $e0 jica) (Member $e0 finance)) (MnAgent_FundOrFinance $e0))

;; [unit]  p204121 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Member $e1 appear) (Past $e0) (Past $e1))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Member $e1 perform) (Past $e0) (Past $e1))
(Implication (And (Also appear $e0) (Member $e1 appear) (Past $e0) (Past $e1)) (MnPast_Past_OrAlsoMember $e0 $e1))
(Implication (And (Also perform $e0) (Member $e1 perform) (Past $e0) (Past $e1)) (MnPast_Past_OrAlsoMember $e0 $e1))

;; [unit]  p204953 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Member $e1 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Member $e1 perform) (Past $e0))
(Implication (And (Also appear $e0) (Member $e1 appear) (Past $e0)) (MnPast_OrAlsoMember $e0 $e1))
(Implication (And (Also perform $e0) (Member $e1 perform) (Past $e0)) (MnPast_OrAlsoMember $e0 $e1))

;; [unit]  p204954 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Member $e1 appear) (Past $e1))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Member $e1 perform) (Past $e1))
(Implication (And (Also appear $e0) (Member $e1 appear) (Past $e1)) (MnPast_OrAlsoMember $e0 $e1))
(Implication (And (Also perform $e0) (Member $e1 perform) (Past $e1)) (MnPast_OrAlsoMember $e0 $e1))

;; [unit]  p205269 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Member $e1 appear))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Member $e1 perform))
(Implication (And (Also appear $e0) (Member $e1 appear)) (MnOrAlsoMember $e0 $e1))
(Implication (And (Also perform $e0) (Member $e1 perform)) (MnOrAlsoMember $e0 $e1))

;; [unit, shape-parallel]  p201692 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Also appear $e0) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Also perform $e0) (Past $e0))
;;   substitution: (Also perform $e0) -> (Also appear $e0)
(Implication (And (Also appear $e0) (Past $e0)) (MnPast_AppearOrPerform $e0))
(Implication (And (Also perform $e0) (Past $e0)) (MnPast_AppearOrPerform $e0))

;; [unit, shape-parallel]  p204124 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204124 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p204124 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Past $e0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrSell $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Past $e0)) (MnBeneficiary_Member_Past_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p204125 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p204125 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit, shape-parallel]  p204125 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Theme $e0 $x1))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrSell $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_BuyOrSell $e0 $x0 $x1))

;; [unit, shape-parallel]  p204956 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrAcquire $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204956 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrPurchase $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p204956 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrSell $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Member $x0 hall)) (MnBeneficiary_Member_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p205314 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p205314 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit, shape-parallel]  p205314 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrSell $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_BuyOrSell $e0 $x0 $x1))

;; [unit, shape-parallel]  p205388 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Past $e0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0)) (MnBeneficiary_Past_BuyOrAcquire $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Past $e0)) (MnBeneficiary_Past_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p205388 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Past $e0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0)) (MnBeneficiary_Past_BuyOrPurchase $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Past $e0)) (MnBeneficiary_Past_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p205388 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Past $e0)) (MnBeneficiary_Past_BuyOrSell $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Past $e0)) (MnBeneficiary_Past_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p205389 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrAcquire $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrAcquire $e0 $x0 $x1))

;; [unit, shape-parallel]  p205389 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrPurchase $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrPurchase $e0 $x0 $x1))

;; [unit, shape-parallel]  p205389 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell) (Theme $e0 $x1))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrSell $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell) (Theme $e0 $x1)) (MnBeneficiary_Theme_BuyOrSell $e0 $x0 $x1))

;; [unit, shape-parallel]  p205566 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy))   e.g. tierA-000008 tierA-000010
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 acquire))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy)) (MnBeneficiary_BuyOrAcquire $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 acquire)) (MnBeneficiary_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p205566 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy))   e.g. tierA-000008 tierA-000009
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 purchase))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy)) (MnBeneficiary_BuyOrPurchase $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 purchase)) (MnBeneficiary_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p205566 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $e0 buy))   e.g. tierA-000008 tierA-000011
;;   B: (And (Beneficiary $e0 $x0) (Member $e0 sell))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Beneficiary $e0 $x0) (Member $e0 buy)) (MnBeneficiary_BuyOrSell $e0 $x0))
(Implication (And (Beneficiary $e0 $x0) (Member $e0 sell)) (MnBeneficiary_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p204126 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))   e.g. tierC-000145 tierC-000146
;;   B: (And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0)) (MnCan_Cardinality_Manner_WayOrManner $e0 $x0))
(Implication (And (Can $e0) (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0)) (MnCan_Cardinality_Manner_WayOrManner $e0 $x0))

;; [unit, shape-parallel]  p204127 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random)) (MnCan_Cardinality_Manner_RandomOrAccidental $e0 $x0))
(Implication (And (Can $e0) (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental)) (MnCan_Cardinality_Manner_RandomOrAccidental $e0 $x0))

;; [unit, shape-parallel]  p204128 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))   e.g. tierC-000145 tierC-000146
;;   B: (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define)) (MnCan_Manner_Member_WayOrManner $e0 $x0))
(Implication (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define)) (MnCan_Manner_Member_WayOrManner $e0 $x0))

;; [unit, shape-parallel]  p204129 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000145 tierC-000146
;;   B: (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1)) (MnCan_Manner_Theme_WayOrManner $e0 $x0 $x1))
(Implication (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1)) (MnCan_Manner_Theme_WayOrManner $e0 $x0 $x1))

;; [unit, shape-parallel]  p204957 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0))   e.g. tierC-000145 tierC-000146
;;   B: (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Can $e0) (GroupOf $x0 way) (Manner $e0 $x0)) (MnCan_Manner_WayOrManner $e0 $x0))
(Implication (And (Can $e0) (GroupOf $x0 manner) (Manner $e0 $x0)) (MnCan_Manner_WayOrManner $e0 $x0))

;; [unit, shape-parallel]  p204130 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random)) (MnCan_Manner_Member_RandomOrAccidental $e0 $x0))
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental)) (MnCan_Manner_Member_RandomOrAccidental $e0 $x0))

;; [unit, shape-parallel]  p204131 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (And (Can $e0) (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1)) (MnCan_Manner_Theme_RandomOrAccidental $e0 $x0 $x1))
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1)) (MnCan_Manner_Theme_RandomOrAccidental $e0 $x0 $x1))

;; [unit, shape-parallel]  p204958 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Can $e0) (Manner $e0 $x0) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Can $e0) (Manner $e0 $x0) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $x0 random)) (MnCan_Manner_RandomOrAccidental $e0 $x0))
(Implication (And (Can $e0) (Manner $e0 $x0) (Member $x0 accidental)) (MnCan_Manner_RandomOrAccidental $e0 $x0))

;; [unit, shape-parallel]  p201967 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 egg) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0)) (MnHolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 egg) (Theme $e0 $x1)) (MnHolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p201968 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_RequireOrNeed $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 egg) (Member $e0 need) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_RequireOrNeed $x0 $e0))

;; [unit, shape-parallel]  p204132 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 acquire) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p204132 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 purchase) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 purchase) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p204132 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 sell) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrSell $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 sell) (Theme $e0 $x0)) (MnCardinality_GroupOf_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p204133 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))   e.g. tierC-000145 tierC-000146
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define)) (MnCardinality_Manner_Member_WayOrManner $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define)) (MnCardinality_Manner_Member_WayOrManner $x0 $e0))

;; [unit, shape-parallel]  p204134 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000145 tierC-000146
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1)) (MnCardinality_Manner_Theme_WayOrManner $x0 $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1)) (MnCardinality_Manner_Theme_WayOrManner $x0 $e0 $x1))

;; [unit, shape-parallel]  p205390 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0))   e.g. tierC-000145 tierC-000146
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 way) (Manner $e0 $x0)) (MnCardinality_Manner_WayOrManner $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 manner) (Manner $e0 $x0)) (MnCardinality_Manner_WayOrManner $x0 $e0))

;; [unit, shape-parallel]  p205567 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 way))   e.g. tierC-000145 tierC-000146
;;   B: (And (Cardinality $x0 <num>) (GroupOf $x0 manner))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 way)) (MnCardinality_WayOrManner $x0))
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 manner)) (MnCardinality_WayOrManner $x0))

;; [unit, shape-parallel]  p201970 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 require) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnMember_HolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 require) (Theme $e0 $x1)) (MnMember_HolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p201970 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000085 tierA-000086
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnCardinality_Holder_Theme_RequireOrNeed $x0 $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 need) (Theme $e0 $x0)) (MnCardinality_Holder_Theme_RequireOrNeed $x0 $e0 $x1))

;; [unit, shape-parallel]  p201971 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 recipe) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0)) (MnHolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 recipe) (Theme $e0 $x1)) (MnHolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p204135 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 random)) (MnCardinality_Manner_Member_RandomOrAccidental $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental)) (MnCardinality_Manner_Member_RandomOrAccidental $x0 $e0))

;; [unit, shape-parallel]  p204136 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1)) (MnCardinality_Manner_Theme_RandomOrAccidental $x0 $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1)) (MnCardinality_Manner_Theme_RandomOrAccidental $x0 $e0 $x1))

;; [unit, shape-parallel]  p205391 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 random)) (MnCardinality_Manner_RandomOrAccidental $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Manner $e0 $x0) (Member $x0 accidental)) (MnCardinality_Manner_RandomOrAccidental $x0 $e0))

;; [unit, shape-parallel]  p201974 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Cardinality $x0 <num>) (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p201974 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Cardinality $x0 <num>) (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p201974 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Member $e0 sell) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrSell $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p202837 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (Cardinality $x0 <num>) (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 acquire) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p202837 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (Cardinality $x0 <num>) (Member $e0 purchase) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 purchase) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p202837 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (Cardinality $x0 <num>) (Member $e0 sell) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrSell $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 sell) (Theme $e0 $x0)) (MnCardinality_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p201426 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Cardinality $x0 <num>) (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0)) (MnCardinality_Theme_RequireOrNeed $x0 $e0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 need) (Theme $e0 $x0)) (MnCardinality_Theme_RequireOrNeed $x0 $e0))

;; [unit, shape-parallel]  p205568 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Cardinality $x0 <num>) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Cardinality $x0 <num>) (Member $x0 random)) (MnCardinality_RandomOrAccidental $x0))
(Implication (And (Cardinality $x0 <num>) (Member $x0 accidental)) (MnCardinality_RandomOrAccidental $x0))

;; [unit, shape-parallel]  p204139 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 discover) (Stimulus $e0 $e1))   e.g. tierA-000128 tierA-000129
;;   B: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 find_out) (Stimulus $e0 $e1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 discover) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_DiscoverOrFindOut $e0 $x0 $e1 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e0 find_out) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_DiscoverOrFindOut $e0 $x0 $e1 $x1))

;; [unit, shape-parallel]  p205394 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $e0 discover) (Stimulus $e0 $e1))   e.g. tierA-000128 tierA-000129
;;   B: (And (Experiencer $e0 $x0) (Member $e0 find_out) (Stimulus $e0 $e1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Experiencer $e0 $x0) (Member $e0 discover) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))
(Implication (And (Experiencer $e0 $x0) (Member $e0 find_out) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))

;; [unit, shape-parallel]  p205572 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $e0 discover))   e.g. tierA-000128 tierA-000129
;;   B: (And (Experiencer $e0 $x0) (Member $e0 find_out))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Experiencer $e0 $x0) (Member $e0 discover)) (MnExperiencer_DiscoverOrFindOut $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $e0 find_out)) (MnExperiencer_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p205576 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Future $e0) (Member $e0 arrive))   e.g. tierA-000241 tierA-000242
;;   B: (And (Future $e0) (Member $e0 arrival))
;;   substitution: (Member $e0 arrival) -> (Member $e0 arrive)
(Implication (And (Future $e0) (Member $e0 arrive)) (MnFuture_ArriveOrArrival $e0))
(Implication (And (Future $e0) (Member $e0 arrival)) (MnFuture_ArriveOrArrival $e0))

;; [unit]  p204148 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn) (Theme $e0 $x1))
(Implication (And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGroupOf_Theme_OrAgentMember $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn) (Theme $e0 $x1)) (MnGroupOf_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p204970 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn))
(Implication (And (GroupOf $x0 child) (Member $e0 teach) (Recipient $e0 $x0)) (MnGroupOf_OrAgentMember $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 learn)) (MnGroupOf_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p204149 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 child) (Member $x1 song) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $x1 song) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (GroupOf $x0 child) (Member $x1 song) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGroupOf_Member_Theme_RecipientOrAgent $x0 $x1 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Member $x1 song) (Theme $e0 $x1)) (MnGroupOf_Member_Theme_RecipientOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p204971 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 child) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 child) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (GroupOf $x0 child) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnGroupOf_Theme_RecipientOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child) (Theme $e0 $x1)) (MnGroupOf_Theme_RecipientOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p204150 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 egg) (Member $e0 require) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnMember_HolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 egg) (Member $e0 require) (Theme $e0 $x1)) (MnMember_HolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p204150 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000085 tierA-000086
;;   B: (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnGroupOf_Holder_Theme_RequireOrNeed $x0 $e0 $x1))
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $e0 need) (Theme $e0 $x0)) (MnGroupOf_Holder_Theme_RequireOrNeed $x0 $e0 $x1))

;; [unit, shape-parallel]  p201985 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 egg) (Member $x0 recipe) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Member $x1 recipe) (Theme $e0 $x0)) (MnHolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 egg) (Member $x0 recipe) (Theme $e0 $x1)) (MnHolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p202849 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 egg) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x1)
(Implication (And (GroupOf $x0 egg) (Holder $e0 $x1) (Theme $e0 $x0)) (MnHolderOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 egg) (Theme $e0 $x1)) (MnHolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p202850 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0))   e.g. tierA-000084 tierA-000085
;;   B: (And (GroupOf $x0 egg) (Member $e0 need) (Theme $e0 $x0))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (GroupOf $x0 egg) (Member $e0 require) (Theme $e0 $x0)) (MnGroupOf_Theme_RequireOrNeed $x0 $e0))
(Implication (And (GroupOf $x0 egg) (Member $e0 need) (Theme $e0 $x0)) (MnGroupOf_Theme_RequireOrNeed $x0 $e0))

;; [unit, shape-parallel]  p204151 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (GroupOf $x0 forklift) (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p204151 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (GroupOf $x0 forklift) (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p204151 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Member $e0 sell) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrSell $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p204972 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000003
;;   B: (And (GroupOf $x0 forklift) (Member $e0 acquire) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 acquire) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p204972 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000002
;;   B: (And (GroupOf $x0 forklift) (Member $e0 purchase) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 purchase) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p204972 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. tierA-000001 tierA-000004
;;   B: (And (GroupOf $x0 forklift) (Member $e0 sell) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrSell $x0 $e0))
(Implication (And (GroupOf $x0 forklift) (Member $e0 sell) (Theme $e0 $x0)) (MnGroupOf_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p204152 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 sequence) (GroupOf $x1 way) (Manner $e0 $x1) (Theme $e0 $x0))   e.g. tierC-000145 tierC-000146
;;   B: (And (GroupOf $x0 manner) (GroupOf $x1 sequence) (Manner $e0 $x0) (Theme $e0 $x1))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x1 way)
(Implication (And (GroupOf $x0 sequence) (GroupOf $x1 way) (Manner $e0 $x1) (Theme $e0 $x0)) (MnWayOrManner $x0 $x1 $e0))
(Implication (And (GroupOf $x0 manner) (GroupOf $x1 sequence) (Manner $e0 $x0) (Theme $e0 $x1)) (MnWayOrManner $x0 $x1 $e0))

;; [unit, shape-parallel]  p204153 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 random) (Theme $e0 $x0))   e.g. tierC-000261 tierC-000262
;;   B: (And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 accidental) (Theme $e0 $x0))
;;   substitution: (Member $x1 accidental) -> (Member $x1 random)
(Implication (And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 random) (Theme $e0 $x0)) (MnGroupOf_Manner_Theme_RandomOrAccidental $x0 $e0 $x1))
(Implication (And (GroupOf $x0 sequence) (Manner $e0 $x1) (Member $x1 accidental) (Theme $e0 $x0)) (MnGroupOf_Manner_Theme_RandomOrAccidental $x0 $e0 $x1))

;; [unit, shape-parallel]  p204154 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))   e.g. tierC-000145 tierC-000146
;;   B: (And (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1)) (MnManner_Member_Theme_WayOrManner $x0 $e0 $x1))
(Implication (And (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define) (Theme $e0 $x1)) (MnManner_Member_Theme_WayOrManner $x0 $e0 $x1))

;; [unit, shape-parallel]  p204974 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define))   e.g. tierC-000145 tierC-000146
;;   B: (And (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (GroupOf $x0 way) (Manner $e0 $x0) (Member $e0 define)) (MnManner_Member_WayOrManner $x0 $e0))
(Implication (And (GroupOf $x0 manner) (Manner $e0 $x0) (Member $e0 define)) (MnManner_Member_WayOrManner $x0 $e0))

;; [unit, shape-parallel]  p204975 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000145 tierC-000146
;;   B: (And (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (GroupOf $x0 way) (Manner $e0 $x0) (Theme $e0 $x1)) (MnManner_Theme_WayOrManner $x0 $e0 $x1))
(Implication (And (GroupOf $x0 manner) (Manner $e0 $x0) (Theme $e0 $x1)) (MnManner_Theme_WayOrManner $x0 $e0 $x1))

;; [unit, shape-parallel]  p205581 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (GroupOf $x0 way) (Manner $e0 $x0))   e.g. tierC-000145 tierC-000146
;;   B: (And (GroupOf $x0 manner) (Manner $e0 $x0))
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (And (GroupOf $x0 way) (Manner $e0 $x0)) (MnManner_WayOrManner $x0 $e0))
(Implication (And (GroupOf $x0 manner) (Manner $e0 $x0)) (MnManner_WayOrManner $x0 $e0))

;; [unit]  p205582 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 need))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (Member $e0 require))
(Implication (And (Holder $e0 $x0) (Member $e0 need)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 require)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p204158 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit) (Theme $e0 $x1))   e.g. tierA-000089 tierA-000090
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 permit) (Theme $e0 $x1))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit) (Theme $e0 $x1)) (MnHolder_Member_Theme_RequireOrNeed $e0 $x0 $x1))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 permit) (Theme $e0 $x1)) (MnHolder_Member_Theme_RequireOrNeed $e0 $x0 $x1))

;; [unit, shape-parallel]  p204978 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit))   e.g. tierA-000089 tierA-000090
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 permit))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 permit)) (MnHolder_Member_RequireOrNeed $e0 $x0))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 permit)) (MnHolder_Member_RequireOrNeed $e0 $x0))

;; [unit, shape-parallel]  p204159 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1)) (MnMember_Member_Theme_HolderOrAgent $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1)) (MnMember_Member_Theme_HolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p204159 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1))   e.g. tierA-000085 tierA-000086
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 recipe) (Theme $e0 $x1))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe) (Theme $e0 $x1)) (MnHolder_Member_Theme_RequireOrNeed $e0 $x0 $x1))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 recipe) (Theme $e0 $x1)) (MnHolder_Member_Theme_RequireOrNeed $e0 $x0 $x1))

;; [unit, shape-parallel]  p204979 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (Member $e0 require) (Member $x0 recipe))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe)) (MnMember_Member_HolderOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 require) (Member $x0 recipe)) (MnMember_Member_HolderOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204979 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe))   e.g. tierA-000085 tierA-000086
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 recipe))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x0 recipe)) (MnHolder_Member_RequireOrNeed $e0 $x0))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Member $x0 recipe)) (MnHolder_Member_RequireOrNeed $e0 $x0))

;; [unit, shape-parallel]  p201064 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (Member $e0 require) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Theme $e0 $x1)) (MnMember_Theme_HolderOrAgent $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 require) (Theme $e0 $x1)) (MnMember_Theme_HolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p200683 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require))   e.g. tierA-000084 tierA-000086
;;   B: (And (Agent $e0 $x0) (Member $e0 require))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $e0 require)) (MnMember_HolderOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 require)) (MnMember_HolderOrAgent $e0 $x0))

;; [unit, shape-parallel]  p202854 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1)) (MnMember_Theme_HolderOrAgent $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 recipe) (Theme $e0 $x1)) (MnMember_Theme_HolderOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p203668 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $x0 recipe))   e.g. tierA-000084 tierA-000085
;;   B: (And (Agent $e0 $x0) (Member $x0 recipe))
;;   substitution: (Agent $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $x0 recipe)) (MnMember_HolderOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 recipe)) (MnMember_HolderOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204161 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. tierA-000153 tierA-000154
;;   B: (And (Inheritance afternoon_session session) (Member $e0 call_off) (Member $x0 afternoon_session) (Patient $e0 $x0))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnInheritance_Member_Patient_CancelOrCallOff $e0 $x0))
(Implication (And (Inheritance afternoon_session session) (Member $e0 call_off) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnInheritance_Member_Patient_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p204982 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Theme $e0 $x0))   e.g. tierA-000143 tierA-000145
;;   B: (And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Theme $e0 $x0)) (MnInheritance_Member_ThemeOrPatient $x0 $e0))
(Implication (And (Inheritance evening_flight flight) (Member $x0 evening_flight) (Patient $e0 $x0)) (MnInheritance_Member_ThemeOrPatient $x0 $e0))

;; [unit, shape-parallel]  p204162 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))   e.g. tierA-000094 tierA-000095
;;   B: (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 need) (Theme $e0 monthly_servicing))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing)) (MnInheritance_Inheritance_Theme_RequireOrNeed $e0))
(Implication (And (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member $e0 need) (Theme $e0 monthly_servicing)) (MnInheritance_Inheritance_Theme_RequireOrNeed $e0))

;; [unit, shape-parallel]  p204985 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance monthly_servicing monthly) (Member $e0 require) (Theme $e0 monthly_servicing))   e.g. tierA-000094 tierA-000095
;;   B: (And (Inheritance monthly_servicing monthly) (Member $e0 need) (Theme $e0 monthly_servicing))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Inheritance monthly_servicing monthly) (Member $e0 require) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_RequireOrNeed $e0))
(Implication (And (Inheritance monthly_servicing monthly) (Member $e0 need) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_RequireOrNeed $e0))

;; [unit, shape-parallel]  p204986 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing))   e.g. tierA-000094 tierA-000095
;;   B: (And (Inheritance monthly_servicing servicing) (Member $e0 need) (Theme $e0 monthly_servicing))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Inheritance monthly_servicing servicing) (Member $e0 require) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_RequireOrNeed $e0))
(Implication (And (Inheritance monthly_servicing servicing) (Member $e0 need) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_RequireOrNeed $e0))

;; [unit, shape-parallel]  p204163 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. tierA-000109 tierA-000110
;;   B: (And (Inheritance north_route north) (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrGiveUp $e0 $x0))
(Implication (And (Inheritance north_route north) (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p204164 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. tierA-000109 tierA-000110
;;   B: (And (Inheritance north_route route) (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrGiveUp $e0 $x0))
(Implication (And (Inheritance north_route route) (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p204165 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Inheritance summer_fair fair) (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))   e.g. tierA-000148 tierA-000149
;;   B: (And (Inheritance summer_fair fair) (Member $e0 call_off) (Member $x0 summer_fair) (Patient $e0 $x0))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Inheritance summer_fair fair) (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0)) (MnInheritance_Member_Patient_CancelOrCallOff $e0 $x0))
(Implication (And (Inheritance summer_fair fair) (Member $e0 call_off) (Member $x0 summer_fair) (Patient $e0 $x0)) (MnInheritance_Member_Patient_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p201987 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Location $e0 $x0) (Member $e0 find_out) (Member $x0 point) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point) (Theme $e0 $x1)) (MnLocation_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $e0 find_out) (Member $x0 point) (Theme $e0 $x1)) (MnLocation_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p202861 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point))   e.g. tierA-000133 tierA-000134
;;   B: (And (Location $e0 $x0) (Member $e0 find_out) (Member $x0 point))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x0 point)) (MnLocation_Member_DiscoverOrFindOut $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 find_out) (Member $x0 point)) (MnLocation_Member_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p204167 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Location $e0 $x0) (Member $e0 find_out) (Member $x1 wreck) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $e0 find_out) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Member_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p203419 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))   e.g. tierA-000133 tierA-000134
;;   B: (And (Location $e0 $x0) (Member $e0 find_out) (Theme $e0 $x1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Theme $e0 $x1)) (MnLocation_Theme_DiscoverOrFindOut $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $e0 find_out) (Theme $e0 $x1)) (MnLocation_Theme_DiscoverOrFindOut $e0 $x0 $x1))

;; [unit, shape-parallel]  p203671 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover))   e.g. tierA-000133 tierA-000134
;;   B: (And (Location $e0 $x0) (Member $e0 find_out))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Location $e0 $x0) (Member $e0 discover)) (MnLocation_DiscoverOrFindOut $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 find_out)) (MnLocation_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p204169 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e1 discover) (Member $x0 ledger) (Stimulus $e1 $e0))   e.g. tierA-000128 tierA-000129
;;   B: (And (Location $e0 $x0) (Member $e1 find_out) (Member $x0 ledger) (Stimulus $e1 $e0))
;;   substitution: (Member $e1 find_out) -> (Member $e1 discover)
(Implication (And (Location $e0 $x0) (Member $e1 discover) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnLocation_Member_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))
(Implication (And (Location $e0 $x0) (Member $e1 find_out) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnLocation_Member_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))

;; [unit, shape-parallel]  p204992 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e1 discover) (Stimulus $e1 $e0))   e.g. tierA-000128 tierA-000129
;;   B: (And (Location $e0 $x0) (Member $e1 find_out) (Stimulus $e1 $e0))
;;   substitution: (Member $e1 find_out) -> (Member $e1 discover)
(Implication (And (Location $e0 $x0) (Member $e1 discover) (Stimulus $e1 $e0)) (MnLocation_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))
(Implication (And (Location $e0 $x0) (Member $e1 find_out) (Stimulus $e1 $e0)) (MnLocation_Stimulus_DiscoverOrFindOut $e0 $x0 $e1))

;; [unit, shape-parallel]  p200281 ~ p200401   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000069 tierC-000070
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1))
;;   substitution: (Experiencer $e0 $x0) -> (Theme $e0 $x1)
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (MnThemeOrExperiencer $e0 $x0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (MnThemeOrExperiencer $e0 $x0 $x1))

;; [unit, shape-parallel]  p200281 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Theme $e0 $x1))   e.g. tierC-000205 tierC-000206
;;   B: (And (Goal $e0 $x0) (Location $e0 $x1))
;;   substitution: (Goal $e0 $x0) -> (Theme $e0 $x1)
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (MnThemeOrGoal $e0 $x0 $x1))
(Implication (And (Goal $e0 $x0) (Location $e0 $x1)) (MnThemeOrGoal $e0 $x0 $x1))

;; [unit, shape-parallel]  p204170 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental) (Theme $e0 $x1))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random) (Theme $e0 $x1)) (MnManner_Member_Theme_RandomOrAccidental $e0 $x0 $x1))
(Implication (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental) (Theme $e0 $x1)) (MnManner_Member_Theme_RandomOrAccidental $e0 $x0 $x1))

;; [unit, shape-parallel]  p204994 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 random)) (MnManner_Member_RandomOrAccidental $e0 $x0))
(Implication (And (Manner $e0 $x0) (Member $e0 define) (Member $x0 accidental)) (MnManner_Member_RandomOrAccidental $e0 $x0))

;; [unit, shape-parallel]  p204995 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1))   e.g. tierC-000261 tierC-000262
;;   B: (And (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Manner $e0 $x0) (Member $x0 random) (Theme $e0 $x1)) (MnManner_Theme_RandomOrAccidental $e0 $x0 $x1))
(Implication (And (Manner $e0 $x0) (Member $x0 accidental) (Theme $e0 $x1)) (MnManner_Theme_RandomOrAccidental $e0 $x0 $x1))

;; [unit, shape-parallel]  p205592 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Manner $e0 $x0) (Member $x0 random))   e.g. tierC-000261 tierC-000262
;;   B: (And (Manner $e0 $x0) (Member $x0 accidental))
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (And (Manner $e0 $x0) (Member $x0 random)) (MnManner_RandomOrAccidental $e0 $x0))
(Implication (And (Manner $e0 $x0) (Member $x0 accidental)) (MnManner_RandomOrAccidental $e0 $x0))

;; [unit, shape-parallel]  p204171 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))   e.g. tierA-000104 tierA-000105
;;   B: (And (Member $e0 give_up) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1)) (MnMember_Possession_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Member $e0 give_up) (Member $x0 firm) (Possession $x1 $x0) (Theme $e0 $x1)) (MnMember_Possession_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204996 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. tierA-000109 tierA-000110
;;   B: (And (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrGiveUp $e0 $x0))
(Implication (And (Member $e0 give_up) (Member $x0 north_route) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p204172 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))   e.g. tierA-000104 tierA-000105
;;   B: (And (Member $e0 give_up) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0)) (MnMember_Possession_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Member $e0 give_up) (Member $x0 tender) (Possession $x0 $x1) (Theme $e0 $x0)) (MnMember_Possession_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit, shape-parallel]  p204997 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Member $x0 tender) (Theme $e0 $x0))   e.g. tierA-000104 tierA-000105
;;   B: (And (Member $e0 give_up) (Member $x0 tender) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Member $x0 tender) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrGiveUp $e0 $x0))
(Implication (And (Member $e0 give_up) (Member $x0 tender) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrGiveUp $e0 $x0))

;; [unit, shape-parallel]  p204998 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Possession $x0 $x1) (Theme $e0 $x0))   e.g. tierA-000104 tierA-000105
;;   B: (And (Member $e0 give_up) (Possession $x0 $x1) (Theme $e0 $x0))
;;   substitution: (Member $e0 give_up) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Possession $x0 $x1) (Theme $e0 $x0)) (MnPossession_Theme_AbandonOrGiveUp $e0 $x0 $x1))
(Implication (And (Member $e0 give_up) (Possession $x0 $x1) (Theme $e0 $x0)) (MnPossession_Theme_AbandonOrGiveUp $e0 $x0 $x1))

;; [unit]  p204999 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0))   e.g. tierA-000207 tierA-000208
;;   B: (And (Member $e0 give) (Member $x0 query) (Recipient $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 query) (Recipient $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))

;; [unit]  p205000 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 answer) (Member $x0 tower) (Theme $e0 $x0))   e.g. tierA-000212 tierA-000213
;;   B: (And (Member $e0 give) (Member $x0 tower) (Recipient $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 tower) (Theme $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 tower) (Recipient $e0 $x0)) (MnMember_OrMemberRecipient $e0 $x0))

;; [unit, shape-parallel]  p201704 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 appear) (Past $e0))   e.g. tierC-000127 tierC-000128
;;   B: (And (Member $e0 perform) (Past $e0))
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (And (Member $e0 appear) (Past $e0)) (MnPast_AppearOrPerform $e0))
(Implication (And (Member $e0 perform) (Past $e0)) (MnPast_AppearOrPerform $e0))

;; [unit]  p205402 ~ p205383   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnTheme_OrAgentRecipient $e0 $x0 $x1))

;; [unit]  p205598 ~ p205554   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 borrow) (Source $e0 $x0))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 $x0) (Recipient $e0 ravi))
(Implication (And (Member $e0 borrow) (Source $e0 $x0)) (MnOrAgentRecipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi)) (MnOrAgentRecipient $e0 $x0))

;; [unit, shape-parallel]  p201706 ~ p205646   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 borrow) (Theme $e0 $x0))   e.g. tierA-000297 tierA-000298
;;   B: (And (Recipient $e0 ravi) (Theme $e0 $x0))
;;   substitution: (Recipient $e0 ravi) -> (Member $e0 borrow)
(Implication (And (Member $e0 borrow) (Theme $e0 $x0)) (MnTheme_BorrowOrRavi $e0 $x0))
(Implication (And (Recipient $e0 ravi) (Theme $e0 $x0)) (MnTheme_BorrowOrRavi $e0 $x0))

;; [unit, shape-parallel]  p204175 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Member $e0 acquire) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p204175 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Member $e0 purchase) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p204175 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrSell $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p205002 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Member $e0 acquire) (Member $x0 kiln) (Theme $e0 $x0))
;;   substitution: (Member $e0 acquire) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrAcquire $e0 $x0))
(Implication (And (Member $e0 acquire) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrAcquire $e0 $x0))

;; [unit, shape-parallel]  p205002 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Member $e0 purchase) (Member $x0 kiln) (Theme $e0 $x0))
;;   substitution: (Member $e0 purchase) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrPurchase $e0 $x0))
(Implication (And (Member $e0 purchase) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrPurchase $e0 $x0))

;; [unit, shape-parallel]  p205002 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $e0 sell) (Member $x0 kiln) (Theme $e0 $x0))
;;   substitution: (Member $e0 sell) -> (Member $e0 buy)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrSell $e0 $x0))
(Implication (And (Member $e0 sell) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Theme_BuyOrSell $e0 $x0))

;; [unit, shape-parallel]  p205004 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. tierA-000153 tierA-000154
;;   B: (And (Member $e0 call_off) (Member $x0 afternoon_session) (Patient $e0 $x0))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnMember_Patient_CancelOrCallOff $e0 $x0))
(Implication (And (Member $e0 call_off) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnMember_Patient_CancelOrCallOff $e0 $x0))

;; [unit, shape-parallel]  p205005 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))   e.g. tierA-000148 tierA-000149
;;   B: (And (Member $e0 call_off) (Member $x0 summer_fair) (Patient $e0 $x0))
;;   substitution: (Member $e0 call_off) -> (Member $e0 cancel)
(Implication (And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0)) (MnMember_Patient_CancelOrCallOff $e0 $x0))
(Implication (And (Member $e0 call_off) (Member $x0 summer_fair) (Patient $e0 $x0)) (MnMember_Patient_CancelOrCallOff $e0 $x0))

;; [unit]  p200834 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Patient $e0 $x0))   e.g. tierA-000144 tierA-000145
;;   B: (And (Member $e0 call_off) (Theme $e0 $x0))
(Implication (And (Member $e0 cancel) (Patient $e0 $x0)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 call_off) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p200834 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Patient $e0 $x0))   e.g. tierA-000143 tierA-000145
;;   B: (And (Member $e0 cancel) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 cancel) (Patient $e0 $x0)) (MnMember_PatientOrTheme $e0 $x0))
(Implication (And (Member $e0 cancel) (Theme $e0 $x0)) (MnMember_PatientOrTheme $e0 $x0))

;; [unit, shape-parallel]  p205600 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 conduct) (Past $e0))   e.g. tierC-000283 tierC-000284
;;   B: (And (Member $e0 hold) (Past $e0))
;;   substitution: (Member $e0 hold) -> (Member $e0 conduct)
(Implication (And (Member $e0 conduct) (Past $e0)) (MnPast_ConductOrHold $e0))
(Implication (And (Member $e0 hold) (Past $e0)) (MnPast_ConductOrHold $e0))

;; [unit, shape-parallel]  p205407 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_DirectOrStage $e0 $x0))
(Implication (And (Member $e0 stage) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_DirectOrStage $e0 $x0))

;; [unit, shape-parallel]  p205603 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Past $e0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Past $e0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Past $e0)) (MnPast_DirectOrStage $e0))
(Implication (And (Member $e0 stage) (Past $e0)) (MnPast_DirectOrStage $e0))

;; [unit]  p201708 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000009 tierC-000010
;;   B: (And (Experiencer $e0 $x0) (Member $e0 destined))
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnOrExperiencerMember $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $e0 destined)) (MnOrExperiencerMember $e0 $x0))

;; [unit, shape-parallel]  p201708 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000137 tierC-000138
;;   B: (And (Member $e0 address) (Patient $e0 $x0))
;;   substitution: (Member $e0 address) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnPatient_DirectOrAddress $e0 $x0))
(Implication (And (Member $e0 address) (Patient $e0 $x0)) (MnPatient_DirectOrAddress $e0 $x0))

;; [unit, shape-parallel]  p201708 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 direct) (Patient $e0 $x0))   e.g. tierC-000091 tierC-000092
;;   B: (And (Member $e0 stage) (Patient $e0 $x0))
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (And (Member $e0 direct) (Patient $e0 $x0)) (MnPatient_DirectOrStage $e0 $x0))
(Implication (And (Member $e0 stage) (Patient $e0 $x0)) (MnPatient_DirectOrStage $e0 $x0))

;; [unit, shape-parallel]  p204183 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))   e.g. tierA-000138 tierA-000139
;;   B: (And (Member $e0 find_out) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0)) (MnMember_Member_Theme_DiscoverOrFindOut $e0 $x0))
(Implication (And (Member $e0 find_out) (Member $x0 file) (Member $x0 missing) (Theme $e0 $x0)) (MnMember_Member_Theme_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p205014 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Member $x0 file) (Theme $e0 $x0))   e.g. tierA-000138 tierA-000139
;;   B: (And (Member $e0 find_out) (Member $x0 file) (Theme $e0 $x0))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Member $x0 file) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))
(Implication (And (Member $e0 find_out) (Member $x0 file) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p205015 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Member $x0 missing) (Theme $e0 $x0))   e.g. tierA-000138 tierA-000139
;;   B: (And (Member $e0 find_out) (Member $x0 missing) (Theme $e0 $x0))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Member $x0 missing) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))
(Implication (And (Member $e0 find_out) (Member $x0 missing) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p205016 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0))   e.g. tierA-000133 tierA-000134
;;   B: (And (Member $e0 find_out) (Member $x0 wreck) (Theme $e0 $x0))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))
(Implication (And (Member $e0 find_out) (Member $x0 wreck) (Theme $e0 $x0)) (MnMember_Theme_DiscoverOrFindOut $e0 $x0))

;; [unit, shape-parallel]  p205604 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 discover) (Stimulus $e0 $e1))   e.g. tierA-000128 tierA-000129
;;   B: (And (Member $e0 find_out) (Stimulus $e0 $e1))
;;   substitution: (Member $e0 find_out) -> (Member $e0 discover)
(Implication (And (Member $e0 discover) (Stimulus $e0 $e1)) (MnStimulus_DiscoverOrFindOut $e0 $e1))
(Implication (And (Member $e0 find_out) (Stimulus $e0 $e1)) (MnStimulus_DiscoverOrFindOut $e0 $e1))

;; [unit, shape-parallel]  p205608 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 form) (Patient $e0 $x0))   e.g. tierC-000163 tierC-000164
;;   B: (And (Agent $e0 $x0) (Member $e0 form))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 form) (Patient $e0 $x0)) (MnMember_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 form)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205609 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 fund) (Theme $e0 $x0))   e.g. tierC-000245 tierC-000246
;;   B: (And (Member $e0 finance) (Theme $e0 $x0))
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (And (Member $e0 fund) (Theme $e0 $x0)) (MnTheme_FundOrFinance $e0 $x0))
(Implication (And (Member $e0 finance) (Theme $e0 $x0)) (MnTheme_FundOrFinance $e0 $x0))

;; [unit]  p205017 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))   e.g. tierA-000217 tierA-000218
;;   B: (And (Member $e0 answer) (Member $x0 caller) (Theme $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 caller) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit]  p204185 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000271 tierA-000272
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 manifest) (Theme $e0 $x1))
(Implication (And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 manifest) (Theme $e0 $x1)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p205018 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 manifest) (Theme $e0 $x0))   e.g. tierA-000271 tierA-000272
;;   B: (And (Member $e0 receive) (Member $x0 manifest) (Theme $e0 $x0))
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (And (Member $e0 give) (Member $x0 manifest) (Theme $e0 $x0)) (MnMember_Theme_GiveOrReceive $e0 $x0))
(Implication (And (Member $e0 receive) (Member $x0 manifest) (Theme $e0 $x0)) (MnMember_Theme_GiveOrReceive $e0 $x0))

;; [unit]  p204186 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit) (Theme $e0 $x1))
(Implication (And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p205019 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit))
(Implication (And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0)) (MnMember_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 recruit)) (MnMember_OrAgentMember $e0 $x0))

;; [unit]  p204187 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner) (Theme $e0 $x1))
(Implication (And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p205020 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner))
(Implication (And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0)) (MnMember_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x0 winner)) (MnMember_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p200341 ~ p200486   support 1 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Theme $e0 $x0))   e.g. tierA-000217 tierA-000218
;;   B: (And (Member $e0 answer) (Theme $e0 $x0))
;;   substitution: (Member $e0 answer) -> (Member $e0 give)
(Implication (And (Member $e0 give) (Theme $e0 $x0)) (MnTheme_GiveOrAnswer $e0 $x0))
(Implication (And (Member $e0 answer) (Theme $e0 $x0)) (MnTheme_GiveOrAnswer $e0 $x0))

;; [unit]  p204188 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery) (Theme $e0 $x1))
(Implication (And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery) (Theme $e0 $x1)) (MnMember_Theme_OrAgentMember $e0 $x0 $x1))

;; [unit]  p205021 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery))
(Implication (And (Member $e0 lend) (Member $x0 gallery) (Recipient $e0 $x0)) (MnMember_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x0 gallery)) (MnMember_OrAgentMember $e0 $x0))

;; [unit]  p204189 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000301 tierA-000302
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 generator) (Theme $e0 $x1))
(Implication (And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 generator) (Theme $e0 $x1)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p205022 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 generator) (Theme $e0 $x0))   e.g. tierA-000301 tierA-000302
;;   B: (And (Member $e0 borrow) (Member $x0 generator) (Theme $e0 $x0))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Member $e0 lend) (Member $x0 generator) (Theme $e0 $x0)) (MnMember_Theme_LendOrBorrow $e0 $x0))
(Implication (And (Member $e0 borrow) (Member $x0 generator) (Theme $e0 $x0)) (MnMember_Theme_LendOrBorrow $e0 $x0))

;; [unit, shape-parallel]  p205023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Member $x0 ladder) (Theme $e0 $x0))
;;   substitution: (Agent $e0 ravi) -> (Member $e0 lend)
(Implication (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0)) (MnMember_Theme_LendOrRavi $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $x0 ladder) (Theme $e0 $x0)) (MnMember_Theme_LendOrRavi $e0 $x0))

;; [unit, shape-parallel]  p205023 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0))   e.g. tierA-000296 tierA-000297
;;   B: (And (Member $e0 borrow) (Member $x0 ladder) (Theme $e0 $x0))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0)) (MnMember_Theme_LendOrBorrow $e0 $x0))
(Implication (And (Member $e0 borrow) (Member $x0 ladder) (Theme $e0 $x0)) (MnMember_Theme_LendOrBorrow $e0 $x0))

;; [unit]  p205408 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $e0 borrow) (Theme $e0 $x0))
(Implication (And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0)) (MnTheme_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 borrow) (Theme $e0 $x0)) (MnTheme_OrAgentMember $e0 $x0))

;; [unit]  p205612 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 ravi))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Member $e0 borrow))
(Implication (And (Member $e0 lend) (Recipient $e0 ravi)) (MnOrAgentMember $e0))
(Implication (And (Agent $e0 ravi) (Member $e0 borrow)) (MnOrAgentMember $e0))

;; [unit, shape-parallel]  p200488 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 lend) (Theme $e0 $x0))   e.g. tierA-000297 tierA-000298
;;   B: (And (Agent $e0 ravi) (Theme $e0 $x0))
;;   substitution: (Agent $e0 ravi) -> (Member $e0 lend)
(Implication (And (Member $e0 lend) (Theme $e0 $x0)) (MnTheme_LendOrRavi $e0 $x0))
(Implication (And (Agent $e0 ravi) (Theme $e0 $x0)) (MnTheme_LendOrRavi $e0 $x0))

;; [unit, shape-parallel]  p205027 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0))   e.g. tierA-000123 tierA-000124
;;   B: (And (Member $e0 put_off) (Member $x0 tournament) (Theme $e0 $x0))
;;   substitution: (Member $e0 put_off) -> (Member $e0 postpone)
(Implication (And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0)) (MnMember_Theme_PostponeOrPutOff $e0 $x0))
(Implication (And (Member $e0 put_off) (Member $x0 tournament) (Theme $e0 $x0)) (MnMember_Theme_PostponeOrPutOff $e0 $x0))

;; [unit, shape-parallel]  p203712 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 replace) (Past $e0))   e.g. tierC-000099 tierC-000100
;;   B: (And (Member $e0 dissolve) (Past $e0))
;;   substitution: (Member $e0 dissolve) -> (Member $e0 replace)
(Implication (And (Member $e0 replace) (Past $e0)) (MnPast_ReplaceOrDissolve $e0))
(Implication (And (Member $e0 dissolve) (Past $e0)) (MnPast_ReplaceOrDissolve $e0))

;; [unit, shape-parallel]  p203712 ~ p205617   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 replace) (Past $e0))   e.g. tierC-000099 tierC-000100
;;   B: (And (Member $e0 succeed) (Past $e0))
;;   substitution: (Member $e0 succeed) -> (Member $e0 replace)
(Implication (And (Member $e0 replace) (Past $e0)) (MnPast_ReplaceOrSucceed $e0))
(Implication (And (Member $e0 succeed) (Past $e0)) (MnPast_ReplaceOrSucceed $e0))

;; [unit, shape-parallel]  p205615 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 require) (Theme $e0 monthly_servicing))   e.g. tierA-000094 tierA-000095
;;   B: (And (Member $e0 need) (Theme $e0 monthly_servicing))
;;   substitution: (Member $e0 need) -> (Member $e0 require)
(Implication (And (Member $e0 require) (Theme $e0 monthly_servicing)) (MnTheme_RequireOrNeed $e0))
(Implication (And (Member $e0 need) (Theme $e0 monthly_servicing)) (MnTheme_RequireOrNeed $e0))

;; [unit, shape-parallel]  p205616 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 speak) (Past $e0))   e.g. tierC-000093 tierC-000094
;;   B: (And (Member $e0 voice) (Past $e0))
;;   substitution: (Member $e0 voice) -> (Member $e0 speak)
(Implication (And (Member $e0 speak) (Past $e0)) (MnPast_SpeakOrVoice $e0))
(Implication (And (Member $e0 voice) (Past $e0)) (MnPast_SpeakOrVoice $e0))

;; [unit]  p204191 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice) (Theme $e0 glazing))
(Implication (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnMember_Theme_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice) (Theme $e0 glazing)) (MnMember_Theme_OrAgentMember $e0 $x0))

;; [unit]  p205030 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice))
(Implication (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0)) (MnMember_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x0 apprentice)) (MnMember_OrAgentMember $e0 $x0))

;; [unit]  p204192 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000286 tierA-000287
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 drill) (Theme $e0 $x1))
(Implication (And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 drill) (Theme $e0 $x1)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p205031 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 drill) (Theme $e0 $x0))   e.g. tierA-000286 tierA-000287
;;   B: (And (Member $e0 learn) (Member $x0 drill) (Theme $e0 $x0))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Member $e0 teach) (Member $x0 drill) (Theme $e0 $x0)) (MnMember_Theme_TeachOrLearn $e0 $x0))
(Implication (And (Member $e0 learn) (Member $x0 drill) (Theme $e0 $x0)) (MnMember_Theme_TeachOrLearn $e0 $x0))

;; [unit]  p204193 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. tierA-000291 tierA-000292
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 song) (Theme $e0 $x1))
(Implication (And (Member $e0 teach) (Member $x0 song) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 song) (Theme $e0 $x1)) (MnOrAgentMemberMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p205032 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 song) (Theme $e0 $x0))   e.g. tierA-000291 tierA-000292
;;   B: (And (Member $e0 learn) (Member $x0 song) (Theme $e0 $x0))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Member $e0 teach) (Member $x0 song) (Theme $e0 $x0)) (MnMember_Theme_TeachOrLearn $e0 $x0))
(Implication (And (Member $e0 learn) (Member $x0 song) (Theme $e0 $x0)) (MnMember_Theme_TeachOrLearn $e0 $x0))

;; [unit]  p203441 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 glazing))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnTheme_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 glazing)) (MnTheme_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p203718 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $e0 teach) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Member $e0 learn) (Theme $e0 glazing))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Member $e0 teach) (Theme $e0 glazing)) (MnTheme_TeachOrLearn $e0))
(Implication (And (Member $e0 learn) (Theme $e0 glazing)) (MnTheme_TeachOrLearn $e0))

;; [unit, shape-parallel]  p205620 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 answer) (Theme $e0 $x0))   e.g. tierA-000217 tierA-000218
;;   B: (And (Member $x0 caller) (Theme $e0 $x0))
;;   substitution: (Member $x0 caller) -> (Member $x0 answer)
(Implication (And (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_AnswerOrCaller $x0 $e0))
(Implication (And (Member $x0 caller) (Theme $e0 $x0)) (MnTheme_AnswerOrCaller $x0 $e0))

;; [unit, shape-parallel]  p205034 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Theme $e0 glazing))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnMember_Theme_RecipientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Theme $e0 glazing)) (MnMember_Theme_RecipientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205621 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 apprentice) (Recipient $e0 $x0))   e.g. tierA-000281 tierA-000282
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 apprentice) (Recipient $e0 $x0)) (MnMember_RecipientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice)) (MnMember_RecipientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205628 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 evening_flight) (Theme $e0 $x0))   e.g. tierA-000143 tierA-000145
;;   B: (And (Member $x0 evening_flight) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 evening_flight) (Theme $e0 $x0)) (MnMember_ThemeOrPatient $x0 $e0))
(Implication (And (Member $x0 evening_flight) (Patient $e0 $x0)) (MnMember_ThemeOrPatient $x0 $e0))

;; [unit, shape-parallel]  p205037 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x0 gallery) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 gallery) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gallery) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p205632 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 gallery) (Recipient $e0 $x0))   e.g. tierA-000306 tierA-000307
;;   B: (And (Agent $e0 $x0) (Member $x0 gallery))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 gallery) (Recipient $e0 $x0)) (MnMember_RecipientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 gallery)) (MnMember_RecipientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204195 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> acquire) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p204195 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> purchase) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p204195 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrSell $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p205411 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> acquire) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnMember_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> acquire) (Theme $e0 $x0)) (MnMember_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p205411 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> purchase) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnMember_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> purchase) (Theme $e0 $x0)) (MnMember_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p205411 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnMember_Theme_BuyOrSell $x0 $e0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> sell) (Theme $e0 $x0)) (MnMember_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p203735 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy))   e.g. tierA-000022 tierA-000024
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> acquire))
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy)) (MnMember_BuyOrAcquire $x0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> acquire)) (MnMember_BuyOrAcquire $x0))

;; [unit, shape-parallel]  p203735 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy))   e.g. tierA-000022 tierA-000023
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> purchase))
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy)) (MnMember_BuyOrPurchase $x0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> purchase)) (MnMember_BuyOrPurchase $x0))

;; [unit, shape-parallel]  p203735 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy))   e.g. tierA-000022 tierA-000025
;;   B: (And (Member $x0 kiln) (Ordinal $x0 <num> sell))
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy)) (MnMember_BuyOrSell $x0))
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> sell)) (MnMember_BuyOrSell $x0))

;; [unit, shape-parallel]  p205637 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 query) (Theme $e0 $x0))   e.g. tierA-000207 tierA-000208
;;   B: (And (Member $x0 query) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 query) (Theme $e0 $x0)) (MnMember_ThemeOrRecipient $x0 $e0))
(Implication (And (Member $x0 query) (Recipient $e0 $x0)) (MnMember_ThemeOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p205040 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x0 recruit) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 recruit) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p205638 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 recruit) (Recipient $e0 $x0))   e.g. tierA-000261 tierA-000262
;;   B: (And (Agent $e0 $x0) (Member $x0 recruit))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 recruit) (Recipient $e0 $x0)) (MnMember_RecipientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 recruit)) (MnMember_RecipientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205639 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 tower) (Theme $e0 $x0))   e.g. tierA-000212 tierA-000213
;;   B: (And (Member $x0 tower) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 tower) (Theme $e0 $x0)) (MnMember_ThemeOrRecipient $x0 $e0))
(Implication (And (Member $x0 tower) (Recipient $e0 $x0)) (MnMember_ThemeOrRecipient $x0 $e0))

;; [unit, shape-parallel]  p205042 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x0 winner) (Theme $e0 $x1))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 winner) (Theme $e0 $x1)) (MnMember_Theme_RecipientOrAgent $e0 $x0 $x1))

;; [unit, shape-parallel]  p205641 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Member $x0 winner) (Recipient $e0 $x0))   e.g. tierA-000276 tierA-000277
;;   B: (And (Agent $e0 $x0) (Member $x0 winner))
;;   substitution: (Agent $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Member $x0 winner) (Recipient $e0 $x0)) (MnMember_RecipientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 winner)) (MnMember_RecipientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205043 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Ordinal $x0 <num> acquire) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrAcquire $x0 $e0))
(Implication (And (Ordinal $x0 <num> acquire) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p205043 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Ordinal $x0 <num> purchase) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrPurchase $x0 $e0))
(Implication (And (Ordinal $x0 <num> purchase) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p205043 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Ordinal $x0 <num> sell) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrSell $x0 $e0))
(Implication (And (Ordinal $x0 <num> sell) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p205642 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000024
;;   B: (And (Ordinal $x0 <num> acquire) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnTheme_BuyOrAcquire $x0 $e0))
(Implication (And (Ordinal $x0 <num> acquire) (Theme $e0 $x0)) (MnTheme_BuyOrAcquire $x0 $e0))

;; [unit, shape-parallel]  p205642 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000023
;;   B: (And (Ordinal $x0 <num> purchase) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnTheme_BuyOrPurchase $x0 $e0))
(Implication (And (Ordinal $x0 <num> purchase) (Theme $e0 $x0)) (MnTheme_BuyOrPurchase $x0 $e0))

;; [unit, shape-parallel]  p205642 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. tierA-000022 tierA-000025
;;   B: (And (Ordinal $x0 <num> sell) (Theme $e0 $x0))
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (And (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnTheme_BuyOrSell $x0 $e0))
(Implication (And (Ordinal $x0 <num> sell) (Theme $e0 $x0)) (MnTheme_BuyOrSell $x0 $e0))

;; [unit, shape-parallel]  p205646 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (And (Recipient $e0 ravi) (Theme $e0 $x0))   e.g. tierA-000296 tierA-000297
;;   B: (And (Agent $e0 ravi) (Theme $e0 $x0))
;;   substitution: (Agent $e0 ravi) -> (Recipient $e0 ravi)
(Implication (And (Recipient $e0 ravi) (Theme $e0 $x0)) (MnTheme_RaviOrRavi $e0 $x0))
(Implication (And (Agent $e0 ravi) (Theme $e0 $x0)) (MnTheme_RaviOrRavi $e0 $x0))

;; [unit, shape-parallel]  p205744 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (GroupOf $x0 way)   e.g. tierC-000145 tierC-000146
;;   B: (GroupOf $x0 manner)
;;   substitution: (GroupOf $x0 manner) -> (GroupOf $x0 way)
(Implication (GroupOf $x0 way) (MnWayOrManner $x0))
(Implication (GroupOf $x0 manner) (MnWayOrManner $x0))

;; [unit, shape-parallel]  p201761 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 appear)   e.g. tierC-000127 tierC-000128
;;   B: (Member $e0 perform)
;;   substitution: (Member $e0 perform) -> (Member $e0 appear)
(Implication (Member $e0 appear) (MnAppearOrPerform $e0))
(Implication (Member $e0 perform) (MnAppearOrPerform $e0))

;; [unit, shape-parallel]  p201762 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 be)   e.g. tierC-000211 tierC-000212
;;   B: (Member $e0 situate)
;;   substitution: (Member $e0 situate) -> (Member $e0 be)
(Implication (Member $e0 be) (MnBeOrSituate $e0))
(Implication (Member $e0 situate) (MnBeOrSituate $e0))

;; [unit, shape-parallel]  p201763 ~ p205781   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 borrow)   e.g. tierA-000297 tierA-000298
;;   B: (Recipient $e0 ravi)
;;   substitution: (Recipient $e0 ravi) -> (Member $e0 borrow)
(Implication (Member $e0 borrow) (MnBorrowOrRavi $e0))
(Implication (Recipient $e0 ravi) (MnBorrowOrRavi $e0))

;; [unit, shape-parallel]  p205751 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 conduct)   e.g. tierC-000283 tierC-000284
;;   B: (Member $e0 hold)
;;   substitution: (Member $e0 hold) -> (Member $e0 conduct)
(Implication (Member $e0 conduct) (MnConductOrHold $e0))
(Implication (Member $e0 hold) (MnConductOrHold $e0))

;; [unit, shape-parallel]  p201765 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 direct)   e.g. tierC-000137 tierC-000138
;;   B: (Member $e0 address)
;;   substitution: (Member $e0 address) -> (Member $e0 direct)
(Implication (Member $e0 direct) (MnDirectOrAddress $e0))
(Implication (Member $e0 address) (MnDirectOrAddress $e0))

;; [unit, shape-parallel]  p201765 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 direct)   e.g. tierC-000009 tierC-000010
;;   B: (Member $e0 destined)
;;   substitution: (Member $e0 destined) -> (Member $e0 direct)
(Implication (Member $e0 direct) (MnDirectOrDestined $e0))
(Implication (Member $e0 destined) (MnDirectOrDestined $e0))

;; [unit, shape-parallel]  p201765 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 direct)   e.g. tierC-000091 tierC-000092
;;   B: (Member $e0 stage)
;;   substitution: (Member $e0 stage) -> (Member $e0 direct)
(Implication (Member $e0 direct) (MnDirectOrStage $e0))
(Implication (Member $e0 stage) (MnDirectOrStage $e0))

;; [unit, shape-parallel]  p205755 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 fund)   e.g. tierC-000245 tierC-000246
;;   B: (Member $e0 finance)
;;   substitution: (Member $e0 finance) -> (Member $e0 fund)
(Implication (Member $e0 fund) (MnFundOrFinance $e0))
(Implication (Member $e0 finance) (MnFundOrFinance $e0))

;; [unit, shape-parallel]  p203881 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 give_up)   e.g. tierC-000111 tierC-000112
;;   B: (Member $e0 give_on)
;;   substitution: (Member $e0 give_on) -> (Member $e0 give_up)
(Implication (Member $e0 give_up) (MnGiveUpOrGiveOn $e0))
(Implication (Member $e0 give_on) (MnGiveUpOrGiveOn $e0))

;; [unit, shape-parallel]  p200501 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 lend)   e.g. tierA-000297 tierA-000298
;;   B: (Agent $e0 ravi)
;;   substitution: (Agent $e0 ravi) -> (Member $e0 lend)
(Implication (Member $e0 lend) (MnLendOrRavi $e0))
(Implication (Agent $e0 ravi) (MnLendOrRavi $e0))

;; [unit, shape-parallel]  p200853 ~ p201762   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 locate)   e.g. tierC-000215 tierC-000216
;;   B: (Member $e0 be)
;;   substitution: (Member $e0 be) -> (Member $e0 locate)
(Implication (Member $e0 locate) (MnLocateOrBe $e0))
(Implication (Member $e0 be) (MnLocateOrBe $e0))

;; [unit, shape-parallel]  p203890 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 replace)   e.g. tierC-000099 tierC-000100
;;   B: (Member $e0 dissolve)
;;   substitution: (Member $e0 dissolve) -> (Member $e0 replace)
(Implication (Member $e0 replace) (MnReplaceOrDissolve $e0))
(Implication (Member $e0 dissolve) (MnReplaceOrDissolve $e0))

;; [unit, shape-parallel]  p203890 ~ p205761   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 replace)   e.g. tierC-000099 tierC-000100
;;   B: (Member $e0 succeed)
;;   substitution: (Member $e0 succeed) -> (Member $e0 replace)
(Implication (Member $e0 replace) (MnReplaceOrSucceed $e0))
(Implication (Member $e0 succeed) (MnReplaceOrSucceed $e0))

;; [unit, shape-parallel]  p205760 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 speak)   e.g. tierC-000093 tierC-000094
;;   B: (Member $e0 voice)
;;   substitution: (Member $e0 voice) -> (Member $e0 speak)
(Implication (Member $e0 speak) (MnSpeakOrVoice $e0))
(Implication (Member $e0 voice) (MnSpeakOrVoice $e0))

;; [unit, shape-parallel]  p201140 ~ p201762   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 start)   e.g. tierC-000125 tierC-000126
;;   B: (Member $e0 be)
;;   substitution: (Member $e0 be) -> (Member $e0 start)
(Implication (Member $e0 start) (MnStartOrBe $e0))
(Implication (Member $e0 be) (MnStartOrBe $e0))

;; [unit, shape-parallel]  p200289 ~ p205747   support 1 (control 0)   gate: FAIL
;;   A: (Member $e0 work)   e.g. tierC-000079 tierC-000080
;;   B: (Member $e0 active)
;;   substitution: (Member $e0 active) -> (Member $e0 work)
(Implication (Member $e0 work) (MnWorkOrActive $e0))
(Implication (Member $e0 active) (MnWorkOrActive $e0))

;; [unit, shape-parallel]  p201774 ~ p205764   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 caller)   e.g. tierA-000217 tierA-000218
;;   B: (Member $x0 answer)
;;   substitution: (Member $x0 answer) -> (Member $x0 caller)
(Implication (Member $x0 caller) (MnCallerOrAnswer $x0))
(Implication (Member $x0 answer) (MnCallerOrAnswer $x0))

;; [unit, shape-parallel]  p201795 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 large)   e.g. tierC-000019 tierC-000020
;;   B: (Member $x0 great)
;;   substitution: (Member $x0 great) -> (Member $x0 large)
(Implication (Member $x0 large) (MnLargeOrGreat $x0))
(Implication (Member $x0 great) (MnLargeOrGreat $x0))

;; [unit, shape-parallel]  p205775 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 park)   e.g. tierC-000063 tierC-000064
;;   B: (Member $x0 issaquah_creek_park)
;;   substitution: (Member $x0 issaquah_creek_park) -> (Member $x0 park)
(Implication (Member $x0 park) (MnParkOrIssaquahCreekPark $x0))
(Implication (Member $x0 issaquah_creek_park) (MnParkOrIssaquahCreekPark $x0))

;; [unit, shape-parallel]  p205776 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Member $x0 random)   e.g. tierC-000261 tierC-000262
;;   B: (Member $x0 accidental)
;;   substitution: (Member $x0 accidental) -> (Member $x0 random)
(Implication (Member $x0 random) (MnRandomOrAccidental $x0))
(Implication (Member $x0 accidental) (MnRandomOrAccidental $x0))

;; [unit, shape-parallel]  p203943 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Ordinal $x0 <num> buy)   e.g. tierA-000022 tierA-000024
;;   B: (Ordinal $x0 <num> acquire)
;;   substitution: (Ordinal $x0 <num> acquire) -> (Ordinal $x0 <num> buy)
(Implication (Ordinal $x0 <num> buy) (MnBuyOrAcquire $x0))
(Implication (Ordinal $x0 <num> acquire) (MnBuyOrAcquire $x0))

;; [unit, shape-parallel]  p203943 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Ordinal $x0 <num> buy)   e.g. tierA-000022 tierA-000023
;;   B: (Ordinal $x0 <num> purchase)
;;   substitution: (Ordinal $x0 <num> purchase) -> (Ordinal $x0 <num> buy)
(Implication (Ordinal $x0 <num> buy) (MnBuyOrPurchase $x0))
(Implication (Ordinal $x0 <num> purchase) (MnBuyOrPurchase $x0))

;; [unit, shape-parallel]  p203943 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Ordinal $x0 <num> buy)   e.g. tierA-000022 tierA-000025
;;   B: (Ordinal $x0 <num> sell)
;;   substitution: (Ordinal $x0 <num> sell) -> (Ordinal $x0 <num> buy)
(Implication (Ordinal $x0 <num> buy) (MnBuyOrSell $x0))
(Implication (Ordinal $x0 <num> sell) (MnBuyOrSell $x0))

;; [unit, shape-parallel]  p200022 ~ p200076   support 1 (control 0)   gate: FAIL
;;   A: (Patient $e0 $x0)   e.g. tierC-000009 tierC-000010
;;   B: (Experiencer $e0 $x0)
;;   substitution: (Experiencer $e0 $x0) -> (Patient $e0 $x0)
(Implication (Patient $e0 $x0) (MnPatientOrExperiencer $e0 $x0))
(Implication (Experiencer $e0 $x0) (MnPatientOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p205781 ~ raw   support 1 (control 0)   gate: FAIL
;;   A: (Recipient $e0 ravi)   e.g. tierA-000296 tierA-000297
;;   B: (Agent $e0 ravi)
;;   substitution: (Agent $e0 ravi) -> (Recipient $e0 ravi)
(Implication (Recipient $e0 ravi) (MnRaviOrRavi $e0))
(Implication (Agent $e0 ravi) (MnRaviOrRavi $e0))

;; [unit, shape-parallel]  p200008 ~ p200076   support 1 (control 0)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierC-000069 tierC-000070
;;   B: (Experiencer $e0 $x0)
;;   substitution: (Experiencer $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrExperiencer $e0 $x0))
(Implication (Experiencer $e0 $x0) (MnThemeOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200008 ~ p200288   support 1 (control 0)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierC-000205 tierC-000206
;;   B: (Goal $e0 $x0)
;;   substitution: (Goal $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrGoal $e0 $x0))
(Implication (Goal $e0 $x0) (MnThemeOrGoal $e0 $x0))

;; [unit, shape-parallel]  p200008 ~ p200039   support 1 (control 2)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierC-000063 tierC-000064
;;   B: (Location $e0 $x0)
;;   substitution: (Location $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrLocation $e0 $x0))
(Implication (Location $e0 $x0) (MnThemeOrLocation $e0 $x0))

;; [unit, shape-parallel]  p200008 ~ p200022   support 1 (control 3)   gate: FAIL
;;   A: (Theme $e0 $x0)   e.g. tierA-000143 tierA-000145
;;   B: (Patient $e0 $x0)
;;   substitution: (Patient $e0 $x0) -> (Theme $e0 $x0)
(Implication (Theme $e0 $x0) (MnThemeOrPatient $e0 $x0))
(Implication (Patient $e0 $x0) (MnThemeOrPatient $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200076   support 0 (control 1)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. 
;;   B: (Experiencer $e0 $x0)
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrExperiencer $e0 $x0))
(Implication (Experiencer $e0 $x0) (MnAgentOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200288   support 0 (control 1)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. 
;;   B: (Goal $e0 $x0)
;;   substitution: (Goal $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrGoal $e0 $x0))
(Implication (Goal $e0 $x0) (MnAgentOrGoal $e0 $x0))

;; [unit, shape-parallel]  p200004 ~ p200039   support 0 (control 1)   gate: FAIL
;;   A: (Agent $e0 $x0)   e.g. 
;;   B: (Location $e0 $x0)
;;   substitution: (Location $e0 $x0) -> (Agent $e0 $x0)
(Implication (Agent $e0 $x0) (MnAgentOrLocation $e0 $x0))
(Implication (Location $e0 $x0) (MnAgentOrLocation $e0 $x0))

;; [unit, shape-parallel]  p201877 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2))   e.g. 
;;   B: (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Cardinality $x2 <num>) (Theme $e0 $x2))
;;   substitution: (Cardinality $x2 <num>) -> (Member $x2 projector)
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $x2 projector) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_ProjectorOrNum $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Cardinality $x2 <num>) (Theme $e0 $x2)) (MnAgent_Beneficiary_Theme_ProjectorOrNum $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p205362 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 child))   e.g. 
;;   B: (And (Cardinality $x0 <num>) (Goal $e0 $x0) (GroupOf $x0 child))
;;   substitution: (Goal $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 child)) (MnCardinality_GroupOf_AgentOrGoal $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Goal $e0 $x0) (GroupOf $x0 child)) (MnCardinality_GroupOf_AgentOrGoal $x0 $e0))

;; [unit, shape-parallel]  p203978 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 continue))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 abandon)) (MnAgent_Cardinality_GroupOf_AbandonOrContinue $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 climber) (Member $e0 continue)) (MnAgent_Cardinality_GroupOf_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p203979 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 continue) (Theme $e0 $x1))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_AbandonOrContinue $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 continue) (Theme $e0 $x1)) (MnAgent_Cardinality_Theme_AbandonOrContinue $e0 $x0 $x1))

;; [unit, shape-parallel]  p204868 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 continue))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 abandon)) (MnAgent_Cardinality_AbandonOrContinue $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 continue)) (MnAgent_Cardinality_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p200758 ~ p201410   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))
;;   substitution: (Member $x0 automobile) -> (Cardinality $x0 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrAutomobile $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1)) (MnAgent_Theme_NumOrAutomobile $e0 $x0 $x1))

;; [unit, shape-parallel]  p200758 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 car) (Theme $e0 $x1))
;;   substitution: (Member $x0 car) -> (Cardinality $x0 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrCar $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 car) (Theme $e0 $x1)) (MnAgent_Theme_NumOrCar $e0 $x0 $x1))

;; [unit]  p200758 ~ p202839   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1)) (MnCardinality_OrRecipientTheme $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnCardinality_OrRecipientTheme $x0 $e0 $x1))

;; [unit, shape-parallel]  p200480 ~ p201682   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 automobile))
;;   substitution: (Member $x0 automobile) -> (Cardinality $x0 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnAgent_NumOrAutomobile $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 automobile)) (MnAgent_NumOrAutomobile $e0 $x0))

;; [unit, shape-parallel]  p200480 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 car))
;;   substitution: (Member $x0 car) -> (Cardinality $x0 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnAgent_NumOrCar $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 car)) (MnAgent_NumOrCar $e0 $x0))

;; [unit, shape-parallel]  p200480 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x0 <num>))   e.g. 
;;   B: (And (Cardinality $x0 <num>) (Goal $e0 $x0))
;;   substitution: (Goal $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnCardinality_AgentOrGoal $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Goal $e0 $x0)) (MnCardinality_AgentOrGoal $x0 $e0))

;; [unit]  p201169 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 forklift) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinalityGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinalityGroupOf $e0 $x0 $x1))

;; [unit]  p201878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrCardinality $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrCardinality $e0 $x0 $x1))

;; [unit]  p201878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x1 projector) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Member $x1 projector) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 projector) (Theme $e0 $x1))
;;   substitution: (Member $x1 projector) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_NumOrProjector $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 projector) (Theme $e0 $x1)) (MnAgent_Member_Theme_NumOrProjector $e0 $x0 $x1))

;; [unit]  p201878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x1 projector) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Member $x1 projector) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p201878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 sell) (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 buy) (Theme $e0 $x1)) (MnOrMemberMemberRecipientThe $e0 $x0 $x1))
(Implication (And (Member $e0 sell) (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrMemberMemberRecipientThe $e0 $x0 $x1))

;; [unit]  p201170 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 depot) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinalityMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $x1 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinalityMember $e0 $x0 $x1))

;; [unit]  p200863 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrCardinality $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrCardinality $e0 $x0 $x1))

;; [unit, shape-parallel]  p200863 ~ p201948   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Member $x1 projector) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_NumOrProjector $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_NumOrProjector $e0 $x0 $x1))

;; [unit]  p200863 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 projector) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnPast_OrMemberRecipientTheme $e0 $x0 $x1))
(Implication (And (Member $x0 projector) (Past $e0) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnPast_OrMemberRecipientTheme $x0 $e0 $x1))

;; [unit, shape-parallel]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 medal) (Recipient $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Member $x1 medal) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrMedal $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrMedal $e0 $x0 $x1 $x2))

;; [unit]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 medal) (Source $e0 $x2) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 painting) (Recipient $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Member $x1 painting) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrPainting $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrPainting $e0 $x0 $x1 $x2))

;; [unit]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 painting) (Source $e0 $x2) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 whistle) (Recipient $e0 $x2) (Theme $e0 $x1))
;;   substitution: (Member $x1 whistle) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrWhistle $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Recipient_Theme_NumOrWhistle $e0 $x0 $x1 $x2))

;; [unit]  p203980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 whistle) (Source $e0 $x2) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Recipient $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Source $e0 $x2) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberSource $e0 $x0 $x1 $x2))

;; [unit]  p200377 ~ p200758   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinality $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Theme $e0 $x1)) (MnAgent_Theme_OrCardinality $e0 $x0 $x1))

;; [unit, shape-parallel]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 ladder) (Theme $e0 $x1))
;;   substitution: (Member $x1 ladder) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrLadder $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 ladder) (Theme $e0 $x1)) (MnAgent_Theme_NumOrLadder $e0 $x0 $x1))

;; [unit, shape-parallel]  p200377 ~ p204940   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))
;;   substitution: (Member $x1 medal) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrMedal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1)) (MnAgent_Theme_NumOrMedal $e0 $x0 $x1))

;; [unit, shape-parallel]  p200377 ~ p204941   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))
;;   substitution: (Member $x1 painting) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrPainting $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1)) (MnAgent_Theme_NumOrPainting $e0 $x0 $x1))

;; [unit, shape-parallel]  p200377 ~ p202813   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))
;;   substitution: (Member $x1 projector) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrProjector $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 projector) (Theme $e0 $x1)) (MnAgent_Theme_NumOrProjector $e0 $x0 $x1))

;; [unit, shape-parallel]  p200377 ~ p204945   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))
;;   substitution: (Member $x1 whistle) -> (Cardinality $x1 <num>)
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnAgent_Theme_NumOrWhistle $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1)) (MnAgent_Theme_NumOrWhistle $e0 $x0 $x1))

;; [unit]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 ladder) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnOrMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $x0 ladder) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberSourceTheme $x0 $e0 $x1))

;; [unit]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 medal) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnOrMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $x0 medal) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberSourceTheme $x0 $e0 $x1))

;; [unit]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 painting) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnOrMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $x0 painting) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberSourceTheme $x0 $e0 $x1))

;; [unit]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnOrMemberRecipientTheme $e0 $x0 $x1))
(Implication (And (Member $x0 projector) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrMemberRecipientTheme $x0 $e0 $x1))

;; [unit]  p200377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 whistle) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnOrMemberSourceTheme $e0 $x0 $x1))
(Implication (And (Member $x0 whistle) (Source $e0 $x1) (Theme $e0 $x0)) (MnOrMemberSourceTheme $x0 $e0 $x1))

;; [unit, shape-parallel]  p205310 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 work))   e.g. 
;;   B: (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 work)) (MnAgent_CoAgent_Location_WorkOrCompete $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Location $e0 $x2) (Member $e0 compete)) (MnAgent_CoAgent_Location_WorkOrCompete $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p205363 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 work))   e.g. 
;;   B: (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 work)) (MnAgent_CoAgent_WorkOrCompete $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1) (Member $e0 compete)) (MnAgent_CoAgent_WorkOrCompete $e0 $x0 $x1))

;; [unit, shape-parallel]  p205364 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive))   e.g. 
;;   B: (And (Agent $e0 $x0) (Future $e0) (Member $e0 depart))
;;   substitution: (Member $e0 depart) -> (Member $e0 arrive)
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive)) (MnAgent_Future_ArriveOrDepart $e0 $x0))
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 depart)) (MnAgent_Future_ArriveOrDepart $e0 $x0))

;; [unit, shape-parallel]  p205364 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 arrive) (Might $e0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $e0 arrive)) (MnAgent_Member_FutureOrMight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 arrive) (Might $e0)) (MnAgent_Member_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p203985 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation) (Time $e0 (Weekday thursday)))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 delegation) (Might $e0) (Time $e0 (Weekday thursday)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation) (Time $e0 (Weekday thursday))) (MnAgent_Member_Time_FutureOrMight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 delegation) (Might $e0) (Time $e0 (Weekday thursday))) (MnAgent_Member_Time_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p204871 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 delegation) (Might $e0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Agent $e0 $x0) (Future $e0) (Member $x0 delegation)) (MnAgent_Member_FutureOrMight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 delegation) (Might $e0)) (MnAgent_Member_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p205365 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Future $e0) (Time $e0 (Weekday thursday)))   e.g. 
;;   B: (And (Agent $e0 $x0) (Might $e0) (Time $e0 (Weekday thursday)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Agent $e0 $x0) (Future $e0) (Time $e0 (Weekday thursday))) (MnAgent_Time_FutureOrMight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Might $e0) (Time $e0 (Weekday thursday))) (MnAgent_Time_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p203612 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 child))   e.g. 
;;   B: (And (Goal $e0 $x0) (GroupOf $x0 child))
;;   substitution: (Goal $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (MnGroupOf_AgentOrGoal $e0 $x0))
(Implication (And (Goal $e0 $x0) (GroupOf $x0 child)) (MnGroupOf_AgentOrGoal $e0 $x0))

;; [unit, shape-parallel]  p203986 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 continue) (Theme $e0 $x1))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_AbandonOrContinue $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 continue) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_AbandonOrContinue $e0 $x0 $x1))

;; [unit, shape-parallel]  p204872 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 continue))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 abandon)) (MnAgent_GroupOf_AbandonOrContinue $e0 $x0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 climber) (Member $e0 continue)) (MnAgent_GroupOf_AbandonOrContinue $e0 $x0))

;; [unit]  p203991 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrGroupOf $e0 $x0 $x1))

;; [unit]  p201172 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $x1 depot) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $x1 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))

;; [unit]  p201173 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrGroupOf $e0 $x0 $x1))

;; [unit]  p201407 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 forklift) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOf $e0 $x0 $x1))

;; [unit]  p201879 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x1 chef) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x0 chef) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x1 chef) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))

;; [unit]  p201880 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Member $x1 crate) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOfMember $e0 $x0 $x1))

;; [unit]  p201881 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrGroupOf $e0 $x0 $x1))

;; [unit]  p202768 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 lemon) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOf $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Theme $e0 $x1)) (MnAgent_Theme_OrGroupOf $e0 $x0 $x1))

;; [unit, shape-parallel]  p203992 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 examine) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 ignore) (Theme $e0 $x1))
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 examine) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_ExamineOrIgnore $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (GroupOf $x1 sample) (Member $e0 ignore) (Theme $e0 $x1)) (MnAgent_GroupOf_Theme_ExamineOrIgnore $e0 $x0 $x1))

;; [unit, shape-parallel]  p201882 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Inheritance_Member_PatientOrTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Theme $e0 $x1)) (MnAgent_Inheritance_Member_PatientOrTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p203995 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 loan_application) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 bank) (Theme $e0 $x1))
;;   substitution: (Member $x1 bank) -> (Member $x1 loan_application)
(Implication (And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 loan_application) (Theme $e0 $x1)) (MnAgent_Inheritance_Theme_LoanApplicationOrBank $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance loan_application application) (Member $x1 bank) (Theme $e0 $x1)) (MnAgent_Inheritance_Theme_LoanApplicationOrBank $e0 $x0 $x1))

;; [unit, shape-parallel]  p203997 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. 
;;   B: (And (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio)) (MnInheritance_Member_Member_AgentOrTheme $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x0)) (MnInheritance_Member_Member_AgentOrTheme $e0 $x0))

;; [unit, shape-parallel]  p201176 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0))   e.g. 
;;   B: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0)) (MnInheritance_Member_Past_AgentOrTheme $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0)) (MnInheritance_Member_Past_AgentOrTheme $x0 $e0))

;; [unit]  p201177 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x1 pottery_studio) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Inheritance_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x1 pottery_studio) (Theme $e0 $x1)) (MnAgent_Inheritance_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201408 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio))   e.g. 
;;   B: (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Inheritance pottery_studio studio) (Member $x0 pottery_studio)) (MnInheritance_Member_AgentOrTheme $e0 $x0))
(Implication (And (Inheritance pottery_studio studio) (Member $x0 pottery_studio) (Theme $e0 $x0)) (MnInheritance_Member_AgentOrTheme $x0 $e0))

;; [unit, shape-parallel]  p201178 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 electrician) (Patient $e0 $x1))
;;   substitution: (Member $x1 electrician) -> (Member $x1 yard_floodlight)
(Implication (And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1)) (MnAgent_Inheritance_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 electrician) (Patient $e0 $x1)) (MnAgent_Inheritance_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))

;; [unit, shape-parallel]  p203998 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 wreck))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 diver)) (MnAgent_Location_Member_DiverOrWreck $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 discover) (Member $x0 wreck)) (MnAgent_Location_Member_DiverOrWreck $e0 $x0 $x1))

;; [unit, shape-parallel]  p205366 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 sprint))
;;   substitution: (Member $e0 sprint) -> (Member $e0 walk)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk)) (MnAgent_Location_WalkOrSprint $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 sprint)) (MnAgent_Location_WalkOrSprint $e0 $x0 $x1))

;; [unit, shape-parallel]  p203999 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 biologist))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete) (Member $x0 biologist))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x0 biologist)) (MnAgent_Location_Member_WorkOrCompete $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete) (Member $x0 biologist)) (MnAgent_Location_Member_WorkOrCompete $e0 $x0 $x1))

;; [unit, shape-parallel]  p204000 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x1 survey))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete) (Member $x1 survey))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work) (Member $x1 survey)) (MnAgent_Location_Member_WorkOrCompete $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete) (Member $x1 survey)) (MnAgent_Location_Member_WorkOrCompete $e0 $x0 $x1))

;; [unit, shape-parallel]  p201637 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work)) (MnAgent_Location_WorkOrCompete $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 compete)) (MnAgent_Location_WorkOrCompete $e0 $x0 $x1))

;; [unit, shape-parallel]  p201890 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck) (Member $x1 point))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Member $x1 point)) (MnAgent_Location_Member_DiverOrWreck $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck) (Member $x1 point)) (MnAgent_Location_Member_DiverOrWreck $e0 $x0 $x1))

;; [unit, shape-parallel]  p201891 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck) (Theme $e0 $x2))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver) (Theme $e0 $x2)) (MnAgent_Location_Theme_DiverOrWreck $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck) (Theme $e0 $x2)) (MnAgent_Location_Theme_DiverOrWreck $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p202772 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 diver)) (MnAgent_Location_DiverOrWreck $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 wreck)) (MnAgent_Location_DiverOrWreck $e0 $x0 $x1))

;; [unit, shape-parallel]  p201892 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2))   e.g. 
;;   B: (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 diver) (Theme $e0 $x2))
;;   substitution: (Member $x2 diver) -> (Member $x2 wreck)
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 wreck) (Theme $e0 $x2)) (MnAgent_Location_Theme_WreckOrDiver $e0 $x0 $x1 $x2))
(Implication (And (Agent $e0 $x0) (Location $e0 $x1) (Member $x2 diver) (Theme $e0 $x2)) (MnAgent_Location_Theme_WreckOrDiver $e0 $x0 $x1 $x2))

;; [unit, shape-parallel]  p204007 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 continue) (Member $x1 north_route) (Theme $e0 $x1))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrContinue $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 continue) (Member $x1 north_route) (Theme $e0 $x1)) (MnAgent_Member_Theme_AbandonOrContinue $e0 $x0 $x1))

;; [unit, shape-parallel]  p200661 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 continue) (Theme $e0 $x1))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1)) (MnAgent_Theme_AbandonOrContinue $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 continue) (Theme $e0 $x1)) (MnAgent_Theme_AbandonOrContinue $e0 $x0 $x1))

;; [unit, shape-parallel]  p200675 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 abandon))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 continue))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Agent $e0 $x0) (Member $e0 abandon)) (MnAgent_AbandonOrContinue $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 continue)) (MnAgent_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p203617 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 allow))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 forbid))
;;   substitution: (Member $e0 forbid) -> (Member $e0 allow)
(Implication (And (Agent $e0 $x0) (Member $e0 allow)) (MnAgent_AllowOrForbid $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 forbid)) (MnAgent_AllowOrForbid $e0 $x0))

;; [unit, shape-parallel]  p204011 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 query) (Theme $e0 $x1))
;;   substitution: (Member $x0 query) -> (Member $x0 clerk)
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgent_Member_Theme_ClerkOrQuery $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 query) (Theme $e0 $x1)) (MnAgent_Member_Theme_ClerkOrQuery $e0 $x0 $x1))

;; [unit, shape-parallel]  p204883 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 query))
;;   substitution: (Member $x0 query) -> (Member $x0 clerk)
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 clerk)) (MnAgent_Member_ClerkOrQuery $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x0 query)) (MnAgent_Member_ClerkOrQuery $e0 $x0))

;; [unit, shape-parallel]  p204013 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 clerk) (Theme $e0 $x1))
;;   substitution: (Member $x1 clerk) -> (Member $x1 query)
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Member_Theme_QueryOrClerk $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 clerk) (Theme $e0 $x1)) (MnAgent_Member_Theme_QueryOrClerk $e0 $x0 $x1))

;; [unit, shape-parallel]  p201083 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 arrive))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 depart))
;;   substitution: (Member $e0 depart) -> (Member $e0 arrive)
(Implication (And (Agent $e0 $x0) (Member $e0 arrive)) (MnAgent_ArriveOrDepart $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 depart)) (MnAgent_ArriveOrDepart $e0 $x0))

;; [unit, shape-parallel]  p204020 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 depot) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Past $e0)) (MnMember_Member_Past_AgentOrTheme $e0 $x0))
(Implication (And (Member $e0 buy) (Member $x0 depot) (Past $e0) (Theme $e0 $x0)) (MnMember_Member_Past_AgentOrTheme $e0 $x0))

;; [unit]  p204021 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 depot) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 depot) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204888 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 depot)) (MnMember_Member_AgentOrTheme $e0 $x0))
(Implication (And (Member $e0 buy) (Member $x0 depot) (Theme $e0 $x0)) (MnMember_Member_AgentOrTheme $e0 $x0))

;; [unit, shape-parallel]  p204023 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0)) (MnMember_Member_Past_AgentOrTheme $e0 $x0))
(Implication (And (Member $e0 buy) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0)) (MnMember_Member_Past_AgentOrTheme $e0 $x0))

;; [unit]  p204024 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 pottery_studio) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 pottery_studio) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204889 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 pottery_studio)) (MnMember_Member_AgentOrTheme $e0 $x0))
(Implication (And (Member $e0 buy) (Member $x0 pottery_studio) (Theme $e0 $x0)) (MnMember_Member_AgentOrTheme $e0 $x0))

;; [unit]  p204028 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))

;; [unit]  p200250 ~ p203433   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. 
;;   B: (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnPast_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 acquire) (Past $e0) (Theme $e0 $x0)) (MnPast_OrMemberTheme $e0 $x0))

;; [unit]  p200250 ~ p203437   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. 
;;   B: (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnPast_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 purchase) (Past $e0) (Theme $e0 $x0)) (MnPast_OrMemberTheme $e0 $x0))

;; [unit]  p200250 ~ p203439   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))   e.g. 
;;   B: (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnPast_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 sell) (Past $e0) (Theme $e0 $x0)) (MnPast_OrMemberTheme $e0 $x0))

;; [unit]  p200255 ~ p203692   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. 
;;   B: (And (Member $e0 acquire) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 acquire) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit]  p200255 ~ p203710   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. 
;;   B: (And (Member $e0 purchase) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 purchase) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit]  p200255 ~ p203715   support 0 (control 3)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 buy))   e.g. 
;;   B: (And (Member $e0 sell) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 sell) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p205526 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 call_off))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm))
;;   substitution: (Member $e0 confirm) -> (Member $e0 call_off)
(Implication (And (Agent $e0 $x0) (Member $e0 call_off)) (MnAgent_CallOffOrConfirm $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm)) (MnAgent_CallOffOrConfirm $e0 $x0))

;; [unit]  p204032 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x0 tutor) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1)) (MnAgent_Member_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x0 tutor) (Theme $e0 $x1)) (MnAgent_Member_OrMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p204893 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x0 tutor))
;;   substitution: (Member $e0 confirm) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor)) (MnAgent_Member_CancelOrConfirm $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x0 tutor)) (MnAgent_Member_CancelOrConfirm $e0 $x0))

;; [unit]  p204033 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x1 afternoon_session) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Member_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm) (Member $x1 afternoon_session) (Theme $e0 $x1)) (MnAgent_Member_OrMemberTheme $e0 $x0 $x1))

;; [unit]  p200805 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm) (Theme $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p200558 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 confirm))
;;   substitution: (Member $e0 confirm) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_CancelOrConfirm $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 confirm)) (MnAgent_CancelOrConfirm $e0 $x0))

;; [unit, shape-parallel]  p200558 ~ p203620   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cancel))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order))
;;   substitution: (Member $e0 order) -> (Member $e0 cancel)
(Implication (And (Agent $e0 $x0) (Member $e0 cancel)) (MnAgent_CancelOrOrder $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 order)) (MnAgent_CancelOrOrder $e0 $x0))

;; [unit, shape-parallel]  p205527 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 cause))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 save))
;;   substitution: (Member $e0 save) -> (Member $e0 cause)
(Implication (And (Agent $e0 $x0) (Member $e0 cause)) (MnAgent_CauseOrSave $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 save)) (MnAgent_CauseOrSave $e0 $x0))

;; [unit, shape-parallel]  p204038 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 case) (Theme $e0 $x1))
;;   substitution: (Member $x0 case) -> (Member $x0 judge)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x1)) (MnAgent_Member_Theme_JudgeOrCase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 case) (Theme $e0 $x1)) (MnAgent_Member_Theme_JudgeOrCase $e0 $x0 $x1))

;; [unit, shape-parallel]  p204895 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 case))
;;   substitution: (Member $x0 case) -> (Member $x0 judge)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 judge)) (MnAgent_Member_JudgeOrCase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x0 case)) (MnAgent_Member_JudgeOrCase $e0 $x0))

;; [unit, shape-parallel]  p204040 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 case) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 judge) (Theme $e0 $x1))
;;   substitution: (Member $x1 judge) -> (Member $x1 case)
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 case) (Theme $e0 $x1)) (MnAgent_Member_Theme_CaseOrJudge $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 decide) (Member $x1 judge) (Theme $e0 $x1)) (MnAgent_Member_Theme_CaseOrJudge $e0 $x0 $x1))

;; [unit]  p200662 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 save) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 save) (Theme $e0 $x1)) (MnAgent_OrMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p200676 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 destroy))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 save))
;;   substitution: (Member $e0 save) -> (Member $e0 destroy)
(Implication (And (Agent $e0 $x0) (Member $e0 destroy)) (MnAgent_DestroyOrSave $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 save)) (MnAgent_DestroyOrSave $e0 $x0))

;; [unit, shape-parallel]  p204042 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x1))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiverOrWreck $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x1)) (MnAgent_Member_Theme_DiverOrWreck $e0 $x0 $x1))

;; [unit, shape-parallel]  p204896 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 wreck))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 diver)) (MnAgent_Member_DiverOrWreck $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x0 wreck)) (MnAgent_Member_DiverOrWreck $e0 $x0))

;; [unit, shape-parallel]  p204046 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 diver) (Theme $e0 $x1))
;;   substitution: (Member $x1 diver) -> (Member $x1 wreck)
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Member_Theme_WreckOrDiver $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 discover) (Member $x1 diver) (Theme $e0 $x1)) (MnAgent_Member_Theme_WreckOrDiver $e0 $x0 $x1))

;; [unit, shape-parallel]  p205372 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 ignore) (Theme $e0 $x1))
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (And (Agent $e0 $x0) (Member $e0 examine) (Theme $e0 $x1)) (MnAgent_Theme_ExamineOrIgnore $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 ignore) (Theme $e0 $x1)) (MnAgent_Theme_ExamineOrIgnore $e0 $x0 $x1))

;; [unit, shape-parallel]  p205528 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 examine))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 ignore))
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (And (Agent $e0 $x0) (Member $e0 examine)) (MnAgent_ExamineOrIgnore $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 ignore)) (MnAgent_ExamineOrIgnore $e0 $x0))

;; [unit]  p204052 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 clerk) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 clerk) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p204052 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 vet) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 answer) (Member $x1 vet) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204053 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 manifest) (Theme $e0 $x1))
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgent_Member_Theme_GiveOrReceive $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Member $x1 manifest) (Theme $e0 $x1)) (MnAgent_Member_Theme_GiveOrReceive $e0 $x0 $x1))

;; [unit, shape-parallel]  p200330 ~ p205380   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1))
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1)) (MnAgent_Theme_GiveOrReceive $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 receive) (Theme $e0 $x1)) (MnAgent_Theme_GiveOrReceive $e0 $x0 $x1))

;; [unit, shape-parallel]  p200338 ~ p205535   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 receive))
;;   substitution: (Member $e0 receive) -> (Member $e0 give)
(Implication (And (Agent $e0 $x0) (Member $e0 give)) (MnAgent_GiveOrReceive $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 receive)) (MnAgent_GiveOrReceive $e0 $x0))

;; [unit, shape-parallel]  p205374 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 continue) (Theme $e0 $x1))
;;   substitution: (Member $e0 continue) -> (Member $e0 give_up)
(Implication (And (Agent $e0 $x0) (Member $e0 give_up) (Theme $e0 $x1)) (MnAgent_Theme_GiveUpOrContinue $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 continue) (Theme $e0 $x1)) (MnAgent_Theme_GiveUpOrContinue $e0 $x0 $x1))

;; [unit, shape-parallel]  p205530 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 give_up))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 continue))
;;   substitution: (Member $e0 continue) -> (Member $e0 give_up)
(Implication (And (Agent $e0 $x0) (Member $e0 give_up)) (MnAgent_GiveUpOrContinue $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 continue)) (MnAgent_GiveUpOrContinue $e0 $x0))

;; [unit]  p204058 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnMember_Member_OrAgentRecipient $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0)) (MnMember_Member_OrAgentRecipient $e0 $x0))

;; [unit, shape-parallel]  p204059 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Member_Theme_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p204902 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour))   e.g. 
;;   B: (And (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x0 neighbour)) (MnMember_Member_AgentOrRecipient $e0 $x0))
(Implication (And (Member $e0 lend) (Member $x0 neighbour) (Recipient $e0 $x0)) (MnMember_Member_AgentOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p204061 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 generator) (Theme $e0 $x1))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Member $x1 generator) (Theme $e0 $x1)) (MnAgent_Member_Theme_LendOrBorrow $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Member $x1 generator) (Theme $e0 $x1)) (MnAgent_Member_Theme_LendOrBorrow $e0 $x0 $x1))

;; [unit]  p205312 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnMember_Theme_OrAgentRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentRecipient $e0 $x0 $x1))

;; [unit]  p205377 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $e0 lend) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) (MnMember_OrAgentRecipient $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 lend) (Recipient $e0 $x0)) (MnMember_OrAgentRecipient $e0 $x0))

;; [unit, shape-parallel]  p200551 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow) (Theme $e0 $x1))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnAgent_Theme_LendOrBorrow $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow) (Theme $e0 $x1)) (MnAgent_Theme_LendOrBorrow $e0 $x0 $x1))

;; [unit, shape-parallel]  p200551 ~ p200809   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))

;; [unit, shape-parallel]  p200559 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 borrow))
;;   substitution: (Member $e0 borrow) -> (Member $e0 lend)
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnAgent_LendOrBorrow $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 borrow)) (MnAgent_LendOrBorrow $e0 $x0))

;; [unit, shape-parallel]  p200559 ~ p200835   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 lend))   e.g. 
;;   B: (And (Member $e0 lend) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 lend)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p204063 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 scan) (Theme $e0 $x1))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrderOrCancel $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrderOrCancel $e0 $x0 $x1))

;; [unit]  p204063 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order) (Member $x0 scan) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Member $x0 scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204064 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 cancel) (Ordinal $x1 <num> scan) (Theme $e0 $x1))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Ordinal_Theme_OrderOrCancel $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Ordinal_Theme_OrderOrCancel $e0 $x0 $x1))

;; [unit]  p204064 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x1)) (MnAgent_Member_Theme_OrOrdinal $e0 $x0 $x1))

;; [unit, shape-parallel]  p203399 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 cancel) (Theme $e0 $x1))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Theme $e0 $x1)) (MnAgent_Theme_OrderOrCancel $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 cancel) (Theme $e0 $x1)) (MnAgent_Theme_OrderOrCancel $e0 $x0 $x1))

;; [unit, shape-parallel]  p205533 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 permit))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 forbid))
;;   substitution: (Member $e0 forbid) -> (Member $e0 permit)
(Implication (And (Agent $e0 $x0) (Member $e0 permit)) (MnAgent_PermitOrForbid $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 forbid)) (MnAgent_PermitOrForbid $e0 $x0))

;; [unit, shape-parallel]  p204065 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance) (Member $x0 club) (Theme $e0 $x1))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrAdvance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 advance) (Member $x0 club) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrAdvance $e0 $x0 $x1))

;; [unit, shape-parallel]  p204903 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance) (Member $x0 club))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x0 club)) (MnAgent_Member_PostponeOrAdvance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 advance) (Member $x0 club)) (MnAgent_Member_PostponeOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p204066 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance) (Member $x1 tournament) (Theme $e0 $x1))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrAdvance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 advance) (Member $x1 tournament) (Theme $e0 $x1)) (MnAgent_Member_Theme_PostponeOrAdvance $e0 $x0 $x1))

;; [unit, shape-parallel]  p200807 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance) (Theme $e0 $x1))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone) (Theme $e0 $x1)) (MnAgent_Theme_PostponeOrAdvance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 advance) (Theme $e0 $x1)) (MnAgent_Theme_PostponeOrAdvance $e0 $x0 $x1))

;; [unit, shape-parallel]  p200824 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 postpone))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Agent $e0 $x0) (Member $e0 postpone)) (MnAgent_PostponeOrAdvance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 advance)) (MnAgent_PostponeOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p205378 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance) (Theme $e0 $x1))
;;   substitution: (Member $e0 advance) -> (Member $e0 put_off)
(Implication (And (Agent $e0 $x0) (Member $e0 put_off) (Theme $e0 $x1)) (MnAgent_Theme_PutOffOrAdvance $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 advance) (Theme $e0 $x1)) (MnAgent_Theme_PutOffOrAdvance $e0 $x0 $x1))

;; [unit, shape-parallel]  p205534 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 put_off))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 advance))
;;   substitution: (Member $e0 advance) -> (Member $e0 put_off)
(Implication (And (Agent $e0 $x0) (Member $e0 put_off)) (MnAgent_PutOffOrAdvance $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 advance)) (MnAgent_PutOffOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p200663 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 accept) (Theme $e0 $x1))
;;   substitution: (Member $e0 accept) -> (Member $e0 reject)
(Implication (And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1)) (MnAgent_Theme_RejectOrAccept $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 accept) (Theme $e0 $x1)) (MnAgent_Theme_RejectOrAccept $e0 $x0 $x1))

;; [unit, shape-parallel]  p200677 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 reject))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 accept))
;;   substitution: (Member $e0 accept) -> (Member $e0 reject)
(Implication (And (Agent $e0 $x0) (Member $e0 reject)) (MnAgent_RejectOrAccept $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 accept)) (MnAgent_RejectOrAccept $e0 $x0))

;; [unit, shape-parallel]  p201049 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 break) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrBreak $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 break) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_RepairOrBreak $e0 $x0 $x1))

;; [unit, shape-parallel]  p201060 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 break) (Past $e0))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnAgent_Past_RepairOrBreak $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 break) (Past $e0)) (MnAgent_Past_RepairOrBreak $e0 $x0))

;; [unit]  p201060 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))   e.g. 
;;   B: (And (Member $e0 fix) (Past $e0) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnPast_OrMemberPatient $e0 $x0))
(Implication (And (Member $e0 fix) (Past $e0) (Patient $e0 $x0)) (MnPast_OrMemberPatient $e0 $x0))

;; [unit]  p201060 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))   e.g. 
;;   B: (And (Member $e0 mend) (Past $e0) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnPast_OrMemberPatient $e0 $x0))
(Implication (And (Member $e0 mend) (Past $e0) (Patient $e0 $x0)) (MnPast_OrMemberPatient $e0 $x0))

;; [unit, shape-parallel]  p200664 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 break) (Patient $e0 $x1))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrBreak $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 break) (Patient $e0 $x1)) (MnAgent_Patient_RepairOrBreak $e0 $x0 $x1))

;; [unit, shape-parallel]  p200678 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 break))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnAgent_RepairOrBreak $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 break)) (MnAgent_RepairOrBreak $e0 $x0))

;; [unit]  p200678 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))   e.g. 
;;   B: (And (Member $e0 fix) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnOrMemberPatient $e0 $x0))
(Implication (And (Member $e0 fix) (Patient $e0 $x0)) (MnOrMemberPatient $e0 $x0))

;; [unit]  p200678 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 repair))   e.g. 
;;   B: (And (Member $e0 mend) (Patient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnOrMemberPatient $e0 $x0))
(Implication (And (Member $e0 mend) (Patient $e0 $x0)) (MnOrMemberPatient $e0 $x0))

;; [unit, shape-parallel]  p204068 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 chart) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 physician) (Patient $e0 $x1))
;;   substitution: (Member $x1 physician) -> (Member $x1 chart)
(Implication (And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 chart) (Patient $e0 $x1)) (MnAgent_Member_Patient_ChartOrPhysician $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 sign) (Member $x1 physician) (Patient $e0 $x1)) (MnAgent_Member_Patient_ChartOrPhysician $e0 $x0 $x1))

;; [unit, shape-parallel]  p201679 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 take))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 sprint))
;;   substitution: (Member $e0 sprint) -> (Member $e0 take)
(Implication (And (Agent $e0 $x0) (Member $e0 take)) (MnAgent_TakeOrSprint $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 sprint)) (MnAgent_TakeOrSprint $e0 $x0))

;; [unit, shape-parallel]  p201679 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 take))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 stroll))
;;   substitution: (Member $e0 stroll) -> (Member $e0 take)
(Implication (And (Agent $e0 $x0) (Member $e0 take)) (MnAgent_TakeOrStroll $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 stroll)) (MnAgent_TakeOrStroll $e0 $x0))

;; [unit, shape-parallel]  p204071 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x1))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x1)) (MnAgent_Member_Recipient_PotterOrApprentice $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x1)) (MnAgent_Member_Recipient_PotterOrApprentice $e0 $x0 $x1))

;; [unit, shape-parallel]  p204072 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice) (Theme $e0 glazing))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter) (Theme $e0 glazing)) (MnAgent_Member_Theme_PotterOrApprentice $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice) (Theme $e0 glazing)) (MnAgent_Member_Theme_PotterOrApprentice $e0 $x0))

;; [unit, shape-parallel]  p204905 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 potter)) (MnAgent_Member_PotterOrApprentice $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x0 apprentice)) (MnAgent_Member_PotterOrApprentice $e0 $x0))

;; [unit, shape-parallel]  p204073 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 potter) (Recipient $e0 $x1))
;;   substitution: (Member $x1 potter) -> (Member $x1 apprentice)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_Member_Recipient_ApprenticeOrPotter $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 potter) (Recipient $e0 $x1)) (MnAgent_Member_Recipient_ApprenticeOrPotter $e0 $x0 $x1))

;; [unit, shape-parallel]  p204074 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 drill) (Theme $e0 $x1))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Member $x1 drill) (Theme $e0 $x1)) (MnAgent_Member_Theme_TeachOrLearn $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Member $x1 drill) (Theme $e0 $x1)) (MnAgent_Member_Theme_TeachOrLearn $e0 $x0 $x1))

;; [unit, shape-parallel]  p201061 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 $x1))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 $x1)) (MnAgent_Theme_TeachOrLearn $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 $x1)) (MnAgent_Theme_TeachOrLearn $e0 $x0 $x1))

;; [unit, shape-parallel]  p203404 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 glazing))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Agent $e0 $x0) (Member $e0 teach) (Theme $e0 glazing)) (MnAgent_Theme_TeachOrLearn $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn) (Theme $e0 glazing)) (MnAgent_Theme_TeachOrLearn $e0 $x0))

;; [unit, shape-parallel]  p200483 ~ p205532   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 teach))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 learn))
;;   substitution: (Member $e0 learn) -> (Member $e0 teach)
(Implication (And (Agent $e0 $x0) (Member $e0 teach)) (MnAgent_TeachOrLearn $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 learn)) (MnAgent_TeachOrLearn $e0 $x0))

;; [unit, shape-parallel]  p205381 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 accept) (Theme $e0 $x1))
;;   substitution: (Member $e0 accept) -> (Member $e0 turn_down)
(Implication (And (Agent $e0 $x0) (Member $e0 turn_down) (Theme $e0 $x1)) (MnAgent_Theme_TurnDownOrAccept $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 accept) (Theme $e0 $x1)) (MnAgent_Theme_TurnDownOrAccept $e0 $x0 $x1))

;; [unit, shape-parallel]  p205536 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 turn_down))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 accept))
;;   substitution: (Member $e0 accept) -> (Member $e0 turn_down)
(Implication (And (Agent $e0 $x0) (Member $e0 turn_down)) (MnAgent_TurnDownOrAccept $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 accept)) (MnAgent_TurnDownOrAccept $e0 $x0))

;; [unit, shape-parallel]  p201680 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 sprint))
;;   substitution: (Member $e0 sprint) -> (Member $e0 walk)
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnAgent_WalkOrSprint $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 sprint)) (MnAgent_WalkOrSprint $e0 $x0))

;; [unit, shape-parallel]  p201680 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 stroll))
;;   substitution: (Member $e0 stroll) -> (Member $e0 walk)
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnAgent_WalkOrStroll $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 stroll)) (MnAgent_WalkOrStroll $e0 $x0))

;; [unit, shape-parallel]  p201680 ~ p205578   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Goal $e0 $x0) (Member $e0 walk))
;;   substitution: (Goal $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnMember_AgentOrGoal $e0 $x0))
(Implication (And (Goal $e0 $x0) (Member $e0 walk)) (MnMember_AgentOrGoal $e0 $x0))

;; [unit, shape-parallel]  p204906 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 work) (Member $x0 biologist))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 compete) (Member $x0 biologist))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (Member $e0 work) (Member $x0 biologist)) (MnAgent_Member_WorkOrCompete $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 compete) (Member $x0 biologist)) (MnAgent_Member_WorkOrCompete $e0 $x0))

;; [unit, shape-parallel]  p201681 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $e0 work))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Agent $e0 $x0) (Member $e0 work)) (MnAgent_WorkOrCompete $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 compete)) (MnAgent_WorkOrCompete $e0 $x0))

;; [unit]  p201410 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 automobile))
(Implication (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1)) (MnMember_OrExperiencerLocation $e0 $x0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 automobile)) (MnMember_OrExperiencerLocation $e0 $x0 $x1))

;; [unit]  p201410 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 car))
(Implication (And (Agent $e0 $x0) (Member $x0 automobile) (Theme $e0 $x1)) (MnOrExperiencerLocationMembe $e0 $x0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 car)) (MnOrExperiencerLocationMembe $e0 $x0 $x1))

;; [unit, shape-parallel]  p201682 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 automobile))
;;   substitution: (Experiencer $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 automobile)) (MnMember_AgentOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 automobile)) (MnMember_AgentOrExperiencer $e0 $x0))

;; [unit]  p201682 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 automobile))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 car))
(Implication (And (Agent $e0 $x0) (Member $x0 automobile)) (MnOrExperiencerMember $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 car)) (MnOrExperiencerMember $e0 $x0))

;; [unit]  p204080 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 bank) (Member $x1 loan_application) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 loan_application) (Member $x1 bank) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 bank) (Member $x1 loan_application) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 loan_application) (Member $x1 bank) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204909 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 bank) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 loan_application) (Theme $e0 $x1))
;;   substitution: (Member $x0 loan_application) -> (Member $x0 bank)
(Implication (And (Agent $e0 $x0) (Member $x0 bank) (Theme $e0 $x1)) (MnAgent_Theme_BankOrLoanApplication $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 loan_application) (Theme $e0 $x1)) (MnAgent_Theme_BankOrLoanApplication $e0 $x0 $x1))

;; [unit, shape-parallel]  p205537 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 bank))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 loan_application))
;;   substitution: (Member $x0 loan_application) -> (Member $x0 bank)
(Implication (And (Agent $e0 $x0) (Member $x0 bank)) (MnAgent_BankOrLoanApplication $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 loan_application)) (MnAgent_BankOrLoanApplication $e0 $x0))

;; [unit]  p201923 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crate) (Member $x1 chef) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Member $x1 crate) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 crate) (Member $x1 chef) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p201924 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 chef) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 chef) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202783 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0))   e.g. 
;;   B: (And (Member $x0 chef) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Past $e0)) (MnMember_Past_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 chef) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_AgentOrTheme $x0 $e0))

;; [unit]  p202784 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 chef) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 chef) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 chef) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p203627 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 chef))   e.g. 
;;   B: (And (Member $x0 chef) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 chef)) (MnMember_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 chef) (Theme $e0 $x0)) (MnMember_AgentOrTheme $x0 $e0))

;; [unit]  p204083 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 query) (Member $x1 clerk) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 query) (Member $x1 clerk) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202785 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 query) (Theme $e0 $x1))
;;   substitution: (Member $x0 query) -> (Member $x0 clerk)
(Implication (And (Agent $e0 $x0) (Member $x0 clerk) (Theme $e0 $x1)) (MnAgent_Theme_ClerkOrQuery $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 query) (Theme $e0 $x1)) (MnAgent_Theme_ClerkOrQuery $e0 $x0 $x1))

;; [unit, shape-parallel]  p203628 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 clerk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 query))
;;   substitution: (Member $x0 query) -> (Member $x0 clerk)
(Implication (And (Agent $e0 $x0) (Member $x0 clerk)) (MnAgent_ClerkOrQuery $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 query)) (MnAgent_ClerkOrQuery $e0 $x0))

;; [unit, shape-parallel]  p205538 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 crew))   e.g. 
;;   B: (And (Member $x0 crew) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 crew)) (MnMember_AgentOrPatient $e0 $x0))
(Implication (And (Member $x0 crew) (Patient $e0 $x0)) (MnMember_AgentOrPatient $x0 $e0))

;; [unit]  p201181 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 depot) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 depot) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201412 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0))   e.g. 
;;   B: (And (Member $x0 depot) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Past $e0)) (MnMember_Past_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 depot) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_AgentOrTheme $x0 $e0))

;; [unit, shape-parallel]  p200760 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crew) (Theme $e0 $x1))
;;   substitution: (Member $x0 crew) -> (Member $x0 depot)
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Theme_DepotOrCrew $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 crew) (Theme $e0 $x1)) (MnAgent_Theme_DepotOrCrew $e0 $x0 $x1))

;; [unit]  p200760 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 depot) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 depot) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p200825 ~ p205538   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crew))
;;   substitution: (Member $x0 crew) -> (Member $x0 depot)
(Implication (And (Agent $e0 $x0) (Member $x0 depot)) (MnAgent_DepotOrCrew $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 crew)) (MnAgent_DepotOrCrew $e0 $x0))

;; [unit, shape-parallel]  p200825 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 depot))   e.g. 
;;   B: (And (Member $x0 depot) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 depot)) (MnMember_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 depot) (Theme $e0 $x0)) (MnMember_AgentOrTheme $x0 $e0))

;; [unit]  p201928 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 diver) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 wreck) (Member $x1 diver) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 diver) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 wreck) (Member $x1 diver) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202790 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 diver) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 wreck) (Theme $e0 $x1))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Member $x0 diver) (Theme $e0 $x1)) (MnAgent_Theme_DiverOrWreck $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 wreck) (Theme $e0 $x1)) (MnAgent_Theme_DiverOrWreck $e0 $x0 $x1))

;; [unit, shape-parallel]  p203633 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 diver))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 wreck))
;;   substitution: (Member $x0 wreck) -> (Member $x0 diver)
(Implication (And (Agent $e0 $x0) (Member $x0 diver)) (MnAgent_DiverOrWreck $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 wreck)) (MnAgent_DiverOrWreck $e0 $x0))

;; [unit, shape-parallel]  p205540 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 doctor))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 chart))
;;   substitution: (Member $x0 chart) -> (Member $x0 doctor)
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnAgent_DoctorOrChart $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 chart)) (MnAgent_DoctorOrChart $e0 $x0))

;; [unit]  p205540 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 doctor))   e.g. 
;;   B: (And (Member $x0 physician) (Theme $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $x0 physician) (Theme $e0 $x0)) (MnOrMemberTheme $x0 $e0))

;; [unit]  p201929 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 editor) (Member $x1 manuscript) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 manuscript) (Member $x1 editor) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 editor) (Member $x1 manuscript) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 manuscript) (Member $x1 editor) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202791 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 editor) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 manuscript) (Theme $e0 $x1))
;;   substitution: (Member $x0 manuscript) -> (Member $x0 editor)
(Implication (And (Agent $e0 $x0) (Member $x0 editor) (Theme $e0 $x1)) (MnAgent_Theme_EditorOrManuscript $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 manuscript) (Theme $e0 $x1)) (MnAgent_Theme_EditorOrManuscript $e0 $x0 $x1))

;; [unit, shape-parallel]  p203634 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 editor))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 manuscript))
;;   substitution: (Member $x0 manuscript) -> (Member $x0 editor)
(Implication (And (Agent $e0 $x0) (Member $x0 editor)) (MnAgent_EditorOrManuscript $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 manuscript)) (MnAgent_EditorOrManuscript $e0 $x0))

;; [unit]  p201182 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Member $x1 electrician) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Member $x1 electrician) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201183 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Member $x0 yard_floodlight) -> (Member $x0 electrician)
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_ElectricianOrYardFloodlight $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_ElectricianOrYardFloodlight $e0 $x0 $x1))

;; [unit, shape-parallel]  p201413 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Past $e0))
;;   substitution: (Member $x0 yard_floodlight) -> (Member $x0 electrician)
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0)) (MnAgent_Past_ElectricianOrYardFloodlight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Past $e0)) (MnAgent_Past_ElectricianOrYardFloodlight $e0 $x0))

;; [unit, shape-parallel]  p201414 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 electrician) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Patient $e0 $x1))
;;   substitution: (Member $x0 yard_floodlight) -> (Member $x0 electrician)
(Implication (And (Agent $e0 $x0) (Member $x0 electrician) (Patient $e0 $x1)) (MnAgent_Patient_ElectricianOrYardFloodlight $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 yard_floodlight) (Patient $e0 $x1)) (MnAgent_Patient_ElectricianOrYardFloodlight $e0 $x0 $x1))

;; [unit, shape-parallel]  p201684 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 electrician))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 yard_floodlight))
;;   substitution: (Member $x0 yard_floodlight) -> (Member $x0 electrician)
(Implication (And (Agent $e0 $x0) (Member $x0 electrician)) (MnAgent_ElectricianOrYardFloodlight $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 yard_floodlight)) (MnAgent_ElectricianOrYardFloodlight $e0 $x0))

;; [unit, shape-parallel]  p203635 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 fire))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 archive))
;;   substitution: (Member $x0 archive) -> (Member $x0 fire)
(Implication (And (Agent $e0 $x0) (Member $x0 fire)) (MnAgent_FireOrArchive $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 archive)) (MnAgent_FireOrArchive $e0 $x0))

;; [unit]  p204089 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 judge) (Member $x1 case) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 case) (Member $x1 judge) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 judge) (Member $x1 case) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 case) (Member $x1 judge) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204915 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 judge) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 case) (Theme $e0 $x1))
;;   substitution: (Member $x0 case) -> (Member $x0 judge)
(Implication (And (Agent $e0 $x0) (Member $x0 judge) (Theme $e0 $x1)) (MnAgent_Theme_JudgeOrCase $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 case) (Theme $e0 $x1)) (MnAgent_Theme_JudgeOrCase $e0 $x0 $x1))

;; [unit, shape-parallel]  p201686 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 judge))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 case))
;;   substitution: (Member $x0 case) -> (Member $x0 judge)
(Implication (And (Agent $e0 $x0) (Member $x0 judge)) (MnAgent_JudgeOrCase $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 case)) (MnAgent_JudgeOrCase $e0 $x0))

;; [unit, shape-parallel]  p201686 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 judge))   e.g. 
;;   B: (And (Member $x0 judge) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 judge)) (MnMember_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 judge) (Theme $e0 $x0)) (MnMember_AgentOrTheme $x0 $e0))

;; [unit]  p201935 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x1 mechanic) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x1 mechanic) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))

;; [unit]  p201936 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 seized) (Member $x1 mechanic) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 seized) (Member $x1 mechanic) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))

;; [unit]  p201937 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 mechanic) (Past $e0) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 mechanic) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202795 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0))   e.g. 
;;   B: (And (Member $x0 mechanic) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Past $e0)) (MnMember_Past_AgentOrPatient $e0 $x0))
(Implication (And (Member $x0 mechanic) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_AgentOrPatient $x0 $e0))

;; [unit]  p202796 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 mechanic) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 mechanic) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p203640 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 mechanic))   e.g. 
;;   B: (And (Member $x0 mechanic) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic)) (MnMember_AgentOrPatient $e0 $x0))
(Implication (And (Member $x0 mechanic) (Patient $e0 $x0)) (MnMember_AgentOrPatient $x0 $e0))

;; [unit]  p204092 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnMember_Theme_OrAgentRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_OrAgentRecipient $e0 $x0 $x1))

;; [unit]  p204919 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $x0 neighbour) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Recipient $e0 ravi)) (MnMember_OrAgentRecipient $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $x0 neighbour) (Recipient $e0 $x0)) (MnMember_OrAgentRecipient $e0 $x0))

;; [unit, shape-parallel]  p204920 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $e0 $x0 $x1))
(Implication (And (Member $x0 neighbour) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnMember_Theme_AgentOrRecipient $x0 $e0 $x1))

;; [unit, shape-parallel]  p205546 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 neighbour))   e.g. 
;;   B: (And (Member $x0 neighbour) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 neighbour)) (MnMember_AgentOrRecipient $e0 $x0))
(Implication (And (Member $x0 neighbour) (Recipient $e0 $x0)) (MnMember_AgentOrRecipient $x0 $e0))

;; [unit]  p204094 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 scan) (Member $x1 physician) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 scan) (Member $x1 physician) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p204095 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 physician) (Ordinal $x0 <num> scan) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 physician) (Ordinal $x0 <num> scan) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))

;; [unit]  p200965 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 physician) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 physician) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 physician) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p200679 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 chart))
;;   substitution: (Member $x0 chart) -> (Member $x0 physician)
(Implication (And (Agent $e0 $x0) (Member $x0 physician)) (MnAgent_PhysicianOrChart $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 chart)) (MnAgent_PhysicianOrChart $e0 $x0))

;; [unit, shape-parallel]  p200679 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 physician))   e.g. 
;;   B: (And (Member $x0 physician) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 physician)) (MnMember_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 physician) (Theme $e0 $x0)) (MnMember_AgentOrTheme $x0 $e0))

;; [unit]  p204097 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Member $x1 potter) (Recipient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_Recipient_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Member $x1 potter) (Recipient $e0 $x1)) (MnAgent_Recipient_OrMemberMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204098 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Recipient_Theme_PotterOrApprentice $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Recipient_Theme_PotterOrApprentice $e0 $x0 $x1))

;; [unit, shape-parallel]  p204921 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Recipient $e0 $x1))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Recipient $e0 $x1)) (MnAgent_Recipient_PotterOrApprentice $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Recipient $e0 $x1)) (MnAgent_Recipient_PotterOrApprentice $e0 $x0 $x1))

;; [unit, shape-parallel]  p204922 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice) (Theme $e0 glazing))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $x0 potter) (Theme $e0 glazing)) (MnAgent_Theme_PotterOrApprentice $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice) (Theme $e0 glazing)) (MnAgent_Theme_PotterOrApprentice $e0 $x0))

;; [unit, shape-parallel]  p205547 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 potter))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 apprentice))
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (And (Agent $e0 $x0) (Member $x0 potter)) (MnAgent_PotterOrApprentice $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 apprentice)) (MnAgent_PotterOrApprentice $e0 $x0))

;; [unit]  p201184 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Member $x1 pottery_studio) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Member $x1 pottery_studio) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberMember $e0 $x0 $x1))

;; [unit]  p204099 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Ordinal $x0 <num> buy) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))

;; [unit]  p201185 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201415 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0))   e.g. 
;;   B: (And (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Past $e0)) (MnMember_Past_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 pottery_studio) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_AgentOrTheme $x0 $e0))

;; [unit]  p201416 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 pottery_studio) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p201687 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 pottery_studio))   e.g. 
;;   B: (And (Member $x0 pottery_studio) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Member $x0 pottery_studio)) (MnMember_AgentOrTheme $e0 $x0))
(Implication (And (Member $x0 pottery_studio) (Theme $e0 $x0)) (MnMember_AgentOrTheme $x0 $e0))

;; [unit, shape-parallel]  p201941 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 school) (Theme $e0 $x1))
;;   substitution: (Cardinality $x1 <num>) -> (Member $x1 projector)
(Implication (And (Agent $e0 $x0) (Member $x0 school) (Member $x1 projector) (Theme $e0 $x1)) (MnAgent_Member_Theme_ProjectorOrNum $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 school) (Theme $e0 $x1)) (MnAgent_Member_Theme_ProjectorOrNum $e0 $x0 $x1))

;; [unit, shape-parallel]  p205549 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 storm))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 greenhouse))
;;   substitution: (Member $x0 greenhouse) -> (Member $x0 storm)
(Implication (And (Agent $e0 $x0) (Member $x0 storm)) (MnAgent_StormOrGreenhouse $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 greenhouse)) (MnAgent_StormOrGreenhouse $e0 $x0))

;; [unit, shape-parallel]  p201942 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Member_Member_PatientOrTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Theme $e0 $x1)) (MnAgent_Member_Member_PatientOrTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p202801 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 tutor) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 tutor) (Theme $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p204926 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 vet) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 caller) (Theme $e0 $x1))
;;   substitution: (Member $x0 caller) -> (Member $x0 vet)
(Implication (And (Agent $e0 $x0) (Member $x0 vet) (Theme $e0 $x1)) (MnAgent_Theme_VetOrCaller $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 caller) (Theme $e0 $x1)) (MnAgent_Theme_VetOrCaller $e0 $x0 $x1))

;; [unit, shape-parallel]  p205551 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x0 vet))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 caller))
;;   substitution: (Member $x0 caller) -> (Member $x0 vet)
(Implication (And (Agent $e0 $x0) (Member $x0 vet)) (MnAgent_VetOrCaller $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 caller)) (MnAgent_VetOrCaller $e0 $x0))

;; [unit, shape-parallel]  p202802 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 afternoon_session) (Theme $e0 $x1))
;;   substitution: (Theme $e0 $x1) -> (Patient $e0 $x1)
(Implication (And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 afternoon_session) (Theme $e0 $x1)) (MnAgent_Member_PatientOrTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p204929 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 clerk) (Theme $e0 $x1))
;;   substitution: (Member $x1 clerk) -> (Member $x1 answer)
(Implication (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrClerk $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 clerk) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrClerk $e0 $x0 $x1))

;; [unit, shape-parallel]  p204929 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 vet) (Theme $e0 $x1))
;;   substitution: (Member $x1 vet) -> (Member $x1 answer)
(Implication (And (Agent $e0 $x0) (Member $x1 answer) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrVet $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 vet) (Theme $e0 $x1)) (MnAgent_Theme_AnswerOrVet $e0 $x0 $x1))

;; [unit, shape-parallel]  p204106 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 potter) (Recipient $e0 $x1) (Theme $e0 glazing))
;;   substitution: (Member $x1 potter) -> (Member $x1 apprentice)
(Implication (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Recipient_Theme_ApprenticeOrPotter $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 potter) (Recipient $e0 $x1) (Theme $e0 glazing)) (MnAgent_Recipient_Theme_ApprenticeOrPotter $e0 $x0 $x1))

;; [unit, shape-parallel]  p204930 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 potter) (Recipient $e0 $x1))
;;   substitution: (Member $x1 potter) -> (Member $x1 apprentice)
(Implication (And (Agent $e0 $x0) (Member $x1 apprentice) (Recipient $e0 $x1)) (MnAgent_Recipient_ApprenticeOrPotter $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 potter) (Recipient $e0 $x1)) (MnAgent_Recipient_ApprenticeOrPotter $e0 $x0 $x1))

;; [unit, shape-parallel]  p204933 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 case) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 judge) (Theme $e0 $x1))
;;   substitution: (Member $x1 judge) -> (Member $x1 case)
(Implication (And (Agent $e0 $x0) (Member $x1 case) (Theme $e0 $x1)) (MnAgent_Theme_CaseOrJudge $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 judge) (Theme $e0 $x1)) (MnAgent_Theme_CaseOrJudge $e0 $x0 $x1))

;; [unit, shape-parallel]  p204934 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 chart) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 physician) (Patient $e0 $x1))
;;   substitution: (Member $x1 physician) -> (Member $x1 chart)
(Implication (And (Agent $e0 $x0) (Member $x1 chart) (Patient $e0 $x1)) (MnAgent_Patient_ChartOrPhysician $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 physician) (Patient $e0 $x1)) (MnAgent_Patient_ChartOrPhysician $e0 $x0 $x1))

;; [unit]  p201943 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crate) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 crate) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 crate) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))

;; [unit]  p202803 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crate) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 crate) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 crate) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit]  p201945 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 gearbox) (Member $x1 seized) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 gearbox) (Member $x1 seized) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x1)) (MnAgent_Patient_OrMemberMember $e0 $x0 $x1))

;; [unit]  p201946 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 gearbox) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Past $e0) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 gearbox) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))

;; [unit]  p202806 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 gearbox) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 gearbox) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))

;; [unit]  p204112 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrMemberOrdinal $e0 $x0 $x1))

;; [unit]  p201187 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrMember $e0 $x0 $x1))

;; [unit]  p201418 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 kiln) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p204939 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 loan_application) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 bank) (Theme $e0 $x1))
;;   substitution: (Member $x1 bank) -> (Member $x1 loan_application)
(Implication (And (Agent $e0 $x0) (Member $x1 loan_application) (Theme $e0 $x1)) (MnAgent_Theme_LoanApplicationOrBank $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 bank) (Theme $e0 $x1)) (MnAgent_Theme_LoanApplicationOrBank $e0 $x0 $x1))

;; [unit, shape-parallel]  p202811 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 manuscript) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 editor) (Theme $e0 $x1))
;;   substitution: (Member $x1 editor) -> (Member $x1 manuscript)
(Implication (And (Agent $e0 $x0) (Member $x1 manuscript) (Theme $e0 $x1)) (MnAgent_Theme_ManuscriptOrEditor $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 editor) (Theme $e0 $x1)) (MnAgent_Theme_ManuscriptOrEditor $e0 $x0 $x1))

;; [unit, shape-parallel]  p204942 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 clerk) (Theme $e0 $x1))
;;   substitution: (Member $x1 clerk) -> (Member $x1 query)
(Implication (And (Agent $e0 $x0) (Member $x1 query) (Theme $e0 $x1)) (MnAgent_Theme_QueryOrClerk $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 clerk) (Theme $e0 $x1)) (MnAgent_Theme_QueryOrClerk $e0 $x0 $x1))

;; [unit]  p202815 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 scan) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 scan) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 scan) (Theme $e0 $x1)) (MnAgent_Theme_OrMember $e0 $x0 $x1))

;; [unit]  p201950 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 seized) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 seized) (Past $e0) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 seized) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 seized) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_OrMember $e0 $x0 $x1))

;; [unit]  p202817 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 seized) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 seized) (Patient $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 seized) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x0 seized) (Patient $e0 $x1)) (MnAgent_Patient_OrMember $e0 $x0 $x1))

;; [unit, shape-parallel]  p202824 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 diver) (Theme $e0 $x1))
;;   substitution: (Member $x1 diver) -> (Member $x1 wreck)
(Implication (And (Agent $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1)) (MnAgent_Theme_WreckOrDiver $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 diver) (Theme $e0 $x1)) (MnAgent_Theme_WreckOrDiver $e0 $x0 $x1))

;; [unit, shape-parallel]  p201188 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 electrician) (Past $e0) (Patient $e0 $x1))
;;   substitution: (Member $x1 electrician) -> (Member $x1 yard_floodlight)
(Implication (And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 electrician) (Past $e0) (Patient $e0 $x1)) (MnAgent_Past_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))

;; [unit, shape-parallel]  p201421 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Patient $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 electrician) (Patient $e0 $x1))
;;   substitution: (Member $x1 electrician) -> (Member $x1 yard_floodlight)
(Implication (And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Patient $e0 $x1)) (MnAgent_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 electrician) (Patient $e0 $x1)) (MnAgent_Patient_YardFloodlightOrElectrician $e0 $x0 $x1))

;; [unit, shape-parallel]  p200170 ~ p201676   support 0 (control 2)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Might $e0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Future $e0))
;;   substitution: (Future $e0) -> (Might $e0)
(Implication (And (Agent $e0 $x0) (Might $e0)) (MnAgent_MightOrFuture $e0 $x0))
(Implication (And (Agent $e0 $x0) (Future $e0)) (MnAgent_MightOrFuture $e0 $x0))

;; [unit]  p204117 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x1)) (MnAgent_Past_Theme_OrOrdinal $e0 $x0 $x1))

;; [unit]  p204947 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) (MnAgent_Theme_OrOrdinal $e0 $x0 $x1))

;; [unit]  p202825 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Ordinal $x1 <num> scan) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> scan) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x1 <num> scan) (Theme $e0 $x1)) (MnAgent_Theme_OrOrdinal $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> scan) (Theme $e0 $x1)) (MnAgent_Theme_OrOrdinal $e0 $x0 $x1))

;; [unit, shape-parallel]  p200033 ~ p200049   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Past $e0))   e.g. 
;;   B: (And (Past $e0) (Patient $e0 $x0))
;;   substitution: (Patient $e0 $x0) -> (Agent $e0 $x0)
(Implication (And (Agent $e0 $x0) (Past $e0)) (MnPast_AgentOrPatient $e0 $x0))
(Implication (And (Past $e0) (Patient $e0 $x0)) (MnPast_AgentOrPatient $e0 $x0))

;; [unit]  p205383 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1))   e.g. 
;;   B: (And (Agent $e0 ravi) (Recipient $e0 $x0) (Theme $e0 $x1))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi) (Theme $e0 $x1)) (MnTheme_OrAgentRecipient $e0 $x0 $x1))
(Implication (And (Agent $e0 ravi) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrAgentRecipient $e0 $x0 $x1))

;; [unit]  p205554 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Recipient $e0 ravi))   e.g. 
;;   B: (And (Agent $e0 ravi) (Recipient $e0 $x0))
(Implication (And (Agent $e0 $x0) (Recipient $e0 ravi)) (MnOrAgentRecipient $e0 $x0))
(Implication (And (Agent $e0 ravi) (Recipient $e0 $x0)) (MnOrAgentRecipient $e0 $x0))

;; [unit]  p200015 ~ p200401   support 0 (control 1)   gate: FAIL
;;   A: (And (Agent $e0 $x0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Location $e0 $x1))
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (MnOrExperiencerLocation $e0 $x0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (MnOrExperiencerLocation $e0 $x0 $x1))

;; [unit, shape-parallel]  p204122 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Before $x0 $e0) (Future $e0) (Member $x0 lunch) (Patient $e0 $x1))   e.g. 
;;   B: (And (Before $x0 $e0) (Member $x0 lunch) (Might $e0) (Patient $e0 $x1))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Before $x0 $e0) (Future $e0) (Member $x0 lunch) (Patient $e0 $x1)) (MnBefore_Member_Patient_FutureOrMight $x0 $e0 $x1))
(Implication (And (Before $x0 $e0) (Member $x0 lunch) (Might $e0) (Patient $e0 $x1)) (MnBefore_Member_Patient_FutureOrMight $x0 $e0 $x1))

;; [unit, shape-parallel]  p204955 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Before $x0 $e0) (Future $e0) (Member $x0 lunch))   e.g. 
;;   B: (And (Before $x0 $e0) (Member $x0 lunch) (Might $e0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Before $x0 $e0) (Future $e0) (Member $x0 lunch)) (MnBefore_Member_FutureOrMight $x0 $e0))
(Implication (And (Before $x0 $e0) (Member $x0 lunch) (Might $e0)) (MnBefore_Member_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p204123 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Before $x0 $e0) (Future $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))   e.g. 
;;   B: (And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Might $e0) (Patient $e0 $x1))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Before $x0 $e0) (Future $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1)) (MnBefore_Member_Patient_FutureOrMight $x0 $e0 $x1))
(Implication (And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Might $e0) (Patient $e0 $x1)) (MnBefore_Member_Patient_FutureOrMight $x0 $e0 $x1))

;; [unit, shape-parallel]  p205387 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Before $x0 $e0) (Future $e0) (Patient $e0 $x1))   e.g. 
;;   B: (And (Before $x0 $e0) (Might $e0) (Patient $e0 $x1))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Before $x0 $e0) (Future $e0) (Patient $e0 $x1)) (MnBefore_Patient_FutureOrMight $x0 $e0 $x1))
(Implication (And (Before $x0 $e0) (Might $e0) (Patient $e0 $x1)) (MnBefore_Patient_FutureOrMight $x0 $e0 $x1))

;; [unit, shape-parallel]  p205565 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Before $x0 $e0) (Future $e0))   e.g. 
;;   B: (And (Before $x0 $e0) (Might $e0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Before $x0 $e0) (Future $e0)) (MnBefore_FutureOrMight $x0 $e0))
(Implication (And (Before $x0 $e0) (Might $e0)) (MnBefore_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p201189 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1))   e.g. 
;;   B: (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Member $x0 hall) (Theme $e0 $x1))
;;   substitution: (Cardinality $x1 <num>) -> (Member $x1 projector)
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall) (Member $x1 projector) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_ProjectorOrNum $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Member $x0 hall) (Theme $e0 $x1)) (MnBeneficiary_Member_Theme_ProjectorOrNum $e0 $x0 $x1))

;; [unit, shape-parallel]  p201190 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1))
;;   substitution: (Cardinality $x1 <num>) -> (Member $x1 projector)
(Implication (And (Beneficiary $e0 $x0) (Member $x1 projector) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_ProjectorOrNum $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Past $e0) (Theme $e0 $x1)) (MnBeneficiary_Past_Theme_ProjectorOrNum $e0 $x0 $x1))

;; [unit, shape-parallel]  p201424 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Beneficiary $e0 $x0) (Member $x1 projector) (Theme $e0 $x1))   e.g. 
;;   B: (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))
;;   substitution: (Cardinality $x1 <num>) -> (Member $x1 projector)
(Implication (And (Beneficiary $e0 $x0) (Member $x1 projector) (Theme $e0 $x1)) (MnBeneficiary_Theme_ProjectorOrNum $e0 $x0 $x1))
(Implication (And (Beneficiary $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1)) (MnBeneficiary_Theme_ProjectorOrNum $e0 $x0 $x1))

;; [unit, shape-parallel]  p204132 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_GroupOf_Member_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Member $e0 buy)) (MnCardinality_GroupOf_Member_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200866 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0)) (MnCardinality_GroupOf_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Past $e0)) (MnCardinality_GroupOf_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201063 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (GroupOf $x0 forklift) (Theme $e0 $x0)) (MnCardinality_GroupOf_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 forklift)) (MnCardinality_GroupOf_ThemeOrAgent $e0 $x0))

;; [unit]  p201970 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. 
;;   B: (And (Holder $e0 $x0) (Member $e0 need) (Member $x1 countersignature) (Theme $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnOrHolderMemberMemberTheme $x0 $e0 $x1))
(Implication (And (Holder $e0 $x0) (Member $e0 need) (Member $x1 countersignature) (Theme $e0 $x1)) (MnOrHolderMemberMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p201970 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0))   e.g. 
;;   B: (And (Holder $e0 $x0) (Member $e0 require) (Member $x1 countersignature) (Theme $e0 $x1))
;;   substitution: (Member $x1 countersignature) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 require) (Theme $e0 $x0)) (MnMember_NumOrCountersignature $x0 $e0 $x1))
(Implication (And (Holder $e0 $x0) (Member $e0 require) (Member $x1 countersignature) (Theme $e0 $x1)) (MnMember_NumOrCountersignature $e0 $x0 $x1))

;; [unit, shape-parallel]  p201425 ~ p204981   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Holder $e0 $x0) (Member $x1 countersignature) (Theme $e0 $x1))
;;   substitution: (Member $x1 countersignature) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0)) (MnNumOrCountersignature $x0 $e0 $x1))
(Implication (And (Holder $e0 $x0) (Member $x1 countersignature) (Theme $e0 $x1)) (MnNumOrCountersignature $e0 $x0 $x1))

;; [unit, shape-parallel]  p201974 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Member_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0)) (MnCardinality_Member_Past_ThemeOrAgent $e0 $x0))

;; [unit]  p201974 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 acquire) (Member $x0 projector) (Past $e0) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 acquire) (Member $x0 projector) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $e0 $x0))

;; [unit, shape-parallel]  p201974 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 projector) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $x0 projector) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_NumOrProjector $x0 $e0))
(Implication (And (Member $e0 buy) (Member $x0 projector) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_Theme_NumOrProjector $e0 $x0))

;; [unit]  p201974 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 purchase) (Member $x0 projector) (Past $e0) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 purchase) (Member $x0 projector) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $e0 $x0))

;; [unit]  p201974 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 sell) (Member $x0 projector) (Past $e0) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 sell) (Member $x0 projector) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_OrMemberMember $e0 $x0))

;; [unit, shape-parallel]  p202837 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnCardinality_Member_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 buy)) (MnCardinality_Member_ThemeOrAgent $e0 $x0))

;; [unit]  p202837 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 acquire) (Member $x0 projector) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 acquire) (Member $x0 projector) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit, shape-parallel]  p202837 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 buy) (Member $x0 projector) (Theme $e0 $x0))
;;   substitution: (Member $x0 projector) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnMember_Theme_NumOrProjector $x0 $e0))
(Implication (And (Member $e0 buy) (Member $x0 projector) (Theme $e0 $x0)) (MnMember_Theme_NumOrProjector $e0 $x0))

;; [unit]  p202837 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 purchase) (Member $x0 projector) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 purchase) (Member $x0 projector) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit]  p202837 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 sell) (Member $x0 projector) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 buy) (Theme $e0 $x0)) (MnTheme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 sell) (Member $x0 projector) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit]  p201426 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 need) (Member $x0 countersignature) (Theme $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0)) (MnTheme_OrMemberMember $x0 $e0))
(Implication (And (Member $e0 need) (Member $x0 countersignature) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit, shape-parallel]  p201426 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 require) (Member $x0 countersignature) (Theme $e0 $x0))
;;   substitution: (Member $x0 countersignature) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Member $e0 require) (Theme $e0 $x0)) (MnMember_Theme_NumOrCountersignature $x0 $e0))
(Implication (And (Member $e0 require) (Member $x0 countersignature) (Theme $e0 $x0)) (MnMember_Theme_NumOrCountersignature $e0 $x0))

;; [unit, shape-parallel]  p200525 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnCardinality_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0)) (MnCardinality_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200525 ~ p201439   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 projector) (Past $e0) (Theme $e0 $x0))
;;   substitution: (Member $x0 projector) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_NumOrProjector $x0 $e0))
(Implication (And (Member $x0 projector) (Past $e0) (Theme $e0 $x0)) (MnPast_Theme_NumOrProjector $x0 $e0))

;; [unit]  p202839 ~ p204940   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberTheme $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 medal) (Theme $e0 $x1)) (MnOrAgentMemberTheme $e0 $x0 $x1))

;; [unit]  p202839 ~ p204941   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberTheme $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 painting) (Theme $e0 $x1)) (MnOrAgentMemberTheme $e0 $x0 $x1))

;; [unit]  p202839 ~ p204945   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1))
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnOrAgentMemberTheme $x0 $e0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 whistle) (Theme $e0 $x1)) (MnOrAgentMemberTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p202839 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 medal) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Member $x0 medal) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrMedal $x0 $e0 $x1))
(Implication (And (Member $x0 medal) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrMedal $x0 $e0 $x1))

;; [unit, shape-parallel]  p202839 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 painting) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Member $x0 painting) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrPainting $x0 $e0 $x1))
(Implication (And (Member $x0 painting) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrPainting $x0 $e0 $x1))

;; [unit, shape-parallel]  p202839 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 whistle) (Recipient $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Member $x0 whistle) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrWhistle $x0 $e0 $x1))
(Implication (And (Member $x0 whistle) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnRecipient_Theme_NumOrWhistle $x0 $e0 $x1))

;; [unit, shape-parallel]  p200147 ~ p200480   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Cardinality $x0 <num>))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnCardinality_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (MnCardinality_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200147 ~ p205625   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 countersignature) (Theme $e0 $x0))
;;   substitution: (Member $x0 countersignature) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrCountersignature $x0 $e0))
(Implication (And (Member $x0 countersignature) (Theme $e0 $x0)) (MnTheme_NumOrCountersignature $x0 $e0))

;; [unit, shape-parallel]  p200147 ~ p203736   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 ladder) (Theme $e0 $x0))
;;   substitution: (Member $x0 ladder) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrLadder $x0 $e0))
(Implication (And (Member $x0 ladder) (Theme $e0 $x0)) (MnTheme_NumOrLadder $x0 $e0))

;; [unit, shape-parallel]  p200147 ~ p205635   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 medal) (Theme $e0 $x0))
;;   substitution: (Member $x0 medal) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrMedal $x0 $e0))
(Implication (And (Member $x0 medal) (Theme $e0 $x0)) (MnTheme_NumOrMedal $x0 $e0))

;; [unit, shape-parallel]  p200147 ~ p205636   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 painting) (Theme $e0 $x0))
;;   substitution: (Member $x0 painting) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrPainting $x0 $e0))
(Implication (And (Member $x0 painting) (Theme $e0 $x0)) (MnTheme_NumOrPainting $x0 $e0))

;; [unit, shape-parallel]  p200147 ~ p201718   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 projector) (Theme $e0 $x0))
;;   substitution: (Member $x0 projector) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrProjector $x0 $e0))
(Implication (And (Member $x0 projector) (Theme $e0 $x0)) (MnTheme_NumOrProjector $x0 $e0))

;; [unit, shape-parallel]  p200147 ~ p205640   support 0 (control 1)   gate: FAIL
;;   A: (And (Cardinality $x0 <num>) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 whistle) (Theme $e0 $x0))
;;   substitution: (Member $x0 whistle) -> (Cardinality $x0 <num>)
(Implication (And (Cardinality $x0 <num>) (Theme $e0 $x0)) (MnTheme_NumOrWhistle $x0 $e0))
(Implication (And (Member $x0 whistle) (Theme $e0 $x0)) (MnTheme_NumOrWhistle $x0 $e0))

;; [unit, shape-parallel]  p205392 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 work))   e.g. 
;;   B: (And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 work)) (MnCoAgent_Location_WorkOrCompete $e0 $x0 $x1))
(Implication (And (CoAgent $e0 $x0) (Location $e0 $x1) (Member $e0 compete)) (MnCoAgent_Location_WorkOrCompete $e0 $x0 $x1))

;; [unit, shape-parallel]  p205569 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (CoAgent $e0 $x0) (Member $e0 work))   e.g. 
;;   B: (And (CoAgent $e0 $x0) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (CoAgent $e0 $x0) (Member $e0 work)) (MnCoAgent_WorkOrCompete $e0 $x0))
(Implication (And (CoAgent $e0 $x0) (Member $e0 compete)) (MnCoAgent_WorkOrCompete $e0 $x0))

;; [unit]  p204138 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x1 gate))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 leave) (Member $x1 gate) (Theme $e0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x1 gate)) (MnMember_OrAgentMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 leave) (Member $x1 gate) (Theme $e0 $x1)) (MnMember_OrAgentMemberTheme $e0 $x0 $x1))

;; [unit]  p205393 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 leave) (Theme $e0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait)) (MnOrAgentMemberTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $e0 leave) (Theme $e0 $x1)) (MnOrAgentMemberTheme $e0 $x0 $x1))

;; [unit]  p204961 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 gate))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x1 gate) (Theme $e0 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 gate)) (MnMember_OrAgentTheme $e0 $x0 $x1))
(Implication (And (Agent $e0 $x0) (Member $x1 gate) (Theme $e0 $x1)) (MnMember_OrAgentTheme $e0 $x0 $x1))

;; [unit, shape-parallel]  p204140 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 error) (Stimulus $e0 $e1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 auditor) (Stimulus $e0 $e1))
;;   substitution: (Member $e1 auditor) -> (Member $e1 error)
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 error) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_ErrorOrAuditor $e0 $x0 $e1 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $e1 auditor) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_ErrorOrAuditor $e0 $x0 $e1 $x1))

;; [unit, shape-parallel]  p204141 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 auditor) (Stimulus $e0 $e1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 error) (Stimulus $e0 $e1))
;;   substitution: (Member $x0 error) -> (Member $x0 auditor)
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 auditor) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_AuditorOrError $e0 $x0 $e1 $x1))
(Implication (And (Experiencer $e0 $x0) (Location $e1 $x1) (Member $x0 error) (Stimulus $e0 $e1)) (MnExperiencer_Location_Stimulus_AuditorOrError $e0 $x0 $e1 $x1))

;; [unit]  p205573 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $e0 wait))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 leave))
(Implication (And (Experiencer $e0 $x0) (Member $e0 wait)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 leave)) (MnOrAgentMember $e0 $x0))

;; [unit]  p204145 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $e1 error) (Member $x0 auditor) (Stimulus $e0 $e1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $e1 auditor) (Member $x0 error) (Stimulus $e0 $e1))
(Implication (And (Experiencer $e0 $x0) (Member $e1 error) (Member $x0 auditor) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_OrMemberMember $e0 $x0 $e1))
(Implication (And (Experiencer $e0 $x0) (Member $e1 auditor) (Member $x0 error) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_OrMemberMember $e0 $x0 $e1))

;; [unit, shape-parallel]  p204964 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $e1 error) (Stimulus $e0 $e1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $e1 auditor) (Stimulus $e0 $e1))
;;   substitution: (Member $e1 auditor) -> (Member $e1 error)
(Implication (And (Experiencer $e0 $x0) (Member $e1 error) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_ErrorOrAuditor $e0 $x0 $e1))
(Implication (And (Experiencer $e0 $x0) (Member $e1 auditor) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_ErrorOrAuditor $e0 $x0 $e1))

;; [unit, shape-parallel]  p204965 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $x0 auditor) (Stimulus $e0 $e1))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 error) (Stimulus $e0 $e1))
;;   substitution: (Member $x0 error) -> (Member $x0 auditor)
(Implication (And (Experiencer $e0 $x0) (Member $x0 auditor) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_AuditorOrError $e0 $x0 $e1))
(Implication (And (Experiencer $e0 $x0) (Member $x0 error) (Stimulus $e0 $e1)) (MnExperiencer_Stimulus_AuditorOrError $e0 $x0 $e1))

;; [unit, shape-parallel]  p205574 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Experiencer $e0 $x0) (Member $x0 auditor))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 error))
;;   substitution: (Member $x0 error) -> (Member $x0 auditor)
(Implication (And (Experiencer $e0 $x0) (Member $x0 auditor)) (MnExperiencer_AuditorOrError $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 error)) (MnExperiencer_AuditorOrError $e0 $x0))

;; [unit, shape-parallel]  p201982 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0)) (MnInheritance_Member_Patient_FutureOrMight $e0 $x0))
(Implication (And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0)) (MnInheritance_Member_Patient_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p204147 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Might $e0) (Patient $e0 $x0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0)) (MnInheritance_Member_Patient_FutureOrMight $e0 $x0))
(Implication (And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Might $e0) (Patient $e0 $x0)) (MnInheritance_Member_Patient_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p205576 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Member $e0 arrive))   e.g. 
;;   B: (And (Future $e0) (Member $e0 depart))
;;   substitution: (Member $e0 depart) -> (Member $e0 arrive)
(Implication (And (Future $e0) (Member $e0 arrive)) (MnFuture_ArriveOrDepart $e0))
(Implication (And (Future $e0) (Member $e0 depart)) (MnFuture_ArriveOrDepart $e0))

;; [unit, shape-parallel]  p205576 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Future $e0) (Member $e0 arrive))   e.g. 
;;   B: (And (Member $e0 arrive) (Might $e0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Member $e0 arrive)) (MnMember_FutureOrMight $e0))
(Implication (And (Member $e0 arrive) (Might $e0)) (MnMember_FutureOrMight $e0))

;; [unit, shape-parallel]  p201983 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))   e.g. 
;;   B: (And (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0) (Time $e0 (Month september)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september))) (MnMember_Patient_Time_FutureOrMight $e0 $x0))
(Implication (And (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0) (Time $e0 (Month september))) (MnMember_Patient_Time_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p202846 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0)) (MnMember_Patient_FutureOrMight $e0 $x0))
(Implication (And (Member $x0 apple_harvest) (Might $e0) (Patient $e0 $x0)) (MnMember_Patient_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p204969 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 dress_rehearsal) (Might $e0) (Patient $e0 $x0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0)) (MnMember_Patient_FutureOrMight $e0 $x0))
(Implication (And (Member $x0 dress_rehearsal) (Might $e0) (Patient $e0 $x0)) (MnMember_Patient_FutureOrMight $x0 $e0))

;; [unit, shape-parallel]  p203416 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Patient $e0 $x0) (Time $e0 (Month september)))   e.g. 
;;   B: (And (Might $e0) (Patient $e0 $x0) (Time $e0 (Month september)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Patient $e0 $x0) (Time $e0 (Month september))) (MnPatient_Time_FutureOrMight $e0 $x0))
(Implication (And (Might $e0) (Patient $e0 $x0) (Time $e0 (Month september))) (MnPatient_Time_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p200831 ~ p201100   support 0 (control 2)   gate: FAIL
;;   A: (And (Future $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Might $e0) (Patient $e0 $x0))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Patient $e0 $x0)) (MnPatient_FutureOrMight $e0 $x0))
(Implication (And (Might $e0) (Patient $e0 $x0)) (MnPatient_FutureOrMight $e0 $x0))

;; [unit, shape-parallel]  p203662 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Time $e0 (Month september)))   e.g. 
;;   B: (And (Might $e0) (Time $e0 (Month september)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Time $e0 (Month september))) (MnTime_FutureOrMight $e0))
(Implication (And (Might $e0) (Time $e0 (Month september))) (MnTime_FutureOrMight $e0))

;; [unit, shape-parallel]  p205577 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Future $e0) (Time $e0 (Weekday thursday)))   e.g. 
;;   B: (And (Might $e0) (Time $e0 (Weekday thursday)))
;;   substitution: (Might $e0) -> (Future $e0)
(Implication (And (Future $e0) (Time $e0 (Weekday thursday))) (MnTime_FutureOrMight $e0))
(Implication (And (Might $e0) (Time $e0 (Weekday thursday))) (MnTime_FutureOrMight $e0))

;; [unit, shape-parallel]  p205578 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Goal $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Goal $e0 $x0) (Member $e0 stroll))
;;   substitution: (Member $e0 stroll) -> (Member $e0 walk)
(Implication (And (Goal $e0 $x0) (Member $e0 walk)) (MnGoal_WalkOrStroll $e0 $x0))
(Implication (And (Goal $e0 $x0) (Member $e0 stroll)) (MnGoal_WalkOrStroll $e0 $x0))

;; [unit, shape-parallel]  p205579 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Goal $e0 $x0) (Member $x0 pier))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 pier))
;;   substitution: (Agent $e0 $x0) -> (Goal $e0 $x0)
(Implication (And (Goal $e0 $x0) (Member $x0 pier)) (MnMember_GoalOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $x0 pier)) (MnMember_GoalOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204151 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Member_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy) (Past $e0)) (MnGroupOf_Member_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204972 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 forklift) (Member $e0 buy) (Theme $e0 $x0)) (MnGroupOf_Member_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Member $e0 buy)) (MnGroupOf_Member_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200970 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 forklift) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift) (Past $e0)) (MnGroupOf_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201088 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 forklift) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 forklift))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 forklift) (Theme $e0 $x0)) (MnGroupOf_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 forklift)) (MnGroupOf_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201191 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Member_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate) (Past $e0)) (MnGroupOf_Member_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201642 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 lemon) (Member $x0 crate) (Theme $e0 $x0)) (MnGroupOf_Member_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Member $x0 crate)) (MnGroupOf_Member_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201427 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 lemon) (Past $e0) (Theme $e0 $x0)) (MnGroupOf_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon) (Past $e0)) (MnGroupOf_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201699 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 lemon) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (GroupOf $x0 lemon))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (GroupOf $x0 lemon) (Theme $e0 $x0)) (MnGroupOf_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (GroupOf $x0 lemon)) (MnGroupOf_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p204973 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (GroupOf $x0 sample) (Member $e0 examine) (Theme $e0 $x0))   e.g. 
;;   B: (And (GroupOf $x0 sample) (Member $e0 ignore) (Theme $e0 $x0))
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (And (GroupOf $x0 sample) (Member $e0 examine) (Theme $e0 $x0)) (MnGroupOf_Theme_ExamineOrIgnore $x0 $e0))
(Implication (And (GroupOf $x0 sample) (Member $e0 ignore) (Theme $e0 $x0)) (MnGroupOf_Theme_ExamineOrIgnore $x0 $e0))

;; [unit, shape-parallel]  p204155 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnInheritance_Inheritance_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnInheritance_Inheritance_Theme_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204156 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnInheritance_Member_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnInheritance_Member_Theme_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204976 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204157 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnInheritance_Member_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Inheritance monthly_servicing servicing) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnInheritance_Member_Theme_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204977 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Inheritance monthly_servicing servicing) (Theme $e0 monthly_servicing)) (MnInheritance_Theme_HolderOrExperiencer $e0 $x0))

;; [unit]  p205582 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 need))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $e0 require))
(Implication (And (Holder $e0 $x0) (Member $e0 need)) (MnOrExperiencerMember $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $e0 require)) (MnOrExperiencerMember $e0 $x0))

;; [unit, shape-parallel]  p200683 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $e0 require))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $e0 require))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $e0 require)) (MnMember_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $e0 require)) (MnMember_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204980 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnMember_Theme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 lathe) (Theme $e0 monthly_servicing)) (MnMember_Theme_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p205583 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $x0 lathe))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Member $x0 lathe))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Member $x0 lathe)) (MnMember_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Member $x0 lathe)) (MnMember_HolderOrExperiencer $e0 $x0))

;; [unit, shape-parallel]  p204160 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Member $x0 permit) (Member $x1 countersignature) (Theme $e0 $x1))   e.g. 
;;   B: (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 permit) (Theme $e0 $x0))
;;   substitution: (Cardinality $x0 <num>) -> (Member $x1 countersignature)
(Implication (And (Holder $e0 $x0) (Member $x0 permit) (Member $x1 countersignature) (Theme $e0 $x1)) (MnCountersignatureOrNum $e0 $x0 $x1))
(Implication (And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 permit) (Theme $e0 $x0)) (MnCountersignatureOrNum $x0 $e0 $x1))

;; [unit, shape-parallel]  p205584 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Holder $e0 $x0) (Theme $e0 monthly_servicing))   e.g. 
;;   B: (And (Experiencer $e0 $x0) (Theme $e0 monthly_servicing))
;;   substitution: (Experiencer $e0 $x0) -> (Holder $e0 $x0)
(Implication (And (Holder $e0 $x0) (Theme $e0 monthly_servicing)) (MnTheme_HolderOrExperiencer $e0 $x0))
(Implication (And (Experiencer $e0 $x0) (Theme $e0 monthly_servicing)) (MnTheme_HolderOrExperiencer $e0 $x0))

;; [unit]  p204161 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance afternoon_session session) (Member $e0 confirm) (Member $x0 afternoon_session) (Theme $e0 $x0))
(Implication (And (Inheritance afternoon_session session) (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnInheritance_Member_OrMemberTheme $e0 $x0))
(Implication (And (Inheritance afternoon_session session) (Member $e0 confirm) (Member $x0 afternoon_session) (Theme $e0 $x0)) (MnInheritance_Member_OrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p202855 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnInheritance_Member_PatientOrTheme $x0 $e0))
(Implication (And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Theme $e0 $x0)) (MnInheritance_Member_PatientOrTheme $x0 $e0))

;; [unit, shape-parallel]  p204984 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance loan_application application) (Member $x0 loan_application) (Theme $e0 $x0))   e.g. 
;;   B: (And (Inheritance loan_application application) (Member $x0 bank) (Theme $e0 $x0))
;;   substitution: (Member $x0 bank) -> (Member $x0 loan_application)
(Implication (And (Inheritance loan_application application) (Member $x0 loan_application) (Theme $e0 $x0)) (MnInheritance_Theme_LoanApplicationOrBank $x0 $e0))
(Implication (And (Inheritance loan_application application) (Member $x0 bank) (Theme $e0 $x0)) (MnInheritance_Theme_LoanApplicationOrBank $x0 $e0))

;; [unit, shape-parallel]  p201537 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance loan_application application) (Member $x0 loan_application))   e.g. 
;;   B: (And (Inheritance loan_application application) (Member $x0 bank))
;;   substitution: (Member $x0 bank) -> (Member $x0 loan_application)
(Implication (And (Inheritance loan_application application) (Member $x0 loan_application)) (MnInheritance_LoanApplicationOrBank $x0))
(Implication (And (Inheritance loan_application application) (Member $x0 bank)) (MnInheritance_LoanApplicationOrBank $x0))

;; [unit, shape-parallel]  p204163 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. 
;;   B: (And (Inheritance north_route north) (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Inheritance north_route north) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrContinue $e0 $x0))
(Implication (And (Inheritance north_route north) (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p204164 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. 
;;   B: (And (Inheritance north_route route) (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Inheritance north_route route) (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrContinue $e0 $x0))
(Implication (And (Inheritance north_route route) (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0)) (MnInheritance_Member_Theme_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p201195 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0)) (MnInheritance_Past_Patient_YardFloodlightOrElectrician $x0 $e0))
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician) (Past $e0) (Patient $e0 $x0)) (MnInheritance_Past_Patient_YardFloodlightOrElectrician $x0 $e0))

;; [unit, shape-parallel]  p201433 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Patient $e0 $x0))   e.g. 
;;   B: (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician) (Patient $e0 $x0))
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Patient $e0 $x0)) (MnInheritance_Patient_YardFloodlightOrElectrician $x0 $e0))
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician) (Patient $e0 $x0)) (MnInheritance_Patient_YardFloodlightOrElectrician $x0 $e0))

;; [unit, shape-parallel]  p201014 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))   e.g. 
;;   B: (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician))
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight)) (MnInheritance_YardFloodlightOrElectrician $x0))
(Implication (And (Inheritance yard_floodlight floodlight) (Member $x0 electrician)) (MnInheritance_YardFloodlightOrElectrician $x0))

;; [unit, shape-parallel]  p204167 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 diver) (Theme $e0 $x1))
;;   substitution: (Member $x1 diver) -> (Member $x1 wreck)
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Member_Theme_WreckOrDiver $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $e0 discover) (Member $x1 diver) (Theme $e0 $x1)) (MnLocation_Member_Theme_WreckOrDiver $e0 $x0 $x1))

;; [unit, shape-parallel]  p204168 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger) (Stimulus $e1 $e0))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 auditor) (Member $x0 ledger) (Stimulus $e1 $e0))
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnLocation_Member_Stimulus_ErrorOrAuditor $e0 $x0 $e1))
(Implication (And (Location $e0 $x0) (Member $e0 auditor) (Member $x0 ledger) (Stimulus $e1 $e0)) (MnLocation_Member_Stimulus_ErrorOrAuditor $e0 $x0 $e1))

;; [unit, shape-parallel]  p202862 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 auditor) (Member $x0 ledger))
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (And (Location $e0 $x0) (Member $e0 error) (Member $x0 ledger)) (MnLocation_Member_ErrorOrAuditor $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 auditor) (Member $x0 ledger)) (MnLocation_Member_ErrorOrAuditor $e0 $x0))

;; [unit, shape-parallel]  p205395 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 error) (Stimulus $e1 $e0))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 auditor) (Stimulus $e1 $e0))
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (And (Location $e0 $x0) (Member $e0 error) (Stimulus $e1 $e0)) (MnLocation_Stimulus_ErrorOrAuditor $e0 $x0 $e1))
(Implication (And (Location $e0 $x0) (Member $e0 auditor) (Stimulus $e1 $e0)) (MnLocation_Stimulus_ErrorOrAuditor $e0 $x0 $e1))

;; [unit, shape-parallel]  p203672 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 error))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 auditor))
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (And (Location $e0 $x0) (Member $e0 error)) (MnLocation_ErrorOrAuditor $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 auditor)) (MnLocation_ErrorOrAuditor $e0 $x0))

;; [unit]  p204988 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 wait) (Member $x0 gate))   e.g. 
;;   B: (And (Member $e0 leave) (Member $x0 gate) (Theme $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 wait) (Member $x0 gate)) (MnMember_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 leave) (Member $x0 gate) (Theme $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))

;; [unit]  p205585 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 wait))   e.g. 
;;   B: (And (Member $e0 leave) (Theme $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 wait)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 leave) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p201701 ~ p201680   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 walk))
;;   substitution: (Agent $e0 $x0) -> (Location $e0 $x0)
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnMember_LocationOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 walk)) (MnMember_LocationOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201701 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 walk))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 sprint))
;;   substitution: (Member $e0 sprint) -> (Member $e0 walk)
(Implication (And (Location $e0 $x0) (Member $e0 walk)) (MnLocation_WalkOrSprint $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 sprint)) (MnLocation_WalkOrSprint $e0 $x0))

;; [unit, shape-parallel]  p204991 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 work) (Member $x0 survey))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 compete) (Member $x0 survey))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Location $e0 $x0) (Member $e0 work) (Member $x0 survey)) (MnLocation_Member_WorkOrCompete $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 compete) (Member $x0 survey)) (MnLocation_Member_WorkOrCompete $e0 $x0))

;; [unit, shape-parallel]  p200562 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 work))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $e0 compete))
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (And (Location $e0 $x0) (Member $e0 work)) (MnLocation_WorkOrCompete $e0 $x0))
(Implication (And (Location $e0 $x0) (Member $e0 compete)) (MnLocation_WorkOrCompete $e0 $x0))

;; [unit, shape-parallel]  p200562 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $e0 work))   e.g. 
;;   B: (And (Member $e0 work) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Location $e0 $x0)
(Implication (And (Location $e0 $x0) (Member $e0 work)) (MnMember_LocationOrTheme $e0 $x0))
(Implication (And (Member $e0 work) (Theme $e0 $x0)) (MnMember_LocationOrTheme $e0 $x0))

;; [unit, shape-parallel]  p205587 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $x0 gate))   e.g. 
;;   B: (And (Member $x0 gate) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Location $e0 $x0)
(Implication (And (Location $e0 $x0) (Member $x0 gate)) (MnMember_LocationOrTheme $e0 $x0))
(Implication (And (Member $x0 gate) (Theme $e0 $x0)) (MnMember_LocationOrTheme $x0 $e0))

;; [unit, shape-parallel]  p201988 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $x0 point) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $x0 point) (Member $x1 diver) (Theme $e0 $x1))
;;   substitution: (Member $x1 diver) -> (Member $x1 wreck)
(Implication (And (Location $e0 $x0) (Member $x0 point) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Member_Theme_WreckOrDiver $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $x0 point) (Member $x1 diver) (Theme $e0 $x1)) (MnLocation_Member_Theme_WreckOrDiver $e0 $x0 $x1))

;; [unit, shape-parallel]  p202864 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Location $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1))   e.g. 
;;   B: (And (Location $e0 $x0) (Member $x1 diver) (Theme $e0 $x1))
;;   substitution: (Member $x1 diver) -> (Member $x1 wreck)
(Implication (And (Location $e0 $x0) (Member $x1 wreck) (Theme $e0 $x1)) (MnLocation_Theme_WreckOrDiver $e0 $x0 $x1))
(Implication (And (Location $e0 $x0) (Member $x1 diver) (Theme $e0 $x1)) (MnLocation_Theme_WreckOrDiver $e0 $x0 $x1))

;; [unit, shape-parallel]  p204996 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Member $x0 north_route) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrContinue $e0 $x0))
(Implication (And (Member $e0 continue) (Member $x0 north_route) (Theme $e0 $x0)) (MnMember_Theme_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p200685 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 abandon) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 continue) (Theme $e0 $x0))
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (And (Member $e0 abandon) (Theme $e0 $x0)) (MnTheme_AbandonOrContinue $e0 $x0))
(Implication (And (Member $e0 continue) (Theme $e0 $x0)) (MnTheme_AbandonOrContinue $e0 $x0))

;; [unit, shape-parallel]  p204999 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x0))
;;   substitution: (Member $x0 clerk) -> (Member $x0 query)
(Implication (And (Member $e0 answer) (Member $x0 query) (Theme $e0 $x0)) (MnMember_Theme_QueryOrClerk $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x0)) (MnMember_Theme_QueryOrClerk $e0 $x0))

;; [unit, shape-parallel]  p205401 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 begin) (Patient $e0 $x0))
;;   substitution: (Future $e0) -> (Might $e0)
(Implication (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0)) (MnMember_Patient_MightOrFuture $e0 $x0))
(Implication (And (Future $e0) (Member $e0 begin) (Patient $e0 $x0)) (MnMember_Patient_MightOrFuture $e0 $x0))

;; [unit]  p205401 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 commence) (Patient $e0 $x0))
(Implication (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0)) (MnPatient_OrFutureMember $e0 $x0))
(Implication (And (Future $e0) (Member $e0 commence) (Patient $e0 $x0)) (MnPatient_OrFutureMember $e0 $x0))

;; [unit]  p205401 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 start) (Patient $e0 $x0))
(Implication (And (Member $e0 begin) (Might $e0) (Patient $e0 $x0)) (MnPatient_OrFutureMember $e0 $x0))
(Implication (And (Future $e0) (Member $e0 start) (Patient $e0 $x0)) (MnPatient_OrFutureMember $e0 $x0))

;; [unit, shape-parallel]  p205597 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 begin))
;;   substitution: (Future $e0) -> (Might $e0)
(Implication (And (Member $e0 begin) (Might $e0)) (MnMember_MightOrFuture $e0))
(Implication (And (Future $e0) (Member $e0 begin)) (MnMember_MightOrFuture $e0))

;; [unit]  p205597 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 commence))
(Implication (And (Member $e0 begin) (Might $e0)) (MnOrFutureMember $e0))
(Implication (And (Future $e0) (Member $e0 commence)) (MnOrFutureMember $e0))

;; [unit]  p205597 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 begin) (Might $e0))   e.g. 
;;   B: (And (Future $e0) (Member $e0 start))
(Implication (And (Member $e0 begin) (Might $e0)) (MnOrFutureMember $e0))
(Implication (And (Future $e0) (Member $e0 start)) (MnOrFutureMember $e0))

;; [unit, shape-parallel]  p200832 ~ p205605   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 begin) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 end) (Patient $e0 $x0))
;;   substitution: (Member $e0 end) -> (Member $e0 begin)
(Implication (And (Member $e0 begin) (Patient $e0 $x0)) (MnPatient_BeginOrEnd $e0 $x0))
(Implication (And (Member $e0 end) (Patient $e0 $x0)) (MnPatient_BeginOrEnd $e0 $x0))

;; [unit, shape-parallel]  p204175 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Member_Past_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln) (Past $e0)) (MnMember_Member_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205002 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 buy) (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_Member_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Member $x0 kiln)) (MnMember_Member_ThemeOrAgent $e0 $x0))

;; [unit]  p200252 ~ p203395   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0))
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p200252 ~ p200250   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy) (Past $e0)) (MnMember_Past_ThemeOrAgent $e0 $x0))

;; [unit]  p200252 ~ p203400   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0))
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit]  p200252 ~ p203438   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0))
(Implication (And (Member $e0 buy) (Past $e0) (Theme $e0 $x0)) (MnPast_OrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Past $e0) (Recipient $e0 $x0)) (MnPast_OrMemberRecipient $e0 $x0))

;; [unit]  p200257 ~ p203616   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 acquire))
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 acquire)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p200257 ~ p200255   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnMember_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 buy)) (MnMember_ThemeOrAgent $e0 $x0))

;; [unit]  p200257 ~ p203621   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 purchase))
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 purchase)) (MnOrAgentMember $e0 $x0))

;; [unit]  p200257 ~ p203714   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 sell) (Recipient $e0 $x0))
(Implication (And (Member $e0 buy) (Theme $e0 $x0)) (MnOrMemberRecipient $e0 $x0))
(Implication (And (Member $e0 sell) (Recipient $e0 $x0)) (MnOrMemberRecipient $e0 $x0))

;; [unit]  p205004 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 confirm) (Member $x0 afternoon_session) (Theme $e0 $x0))
(Implication (And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 confirm) (Member $x0 afternoon_session) (Theme $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))

;; [unit]  p200834 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 cancel) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 confirm) (Theme $e0 $x0))
(Implication (And (Member $e0 cancel) (Patient $e0 $x0)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 confirm) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p203696 ~ p205605   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 commence) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 end) (Patient $e0 $x0))
;;   substitution: (Member $e0 end) -> (Member $e0 commence)
(Implication (And (Member $e0 commence) (Patient $e0 $x0)) (MnPatient_CommenceOrEnd $e0 $x0))
(Implication (And (Member $e0 end) (Patient $e0 $x0)) (MnPatient_CommenceOrEnd $e0 $x0))

;; [unit, shape-parallel]  p205009 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 decide) (Member $x0 case) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x0))
;;   substitution: (Member $x0 judge) -> (Member $x0 case)
(Implication (And (Member $e0 decide) (Member $x0 case) (Theme $e0 $x0)) (MnMember_Theme_CaseOrJudge $e0 $x0))
(Implication (And (Member $e0 decide) (Member $x0 judge) (Theme $e0 $x0)) (MnMember_Theme_CaseOrJudge $e0 $x0))

;; [unit]  p200563 ~ p203619   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 decide) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 make))
(Implication (And (Member $e0 decide) (Theme $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 make)) (MnOrAgentMember $e0 $x0))

;; [unit]  p200563 ~ p203622   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 decide) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 reach))
(Implication (And (Member $e0 decide) (Theme $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 reach)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p205011 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 archive))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0)) (MnMember_Member_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 archive)) (MnMember_Member_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205011 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 destroy) (Member $x0 fire) (Patient $e0 $x0))
;;   substitution: (Member $x0 fire) -> (Member $x0 archive)
(Implication (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0)) (MnMember_Patient_ArchiveOrFire $e0 $x0))
(Implication (And (Member $e0 destroy) (Member $x0 fire) (Patient $e0 $x0)) (MnMember_Patient_ArchiveOrFire $e0 $x0))

;; [unit]  p205011 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 save) (Member $x0 archive) (Theme $e0 $x0))
(Implication (And (Member $e0 destroy) (Member $x0 archive) (Patient $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 save) (Member $x0 archive) (Theme $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))

;; [unit]  p205012 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 footbridge) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 save) (Member $x0 footbridge) (Theme $e0 $x0))
(Implication (And (Member $e0 destroy) (Member $x0 footbridge) (Patient $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))
(Implication (And (Member $e0 save) (Member $x0 footbridge) (Theme $e0 $x0)) (MnMember_OrMemberTheme $e0 $x0))

;; [unit, shape-parallel]  p205013 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 greenhouse))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0)) (MnMember_Member_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 destroy) (Member $x0 greenhouse)) (MnMember_Member_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205013 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 destroy) (Member $x0 storm) (Patient $e0 $x0))
;;   substitution: (Member $x0 storm) -> (Member $x0 greenhouse)
(Implication (And (Member $e0 destroy) (Member $x0 greenhouse) (Patient $e0 $x0)) (MnMember_Patient_GreenhouseOrStorm $e0 $x0))
(Implication (And (Member $e0 destroy) (Member $x0 storm) (Patient $e0 $x0)) (MnMember_Patient_GreenhouseOrStorm $e0 $x0))

;; [unit, shape-parallel]  p200402 ~ p200676   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 destroy))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 destroy) (Patient $e0 $x0)) (MnMember_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 destroy)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit]  p200402 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 destroy) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 save) (Theme $e0 $x0))
(Implication (And (Member $e0 destroy) (Patient $e0 $x0)) (MnOrMemberTheme $e0 $x0))
(Implication (And (Member $e0 save) (Theme $e0 $x0)) (MnOrMemberTheme $e0 $x0))

;; [unit]  p201707 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 die) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 survive))
(Implication (And (Member $e0 die) (Patient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 survive)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p205016 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x0))
;;   substitution: (Member $x0 diver) -> (Member $x0 wreck)
(Implication (And (Member $e0 discover) (Member $x0 wreck) (Theme $e0 $x0)) (MnMember_Theme_WreckOrDiver $e0 $x0))
(Implication (And (Member $e0 discover) (Member $x0 diver) (Theme $e0 $x0)) (MnMember_Theme_WreckOrDiver $e0 $x0))

;; [unit, shape-parallel]  p205606 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 error) (Stimulus $e1 $e0))   e.g. 
;;   B: (And (Member $e0 auditor) (Stimulus $e1 $e0))
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (And (Member $e0 error) (Stimulus $e1 $e0)) (MnStimulus_ErrorOrAuditor $e0 $e1))
(Implication (And (Member $e0 auditor) (Stimulus $e1 $e0)) (MnStimulus_ErrorOrAuditor $e0 $e1))

;; [unit, shape-parallel]  p205607 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 examine) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 ignore) (Theme $e0 $x0))
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (And (Member $e0 examine) (Theme $e0 $x0)) (MnTheme_ExamineOrIgnore $e0 $x0))
(Implication (And (Member $e0 ignore) (Theme $e0 $x0)) (MnTheme_ExamineOrIgnore $e0 $x0))

;; [unit]  p205017 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 clerk) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit]  p205017 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 answer) (Member $x0 vet) (Theme $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))
(Implication (And (Member $e0 answer) (Member $x0 vet) (Theme $e0 $x0)) (MnTheme_OrMemberMember $e0 $x0))

;; [unit]  p204185 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 receive) (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Member $e0 give) (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200332 ~ p205409   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 receive) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200340 ~ p205614   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 give) (Recipient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 receive) (Source $e0 $x0))
(Implication (And (Member $e0 give) (Recipient $e0 $x0)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 receive) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p205610 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 give_up) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 continue) (Theme $e0 $x0))
;;   substitution: (Member $e0 continue) -> (Member $e0 give_up)
(Implication (And (Member $e0 give_up) (Theme $e0 $x0)) (MnTheme_GiveUpOrContinue $e0 $x0))
(Implication (And (Member $e0 continue) (Theme $e0 $x0)) (MnTheme_GiveUpOrContinue $e0 $x0))

;; [unit]  p204189 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 borrow) (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Member $e0 lend) (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p205023 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0))   e.g. 
;;   B: (And (Cardinality $x0 <num>) (Member $e0 lend) (Theme $e0 $x0))
;;   substitution: (Cardinality $x0 <num>) -> (Member $x0 ladder)
(Implication (And (Member $e0 lend) (Member $x0 ladder) (Theme $e0 $x0)) (MnMember_Theme_LadderOrNum $e0 $x0))
(Implication (And (Cardinality $x0 <num>) (Member $e0 lend) (Theme $e0 $x0)) (MnMember_Theme_LadderOrNum $x0 $e0))

;; [unit]  p200809 ~ p205402   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p200835 ~ p205598   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 borrow) (Source $e0 $x0))
(Implication (And (Member $e0 lend) (Recipient $e0 $x0)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 borrow) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p205408 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $e0 lend) (Theme $e0 $x0))
;;   substitution: (Agent $e0 ravi) -> (Recipient $e0 ravi)
(Implication (And (Member $e0 lend) (Recipient $e0 ravi) (Theme $e0 $x0)) (MnMember_Theme_RaviOrRavi $e0 $x0))
(Implication (And (Agent $e0 ravi) (Member $e0 lend) (Theme $e0 $x0)) (MnMember_Theme_RaviOrRavi $e0 $x0))

;; [unit, shape-parallel]  p205612 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 lend) (Recipient $e0 ravi))   e.g. 
;;   B: (And (Agent $e0 ravi) (Member $e0 lend))
;;   substitution: (Agent $e0 ravi) -> (Recipient $e0 ravi)
(Implication (And (Member $e0 lend) (Recipient $e0 ravi)) (MnMember_RaviOrRavi $e0))
(Implication (And (Agent $e0 ravi) (Member $e0 lend)) (MnMember_RaviOrRavi $e0))

;; [unit, shape-parallel]  p205025 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order) (Member $x0 scan))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0)) (MnMember_Member_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Member $x0 scan)) (MnMember_Member_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205025 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 cancel) (Member $x0 scan) (Theme $e0 $x0))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Member $e0 order) (Member $x0 scan) (Theme $e0 $x0)) (MnMember_Theme_OrderOrCancel $e0 $x0))
(Implication (And (Member $e0 cancel) (Member $x0 scan) (Theme $e0 $x0)) (MnMember_Theme_OrderOrCancel $e0 $x0))

;; [unit, shape-parallel]  p205026 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x0 <num> scan))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0)) (MnMember_Ordinal_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 order) (Ordinal $x0 <num> scan)) (MnMember_Ordinal_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205026 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 cancel) (Ordinal $x0 <num> scan) (Theme $e0 $x0))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Member $e0 order) (Ordinal $x0 <num> scan) (Theme $e0 $x0)) (MnOrdinal_Theme_OrderOrCancel $e0 $x0))
(Implication (And (Member $e0 cancel) (Ordinal $x0 <num> scan) (Theme $e0 $x0)) (MnOrdinal_Theme_OrderOrCancel $e0 $x0))

;; [unit, shape-parallel]  p203706 ~ p203620   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 order))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $e0 order) (Theme $e0 $x0)) (MnMember_ThemeOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 order)) (MnMember_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203706 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 order) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 cancel) (Theme $e0 $x0))
;;   substitution: (Member $e0 cancel) -> (Member $e0 order)
(Implication (And (Member $e0 order) (Theme $e0 $x0)) (MnTheme_OrderOrCancel $e0 $x0))
(Implication (And (Member $e0 cancel) (Theme $e0 $x0)) (MnTheme_OrderOrCancel $e0 $x0))

;; [unit, shape-parallel]  p205027 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 advance) (Member $x0 tournament) (Theme $e0 $x0))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Member $e0 postpone) (Member $x0 tournament) (Theme $e0 $x0)) (MnMember_Theme_PostponeOrAdvance $e0 $x0))
(Implication (And (Member $e0 advance) (Member $x0 tournament) (Theme $e0 $x0)) (MnMember_Theme_PostponeOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p200836 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 postpone) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 advance) (Theme $e0 $x0))
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (And (Member $e0 postpone) (Theme $e0 $x0)) (MnTheme_PostponeOrAdvance $e0 $x0))
(Implication (And (Member $e0 advance) (Theme $e0 $x0)) (MnTheme_PostponeOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p205613 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 put_off) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 advance) (Theme $e0 $x0))
;;   substitution: (Member $e0 advance) -> (Member $e0 put_off)
(Implication (And (Member $e0 put_off) (Theme $e0 $x0)) (MnTheme_PutOffOrAdvance $e0 $x0))
(Implication (And (Member $e0 advance) (Theme $e0 $x0)) (MnTheme_PutOffOrAdvance $e0 $x0))

;; [unit, shape-parallel]  p200687 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 reject) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 accept) (Theme $e0 $x0))
;;   substitution: (Member $e0 accept) -> (Member $e0 reject)
(Implication (And (Member $e0 reject) (Theme $e0 $x0)) (MnTheme_RejectOrAccept $e0 $x0))
(Implication (And (Member $e0 accept) (Theme $e0 $x0)) (MnTheme_RejectOrAccept $e0 $x0))

;; [unit]  p201065 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0))
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 fix) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit]  p201065 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0))
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnPast_OrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 mend) (Past $e0)) (MnPast_OrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p201065 ~ p201060   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair) (Past $e0)) (MnMember_Past_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201065 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 break) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrBreak $e0 $x0))
(Implication (And (Member $e0 break) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_RepairOrBreak $e0 $x0))

;; [unit, shape-parallel]  p201093 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Past $e0))   e.g. 
;;   B: (And (Member $e0 break) (Past $e0))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Past $e0)) (MnPast_RepairOrBreak $e0))
(Implication (And (Member $e0 break) (Past $e0)) (MnPast_RepairOrBreak $e0))

;; [unit]  p200688 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 fix))
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 fix)) (MnOrAgentMember $e0 $x0))

;; [unit]  p200688 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 mend))
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnOrAgentMember $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 mend)) (MnOrAgentMember $e0 $x0))

;; [unit, shape-parallel]  p200688 ~ p200678   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $e0 repair))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnMember_PatientOrAgent $e0 $x0))
(Implication (And (Agent $e0 $x0) (Member $e0 repair)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200688 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 repair) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 break) (Patient $e0 $x0))
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (And (Member $e0 repair) (Patient $e0 $x0)) (MnPatient_RepairOrBreak $e0 $x0))
(Implication (And (Member $e0 break) (Patient $e0 $x0)) (MnPatient_RepairOrBreak $e0 $x0))

;; [unit, shape-parallel]  p205029 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 sign) (Member $x0 chart) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 sign) (Member $x0 physician) (Patient $e0 $x0))
;;   substitution: (Member $x0 physician) -> (Member $x0 chart)
(Implication (And (Member $e0 sign) (Member $x0 chart) (Patient $e0 $x0)) (MnMember_Patient_ChartOrPhysician $e0 $x0))
(Implication (And (Member $e0 sign) (Member $x0 physician) (Patient $e0 $x0)) (MnMember_Patient_ChartOrPhysician $e0 $x0))

;; [unit, shape-parallel]  p203717 ~ p205605   support 0 (control 3)   gate: FAIL
;;   A: (And (Member $e0 start) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 end) (Patient $e0 $x0))
;;   substitution: (Member $e0 end) -> (Member $e0 start)
(Implication (And (Member $e0 start) (Patient $e0 $x0)) (MnPatient_StartOrEnd $e0 $x0))
(Implication (And (Member $e0 end) (Patient $e0 $x0)) (MnPatient_StartOrEnd $e0 $x0))

;; [unit, shape-parallel]  p204191 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. 
;;   B: (And (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Member $x0 potter) -> (Member $x0 apprentice)
(Implication (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnMember_Recipient_Theme_ApprenticeOrPotter $e0 $x0))
(Implication (And (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnMember_Recipient_Theme_ApprenticeOrPotter $e0 $x0))

;; [unit, shape-parallel]  p205030 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x0))
;;   substitution: (Member $x0 potter) -> (Member $x0 apprentice)
(Implication (And (Member $e0 teach) (Member $x0 apprentice) (Recipient $e0 $x0)) (MnMember_Recipient_ApprenticeOrPotter $e0 $x0))
(Implication (And (Member $e0 teach) (Member $x0 potter) (Recipient $e0 $x0)) (MnMember_Recipient_ApprenticeOrPotter $e0 $x0))

;; [unit]  p204192 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 learn) (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0))
(Implication (And (Member $e0 teach) (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p201066 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_OrMemberSource $e0 $x0 $x1))

;; [unit]  p203441 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. 
;;   B: (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 glazing))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnTheme_OrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Source $e0 $x0) (Theme $e0 glazing)) (MnTheme_OrMemberSource $e0 $x0))

;; [unit]  p200489 ~ p205611   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 teach) (Recipient $e0 $x0))   e.g. 
;;   B: (And (Member $e0 learn) (Source $e0 $x0))
(Implication (And (Member $e0 teach) (Recipient $e0 $x0)) (MnOrMemberSource $e0 $x0))
(Implication (And (Member $e0 learn) (Source $e0 $x0)) (MnOrMemberSource $e0 $x0))

;; [unit, shape-parallel]  p205618 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (And (Member $e0 turn_down) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $e0 accept) (Theme $e0 $x0))
;;   substitution: (Member $e0 accept) -> (Member $e0 turn_down)
(Implication (And (Member $e0 turn_down) (Theme $e0 $x0)) (MnTheme_TurnDownOrAccept $e0 $x0))
(Implication (And (Member $e0 accept) (Theme $e0 $x0)) (MnTheme_TurnDownOrAccept $e0 $x0))

;; [unit, shape-parallel]  p203721 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 afternoon_session) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 afternoon_session) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 afternoon_session) (Patient $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))
(Implication (And (Member $x0 afternoon_session) (Theme $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))

;; [unit, shape-parallel]  p205620 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 answer) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 clerk) (Theme $e0 $x0))
;;   substitution: (Member $x0 clerk) -> (Member $x0 answer)
(Implication (And (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_AnswerOrClerk $x0 $e0))
(Implication (And (Member $x0 clerk) (Theme $e0 $x0)) (MnTheme_AnswerOrClerk $x0 $e0))

;; [unit, shape-parallel]  p205620 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 answer) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 vet) (Theme $e0 $x0))
;;   substitution: (Member $x0 vet) -> (Member $x0 answer)
(Implication (And (Member $x0 answer) (Theme $e0 $x0)) (MnTheme_AnswerOrVet $x0 $e0))
(Implication (And (Member $x0 vet) (Theme $e0 $x0)) (MnTheme_AnswerOrVet $x0 $e0))

;; [unit, shape-parallel]  p205034 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. 
;;   B: (And (Member $x0 potter) (Recipient $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Member $x0 potter) -> (Member $x0 apprentice)
(Implication (And (Member $x0 apprentice) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnRecipient_Theme_ApprenticeOrPotter $x0 $e0))
(Implication (And (Member $x0 potter) (Recipient $e0 $x0) (Theme $e0 glazing)) (MnRecipient_Theme_ApprenticeOrPotter $x0 $e0))

;; [unit, shape-parallel]  p205621 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 apprentice) (Recipient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 potter) (Recipient $e0 $x0))
;;   substitution: (Member $x0 potter) -> (Member $x0 apprentice)
(Implication (And (Member $x0 apprentice) (Recipient $e0 $x0)) (MnRecipient_ApprenticeOrPotter $x0 $e0))
(Implication (And (Member $x0 potter) (Recipient $e0 $x0)) (MnRecipient_ApprenticeOrPotter $x0 $e0))

;; [unit, shape-parallel]  p205622 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 archive))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 archive) (Patient $e0 $x0)) (MnMember_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 archive)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205622 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 archive) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 archive) (Patient $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))
(Implication (And (Member $x0 archive) (Theme $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))

;; [unit, shape-parallel]  p205622 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 archive) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 fire) (Patient $e0 $x0))
;;   substitution: (Member $x0 fire) -> (Member $x0 archive)
(Implication (And (Member $x0 archive) (Patient $e0 $x0)) (MnPatient_ArchiveOrFire $x0 $e0))
(Implication (And (Member $x0 fire) (Patient $e0 $x0)) (MnPatient_ArchiveOrFire $x0 $e0))

;; [unit, shape-parallel]  p201712 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 case) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 judge) (Theme $e0 $x0))
;;   substitution: (Member $x0 judge) -> (Member $x0 case)
(Implication (And (Member $x0 case) (Theme $e0 $x0)) (MnTheme_CaseOrJudge $x0 $e0))
(Implication (And (Member $x0 judge) (Theme $e0 $x0)) (MnTheme_CaseOrJudge $x0 $e0))

;; [unit, shape-parallel]  p205624 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 chart) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 physician) (Patient $e0 $x0))
;;   substitution: (Member $x0 physician) -> (Member $x0 chart)
(Implication (And (Member $x0 chart) (Patient $e0 $x0)) (MnPatient_ChartOrPhysician $x0 $e0))
(Implication (And (Member $x0 physician) (Patient $e0 $x0)) (MnPatient_ChartOrPhysician $x0 $e0))

;; [unit, shape-parallel]  p201437 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 crate) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crate) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 crate) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 crate) (Past $e0)) (MnMember_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201713 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 crate) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 crate))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 crate) (Theme $e0 $x0)) (MnMember_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 crate)) (MnMember_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205035 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Member $x0 drill) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))
(Implication (And (Member $x0 drill) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205630 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 footbridge) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 footbridge) (Theme $e0 $x0))
;;   substitution: (Theme $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 footbridge) (Patient $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))
(Implication (And (Member $x0 footbridge) (Theme $e0 $x0)) (MnMember_PatientOrTheme $x0 $e0))

;; [unit, shape-parallel]  p202024 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 gearbox) (Member $x0 seized) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 gearbox) (Member $x0 seized) (Past $e0) (Patient $e0 $x0)) (MnMember_Member_Past_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized) (Past $e0)) (MnMember_Member_Past_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203444 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 gearbox) (Member $x0 seized) (Patient $e0 $x0)) (MnMember_Member_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Member $x0 seized)) (MnMember_Member_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p202886 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 gearbox) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 gearbox) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox) (Past $e0)) (MnMember_Past_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203731 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 gearbox) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 gearbox))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 gearbox) (Patient $e0 $x0)) (MnMember_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 gearbox)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205038 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Member $x0 generator) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))
(Implication (And (Member $x0 generator) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p205633 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 greenhouse) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 greenhouse))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 greenhouse) (Patient $e0 $x0)) (MnMember_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 greenhouse)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205633 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 greenhouse) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 storm) (Patient $e0 $x0))
;;   substitution: (Member $x0 storm) -> (Member $x0 greenhouse)
(Implication (And (Member $x0 greenhouse) (Patient $e0 $x0)) (MnPatient_GreenhouseOrStorm $x0 $e0))
(Implication (And (Member $x0 storm) (Patient $e0 $x0)) (MnPatient_GreenhouseOrStorm $x0 $e0))

;; [unit, shape-parallel]  p204195 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnMember_Ordinal_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy) (Past $e0)) (MnMember_Ordinal_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205411 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 kiln) (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnMember_Ordinal_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Ordinal $x0 <num> buy)) (MnMember_Ordinal_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200971 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 kiln) (Past $e0) (Theme $e0 $x0)) (MnMember_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln) (Past $e0)) (MnMember_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p201098 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 kiln) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 kiln))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 kiln) (Theme $e0 $x0)) (MnMember_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 kiln)) (MnMember_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205634 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 loan_application) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 bank) (Theme $e0 $x0))
;;   substitution: (Member $x0 bank) -> (Member $x0 loan_application)
(Implication (And (Member $x0 loan_application) (Theme $e0 $x0)) (MnTheme_LoanApplicationOrBank $x0 $e0))
(Implication (And (Member $x0 bank) (Theme $e0 $x0)) (MnTheme_LoanApplicationOrBank $x0 $e0))

;; [unit, shape-parallel]  p205039 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0))
;;   substitution: (Source $e0 $x1) -> (Recipient $e0 $x1)
(Implication (And (Member $x0 manifest) (Recipient $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))
(Implication (And (Member $x0 manifest) (Source $e0 $x1) (Theme $e0 $x0)) (MnMember_Theme_RecipientOrSource $x0 $e0 $x1))

;; [unit, shape-parallel]  p203739 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 manuscript) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 editor) (Theme $e0 $x0))
;;   substitution: (Member $x0 editor) -> (Member $x0 manuscript)
(Implication (And (Member $x0 manuscript) (Theme $e0 $x0)) (MnTheme_ManuscriptOrEditor $x0 $e0))
(Implication (And (Member $x0 editor) (Theme $e0 $x0)) (MnTheme_ManuscriptOrEditor $x0 $e0))

;; [unit, shape-parallel]  p205637 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 query) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 clerk) (Theme $e0 $x0))
;;   substitution: (Member $x0 clerk) -> (Member $x0 query)
(Implication (And (Member $x0 query) (Theme $e0 $x0)) (MnTheme_QueryOrClerk $x0 $e0))
(Implication (And (Member $x0 clerk) (Theme $e0 $x0)) (MnTheme_QueryOrClerk $x0 $e0))

;; [unit, shape-parallel]  p203746 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 scan))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Member $x0 scan) (Theme $e0 $x0)) (MnMember_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 scan)) (MnMember_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p202890 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 seized) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 seized) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 seized) (Past $e0) (Patient $e0 $x0)) (MnMember_Past_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 seized) (Past $e0)) (MnMember_Past_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203748 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 seized) (Patient $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Member $x0 seized))
;;   substitution: (Agent $e0 $x0) -> (Patient $e0 $x0)
(Implication (And (Member $x0 seized) (Patient $e0 $x0)) (MnMember_PatientOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Member $x0 seized)) (MnMember_PatientOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203755 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 wreck) (Theme $e0 $x0))   e.g. 
;;   B: (And (Member $x0 diver) (Theme $e0 $x0))
;;   substitution: (Member $x0 diver) -> (Member $x0 wreck)
(Implication (And (Member $x0 wreck) (Theme $e0 $x0)) (MnTheme_WreckOrDiver $x0 $e0))
(Implication (And (Member $x0 diver) (Theme $e0 $x0)) (MnTheme_WreckOrDiver $x0 $e0))

;; [unit, shape-parallel]  p201441 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 electrician) (Past $e0) (Patient $e0 $x0))
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (And (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_YardFloodlightOrElectrician $x0 $e0))
(Implication (And (Member $x0 electrician) (Past $e0) (Patient $e0 $x0)) (MnPast_Patient_YardFloodlightOrElectrician $x0 $e0))

;; [unit, shape-parallel]  p201723 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Member $x0 yard_floodlight) (Patient $e0 $x0))   e.g. 
;;   B: (And (Member $x0 electrician) (Patient $e0 $x0))
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (And (Member $x0 yard_floodlight) (Patient $e0 $x0)) (MnPatient_YardFloodlightOrElectrician $x0 $e0))
(Implication (And (Member $x0 electrician) (Patient $e0 $x0)) (MnPatient_YardFloodlightOrElectrician $x0 $e0))

;; [unit, shape-parallel]  p205043 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Past $e0))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Ordinal $x0 <num> buy) (Past $e0) (Theme $e0 $x0)) (MnOrdinal_Past_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> buy) (Past $e0)) (MnOrdinal_Past_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p205642 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> buy) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> buy))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Ordinal $x0 <num> buy) (Theme $e0 $x0)) (MnOrdinal_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> buy)) (MnOrdinal_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p203756 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Ordinal $x0 <num> scan) (Theme $e0 $x0))   e.g. 
;;   B: (And (Agent $e0 $x0) (Ordinal $x0 <num> scan))
;;   substitution: (Agent $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Ordinal $x0 <num> scan) (Theme $e0 $x0)) (MnOrdinal_ThemeOrAgent $x0 $e0))
(Implication (And (Agent $e0 $x0) (Ordinal $x0 <num> scan)) (MnOrdinal_ThemeOrAgent $e0 $x0))

;; [unit, shape-parallel]  p200041 ~ p203757   support 0 (control 3)   gate: FAIL
;;   A: (And (Past $e0) (Theme $e0 $x0))   e.g. 
;;   B: (And (Past $e0) (Recipient $e0 $x0))
;;   substitution: (Recipient $e0 $x0) -> (Theme $e0 $x0)
(Implication (And (Past $e0) (Theme $e0 $x0)) (MnPast_ThemeOrRecipient $e0 $x0))
(Implication (And (Past $e0) (Recipient $e0 $x0)) (MnPast_ThemeOrRecipient $e0 $x0))

;; [unit, shape-parallel]  p200091 ~ p200490   support 0 (control 4)   gate: FAIL
;;   A: (And (Recipient $e0 $x0) (Theme $e0 $x1))   e.g. 
;;   B: (And (Source $e0 $x0) (Theme $e0 $x1))
;;   substitution: (Source $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Recipient $e0 $x0) (Theme $e0 $x1)) (MnTheme_RecipientOrSource $e0 $x0 $x1))
(Implication (And (Source $e0 $x0) (Theme $e0 $x1)) (MnTheme_RecipientOrSource $e0 $x0 $x1))

;; [unit, shape-parallel]  p203764 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (And (Recipient $e0 $x0) (Theme $e0 glazing))   e.g. 
;;   B: (And (Source $e0 $x0) (Theme $e0 glazing))
;;   substitution: (Source $e0 $x0) -> (Recipient $e0 $x0)
(Implication (And (Recipient $e0 $x0) (Theme $e0 glazing)) (MnTheme_RecipientOrSource $e0 $x0))
(Implication (And (Source $e0 $x0) (Theme $e0 glazing)) (MnTheme_RecipientOrSource $e0 $x0))

;; [unit, shape-parallel]  p200051 ~ p200702   support 0 (control 2)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 automobile)
;;   substitution: (Member $x0 automobile) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrAutomobile $x0))
(Implication (Member $x0 automobile) (MnNumOrAutomobile $x0))

;; [unit, shape-parallel]  p200051 ~ p205765   support 0 (control 2)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 car)
;;   substitution: (Member $x0 car) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrCar $x0))
(Implication (Member $x0 car) (MnNumOrCar $x0))

;; [unit, shape-parallel]  p200051 ~ p203902   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 countersignature)
;;   substitution: (Member $x0 countersignature) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrCountersignature $x0))
(Implication (Member $x0 countersignature) (MnNumOrCountersignature $x0))

;; [unit, shape-parallel]  p200051 ~ p203923   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 ladder)
;;   substitution: (Member $x0 ladder) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrLadder $x0))
(Implication (Member $x0 ladder) (MnNumOrLadder $x0))

;; [unit, shape-parallel]  p200051 ~ p205774   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 medal)
;;   substitution: (Member $x0 medal) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrMedal $x0))
(Implication (Member $x0 medal) (MnNumOrMedal $x0))

;; [unit, shape-parallel]  p200051 ~ p203929   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 painting)
;;   substitution: (Member $x0 painting) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrPainting $x0))
(Implication (Member $x0 painting) (MnNumOrPainting $x0))

;; [unit, shape-parallel]  p200051 ~ p201811   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 projector)
;;   substitution: (Member $x0 projector) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrProjector $x0))
(Implication (Member $x0 projector) (MnNumOrProjector $x0))

;; [unit, shape-parallel]  p200051 ~ p205780   support 0 (control 1)   gate: FAIL
;;   A: (Cardinality $x0 <num>)   e.g. 
;;   B: (Member $x0 whistle)
;;   substitution: (Member $x0 whistle) -> (Cardinality $x0 <num>)
(Implication (Cardinality $x0 <num>) (MnNumOrWhistle $x0))
(Implication (Member $x0 whistle) (MnNumOrWhistle $x0))

;; [unit, shape-parallel]  p200076 ~ p200237   support 0 (control 1)   gate: FAIL
;;   A: (Experiencer $e0 $x0)   e.g. 
;;   B: (Holder $e0 $x0)
;;   substitution: (Holder $e0 $x0) -> (Experiencer $e0 $x0)
(Implication (Experiencer $e0 $x0) (MnExperiencerOrHolder $e0 $x0))
(Implication (Holder $e0 $x0) (MnExperiencerOrHolder $e0 $x0))

;; [unit, shape-parallel]  p200696 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 abandon)   e.g. 
;;   B: (Member $e0 continue)
;;   substitution: (Member $e0 continue) -> (Member $e0 abandon)
(Implication (Member $e0 abandon) (MnAbandonOrContinue $e0))
(Implication (Member $e0 continue) (MnAbandonOrContinue $e0))

;; [unit, shape-parallel]  p203873 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 allow)   e.g. 
;;   B: (Member $e0 forbid)
;;   substitution: (Member $e0 forbid) -> (Member $e0 allow)
(Implication (Member $e0 allow) (MnAllowOrForbid $e0))
(Implication (Member $e0 forbid) (MnAllowOrForbid $e0))

;; [unit, shape-parallel]  p201134 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 arrive)   e.g. 
;;   B: (Member $e0 depart)
;;   substitution: (Member $e0 depart) -> (Member $e0 arrive)
(Implication (Member $e0 arrive) (MnArriveOrDepart $e0))
(Implication (Member $e0 depart) (MnArriveOrDepart $e0))

;; [unit, shape-parallel]  p200573 ~ p205752   support 0 (control 3)   gate: FAIL
;;   A: (Member $e0 begin)   e.g. 
;;   B: (Member $e0 end)
;;   substitution: (Member $e0 end) -> (Member $e0 begin)
(Implication (Member $e0 begin) (MnBeginOrEnd $e0))
(Implication (Member $e0 end) (MnBeginOrEnd $e0))

;; [unit, shape-parallel]  p205749 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 call_off)   e.g. 
;;   B: (Member $e0 confirm)
;;   substitution: (Member $e0 confirm) -> (Member $e0 call_off)
(Implication (Member $e0 call_off) (MnCallOffOrConfirm $e0))
(Implication (Member $e0 confirm) (MnCallOffOrConfirm $e0))

;; [unit, shape-parallel]  p200574 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 cancel)   e.g. 
;;   B: (Member $e0 confirm)
;;   substitution: (Member $e0 confirm) -> (Member $e0 cancel)
(Implication (Member $e0 cancel) (MnCancelOrConfirm $e0))
(Implication (Member $e0 confirm) (MnCancelOrConfirm $e0))

;; [unit, shape-parallel]  p200574 ~ p203886   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 cancel)   e.g. 
;;   B: (Member $e0 order)
;;   substitution: (Member $e0 order) -> (Member $e0 cancel)
(Implication (Member $e0 cancel) (MnCancelOrOrder $e0))
(Implication (Member $e0 order) (MnCancelOrOrder $e0))

;; [unit, shape-parallel]  p205750 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 cause)   e.g. 
;;   B: (Member $e0 save)
;;   substitution: (Member $e0 save) -> (Member $e0 cause)
(Implication (Member $e0 cause) (MnCauseOrSave $e0))
(Implication (Member $e0 save) (MnCauseOrSave $e0))

;; [unit, shape-parallel]  p203875 ~ p205752   support 0 (control 3)   gate: FAIL
;;   A: (Member $e0 commence)   e.g. 
;;   B: (Member $e0 end)
;;   substitution: (Member $e0 end) -> (Member $e0 commence)
(Implication (Member $e0 commence) (MnCommenceOrEnd $e0))
(Implication (Member $e0 end) (MnCommenceOrEnd $e0))

;; [unit, shape-parallel]  p200410 ~ p200697   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 decide)   e.g. 
;;   B: (Member $e0 decision)
;;   substitution: (Member $e0 decision) -> (Member $e0 decide)
(Implication (Member $e0 decide) (MnDecideOrDecision $e0))
(Implication (Member $e0 decision) (MnDecideOrDecision $e0))

;; [unit, shape-parallel]  p200411 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 destroy)   e.g. 
;;   B: (Member $e0 save)
;;   substitution: (Member $e0 save) -> (Member $e0 destroy)
(Implication (Member $e0 destroy) (MnDestroyOrSave $e0))
(Implication (Member $e0 save) (MnDestroyOrSave $e0))

;; [unit, shape-parallel]  p201764 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 die)   e.g. 
;;   B: (Member $e0 survive)
;;   substitution: (Member $e0 survive) -> (Member $e0 die)
(Implication (Member $e0 die) (MnDieOrSurvive $e0))
(Implication (Member $e0 survive) (MnDieOrSurvive $e0))

;; [unit, shape-parallel]  p203878 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 error)   e.g. 
;;   B: (Member $e0 auditor)
;;   substitution: (Member $e0 auditor) -> (Member $e0 error)
(Implication (Member $e0 error) (MnErrorOrAuditor $e0))
(Implication (Member $e0 auditor) (MnErrorOrAuditor $e0))

;; [unit, shape-parallel]  p205753 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 examine)   e.g. 
;;   B: (Member $e0 ignore)
;;   substitution: (Member $e0 ignore) -> (Member $e0 examine)
(Implication (Member $e0 examine) (MnExamineOrIgnore $e0))
(Implication (Member $e0 ignore) (MnExamineOrIgnore $e0))

;; [unit, shape-parallel]  p203881 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 give_up)   e.g. 
;;   B: (Member $e0 continue)
;;   substitution: (Member $e0 continue) -> (Member $e0 give_up)
(Implication (Member $e0 give_up) (MnGiveUpOrContinue $e0))
(Implication (Member $e0 continue) (MnGiveUpOrContinue $e0))

;; [unit, shape-parallel]  p205758 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 permit)   e.g. 
;;   B: (Member $e0 forbid)
;;   substitution: (Member $e0 forbid) -> (Member $e0 permit)
(Implication (Member $e0 permit) (MnPermitOrForbid $e0))
(Implication (Member $e0 forbid) (MnPermitOrForbid $e0))

;; [unit, shape-parallel]  p200854 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 postpone)   e.g. 
;;   B: (Member $e0 advance)
;;   substitution: (Member $e0 advance) -> (Member $e0 postpone)
(Implication (Member $e0 postpone) (MnPostponeOrAdvance $e0))
(Implication (Member $e0 advance) (MnPostponeOrAdvance $e0))

;; [unit, shape-parallel]  p205759 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 put_off)   e.g. 
;;   B: (Member $e0 advance)
;;   substitution: (Member $e0 advance) -> (Member $e0 put_off)
(Implication (Member $e0 put_off) (MnPutOffOrAdvance $e0))
(Implication (Member $e0 advance) (MnPutOffOrAdvance $e0))

;; [unit, shape-parallel]  p200699 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 reject)   e.g. 
;;   B: (Member $e0 accept)
;;   substitution: (Member $e0 accept) -> (Member $e0 reject)
(Implication (Member $e0 reject) (MnRejectOrAccept $e0))
(Implication (Member $e0 accept) (MnRejectOrAccept $e0))

;; [unit, shape-parallel]  p200700 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 repair)   e.g. 
;;   B: (Member $e0 break)
;;   substitution: (Member $e0 break) -> (Member $e0 repair)
(Implication (Member $e0 repair) (MnRepairOrBreak $e0))
(Implication (Member $e0 break) (MnRepairOrBreak $e0))

;; [unit, shape-parallel]  p201140 ~ p205752   support 0 (control 3)   gate: FAIL
;;   A: (Member $e0 start)   e.g. 
;;   B: (Member $e0 end)
;;   substitution: (Member $e0 end) -> (Member $e0 start)
(Implication (Member $e0 start) (MnStartOrEnd $e0))
(Implication (Member $e0 end) (MnStartOrEnd $e0))

;; [unit, shape-parallel]  p201767 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 take)   e.g. 
;;   B: (Member $e0 sprint)
;;   substitution: (Member $e0 sprint) -> (Member $e0 take)
(Implication (Member $e0 take) (MnTakeOrSprint $e0))
(Implication (Member $e0 sprint) (MnTakeOrSprint $e0))

;; [unit, shape-parallel]  p201767 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 take)   e.g. 
;;   B: (Member $e0 stroll)
;;   substitution: (Member $e0 stroll) -> (Member $e0 take)
(Implication (Member $e0 take) (MnTakeOrStroll $e0))
(Implication (Member $e0 stroll) (MnTakeOrStroll $e0))

;; [unit, shape-parallel]  p205762 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 turn_down)   e.g. 
;;   B: (Member $e0 accept)
;;   substitution: (Member $e0 accept) -> (Member $e0 turn_down)
(Implication (Member $e0 turn_down) (MnTurnDownOrAccept $e0))
(Implication (Member $e0 accept) (MnTurnDownOrAccept $e0))

;; [unit, shape-parallel]  p205763 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 wait)   e.g. 
;;   B: (Member $e0 leave)
;;   substitution: (Member $e0 leave) -> (Member $e0 wait)
(Implication (Member $e0 wait) (MnWaitOrLeave $e0))
(Implication (Member $e0 leave) (MnWaitOrLeave $e0))

;; [unit, shape-parallel]  p200701 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 walk)   e.g. 
;;   B: (Member $e0 sprint)
;;   substitution: (Member $e0 sprint) -> (Member $e0 walk)
(Implication (Member $e0 walk) (MnWalkOrSprint $e0))
(Implication (Member $e0 sprint) (MnWalkOrSprint $e0))

;; [unit, shape-parallel]  p200701 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $e0 walk)   e.g. 
;;   B: (Member $e0 stroll)
;;   substitution: (Member $e0 stroll) -> (Member $e0 walk)
(Implication (Member $e0 walk) (MnWalkOrStroll $e0))
(Implication (Member $e0 stroll) (MnWalkOrStroll $e0))

;; [unit, shape-parallel]  p200289 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $e0 work)   e.g. 
;;   B: (Member $e0 compete)
;;   substitution: (Member $e0 compete) -> (Member $e0 work)
(Implication (Member $e0 work) (MnWorkOrCompete $e0))
(Implication (Member $e0 compete) (MnWorkOrCompete $e0))

;; [unit, shape-parallel]  p203896 ~ raw   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 auditor)   e.g. 
;;   B: (Member $x0 error)
;;   substitution: (Member $x0 error) -> (Member $x0 auditor)
(Implication (Member $x0 auditor) (MnAuditorOrError $x0))
(Implication (Member $x0 error) (MnAuditorOrError $x0))

;; [unit, shape-parallel]  p200703 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 big)   e.g. 
;;   B: (Member $x0 huge) ~NEG
;;   substitution: (Member $x0 huge) ~NEG -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrHuge $x0))
(Implication (Member $x0 huge) ~NEG (MnBigOrHuge $x0))

;; [unit, shape-parallel]  p200703 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 big)   e.g. 
;;   B: (Member $x0 large) ~NEG
;;   substitution: (Member $x0 large) ~NEG -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrLarge $x0))
(Implication (Member $x0 large) ~NEG (MnBigOrLarge $x0))

;; [unit, shape-parallel]  p200703 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 big)   e.g. 
;;   B: (Member $x0 small)
;;   substitution: (Member $x0 small) -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrSmall $x0))
(Implication (Member $x0 small) (MnBigOrSmall $x0))

;; [unit, shape-parallel]  p200703 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 big)   e.g. 
;;   B: (Member $x0 tiny)
;;   substitution: (Member $x0 tiny) -> (Member $x0 big)
(Implication (Member $x0 big) (MnBigOrTiny $x0))
(Implication (Member $x0 tiny) (MnBigOrTiny $x0))

;; [unit, shape-parallel]  p201775 ~ p205768   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 chart)   e.g. 
;;   B: (Member $x0 doctor)
;;   substitution: (Member $x0 doctor) -> (Member $x0 chart)
(Implication (Member $x0 chart) (MnChartOrDoctor $x0))
(Implication (Member $x0 doctor) (MnChartOrDoctor $x0))

;; [unit, shape-parallel]  p201776 ~ p205764   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 clerk)   e.g. 
;;   B: (Member $x0 answer)
;;   substitution: (Member $x0 answer) -> (Member $x0 clerk)
(Implication (Member $x0 clerk) (MnClerkOrAnswer $x0))
(Implication (Member $x0 answer) (MnClerkOrAnswer $x0))

;; [unit, shape-parallel]  p200353 ~ p200704   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 depot)   e.g. 
;;   B: (Member $x0 crew)
;;   substitution: (Member $x0 crew) -> (Member $x0 depot)
(Implication (Member $x0 depot) (MnDepotOrCrew $x0))
(Implication (Member $x0 crew) (MnDepotOrCrew $x0))

;; [unit, shape-parallel]  p205767 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 difficult)   e.g. 
;;   B: (Member $x0 difficult) ~NEG
;;   substitution: (Member $x0 difficult) ~NEG -> (Member $x0 difficult)
(Implication (Member $x0 difficult) (MnDifficultOrDifficult $x0))
(Implication (Member $x0 difficult) ~NEG (MnDifficultOrDifficult $x0))

;; [unit, shape-parallel]  p205767 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 difficult)   e.g. 
;;   B: (Member $x0 easy)
;;   substitution: (Member $x0 easy) -> (Member $x0 difficult)
(Implication (Member $x0 difficult) (MnDifficultOrEasy $x0))
(Implication (Member $x0 easy) (MnDifficultOrEasy $x0))

;; [unit, shape-parallel]  p201785 ~ p201772   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 fire)   e.g. 
;;   B: (Member $x0 archive)
;;   substitution: (Member $x0 archive) -> (Member $x0 fire)
(Implication (Member $x0 fire) (MnFireOrArchive $x0))
(Implication (Member $x0 archive) (MnFireOrArchive $x0))

;; [unit, shape-parallel]  p203914 ~ p203909   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 foreman)   e.g. 
;;   B: (Member $x0 driver)
;;   substitution: (Member $x0 driver) -> (Member $x0 foreman)
(Implication (Member $x0 foreman) (MnForemanOrDriver $x0))
(Implication (Member $x0 driver) (MnForemanOrDriver $x0))

;; [unit, shape-parallel]  p205771 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 hard)   e.g. 
;;   B: (Member $x0 difficult) ~NEG
;;   substitution: (Member $x0 difficult) ~NEG -> (Member $x0 hard)
(Implication (Member $x0 hard) (MnHardOrDifficult $x0))
(Implication (Member $x0 difficult) ~NEG (MnHardOrDifficult $x0))

;; [unit, shape-parallel]  p205771 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 hard)   e.g. 
;;   B: (Member $x0 easy)
;;   substitution: (Member $x0 easy) -> (Member $x0 hard)
(Implication (Member $x0 hard) (MnHardOrEasy $x0))
(Implication (Member $x0 easy) (MnHardOrEasy $x0))

;; [unit, shape-parallel]  p205773 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 huge)   e.g. 
;;   B: (Member $x0 huge) ~NEG
;;   substitution: (Member $x0 huge) ~NEG -> (Member $x0 huge)
(Implication (Member $x0 huge) (MnHugeOrHuge $x0))
(Implication (Member $x0 huge) ~NEG (MnHugeOrHuge $x0))

;; [unit, shape-parallel]  p205773 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 huge)   e.g. 
;;   B: (Member $x0 tiny)
;;   substitution: (Member $x0 tiny) -> (Member $x0 huge)
(Implication (Member $x0 huge) (MnHugeOrTiny $x0))
(Implication (Member $x0 tiny) (MnHugeOrTiny $x0))

;; [unit, shape-parallel]  p201147 ~ p201145   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 judge)   e.g. 
;;   B: (Member $x0 case)
;;   substitution: (Member $x0 case) -> (Member $x0 judge)
(Implication (Member $x0 judge) (MnJudgeOrCase $x0))
(Implication (Member $x0 case) (MnJudgeOrCase $x0))

;; [unit, shape-parallel]  p201795 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 large)   e.g. 
;;   B: (Member $x0 large) ~NEG
;;   substitution: (Member $x0 large) ~NEG -> (Member $x0 large)
(Implication (Member $x0 large) (MnLargeOrLarge $x0))
(Implication (Member $x0 large) ~NEG (MnLargeOrLarge $x0))

;; [unit, shape-parallel]  p201795 ~ raw   support 0 (control 2)   gate: FAIL
;;   A: (Member $x0 large)   e.g. 
;;   B: (Member $x0 small)
;;   substitution: (Member $x0 small) -> (Member $x0 large)
(Implication (Member $x0 large) (MnLargeOrSmall $x0))
(Implication (Member $x0 small) (MnLargeOrSmall $x0))

;; [unit, shape-parallel]  p201798 ~ p201773   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 loan_application)   e.g. 
;;   B: (Member $x0 bank)
;;   substitution: (Member $x0 bank) -> (Member $x0 loan_application)
(Implication (Member $x0 loan_application) (MnLoanApplicationOrBank $x0))
(Implication (Member $x0 bank) (MnLoanApplicationOrBank $x0))

;; [unit, shape-parallel]  p201801 ~ p201782   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 manuscript)   e.g. 
;;   B: (Member $x0 editor)
;;   substitution: (Member $x0 editor) -> (Member $x0 manuscript)
(Implication (Member $x0 manuscript) (MnManuscriptOrEditor $x0))
(Implication (Member $x0 editor) (MnManuscriptOrEditor $x0))

;; [unit, shape-parallel]  p200354 ~ p201775   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 physician)   e.g. 
;;   B: (Member $x0 chart)
;;   substitution: (Member $x0 chart) -> (Member $x0 physician)
(Implication (Member $x0 physician) (MnPhysicianOrChart $x0))
(Implication (Member $x0 chart) (MnPhysicianOrChart $x0))

;; [unit, shape-parallel]  p201810 ~ p201771   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 potter)   e.g. 
;;   B: (Member $x0 apprentice)
;;   substitution: (Member $x0 apprentice) -> (Member $x0 potter)
(Implication (Member $x0 potter) (MnPotterOrApprentice $x0))
(Implication (Member $x0 apprentice) (MnPotterOrApprentice $x0))

;; [unit, shape-parallel]  p201813 ~ p201776   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 query)   e.g. 
;;   B: (Member $x0 clerk)
;;   substitution: (Member $x0 clerk) -> (Member $x0 query)
(Implication (Member $x0 query) (MnQueryOrClerk $x0))
(Implication (Member $x0 clerk) (MnQueryOrClerk $x0))

;; [unit, shape-parallel]  p201820 ~ p203900   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 squad)   e.g. 
;;   B: (Member $x0 coach)
;;   substitution: (Member $x0 coach) -> (Member $x0 squad)
(Implication (Member $x0 squad) (MnSquadOrCoach $x0))
(Implication (Member $x0 coach) (MnSquadOrCoach $x0))

;; [unit, shape-parallel]  p201821 ~ p201792   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 storm)   e.g. 
;;   B: (Member $x0 greenhouse)
;;   substitution: (Member $x0 greenhouse) -> (Member $x0 storm)
(Implication (Member $x0 storm) (MnStormOrGreenhouse $x0))
(Implication (Member $x0 greenhouse) (MnStormOrGreenhouse $x0))

;; [unit, shape-parallel]  p201827 ~ p205764   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 vet)   e.g. 
;;   B: (Member $x0 answer)
;;   substitution: (Member $x0 answer) -> (Member $x0 vet)
(Implication (Member $x0 vet) (MnVetOrAnswer $x0))
(Implication (Member $x0 answer) (MnVetOrAnswer $x0))

;; [unit, shape-parallel]  p201827 ~ p201774   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 vet)   e.g. 
;;   B: (Member $x0 caller)
;;   substitution: (Member $x0 caller) -> (Member $x0 vet)
(Implication (Member $x0 vet) (MnVetOrCaller $x0))
(Implication (Member $x0 caller) (MnVetOrCaller $x0))

;; [unit, shape-parallel]  p203941 ~ p203928   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 ward)   e.g. 
;;   B: (Member $x0 nurse)
;;   substitution: (Member $x0 nurse) -> (Member $x0 ward)
(Implication (Member $x0 ward) (MnWardOrNurse $x0))
(Implication (Member $x0 nurse) (MnWardOrNurse $x0))

;; [unit, shape-parallel]  p201830 ~ p201780   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 wreck)   e.g. 
;;   B: (Member $x0 diver)
;;   substitution: (Member $x0 diver) -> (Member $x0 wreck)
(Implication (Member $x0 wreck) (MnWreckOrDiver $x0))
(Implication (Member $x0 diver) (MnWreckOrDiver $x0))

;; [unit, shape-parallel]  p201150 ~ p201146   support 0 (control 1)   gate: FAIL
;;   A: (Member $x0 yard_floodlight)   e.g. 
;;   B: (Member $x0 electrician)
;;   substitution: (Member $x0 electrician) -> (Member $x0 yard_floodlight)
(Implication (Member $x0 yard_floodlight) (MnYardFloodlightOrElectrician $x0))
(Implication (Member $x0 electrician) (MnYardFloodlightOrElectrician $x0))

;; [unit, shape-parallel]  p200103 ~ p200350   support 0 (control 4)   gate: FAIL
;;   A: (Might $e0)   e.g. 
;;   B: (Future $e0)
;;   substitution: (Future $e0) -> (Might $e0)
(Implication (Might $e0) (MnMightOrFuture $e0))
(Implication (Future $e0) (MnMightOrFuture $e0))

;; [unit, shape-parallel]  p200071 ~ p200355   support 0 (control 5)   gate: FAIL
;;   A: (Recipient $e0 $x0)   e.g. 
;;   B: (Source $e0 $x0)
;;   substitution: (Source $e0 $x0) -> (Recipient $e0 $x0)
(Implication (Recipient $e0 $x0) (MnRecipientOrSource $e0 $x0))
(Implication (Source $e0 $x0) (MnRecipientOrSource $e0 $x0))

;; ==================== ROLE MAPPINGS: 4 pass of 17 non-identity; 13 lost-role records ====================

;; [role]  Agent ~ Recipient   support 13 (control 0)   occurrences 510 / 47   gate: PASS   e.g. tierA-000001 tierA-000004
(Implication (Recipient $e $x) (Agent $e $x))

;; [role]  Agent ~ Source   support 10 (control 0)   occurrences 510 / 24   gate: PASS   e.g. tierC-000257 tierC-000258
(Implication (Source $e $x) (Agent $e $x))

;; [role]  Theme ~ Patient   support 6 (control 3)   occurrences 391 / 169   gate: PASS   e.g. tierC-000099 tierC-000100
(Implication (Patient $e $x) (Theme $e $x))

;; [role]  Agent ~ Theme   support 3 (control 5)   occurrences 510 / 391   gate: PASS   e.g. tierC-000017 tierC-000018
(Implication (Theme $e $x) (Agent $e $x))

;; [role]  Holder ~ CoAgent   support 2 (control 0)   occurrences 21 / 19   gate: FAIL   e.g. tierC-000181 tierC-000182
(Implication (CoAgent $e $x) (Holder $e $x))

;; [role]  Theme ~ Recipient   support 2 (control 3)   occurrences 391 / 47   gate: FAIL   e.g. tierA-000207 tierA-000208
(Implication (Recipient $e $x) (Theme $e $x))

;; [role]  Agent ~ Experiencer   support 1 (control 1)   occurrences 510 / 69   gate: FAIL   e.g. tierC-000079 tierC-000080
(Implication (Experiencer $e $x) (Agent $e $x))

;; [role]  Agent ~ Holder   support 1 (control 0)   occurrences 510 / 21   gate: FAIL   e.g. tierA-000084 tierA-000085
(Implication (Holder $e $x) (Agent $e $x))

;; [role]  Agent ~ Patient   support 1 (control 5)   occurrences 510 / 169   gate: FAIL   e.g. tierC-000163 tierC-000164
(Implication (Patient $e $x) (Agent $e $x))

;; [role]  Patient ~ Experiencer   support 1 (control 0)   occurrences 169 / 69   gate: FAIL   e.g. tierC-000009 tierC-000010
(Implication (Experiencer $e $x) (Patient $e $x))

;; [role]  Theme ~ Experiencer   support 1 (control 0)   occurrences 391 / 69   gate: FAIL   e.g. tierC-000069 tierC-000070
(Implication (Experiencer $e $x) (Theme $e $x))

;; [role]  Theme ~ Goal   support 1 (control 0)   occurrences 391 / 30   gate: FAIL   e.g. tierC-000205 tierC-000206
(Implication (Goal $e $x) (Theme $e $x))

;; [role]  Theme ~ Location   support 1 (control 2)   occurrences 391 / 175   gate: FAIL   e.g. tierC-000063 tierC-000064
(Implication (Location $e $x) (Theme $e $x))

;; [role]  Agent ~ Goal   support 0 (control 1)   occurrences 510 / 30   gate: FAIL   e.g. 
(Implication (Goal $e $x) (Agent $e $x))

;; [role]  Agent ~ Location   support 0 (control 1)   occurrences 510 / 175   gate: FAIL   e.g. 
(Implication (Location $e $x) (Agent $e $x))

;; [role]  Experiencer ~ Holder   support 0 (control 1)   occurrences 69 / 21   gate: FAIL   e.g. 
(Implication (Holder $e $x) (Experiencer $e $x))

;; [role]  Recipient ~ Source   support 0 (control 5)   occurrences 47 / 24   gate: FAIL   e.g. 
(Implication (Source $e $x) (Recipient $e $x))

;; [role-lost]  Agent ~ none   support 12 (control 2)   gate: PASS   e.g. tierC-000055 tierC-000056
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Theme ~ none   support 12 (control 2)   gate: PASS   e.g. tierC-000043 tierC-000044
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Location ~ none   support 5 (control 2)   gate: PASS   e.g. tierC-000007 tierC-000008
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  CoAgent ~ none   support 4 (control 0)   gate: PASS   e.g. tierA-000311 tierA-000312
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Beneficiary ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Goal ~ none   support 2 (control 1)   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Source ~ none   support 2 (control 0)   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  As ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Experiencer ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000061 tierC-000062
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  In ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000107 tierC-000108
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Patient ~ none   support 1 (control 2)   gate: FAIL   e.g. tierC-000197 tierC-000198
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Recipient ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; [role-lost]  Time ~ none   support 1 (control 0)   gate: FAIL   e.g. tierC-000029 tierC-000030
;;   rule: none — the other side has no atom on the aligned centre and filler (a dropped role, see the residue)

;; ==================== RESIDUE: 12 pass of 511 records ====================

;; [residue]  (Agent $e0 $x0)   support 6 (control 9)   occurrences 41   head on other side 10   gate: PASS   e.g. tierC-000277 tierC-000278
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $x0) in (And (Agent $e0 $x0) (Theme $e0 $x1))   support 6 (control 2)   occurrences 25   head on other side 25   gate: PASS   e.g. tierC-000087 tierC-000088
(Implication (And (Agent $e0 $x0) (Theme $e0 $x1)) (And (Agent $e0 $x0) (Theme $e0 $x1)))

;; [residue]  (Member $e0 work)   support 5 (control 0)   occurrences 19   head on other side 19   gate: PASS   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 decision)   support 4 (control 0)   occurrences 26   head on other side 26   gate: PASS   e.g. tierA-000185 tierA-000186
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 $e1) in (And (Agent $e0 $x0) (Patient $e0 $e1))   support 4 (control 1)   occurrences 11   head on other side 0   gate: PASS   e.g. tierA-000185 tierA-000186
(Implication (And (Agent $e0 $x0) (Patient $e0 $e1)) (Agent $e0 $x0))

;; [residue]  (Theme $e0 $e1) in (And (Agent $e0 $x0) (Theme $e0 $e1))   support 4 (control 3)   occurrences 13   head on other side 12   gate: PASS   e.g. tierA-000185 tierA-000187
(Implication (And (Agent $e0 $x0) (Theme $e0 $e1)) (Agent $e0 $x0))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $e0 destroy))   support 3 (control 0)   occurrences 6   head on other side 6   gate: PASS   e.g. tierA-000222 tierA-000223
(Implication (And (Agent $e0 $x0) (Member $e0 destroy)) (Member $e0 destroy))

;; [residue]  (Degree $x0 big very)   support 3 (control 0)   occurrences 9   head on other side 0   gate: PASS   e.g. tierA-000339 tierA-000340
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 cause)   support 3 (control 0)   occurrences 10   head on other side 10   gate: PASS   e.g. tierA-000222 tierA-000223
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 take)   support 3 (control 0)   occurrences 7   head on other side 7   gate: PASS   e.g. tierA-000173 tierA-000174
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past $e0)   support 3 (control 3)   occurrences 18   head on other side 2   gate: PASS   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1) in (And (Member $e0 destroy) (Theme $e1 $e0))   support 3 (control 0)   occurrences 8   head on other side 0   gate: PASS   e.g. tierA-000222 tierA-000223
(Implication (And (Member $e0 destroy) (Theme $e1 $e0)) (And (Member $e0 destroy) (Theme $e1 $e0)))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Location $e0 $x1))   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierA-000173 tierA-000174
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (Location $e0 $x1))

;; [residue]  (CoAgent $e0 $x0) in (And (Agent $e0 $x0) (CoAgent $e0 $x1))   support 2 (control 0)   occurrences 5   head on other side 0   gate: FAIL   e.g. tierA-000315 tierA-000316
(Implication (And (Agent $e0 $x0) (CoAgent $e0 $x1)) (And (Agent $e0 $x0) (CoAgent $e0 $x1)))

;; [residue]  (ConditionalProperty bicycle allowed footpath)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ConditionalProperty bicycle permitted footpath)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ConditionalProperty pedestrian allowed footpath)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ConditionalProperty pedestrian permitted footpath)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree $x0 tired very)   support 2 (control 0)   occurrences 6   head on other side 0   gate: FAIL   e.g. tierA-000363 tierA-000364
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance bicycle allowed) ~NEG   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance bicycle permitted) ~NEG   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance paper_factory factory)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance paper_mill mill)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000045 tierC-000046
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedestrian allowed) ~NEG   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedestrian permitted) ~NEG   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000325 tierC-000326
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $e0 find))   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000279 tierC-000280
(Implication (And (Location $e0 $x0) (Member $e0 find)) (Member $e0 find))

;; [residue]  (Member $e0 become)   support 2 (control 0)   occurrences 2   head on other side 1   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 answer)   support 2 (control 1)   occurrences 8   head on other side 8   gate: FAIL   e.g. tierA-000207 tierA-000208
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 wilson)   support 2 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000277 tierC-000278
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past $e0) in (And (Past $e0) (Theme $e0 $x0))   support 2 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000181 tierC-000182
(Implication (And (Past $e0) (Theme $e0 $x0)) (Theme $e0 $x0))

;; [residue]  (Patient $e0 $e1)   support 2 (control 3)   occurrences 6   head on other side 0   gate: FAIL   e.g. tierC-000157 tierC-000158
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 $x0)   support 2 (control 4)   occurrences 19   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Result $e0 $e1)   support 2 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1) in (And (Location $e0 $x0) (Theme $e1 $e0))   support 2 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000173 tierA-000174
(Implication (And (Location $e0 $x0) (Theme $e1 $e0)) (And (Location $e0 $x0) (Theme $e1 $e0)))

;; [residue]  (Theme $e0 $x0)   support 2 (control 9)   occurrences 35   head on other side 2   gate: FAIL   e.g. tierC-000301 tierC-000302
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Cardinality $x0 <num>))   support 1 (control 0)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierA-000181 tierA-000182
(Implication (And (Agent $e0 $x0) (Cardinality $x0 <num>)) (Cardinality $x0 <num>))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 fire))   support 1 (control 0)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierA-000227 tierA-000228
(Implication (And (Agent $e0 $x0) (Member $x0 fire)) (Member $x0 fire))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 flood))   support 1 (control 0)   occurrences 5   head on other side 2   gate: FAIL   e.g. tierA-000232 tierA-000233
(Implication (And (Agent $e0 $x0) (Member $x0 flood)) (Member $x0 flood))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 shepherd))   support 1 (control 0)   occurrences 3   head on other side 1   gate: FAIL   e.g. tierA-000173 tierA-000174
(Implication (And (Agent $e0 $x0) (Member $x0 shepherd)) (Member $x0 shepherd))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 storm))   support 1 (control 0)   occurrences 6   head on other side 3   gate: FAIL   e.g. tierA-000222 tierA-000223
(Implication (And (Agent $e0 $x0) (Member $x0 storm)) (Member $x0 storm))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000277 tierC-000278
(Implication (And (Agent $e0 $x0) (Past $e0)) (Past $e0))

;; [residue]  (Agent $e0 bo)   support 1 (control 0)   occurrences 3   head on other side 2   gate: FAIL   e.g. tierA-000311 tierA-000312
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 boston_red_sox)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000229 tierC-000230
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 cincinnati_reds)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000229 tierC-000230
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 gilles_thibaut)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000131 tierC-000132
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 j_augustus_knapp)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000231 tierC-000232
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 jones)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 nils)   support 1 (control 0)   occurrences 3   head on other side 2   gate: FAIL   e.g. tierA-000323 tierA-000324
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 wilson)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000277 tierC-000278
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Also paint $e0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000293 tierC-000294
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Can $x0) (GroupOf $x1 recombinant_colony) (Member $x0 contain) (Theme $x0 $x2)) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000073 tierC-000074
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (GroupOf $x1 recombinant_colony) (Member $x0 contain) (Might $x0) (Theme $x0 $x2)) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000073 tierC-000074
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Before $e0 $e1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Beneficiary $e0 $x0) in (And (Beneficiary $e0 $x0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000179 tierC-000180
(Implication (And (Beneficiary $e0 $x0) (Past $e0)) (Past $e0))

;; [residue]  (Beneficiary $e0 morel)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000303 tierC-000304
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Beneficiary $e0 shop)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Beneficiary russian_market_1 shop)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Between veymandoo_kandu laamu_atoll thaa_atoll)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000309 tierC-000310
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Between veymandoo_kandu thaa_atoll laamu_atoll)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000309 tierC-000310
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Cause phonological_factor regressive_assimilation)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (CoAgent $e0 bo)   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000311 tierA-000312
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (CoAgent $e0 nils)   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000323 tierA-000324
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Condition phonological_factor regressive_assimilation)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree botulinum_toxin_injection painful chronic)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree botulinum_toxin_injection painful chronically)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000187 tierC-000188
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree diver tired very)   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000371 tierA-000372
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree indentured_people numerically_important mostly)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Degree person numerically_important mostly)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Experiencer $e0 $e1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000157 tierC-000158
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Experiencer $e0 $x0)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Experiencer $e0 $x0) in (And (Experiencer $e0 $x0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000061 tierC-000062
(Implication (And (Experiencer $e0 $x0) (Past $e0)) (Past $e0))

;; [residue]  (Goal $e0 loren)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $e0 tributary)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 activity)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 traditional_chinese_drama)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 whig)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000087 tierC-000088
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance $x0 legal)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance announcer (can announce))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance chess_play play)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000107 tierC-000108
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

;; [residue]  (Inheritance direct_synthesis vigorous)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000067 tierC-000068
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance direct_synthesis violent)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000067 tierC-000068
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance diver exhausted)   support 1 (control 0)   occurrences 3   head on other side 1   gate: FAIL   e.g. tierA-000371 tierA-000372
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance diver tired)   support 1 (control 0)   occurrences 3   head on other side 1   gate: FAIL   e.g. tierA-000371 tierA-000372
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

;; [residue]  (Inheritance indentured_people indentured)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indentured_people person)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indigenous_american american)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance indigenous_american indigenous)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000025 tierC-000026
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance issaquah_creek_park park)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000063 tierC-000064
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_phrase logical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_phrase phrase)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_proposition logical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance logical_proposition proposition)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000021 tierC-000022
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance music_film film)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000049 tierC-000050
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance musical_film film)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000049 tierC-000050
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance musical_film musical)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000049 tierC-000050
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance naming_convention convention)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000173 tierC-000174
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

;; [residue]  (Inheritance occupational_group group)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance occupational_group occupational)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedo_transfer_function function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance pedotransfer_function function)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000205 tierC-000206
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance professional_group group)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance professional_group professional)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000329 tierC-000330
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance right_tributary right)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance right_tributary tributary)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sporting_activity activity)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Inheritance sporting_activity sporting)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000147 tierC-000148
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $e1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0)   support 1 (control 1)   occurrences 3   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0) in (And (Experiencer $e0 $x0) (Location $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
(Implication (And (Experiencer $e0 $x0) (Location $e0 $x1)) (And (Experiencer $e0 $x0) (Location $e0 $x1)))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $x0 frame))   support 1 (control 0)   occurrences 5   head on other side 2   gate: FAIL   e.g. tierA-000315 tierA-000316
(Implication (And (Location $e0 $x0) (Member $x0 frame)) (Member $x0 frame))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $x0 ledger))   support 1 (control 0)   occurrences 5   head on other side 2   gate: FAIL   e.g. tierA-000323 tierA-000324
(Implication (And (Location $e0 $x0) (Member $x0 ledger)) (Member $x0 ledger))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $x0 survey))   support 1 (control 0)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierA-000319 tierA-000320
(Implication (And (Location $e0 $x0) (Member $x0 survey)) (Member $x0 survey))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Theme $e0 $x1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
(Implication (And (Location $e0 $x0) (Theme $e0 $x1)) (Theme $e0 $x1))

;; [residue]  (Location $e0 china)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 derwent_isle)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 dianchi_lake)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 executive_level)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 lake_dianchi)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 traditional_chinese_drama)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000013 tierC-000014
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 western_europe)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location frasin_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location olt romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location olt_river romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location river_frasin romania)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location russian_market_1 $x0)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location tuen_mun castle_peak_bay)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location tuen_mun peak_bay_castle)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000169 tierC-000170
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 bear)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000357 tierC-000358
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 cease)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 chapel) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 french)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 house)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 indigenous)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 large)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 lax)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000157 tierC-000158
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 listed_building)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 market)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 permit)   support 1 (control 2)   occurrences 3   head on other side 2   gate: FAIL   e.g. tierA-000072 tierA-000073
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 repair)   support 1 (control 1)   occurrences 9   head on other side 3   gate: FAIL   e.g. tierA-000046 tierA-000049
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 russian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 series)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000229 tierC-000230
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 caller)   support 1 (control 0)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierA-000217 tierA-000218
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 chapel) ~NEG   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 cracked)   support 1 (control 0)   occurrences 9   head on other side 0   gate: FAIL   e.g. tierA-000046 tierA-000049
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 crew)   support 1 (control 0)   occurrences 9   head on other side 0   gate: FAIL   e.g. tierA-000046 tierA-000049
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 destined)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000009 tierC-000010
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 executive_level)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000007 tierC-000008
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 feed_pipe) in (And (Inheritance feed_pipe pipe) (Member $x0 feed_pipe))   support 1 (control 0)   occurrences 9   head on other side 0   gate: FAIL   e.g. tierA-000046 tierA-000049
(Implication (And (Inheritance feed_pipe pipe) (Member $x0 feed_pipe)) (Inheritance feed_pipe pipe))

;; [residue]  (Member $x0 house)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 large)   support 1 (control 2)   occurrences 3   head on other side 3   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 listed_building)   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 mainstream_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 people)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 person)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000065 tierC-000066
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 provincial_capital)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 series)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000229 tierC-000230
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 social_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 warden)   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000072 tierA-000073
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 western)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member armaan_jain actor)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000139 tierC-000140
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chongqing location)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chongqing site)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000167 tierC-000168
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member chuck_robb democrat)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member corentin_rahier partner)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member corentin_rahier potential)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member cranoe civil_community)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member cranoe civil_parish)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000059 tierC-000060
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member east_coast_railway department)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000105 tierC-000106
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member east_coast_railway division)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000105 tierC-000106
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member frasin_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member george_allen republican)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member huancavelica peruvian)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member huancavelica province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member issaquah_creek creek)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000063 tierC-000064
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member james_david_edgar speaker)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member james_david_edgar spokesman)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member lemnia_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member madicea river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member madicea_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member manila provincial_capital)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member muriel_zazoui partner)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member muriel_zazoui potential)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000017 tierC-000018
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member oates person)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000023 tierC-000024
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

;; [residue]  (Member peru province)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_frasin tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_oraciu river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_rotunda river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member river_rotunda tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member robb democrat)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000161 tierC-000162
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member rotunda_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member rotunda_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member russian_market_1 market)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000321 tierC-000322
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member thomas_bain speaker)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member thomas_bain spokesman)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000077 tierC-000078
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor_river river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member valea_voenilor_river tributary)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Ongoing $e0)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000079 tierC-000080
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Ongoing $e0) in (And (Location $e0 $x0) (Ongoing $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000279 tierC-000280
(Implication (And (Location $e0 $x0) (Ongoing $e0)) (Location $e0 $x0))

;; [residue]  (Only $e0 $e1)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Only phonological_factor (Cause phonological_factor regressive_assimilation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Only phonological_factor (Condition phonological_factor regressive_assimilation))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000179 tierC-000180
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf $x0 europe)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000279 tierC-000280
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf frasin_river straja_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf lake_dianchi china)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf lemnia lutoasa_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf lemnia_river lutoasa_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000305 tierC-000306
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf new_york_stock_exchange nyse_group)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf nyse_group new_york_stock_exchange)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000053 tierC-000054
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf peru huancavelica)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000191 tierC-000192
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf river_frasin straja_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000027 tierC-000028
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf river_rotunda purul_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf rotunda_river purul_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000015 tierC-000016
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf valea_voenilor pascu)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (PartOf valea_voenilor_river pascu_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000273 tierC-000274
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past $e0) in (And (Agent $e0 $x0) (Past $e0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000071 tierC-000072
(Implication (And (Agent $e0 $x0) (Past $e0)) (Agent $e0 $x0))

;; [residue]  (Past $e0) in (And (Past $e0) (Patient $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000315 tierC-000316
(Implication (And (Past $e0) (Patient $e0 $x0)) (Patient $e0 $x0))

;; [residue]  (Past (ConditionalProperty indentured_people numerically_important $e0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (ConditionalProperty person numerically_important $e0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000223 tierC-000224
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member $e0 chapel))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member $e0 lax))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000157 tierC-000158
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member $x0 chapel))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member $x0 french))   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000001 tierC-000002
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member asserson active))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000079 tierC-000080
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member david_david announcer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member david_ross announcer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000341 tierC-000342
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member michele_emmer father))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member michele_michele_emmer father))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Member rudolf_mikael_friberg librarian))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000129 tierC-000130
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession michele_emmer luciano_emmer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Past (Possession michele_michele_emmer luciano_emmer))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000251 tierC-000252
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 leonor_rodrigues)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000357 tierC-000358
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $e0 yunnan)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000065 tierC-000066
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 derwent_isle)   support 1 (control 0)   occurrences 2   head on other side 0   gate: FAIL   e.g. tierC-000115 tierC-000116
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 j_augustus_knapp)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000231 tierC-000232
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 manila)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 technetium)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000163 tierC-000164
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession $x0 yunnan)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000313 tierC-000314
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession olt madicea)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Possession olt_river madicea_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000051 tierC-000052
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (ProportionOf $x0 $x1 most)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Recipient $e0 $x0) in (And (Agent $e0 $x0) (Recipient $e0 $x1))   support 1 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. tierA-000217 tierA-000218
(Implication (And (Agent $e0 $x0) (Recipient $e0 $x1)) (And (Agent $e0 $x0) (Recipient $e0 $x1)))

;; [residue]  (Recipient $e0 loren)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000209 tierC-000210
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Relate $x0 prostitution)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 $x0)   support 1 (control 7)   occurrences 8   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 $x0) in (And (Agent $e0 $x0) (Source $e0 $x1))   support 1 (control 0)   occurrences 2   head on other side 2   gate: FAIL   e.g. tierC-000177 tierC-000178
(Implication (And (Agent $e0 $x0) (Source $e0 $x1)) (And (Agent $e0 $x0) (Source $e0 $x1)))

;; [residue]  (Source $e0 mainstream_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 manila)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000347 tierC-000348
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Source $e0 social_media)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000177 tierC-000178
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (SubsetOf $x0 $x1)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000039 tierC-000040
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1) in (And (Past $e0) (Theme $e0 $e1))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000229 tierC-000230
(Implication (And (Past $e0) (Theme $e0 $e1)) (Past $e0))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 budget) (Theme $e0 $x0))   support 1 (control 0)   occurrences 10   head on other side 6   gate: FAIL   e.g. tierA-000201 tierA-000202
(Implication (And (Member $x0 budget) (Theme $e0 $x0)) (Member $x0 budget))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 case) (Theme $e0 $x0))   support 1 (control 0)   occurrences 8   head on other side 8   gate: FAIL   e.g. tierA-000190 tierA-000191
(Implication (And (Member $x0 case) (Theme $e0 $x0)) (Member $x0 case))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 new) (Theme $e0 $x0))   support 1 (control 0)   occurrences 4   head on other side 4   gate: FAIL   e.g. tierA-000185 tierA-000186
(Implication (And (Member $x0 new) (Theme $e0 $x0)) (Member $x0 new))

;; [residue]  (Theme $e0 $x0) in (And (Past $e0) (Theme $e0 $x0))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000229 tierC-000230
(Implication (And (Past $e0) (Theme $e0 $x0)) (Past $e0))

;; [residue]  (Theme $e0 (And (Agent $x0 $x1) (Goal $x0 north) (Member $x0 move)))   support 1 (control 0)   occurrences 7   head on other side 4   gate: FAIL   e.g. tierA-000196 tierA-000197
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 industrialization)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000087 tierC-000088
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 issaquah_creek)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000063 tierC-000064
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 music)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000127 tierC-000128
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 silent_film)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000127 tierC-000128
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 visitor)   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000072 tierA-000073
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 wilson)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000301 tierC-000302
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 (Weekday sunday))   support 1 (control 0)   occurrences 3   head on other side 0   gate: FAIL   e.g. tierA-000072 tierA-000073
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 next)   support 1 (control 0)   occurrences 1   head on other side 0   gate: FAIL   e.g. tierC-000029 tierC-000030
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (TributaryOf pustnic_river oraciu_river)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (TributaryOf pustnic_river river_oraciu)   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000057 tierC-000058
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (While (Cause phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (While (Condition phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))   support 1 (control 0)   occurrences 1   head on other side 1   gate: FAIL   e.g. tierC-000331 tierC-000332
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (GroupOf $x0 child))   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (GroupOf $x0 child)) (GroupOf $x0 child))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (GroupOf $x0 soil_sample))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (GroupOf $x0 soil_sample)) (GroupOf $x0 soil_sample))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $e0 decide))   support 0 (control 2)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $e0 decide)) (Member $e0 decide))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 airline))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 airline)) (Member $x0 airline))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 automobile))   support 0 (control 2)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 automobile)) (Member $x0 automobile))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 bank))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 bank)) (Member $x0 bank))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 board))   support 0 (control 2)   occurrences 7   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 board)) (Member $x0 board))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 chef))   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 chef)) (Member $x0 chef))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 committee))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 committee)) (Member $x0 committee))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 council))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 council)) (Member $x0 council))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 crew))   support 0 (control 2)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 crew)) (Member $x0 crew))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 curator))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 curator)) (Member $x0 curator))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 depot))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 depot)) (Member $x0 depot))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 doctor))   support 0 (control 2)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 doctor)) (Member $x0 doctor))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 family))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 family)) (Member $x0 family))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 ferry))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 ferry)) (Member $x0 ferry))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 firm))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 firm)) (Member $x0 firm))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 freight))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 freight)) (Member $x0 freight))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 intern))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 intern)) (Member $x0 intern))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 licence))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 licence)) (Member $x0 licence))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 mechanic))   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 mechanic)) (Member $x0 mechanic))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 museum))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 museum)) (Member $x0 museum))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 panel))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 panel)) (Member $x0 panel))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 physician))   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 physician)) (Member $x0 physician))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 pilot))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 pilot)) (Member $x0 pilot))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 rescue_team))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 rescue_team)) (Member $x0 rescue_team))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 school))   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 school)) (Member $x0 school))

;; [residue]  (Agent $e0 $x0) in (And (Agent $e0 $x0) (Member $x0 vet))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Member $x0 vet)) (Member $x0 vet))

;; [residue]  (Agent $e0 ana)   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 dara)   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Agent $e0 north)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Beneficiary $x0 $x2) (Member $x0 buy) (Member $x3 projector) (Past $x0) (Theme $x0 $x3)) ~NEG   support 0 (control 1)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (CardinalityPhrase $x2 <str>) (GroupOf $x2 lemon) (Member $x0 buy) (Member $x2 crate) (Past $x0) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (CoAgent $x0 $x2) (Location $x0 $x3) (Member $x0 work) (Member $x1 welder) (Member $x2 fitter)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Future $x0) (Member $x0 arrive) (Time $x0 (Hour <num>))) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Location $x0 $x2) (Member $x0 allow) (Theme $x0 photography)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Location $x0 $x2) (Member $x0 walk)) ~NEG   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 abandon) (Theme $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 allow) (Theme $x0 night_delivery)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 answer) (Theme $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 block) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 cancel) (Patient $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 cross) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 decide) (Member $x2 new) (Member $x2 roof) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 decide) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 decide) (Theme $x0 (And (Agent $x2 $x1) (Goal $x2 north) (Member $x2 move)))) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 destroy) (Patient $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 discover) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 examine) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 give) (Member $x1 foreman) (Member $x2 driver) (Recipient $x0 $x2) (Theme $x0 $x3)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 give) (Member $x1 school) (Member $x2 medal) (Recipient $x0 $x3) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 give) (Member $x1 trainer) (Member $x2 whistle) (Member $x3 recruit) (Recipient $x0 $x3) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 lend) (Recipient $x0 $x2) (Theme $x0 $x3)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 postpone) (Theme $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 reject) (Theme $x0 $x2)) ~NEG   support 0 (control 2)   occurrences 6   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 repair) (Member $x2 gearbox) (Member $x2 seized) (Past $x0) (Patient $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 repair) (Patient $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 sign) (Patient $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 teach) (Member $x1 coach) (Member $x2 drill) (Recipient $x0 $x3) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 $x1) (Member $x0 teach) (Member $x1 elder) (Member $x2 song) (Recipient $x0 $x3) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 ana) (CoAgent $x0 bo) (Location $x0 $x1) (Member $x0 work)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Agent $x0 dara) (CoAgent $x0 nils) (Location $x0 $x1) (Member $x0 work)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Before $x0 $x1) (Future $x1) (Member $x1 begin) (Patient $x1 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Experiencer $x0 $x1) (Member $x0 discover) (Stimulus $x0 $e0)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Experiencer $x0 $x1) (Member $x0 require) (Theme $x0 monthly_servicing)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Holder $x0 $x1) (Member $x0 require) (Theme $x0 $x2)) ~NEG   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Measure $x0 age <num> year) (Member $x1 die) (Patient $x1 $x0)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (And (Member $x0 die) (Patient $x0 $x1) (Time $x0 that_autumn)) ~NEG   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Before $x0 $e0) in (And (Before $x0 $e0) (Member $x0 lunch))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Before $x0 $e0) (Member $x0 lunch)) (Member $x0 lunch))

;; [residue]  (Beneficiary $e0 $x0) in (And (Beneficiary $e0 $x0) (Member $x0 hall))   support 0 (control 1)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Beneficiary $e0 $x0) (Member $x0 hall)) (Member $x0 hall))

;; [residue]  (CoAgent $e0 $x0)   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Experiencer $e0 $x0) in (And (Experiencer $e0 $x0) (Member $x0 auditor))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Experiencer $e0 $x0) (Member $x0 auditor)) (Member $x0 auditor))

;; [residue]  (Future $e0)   support 0 (control 2)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Goal $e0 $x0) in (And (Agent $e0 $x0) (Goal $e0 $x1))   support 0 (control 1)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Goal $e0 $x1)) (And (Agent $e0 $x0) (Goal $e0 $x1)))

;; [residue]  (Goal $e0 $x0) in (And (Goal $e0 $x0) (Member $x0 pier))   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
(Implication (And (Goal $e0 $x0) (Member $x0 pier)) (Member $x0 pier))

;; [residue]  (GroupOf $x0 automobile)   support 0 (control 2)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 countersignature)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 ladder)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 lemon)   support 0 (control 1)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 medal)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 painting)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 projector)   support 0 (control 1)   occurrences 5   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (GroupOf $x0 whistle)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Holder $e0 $x0) in (And (Holder $e0 $x0) (Member $x0 lathe))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Holder $e0 $x0) (Member $x0 lathe)) (Member $x0 lathe))

;; [residue]  (Holder $e0 $x0) in (And (Holder $e0 $x0) (Member $x0 permit))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Holder $e0 $x0) (Member $x0 permit)) (Member $x0 permit))

;; [residue]  (Instrument $e0 post)   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Location $e0 $x0) in (And (Agent $e0 $x0) (Location $e0 $x1))   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Location $e0 $x1)) (And (Agent $e0 $x0) (Location $e0 $x1)))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $x0 hall))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Location $e0 $x0) (Member $x0 hall)) (Member $x0 hall))

;; [residue]  (Location $e0 $x0) in (And (Location $e0 $x0) (Member $x0 ridge))   support 0 (control 1)   occurrences 3   head on other side 1   gate: FAIL   e.g. 
(Implication (And (Location $e0 $x0) (Member $x0 ridge)) (Member $x0 ridge))

;; [residue]  (Measure $x0 age <num> year) in (And (Measure $x0 age <num> year) (Member $x0 founder))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Measure $x0 age <num> year) (Member $x0 founder)) (Member $x0 founder))

;; [residue]  (Member $e0 abandon)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 acquire)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 allow)   support 0 (control 3)   occurrences 3   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 answer)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 arrival)   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 arrive)   support 0 (control 2)   occurrences 3   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 begin)   support 0 (control 2)   occurrences 2   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 block)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 borrow)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 buy)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 call_off)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 cancel)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 commence)   support 0 (control 2)   occurrences 2   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 cross)   support 0 (control 1)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 decide)   support 0 (control 3)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 destroy)   support 0 (control 3)   occurrences 8   head on other side 8   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 die)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 discover)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 examine)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 find_out)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 fix)   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 forbid)   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 give)   support 0 (control 5)   occurrences 8   head on other side 6   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 give_up)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 kick_the_bucket)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 learn)   support 0 (control 2)   occurrences 2   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 lend)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 make)   support 0 (control 3)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 mend)   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 need)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 postpone)   support 0 (control 2)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 purchase)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 put_off)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 reach)   support 0 (control 3)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 receive)   support 0 (control 3)   occurrences 3   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 reject)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 require)   support 0 (control 2)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 sell)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 sign)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 start)   support 0 (control 2)   occurrences 2   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 teach)   support 0 (control 2)   occurrences 4   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 turn_down)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $e0 walk)   support 0 (control 3)   occurrences 6   head on other side 6   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 big)   support 0 (control 4)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 coach)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 crate)   support 0 (control 1)   occurrences 5   head on other side 5   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 difficult)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 drill)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 driver)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 elder)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 exhausted)   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 family)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 fitter)   support 0 (control 1)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 foreman)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 gearbox)   support 0 (control 1)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 hard)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 hearing)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 huge)   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 medal)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 new)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 projector)   support 0 (control 1)   occurrences 5   head on other side 5   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 query)   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 recruit)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 roof)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 school)   support 0 (control 1)   occurrences 3   head on other side 3   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 seized)   support 0 (control 1)   occurrences 4   head on other side 4   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 song)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 tired)   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 trainer)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 welder)   support 0 (control 1)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Member $x0 whistle)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Might $e0)   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Might $e0) in (And (Agent $e0 $x0) (Might $e0))   support 0 (control 18)   occurrences 51   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Might $e0)) (Agent $e0 $x0))

;; [residue]  (Might $e0) in (And (Location $e0 $x0) (Might $e0))   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Location $e0 $x0) (Might $e0)) (Location $e0 $x0))

;; [residue]  (Might $e0) in (And (Member $e0 begin) (Might $e0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $e0 begin) (Might $e0)) (Member $e0 begin))

;; [residue]  (Might $e0) in (And (Might $e0) (Patient $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Might $e0) (Patient $e0 $x0)) (Patient $e0 $x0))

;; [residue]  (Might $e0) in (And (Might $e0) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Might $e0) (Theme $e0 $x0)) (Theme $e0 $x0))

;; [residue]  (Might (Member $x0 difficult))   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Might (Member $x0 exhausted))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Might (Member $x0 huge))   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Might (Member $x0 large))   support 0 (control 2)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Patient $e0 $e1) in (And (Member $e0 decision) (Patient $e1 $e0))   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $e0 decision) (Patient $e1 $e0)) (And (Member $e0 decision) (Patient $e1 $e0)))

;; [residue]  (Patient $e0 $x0) in (And (Agent $e0 $x0) (Patient $e0 $x1))   support 0 (control 2)   occurrences 2   head on other side 2   gate: FAIL   e.g. 
(Implication (And (Agent $e0 $x0) (Patient $e0 $x1)) (And (Agent $e0 $x0) (Patient $e0 $x1)))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 archive) (Patient $e0 $x0))   support 0 (control 1)   occurrences 1   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 archive) (Patient $e0 $x0)) (Member $x0 archive))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 chart) (Patient $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 chart) (Patient $e0 $x0)) (Member $x0 chart))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 dress_rehearsal) (Patient $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 dress_rehearsal) (Patient $e0 $x0)) (Member $x0 dress_rehearsal))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 footbridge) (Patient $e0 $x0))   support 0 (control 1)   occurrences 4   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 footbridge) (Patient $e0 $x0)) (Member $x0 footbridge))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 founder) (Patient $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 founder) (Patient $e0 $x0)) (Member $x0 founder))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 greenhouse) (Patient $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 greenhouse) (Patient $e0 $x0)) (Member $x0 greenhouse))

;; [residue]  (Patient $e0 $x0) in (And (Member $x0 summer_fair) (Patient $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 summer_fair) (Patient $e0 $x0)) (Member $x0 summer_fair))

;; [residue]  (Recipient $e0 $x0)   support 0 (control 8)   occurrences 12   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Recipient $e0 $x0) in (And (GroupOf $x0 child) (Recipient $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (GroupOf $x0 child) (Recipient $e0 $x0)) (GroupOf $x0 child))

;; [residue]  (Recipient $e0 $x0) in (And (Member $x0 gallery) (Recipient $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 gallery) (Recipient $e0 $x0)) (Member $x0 gallery))

;; [residue]  (Recipient $e0 $x0) in (And (Member $x0 winner) (Recipient $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 winner) (Recipient $e0 $x0)) (Member $x0 winner))

;; [residue]  (Stimulus $e0 $e1) in (And (Location $e0 $x0) (Stimulus $e1 $e0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Location $e0 $x0) (Stimulus $e1 $e0)) (And (Location $e0 $x0) (Stimulus $e1 $e0)))

;; [residue]  (Theme $e0 $e1)   support 0 (control 7)   occurrences 7   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Theme $e0 $e1) in (And (Member $e0 decision) (Theme $e1 $e0))   support 0 (control 1)   occurrences 1   head on other side 1   gate: FAIL   e.g. 
(Implication (And (Member $e0 decision) (Theme $e1 $e0)) (And (Member $e0 decision) (Theme $e1 $e0)))

;; [residue]  (Theme $e0 $x0) in (And (GroupOf $x0 sample) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (GroupOf $x0 sample) (Theme $e0 $x0)) (GroupOf $x0 sample))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 bridge) (Theme $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 bridge) (Theme $e0 $x0)) (Member $x0 bridge))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 countersignature) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 countersignature) (Theme $e0 $x0)) (Member $x0 countersignature))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 departure) (Theme $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 departure) (Theme $e0 $x0)) (Member $x0 departure))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 evening_flight) (Theme $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 evening_flight) (Theme $e0 $x0)) (Member $x0 evening_flight))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 file) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 file) (Theme $e0 $x0)) (Member $x0 file))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 generator) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 generator) (Theme $e0 $x0)) (Member $x0 generator))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 lane) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 lane) (Theme $e0 $x0)) (Member $x0 lane))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 loan_application) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 loan_application) (Theme $e0 $x0)) (Member $x0 loan_application))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 manifest) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 manifest) (Theme $e0 $x0)) (Member $x0 manifest))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 painting) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 painting) (Theme $e0 $x0)) (Member $x0 painting))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 proposal) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 proposal) (Theme $e0 $x0)) (Member $x0 proposal))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 search) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 search) (Theme $e0 $x0)) (Member $x0 search))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 tender) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 tender) (Theme $e0 $x0)) (Member $x0 tender))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 tower) (Theme $e0 $x0))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 tower) (Theme $e0 $x0)) (Member $x0 tower))

;; [residue]  (Theme $e0 $x0) in (And (Member $x0 vote) (Theme $e0 $x0))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Member $x0 vote) (Theme $e0 $x0)) (Member $x0 vote))

;; [residue]  (Theme $e0 monthly_servicing) in (And (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Inheritance monthly_servicing monthly) (Theme $e0 monthly_servicing)) (Inheritance monthly_servicing monthly))

;; [residue]  (Theme $e0 night_delivery) in (And (Inheritance night_delivery delivery) (Theme $e0 night_delivery))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
(Implication (And (Inheritance night_delivery delivery) (Theme $e0 night_delivery)) (Inheritance night_delivery delivery))

;; [residue]  (Theme $e0 photography)   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 (Hour <num>))   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 (Weekday monday))   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 morning)   support 0 (control 1)   occurrences 3   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)

;; [residue]  (Time $e0 that_autumn)   support 0 (control 1)   occurrences 2   head on other side 0   gate: FAIL   e.g. 
;;   rule: none — no matched context unit around the atom (a lone atom or a whole subtree dropped)
