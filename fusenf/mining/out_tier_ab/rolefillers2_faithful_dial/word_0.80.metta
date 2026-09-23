;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful.metta
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
;;   gate            indistinguishable = Jensen-Shannon divergence <= 0.3 between the two raw cluster distributions (0 = identical, 1 = disjoint),
;;                   with >= 2 shared clusters; JSD <= 0.4 is the sensitivity value (dial table in the .md report);
;;                   cosine >= 0.5 is the reference gate, rendered beside this file with the suffix _cosine
;;
;; RECORD FORMAT (every record is one pair, with its gate verdict)
;;   ;; [bucket]  A ~ B   n <embedded fillers of A> / <of B>   gate: PASS|FAIL
;;   ;; A fillers: the top fillers of A by mass (×mass when not 1)   e.g. <witness record ids>
;;   ;; B fillers: the same for B
;;   ;; JSD: <value>   shared clusters: <count> e.g. {cluster members} …
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

;; ==================== SLOT PAIRS: 28 pass the gate (event 28, entity 0); 235 pairs listed = every pair with >= 2 shared clusters (event 234, entity 1) among the 30942 pairs of 249 event slots and 12 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same role, different class]  acquire.Agent ~ purchase.Agent   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000017 tierA-000024
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000016 tierA-000023
;; JSD: 0.0   shared clusters: 4 e.g. {chef, cook} {pottery studio} {school, university, campus, college, …} {depot}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  acquire.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000017 tierA-000024
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000018 tierA-000025
;; JSD: 0.0   shared clusters: 4 e.g. {chef, cook} {pottery studio} {school, university, campus, college, …} {depot}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 acquire) (Agent $e0 $x1)) (MnAcquireAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnAcquireAgentOrSellRecipient $e0 $x1))

;; [different class and role]  purchase.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000016 tierA-000023
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000018 tierA-000025
;; JSD: 0.0   shared clusters: 4 e.g. {chef, cook} {pottery studio} {school, university, campus, college, …} {depot}
;; A: (And (Member $e0 purchase) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 purchase) (Agent $e0 $x1)) (MnPurchaseAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnPurchaseAgentOrSellRecipient $e0 $x1))

