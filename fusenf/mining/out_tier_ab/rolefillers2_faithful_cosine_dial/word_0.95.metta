;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_cosine_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.95 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful_cosine.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate       out_tier_ab/canonical_substrate.jsonl (2352 records); out_tier_ab/valuations_occ.jsonl (8510 filler occurrences)
;;   embeddings      out_tier_ab/embeddings: Qwen3-Embedding-8B, bf16, normalised; 3069 texts, dim 4096
;;   texts           word = one text per class label (1/m mass for a multi-label filler); subtree = the
;;                   label bag / plural form / surface name as one text
;;   clustering      agglomerative, average linkage on cosine distance; one tree cut at cluster cosine [0.80, 0.85, 0.90, 0.95, 1.00];
;;                   1.00 = one cluster per distinct text (= the exact-label method)
;;   slots           every head attached to an event centre (legislated roles, preposition-named obliques,
;;                   other event links such as Result / To) and every head on an entity centre (LocatedIn,
;;                   PartOf, …); the class links Member / Inheritance / GroupOf / Name classify the centre
;;                   and are not slots; event and entity centres are compared separately
;;   fillers         every embeddable argument of such a head (class labels, surface names, constants);
;;                   un-embeddable fillers (untyped skolems, numbers, strings, structured terms) stay
;;                   outside the distributions: 192 occurrences excluded in this block, 3754 filler units enter
;;   distribution    raw mass over clusters, no weighting
;;   per-slot floor  a (class, role) slot enters comparison at n >= 3 embedded fillers
;;   levels          slot pairs = the paper's method (--levels slot, the default); the role-pair level is
;;                   our extension, rendered on request (--levels role -> the *_rolepairs* files)
;;   gate            indistinguishable = cosine >= 0.5 between the two cluster-mass vectors,
;;                   with >= 2 shared clusters; JSD <= 0.4 is the sensitivity value (dial table in the .md report);
;;                   this is the REFERENCE gate; the adopted gate is JSD <= 0.3, rendered beside this file without the suffix
;;
;; RECORD FORMAT (every record is one pair, with its gate verdict)
;;   ;; [bucket]  A ~ B   n <embedded fillers of A> / <of B>   gate: PASS|FAIL
;;   ;; A fillers: the top fillers of A by mass (×mass when not 1)   e.g. <witness record ids>
;;   ;; B fillers: the same for B
;;   ;; cosine: <value> (gate)   JSD: <value>   shared clusters: <count> e.g. {cluster members} …
;;   ;; A: <query A>
;;   ;; B: <query B>
;;   the merge as the rule it would become (the paper: the two slots 'fulfil the same semantic role'), by bucket:
;;     same class, different head:  (Implication <minority slot> <the same slot relabelled to the majority head>)
;;       — the majority side (larger n; tie -> the alphabetically first name) is the canonical form;
;;     different class and head:    (Implication <slot A> (Mn<A>Or<B> <centre> $x1))  (Implication <slot B> (Mn<A>Or<B> <centre> $x1))
;;       — neither frame is relabelled; the two slots are unified under one provisional shared slot node
;;       (majority side named first); the converse shape, e.g. buy.Agent and sell.Recipient;
;;     same head:                    no rule (the merge is done by construction), and the record says so;
;;     a role pair gives the role-vocabulary collapse (<minority role> -> <majority role>); rendered for PASS and
;;     FAIL alike, the verdict is on the record; naming and direction provisional, the gauntlet decides
;; Slot pairs: every pair with >= 2 shared clusters (the gate's first condition); a pair sharing fewer
;; clusters cannot pass and is not listed.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as
;; (And (Member $x0 <class>) (<Head> $x0 $x1)) (bare (<Head> $x0 $x1) for an unclassed centre), a role pair's
;; side as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== SLOT PAIRS: 64 pass the gate (event 64, entity 0); 144 pairs listed = every pair with >= 2 shared clusters (event 143, entity 1) among the 30942 pairs of 249 event slots and 12 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same role, different class]  acquire.Agent ~ purchase.Agent   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000003 tierA-000017
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000002 tierA-000016
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {depot} {chef} {pottery studio} {school}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  acquire.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000003 tierA-000017
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000004 tierA-000018
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {depot} {chef} {pottery studio} {school}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 acquire) (Agent $e0 $x1)) (MnAcquireAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnAcquireAgentOrSellRecipient $e0 $x1))

;; [different class and role]  purchase.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000002 tierA-000016
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000004 tierA-000018
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {depot} {chef} {pottery studio} {school}
;; A: (And (Member $e0 purchase) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 purchase) (Agent $e0 $x1)) (MnPurchaseAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnPurchaseAgentOrSellRecipient $e0 $x1))

