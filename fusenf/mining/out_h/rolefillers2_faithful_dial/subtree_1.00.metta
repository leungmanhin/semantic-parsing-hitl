;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 1.00 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate       canonical_substrate.jsonl (2302 records); out_h/valuations_occ.jsonl (8586 filler occurrences)
;;   embeddings      out_h/embeddings: Qwen3-Embedding-8B, bf16, normalised; 3399 texts, dim 4096
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
;;                   outside the distributions: 177 occurrences excluded in this block, 3733 filler units enter
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

;; ==================== SLOT PAIRS: 1 pass the gate (event 1, entity 0); 34 pairs listed = every pair with >= 2 shared clusters (event 33, entity 1) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000259
;; JSD: 0.23   shared clusters: 2 e.g. {person} {sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 appear) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: FAIL
;; A fillers: host, industrialization, whigs   e.g. tierC-000087 tierC-000088
;; B fillers: guests, industrialization, whigs   e.g. tierB-001868 tierC-000088
;; JSD: 0.333   shared clusters: 2 e.g. {industrialization} {whigs}
;; A: (And (Member $e0 welcome) (Agent $e0 $x1))
;; B: (And (Member $e0 welcome) (Theme $e0 $x1))
(Implication (And (Member $e0 welcome) (Theme $e0 $x1)) (And (Member $e0 welcome) (Agent $e0 $x1)))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000330 tierB-001156
;; JSD: 0.357   shared clusters: 2 e.g. {person} {sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  portray.Agent ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000301 tierC-000277
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierC-000302 tierB-000730
;; JSD: 0.357   shared clusters: 3 e.g. {James Woods} {Wilson} {wilson}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  die.Patient ~ kill.Patient   n 4 / 11   gate: FAIL
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: people ×4, person ×2, fox, gazelle, soldier, soldiers   e.g. tierB-000393 tierB-000412
;; JSD: 0.416   shared clusters: 2 e.g. {people} {person}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 kill) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  portray.Theme ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierC-000301 tierC-000302
;; JSD: 0.427   shared clusters: 2 e.g. {James Woods} {Wilson}
;; A: (And (Member $e0 portray) (Theme $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
(Implication (And (Member $e0 win) (Agent $e0 $x1)) (MnWinAgentOrPortrayTheme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (MnWinAgentOrPortrayTheme $e0 $x1))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierC-000330
;; JSD: 0.487   shared clusters: 2 e.g. {person} {sisters}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settlers ×2, Paul, indigenous americans, native americans, writer   e.g. tierB-000863 tierB-000728
;; JSD: 0.517   shared clusters: 3 e.g. {european american settlers} {indigenous americans} {native americans}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 create) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000301 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000277 tierC-000247
;; JSD: 0.525   shared clusters: 2 e.g. {James Woods} {Wilson}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 portray) (Theme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierB-000706 tierC-000243
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000244 tierB-000585
;; JSD: 0.547   shared clusters: 2 e.g. {Couper} {Pietro}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Theme $e0 $x1)))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; JSD: 0.554   shared clusters: 2 e.g. {Rima} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000168
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.578   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: birds, brown, dog, children, person   e.g. tierB-000338 tierB-001973
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierC-000128
;; JSD: 0.604   shared clusters: 2 e.g. {person} {birds}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, cyanide, harmless, trace, destined, film, syrian film, film, syrian film, insulin   e.g. tierC-000092 tierB-001995
;; JSD: 0.605   shared clusters: 2 e.g. {movie} {film, syrian film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 produce) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000942
;; JSD: 0.636   shared clusters: 2 e.g. {girls} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  draw.Agent ~ sleep.Experiencer   n 5 / 6   gate: FAIL
;; A fillers: Cowper ×2, child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.636   shared clusters: 2 e.g. {child} {children}
;; A: (And (Member $e0 draw) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrDrawAgent $e0 $x1))
(Implication (And (Member $e0 draw) (Agent $e0 $x1)) (MnSleepExperiencerOrDrawAgent $e0 $x1))

;; [different class and role]  follow.Agent ~ rule.Theme   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000095 tierC-000096
;; B fillers: Cuba, house, muslim, muslim house   e.g. tierB-000311 tierC-000095
;; JSD: 0.639   shared clusters: 2 e.g. {house, muslim} {muslim house}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 rule) (Theme $e0 $x1))
(Implication (And (Member $e0 follow) (Agent $e0 $x1)) (MnFollowAgentOrRuleTheme $e0 $x1))
(Implication (And (Member $e0 rule) (Theme $e0 $x1)) (MnFollowAgentOrRuleTheme $e0 $x1))

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000337 tierC-000076
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000338 tierC-000075
;; JSD: 0.639   shared clusters: 2 e.g. {Bailey} {Alexander}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, traditions ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000337 tierC-000076
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000338 tierC-000075
;; JSD: 0.639   shared clusters: 2 e.g. {Henry Cole} {Margaret Fleming}
;; A: (And (Member $e0 follow) (Theme $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierC-000209 tierC-000210
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friends, novelist   e.g. tierB-000327 tierB-000078
;; JSD: 0.643   shared clusters: 3 e.g. {Katherine} {Linda} {Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plants   e.g. tierB-000462 tierC-000227
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000942 tierB-000978
;; JSD: 0.661   shared clusters: 2 e.g. {thing} {cook}
;; A: (And (Member $e0 add) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  draw.Agent ~ play.Agent   n 5 / 15   gate: FAIL
;; A fillers: Cowper ×2, child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; JSD: 0.692   shared clusters: 2 e.g. {children} {child}
;; A: (And (Member $e0 draw) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, complex, simple, labourers, technetium   e.g. tierC-000163 tierC-000164
;; B fillers: main songwriting unit ×2, complex, simple, human barricade, main, songwriting unit, technetium   e.g. tierB-000780 tierC-000180
;; JSD: 0.692   shared clusters: 2 e.g. {technetium} {complex, simple}
;; A: (And (Member $e0 form) (Agent $e0 $x1))
;; B: (And (Member $e0 form) (Patient $e0 $x1))
(Implication (And (Member $e0 form) (Patient $e0 $x1)) (And (Member $e0 form) (Agent $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.717   shared clusters: 2 e.g. {children} {child}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 play) (Agent $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.769   shared clusters: 2 e.g. {cat} {children}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000313 tierB-001496
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; JSD: 0.784   shared clusters: 2 e.g. {Linda} {children}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.809   shared clusters: 2 e.g. {Mark} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; JSD: 0.827   shared clusters: 3 e.g. {hotel} {room} {thing}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuildPatient $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (MnHaveHolderOrBuildPatient $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.839   shared clusters: 2 e.g. {James} {Damiano}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000091 tierC-000138
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001555 tierC-000271
;; JSD: 0.862   shared clusters: 2 e.g. {thing} {movie}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrDirectPatient $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (MnHaveHolderOrDirectPatient $e0 $x1))

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.87   shared clusters: 2 e.g. {thing} {Diego}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-000368 tierB-001690
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001103 tierB-001016
;; JSD: 0.894   shared clusters: 2 e.g. {food} {house}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000114 tierC-000314
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000113 tierC-000313
;; JSD: 0.896   shared clusters: 2 e.g. {islamic ivory} {Yunnan}
;; A: (PartOf $x0 $x1)
;; B: (Possession $x0 $x1)
(Implication (PartOf $x0 $x1) (Possession $x0 $x1))
