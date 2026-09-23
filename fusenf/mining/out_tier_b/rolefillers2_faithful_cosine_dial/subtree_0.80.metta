;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_cosine_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful_cosine.metta
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
;;                   outside the distributions: 140 occurrences excluded in this block, 2742 filler units enter
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

;; ==================== SLOT PAIRS: 5 pass the gate (event 5, entity 0); 87 pairs listed = every pair with >= 2 shared clusters (event 86, entity 1) among the 13558 pairs of 165 event slots and 8 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 9 / 6   gate: PASS
;; A fillers: children ×3, Tony, Yumi, biology, boys, child   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; cosine: 0.62 (gate)   JSD: 0.482   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 play) (Agent $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: PASS
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; cosine: 0.57 (gate)   JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: PASS
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000756
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; cosine: 0.55 (gate)   JSD: 0.475   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnTryAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnTryAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 6   gate: PASS
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; cosine: 0.51 (gate)   JSD: 0.569   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: PASS
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; cosine: 0.50 (gate)   JSD: 0.547   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; cosine: 0.49 (gate)   JSD: 0.617   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James, Donald, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  buy.Agent ~ walk.Agent   n 3 / 8   gate: FAIL
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000148
;; cosine: 0.47 (gate)   JSD: 0.557   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  decide.Agent ~ hear.Experiencer   n 4 / 8   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; cosine: 0.47 (gate)   JSD: 0.524   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrDecideAgent $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (MnHearExperiencerOrDecideAgent $e0 $x1))

;; [different class and role]  get.Agent ~ hear.Experiencer   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-001325
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; cosine: 0.47 (gate)   JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHearExperiencerOrGetAgent $e0 $x1))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000942
;; cosine: 0.46 (gate)   JSD: 0.57   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {girl, girls, girl, little}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 7   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000978 tierB-000987
;; cosine: 0.46 (gate)   JSD: 0.538   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000168
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-000030
;; cosine: 0.45 (gate)   JSD: 0.554   shared clusters: 2 e.g. {Yanni} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; cosine: 0.41 (gate)   JSD: 0.605   shared clusters: 3 e.g. {child, children, kid, baby, …} {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; cosine: 0.41 (gate)   JSD: 0.656   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrWalkAgent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnHearExperiencerOrWalkAgent $e0 $x1))

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 8   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; cosine: 0.40 (gate)   JSD: 0.636   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-001773 tierB-000577
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; cosine: 0.39 (gate)   JSD: 0.618   shared clusters: 3 e.g. {man, young} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; cosine: 0.39 (gate)   JSD: 0.557   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrGiveAgent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnHearExperiencerOrGiveAgent $e0 $x1))

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001044
;; cosine: 0.38 (gate)   JSD: 0.641   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {customer, customers} {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ want.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; cosine: 0.38 (gate)   JSD: 0.73   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnMakeAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  walk.Agent ~ want.Experiencer   n 8 / 6   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000846 tierB-000626
;; cosine: 0.38 (gate)   JSD: 0.663   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnWalkAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnWalkAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  bring.Theme ~ leave.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jonathan, advantage, british ship   e.g. tierB-000636 tierB-000427
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000100 tierB-000004
;; cosine: 0.36 (gate)   JSD: 0.662   shared clusters: 2 e.g. {ship, british ship, israeli military ship, merchant ship, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 bring) (Theme $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrBringTheme $e0 $x1))
(Implication (And (Member $e0 bring) (Theme $e0 $x1)) (MnLeaveAgentOrBringTheme $e0 $x1))