;; [same role, different class]  borrow.Theme ~ lend.Theme   n 3 / 10   gate: PASS
;; A fillers: generator, ladder, painting   e.g. tierA-000307 tierA-000297
;; B fillers: ladder ×4, generator ×3, painting ×3   e.g. tierA-000306 tierA-000308
;; cosine: 0.99 (gate)   JSD: 0.003   shared clusters: 3 e.g. {ladder} {painting} {generator}
;; A: (And (Member $e0 borrow) (Theme $e0 $x1))
;; B: (And (Member $e0 lend) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  need.Holder ~ require.Holder   n 3 / 8   gate: PASS
;; A fillers: lathe, permit, recipe   e.g. tierA-000095 tierA-000090
;; B fillers: permit ×3, recipe ×3, lathe ×2   e.g. tierA-000094 tierA-000096
;; cosine: 0.98 (gate)   JSD: 0.006   shared clusters: 3 e.g. {permit} {recipe} {lathe}
;; A: (And (Member $e0 need) (Holder $e0 $x1))
;; B: (And (Member $e0 require) (Holder $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  postpone.Agent ~ put_off.Agent   n 7 / 3   gate: PASS
;; A fillers: club ×3, board ×2, ferry ×2   e.g. tierA-000123 tierA-000125
;; B fillers: board, club, ferry   e.g. tierA-000124 tierA-000115
;; cosine: 0.98 (gate)   JSD: 0.007   shared clusters: 3 e.g. {club} {board} {ferry}
;; A: (And (Member $e0 postpone) (Agent $e0 $x1))
;; B: (And (Member $e0 put_off) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  postpone.Theme ~ put_off.Theme   n 7 / 3   gate: PASS
;; A fillers: tournament ×3, departure ×2, vote ×2   e.g. tierA-000114 tierA-000116
;; B fillers: departure, tournament, vote   e.g. tierA-000115 tierA-000120
;; cosine: 0.98 (gate)   JSD: 0.007   shared clusters: 3 e.g. {tournament} {vote} {departure, depart}
;; A: (And (Member $e0 postpone) (Theme $e0 $x1))
;; B: (And (Member $e0 put_off) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  call_off.Agent ~ cancel.Agent   n 3 / 9   gate: PASS
;; A fillers: airline, council, tutor   e.g. tierA-000149 tierA-000144
;; B fillers: council ×3, tutor ×3, airline ×2, physician   e.g. tierA-000148 tierA-000150
;; cosine: 0.96 (gate)   JSD: 0.064   shared clusters: 3 e.g. {council} {tutor} {airline}
;; A: (And (Member $e0 call_off) (Agent $e0 $x1))
;; B: (And (Member $e0 cancel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  allow.Agent ~ permit.Agent   n 4 / 3   gate: PASS
;; A fillers: licence ×2, curator, warden   e.g. tierA-000076 tierA-000078
;; B fillers: curator, licence, warden   e.g. tierA-000077 tierA-000081
;; cosine: 0.94 (gate)   JSD: 0.021   shared clusters: 3 e.g. {licence} {curator} {warden}
;; A: (And (Member $e0 allow) (Agent $e0 $x1))
;; B: (And (Member $e0 permit) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  allow.Theme ~ permit.Theme   n 4 / 3   gate: PASS
;; A fillers: night delivery ×2, photography, visitor   e.g. tierA-000080 tierA-000075
;; B fillers: night delivery, photography, visitor   e.g. tierA-000081 tierA-000073
;; cosine: 0.94 (gate)   JSD: 0.021   shared clusters: 3 e.g. {night delivery} {photography} {visitor}
;; A: (And (Member $e0 allow) (Theme $e0 $x1))
;; B: (And (Member $e0 permit) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  borrow.Agent ~ lend.Recipient   n 3 / 10   gate: PASS
;; A fillers: Ravi, crew, gallery   e.g. tierA-000307 tierA-000302
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000306 tierA-000308
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {gallery} {Ravi} {crew}
;; A: (And (Member $e0 borrow) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (MnLendRecipientOrBorrowAgent $e0 $x1))
(Implication (And (Member $e0 borrow) (Agent $e0 $x1)) (MnLendRecipientOrBorrowAgent $e0 $x1))

;; [different class and role]  borrow.Source ~ lend.Agent   n 3 / 10   gate: PASS
;; A fillers: depot, museum, neighbour   e.g. tierA-000297 tierA-000307
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000296 tierA-000298
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {neighbour} {museum} {depot}
;; A: (And (Member $e0 borrow) (Source $e0 $x1))
;; B: (And (Member $e0 lend) (Agent $e0 $x1))
(Implication (And (Member $e0 lend) (Agent $e0 $x1)) (MnLendAgentOrBorrowSource $e0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x1)) (MnLendAgentOrBorrowSource $e0 $x1))

;; [same role, different class]  reject.Agent ~ turn_down.Agent   n 8 / 3   gate: PASS
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000168 tierA-000170
;; B fillers: bank, editor, panel   e.g. tierA-000169 tierA-000164
;; cosine: 0.93 (gate)   JSD: 0.138   shared clusters: 3 e.g. {panel} {bank} {editor}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  reject.Theme ~ turn_down.Theme   n 8 / 3   gate: PASS
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000158 tierA-000160
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000159 tierA-000164
;; cosine: 0.93 (gate)   JSD: 0.138   shared clusters: 3 e.g. {manuscript} {loan application} {proposal}
;; A: (And (Member $e0 reject) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  learn.Agent ~ teach.Recipient   n 3 / 11   gate: PASS
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000286 tierA-000288
;; cosine: 0.92 (gate)   JSD: 0.157   shared clusters: 3 e.g. {apprentice} {child, kid} {squad}
;; A: (And (Member $e0 learn) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (MnTeachRecipientOrLearnAgent $e0 $x1))
(Implication (And (Member $e0 learn) (Agent $e0 $x1)) (MnTeachRecipientOrLearnAgent $e0 $x1))

;; [same role, different class]  decide.Theme ~ decision.Theme   n 11 / 6   gate: PASS
;; A fillers: budget ×3, case ×3, confront, judge, new, roof   e.g. tierA-000185 tierA-000189
;; B fillers: budget ×2, case ×2, new, roof   e.g. tierA-000186 tierA-000187
;; cosine: 0.92 (gate)   JSD: 0.157   shared clusters: 4 e.g. {budget} {case} {roof} {new}
;; A: (And (Member $e0 decide) (Theme $e0 $x1))
;; B: (And (Member $e0 decision) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  learn.Source ~ teach.Agent   n 3 / 12   gate: PASS
;; A fillers: coach, elder, potter   e.g. tierA-000282 tierA-000287
;; B fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000281 tierA-000283
;; cosine: 0.91 (gate)   JSD: 0.196   shared clusters: 3 e.g. {potter} {elder, elderly} {coach}
;; A: (And (Member $e0 learn) (Source $e0 $x1))
;; B: (And (Member $e0 teach) (Agent $e0 $x1))
(Implication (And (Member $e0 teach) (Agent $e0 $x1)) (MnTeachAgentOrLearnSource $e0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x1)) (MnTeachAgentOrLearnSource $e0 $x1))

;; [same role, different class]  acquire.Theme ~ buy.Theme   n 4 / 19   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000003
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000008 tierA-000012
;; cosine: 0.89 (gate)   JSD: 0.255   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  acquire.Agent ~ buy.Agent   n 4 / 17   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000003 tierA-000017
;; B fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000001 tierA-000005
;; cosine: 0.89 (gate)   JSD: 0.208   shared clusters: 4 e.g. {depot} {pottery studio} {school} {chef}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Agent ~ purchase.Agent   n 17 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000001 tierA-000005
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000002 tierA-000016
;; cosine: 0.89 (gate)   JSD: 0.208   shared clusters: 4 e.g. {depot} {pottery studio} {school} {chef}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Agent ~ sell.Recipient   n 17 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000001 tierA-000005
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000004 tierA-000018
;; cosine: 0.89 (gate)   JSD: 0.208   shared clusters: 4 e.g. {depot} {pottery studio} {school} {chef}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnBuyAgentOrSellRecipient $e0 $x1))

;; [same role, different class]  acquire.Theme ~ purchase.Theme   n 4 / 5   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000003
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000002
;; cosine: 0.88 (gate)   JSD: 0.108   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  block.Agent ~ wait.Experiencer   n 6 / 4   gate: PASS
;; A fillers: automobile ×3, Trump, army, car   e.g. tierA-000390 tierA-000392
;; B fillers: automobile ×2, car, future ×0.5, mystery ×0.5   e.g. tierA-000395 tierA-000397
;; cosine: 0.86 (gate)   JSD: 0.298   shared clusters: 2 e.g. {automobile, automobiles} {car}
;; A: (And (Member $e0 block) (Agent $e0 $x1))
;; B: (And (Member $e0 wait) (Experiencer $e0 $x1))
(Implication (And (Member $e0 block) (Agent $e0 $x1)) (MnBlockAgentOrWaitExperiencer $e0 $x1))
(Implication (And (Member $e0 wait) (Experiencer $e0 $x1)) (MnBlockAgentOrWaitExperiencer $e0 $x1))

;; [same role, different class]  abandon.Agent ~ give_up.Agent   n 8 / 4   gate: PASS
;; A fillers: climber ×3, firm ×3, rescue team ×2   e.g. tierA-000104 tierA-000106
;; B fillers: Bob, climber, firm, rescue team   e.g. tierA-000105 tierA-000110
;; cosine: 0.85 (gate)   JSD: 0.143   shared clusters: 3 e.g. {firm} {climber} {rescue team}
;; A: (And (Member $e0 abandon) (Agent $e0 $x1))
;; B: (And (Member $e0 give_up) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Theme ~ give_up.Theme   n 8 / 4   gate: PASS
;; A fillers: north route ×3, tender ×3, search ×2   e.g. tierA-000109 tierA-000111
;; B fillers: north route, search, smoke, tender   e.g. tierA-000110 tierA-000105
;; cosine: 0.85 (gate)   JSD: 0.143   shared clusters: 3 e.g. {north route} {tender} {search}
;; A: (And (Member $e0 abandon) (Theme $e0 $x1))
;; B: (And (Member $e0 give_up) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Patient ~ commence.Patient   n 11 / 4   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000057 tierA-000052
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000059 tierA-000054
;; cosine: 0.85 (gate)   JSD: 0.221   shared clusters: 4 e.g. {shoreline survey} {dress rehearsal} {apple harvest} {hearing}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 commence) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  discover.Experiencer ~ discover.Stimulus   n 3 / 3   gate: PASS
;; A fillers: auditor ×2, error   e.g. tierA-000128 tierA-000130
;; B fillers: error ×2, auditor   e.g. tierA-000132 tierA-000128
;; cosine: 0.80 (gate)   JSD: 0.082   shared clusters: 2 e.g. {auditor} {error}
;; A: (And (Member $e0 discover) (Experiencer $e0 $x1))
;; B: (And (Member $e0 discover) (Stimulus $e0 $x1))
(Implication (And (Member $e0 discover) (Stimulus $e0 $x1)) (And (Member $e0 discover) (Experiencer $e0 $x1)))

;; [same role, different class]  call_off.Patient ~ cancel.Patient   n 3 / 7   gate: PASS
;; A fillers: afternoon session, game, summer fair   e.g. tierA-000154 tierA-000149
;; B fillers: afternoon session ×3, summer fair ×3, evening flight   e.g. tierA-000153 tierA-000155
;; cosine: 0.80 (gate)   JSD: 0.247   shared clusters: 2 e.g. {afternoon session} {summer fair}
;; A: (And (Member $e0 call_off) (Patient $e0 $x1))
;; B: (And (Member $e0 cancel) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  repair.Agent ~ repair.Patient   n 8 / 9   gate: PASS
;; A fillers: electrician ×2, mechanic ×2, crew, yard floodlight, cracked ×0.5, feed pipe ×0.5   e.g. tierA-000034 tierA-000051
;; B fillers: yard floodlight ×2, crew, electrician, gearbox, mechanic, seized   e.g. tierA-000029 tierA-000032
;; cosine: 0.79 (gate)   JSD: 0.116   shared clusters: 8 e.g. {mechanic} {electrician} {yard floodlight} {crew}
;; A: (And (Member $e0 repair) (Agent $e0 $x1))
;; B: (And (Member $e0 repair) (Patient $e0 $x1))
(Implication (And (Member $e0 repair) (Agent $e0 $x1)) (And (Member $e0 repair) (Patient $e0 $x1)))

;; [same role, different class]  buy.Theme ~ purchase.Theme   n 19 / 5   gate: PASS
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000008 tierA-000012
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000002
;; cosine: 0.79 (gate)   JSD: 0.327   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Time ~ end.Time   n 3 / 3   gate: PASS
;; A fillers: dawn ×2, morning   e.g. tierA-000057 tierA-000052
;; B fillers: dawn, morning, one day   e.g. tierA-000060 tierA-000056
;; cosine: 0.78 (gate)   JSD: 0.208   shared clusters: 2 e.g. {dawn} {morning}
;; A: (And (Member $e0 begin) (Time $e0 $x1))
;; B: (And (Member $e0 end) (Time $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Time ~ start.Time   n 3 / 3   gate: PASS
;; A fillers: dawn ×2, morning   e.g. tierA-000057 tierA-000052
;; B fillers: dawn, morning, soon   e.g. tierA-000058 tierA-000053
;; cosine: 0.78 (gate)   JSD: 0.208   shared clusters: 2 e.g. {dawn} {morning}
;; A: (And (Member $e0 begin) (Time $e0 $x1))
;; B: (And (Member $e0 start) (Time $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ receive.Source   n 15 / 4   gate: PASS
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000271 tierA-000273
;; B fillers: foreman, school, trainer, car dealer ×0.5, local ×0.5   e.g. tierA-000272 tierA-000262
;; cosine: 0.77 (gate)   JSD: 0.375   shared clusters: 3 e.g. {trainer} {school} {foreman}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 receive) (Source $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnGiveAgentOrReceiveSource $e0 $x1))
(Implication (And (Member $e0 receive) (Source $e0 $x1)) (MnGiveAgentOrReceiveSource $e0 $x1))

;; [same role, different class]  examine.Agent ~ sign.Agent   n 5 / 5   gate: PASS
;; A fillers: doctor ×2, physician ×2, gazelle   e.g. tierA-000381 tierB-001122
;; B fillers: physician ×2, author, chart, doctor   e.g. tierA-000376 tierA-000375
;; cosine: 0.76 (gate)   JSD: 0.325   shared clusters: 2 e.g. {physician} {doctor}
;; A: (And (Member $e0 examine) (Agent $e0 $x1))
;; B: (And (Member $e0 sign) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Theme ~ teach.Theme   n 6 / 11   gate: PASS
;; A fillers: berber, drill, glazing, song, vocabulary, foreign ×0.5   e.g. tierA-000287 tierA-000282
;; B fillers: glazing ×4, drill ×3, song ×3, phrase   e.g. tierA-000286 tierA-000288
;; cosine: 0.72 (gate)   JSD: 0.341   shared clusters: 3 e.g. {glazing} {drill} {song}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 teach) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  destroy.Agent ~ save.Agent   n 10 / 3   gate: PASS
;; A fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000232 tierA-000234
;; B fillers: fire, flood, boy ×0.5, tall ×0.5   e.g. tierA-000235 tierA-000231
;; cosine: 0.71 (gate)   JSD: 0.429   shared clusters: 2 e.g. {fire} {flood}
;; A: (And (Member $e0 destroy) (Agent $e0 $x1))
;; B: (And (Member $e0 save) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  examine.Agent ~ order.Agent   n 5 / 6   gate: PASS
;; A fillers: doctor ×2, physician ×2, gazelle   e.g. tierA-000381 tierB-001122
;; B fillers: physician ×2, dictator, doctor, professor, scan   e.g. tierA-000386 tierA-000385
;; cosine: 0.71 (gate)   JSD: 0.388   shared clusters: 2 e.g. {physician} {doctor}
;; A: (And (Member $e0 examine) (Agent $e0 $x1))
;; B: (And (Member $e0 order) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  acquire.Theme ~ sell.Theme   n 4 / 9   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000003
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000011 tierA-000004
;; cosine: 0.68 (gate)   JSD: 0.357   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  commence.Patient ~ end.Patient   n 4 / 5   gate: PASS
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000059 tierA-000054
;; B fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000060 tierA-000056
;; cosine: 0.67 (gate)   JSD: 0.331   shared clusters: 3 e.g. {hearing} {shoreline survey} {apple harvest}
;; A: (And (Member $e0 commence) (Patient $e0 $x1))
;; B: (And (Member $e0 end) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Recipient ~ receive.Agent   n 14 / 7   gate: PASS
;; A fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000261 tierA-000263
;; B fillers: winner ×2, Beth, General Franks, driver, recruit, refugee   e.g. tierA-000262 tierA-000277
;; cosine: 0.67 (gate)   JSD: 0.437   shared clusters: 3 e.g. {winner} {recruit} {driver}
;; A: (And (Member $e0 give) (Recipient $e0 $x1))
;; B: (And (Member $e0 receive) (Agent $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrReceiveAgent $e0 $x1))
(Implication (And (Member $e0 receive) (Agent $e0 $x1)) (MnGiveRecipientOrReceiveAgent $e0 $x1))

;; [same role, different class]  order.Agent ~ sign.Agent   n 6 / 5   gate: PASS
;; A fillers: physician ×2, dictator, doctor, professor, scan   e.g. tierA-000386 tierA-000385
;; B fillers: physician ×2, author, chart, doctor   e.g. tierA-000376 tierA-000375
;; cosine: 0.67 (gate)   JSD: 0.453   shared clusters: 2 e.g. {physician} {doctor}
;; A: (And (Member $e0 order) (Agent $e0 $x1))
;; B: (And (Member $e0 sign) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Agent ~ turn_down.Agent   n 3 / 3   gate: PASS
;; A fillers: Antonio, editor, panel   e.g. tierA-000172 tierA-000161
;; B fillers: bank, editor, panel   e.g. tierA-000169 tierA-000159
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {panel} {editor}
;; A: (And (Member $e0 accept) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Theme ~ turn_down.Theme   n 3 / 3   gate: PASS
;; A fillers: invitation, manuscript, proposal   e.g. tierA-000161 tierA-000172
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000159 tierA-000169
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {manuscript} {proposal}
;; A: (And (Member $e0 accept) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  arrival.Agent ~ depart.Agent   n 3 / 3   gate: PASS
;; A fillers: delegation, french settler, soil sample   e.g. tierA-000242 tierA-000246
;; B fillers: delegation, soil sample, train   e.g. tierA-000244 tierA-000247
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {delegation} {soil sample, soil samples}
;; A: (And (Member $e0 arrival) (Agent $e0 $x1))
;; B: (And (Member $e0 depart) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  end.Time ~ start.Time   n 3 / 3   gate: PASS
;; A fillers: dawn, morning, one day   e.g. tierA-000060 tierA-000056
;; B fillers: dawn, morning, soon   e.g. tierA-000058 tierA-000053
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {morning} {dawn}
;; A: (And (Member $e0 end) (Time $e0 $x1))
;; B: (And (Member $e0 start) (Time $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  decide.Agent ~ reach.Agent   n 15 / 6   gate: PASS
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000185 tierA-000189
;; B fillers: David, board, committee, family, judge, jury   e.g. tierA-000187 tierA-000192
;; cosine: 0.66 (gate)   JSD: 0.386   shared clusters: 4 e.g. {judge} {board} {committee} {family}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 reach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Agent ~ reject.Agent   n 3 / 8   gate: PASS
;; A fillers: Antonio, editor, panel   e.g. tierA-000172 tierA-000161
;; B fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000168 tierA-000170
;; cosine: 0.62 (gate)   JSD: 0.425   shared clusters: 2 e.g. {panel} {editor}
;; A: (And (Member $e0 accept) (Agent $e0 $x1))
;; B: (And (Member $e0 reject) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Theme ~ reject.Theme   n 3 / 8   gate: PASS
;; A fillers: invitation, manuscript, proposal   e.g. tierA-000161 tierA-000172
;; B fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000158 tierA-000160
;; cosine: 0.62 (gate)   JSD: 0.425   shared clusters: 2 e.g. {manuscript} {proposal}
;; A: (And (Member $e0 accept) (Theme $e0 $x1))
;; B: (And (Member $e0 reject) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Agent ~ continue.Agent   n 8 / 3   gate: PASS
;; A fillers: climber ×3, firm ×3, rescue team ×2   e.g. tierA-000109 tierA-000111
;; B fillers: climber, price, rescue team   e.g. tierA-000113 tierA-000102
;; cosine: 0.61 (gate)   JSD: 0.359   shared clusters: 2 e.g. {climber} {rescue team}
;; A: (And (Member $e0 abandon) (Agent $e0 $x1))
;; B: (And (Member $e0 continue) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: PASS
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000747 tierB-000425
;; B fillers: on, open, unlocked   e.g. tierB-000004 tierB-000747
;; cosine: 0.61 (gate)   JSD: 0.311   shared clusters: 3 e.g. {unlocked} {open} {on}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same role, different class]  buy.Theme ~ sell.Theme   n 19 / 9   gate: PASS
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000008 tierA-000012
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000011 tierA-000004
;; cosine: 0.61 (gate)   JSD: 0.497   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cause.Agent ~ destroy.Agent   n 9 / 10   gate: PASS
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000233 tierA-000223
;; B fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000232 tierA-000234
;; cosine: 0.61 (gate)   JSD: 0.47   shared clusters: 3 e.g. {storm} {fire} {flood}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  purchase.Theme ~ sell.Theme   n 5 / 9   gate: PASS
;; A fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000002
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000011 tierA-000004
;; cosine: 0.60 (gate)   JSD: 0.415   shared clusters: 5 e.g. {projector} {forklift, forklifts} {kiln} {crate}
;; A: (And (Member $e0 purchase) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  need.Theme ~ require.Theme   n 8 / 14   gate: PASS
;; A fillers: countersignature, egg, generate, go, monthly servicing, paint   e.g. tierA-000090 tierA-000095
;; B fillers: egg ×4, countersignature ×3, monthly servicing ×3, american phone number, repair, hard ×0.5   e.g. tierA-000089 tierA-000091
;; cosine: 0.58 (gate)   JSD: 0.496   shared clusters: 3 e.g. {egg} {countersignature, countersignatures} {monthly servicing}
;; A: (And (Member $e0 need) (Theme $e0 $x1))
;; B: (And (Member $e0 require) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  continue.Agent ~ give_up.Agent   n 3 / 4   gate: PASS
;; A fillers: climber, price, rescue team   e.g. tierA-000113 tierA-000102
;; B fillers: Bob, climber, firm, rescue team   e.g. tierA-000110 tierA-000100
;; cosine: 0.58 (gate)   JSD: 0.425   shared clusters: 2 e.g. {climber} {rescue team}
;; A: (And (Member $e0 continue) (Agent $e0 $x1))
;; B: (And (Member $e0 give_up) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  reject.Agent ~ reject.Theme   n 8 / 8   gate: PASS
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000162 tierA-000166
;; B fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000158 tierA-000160
;; cosine: 0.57 (gate)   JSD: 0.311   shared clusters: 4 e.g. {manuscript} {loan application} {bank} {editor}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 reject) (Theme $e0 $x1))
(Implication (And (Member $e0 reject) (Theme $e0 $x1)) (And (Member $e0 reject) (Agent $e0 $x1)))

;; [same class, different role]  sign.Agent ~ sign.Patient   n 5 / 5   gate: PASS
;; A fillers: physician ×2, author, chart, doctor   e.g. tierA-000378 tierA-000375
;; B fillers: chart ×3, limited edition, physician   e.g. tierA-000376 tierA-000377
;; cosine: 0.57 (gate)   JSD: 0.4   shared clusters: 2 e.g. {chart} {physician}
;; A: (And (Member $e0 sign) (Agent $e0 $x1))
;; B: (And (Member $e0 sign) (Patient $e0 $x1))
(Implication (And (Member $e0 sign) (Patient $e0 $x1)) (And (Member $e0 sign) (Agent $e0 $x1)))

;; [same role, different class]  give.Theme ~ receive.Theme   n 15 / 7   gate: PASS
;; A fillers: answer ×3, manifest ×3, medal ×3, whistle ×3, chocolate, mock champagne   e.g. tierA-000276 tierA-000278
;; B fillers: award, honorary knighthood, manifest, medal, permit, whistle   e.g. tierA-000277 tierA-000262
;; cosine: 0.57 (gate)   JSD: 0.496   shared clusters: 3 e.g. {medal} {whistle} {manifest}
;; A: (And (Member $e0 give) (Theme $e0 $x1))
;; B: (And (Member $e0 receive) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Patient ~ end.Patient   n 11 / 5   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000057 tierA-000052
;; B fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000060 tierA-000056
;; cosine: 0.54 (gate)   JSD: 0.488   shared clusters: 3 e.g. {shoreline survey} {apple harvest} {hearing}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 end) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  commence.Patient ~ start.Patient   n 4 / 15   gate: PASS
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000059 tierA-000054
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000058 tierA-000053
;; cosine: 0.54 (gate)   JSD: 0.53   shared clusters: 4 e.g. {hearing} {shoreline survey} {dress rehearsal} {apple harvest}
;; A: (And (Member $e0 commence) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Theme ~ continue.Theme   n 8 / 4   gate: PASS
;; A fillers: north route ×3, tender ×3, search ×2   e.g. tierA-000109 tierA-000111
;; B fillers: climb, north route, search, shine   e.g. tierA-000113 tierA-000102
;; cosine: 0.53 (gate)   JSD: 0.447   shared clusters: 2 e.g. {north route} {search}
;; A: (And (Member $e0 abandon) (Theme $e0 $x1))
;; B: (And (Member $e0 continue) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  order.Agent ~ order.Theme   n 6 / 6   gate: PASS
;; A fillers: physician ×2, dictator, doctor, professor, scan   e.g. tierA-000389 tierA-000385
;; B fillers: scan ×3, book, physician, full scale ×0.5, invasion ×0.5   e.g. tierA-000386 tierA-000387
;; cosine: 0.52 (gate)   JSD: 0.5   shared clusters: 2 e.g. {scan} {physician}
;; A: (And (Member $e0 order) (Agent $e0 $x1))
;; B: (And (Member $e0 order) (Theme $e0 $x1))
(Implication (And (Member $e0 order) (Theme $e0 $x1)) (And (Member $e0 order) (Agent $e0 $x1)))

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: PASS
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; cosine: 0.50 (gate)   JSD: 0.547   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  continue.Theme ~ give_up.Theme   n 4 / 4   gate: PASS
;; A fillers: climb, north route, search, shine   e.g. tierA-000113 tierA-000102
;; B fillers: north route, search, smoke, tender   e.g. tierA-000110 tierA-000100
;; cosine: 0.50 (gate)   JSD: 0.5   shared clusters: 2 e.g. {north route} {search}
;; A: (And (Member $e0 continue) (Theme $e0 $x1))
;; B: (And (Member $e0 give_up) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000370 tierB-001658
;; cosine: 0.48 (gate)   JSD: 0.531   shared clusters: 4 e.g. {bad} {expensive} {cheap} {short}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000125
;; cosine: 0.48 (gate)   JSD: 0.554   shared clusters: 2 e.g. {Rima} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000916
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000030 tierB-000125
;; cosine: 0.48 (gate)   JSD: 0.554   shared clusters: 2 e.g. {Skura} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [same role, different class]  begin.Patient ~ start.Patient   n 11 / 15   gate: FAIL
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000057 tierA-000052
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000058 tierA-000053
;; cosine: 0.46 (gate)   JSD: 0.61   shared clusters: 4 e.g. {shoreline survey} {dress rehearsal} {apple harvest} {hearing}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  destroy.Agent ~ destroy.Patient   n 10 / 13   gate: FAIL
;; A fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000222 tierA-000224
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, city centre, fire, mayan book   e.g. tierA-000226 tierA-000223
;; cosine: 0.44 (gate)   JSD: 0.452   shared clusters: 4 e.g. {greenhouse} {fire} {archive} {storm}
;; A: (And (Member $e0 destroy) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Patient $e0 $x1))
(Implication (And (Member $e0 destroy) (Agent $e0 $x1)) (And (Member $e0 destroy) (Patient $e0 $x1)))

;; [same role, different class]  make.Agent ~ reach.Agent   n 22 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierA-000186 tierA-000191
;; B fillers: David, board, committee, family, judge, jury   e.g. tierA-000187 tierA-000192
;; cosine: 0.44 (gate)   JSD: 0.602   shared clusters: 5 e.g. {committee} {judge} {board} {family}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 reach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000410
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001753 tierB-001891
;; cosine: 0.42 (gate)   JSD: 0.569   shared clusters: 2 e.g. {child, kid} {dog}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))

;; [same class, different role]  lend.Agent ~ lend.Recipient   n 10 / 10   gate: FAIL
;; A fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000296 tierA-000298
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000300 tierA-000304
;; cosine: 0.42 (gate)   JSD: 0.4   shared clusters: 4 e.g. {neighbour} {Ravi} {depot} {crew}
;; A: (And (Member $e0 lend) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (And (Member $e0 lend) (Agent $e0 $x1)))

;; [same role, different class]  arrival.Agent ~ arrive.Agent   n 3 / 10   gate: FAIL
;; A fillers: delegation, french settler, soil sample   e.g. tierA-000242 tierA-000246
;; B fillers: freight ×3, delegation ×2, Donald, driver, paris train, soil sample   e.g. tierA-000241 tierA-000243
;; cosine: 0.41 (gate)   JSD: 0.577   shared clusters: 2 e.g. {delegation} {soil sample, soil samples}
;; A: (And (Member $e0 arrival) (Agent $e0 $x1))
;; B: (And (Member $e0 arrive) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  arrive.Agent ~ depart.Agent   n 10 / 3   gate: FAIL
;; A fillers: freight ×3, delegation ×2, Donald, driver, paris train, soil sample   e.g. tierA-000241 tierA-000243
;; B fillers: delegation, soil sample, train   e.g. tierA-000244 tierA-000247
;; cosine: 0.41 (gate)   JSD: 0.577   shared clusters: 2 e.g. {delegation} {soil sample, soil samples}
;; A: (And (Member $e0 arrive) (Agent $e0 $x1))
;; B: (And (Member $e0 depart) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  buy.Agent ~ buy.Theme   n 17 / 19   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000006 tierA-000001
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000005 tierA-000007
;; cosine: 0.40 (gate)   JSD: 0.486   shared clusters: 7 e.g. {forklift, forklifts} {depot} {kiln} {pottery studio}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (And (Member $e0 buy) (Theme $e0 $x1)))

;; [same class, different role]  answer.Agent ~ answer.Theme   n 11 / 11   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000207 tierA-000209
;; B fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000210 tierA-000211
;; cosine: 0.40 (gate)   JSD: 0.455   shared clusters: 4 e.g. {clerk} {query} {caller} {vet}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 answer) (Theme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (And (Member $e0 answer) (Agent $e0 $x1)))

;; [same class, different role]  teach.Agent ~ teach.Recipient   n 12 / 11   gate: FAIL
;; A fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000281 tierA-000283
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000285 tierA-000286
;; cosine: 0.39 (gate)   JSD: 0.478   shared clusters: 4 e.g. {potter} {apprentice} {squad} {coach}
;; A: (And (Member $e0 teach) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (And (Member $e0 teach) (Agent $e0 $x1)))

;; [same role, different class]  decide.Agent ~ make.Agent   n 15 / 22   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000185 tierA-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierA-000186 tierA-000191
;; cosine: 0.39 (gate)   JSD: 0.648   shared clusters: 5 e.g. {judge} {board} {committee} {family}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  leave.Agent ~ wait.Experiencer   n 11 / 4   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierA-000398 tierB-000713
;; B fillers: automobile ×2, car, future ×0.5, mystery ×0.5   e.g. tierA-000395 tierA-000397
;; cosine: 0.39 (gate)   JSD: 0.674   shared clusters: 2 e.g. {automobile, automobiles} {car}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 wait) (Experiencer $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrWaitExperiencer $e0 $x1))
(Implication (And (Member $e0 wait) (Experiencer $e0 $x1)) (MnLeaveAgentOrWaitExperiencer $e0 $x1))

;; [same role, different class]  cause.Agent ~ save.Agent   n 9 / 3   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000233 tierA-000228
;; B fillers: fire, flood, boy ×0.5, tall ×0.5   e.g. tierA-000235 tierA-000231
;; cosine: 0.38 (gate)   JSD: 0.639   shared clusters: 2 e.g. {flood} {fire}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 save) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-001169
;; cosine: 0.38 (gate)   JSD: 0.636   shared clusters: 2 e.g. {girl} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  end.Patient ~ start.Patient   n 5 / 15   gate: FAIL
;; A fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000060 tierA-000056
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000058 tierA-000053
;; cosine: 0.36 (gate)   JSD: 0.675   shared clusters: 3 e.g. {hearing} {shoreline survey} {apple harvest}
;; A: (And (Member $e0 end) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  die.Patient ~ watch.Agent   n 5 / 5   gate: FAIL
;; A fillers: founder ×2, family, person, elm ×0.5, last ×0.5   e.g. tierB-001967 tierB-000838
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; cosine: 0.35 (gate)   JSD: 0.6   shared clusters: 2 e.g. {person} {family}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (MnDiePatientOrWatchAgent $e0 $x1))
(Implication (And (Member $e0 watch) (Agent $e0 $x1)) (MnDiePatientOrWatchAgent $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001003 tierB-001334
;; cosine: 0.35 (gate)   JSD: 0.714   shared clusters: 2 e.g. {cat} {child, kid}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  take.Agent ~ walk.Agent   n 10 / 13   gate: FAIL
;; A fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierA-000174 tierA-000178
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000173 tierA-000177
;; cosine: 0.35 (gate)   JSD: 0.651   shared clusters: 4 e.g. {shepherd} {nurse} {child, kid} {Michael}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  block.Agent ~ leave.Agent   n 6 / 11   gate: FAIL
;; A fillers: automobile ×3, Trump, army, car   e.g. tierA-000390 tierA-000392
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierA-000398 tierB-000713
;; cosine: 0.35 (gate)   JSD: 0.696   shared clusters: 2 e.g. {automobile, automobiles} {car}
;; A: (And (Member $e0 block) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  discover.Agent ~ discover.Theme   n 9 / 9   gate: FAIL
;; A fillers: diver ×3, intern ×3, paleontologist, scientist, wreck   e.g. tierA-000136 tierA-000133
;; B fillers: wreck ×3, file ×1.5, missing ×1.5, diver, pterosaur egg, magnet ×0.333   e.g. tierA-000135 tierA-000137
;; cosine: 0.33 (gate)   JSD: 0.639   shared clusters: 2 e.g. {wreck} {diver}
;; A: (And (Member $e0 discover) (Agent $e0 $x1))
;; B: (And (Member $e0 discover) (Theme $e0 $x1))
(Implication (And (Member $e0 discover) (Theme $e0 $x1)) (And (Member $e0 discover) (Agent $e0 $x1)))

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000654 tierB-001675
;; cosine: 0.32 (gate)   JSD: 0.599   shared clusters: 4 e.g. {black} {gusher} {yellow} {red}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 5 / 3   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-001817 tierB-001582
;; B fillers: alarmed, conservative, red   e.g. tierB-001079 tierB-001817
;; cosine: 0.31 (gate)   JSD: 0.662   shared clusters: 2 e.g. {conservative} {red}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [different class and role]  reject.Agent ~ turn_down.Theme   n 8 / 3   gate: FAIL
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000162 tierA-000166
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000159 tierA-000164
;; cosine: 0.31 (gate)   JSD: 0.613   shared clusters: 2 e.g. {manuscript} {loan application}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
(Implication (And (Member $e0 reject) (Agent $e0 $x1)) (MnRejectAgentOrTurnDownTheme $e0 $x1))
(Implication (And (Member $e0 turn_down) (Theme $e0 $x1)) (MnRejectAgentOrTurnDownTheme $e0 $x1))

;; [different class and role]  reject.Theme ~ turn_down.Agent   n 8 / 3   gate: FAIL
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000166 tierA-000162
;; B fillers: bank, editor, panel   e.g. tierA-000164 tierA-000159
;; cosine: 0.31 (gate)   JSD: 0.613   shared clusters: 2 e.g. {bank} {editor}
;; A: (And (Member $e0 reject) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
(Implication (And (Member $e0 reject) (Theme $e0 $x1)) (MnRejectThemeOrTurnDownAgent $e0 $x1))
(Implication (And (Member $e0 turn_down) (Agent $e0 $x1)) (MnRejectThemeOrTurnDownAgent $e0 $x1))

;; [same class, different role]  work.Agent ~ work.CoAgent   n 21 / 7   gate: FAIL
;; A fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000320 tierA-000316
;; B fillers: Bo ×2, Nils ×2, ranger ×2, fitter   e.g. tierA-000319 tierA-000322
;; cosine: 0.30 (gate)   JSD: 0.627   shared clusters: 4 e.g. {ranger} {Nils} {Bo} {fitter}
;; A: (And (Member $e0 work) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (CoAgent $e0 $x1))
(Implication (And (Member $e0 work) (CoAgent $e0 $x1)) (And (Member $e0 work) (Agent $e0 $x1)))

;; [different class and role]  answer.Theme ~ give.Recipient   n 11 / 14   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000212 tierA-000214
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000213 tierA-000208
;; cosine: 0.29 (gate)   JSD: 0.638   shared clusters: 3 e.g. {tower} {query} {caller}
;; A: (And (Member $e0 answer) (Theme $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrAnswerTheme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (MnGiveRecipientOrAnswerTheme $e0 $x1))

;; [same role, different class]  answer.Agent ~ give.Agent   n 11 / 15   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000207 tierA-000209
;; B fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000208 tierA-000218
;; cosine: 0.29 (gate)   JSD: 0.653   shared clusters: 3 e.g. {clerk} {pilot} {vet}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  walk.Agent ~ walk.Goal   n 13 / 7   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000183 tierA-000181
;; B fillers: pier ×2, back, child, classroom, forest, store   e.g. tierA-000182 tierB-000929
;; cosine: 0.28 (gate)   JSD: 0.762   shared clusters: 2 e.g. {pier} {child, kid}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Goal $e0 $x1))
(Implication (And (Member $e0 walk) (Goal $e0 $x1)) (And (Member $e0 walk) (Agent $e0 $x1)))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 5 / 9   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-000352 tierB-000740
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000695 tierB-001479
;; cosine: 0.27 (gate)   JSD: 0.758   shared clusters: 2 e.g. {thing} {noise}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))

;; [different class and role]  cause.Agent ~ take.Theme   n 9 / 10   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierB-000805 tierB-001089
;; B fillers: walk ×2, office, portrait, power, roller, thing   e.g. tierA-000174 tierA-000178
;; cosine: 0.27 (gate)   JSD: 0.748   shared clusters: 2 e.g. {walk} {thing}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Theme $e0 $x1))
(Implication (And (Member $e0 take) (Theme $e0 $x1)) (MnTakeThemeOrCauseAgent $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnTakeThemeOrCauseAgent $e0 $x1))

;; [different class and role]  acquire.Agent ~ buy.Theme   n 4 / 19   gate: FAIL
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000003 tierA-000017
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000006 tierA-000021
;; cosine: 0.25 (gate)   JSD: 0.697   shared clusters: 3 e.g. {depot} {chef} {pottery studio}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrAcquireAgent $e0 $x1))
(Implication (And (Member $e0 acquire) (Agent $e0 $x1)) (MnBuyThemeOrAcquireAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ purchase.Agent   n 19 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000006 tierA-000021
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000002 tierA-000016
;; cosine: 0.25 (gate)   JSD: 0.697   shared clusters: 3 e.g. {depot} {chef} {pottery studio}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrPurchaseAgent $e0 $x1))
(Implication (And (Member $e0 purchase) (Agent $e0 $x1)) (MnBuyThemeOrPurchaseAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ sell.Recipient   n 19 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000006 tierA-000021
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000004 tierA-000018
;; cosine: 0.25 (gate)   JSD: 0.697   shared clusters: 3 e.g. {depot} {chef} {pottery studio}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnBuyThemeOrSellRecipient $e0 $x1))

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; cosine: 0.24 (gate)   JSD: 0.763   shared clusters: 2 e.g. {Mark} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-000313
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-000782
;; cosine: 0.24 (gate)   JSD: 0.764   shared clusters: 2 e.g. {child, kid} {Linda}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  borrow.Agent ~ lend.Agent   n 3 / 10   gate: FAIL
;; A fillers: Ravi, crew, gallery   e.g. tierA-000302 tierA-000297
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000304 tierA-000300
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {crew} {Ravi}
;; A: (And (Member $e0 borrow) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  borrow.Source ~ lend.Recipient   n 3 / 10   gate: FAIL
;; A fillers: depot, museum, neighbour   e.g. tierA-000297 tierA-000302
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000300 tierA-000304
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {neighbour} {depot}
;; A: (And (Member $e0 borrow) (Source $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (MnLendRecipientOrBorrowSource $e0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x1)) (MnLendRecipientOrBorrowSource $e0 $x1))

;; [same role, different class]  change.Patient ~ get.Patient   n 7 / 7   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000517 tierB-001491
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; cosine: 0.24 (gate)   JSD: 0.773   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; cosine: 0.24 (gate)   JSD: 0.754   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))

;; [same class, different role]  walk.Agent ~ walk.Location   n 13 / 9   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000177 tierA-000180
;; B fillers: ridge ×2, ward ×2, dark, hallway, nurse, wood floor   e.g. tierA-000178 tierB-000148
;; cosine: 0.23 (gate)   JSD: 0.785   shared clusters: 2 e.g. {ward} {nurse}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Location $e0 $x1))
(Implication (And (Member $e0 walk) (Location $e0 $x1)) (And (Member $e0 walk) (Agent $e0 $x1)))

;; [different class and role]  learn.Source ~ teach.Recipient   n 3 / 11   gate: FAIL
;; A fillers: coach, elder, potter   e.g. tierA-000282 tierA-000287
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000285 tierA-000289
;; cosine: 0.23 (gate)   JSD: 0.682   shared clusters: 2 e.g. {potter} {coach}
;; A: (And (Member $e0 learn) (Source $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (MnTeachRecipientOrLearnSource $e0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x1)) (MnTeachRecipientOrLearnSource $e0 $x1))

;; [same role, different class]  go.Agent ~ talk.Agent   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000313 tierB-000576
;; B fillers: Daniel, Jordan Peterson, Linda, friend, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; cosine: 0.23 (gate)   JSD: 0.781   shared clusters: 2 e.g. {Linda} {Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Agent ~ teach.Agent   n 3 / 12   gate: FAIL
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000289 tierA-000285
;; cosine: 0.23 (gate)   JSD: 0.699   shared clusters: 2 e.g. {squad} {apprentice}
;; A: (And (Member $e0 learn) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  decide.Agent ~ decide.Theme   n 15 / 11   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000190 tierA-000193
;; B fillers: budget ×3, case ×3, confront, judge, new, roof   e.g. tierA-000195 tierA-000194
;; cosine: 0.23 (gate)   JSD: 0.748   shared clusters: 2 e.g. {judge} {case}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 decide) (Theme $e0 $x1))
(Implication (And (Member $e0 decide) (Theme $e0 $x1)) (And (Member $e0 decide) (Agent $e0 $x1)))

;; [different class and role]  acquire.Theme ~ buy.Agent   n 4 / 17   gate: FAIL
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000003 tierA-000017
;; B fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000006 tierA-000021
;; cosine: 0.21 (gate)   JSD: 0.675   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {crate} {lemon}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 buy) (Agent $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrAcquireTheme $e0 $x1))
(Implication (And (Member $e0 acquire) (Theme $e0 $x1)) (MnBuyAgentOrAcquireTheme $e0 $x1))

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 15   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000751
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001816 tierB-001899
;; cosine: 0.19 (gate)   JSD: 0.83   shared clusters: 2 e.g. {thing} {knock}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))

;; [different class and role]  buy.Agent ~ purchase.Theme   n 17 / 5   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000006 tierA-000021
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000002 tierA-000016
;; cosine: 0.19 (gate)   JSD: 0.7   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {crate} {lemon}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrPurchaseTheme $e0 $x1))
(Implication (And (Member $e0 purchase) (Theme $e0 $x1)) (MnBuyAgentOrPurchaseTheme $e0 $x1))

;; [different class and role]  have.Holder ~ reach.Theme   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000494 tierB-001797
;; B fillers: decision ×4, Amanda, easy ×0.5, place ×0.5   e.g. tierB-001488 tierA-000187
;; cosine: 0.18 (gate)   JSD: 0.865   shared clusters: 2 e.g. {decision} {place}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 reach) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrReachTheme $e0 $x1))
(Implication (And (Member $e0 reach) (Theme $e0 $x1)) (MnHaveHolderOrReachTheme $e0 $x1))

;; [different class and role]  cause.Agent ~ destroy.Patient   n 9 / 13   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000223 tierB-000775
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, city centre, fire, mayan book   e.g. tierA-000226 tierA-000230
;; cosine: 0.16 (gate)   JSD: 0.785   shared clusters: 2 e.g. {storm} {fire}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Patient $e0 $x1))
(Implication (And (Member $e0 destroy) (Patient $e0 $x1)) (MnDestroyPatientOrCauseAgent $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnDestroyPatientOrCauseAgent $e0 $x1))

;; [different class and role]  have.Holder ~ make.Patient   n 34 / 24   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000790 tierB-001016
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001594 tierB-000371
;; cosine: 0.15 (gate)   JSD: 0.874   shared clusters: 4 e.g. {decision} {house} {room} {bad}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))

;; [different class and role]  buy.Agent ~ sell.Theme   n 17 / 9   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000006 tierA-000021
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000004 tierA-000018
;; cosine: 0.15 (gate)   JSD: 0.763   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {crate} {lemon}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrSellTheme $e0 $x1))
(Implication (And (Member $e0 sell) (Theme $e0 $x1)) (MnBuyAgentOrSellTheme $e0 $x1))