;; [same role, different class]  borrow.Theme ~ lend.Theme   n 3 / 10   gate: PASS
;; A fillers: generator, ladder, painting   e.g. tierA-000302 tierA-000307
;; B fillers: ladder ×4, generator ×3, painting ×3   e.g. tierA-000301 tierA-000303
;; JSD: 0.003   shared clusters: 3 e.g. {ladder, ladders} {generator, generate} {painting, paint, paintings}
;; A: (And (Member $e0 borrow) (Theme $e0 $x1))
;; B: (And (Member $e0 lend) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  need.Holder ~ require.Holder   n 3 / 8   gate: PASS
;; A fillers: lathe, permit, recipe   e.g. tierA-000090 tierA-000085
;; B fillers: permit ×3, recipe ×3, lathe ×2   e.g. tierA-000089 tierA-000091
;; JSD: 0.006   shared clusters: 3 e.g. {use, permit, well, do, …} {recipe} {lathe}
;; A: (And (Member $e0 need) (Holder $e0 $x1))
;; B: (And (Member $e0 require) (Holder $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  postpone.Agent ~ put_off.Agent   n 7 / 3   gate: PASS
;; A fillers: club ×3, board ×2, ferry ×2   e.g. tierA-000123 tierA-000125
;; B fillers: board, club, ferry   e.g. tierA-000124 tierA-000115
;; JSD: 0.007   shared clusters: 3 e.g. {club, squad, team} {board, panel} {ferry, fishing boat}
;; A: (And (Member $e0 postpone) (Agent $e0 $x1))
;; B: (And (Member $e0 put_off) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  postpone.Theme ~ put_off.Theme   n 7 / 3   gate: PASS
;; A fillers: tournament ×3, departure ×2, vote ×2   e.g. tierA-000119 tierA-000122
;; B fillers: departure, tournament, vote   e.g. tierA-000120 tierA-000124
;; JSD: 0.007   shared clusters: 3 e.g. {tournament} {arrive, departure, arrival, depart} {vote, election}
;; A: (And (Member $e0 postpone) (Theme $e0 $x1))
;; B: (And (Member $e0 put_off) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  allow.Agent ~ permit.Agent   n 4 / 3   gate: PASS
;; A fillers: licence ×2, curator, warden   e.g. tierA-000075 tierA-000076
;; B fillers: curator, licence, warden   e.g. tierA-000073 tierA-000077
;; JSD: 0.021   shared clusters: 3 e.g. {licence} {warden} {curator}
;; A: (And (Member $e0 allow) (Agent $e0 $x1))
;; B: (And (Member $e0 permit) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  allow.Theme ~ permit.Theme   n 4 / 3   gate: PASS
;; A fillers: night delivery ×2, photography, visitor   e.g. tierA-000075 tierA-000080
;; B fillers: night delivery, photography, visitor   e.g. tierA-000073 tierA-000081
;; JSD: 0.021   shared clusters: 3 e.g. {night delivery, deliver, delivery} {visitor, visit, guest} {camera, photography}
;; A: (And (Member $e0 allow) (Theme $e0 $x1))
;; B: (And (Member $e0 permit) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  call_off.Agent ~ cancel.Agent   n 3 / 9   gate: PASS
;; A fillers: airline, council, tutor   e.g. tierA-000144 tierA-000154
;; B fillers: council ×3, tutor ×3, airline ×2, physician   e.g. tierA-000143 tierA-000145
;; JSD: 0.064   shared clusters: 3 e.g. {teach, tutor} {committee, council} {plane, airline, flight, aeroplane, …}
;; A: (And (Member $e0 call_off) (Agent $e0 $x1))
;; B: (And (Member $e0 cancel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  discover.Experiencer ~ discover.Stimulus   n 3 / 3   gate: PASS
;; A fillers: auditor ×2, error   e.g. tierA-000132 tierA-000128
;; B fillers: error ×2, auditor   e.g. tierA-000130 tierA-000128
;; JSD: 0.082   shared clusters: 2 e.g. {error, catch, throw} {auditor}
;; A: (And (Member $e0 discover) (Experiencer $e0 $x1))
;; B: (And (Member $e0 discover) (Stimulus $e0 $x1))
(Implication (And (Member $e0 discover) (Stimulus $e0 $x1)) (And (Member $e0 discover) (Experiencer $e0 $x1)))

;; [same role, different class]  acquire.Theme ~ purchase.Theme   n 4 / 5   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000017 tierA-000024
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000016 tierA-000023
;; JSD: 0.108   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  borrow.Agent ~ lend.Recipient   n 3 / 10   gate: PASS
;; A fillers: Ravi, crew, gallery   e.g. tierA-000302 tierA-000297
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000301 tierA-000303
;; JSD: 0.113   shared clusters: 3 e.g. {Ravi} {gallery} {crew}
;; A: (And (Member $e0 borrow) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (MnLendRecipientOrBorrowAgent $e0 $x1))
(Implication (And (Member $e0 borrow) (Agent $e0 $x1)) (MnLendRecipientOrBorrowAgent $e0 $x1))

;; [different class and role]  borrow.Source ~ lend.Agent   n 3 / 10   gate: PASS
;; A fillers: depot, museum, neighbour   e.g. tierA-000297 tierA-000307
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000296 tierA-000298
;; JSD: 0.113   shared clusters: 3 e.g. {neighbour, next door} {museum, museum, worth} {depot}
;; A: (And (Member $e0 borrow) (Source $e0 $x1))
;; B: (And (Member $e0 lend) (Agent $e0 $x1))
(Implication (And (Member $e0 lend) (Agent $e0 $x1)) (MnLendAgentOrBorrowSource $e0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x1)) (MnLendAgentOrBorrowSource $e0 $x1))

;; [same class, different role]  repair.Agent ~ repair.Patient   n 8 / 9   gate: PASS
;; A fillers: electrician ×2, mechanic ×2, crew, yard floodlight, cracked ×0.5, feed pipe ×0.5   e.g. tierA-000034 tierA-000051
;; B fillers: yard floodlight ×2, crew, electrician, gearbox, mechanic, seized   e.g. tierA-000029 tierA-000032
;; JSD: 0.116   shared clusters: 8 e.g. {mechanic} {electrician} {yard floodlight} {crew}
;; A: (And (Member $e0 repair) (Agent $e0 $x1))
;; B: (And (Member $e0 repair) (Patient $e0 $x1))
(Implication (And (Member $e0 repair) (Agent $e0 $x1)) (And (Member $e0 repair) (Patient $e0 $x1)))

;; [same role, different class]  reject.Agent ~ turn_down.Agent   n 8 / 3   gate: PASS
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000168 tierA-000170
;; B fillers: bank, editor, panel   e.g. tierA-000169 tierA-000164
;; JSD: 0.138   shared clusters: 3 e.g. {board, panel} {bank, banking industry} {editor, editorial staff}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  reject.Theme ~ turn_down.Theme   n 8 / 3   gate: PASS
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000163 tierA-000165
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000164 tierA-000169
;; JSD: 0.138   shared clusters: 3 e.g. {loan application, apply} {proposal, provide, proposition, prove, …} {manuscript}
;; A: (And (Member $e0 reject) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Agent ~ give_up.Agent   n 8 / 4   gate: PASS
;; A fillers: climber ×3, firm ×3, rescue team ×2   e.g. tierA-000109 tierA-000111
;; B fillers: Bob, climber, firm, rescue team   e.g. tierA-000110 tierA-000100
;; JSD: 0.143   shared clusters: 3 e.g. {climber, climb, climbers} {company, firm, organisation, corporation} {rescue team}
;; A: (And (Member $e0 abandon) (Agent $e0 $x1))
;; B: (And (Member $e0 give_up) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Theme ~ give_up.Theme   n 8 / 4   gate: PASS
;; A fillers: north route ×3, tender ×3, search ×2   e.g. tierA-000104 tierA-000106
;; B fillers: north route, search, smoke, tender   e.g. tierA-000105 tierA-000100
;; JSD: 0.143   shared clusters: 3 e.g. {tender} {north route, west, north} {search, find, seek, searches}
;; A: (And (Member $e0 abandon) (Theme $e0 $x1))
;; B: (And (Member $e0 give_up) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  decide.Theme ~ decision.Theme   n 11 / 6   gate: PASS
;; A fillers: budget ×3, case ×3, confront, judge, new, roof   e.g. tierA-000201 tierA-000204
;; B fillers: budget ×2, case ×2, new, roof   e.g. tierA-000202 tierA-000203
;; JSD: 0.157   shared clusters: 4 e.g. {budget, spend} {case, switch} {new, brand new, language, new, new, product} {roof, new, roof, conical, roof}
;; A: (And (Member $e0 decide) (Theme $e0 $x1))
;; B: (And (Member $e0 decision) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  learn.Agent ~ teach.Recipient   n 3 / 11   gate: PASS
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000286 tierA-000288
;; JSD: 0.157   shared clusters: 3 e.g. {apprentice} {child, children, kid, baby, …} {club, squad, team}
;; A: (And (Member $e0 learn) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (MnTeachRecipientOrLearnAgent $e0 $x1))
(Implication (And (Member $e0 learn) (Agent $e0 $x1)) (MnTeachRecipientOrLearnAgent $e0 $x1))

;; [different class and role]  learn.Source ~ teach.Agent   n 3 / 12   gate: PASS
;; A fillers: coach, elder, potter   e.g. tierA-000287 tierA-000292
;; B fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000286 tierA-000288
;; JSD: 0.196   shared clusters: 3 e.g. {old, elder, aging, ages ago, …} {potter} {coach, trainer}
;; A: (And (Member $e0 learn) (Source $e0 $x1))
;; B: (And (Member $e0 teach) (Agent $e0 $x1))
(Implication (And (Member $e0 teach) (Agent $e0 $x1)) (MnTeachAgentOrLearnSource $e0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x1)) (MnTeachAgentOrLearnSource $e0 $x1))

;; [same role, different class]  acquire.Agent ~ buy.Agent   n 4 / 17   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000017 tierA-000024
;; B fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000015 tierA-000019
;; JSD: 0.208   shared clusters: 4 e.g. {pottery studio} {school, university, campus, college, …} {depot} {chef, cook}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Agent ~ purchase.Agent   n 17 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000015 tierA-000019
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000016 tierA-000023
;; JSD: 0.208   shared clusters: 4 e.g. {pottery studio} {school, university, campus, college, …} {depot} {chef, cook}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Agent ~ sell.Recipient   n 17 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000015 tierA-000019
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000018 tierA-000025
;; JSD: 0.208   shared clusters: 4 e.g. {pottery studio} {school, university, campus, college, …} {depot} {chef, cook}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnBuyAgentOrSellRecipient $e0 $x1))

;; [same role, different class]  begin.Patient ~ commence.Patient   n 11 / 4   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000052 tierA-000055
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000054 tierA-000064
;; JSD: 0.221   shared clusters: 4 e.g. {shoreline survey} {dress rehearsal} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 commence) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  call_off.Patient ~ cancel.Patient   n 3 / 7   gate: PASS
;; A fillers: afternoon session, game, summer fair   e.g. tierA-000154 tierA-000149
;; B fillers: afternoon session ×3, summer fair ×3, evening flight   e.g. tierA-000153 tierA-000155
;; JSD: 0.247   shared clusters: 2 e.g. {afternoon session} {summer fair}
;; A: (And (Member $e0 call_off) (Patient $e0 $x1))
;; B: (And (Member $e0 cancel) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  acquire.Theme ~ buy.Theme   n 4 / 19   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000017 tierA-000024
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000015 tierA-000019
;; JSD: 0.255   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: FAIL
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000747 tierB-000425
;; B fillers: on, open, unlocked   e.g. tierB-000004 tierB-000747
;; JSD: 0.311   shared clusters: 3 e.g. {unlocked, locked, lock, door, locked} {open, close, end, closed} {use, permit, well, do, …}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same class, different role]  reject.Agent ~ reject.Theme   n 8 / 8   gate: FAIL
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000166 tierA-000163
;; B fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000165 tierA-000162
;; JSD: 0.311   shared clusters: 4 e.g. {loan application, apply} {bank, banking industry} {editor, editorial staff} {manuscript}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 reject) (Theme $e0 $x1))
(Implication (And (Member $e0 reject) (Theme $e0 $x1)) (And (Member $e0 reject) (Agent $e0 $x1)))

;; [same role, different class]  decide.Agent ~ reach.Agent   n 15 / 6   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000190 tierA-000193
;; B fillers: David, board, committee, family, judge, jury   e.g. tierA-000192 tierB-001082
;; JSD: 0.314   shared clusters: 4 e.g. {judge, jury, just} {board, panel} {committee, council} {family, family business, families}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 reach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Theme ~ purchase.Theme   n 19 / 5   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000015 tierA-000019
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000016 tierA-000023
;; JSD: 0.327   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  commence.Patient ~ end.Patient   n 4 / 5   gate: FAIL
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000054 tierA-000069
;; B fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000056 tierA-000071
;; JSD: 0.331   shared clusters: 3 e.g. {shoreline survey} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 commence) (Patient $e0 $x1))
;; B: (And (Member $e0 end) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Agent ~ turn_down.Agent   n 3 / 3   gate: FAIL
;; A fillers: Antonio, editor, panel   e.g. tierA-000172 tierA-000161
;; B fillers: bank, editor, panel   e.g. tierA-000169 tierA-000159
;; JSD: 0.333   shared clusters: 2 e.g. {board, panel} {editor, editorial staff}
;; A: (And (Member $e0 accept) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Theme ~ turn_down.Theme   n 3 / 3   gate: FAIL
;; A fillers: invitation, manuscript, proposal   e.g. tierA-000172 tierA-000161
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000169 tierA-000159
;; JSD: 0.333   shared clusters: 2 e.g. {proposal, provide, proposition, prove, …} {manuscript}
;; A: (And (Member $e0 accept) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  arrival.Agent ~ depart.Agent   n 3 / 3   gate: FAIL
;; A fillers: delegation, french settler, soil sample   e.g. tierA-000246 tierA-000242
;; B fillers: delegation, soil sample, train   e.g. tierA-000247 tierA-000244
;; JSD: 0.333   shared clusters: 2 e.g. {soil sample, soil, soil samples} {delegation}
;; A: (And (Member $e0 arrival) (Agent $e0 $x1))
;; B: (And (Member $e0 depart) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Theme ~ teach.Theme   n 6 / 11   gate: FAIL
;; A fillers: berber, drill, glazing, song, vocabulary, foreign ×0.5   e.g. tierA-000287 tierA-000282
;; B fillers: glazing ×4, drill ×3, song ×3, phrase   e.g. tierA-000286 tierA-000288
;; JSD: 0.341   shared clusters: 3 e.g. {glazing, glass, glass, real} {drill} {song, sing, chant}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 teach) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  sign.Agent ~ sign.Patient   n 5 / 5   gate: FAIL
;; A fillers: physician ×2, author, chart, doctor   e.g. tierA-000375 tierA-000376
;; B fillers: chart ×3, limited edition, physician   e.g. tierA-000378 tierA-000377
;; JSD: 0.351   shared clusters: 2 e.g. {physician, doctor, doctors} {chart, plot, draw}
;; A: (And (Member $e0 sign) (Agent $e0 $x1))
;; B: (And (Member $e0 sign) (Patient $e0 $x1))
(Implication (And (Member $e0 sign) (Patient $e0 $x1)) (And (Member $e0 sign) (Agent $e0 $x1)))

;; [same role, different class]  acquire.Theme ~ sell.Theme   n 4 / 9   gate: FAIL
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000017 tierA-000024
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000018 tierA-000025
;; JSD: 0.357   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  abandon.Agent ~ continue.Agent   n 8 / 3   gate: FAIL
;; A fillers: climber ×3, firm ×3, rescue team ×2   e.g. tierA-000109 tierA-000111
;; B fillers: climber, price, rescue team   e.g. tierA-000113 tierA-000102
;; JSD: 0.359   shared clusters: 2 e.g. {climber, climb, climbers} {rescue team}
;; A: (And (Member $e0 abandon) (Agent $e0 $x1))
;; B: (And (Member $e0 continue) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ receive.Source   n 15 / 4   gate: FAIL
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000261 tierA-000263
;; B fillers: foreman, school, trainer, car dealer ×0.5, local ×0.5   e.g. tierA-000262 tierA-000277
;; JSD: 0.375   shared clusters: 3 e.g. {coach, trainer} {school, university, campus, college, …} {foreman}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 receive) (Source $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnGiveAgentOrReceiveSource $e0 $x1))
(Implication (And (Member $e0 receive) (Source $e0 $x1)) (MnGiveAgentOrReceiveSource $e0 $x1))

;; [same class, different role]  lend.Agent ~ lend.Recipient   n 10 / 10   gate: FAIL
;; A fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000304 tierA-000300
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000301 tierA-000303
;; JSD: 0.4   shared clusters: 4 e.g. {Ravi} {neighbour, next door} {crew} {depot}
;; A: (And (Member $e0 lend) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (And (Member $e0 lend) (Agent $e0 $x1)))

;; [same role, different class]  purchase.Theme ~ sell.Theme   n 5 / 9   gate: FAIL
;; A fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000016 tierA-000023
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000018 tierA-000025
;; JSD: 0.415   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 purchase) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Agent ~ reject.Agent   n 3 / 8   gate: FAIL
;; A fillers: Antonio, editor, panel   e.g. tierA-000172 tierA-000161
;; B fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000168 tierA-000170
;; JSD: 0.425   shared clusters: 2 e.g. {board, panel} {editor, editorial staff}
;; A: (And (Member $e0 accept) (Agent $e0 $x1))
;; B: (And (Member $e0 reject) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accept.Theme ~ reject.Theme   n 3 / 8   gate: FAIL
;; A fillers: invitation, manuscript, proposal   e.g. tierA-000172 tierA-000161
;; B fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000168 tierA-000170
;; JSD: 0.425   shared clusters: 2 e.g. {proposal, provide, proposition, prove, …} {manuscript}
;; A: (And (Member $e0 accept) (Theme $e0 $x1))
;; B: (And (Member $e0 reject) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  continue.Agent ~ give_up.Agent   n 3 / 4   gate: FAIL
;; A fillers: climber, price, rescue team   e.g. tierA-000113 tierA-000102
;; B fillers: Bob, climber, firm, rescue team   e.g. tierA-000110 tierA-000100
;; JSD: 0.425   shared clusters: 2 e.g. {climber, climb, climbers} {rescue team}
;; A: (And (Member $e0 continue) (Agent $e0 $x1))
;; B: (And (Member $e0 give_up) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  destroy.Agent ~ save.Agent   n 10 / 3   gate: FAIL
;; A fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000232 tierA-000234
;; B fillers: fire, flood, boy ×0.5, tall ×0.5   e.g. tierA-000235 tierA-000231
;; JSD: 0.429   shared clusters: 2 e.g. {fire, flame, burn, scorch, …} {flood}
;; A: (And (Member $e0 destroy) (Agent $e0 $x1))
;; B: (And (Member $e0 save) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Recipient ~ receive.Agent   n 14 / 7   gate: FAIL
;; A fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000276 tierA-000278
;; B fillers: winner ×2, Beth, General Franks, driver, recruit, refugee   e.g. tierA-000277 tierB-001693
;; JSD: 0.437   shared clusters: 3 e.g. {winner, win, award} {recruit} {driver, drive}
;; A: (And (Member $e0 give) (Recipient $e0 $x1))
;; B: (And (Member $e0 receive) (Agent $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrReceiveAgent $e0 $x1))
(Implication (And (Member $e0 receive) (Agent $e0 $x1)) (MnGiveRecipientOrReceiveAgent $e0 $x1))

;; [same class, different role]  answer.Agent ~ answer.Theme   n 11 / 11   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000210 tierA-000221
;; B fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000207 tierA-000209
;; JSD: 0.438   shared clusters: 4 e.g. {query, question, questions, ask, …} {clerk} {caller, call, telephone call, call for} {vet, van}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 answer) (Theme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (And (Member $e0 answer) (Agent $e0 $x1)))

;; [same role, different class]  abandon.Theme ~ continue.Theme   n 8 / 4   gate: FAIL
;; A fillers: north route ×3, tender ×3, search ×2   e.g. tierA-000099 tierA-000101
;; B fillers: climb, north route, search, shine   e.g. tierA-000102 tierA-000113
;; JSD: 0.447   shared clusters: 2 e.g. {north route, west, north} {search, find, seek, searches}
;; A: (And (Member $e0 abandon) (Theme $e0 $x1))
;; B: (And (Member $e0 continue) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  destroy.Agent ~ destroy.Patient   n 10 / 13   gate: FAIL
;; A fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000222 tierA-000224
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, city centre, fire, mayan book   e.g. tierA-000226 tierA-000223
;; JSD: 0.452   shared clusters: 4 e.g. {greenhouse, hothouse condition, hothouse conditions} {fire, flame, burn, scorch, …} {archive} {storm, soon, thunder, typhoon}
;; A: (And (Member $e0 destroy) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Patient $e0 $x1))
(Implication (And (Member $e0 destroy) (Agent $e0 $x1)) (And (Member $e0 destroy) (Patient $e0 $x1)))

;; [same class, different role]  order.Agent ~ order.Theme   n 6 / 6   gate: FAIL
;; A fillers: physician ×2, dictator, doctor, professor, scan   e.g. tierA-000385 tierA-000386
;; B fillers: scan ×3, book, physician, full scale ×0.5, invasion ×0.5   e.g. tierA-000389 tierA-000387
;; JSD: 0.459   shared clusters: 2 e.g. {physician, doctor, doctors} {scan}
;; A: (And (Member $e0 order) (Agent $e0 $x1))
;; B: (And (Member $e0 order) (Theme $e0 $x1))
(Implication (And (Member $e0 order) (Theme $e0 $x1)) (And (Member $e0 order) (Agent $e0 $x1)))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000125
;; JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cause.Agent ~ destroy.Agent   n 9 / 10   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000233 tierA-000223
;; B fillers: fire ×3, flood ×2, storm ×2, archive, conquistador, greenhouse   e.g. tierA-000232 tierA-000234
;; JSD: 0.47   shared clusters: 3 e.g. {storm, soon, thunder, typhoon} {fire, flame, burn, scorch, …} {flood}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000756
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; JSD: 0.475   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {David, William, James, Donald, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnTryAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnTryAgentOrHearExperiencer $e0 $x1))

;; [same class, different role]  teach.Agent ~ teach.Recipient   n 12 / 11   gate: FAIL
;; A fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000289 tierA-000285
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000286 tierA-000288
;; JSD: 0.478   shared clusters: 4 e.g. {apprentice} {potter} {club, squad, team} {coach, trainer}
;; A: (And (Member $e0 teach) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (And (Member $e0 teach) (Agent $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 9 / 6   gate: FAIL
;; A fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.482   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 play) (Agent $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))

;; [same class, different role]  buy.Agent ~ buy.Theme   n 17 / 19   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000021 tierA-000027
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000015 tierA-000019
;; JSD: 0.486   shared clusters: 7 e.g. {kiln} {pottery studio} {forklift, forklifts} {depot}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (And (Member $e0 buy) (Theme $e0 $x1)))

;; [same role, different class]  begin.Patient ~ end.Patient   n 11 / 5   gate: FAIL
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000052 tierA-000055
;; B fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000056 tierA-000071
;; JSD: 0.488   shared clusters: 3 e.g. {shoreline survey} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 end) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  give.Theme ~ receive.Theme   n 15 / 7   gate: FAIL
;; A fillers: answer ×3, manifest ×3, medal ×3, whistle ×3, chocolate, mock champagne   e.g. tierA-000271 tierA-000273
;; B fillers: award, honorary knighthood, manifest, medal, permit, whistle   e.g. tierA-000272 tierA-000277
;; JSD: 0.496   shared clusters: 3 e.g. {manifest} {medal, medals} {whistle, whistles}
;; A: (And (Member $e0 give) (Theme $e0 $x1))
;; B: (And (Member $e0 receive) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  need.Theme ~ require.Theme   n 8 / 14   gate: FAIL
;; A fillers: countersignature, egg, generate, go, monthly servicing, paint   e.g. tierA-000090 tierA-000085
;; B fillers: egg ×4, countersignature ×3, monthly servicing ×3, american phone number, repair, hard ×0.5   e.g. tierA-000089 tierA-000091
;; JSD: 0.496   shared clusters: 3 e.g. {egg, eggs} {countersignature, sign, countersignatures} {monthly servicing}
;; A: (And (Member $e0 need) (Theme $e0 $x1))
;; B: (And (Member $e0 require) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Theme ~ sell.Theme   n 19 / 9   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000015 tierA-000019
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000018 tierA-000025
;; JSD: 0.497   shared clusters: 5 e.g. {kiln} {projector, projectors} {forklift, forklifts} {crate}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  continue.Theme ~ give_up.Theme   n 4 / 4   gate: FAIL
;; A fillers: climb, north route, search, shine   e.g. tierA-000102 tierA-000113
;; B fillers: north route, search, smoke, tender   e.g. tierA-000100 tierA-000110
;; JSD: 0.5   shared clusters: 2 e.g. {search, find, seek, searches} {north route, west, north}
;; A: (And (Member $e0 continue) (Theme $e0 $x1))
;; B: (And (Member $e0 give_up) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  commence.Patient ~ start.Patient   n 4 / 15   gate: FAIL
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000054 tierA-000064
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000053 tierA-000063
;; JSD: 0.53   shared clusters: 4 e.g. {shoreline survey} {dress rehearsal} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 commence) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-001658
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; JSD: 0.531   shared clusters: 4 e.g. {bad, bad, matter, bad, problem} {expensive, expensive, thing} {cheap, inexpensive, low, price} {short, shortening}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [same role, different class]  make.Agent ~ reach.Agent   n 22 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierA-000191 tierA-000202
;; B fillers: David, board, committee, family, judge, jury   e.g. tierA-000192 tierB-001082
;; JSD: 0.541   shared clusters: 5 e.g. {judge, jury, just} {David, William, James, Donald, …} {board, panel} {family, family business, families}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 reach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  answer.Agent ~ give.Agent   n 11 / 15   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000217 tierA-000219
;; B fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000218 tierA-000213
;; JSD: 0.544   shared clusters: 4 e.g. {pilot, pilot error, pilot errors} {clerk} {vet, van} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.547   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000916
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [same role, different class]  take.Agent ~ walk.Agent   n 10 / 13   gate: FAIL
;; A fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierA-000178 tierA-000182
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000177 tierA-000181
;; JSD: 0.563   shared clusters: 5 e.g. {nurse} {child, children, kid, baby, …} {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-000410 tierB-001551
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.569   shared clusters: 2 e.g. {child, children, kid, baby, …} {dog, dog feed}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 6   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.569   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-001169
;; JSD: 0.57   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {girl, girls, girl, little}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  arrival.Agent ~ arrive.Agent   n 3 / 10   gate: FAIL
;; A fillers: delegation, french settler, soil sample   e.g. tierA-000246 tierA-000242
;; B fillers: freight ×3, delegation ×2, Donald, driver, paris train, soil sample   e.g. tierA-000245 tierA-000241
;; JSD: 0.577   shared clusters: 2 e.g. {delegation} {soil sample, soil, soil samples}
;; A: (And (Member $e0 arrival) (Agent $e0 $x1))
;; B: (And (Member $e0 arrive) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  arrive.Agent ~ depart.Agent   n 10 / 3   gate: FAIL
;; A fillers: freight ×3, delegation ×2, Donald, driver, paris train, soil sample   e.g. tierA-000245 tierA-000241
;; B fillers: delegation, soil sample, train   e.g. tierA-000247 tierA-000244
;; JSD: 0.577   shared clusters: 2 e.g. {delegation} {soil sample, soil, soil samples}
;; A: (And (Member $e0 arrive) (Agent $e0 $x1))
;; B: (And (Member $e0 depart) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ hear.Experiencer   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHearExperiencerOrGetAgent $e0 $x1))

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000654 tierB-001675
;; JSD: 0.599   shared clusters: 4 e.g. {black, blue, brown, gray, …} {gusher} {yellow, orange} {red, ridge, rag, rip, …}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [different class and role]  die.Patient ~ watch.Agent   n 5 / 5   gate: FAIL
;; A fillers: founder ×2, family, person, elm ×0.5, last ×0.5   e.g. tierB-001967 tierB-000838
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; JSD: 0.6   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (MnDiePatientOrWatchAgent $e0 $x1))
(Implication (And (Member $e0 watch) (Agent $e0 $x1)) (MnDiePatientOrWatchAgent $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.605   shared clusters: 3 e.g. {child, children, kid, baby, …} {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  begin.Patient ~ start.Patient   n 11 / 15   gate: FAIL
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierA-000052 tierA-000055
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000053 tierA-000063
;; JSD: 0.61   shared clusters: 4 e.g. {shoreline survey} {dress rehearsal} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  borrow.Theme ~ need.Theme   n 3 / 8   gate: FAIL
;; A fillers: generator, ladder, painting   e.g. tierA-000302 tierA-000307
;; B fillers: countersignature, egg, generate, go, monthly servicing, paint   e.g. tierB-000107 tierB-000455
;; JSD: 0.613   shared clusters: 2 e.g. {generator, generate} {painting, paint, paintings}
;; A: (And (Member $e0 borrow) (Theme $e0 $x1))
;; B: (And (Member $e0 need) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  reject.Agent ~ turn_down.Theme   n 8 / 3   gate: FAIL
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000166 tierA-000162
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000164 tierA-000159
;; JSD: 0.613   shared clusters: 2 e.g. {loan application, apply} {manuscript}
;; A: (And (Member $e0 reject) (Agent $e0 $x1))
;; B: (And (Member $e0 turn_down) (Theme $e0 $x1))
(Implication (And (Member $e0 reject) (Agent $e0 $x1)) (MnRejectAgentOrTurnDownTheme $e0 $x1))
(Implication (And (Member $e0 turn_down) (Theme $e0 $x1)) (MnRejectAgentOrTurnDownTheme $e0 $x1))

;; [different class and role]  reject.Theme ~ turn_down.Agent   n 8 / 3   gate: FAIL
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000166 tierA-000162
;; B fillers: bank, editor, panel   e.g. tierA-000164 tierA-000159
;; JSD: 0.613   shared clusters: 2 e.g. {bank, banking industry} {editor, editorial staff}
;; A: (And (Member $e0 reject) (Theme $e0 $x1))
;; B: (And (Member $e0 turn_down) (Agent $e0 $x1))
(Implication (And (Member $e0 reject) (Theme $e0 $x1)) (MnRejectThemeOrTurnDownAgent $e0 $x1))
(Implication (And (Member $e0 turn_down) (Agent $e0 $x1)) (MnRejectThemeOrTurnDownAgent $e0 $x1))

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.618   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000577
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; JSD: 0.618   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old} {young, critic, young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  answer.Theme ~ give.Recipient   n 11 / 14   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000207 tierA-000209
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000208 tierA-000218
;; JSD: 0.624   shared clusters: 3 e.g. {query, question, questions, ask, …} {tower, castle} {caller, call, telephone call, call for}
;; A: (And (Member $e0 answer) (Theme $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrAnswerTheme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (MnGiveRecipientOrAnswerTheme $e0 $x1))

;; [different class and role]  make.Patient ~ reach.Theme   n 24 / 6   gate: FAIL
;; A fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierA-000186 tierA-000191
;; B fillers: decision ×4, Amanda, easy ×0.5, place ×0.5   e.g. tierA-000187 tierA-000192
;; JSD: 0.624   shared clusters: 2 e.g. {decision, decide, choose, option} {Linda, Beth, Amanda, Ana, …}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 reach) (Theme $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrReachTheme $e0 $x1))
(Implication (And (Member $e0 reach) (Theme $e0 $x1)) (MnMakePatientOrReachTheme $e0 $x1))

;; [same class, different role]  work.Agent ~ work.CoAgent   n 21 / 7   gate: FAIL
;; A fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000324 tierA-000312
;; B fillers: Bo ×2, Nils ×2, ranger ×2, fitter   e.g. tierA-000323 tierA-000325
;; JSD: 0.627   shared clusters: 4 e.g. {Nils} {Jonas, Bo, Bob, Thomas, …} {ranger, hunter} {fitter}
;; A: (And (Member $e0 work) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (CoAgent $e0 $x1))
(Implication (And (Member $e0 work) (CoAgent $e0 $x1)) (And (Member $e0 work) (Agent $e0 $x1)))

;; [same role, different class]  lend.Theme ~ need.Theme   n 10 / 8   gate: FAIL
;; A fillers: ladder ×4, generator ×3, painting ×3   e.g. tierA-000301 tierA-000303
;; B fillers: countersignature, egg, generate, go, monthly servicing, paint   e.g. tierB-000107 tierB-000455
;; JSD: 0.629   shared clusters: 2 e.g. {generator, generate} {painting, paint, paintings}
;; A: (And (Member $e0 lend) (Theme $e0 $x1))
;; B: (And (Member $e0 need) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cause.Agent ~ save.Agent   n 9 / 3   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000233 tierA-000228
;; B fillers: fire, flood, boy ×0.5, tall ×0.5   e.g. tierA-000235 tierA-000231
;; JSD: 0.639   shared clusters: 2 e.g. {flood} {fire, flame, burn, scorch, …}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 save) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  discover.Agent ~ discover.Theme   n 9 / 9   gate: FAIL
;; A fillers: diver ×3, intern ×3, paleontologist, scientist, wreck   e.g. tierA-000133 tierA-000135
;; B fillers: wreck ×3, file ×1.5, missing ×1.5, diver, pterosaur egg, magnet ×0.333   e.g. tierA-000136 tierA-000137
;; JSD: 0.639   shared clusters: 2 e.g. {diver, divers} {wreck, wreak}
;; A: (And (Member $e0 discover) (Agent $e0 $x1))
;; B: (And (Member $e0 discover) (Theme $e0 $x1))
(Implication (And (Member $e0 discover) (Theme $e0 $x1)) (And (Member $e0 discover) (Agent $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ leave.Agent   n 8 / 11   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000564 tierB-000004
;; JSD: 0.645   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnLeaveAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  decide.Agent ~ make.Agent   n 15 / 22   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000190 tierA-000193
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierA-000191 tierA-000202
;; JSD: 0.648   shared clusters: 5 e.g. {judge, jury, just} {board, panel} {committee, council} {family, family business, families}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bear.Patient ~ get.Agent   n 3 / 6   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-001325
;; JSD: 0.656   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnGetAgentOrBearPatient $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (MnGetAgentOrBearPatient $e0 $x1))

;; [different class and role]  hear.Experiencer ~ live.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000421 tierB-000659
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000524
;; JSD: 0.656   shared clusters: 2 e.g. {Dara, Mennad, Ziri, Fadil, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrLiveAgent $e0 $x1))
(Implication (And (Member $e0 live) (Agent $e0 $x1)) (MnHearExperiencerOrLiveAgent $e0 $x1))

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 22   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-001773
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001182
;; JSD: 0.66   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 22   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; JSD: 0.66   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James, Donald, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [same class, different role]  walk.Agent ~ walk.Goal   n 13 / 7   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000180 tierA-000181
;; B fillers: pier ×2, back, child, classroom, forest, store   e.g. tierB-001044 tierA-000183
;; JSD: 0.66   shared clusters: 3 e.g. {pier} {ward, go back, back, backward, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Goal $e0 $x1))
(Implication (And (Member $e0 walk) (Goal $e0 $x1)) (And (Member $e0 walk) (Agent $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 5 / 3   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-001817 tierB-001582
;; B fillers: alarmed, conservative, red   e.g. tierB-001079 tierB-001817
;; JSD: 0.662   shared clusters: 2 e.g. {conservative, conservative, revolutionary} {red, ridge, rag, rip, …}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [same role, different class]  borrow.Agent ~ lend.Agent   n 3 / 10   gate: FAIL
;; A fillers: Ravi, crew, gallery   e.g. tierA-000302 tierA-000297
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000304 tierA-000300
;; JSD: 0.662   shared clusters: 2 e.g. {crew} {Ravi}
;; A: (And (Member $e0 borrow) (Agent $e0 $x1))
;; B: (And (Member $e0 lend) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  borrow.Source ~ lend.Recipient   n 3 / 10   gate: FAIL
;; A fillers: depot, museum, neighbour   e.g. tierA-000297 tierA-000302
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000300 tierA-000304
;; JSD: 0.662   shared clusters: 2 e.g. {neighbour, next door} {depot}
;; A: (And (Member $e0 borrow) (Source $e0 $x1))
;; B: (And (Member $e0 lend) (Recipient $e0 $x1))
(Implication (And (Member $e0 lend) (Recipient $e0 $x1)) (MnLendRecipientOrBorrowSource $e0 $x1))
(Implication (And (Member $e0 borrow) (Source $e0 $x1)) (MnLendRecipientOrBorrowSource $e0 $x1))

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; JSD: 0.662   shared clusters: 2 e.g. {Santiago} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  need.Experiencer ~ take.Agent   n 8 / 10   gate: FAIL
;; A fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-001496 tierB-000107
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierA-000182 tierB-000987
;; JSD: 0.666   shared clusters: 3 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 need) (Experiencer $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnTakeAgentOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnTakeAgentOrNeedExperiencer $e0 $x1))

;; [different class and role]  acquire.Theme ~ buy.Agent   n 4 / 17   gate: FAIL
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000017 tierA-000024
;; B fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000021 tierA-000027
;; JSD: 0.675   shared clusters: 4 e.g. {kiln} {forklift, forklifts} {crate} {lemon, crate, lemons}
;; A: (And (Member $e0 acquire) (Theme $e0 $x1))
;; B: (And (Member $e0 buy) (Agent $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrAcquireTheme $e0 $x1))
(Implication (And (Member $e0 acquire) (Theme $e0 $x1)) (MnBuyAgentOrAcquireTheme $e0 $x1))

;; [same role, different class]  end.Patient ~ start.Patient   n 5 / 15   gate: FAIL
;; A fillers: apple harvest, football game, hearing, shoreline survey, world   e.g. tierA-000056 tierA-000071
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierA-000053 tierA-000068
;; JSD: 0.675   shared clusters: 3 e.g. {shoreline survey} {apple harvest, apples} {hear, hearing, listen}
;; A: (And (Member $e0 end) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ hear.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000115
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000421 tierB-000681
;; JSD: 0.678   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Dara, Mennad, Ziri, Fadil, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnGoAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  live.Agent ~ work.Agent   n 8 / 21   gate: FAIL
;; A fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000048
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000323 tierA-000324
;; JSD: 0.681   shared clusters: 2 e.g. {Dara, Mennad, Ziri, Fadil, …} {Linda, Beth, Amanda, Ana, …}
;; A: (And (Member $e0 live) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bring.Theme ~ leave.Agent   n 3 / 11   gate: FAIL
;; A fillers: Jonathan, advantage, british ship   e.g. tierB-000636 tierB-000427
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000100 tierB-000004
;; JSD: 0.682   shared clusters: 2 e.g. {ship, british ship, israeli military ship, merchant ship, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 bring) (Theme $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrBringTheme $e0 $x1))
(Implication (And (Member $e0 bring) (Theme $e0 $x1)) (MnLeaveAgentOrBringTheme $e0 $x1))

;; [different class and role]  learn.Source ~ teach.Recipient   n 3 / 11   gate: FAIL
;; A fillers: coach, elder, potter   e.g. tierA-000287 tierA-000282
;; B fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierA-000289 tierA-000285
;; JSD: 0.682   shared clusters: 2 e.g. {coach, trainer} {potter}
;; A: (And (Member $e0 learn) (Source $e0 $x1))
;; B: (And (Member $e0 teach) (Recipient $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (MnTeachRecipientOrLearnSource $e0 $x1))
(Implication (And (Member $e0 learn) (Source $e0 $x1)) (MnTeachRecipientOrLearnSource $e0 $x1))

;; [same role, different class]  go.Agent ~ study.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000012
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001544
;; JSD: 0.686   shared clusters: 3 e.g. {Linda, Beth, Amanda, Ana, …} {Dara, Mennad, Ziri, Fadil, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  read.Agent ~ work.Agent   n 3 / 21   gate: FAIL
;; A fillers: Katya, Thomas, girl ×0.5, little ×0.5   e.g. tierB-001637 tierB-001221
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000311 tierA-000312
;; JSD: 0.687   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 read) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ work.Agent   n 13 / 21   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000012
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000323 tierA-000324
;; JSD: 0.689   shared clusters: 3 e.g. {Linda, Beth, Amanda, Ana, …} {Dara, Mennad, Ziri, Fadil, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  teach.Recipient ~ walk.Goal   n 11 / 7   gate: FAIL
;; A fillers: apprentice ×3, child ×3, squad ×2, class, coach, potter   e.g. tierB-001612 tierA-000291
;; B fillers: pier ×2, back, child, classroom, forest, store   e.g. tierB-001219 tierA-000183
;; JSD: 0.694   shared clusters: 2 e.g. {child, children, kid, baby, …} {class, classroom}
;; A: (And (Member $e0 teach) (Recipient $e0 $x1))
;; B: (And (Member $e0 walk) (Goal $e0 $x1))
(Implication (And (Member $e0 teach) (Recipient $e0 $x1)) (MnTeachRecipientOrWalkGoal $e0 $x1))
(Implication (And (Member $e0 walk) (Goal $e0 $x1)) (MnTeachRecipientOrWalkGoal $e0 $x1))

;; [different class and role]  acquire.Agent ~ buy.Theme   n 4 / 19   gate: FAIL
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000017 tierA-000024
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000021 tierA-000027
;; JSD: 0.697   shared clusters: 3 e.g. {chef, cook} {pottery studio} {depot}
;; A: (And (Member $e0 acquire) (Agent $e0 $x1))
;; B: (And (Member $e0 buy) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrAcquireAgent $e0 $x1))
(Implication (And (Member $e0 acquire) (Agent $e0 $x1)) (MnBuyThemeOrAcquireAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ purchase.Agent   n 19 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000021 tierA-000027
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000016 tierA-000023
;; JSD: 0.697   shared clusters: 3 e.g. {chef, cook} {pottery studio} {depot}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 purchase) (Agent $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrPurchaseAgent $e0 $x1))
(Implication (And (Member $e0 purchase) (Agent $e0 $x1)) (MnBuyThemeOrPurchaseAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ sell.Recipient   n 19 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierA-000021 tierA-000027
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000018 tierA-000025
;; JSD: 0.697   shared clusters: 3 e.g. {chef, cook} {pottery studio} {depot}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 sell) (Recipient $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrSellRecipient $e0 $x1))
(Implication (And (Member $e0 sell) (Recipient $e0 $x1)) (MnBuyThemeOrSellRecipient $e0 $x1))

;; [same role, different class]  make.Agent ~ try.Agent   n 22 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000117
;; JSD: 0.697   shared clusters: 4 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  give_up.Agent ~ try.Agent   n 4 / 10   gate: FAIL
;; A fillers: Bob, climber, firm, rescue team   e.g. tierB-000947 tierA-000105
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001130 tierB-000469
;; JSD: 0.698   shared clusters: 2 e.g. {Jonas, Bo, Bob, Thomas, …} {company, firm, organisation, corporation}
;; A: (And (Member $e0 give_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Agent ~ teach.Agent   n 3 / 12   gate: FAIL
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: elder ×3, potter ×3, coach ×2, Van Bavel, apprentice, squad   e.g. tierA-000289 tierA-000285
;; JSD: 0.699   shared clusters: 2 e.g. {club, squad, team} {apprentice}
;; A: (And (Member $e0 learn) (Agent $e0 $x1))
;; B: (And (Member $e0 teach) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Agent ~ purchase.Theme   n 17 / 5   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000021 tierA-000027
;; B fillers: forklift, kiln, pirated copy, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000016 tierA-000023
;; JSD: 0.7   shared clusters: 4 e.g. {kiln} {forklift, forklifts} {crate} {lemon, crate, lemons}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 purchase) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrPurchaseTheme $e0 $x1))
(Implication (And (Member $e0 purchase) (Theme $e0 $x1)) (MnBuyAgentOrPurchaseTheme $e0 $x1))

;; [same role, different class]  leave.Agent ~ travel.Agent   n 11 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000747 tierB-000004
;; B fillers: person ×2, Matthew, Roger, campaigner   e.g. tierB-001618 tierB-000995
;; JSD: 0.7   shared clusters: 2 e.g. {person, people} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ hear.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.702   shared clusters: 5 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHaveHolderOrHearExperiencer $e0 $x1))

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 6   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnTryAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnTryAgentOrWantExperiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-000012
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-000313
;; JSD: 0.707   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ need.Experiencer   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-000672
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000061
;; JSD: 0.713   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnNeedExperiencerOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnNeedExperiencerOrGetAgent $e0 $x1))

;; [same role, different class]  enter.Agent ~ leave.Agent   n 4 / 11   gate: FAIL
;; A fillers: Layla, Martino, muslim, person   e.g. tierB-000556 tierB-000450
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000747 tierB-000704
;; JSD: 0.715   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ go.Agent   n 7 / 13   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000075 tierB-000173
;; B fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; JSD: 0.717   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ make.Agent   n 13 / 22   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-000115
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000173
;; JSD: 0.717   shared clusters: 4 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Hanako, Iga, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ work.Agent   n 8 / 21   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000421
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-000212 tierA-000323
;; JSD: 0.72   shared clusters: 3 e.g. {Dara, Mennad, Ziri, Fadil, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (MnWorkAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnWorkAgentOrHearExperiencer $e0 $x1))

;; [different class and role]  leave.Agent ~ want.Experiencer   n 11 / 6   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000004 tierB-000704
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.72   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnLeaveAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 9   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000421 tierB-000189
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001879
;; JSD: 0.721   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Dara, Mennad, Ziri, Fadil, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (MnStudyAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnStudyAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  live.Agent ~ study.Agent   n 8 / 9   gate: FAIL
;; A fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000048
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001544
;; JSD: 0.721   shared clusters: 2 e.g. {Dara, Mennad, Ziri, Fadil, …} {Linda, Beth, Amanda, Ana, …}
;; A: (And (Member $e0 live) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; JSD: 0.722   shared clusters: 2 e.g. {David, William, James, Donald, …} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Agent ~ start.Agent   n 17 / 6   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000015 tierA-000019
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000942 tierB-000043
;; JSD: 0.722   shared clusters: 2 e.g. {chef, cook} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ go.Agent   n 5 / 13   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-001145
;; JSD: 0.73   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 13   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.73   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ study.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001185 tierB-000577
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000203 tierB-001879
;; JSD: 0.73   shared clusters: 2 e.g. {Yuri, Leonid} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; B fillers: Daniel, Jordan Peterson, Linda, friend, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; JSD: 0.73   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ live.Agent   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000012
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000048
;; JSD: 0.733   shared clusters: 2 e.g. {Dara, Mennad, Ziri, Fadil, …} {Linda, Beth, Amanda, Ana, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  help.Agent ~ leave.Agent   n 5 / 11   gate: FAIL
;; A fillers: Jonas, Michael, context, hothouse condition, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-001350 tierB-000004
;; JSD: 0.739   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ receive.Theme   n 3 / 7   gate: FAIL
;; A fillers: network ×0.5, new ×0.5, original ×0.5, playground ×0.5, turing machine ×0.5, well ×0.5   e.g. tierB-001867 tierB-000063
;; B fillers: award, honorary knighthood, manifest, medal, permit, whistle   e.g. tierB-001693 tierB-001035
;; JSD: 0.741   shared clusters: 2 e.g. {use, permit, well, do, …} {new, brand new, language, new, new, product}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 receive) (Theme $e0 $x1))
(Implication (And (Member $e0 receive) (Theme $e0 $x1)) (MnReceiveThemeOrBuildPatient $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (MnReceiveThemeOrBuildPatient $e0 $x1))

;; [same role, different class]  learn.Theme ~ speak.Theme   n 6 / 4   gate: FAIL
;; A fillers: berber, drill, glazing, song, vocabulary, foreign ×0.5   e.g. tierB-000608 tierA-000287
;; B fillers: czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-001068 tierB-000053
;; JSD: 0.742   shared clusters: 2 e.g. {language, english} {foreign, foreign language, foreign, language, foreigner}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ walk.Agent   n 22 / 13   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001044
;; JSD: 0.742   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {customer, customers} {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 13   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.743   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnWalkAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnWalkAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  run.Agent ~ walk.Agent   n 4 / 13   gate: FAIL
;; A fillers: Tobias, doctor, goat, squirrel   e.g. tierB-000178 tierB-001153
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierA-000173
;; JSD: 0.743   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {shepherd, cow, goat, sheep, …}
;; A: (And (Member $e0 run) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ take.Agent   n 6 / 10   gate: FAIL
;; A fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000942 tierB-000199
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierB-001102 tierA-000178
;; JSD: 0.745   shared clusters: 2 e.g. {chef, cook} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bear.Patient ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000487
;; JSD: 0.747   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnTryAgentOrBearPatient $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (MnTryAgentOrBearPatient $e0 $x1))

;; [different class and role]  cause.Agent ~ take.Theme   n 9 / 10   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierB-001089 tierB-000805
;; B fillers: walk ×2, office, portrait, power, roller, thing   e.g. tierB-000252 tierA-000174
;; JSD: 0.748   shared clusters: 2 e.g. {walk, stroll} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Theme $e0 $x1))
(Implication (And (Member $e0 take) (Theme $e0 $x1)) (MnTakeThemeOrCauseAgent $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnTakeThemeOrCauseAgent $e0 $x1))

;; [same class, different role]  decide.Agent ~ decide.Theme   n 15 / 11   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierA-000190 tierA-000193
;; B fillers: budget ×3, case ×3, confront, judge, new, roof   e.g. tierA-000195 tierA-000194
;; JSD: 0.748   shared clusters: 2 e.g. {judge, jury, just} {case, switch}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 decide) (Theme $e0 $x1))
(Implication (And (Member $e0 decide) (Theme $e0 $x1)) (And (Member $e0 decide) (Agent $e0 $x1)))

;; [different class and role]  go.Agent ~ want.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001145 tierB-001183
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; JSD: 0.748   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnGoAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  sleep.Experiencer ~ walk.Agent   n 6 / 13   gate: FAIL
;; A fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000181 tierB-000951
;; JSD: 0.748   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 sleep) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnWalkAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnWalkAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  walk.Agent ~ want.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000846 tierB-000626
;; JSD: 0.748   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnWalkAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnWalkAgentOrWantExperiencer $e0 $x1))

;; [same role, different class]  study.Agent ~ work.Agent   n 9 / 21   gate: FAIL
;; A fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001544
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000323 tierA-000324
;; JSD: 0.749   shared clusters: 2 e.g. {Dara, Mennad, Ziri, Fadil, …} {Linda, Beth, Amanda, Ana, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ play.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-000160 tierB-000648
;; JSD: 0.751   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  play.Agent ~ walk.Agent   n 9 / 13   gate: FAIL
;; A fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-000160 tierB-000648
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000181 tierB-000951
;; JSD: 0.751   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  decide.Agent ~ hear.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; JSD: 0.753   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (MnDecideAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnDecideAgentOrHearExperiencer $e0 $x1))

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000748
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.754   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 5 / 9   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-000740 tierB-000352
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000695
;; JSD: 0.758   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))

;; [different class and role]  make.Agent ~ want.Experiencer   n 22 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; JSD: 0.761   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnMakeAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  buy.Agent ~ sell.Theme   n 17 / 9   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierA-000021 tierA-000027
;; B fillers: copy, forklift, kiln, milk, projector, thing   e.g. tierA-000018 tierA-000025
;; JSD: 0.763   shared clusters: 4 e.g. {kiln} {forklift, forklifts} {crate} {lemon, crate, lemons}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
(Implication (And (Member $e0 buy) (Agent $e0 $x1)) (MnBuyAgentOrSellTheme $e0 $x1))
(Implication (And (Member $e0 sell) (Theme $e0 $x1)) (MnBuyAgentOrSellTheme $e0 $x1))

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 22   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; JSD: 0.764   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  talk.Agent ~ work.Agent   n 6 / 21   gate: FAIL
;; A fillers: Daniel, Jordan Peterson, Linda, friend, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000311 tierA-000312
;; JSD: 0.764   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {Dan, Daniel}
;; A: (And (Member $e0 talk) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ walk.Agent   n 13 / 13   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000181 tierB-000951
;; JSD: 0.769   shared clusters: 3 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  change.Patient ~ get.Patient   n 7 / 7   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000748
;; JSD: 0.773   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ walk.Agent   n 6 / 13   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.781   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 13   gate: FAIL
;; A fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-001219 tierB-000043
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierA-000177
;; JSD: 0.781   shared clusters: 2 e.g. {school janitor} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ hear.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.782   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnGiveAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnGiveAgentOrHearExperiencer $e0 $x1))

;; [different class and role]  cause.Agent ~ destroy.Patient   n 9 / 13   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierA-000223 tierB-000775
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, city centre, fire, mayan book   e.g. tierA-000226 tierA-000230
;; JSD: 0.785   shared clusters: 2 e.g. {storm, soon, thunder, typhoon} {fire, flame, burn, scorch, …}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 destroy) (Patient $e0 $x1))
(Implication (And (Member $e0 destroy) (Patient $e0 $x1)) (MnDestroyPatientOrCauseAgent $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnDestroyPatientOrCauseAgent $e0 $x1))

;; [same class, different role]  walk.Agent ~ walk.Location   n 13 / 9   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000177 tierA-000180
;; B fillers: ridge ×2, ward ×2, dark, hallway, nurse, wood floor   e.g. tierA-000178 tierA-000173
;; JSD: 0.785   shared clusters: 2 e.g. {ward, go back, back, backward, …} {nurse}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Location $e0 $x1))
(Implication (And (Member $e0 walk) (Location $e0 $x1)) (And (Member $e0 walk) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ try.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; JSD: 0.8   shared clusters: 4 e.g. {David, William, James, Donald, …} {Jonas, Bo, Bob, Thomas, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrTryAgent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnHaveHolderOrTryAgent $e0 $x1))

;; [same role, different class]  travel.Agent ~ work.Agent   n 5 / 21   gate: FAIL
;; A fillers: person ×2, Matthew, Roger, campaigner   e.g. tierB-001618 tierB-000995
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-001813 tierA-000312
;; JSD: 0.803   shared clusters: 2 e.g. {person, people} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 travel) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ need.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001145
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000339
;; JSD: 0.806   shared clusters: 2 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnGoAgentOrNeedExperiencer $e0 $x1))

