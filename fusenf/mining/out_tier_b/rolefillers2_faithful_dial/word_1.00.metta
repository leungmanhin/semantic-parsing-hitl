;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 1.00 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate       out_tier_b/canonical_substrate.jsonl (1950 records); out_tier_b/valuations_occ.jsonl (6713 filler occurrences)
;;   embeddings      out_tier_b/embeddings: Qwen3-Embedding-8B, bf16, normalised; 2909 texts, dim 4096
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
;;                   outside the distributions: 140 occurrences excluded in this block, 3065 filler units enter
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

;; ==================== SLOT PAIRS: 0 pass the gate (event 0, entity 0); 40 pairs listed = every pair with >= 2 shared clusters (event 39, entity 1) among the 13558 pairs of 165 event slots and 8 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: FAIL
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000004 tierB-000425
;; B fillers: on, open, unlocked   e.g. tierB-000747 tierB-000004
;; JSD: 0.311   shared clusters: 3 e.g. {on} {open} {unlocked}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-001658
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; JSD: 0.531   shared clusters: 4 e.g. {bad} {expensive} {short} {cheap}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.547   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Rima} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-000410 tierB-001551
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.569   shared clusters: 2 e.g. {child} {dog}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000654 tierB-000832
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000476 tierB-001675
;; JSD: 0.599   shared clusters: 4 e.g. {gusher} {black} {red} {yellow}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-000199
;; JSD: 0.636   shared clusters: 2 e.g. {girl} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  become.Patient ~ become.Result   n 5 / 3   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-001582 tierB-001817
;; B fillers: alarmed, conservative, red   e.g. tierB-001079 tierB-001582
;; JSD: 0.662   shared clusters: 2 e.g. {red} {conservative}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [same role, different class]  learn.Theme ~ speak.Theme   n 3 / 4   gate: FAIL
;; A fillers: berber, vocabulary, foreign ×0.5, language ×0.5   e.g. tierB-000608 tierB-000282
;; B fillers: czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-001068 tierB-000053
;; JSD: 0.713   shared clusters: 2 e.g. {foreign} {language}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.714   shared clusters: 2 e.g. {cat} {child}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000748
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.754   shared clusters: 2 e.g. {thing} {weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 5 / 9   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-000352 tierB-000740
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000695 tierB-001479
;; JSD: 0.758   shared clusters: 2 e.g. {thing} {noise}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnHearStimulusOrBecomePatient $e0 $x1))

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.763   shared clusters: 2 e.g. {Mark} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000313 tierB-001496
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-000782
;; JSD: 0.764   shared clusters: 2 e.g. {Linda} {child}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  change.Patient ~ get.Patient   n 7 / 7   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000748
;; JSD: 0.773   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000313 tierB-000576
;; B fillers: Daniel, Jordan Peterson, Linda, friend, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; JSD: 0.781   shared clusters: 2 e.g. {Linda} {Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 6   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Dad, Dan, Dmitri, person, volunteer, adaptor ×0.5   e.g. tierB-001813 tierB-001134
;; JSD: 0.798   shared clusters: 2 e.g. {old} {adaptor}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001899 tierB-001816
;; JSD: 0.799   shared clusters: 2 e.g. {knock} {thing}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.839   shared clusters: 2 e.g. {James} {Damiano}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-001623
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001044
;; JSD: 0.839   shared clusters: 2 e.g. {Hanako} {customer}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000770
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-001831
;; JSD: 0.842   shared clusters: 2 e.g. {thing} {man}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 34   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000368 tierB-001690
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001103 tierB-001016
;; JSD: 0.873   shared clusters: 2 e.g. {food} {house}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000672
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000547
;; JSD: 0.873   shared clusters: 2 e.g. {man} {young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000117
;; JSD: 0.874   shared clusters: 2 e.g. {David} {man}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  create.Patient ~ use.Theme   n 3 / 17   gate: FAIL
;; A fillers: particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001304 tierB-000404
;; JSD: 0.88   shared clusters: 2 e.g. {various} {calendar}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 20   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000904
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001504 tierB-000325
;; JSD: 0.881   shared clusters: 2 e.g. {beautiful} {room}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))

;; [same role, different class]  start.Patient ~ turn.Patient   n 11 / 7   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-000654 tierB-001899
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000018
;; JSD: 0.887   shared clusters: 2 e.g. {freedom movement} {gusher}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000098
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-000722
;; JSD: 0.889   shared clusters: 2 e.g. {thing} {color}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001457
;; JSD: 0.89   shared clusters: 2 e.g. {bad} {big}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-000790
;; JSD: 0.896   shared clusters: 2 e.g. {room} {weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))

;; [same class, different role]  make.Patient ~ make.Result   n 20 / 7   gate: FAIL
;; A fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001920
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001754 tierB-001809
;; JSD: 0.898   shared clusters: 2 e.g. {bad} {beautiful}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 20   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001504 tierB-000325
;; JSD: 0.907   shared clusters: 2 e.g. {house} {comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 39 / 7   gate: FAIL
;; A fillers: here ×3, city ×2, class ×2, garden ×2, full ×1.5, Algiers   e.g. tierB-000523 tierB-001111
;; B fillers: animal, cake, ivy, plant, play, student association   e.g. tierB-001932 tierB-001966
;; JSD: 0.908   shared clusters: 2 e.g. {play} {street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-001658
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001553
;; JSD: 0.914   shared clusters: 2 e.g. {thing} {day}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))

;; [different class and role]  have.Holder ~ use.Theme   n 34 / 17   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-000142
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001378 tierB-000971
;; JSD: 0.919   shared clusters: 2 e.g. {room} {sentence}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))

;; [different class and role]  have.Holder ~ make.Patient   n 34 / 20   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001016 tierB-001264
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000371 tierB-001920
;; JSD: 0.927   shared clusters: 3 e.g. {house} {room} {bad}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))

;; [different class and role]  have.Theme ~ start.Patient   n 35 / 11   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001264
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001816 tierB-001940
;; JSD: 0.932   shared clusters: 2 e.g. {thing} {blue}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 34   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000790 tierB-001553
;; JSD: 0.936   shared clusters: 2 e.g. {bad} {weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 35 / 18   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001264
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001920
;; JSD: 0.936   shared clusters: 2 e.g. {thing} {curtain}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