;; [different class and role]  cause.Agent ~ get.Patient   n 9 / 7   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000228 tierB-001089
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000890 tierB-000370
;; cosine: 0.14 (gate)   JSD: 0.824   shared clusters: 2 e.g. {fire} {thing}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnCauseAgentOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnCauseAgentOrGetPatient $e0 $x1))

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 22   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-001773
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001182
;; cosine: 0.14 (gate)   JSD: 0.86   shared clusters: 2 e.g. {thing} {man}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 22   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; cosine: 0.14 (gate)   JSD: 0.857   shared clusters: 2 e.g. {James} {Damiano}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [same class, different role]  give.Agent ~ give.Recipient   n 15 / 14   gate: FAIL
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000271 tierA-000273
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000274 tierA-000261
;; cosine: 0.13 (gate)   JSD: 0.81   shared clusters: 2 e.g. {foreman} {driver}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (And (Member $e0 give) (Agent $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000098 tierB-001217
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000722 tierB-000162
;; cosine: 0.13 (gate)   JSD: 0.889   shared clusters: 2 e.g. {color} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))

;; [same role, different class]  make.Agent ~ walk.Agent   n 22 / 13   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierA-000173
;; cosine: 0.12 (gate)   JSD: 0.884   shared clusters: 2 e.g. {customer} {Hanako}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Theme ~ speak.Theme   n 6 / 4   gate: FAIL
;; A fillers: berber, drill, glazing, song, vocabulary, foreign ×0.5   e.g. tierB-000608 tierB-000229
;; B fillers: czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-001068 tierB-000271
;; cosine: 0.11 (gate)   JSD: 0.798   shared clusters: 2 e.g. {foreign} {language}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-000565 tierB-001920
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000790 tierB-001264
;; cosine: 0.11 (gate)   JSD: 0.896   shared clusters: 2 e.g. {weather} {room}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))