;; [different class and role]  need.Experiencer ~ walk.Agent   n 8 / 13   gate: FAIL
;; A fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-001496 tierB-000107
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierA-000181 tierB-001044
;; JSD: 0.806   shared clusters: 2 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 need) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnWalkAgentOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnWalkAgentOrNeedExperiencer $e0 $x1))

;; [same role, different class]  leave.Agent ~ work.Agent   n 11 / 21   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000747 tierB-000564
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-001813 tierB-000212
;; JSD: 0.807   shared clusters: 3 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ take.Agent   n 11 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-001350 tierB-000704
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierB-000252 tierB-000987
;; JSD: 0.809   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; JSD: 0.809   shared clusters: 2 e.g. {Jonas, Bo, Bob, Thomas, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  give.Agent ~ give.Recipient   n 15 / 14   gate: FAIL
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000274 tierA-000271
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000273 tierA-000208
;; JSD: 0.81   shared clusters: 2 e.g. {driver, drive} {foreman}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (And (Member $e0 give) (Agent $e0 $x1)))

;; [different class and role]  bear.Patient ~ make.Agent   n 3 / 22   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000025
;; JSD: 0.82   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrBearPatient $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (MnMakeAgentOrBearPatient $e0 $x1))

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 22 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001538 tierB-001003
;; JSD: 0.82   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnMakeAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  decide.Agent ~ live.Agent   n 15 / 8   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierB-001544 tierB-000563
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-000048 tierB-000524
;; JSD: 0.821   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 34   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; JSD: 0.821   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))

