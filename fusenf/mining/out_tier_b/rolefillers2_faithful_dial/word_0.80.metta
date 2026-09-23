;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
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
;;   (Implication <minority slot> <the same slot relabelled to the majority head>)
;;     = the merge as the rule it would become (the paper: the two slots 'fulfil the same semantic role');
;;     the majority side (larger n; tie -> the alphabetically first name) is the canonical form; a role pair
;;     gives the role-vocabulary collapse (<minority role> -> <majority role>); a pair whose slots already share
;;     the head has no rule (the merge is done by construction) and says so; rendered for PASS and FAIL alike,
;;     the verdict is on the record; naming and direction provisional, the gauntlet decides
;; Slot pairs: every pair with >= 2 shared clusters (the gate's first condition); a pair sharing fewer
;; clusters cannot pass and is not listed.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as
;; (And (Member $x0 <class>) (<Head> $x0 $x1)) (bare (<Head> $x0 $x1) for an unclassed centre), a role pair's
;; side as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== SLOT PAIRS: 0 pass the gate (event 0, entity 0); 115 pairs listed = every pair with >= 2 shared clusters (event 114, entity 1) among the 13558 pairs of 165 event slots and 8 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: FAIL
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000425 tierB-000004
;; B fillers: on, open, unlocked   e.g. tierB-000747 tierB-000425
;; JSD: 0.311   shared clusters: 3 e.g. {open, close, end, closed} {use, well, do, on, …} {unlocked, locked, lock, door, locked}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000125
;; JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000756
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; JSD: 0.475   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 9 / 6   gate: FAIL
;; A fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.482   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [different class and role]  decide.Agent ~ hear.Experiencer   n 4 / 8   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; JSD: 0.524   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (And (Member $e0 decide) (Experiencer $e0 $x1)))

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-001658
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; JSD: 0.531   shared clusters: 4 e.g. {bad, bad, matter, bad, problem} {expensive, expensive, thing} {cheap, inexpensive, low, price} {short, shortening}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 7   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000978 tierB-000987
;; JSD: 0.538   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.547   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000168
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000125 tierB-000030
;; JSD: 0.554   shared clusters: 2 e.g. {Yanni} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (And (Member $e0 stop) (Experiencer $e0 $x1)))

;; [same role, different class]  buy.Agent ~ walk.Agent   n 3 / 8   gate: FAIL
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000148
;; JSD: 0.557   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.557   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (And (Member $e0 give) (Experiencer $e0 $x1)))

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-000410 tierB-001551
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.569   shared clusters: 2 e.g. {child, children, kid, baby, …} {dog, dog feed}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Experiencer $e0 $x1)))

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 6   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.569   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
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

;; [different class and role]  get.Agent ~ hear.Experiencer   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Experiencer $e0 $x1)))

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000654 tierB-001675
;; JSD: 0.599   shared clusters: 4 e.g. {black, blue, brown, gray, …} {gusher} {yellow, orange} {red, rag, rip, rough, …}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.605   shared clusters: 3 e.g. {child, children, kid, baby, …} {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same role, different class]  learn.Theme ~ speak.Theme   n 3 / 4   gate: FAIL
;; A fillers: berber, vocabulary, foreign ×0.5, language ×0.5   e.g. tierB-000608 tierB-000229
;; B fillers: czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-001068 tierB-000053
;; JSD: 0.615   shared clusters: 2 e.g. {language, english} {foreign, foreign language, foreign, language, foreigner}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-001773
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001182
;; JSD: 0.617   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; JSD: 0.617   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James, Donald, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000577
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; JSD: 0.618   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old} {young, critic, young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ leave.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.626   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 8   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.636   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001044
;; JSD: 0.641   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {customer, customers} {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bear.Patient ~ get.Agent   n 3 / 6   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-001325
;; JSD: 0.656   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [same role, different class]  decide.Agent ~ live.Agent   n 4 / 8   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-001544 tierB-000563
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-000048 tierB-000524
;; JSD: 0.656   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000189 tierB-000751
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.656   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Experiencer $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 5 / 3   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-001582 tierB-001817
;; B fillers: alarmed, conservative, red   e.g. tierB-001079 tierB-001582
;; JSD: 0.662   shared clusters: 2 e.g. {red, rag, rip, rough, …} {conservative, conservative, revolutionary}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [different class and role]  bring.Theme ~ leave.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jonathan, advantage, british ship   e.g. tierB-000636 tierB-000427
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000100 tierB-000004
;; JSD: 0.662   shared clusters: 2 e.g. {ship, british ship, israeli military ship, merchant ship, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 bring) (Theme $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 bring) (Theme $e0 $x1)) (And (Member $e0 bring) (Agent $e0 $x1)))

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; JSD: 0.662   shared clusters: 2 e.g. {Santiago} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  walk.Agent ~ want.Experiencer   n 8 / 6   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000846 tierB-000626
;; JSD: 0.663   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000117
;; JSD: 0.664   shared clusters: 4 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ travel.Agent   n 10 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000004
;; B fillers: person ×2, Matthew, Roger, campaigner   e.g. tierB-001618 tierB-000995
;; JSD: 0.682   shared clusters: 2 e.g. {person, people} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ make.Agent   n 13 / 18   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-000115
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000173
;; JSD: 0.686   shared clusters: 4 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Hanako, Iga, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ take.Agent   n 6 / 7   gate: FAIL
;; A fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000942 tierB-000199
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-001102 tierB-000978
;; JSD: 0.692   shared clusters: 2 e.g. {cook, recipe} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ leave.Agent   n 4 / 10   gate: FAIL
;; A fillers: Layla, Martino, muslim, person   e.g. tierB-000556 tierB-000450
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000704
;; JSD: 0.698   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ hear.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.702   shared clusters: 5 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Holder $e0 $x1)))