;; [same role, different class]  make.Agent ~ try.Agent   n 22 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000117
;; cosine: 0.10 (gate)   JSD: 0.887   shared clusters: 2 e.g. {David} {man}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001658 tierB-000370
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001553 tierB-000162
;; cosine: 0.09 (gate)   JSD: 0.914   shared clusters: 2 e.g. {day} {thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))

;; [different class and role]  create.Patient ~ use.Theme   n 3 / 17   gate: FAIL
;; A fillers: particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-000938 tierB-000282
;; cosine: 0.09 (gate)   JSD: 0.88   shared clusters: 2 e.g. {calendar} {various}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 39 / 7   gate: FAIL
;; A fillers: here ×3, city ×2, class ×2, garden ×2, full ×1.5, Algiers   e.g. tierB-001111 tierB-000523
;; B fillers: animal, cake, ivy, plant, play, student association   e.g. tierB-001966 tierB-001932
;; cosine: 0.08 (gate)   JSD: 0.908   shared clusters: 2 e.g. {play} {street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  have.Holder ~ use.Theme   n 34 / 17   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-000142
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001378 tierB-000971
;; cosine: 0.08 (gate)   JSD: 0.919   shared clusters: 2 e.g. {room} {sentence}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 24   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000904
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001431 tierB-001504
;; cosine: 0.08 (gate)   JSD: 0.896   shared clusters: 2 e.g. {beautiful} {room}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 24   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001594 tierB-001457
;; cosine: 0.08 (gate)   JSD: 0.901   shared clusters: 2 e.g. {bad} {big}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  answer.Agent ~ give.Recipient   n 11 / 14   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000210 tierA-000221
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000208 tierA-000218
;; cosine: 0.07 (gate)   JSD: 0.839   shared clusters: 2 e.g. {query} {caller}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrAnswerAgent $e0 $x1))
(Implication (And (Member $e0 answer) (Agent $e0 $x1)) (MnGiveRecipientOrAnswerAgent $e0 $x1))