;; [different class and role]  hear.Experiencer ~ leave.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; cosine: 0.36 (gate)   JSD: 0.626   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnLeaveAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; cosine: 0.36 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Santiago} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ travel.Agent   n 10 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000004
;; B fillers: people ×2, Matthew, Roger, campaigner   e.g. tierB-001618 tierB-000995
;; cosine: 0.36 (gate)   JSD: 0.682   shared clusters: 2 e.g. {person, people} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; cosine: 0.35 (gate)   JSD: 0.685   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ go.Agent   n 7 / 13   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaires   e.g. tierB-000075 tierB-000173
;; B fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; cosine: 0.34 (gate)   JSD: 0.717   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ hear.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; cosine: 0.34 (gate)   JSD: 0.702   shared clusters: 5 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHaveHolderOrHearExperiencer $e0 $x1))

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; cosine: 0.34 (gate)   JSD: 0.716   shared clusters: 3 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  leave.Agent ~ want.Experiencer   n 10 / 6   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; cosine: 0.34 (gate)   JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnLeaveAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnLeaveAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 6   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; cosine: 0.34 (gate)   JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnTryAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnTryAgentOrWantExperiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ make.Agent   n 13 / 18   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-000115
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000173
;; cosine: 0.33 (gate)   JSD: 0.686   shared clusters: 4 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Hanako, Iga, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ live.Agent   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000012
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000048
;; cosine: 0.33 (gate)   JSD: 0.733   shared clusters: 2 e.g. {Mennad, Ziri, Malaleel, Tiziri, …} {Linda, Beth, Amanda, Isabella, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 18   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; cosine: 0.32 (gate)   JSD: 0.732   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaires   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; cosine: 0.32 (gate)   JSD: 0.722   shared clusters: 2 e.g. {David, William, James, Donald, …} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ leave.Agent   n 4 / 10   gate: FAIL
;; A fillers: Layla, Martino, muslims, people   e.g. tierB-000556 tierB-000450
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000704
;; cosine: 0.32 (gate)   JSD: 0.698   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; B fillers: Daniel, Jordan Peterson, Linda, friends, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; cosine: 0.32 (gate)   JSD: 0.73   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-000370 tierB-001910
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; cosine: 0.31 (gate)   JSD: 0.692   shared clusters: 2 e.g. {expensive, expensive, thing} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [same role, different class]  start.Agent ~ take.Agent   n 6 / 7   gate: FAIL
;; A fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000942 tierB-000199
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-001102 tierB-000978
;; cosine: 0.31 (gate)   JSD: 0.692   shared clusters: 2 e.g. {cook, recipe} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ go.Agent   n 5 / 13   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-001145
;; cosine: 0.29 (gate)   JSD: 0.73   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-000012
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-000313
;; cosine: 0.29 (gate)   JSD: 0.707   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ need.Experiencer   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-000672
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000107 tierB-000061
;; cosine: 0.29 (gate)   JSD: 0.713   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnNeedExperiencerOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnNeedExperiencerOrGetAgent $e0 $x1))

;; [same role, different class]  get.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-001325
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; cosine: 0.29 (gate)   JSD: 0.713   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-001219 tierB-000043
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000036
;; cosine: 0.29 (gate)   JSD: 0.713   shared clusters: 2 e.g. {school janitor} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Agent ~ make.Agent   n 3 / 18   gate: FAIL
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000025
;; cosine: 0.29 (gate)   JSD: 0.744   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  help.Agent ~ leave.Agent   n 5 / 10   gate: FAIL
;; A fillers: Jonas, Michael, context, hothouse conditions, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000004
;; cosine: 0.28 (gate)   JSD: 0.725   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ play.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: children ×3, Tony, Yumi, biology, boys, child   e.g. tierB-000160 tierB-000648
;; cosine: 0.28 (gate)   JSD: 0.751   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ want.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001145 tierB-001183
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; cosine: 0.27 (gate)   JSD: 0.748   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnGoAgentOrWantExperiencer $e0 $x1))

;; [different class and role]  need.Experiencer ~ take.Agent   n 8 / 7   gate: FAIL
;; A fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000107 tierB-000061
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000987 tierB-001102
;; cosine: 0.27 (gate)   JSD: 0.733   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 need) (Experiencer $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnNeedExperiencerOrTakeAgent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnNeedExperiencerOrTakeAgent $e0 $x1))