;; [different class and role]  cause.Agent ~ get.Patient   n 9 / 7   gate: FAIL
;; A fillers: storm ×2, demon, fire, flood, news, thing   e.g. tierB-001089 tierA-000228
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000890
;; JSD: 0.824   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {fire, flame, burn, scorch, …}
;; A: (And (Member $e0 cause) (Agent $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 cause) (Agent $e0 $x1)) (MnCauseAgentOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnCauseAgentOrGetPatient $e0 $x1))

;; [same role, different class]  go.Agent ~ take.Agent   n 13 / 10   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001145
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierA-000182 tierB-000987
;; JSD: 0.825   shared clusters: 2 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ try.Agent   n 13 / 10   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; JSD: 0.825   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  kill.Agent ~ work.Agent   n 5 / 21   gate: FAIL
;; A fillers: Ivan, cancer, fire, hunter, lion   e.g. tierB-000412 tierB-001399
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-000212 tierA-000320
;; JSD: 0.825   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {ranger, hunter}
;; A: (And (Member $e0 kill) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 13   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.825   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  decide.Agent ~ work.Agent   n 15 / 21   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-000212 tierA-000311
;; JSD: 0.83   shared clusters: 2 e.g. {Linda, Beth, Amanda, Ana, …} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 24   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000890 tierB-000206
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001457 tierB-001831
;; JSD: 0.83   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {big, huge, large, massive, …} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 15   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000751
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001816 tierB-001899
;; JSD: 0.83   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {knock, kick, kick out}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))