;; [different class and role]  leave.Agent ~ want.Experiencer   n 10 / 6   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 6   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-000012
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-000313
;; JSD: 0.707   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {child, children, kid, baby, …}
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
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Experiencer $e0 $x1)))

;; [same role, different class]  get.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.713   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-001219 tierB-000043
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000036
;; JSD: 0.713   shared clusters: 2 e.g. {school janitor} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ go.Agent   n 7 / 13   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000075 tierB-000173
;; B fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; JSD: 0.717   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 9   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000421 tierB-000189
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-000253 tierB-001879
;; JSD: 0.721   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Fadil, Jamil, Sami}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaire   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; JSD: 0.722   shared clusters: 2 e.g. {David, William, James, Donald, …} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Theme ~ turn.Result   n 5 / 5   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000367 tierB-000368
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000832 tierB-000476
;; JSD: 0.725   shared clusters: 2 e.g. {yellow, orange} {black, blue, brown, gray, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Theme $e0 $x1)))

;; [same role, different class]  help.Agent ~ leave.Agent   n 5 / 10   gate: FAIL
;; A fillers: Jonas, Michael, context, hothouse condition, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000004
;; JSD: 0.725   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
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
;; JSD: 0.73   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ want.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; JSD: 0.73   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 18   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; JSD: 0.732   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ live.Agent   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000219 tierB-000012
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001768 tierB-000048
;; JSD: 0.733   shared clusters: 2 e.g. {Mennad, Ziri, Malaleel, Tiziri, …} {Linda, Beth, Amanda, Isabella, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  need.Experiencer ~ take.Agent   n 8 / 7   gate: FAIL
;; A fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000061
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000987 tierB-001102
;; JSD: 0.733   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 need) (Experiencer $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Experiencer $e0 $x1)))

;; [same role, different class]  take.Agent ~ walk.Agent   n 7 / 8   gate: FAIL
;; A fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000252 tierB-000987
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; JSD: 0.733   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  buy.Agent ~ make.Agent   n 3 / 18   gate: FAIL
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000025
;; JSD: 0.744   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 6   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000564
;; B fillers: Dad, Dan, Dmitri, person, volunteer, adaptor ×0.5   e.g. tierB-001813 tierB-000212
;; JSD: 0.745   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bear.Patient ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000487
;; JSD: 0.747   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [different class and role]  go.Agent ~ want.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001145 tierB-001183
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-000626 tierB-001390
;; JSD: 0.748   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ play.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001857
;; B fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-000160 tierB-000648
;; JSD: 0.751   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000370 tierB-000748
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.754   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 5 / 9   gate: FAIL
;; A fillers: Lady Ashton, thing, conservative ×0.5, earth ×0.5, intense ×0.5, noise ×0.5   e.g. tierB-000740 tierB-000352
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000695
;; JSD: 0.758   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (And (Member $e0 become) (Stimulus $e0 $x1)))

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 7   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000252 tierB-000987
;; JSD: 0.763   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
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