;; [same role, different class]  take.Agent ~ walk.Agent   n 7 / 8   gate: FAIL
;; A fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000252 tierB-000987
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; cosine: 0.27 (gate)   JSD: 0.733   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 9   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000421 tierB-000189
;; B fillers: scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001879
;; cosine: 0.26 (gate)   JSD: 0.721   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Fadil, Jamil, Sami}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (MnStudyAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnStudyAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  decide.Agent ~ live.Agent   n 4 / 8   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-001544 tierB-000563
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-000048 tierB-000524
;; cosine: 0.26 (gate)   JSD: 0.656   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 6   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000564
;; B fillers: Dad, Dan, Dmitri, adaptor, old, person, volunteers   e.g. tierB-001813 tierB-000212
;; cosine: 0.26 (gate)   JSD: 0.745   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ study.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-001185 tierB-000577
;; B fillers: scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000203 tierB-001879
;; cosine: 0.25 (gate)   JSD: 0.73   shared clusters: 2 e.g. {Yuri, Leonid} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ take.Agent   n 18 / 7   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000978 tierB-000987
;; cosine: 0.24 (gate)   JSD: 0.79   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 7   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000252 tierB-000987
;; cosine: 0.24 (gate)   JSD: 0.763   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ study.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; B fillers: scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-001544 tierB-001879
;; cosine: 0.23 (gate)   JSD: 0.778   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; cosine: 0.22 (gate)   JSD: 0.838   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGiveAgent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnHaveHolderOrGiveAgent $e0 $x1))

;; [different class and role]  go.Agent ~ hear.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; cosine: 0.22 (gate)   JSD: 0.775   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnGoAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  leave.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; cosine: 0.22 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; cosine: 0.22 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ try.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; cosine: 0.21 (gate)   JSD: 0.8   shared clusters: 4 e.g. {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrTryAgent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (MnHaveHolderOrTryAgent $e0 $x1))

;; [different class and role]  decide.Agent ~ have.Holder   n 4 / 34   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000162
;; cosine: 0.20 (gate)   JSD: 0.85   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrDecideAgent $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (MnHaveHolderOrDecideAgent $e0 $x1))

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 34   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-001325
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; cosine: 0.20 (gate)   JSD: 0.821   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001003
;; cosine: 0.20 (gate)   JSD: 0.795   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnMakeAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, barking, growling, noises, crash, knock, music, upbeat, noise, ticking   e.g. tierB-000756 tierB-000751
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001816 tierB-001899
;; cosine: 0.20 (gate)   JSD: 0.799   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {knock, kick, kick out}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))

;; [same role, different class]  leave.Agent ~ try.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; cosine: 0.20 (gate)   JSD: 0.8   shared clusters: 2 e.g. {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ need.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001145
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000107 tierB-000455
;; cosine: 0.18 (gate)   JSD: 0.806   shared clusters: 2 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnGoAgentOrNeedExperiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ walk.Agent   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; cosine: 0.18 (gate)   JSD: 0.806   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ make.Agent   n 34 / 18   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; cosine: 0.18 (gate)   JSD: 0.856   shared clusters: 3 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveHolderOrMakeAgent $e0 $x1))

;; [different class and role]  have.Holder ~ need.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-001216
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000086 tierB-000107
;; cosine: 0.18 (gate)   JSD: 0.837   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrNeedExperiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (MnHaveHolderOrNeedExperiencer $e0 $x1))

;; [different class and role]  have.Holder ~ want.Experiencer   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000358 tierB-001216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; cosine: 0.18 (gate)   JSD: 0.867   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWantExperiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (MnHaveHolderOrWantExperiencer $e0 $x1))