;; [same role, different class]  make.Agent ~ watch.Agent   n 22 / 5   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierA-000197 tierB-000951
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000520 tierB-000651
;; JSD: 0.83   shared clusters: 2 e.g. {family, family business, families} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  begin.Patient ~ start.Theme   n 11 / 13   gate: FAIL
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing, night, school   e.g. tierB-001085 tierA-000057
;; B fillers: appear, chant, cry, disappear, hear, high school   e.g. tierB-000043 tierB-001479
;; JSD: 0.833   shared clusters: 2 e.g. {school, university, campus, college, …} {hear, hearing, listen}
;; A: (And (Member $e0 begin) (Patient $e0 $x1))
;; B: (And (Member $e0 start) (Theme $e0 $x1))
(Implication (And (Member $e0 start) (Theme $e0 $x1)) (MnStartThemeOrBeginPatient $e0 $x1))
(Implication (And (Member $e0 begin) (Patient $e0 $x1)) (MnStartThemeOrBeginPatient $e0 $x1))

;; [same role, different class]  leave.Agent ~ walk.Agent   n 11 / 13   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-001350 tierB-000704
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; JSD: 0.833   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ need.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000855
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000061
;; JSD: 0.837   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnHaveHolderOrNeedExperiencer $e0 $x1))