;; [different class and role]  go.Agent ~ hear.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; JSD: 0.775   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  leave.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; JSD: 0.777   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-000487
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.777   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ study.Agent   n 13 / 9   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000012 tierB-000313
;; B fillers: scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus, Peter   e.g. tierB-001544 tierB-001879
;; JSD: 0.778   shared clusters: 2 e.g. {Linda, Beth, Amanda, Isabella, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ take.Agent   n 18 / 7   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000978 tierB-000987
;; JSD: 0.79   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bear.Patient ~ make.Agent   n 3 / 18   gate: FAIL
;; A fillers: Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001568 tierB-000906
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000025
;; JSD: 0.795   shared clusters: 2 e.g. {Boldi, Bruno, Elias, Felix, …} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001538 tierB-001003
;; JSD: 0.795   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 6   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Dad, Dan, Dmitri, person, volunteer, adaptor ×0.5   e.g. tierB-001134 tierB-001187
;; JSD: 0.798   shared clusters: 2 e.g. {old, aging, ages ago, elderly} {adaptor, adaptor, old}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000751
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001816 tierB-001899
;; JSD: 0.799   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {knock, kick, kick out}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [different class and role]  have.Holder ~ try.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000947
;; JSD: 0.8   shared clusters: 4 e.g. {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (And (Member $e0 try) (Holder $e0 $x1)))

;; [same role, different class]  leave.Agent ~ try.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; JSD: 0.8   shared clusters: 2 e.g. {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ need.Experiencer   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001496 tierB-001145
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000455
;; JSD: 0.806   shared clusters: 2 e.g. {child, children, kid, baby, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ walk.Agent   n 13 / 8   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.806   shared clusters: 2 e.g. {Baya, Skura, Hanako, Iga, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000890 tierB-000206
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; JSD: 0.81   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {big, huge, large, massive, …} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 34   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-001325
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; JSD: 0.821   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ try.Agent   n 13 / 10   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; JSD: 0.825   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ need.Experiencer   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-001216
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000086 tierB-000107
;; JSD: 0.837   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Holder $e0 $x1)))

;; [different class and role]  give.Agent ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000730
;; JSD: 0.838   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James, Donald, …}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (And (Member $e0 give) (Holder $e0 $x1)))

;; [different class and role]  eat.Agent ~ start.Patient   n 4 / 11   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000338
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001446
;; JSD: 0.839   shared clusters: 2 e.g. {dog, dog feed} {black, blue, brown, gray, …}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Patient $e0 $x1)))

;; [same role, different class]  start.Patient ~ turn.Patient   n 11 / 7   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-000654
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-000832
;; JSD: 0.843   shared clusters: 3 e.g. {gusher} {freedom movement, freedom, independence} {black, blue, brown, gray, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 9   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001457 tierB-000951
;; B fillers: child ×4, Tony, Yumi, biology, boy, religion   e.g. tierB-001840 tierB-000939
;; JSD: 0.847   shared clusters: 2 e.g. {boy, boys} {Baya, Skura, Hanako, Iga, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Theme ~ turn.Patient   n 5 / 7   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000367 tierB-000368
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; JSD: 0.849   shared clusters: 2 e.g. {black, blue, brown, gray, …} {yellow, orange}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Patient $e0 $x1)))

;; [different class and role]  decide.Agent ~ have.Holder   n 4 / 34   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-000401 tierB-001597
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000162
;; JSD: 0.85   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 decide) (Agent $e0 $x1)) (And (Member $e0 decide) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ leave.Agent   n 34 / 10   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.85   shared clusters: 3 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (And (Member $e0 leave) (Holder $e0 $x1)))