;; [different class and role]  have.Holder ~ write.Patient   n 34 / 4   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000931 tierB-000142
;; B fillers: book, character, letter, sentence   e.g. tierB-001962 tierB-000971
;; cosine: 0.17 (gate)   JSD: 0.864   shared clusters: 2 e.g. {book, library, books} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWritePatient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (MnHaveHolderOrWritePatient $e0 $x1))

;; [same role, different class]  go.Agent ~ try.Agent   n 13 / 10   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; cosine: 0.16 (gate)   JSD: 0.825   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-000206 tierB-001910
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-001504 tierB-001594
;; cosine: 0.16 (gate)   JSD: 0.841   shared clusters: 2 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ leave.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; cosine: 0.16 (gate)   JSD: 0.85   shared clusters: 3 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 34   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-000368 tierB-001690
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001103 tierB-001016
;; cosine: 0.15 (gate)   JSD: 0.873   shared clusters: 2 e.g. {food, eat} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 34   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-000206 tierB-000748
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-000790
;; cosine: 0.13 (gate)   JSD: 0.886   shared clusters: 2 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))

;; [different class and role]  have.Holder ~ take.Agent   n 34 / 7   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000855
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000987 tierB-001102
;; cosine: 0.13 (gate)   JSD: 0.886   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))

;; [different class and role]  have.Holder ~ use.Theme   n 34 / 17   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001177 tierB-000142
;; B fillers: Iga, Laravel, Midway, auto tune, calendars, various, chemical agent   e.g. tierB-001154 tierB-000971
;; cosine: 0.12 (gate)   JSD: 0.878   shared clusters: 3 e.g. {word, word processor} {sentence, english sentence, sentences} {room, changing room, rooms}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))

;; [different class and role]  have.Holder ~ walk.Agent   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; cosine: 0.12 (gate)   JSD: 0.892   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWalkAgent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (MnHaveHolderOrWalkAgent $e0 $x1))

;; [different class and role]  change.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000098 tierB-001217
;; B fillers: antlers, atmosphere, homely, bank, documents, valuable, beautiful, garden, beauty salons, blue, curtain   e.g. tierB-000722 tierB-000162
;; cosine: 0.11 (gate)   JSD: 0.889   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))

;; [different class and role]  have.Holder ~ live.Agent   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001467 tierB-000162
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001049 tierB-000524
;; cosine: 0.10 (gate)   JSD: 0.892   shared clusters: 2 e.g. {mozabite, tuareg, Beja, mozabites, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrLiveAgent $e0 $x1))
(Implication (And (Member $e0 live) (Agent $e0 $x1)) (MnHaveHolderOrLiveAgent $e0 $x1))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 39 / 7   gate: FAIL
;; A fillers: here ×3, city ×2, class ×2, garden ×2, Algiers, El Harrach   e.g. tierB-000523 tierB-001111
;; B fillers: animal, cake, ivy, plant, play, road, street   e.g. tierB-001932 tierB-001966
;; cosine: 0.10 (gate)   JSD: 0.896   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 9   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001457 tierB-000951
;; B fillers: children ×3, Tony, Yumi, biology, boys, child   e.g. tierB-001840 tierB-000939
;; cosine: 0.09 (gate)   JSD: 0.847   shared clusters: 2 e.g. {boy, boys} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ have.Holder   n 13 / 34   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; cosine: 0.09 (gate)   JSD: 0.91   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGoAgent $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnHaveHolderOrGoAgent $e0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 35 / 18   gate: FAIL
;; A fillers: antlers, atmosphere, homely, bank, documents, valuable, beautiful, garden, beauty salons, blue, curtain   e.g. tierB-000162 tierB-001264
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001920
;; cosine: 0.07 (gate)   JSD: 0.922   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {curtain, blue, curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))

;; [different class and role]  have.Holder ~ make.Patient   n 34 / 20   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-001016
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-001504 tierB-000371
;; cosine: 0.07 (gate)   JSD: 0.924   shared clusters: 2 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