;; [same role, different class]  arrive.Agent ~ give.Agent   n 10 / 15   gate: FAIL
;; A fillers: freight ×3, delegation ×2, Donald, driver, paris train, soil sample   e.g. tierB-000237 tierB-000444
;; B fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000274 tierB-000137
;; JSD: 0.838   shared clusters: 2 e.g. {driver, drive} {David, William, James, Donald, …}
;; A: (And (Member $e0 arrive) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  answer.Agent ~ give.Recipient   n 11 / 14   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, Oleg, caller, query   e.g. tierA-000210 tierA-000221
;; B fillers: recruit ×3, winner ×3, driver ×2, kid ×2, caller, foreman   e.g. tierA-000208 tierA-000218
;; JSD: 0.839   shared clusters: 2 e.g. {query, question, questions, ask, …} {caller, call, telephone call, call for}
;; A: (And (Member $e0 answer) (Agent $e0 $x1))
;; B: (And (Member $e0 give) (Recipient $e0 $x1))
(Implication (And (Member $e0 give) (Recipient $e0 $x1)) (MnGiveRecipientOrAnswerAgent $e0 $x1))
(Implication (And (Member $e0 answer) (Agent $e0 $x1)) (MnGiveRecipientOrAnswerAgent $e0 $x1))

;; [same role, different class]  buy.Agent ~ walk.Agent   n 17 / 13   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000148
;; JSD: 0.839   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ make.Patient   n 34 / 24   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-001797
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001920 tierA-000186
;; JSD: 0.839   shared clusters: 5 e.g. {decision, decide, choose, option} {Algeria, Afghanistan, Iran, Morocco, …} {room, changing room, rooms} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))