;; [different class and role]  answer.Theme ~ give.Agent   n 11 / 15   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000210 tierA-000221
;; B fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000208 tierA-000218
;; cosine: 0.07 (gate)   JSD: 0.845   shared clusters: 2 e.g. {clerk} {vet}
;; A: (And (Member $e0 answer) (Theme $e0 $x1))
;; B: (And (Member $e0 give) (Agent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnGiveAgentOrAnswerTheme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (MnGiveAgentOrAnswerTheme $e0 $x1))

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000770
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000470 tierB-000400
;; cosine: 0.07 (gate)   JSD: 0.873   shared clusters: 2 e.g. {man} {young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  make.Patient ~ make.Result   n 24 / 7   gate: FAIL
;; A fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001594 tierB-001920
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001754 tierB-000325
;; cosine: 0.07 (gate)   JSD: 0.91   shared clusters: 2 e.g. {bad} {beautiful}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Agent   n 35 / 22   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001264
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001920
;; cosine: 0.06 (gate)   JSD: 0.941   shared clusters: 2 e.g. {thing} {curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))

;; [different class and role]  have.Theme ~ start.Patient   n 35 / 15   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001940 tierB-001816
;; cosine: 0.06 (gate)   JSD: 0.94   shared clusters: 2 e.g. {thing} {blue}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 34   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000790 tierB-000902
;; cosine: 0.06 (gate)   JSD: 0.936   shared clusters: 2 e.g. {bad} {weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))

;; [same role, different class]  start.Patient ~ turn.Patient   n 15 / 7   gate: FAIL
;; A fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-000654 tierB-001446
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000018
;; cosine: 0.06 (gate)   JSD: 0.905   shared clusters: 2 e.g. {freedom movement} {gusher}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Theme ~ have.Holder   n 19 / 34   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierB-001690 tierB-000368
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001016 tierB-001103
;; cosine: 0.06 (gate)   JSD: 0.923   shared clusters: 2 e.g. {house} {food}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 24   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001431 tierB-001504
;; cosine: 0.05 (gate)   JSD: 0.917   shared clusters: 2 e.g. {house} {comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 21   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000320 tierA-000316
;; cosine: 0.04 (gate)   JSD: 0.906   shared clusters: 2 e.g. {adaptor} {old}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only