;; [different class and role]  start.Patient ~ turn.Result   n 11 / 5   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-000654
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000476 tierB-000832
;; JSD: 0.85   shared clusters: 2 e.g. {gusher} {black, blue, brown, gray, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 20   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000371 tierB-000048
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; JSD: 0.851   shared clusters: 3 e.g. {house, home, comfortable, house, houses, …} {big, huge, large, massive, …} {cozy, comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (And (Member $e0 live) (Patient $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Agent   n 34 / 18   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; JSD: 0.856   shared clusters: 3 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ write.Patient   n 34 / 4   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000931 tierB-000142
;; B fillers: book, character, letter, sentence   e.g. tierB-001962 tierB-000971
;; JSD: 0.864   shared clusters: 2 e.g. {book, library, books} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (And (Member $e0 write) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ want.Experiencer   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000358 tierB-001216
;; B fillers: Benedito, Edmundo, Leon, Pepper, Tony, cat   e.g. tierB-001988 tierB-000626
;; JSD: 0.867   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Bob, Thomas, John, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Holder $e0 $x1)))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 34   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000368 tierB-001690
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001103 tierB-001016
;; JSD: 0.873   shared clusters: 2 e.g. {food, eat} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ use.Theme   n 34 / 17   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001177 tierB-000142
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001154 tierB-000971
;; JSD: 0.878   shared clusters: 3 e.g. {word, word processor} {sentence, english sentence, sentences} {room, changing room, rooms}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (And (Member $e0 use) (Holder $e0 $x1)))

;; [different class and role]  create.Patient ~ use.Theme   n 3 / 17   gate: FAIL
;; A fillers: particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: Iga, Laravel, Midway, auto tune, chemical agent, fire   e.g. tierB-001154 tierB-000268
;; JSD: 0.88   shared clusters: 2 e.g. {schedule, calendar} {general, various, all, everything, …}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (And (Member $e0 create) (Theme $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 34   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000206 tierB-000748
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-000790
;; JSD: 0.88   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {bad, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 20   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-000904 tierB-001920
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-000371
;; JSD: 0.881   shared clusters: 2 e.g. {beautiful, attractive, gorgeous, pretty} {room, changing room, rooms}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Patient $e0 $x1)))

;; [different class and role]  have.Holder ~ take.Agent   n 34 / 7   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000855
;; B fillers: Gustavo, Jerry Rawlings, Lajos, Michael, cook, president   e.g. tierB-000987 tierB-001102
;; JSD: 0.886   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karl, Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-000098 tierB-001217
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000722 tierB-000162
;; JSD: 0.889   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Patient   n 34 / 20   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000819 tierB-000790
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001504 tierB-001594
;; JSD: 0.889   shared clusters: 4 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {house, home, comfortable, house, houses, …} {room, changing room, rooms} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ live.Agent   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001467 tierB-000162
;; B fillers: Beja, Cainan, Elias, Mary, Ray Kurtzweil, Tiziri   e.g. tierB-001049 tierB-000524
;; JSD: 0.892   shared clusters: 2 e.g. {mozabite, tuareg, Beja, mozabites, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 live) (Agent $e0 $x1))
(Implication (And (Member $e0 live) (Agent $e0 $x1)) (And (Member $e0 live) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ walk.Agent   n 34 / 8   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001216 tierB-000162
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000148
;; JSD: 0.892   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Elias, Felix, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Holder $e0 $x1)))

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 34   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001264 tierB-000790
;; JSD: 0.896   shared clusters: 2 e.g. {room, changing room, rooms} {weather, bad, weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Holder $e0 $x1)))

;; [same class, different role]  make.Patient ~ make.Result   n 20 / 7   gate: FAIL
;; A fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001920 tierB-001594
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001431 tierB-001504
;; JSD: 0.898   shared clusters: 2 e.g. {beautiful, attractive, gorgeous, pretty} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 39 / 7   gate: FAIL
;; A fillers: here ×3, city ×2, class ×2, garden ×2, full ×1.5, Algiers   e.g. tierB-000523 tierB-001111
;; B fillers: animal, cake, ivy, plant, play, student association   e.g. tierB-001932 tierB-001966
;; JSD: 0.908   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  go.Agent ~ have.Holder   n 13 / 34   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000115 tierB-001145
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000730 tierB-001216
;; JSD: 0.91   shared clusters: 2 e.g. {David, William, James, Donald, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (And (Member $e0 go) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ work.Agent   n 34 / 6   gate: FAIL
;; A fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-000665 tierB-001861
;; B fillers: Dad, Dan, Dmitri, person, volunteer, adaptor ×0.5   e.g. tierB-001873 tierB-000212
;; JSD: 0.91   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {old, aging, ages ago, elderly}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (And (Member $e0 work) (Holder $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 35   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001658 tierB-000370
;; B fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001553 tierB-000162
;; JSD: 0.914   shared clusters: 2 e.g. {day, days, days, short, one day} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Result   n 35 / 7   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-001016
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001431 tierB-001920
;; JSD: 0.931   shared clusters: 2 e.g. {black, blue, brown, gray, …} {beautiful, attractive, gorgeous, pretty}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ start.Patient   n 35 / 11   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001816
;; JSD: 0.932   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {black, blue, brown, gray, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (And (Member $e0 start) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Agent   n 35 / 18   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-000162 tierB-001264
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-001920
;; JSD: 0.936   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {curtain, blue, curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ turn.Patient   n 35 / 7   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001264 tierB-001929
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-000832
;; JSD: 0.936   shared clusters: 2 e.g. {leaf, foliage, leaves} {black, blue, brown, gray, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 turn) (Patient $e0 $x1)) (And (Member $e0 turn) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Patient   n 35 / 20   gate: FAIL
;; A fillers: antler, beauty salon, cemetery, chance, color, day   e.g. tierB-001016 tierB-000931
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001920 tierB-001431
;; JSD: 0.963   shared clusters: 2 e.g. {paper, document, paper sheet, paper sheets} {beautiful, attractive, gorgeous, pretty}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))