;; [same role, different class]  make.Agent ~ take.Agent   n 22 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.84   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  answer.Theme ~ give.Agent   n 11 / 15   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, question, vet   e.g. tierA-000221 tierA-000210
;; B fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierA-000218 tierA-000208
;; JSD: 0.845   shared clusters: 2 e.g. {vet, van} {clerk}
;; A: (And (Member $e0 answer) (Theme $e0 $x1))
;; B: (And (Member $e0 give) (Agent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnGiveAgentOrAnswerTheme $e0 $x1))
(Implication (And (Member $e0 answer) (Theme $e0 $x1)) (MnGiveAgentOrAnswerTheme $e0 $x1))

;; [different class and role]  have.Holder ~ leave.Agent   n 34 / 11   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, automobile   e.g. tierB-000564 tierB-000004
;; JSD: 0.855   shared clusters: 3 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bo, Bob, Thomas, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))

;; [different class and role]  have.Holder ~ write.Patient   n 34 / 4   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000142 tierB-000931
;; B fillers: book, character, letter, sentence   e.g. tierB-000971 tierB-001962
;; JSD: 0.864   shared clusters: 2 e.g. {sentence, english sentence, sentences} {book, library, books}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWritePatient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (MnHaveHolderOrWritePatient $e0 $x1))

;; [same role, different class]  make.Agent ~ play.Agent   n 22 / 9   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001457 tierB-000951
;; B fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-001840 tierB-000939
;; JSD: 0.864   shared clusters: 2 e.g. {boy, boys} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ reach.Theme   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001797 tierB-000494
;; B fillers: decision ×4, Amanda, easy ×0.5, place ×0.5   e.g. tierA-000187 tierA-000192
;; JSD: 0.865   shared clusters: 2 e.g. {decision, decide, choose, option} {place, places, easy, place, full, place}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 reach) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrReachTheme $e0 $x1))
(Implication (And (Member $e0 reach) (Theme $e0 $x1)) (MnHaveHolderOrReachTheme $e0 $x1))

;; [different class and role]  eat.Agent ~ start.Patient   n 4 / 15   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000338
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001940 tierB-001446
;; JSD: 0.866   shared clusters: 2 e.g. {dog, dog feed} {black, blue, brown, gray, …}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrEatAgent $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (MnStartPatientOrEatAgent $e0 $x1))

;; [different class and role]  have.Holder ~ make.Agent   n 34 / 22   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; JSD: 0.867   shared clusters: 3 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveHolderOrMakeAgent $e0 $x1))

;; [different class and role]  have.Holder ~ want.Experiencer   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000358 tierB-001216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.867   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bo, Bob, Thomas, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnHaveHolderOrWantExperiencer $e0 $x1))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 24   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000371 tierB-000048
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001457 tierB-001831
;; JSD: 0.867   shared clusters: 3 e.g. {house, home, comfortable, house, houses, …} {big, huge, large, massive, …} {cozy, comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))

;; [same role, different class]  start.Patient ~ turn.Patient   n 15 / 7   gate: FAIL
;; A fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-000654 tierB-001940
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-000832
;; JSD: 0.868   shared clusters: 3 e.g. {freedom movement, freedom, independence} {gusher} {black, blue, brown, gray, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ use.Theme   n 34 / 17   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-001177
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001378 tierB-001154
;; JSD: 0.878   shared clusters: 3 e.g. {room, changing room, rooms} {word, word processor} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))

;; [same role, different class]  buy.Agent ~ make.Agent   n 17 / 22   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, Keike ×2, chef ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000025
;; JSD: 0.879   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  start.Patient ~ turn.Result   n 15 / 5   gate: FAIL
;; A fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001940 tierB-000654
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000476 tierB-000832
;; JSD: 0.879   shared clusters: 2 e.g. {gusher} {black, blue, brown, gray, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrTurnResult $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (MnStartPatientOrTurnResult $e0 $x1))

;; [different class and role]  create.Patient ~ use.Theme   n 3 / 17   gate: FAIL
;; A fillers: particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001378 tierB-001884
;; JSD: 0.88   shared clusters: 2 e.g. {general, various, all, everything, …} {schedule, calendar}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 34   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000206 tierB-000748
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-000790
;; JSD: 0.88   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {bad, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))

;; [different class and role]  buy.Theme ~ turn.Result   n 19 / 5   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierB-000367 tierA-000015
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000832 tierB-000476
;; JSD: 0.883   shared clusters: 2 e.g. {yellow, orange} {black, blue, brown, gray, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrTurnResult $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (MnBuyThemeOrTurnResult $e0 $x1))

;; [different class and role]  change.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000098 tierB-001217
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000722 tierB-000162
;; JSD: 0.889   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))

;; [different class and role]  have.Holder ~ live.Agent   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001467 tierB-000162
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001049 tierB-000524
;; JSD: 0.892   shared clusters: 2 e.g. {mozabite, tuareg, Beja, mozabites, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrLiveAgent $e0 $x1))
(Implication (And (Member $e0 live) (Agent $e0 $x1)) (MnHaveHolderOrLiveAgent $e0 $x1))

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-000790
;; JSD: 0.896   shared clusters: 2 e.g. {room, changing room, rooms} {weather, bad, weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 24   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000904
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-000371 tierB-001457
;; JSD: 0.896   shared clusters: 2 e.g. {beautiful, attractive, gorgeous, pretty} {room, changing room, rooms}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))

;; [different class and role]  have.Holder ~ take.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000855
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, child, cook   e.g. tierB-000987 tierB-001102
;; JSD: 0.9   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))

;; [different class and role]  decide.Agent ~ have.Holder   n 15 / 34   gate: FAIL
;; A fillers: board ×3, judge ×3, Fyodor ×2, committee ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000162
;; JSD: 0.902   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrDecideAgent $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (MnHaveHolderOrDecideAgent $e0 $x1))

;; [different class and role]  give.Agent ~ have.Holder   n 15 / 34   gate: FAIL
;; A fillers: school ×3, trainer ×3, Vladimir ×2, foreman ×2, William, clerk   e.g. tierB-001046 tierB-000137
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; JSD: 0.902   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGiveAgent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnHaveHolderOrGiveAgent $e0 $x1))

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 21   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierA-000315 tierA-000316
;; JSD: 0.906   shared clusters: 2 e.g. {adaptor, adaptor, old} {old, elder, aging, ages ago, …}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 39 / 7   gate: FAIL
;; A fillers: here ×3, city ×2, class ×2, garden ×2, full ×1.5, Algiers   e.g. tierB-000523 tierB-001111
;; B fillers: animal, cake, ivy, plant, play, student association   e.g. tierB-001932 tierB-001966
;; JSD: 0.908   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  have.Holder ~ work.Agent   n 34 / 21   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000665 tierB-001861
;; B fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Bo, Dad   e.g. tierB-001873 tierB-000212
;; JSD: 0.908   shared clusters: 3 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bo, Bob, Thomas, …} {old, elder, aging, ages ago, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWorkAgent $e0 $x1))
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (MnHaveHolderOrWorkAgent $e0 $x1))

;; [different class and role]  go.Agent ~ have.Holder   n 13 / 34   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; JSD: 0.91   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGoAgent $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnHaveHolderOrGoAgent $e0 $x1))

;; [different class and role]  have.Holder ~ walk.Agent   n 34 / 13   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.91   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWalkAgent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnHaveHolderOrWalkAgent $e0 $x1))

;; [same class, different role]  make.Patient ~ make.Result   n 24 / 7   gate: FAIL
;; A fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001920 tierB-001594
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001431 tierB-001504
;; JSD: 0.91   shared clusters: 2 e.g. {beautiful, attractive, gorgeous, pretty} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001658 tierB-000370
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001553 tierB-000162
;; JSD: 0.914   shared clusters: 2 e.g. {day, days, days, short, one day} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 19 / 34   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierB-000368 tierB-001690
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001103 tierB-001016
;; JSD: 0.923   shared clusters: 2 e.g. {food, eat} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [different class and role]  buy.Theme ~ turn.Patient   n 19 / 7   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, computer, crate   e.g. tierB-000367 tierA-000015
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; JSD: 0.924   shared clusters: 2 e.g. {black, blue, brown, gray, …} {yellow, orange}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnBuyThemeOrTurnPatient $e0 $x1))
(Implication (And (Member $e0 turn) (Patient $e0 $x1)) (MnBuyThemeOrTurnPatient $e0 $x1))

;; [different class and role]  have.Theme ~ make.Result   n 35 / 7   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001016 tierB-001264
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001920 tierB-001431
;; JSD: 0.931   shared clusters: 2 e.g. {beautiful, attractive, gorgeous, pretty} {black, blue, brown, gray, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeResult $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (MnHaveThemeOrMakeResult $e0 $x1))

;; [different class and role]  have.Theme ~ turn.Patient   n 35 / 7   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-001929
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-000832
;; JSD: 0.936   shared clusters: 2 e.g. {leaf, foliage, leaves} {black, blue, brown, gray, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrTurnPatient $e0 $x1))
(Implication (And (Member $e0 turn) (Patient $e0 $x1)) (MnHaveThemeOrTurnPatient $e0 $x1))

;; [different class and role]  have.Theme ~ start.Patient   n 35 / 15   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, apple harvest, concert, crack, dog feed, dress rehearsal   e.g. tierB-001940 tierB-001816
;; JSD: 0.94   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {black, blue, brown, gray, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 35 / 22   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001264
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001920
;; JSD: 0.941   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {curtain, blue, curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))

;; [different class and role]  have.Theme ~ make.Patient   n 35 / 24   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001016 tierB-000931
;; B fillers: decision ×4, difference ×1.5, Afghanistan, Augustus, Isabella, big   e.g. tierB-001920 tierB-001431
;; JSD: 0.965   shared clusters: 2 e.g. {paper, document, paper sheet, paper sheets} {beautiful, attractive, gorgeous, pretty}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveThemeOrMakePatient $e0 $x1))
