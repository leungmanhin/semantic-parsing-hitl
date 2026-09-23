;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.85 — the adopted setting. The other 9 mode × cut blocks of the dial:
;;   rolefillers2_faithful_dial/<mode>_<cut>.metta
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
;;                   outside the distributions: 177 occurrences excluded in this block, 4131 filler units enter
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

;; ==================== SLOT PAIRS: 3 pass the gate (event 3, entity 0); 110 pairs listed = every pair with >= 2 shared clusters (event 108, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×3, family   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 sleep) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (MnDiePatientOrSleepAgent $e0 $x1))
(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (MnDiePatientOrSleepAgent $e0 $x1))

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000050 tierC-000259
;; JSD: 0.23   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 appear) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  design.Agent ~ produce.Agent   n 4 / 8   gate: PASS
;; A fillers: Henry L. Taylor ×2, Philip Hercus, Robert Allan Limited   e.g. tierC-000184 tierC-000119
;; B fillers: Colin Richardson ×2, Harvey Hayutin ×2, Sy Weintraub ×2, pancreas, layer ×0.333, oil ×0.333   e.g. tierC-000103 tierC-000104
;; JSD: 0.25   shared clusters: 2 e.g. {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (And (Member $e0 design) (Agent $e0 $x1))
;; B: (And (Member $e0 produce) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: FAIL
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000747 tierB-000425
;; B fillers: on, open, unlocked   e.g. tierB-000004 tierB-000747
;; JSD: 0.311   shared clusters: 3 e.g. {unlocked} {open} {well, on, there, be}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: FAIL
;; A fillers: host, industrialization, whig   e.g. tierC-000087 tierC-000088
;; B fillers: guest, industrialization, whig   e.g. tierB-001868 tierC-000088
;; JSD: 0.333   shared clusters: 2 e.g. {industrialization} {whig, whigs}
;; A: (And (Member $e0 welcome) (Agent $e0 $x1))
;; B: (And (Member $e0 welcome) (Theme $e0 $x1))
(Implication (And (Member $e0 welcome) (Theme $e0 $x1)) (And (Member $e0 welcome) (Agent $e0 $x1)))

;; [different class and role]  kill.Patient ~ spend.Agent   n 11 / 4   gate: FAIL
;; A fillers: person ×6, soldier ×2, fox, gazelle, zombie   e.g. tierB-001197 tierB-000393
;; B fillers: person ×2, May, giraffe   e.g. tierB-001146 tierC-000047
;; JSD: 0.335   shared clusters: 2 e.g. {person, people} {gazelle, giraffe, giraffes}
;; A: (And (Member $e0 kill) (Patient $e0 $x1))
;; B: (And (Member $e0 spend) (Agent $e0 $x1))
(Implication (And (Member $e0 kill) (Patient $e0 $x1)) (MnKillPatientOrSpendAgent $e0 $x1))
(Implication (And (Member $e0 spend) (Agent $e0 $x1)) (MnKillPatientOrSpendAgent $e0 $x1))

;; [same role, different class]  portray.Agent ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000301
;; JSD: 0.349   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierB-001901 tierC-000330
;; JSD: 0.357   shared clusters: 2 e.g. {sister, sisters} {person, people}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  appear.Agent ~ replace.Theme   n 6 / 4   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000050 tierC-000128
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000099 tierC-000100
;; JSD: 0.368   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 appear) (Agent $e0 $x1)) (MnAppearAgentOrReplaceTheme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (MnAppearAgentOrReplaceTheme $e0 $x1))

;; [same role, different class]  replace.Agent ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000100 tierC-000359
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierB-001962 tierC-000089
;; JSD: 0.377   shared clusters: 2 e.g. {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  portray.Theme ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000277
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000278
;; JSD: 0.38   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Theme $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
(Implication (And (Member $e0 win) (Agent $e0 $x1)) (MnWinAgentOrPortrayTheme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (MnWinAgentOrPortrayTheme $e0 $x1))

;; [same role, different class]  sleep.Agent ~ watch.Agent   n 3 / 5   gate: FAIL
;; A fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; JSD: 0.408   shared clusters: 2 e.g. {person, people} {family, families}
;; A: (And (Member $e0 sleep) (Agent $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  die.Patient ~ watch.Agent   n 4 / 5   gate: FAIL
;; A fillers: person ×3, family   e.g. tierB-001967 tierC-000199
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; JSD: 0.424   shared clusters: 2 e.g. {person, people} {family, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 watch) (Agent $e0 $x1)) (MnWatchAgentOrDiePatient $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (MnWatchAgentOrDiePatient $e0 $x1))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000247
;; JSD: 0.449   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 portray) (Theme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 11 / 8   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: bad ×2, alarmed, conservative, indigenous, inomaru, lax   e.g. tierC-000158 tierB-001582
;; JSD: 0.466   shared clusters: 6 e.g. {bad, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {lax} {red}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000128 tierC-000050
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierC-000127 tierB-001901
;; JSD: 0.487   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: FAIL
;; A fillers: european american settler ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settler ×2, Paul, indigenous american, native american, writer   e.g. tierB-000728 tierB-000863
;; JSD: 0.517   shared clusters: 2 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 create) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000370 tierB-001658
;; JSD: 0.531   shared clusters: 4 e.g. {bad, bad, matter, bad, problem} {expensive, expensive, thing} {cheap, inexpensive, low, price} {short, shortening}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  bear.Patient ~ study.Agent   n 6 / 12   gate: FAIL
;; A fillers: person ×3, Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierC-000199 tierC-000200
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; JSD: 0.541   shared clusters: 2 e.g. {person, people} {Nicolaus Copernicus, Tycho Brahe}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (MnStudyAgentOrBearPatient $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (MnStudyAgentOrBearPatient $e0 $x1))

;; [same role, different class]  appear.Agent ~ build.Agent   n 6 / 14   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000050 tierC-000128
;; B fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000071 tierC-000072
;; JSD: 0.545   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 build) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierC-000243 tierC-000244
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierB-000706 tierC-000279
;; JSD: 0.547   shared clusters: 2 e.g. {Couper} {Martino, Pietro, Lorenzo, Damiano}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Theme $e0 $x1)))

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, movie, thing, film ×0.5, syrian film ×0.5   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, insulin, film ×0.833, syrian film ×0.833, mesmerizing ×0.5   e.g. tierC-000009 tierC-000092
;; JSD: 0.553   shared clusters: 2 e.g. {movie, film} {syrian film, film, syrian film, destined, film, syrian film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 produce) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura, Inomaru, Barako} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura, Inomaru, Barako} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.557   shared clusters: 2 e.g. {Oleg, Vladimir} {William, James}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrGiveAgent $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (MnHearExperiencerOrGiveAgent $e0 $x1))

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000410
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001753 tierB-001891
;; JSD: 0.569   shared clusters: 2 e.g. {child, children, kid, kids} {dog, dog feed}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (MnSleepExperiencerOrEatAgent $e0 $x1))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.578   shared clusters: 2 e.g. {weather} {thing, things}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.595   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000654 tierB-001675
;; JSD: 0.599   shared clusters: 4 e.g. {black, white} {gusher} {red} {yellow, orange}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001973 tierB-000338
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierB-001901 tierC-000127
;; JSD: 0.604   shared clusters: 2 e.g. {person, people} {bird, bird dropping, birds}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Agent ~ replace.Theme   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000071 tierC-000072
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000099 tierC-000100
;; JSD: 0.628   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 build) (Agent $e0 $x1)) (MnBuildAgentOrReplaceTheme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (MnBuildAgentOrReplaceTheme $e0 $x1))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-001219
;; JSD: 0.636   shared clusters: 2 e.g. {girl, girls} {Skura, Inomaru, Barako}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  follow.Agent ~ rule.Theme   n 9 / 3   gate: FAIL
;; A fillers: bhadala ×2, Alexander, Bailey, Sami, muslim house, road   e.g. tierC-000095 tierC-000096
;; B fillers: Cuba, muslim house, house ×0.5, muslim ×0.5   e.g. tierB-000311 tierC-000095
;; JSD: 0.639   shared clusters: 3 e.g. {muslim house, house, muslim} {house, home, houses} {muslim, muslim community, muslims}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 rule) (Theme $e0 $x1))
(Implication (And (Member $e0 follow) (Agent $e0 $x1)) (MnFollowAgentOrRuleTheme $e0 $x1))
(Implication (And (Member $e0 rule) (Theme $e0 $x1)) (MnFollowAgentOrRuleTheme $e0 $x1))

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadala ×2, Alexander, Bailey, Sami, muslim house, road   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Alexander} {Bailey}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, tradition ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000076 tierC-000337
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Margaret Fleming, Martha, Anne, Marie} {Henry Cole}
;; A: (And (Member $e0 follow) (Theme $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierC-000053 tierC-000054
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.642   shared clusters: 3 e.g. {person, people} {Janos, Miroslav, Lajos} {president, person, president}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierC-000209 tierC-000210
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friend, novelist   e.g. tierB-000327 tierB-000078
;; JSD: 0.643   shared clusters: 3 e.g. {Katherine, Isabella, Kate} {Linda, Amanda, Loren, Dora Smith, …} {Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-001350
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.645   shared clusters: 3 e.g. {person, people} {Michael, Marco, Marcus} {Gustavo, Alberto, Diego, Rodrigo, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Agent ~ hear.Experiencer   n 4 / 8   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierB-001139 tierB-000706
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000751 tierB-000189
;; JSD: 0.656   shared clusters: 2 e.g. {Adriano, Claudio, Flavio} {Martino, Pietro, Lorenzo, Damiano}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnHearExperiencerOrFindAgent $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (MnHearExperiencerOrFindAgent $e0 $x1))

;; [same role, different class]  move.Agent ~ swim.Agent   n 4 / 5   gate: FAIL
;; A fillers: headquarters ×2, Sammy, fish ×0.5, school ×0.5   e.g. tierB-000782 tierC-000197
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001008 tierB-001268
;; JSD: 0.658   shared clusters: 2 e.g. {fish, salmon} {school, education}
;; A: (And (Member $e0 move) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plant   e.g. tierC-000227 tierC-000228
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000942
;; JSD: 0.661   shared clusters: 2 e.g. {thing, things} {cook}
;; A: (And (Member $e0 add) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ get.Patient   n 4 / 7   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001910 tierB-000370
;; JSD: 0.661   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnGetPatientOrBadExperiencer $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (MnGetPatientOrBadExperiencer $e0 $x1))

;; [same role, different class]  study.Agent ~ take.Agent   n 12 / 9   gate: FAIL
;; A fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.669   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Diego, Rodrigo, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ become.Patient   n 4 / 11   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierC-000241 tierC-000242
;; B fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000001 tierC-000002
;; JSD: 0.674   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {relationship, relationships}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 become) (Patient $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnBecomePatientOrBadExperiencer $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (MnBecomePatientOrBadExperiencer $e0 $x1))

;; [same role, different class]  learn.Theme ~ speak.Theme   n 3 / 6   gate: FAIL
;; A fillers: berber, vocabulary, foreign ×0.5, language ×0.5   e.g. tierB-000608 tierB-000282
;; B fillers: Ashe ×2, czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-000053 tierB-001068
;; JSD: 0.683   shared clusters: 2 e.g. {language, english} {foreign, foreigner}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, labourer, technetium, complex ×0.5, simple ×0.5   e.g. tierC-000164 tierC-000163
;; B fillers: main songwriting unit ×2, human barricade, technetium, complex ×0.5, main ×0.5, simple ×0.5   e.g. tierC-000179 tierB-000780
;; JSD: 0.692   shared clusters: 3 e.g. {technetium} {complex, complex, simple, complicated} {simple}
;; A: (And (Member $e0 form) (Agent $e0 $x1))
;; B: (And (Member $e0 form) (Patient $e0 $x1))
(Implication (And (Member $e0 form) (Patient $e0 $x1)) (And (Member $e0 form) (Agent $e0 $x1)))

;; [different class and role]  lead.Agent ~ start.Patient   n 5 / 11   gate: FAIL
;; A fillers: thing ×2, dog, education, general   e.g. tierB-001086 tierC-000019
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001446 tierB-001816
;; JSD: 0.7   shared clusters: 2 e.g. {thing, things} {dog, dog feed}
;; A: (And (Member $e0 lead) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrLeadAgent $e0 $x1))
(Implication (And (Member $e0 lead) (Agent $e0 $x1)) (MnStartPatientOrLeadAgent $e0 $x1))

;; [same role, different class]  work.Agent ~ write.Agent   n 8 / 8   gate: FAIL
;; A fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-001813 tierB-001187
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierB-001962 tierC-000089
;; JSD: 0.725   shared clusters: 2 e.g. {person, people} {father, Dad, dad}
;; A: (And (Member $e0 work) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  become.Patient ~ take.Agent   n 11 / 9   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000001 tierC-000002
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.728   shared clusters: 2 e.g. {person, people} {thing, things}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnBecomePatientOrTakeAgent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnBecomePatientOrTakeAgent $e0 $x1))

;; [different class and role]  lead.Goal ~ live.Location   n 5 / 8   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; JSD: 0.728   shared clusters: 2 e.g. {house, home, houses} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 live) (Location $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (MnLiveLocationOrLeadGoal $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (MnLiveLocationOrLeadGoal $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.74   shared clusters: 2 e.g. {cat, cats} {child, children, kid, kids}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [same class, different role]  lead.Goal ~ lead.Theme   n 5 / 3   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierC-000020 tierB-000040
;; B fillers: sheep, squad, big ×0.5, cat fight ×0.5   e.g. tierC-000019 tierB-001086
;; JSD: 0.745   shared clusters: 2 e.g. {cat fight, big, cat fight} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 lead) (Theme $e0 $x1))
(Implication (And (Member $e0 lead) (Theme $e0 $x1)) (And (Member $e0 lead) (Goal $e0 $x1)))

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000770
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-001831
;; JSD: 0.752   shared clusters: 3 e.g. {thing, things} {Elias, Gabriel} {man, guy}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Goal ~ swim.Agent   n 12 / 5   gate: FAIL
;; A fillers: bed ×4, Loren, aesthetic salon, bathroom, hospital, place   e.g. tierC-000210 tierB-001628
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-000313 tierB-000782
;; JSD: 0.752   shared clusters: 2 e.g. {Linda, Amanda, Loren, Dora Smith, …} {school, education}
;; A: (And (Member $e0 go) (Goal $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
(Implication (And (Member $e0 go) (Goal $e0 $x1)) (MnGoGoalOrSwimAgent $e0 $x1))
(Implication (And (Member $e0 swim) (Agent $e0 $x1)) (MnGoGoalOrSwimAgent $e0 $x1))

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.754   shared clusters: 2 e.g. {weather} {thing, things}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnGetPatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  leave.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000704
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; JSD: 0.758   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Diego, Rodrigo, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ make.Agent   n 10 / 18   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; JSD: 0.773   shared clusters: 2 e.g. {thing, things} {Martino, Pietro, Lorenzo, Damiano}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrFindTheme $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (MnMakeAgentOrFindTheme $e0 $x1))

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000564
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-001813 tierB-000212
;; JSD: 0.777   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Dmitri, Rasputin}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000216
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; JSD: 0.777   shared clusters: 2 e.g. {Felix} {Adriano, Claudio, Flavio}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  change.Patient ~ get.Patient   n 8 / 7   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; JSD: 0.784   shared clusters: 2 e.g. {weather} {thing, things}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001496 tierB-000313
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-000782
;; JSD: 0.784   shared clusters: 2 e.g. {child, children, kid, kids} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ speak.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-001857
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, man   e.g. tierB-000271 tierC-000094
;; JSD: 0.793   shared clusters: 2 e.g. {Olivia, Sophia} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001899 tierB-001816
;; JSD: 0.799   shared clusters: 2 e.g. {knock} {thing, things}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnStartPatientOrHearStimulus $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.802   shared clusters: 2 e.g. {Martino, Pietro, Lorenzo, Damiano} {William, James}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [same role, different class]  become.Patient ~ get.Patient   n 11 / 7   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; JSD: 0.807   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {thing, things}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settler ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.809   shared clusters: 2 e.g. {Mark} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001457
;; JSD: 0.81   shared clusters: 3 e.g. {Afghanistan, Iran, Iraq, Persia} {bad, bad, matter, bad, problem} {big, large, huge, massive, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ play.Agent   n 15 / 15   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001496 tierB-001857
;; B fillers: child ×4, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; JSD: 0.813   shared clusters: 2 e.g. {child, children, kid, kids} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.82   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (MnHaveHolderOrGetAgent $e0 $x1))

;; [same role, different class]  go.Agent ~ walk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.821   shared clusters: 2 e.g. {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …} {Adriano, Claudio, Flavio}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; JSD: 0.827   shared clusters: 3 e.g. {hotel} {room, rooms} {thing, things}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuildPatient $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (MnHaveHolderOrBuildPatient $e0 $x1))

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 8   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-001134 tierB-001813
;; JSD: 0.828   shared clusters: 2 e.g. {old, elderly} {adaptor, adaptor, old}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ sell.Theme   n 18 / 7   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierB-001867 tierC-000119
;; B fillers: ice cream ×2, copy, milk, thing, bean ×0.5, cell phone ×0.5   e.g. tierB-001168 tierB-001956
;; JSD: 0.832   shared clusters: 2 e.g. {thing, things} {new, brand new, new, product}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (MnBuildPatientOrSellTheme $e0 $x1))
(Implication (And (Member $e0 sell) (Theme $e0 $x1)) (MnBuildPatientOrSellTheme $e0 $x1))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 11 / 9   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierB-000740 tierB-000352
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000695
;; JSD: 0.837   shared clusters: 2 e.g. {thing, things} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnBecomePatientOrHearStimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (MnBecomePatientOrHearStimulus $e0 $x1))

;; [same role, different class]  make.Agent ~ speak.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000951
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, man   e.g. tierB-001068 tierC-000094
;; JSD: 0.839   shared clusters: 2 e.g. {man, guy} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001219
;; JSD: 0.839   shared clusters: 2 e.g. {customer, customers} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ take.Agent   n 44 / 9   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.844   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (MnHaveHolderOrTakeAgent $e0 $x1))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 20   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; JSD: 0.851   shared clusters: 3 e.g. {house, home, houses} {big, large, huge, massive, …} {comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (MnMakePatientOrLiveLocation $e0 $x1))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, movie, thing, film ×0.5, syrian film ×0.5   e.g. tierC-000138 tierC-000010
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.856   shared clusters: 2 e.g. {thing, things} {movie, film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrDirectPatient $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (MnHaveHolderOrDirectPatient $e0 $x1))

;; [same role, different class]  begin.Agent ~ make.Agent   n 11 / 18   gate: FAIL
;; A fillers: european american settler ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000240 tierB-000173
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000073
;; JSD: 0.86   shared clusters: 2 e.g. {William, James} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001773 tierB-000770
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000470 tierB-001130
;; JSD: 0.873   shared clusters: 2 e.g. {man, guy} {young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ leave.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.873   shared clusters: 3 e.g. {Boris, Ivan, Dmitri, Rasputin} {Thomas, Tom, Tommy} {Gustavo, Alberto, Diego, Rodrigo, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (MnHaveHolderOrLeaveAgent $e0 $x1))

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001182 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-001773 tierB-000117
;; JSD: 0.874   shared clusters: 2 e.g. {David} {man, guy}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  good.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.875   shared clusters: 2 e.g. {thing, things} {weather}
;; A: (And (Member $e0 good) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnHaveHolderOrGoodExperiencer $e0 $x1))

;; [different class and role]  lead.Goal ~ make.Patient   n 5 / 20   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000371 tierB-001457
;; JSD: 0.875   shared clusters: 2 e.g. {house, home, houses} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrLeadGoal $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (MnMakePatientOrLeadGoal $e0 $x1))

;; [different class and role]  bad.Experiencer ~ make.Patient   n 4 / 20   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000539 tierB-000371
;; JSD: 0.879   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {matter, mass}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrBadExperiencer $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (MnMakePatientOrBadExperiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ make.Agent   n 15 / 18   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001857
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000073 tierB-000951
;; JSD: 0.879   shared clusters: 2 e.g. {cat, cats} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 15   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001457 tierB-000951
;; B fillers: child ×4, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-001840 tierB-000939
;; JSD: 0.879   shared clusters: 2 e.g. {boy, boys} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 20   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000904
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000539 tierB-001594
;; JSD: 0.881   shared clusters: 2 e.g. {beautiful, gorgeous, pretty} {room, rooms}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnMakePatientOrBeautifulExperiencer $e0 $x1))

;; [same role, different class]  start.Patient ~ turn.Patient   n 11 / 7   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-000654 tierB-001446
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; JSD: 0.887   shared clusters: 2 e.g. {gusher} {freedom movement, freedom}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 44   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.891   shared clusters: 3 e.g. {thing, things} {bad, bad, matter, bad, problem} {weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveHolderOrGetPatient $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; JSD: 0.894   shared clusters: 2 e.g. {house, home, houses} {food, eat}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))

;; [different class and role]  change.Patient ~ have.Holder   n 8 / 44   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.895   shared clusters: 2 e.g. {thing, things} {weather}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveHolderOrChangePatient $e0 $x1))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000314 tierC-000114
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000313 tierC-000113
;; JSD: 0.896   shared clusters: 2 e.g. {Yunnan} {islamic ivory, ivory}
;; A: (PartOf $x0 $x1)
;; B: (Possession $x0 $x1)
(Implication (PartOf $x0 $x1) (Possession $x0 $x1))

;; [same class, different role]  make.Patient ~ make.Result   n 20 / 7   gate: FAIL
;; A fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001920
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001504 tierB-000325
;; JSD: 0.898   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {beautiful, gorgeous, pretty}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Theme   n 8 / 43   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000098 tierB-001217
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000722 tierB-000162
;; JSD: 0.907   shared clusters: 2 e.g. {color} {thing, things}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnHaveThemeOrChangePatient $e0 $x1))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000142 tierB-001177
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-000971 tierB-001154
;; JSD: 0.908   shared clusters: 3 e.g. {sentence, sentences} {word, word processor} {room, rooms}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnHaveHolderOrUseTheme $e0 $x1))

;; [different class and role]  become.Patient ~ have.Holder   n 11 / 44   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.912   shared clusters: 2 e.g. {thing, things} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBecomePatient $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (MnHaveHolderOrBecomePatient $e0 $x1))

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 44   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000790
;; JSD: 0.914   shared clusters: 2 e.g. {room, rooms} {weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (MnHaveHolderOrBeautifulExperiencer $e0 $x1))

;; [same role, different class]  give.Theme ~ have.Theme   n 4 / 43   gate: FAIL
;; A fillers: chocolate, mock champagne, thing, advice ×0.5, good ×0.5   e.g. tierC-000111 tierB-000137
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000162 tierB-001103
;; JSD: 0.914   shared clusters: 2 e.g. {thing, things} {good, nice, pleasant, positive}
;; A: (And (Member $e0 give) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  become.Patient ~ make.Patient   n 11 / 20   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000073
;; JSD: 0.923   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 43   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001658 tierB-000370
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001553 tierB-000162
;; JSD: 0.924   shared clusters: 2 e.g. {day, days, days, short} {thing, things}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (MnHaveThemeOrGetPatient $e0 $x1))

;; [different class and role]  create.Patient ~ use.Theme   n 7 / 23   gate: FAIL
;; A fillers: community ×4, particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001884 tierB-000866
;; JSD: 0.927   shared clusters: 2 e.g. {schedule, calendar} {various}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (MnUseThemeOrCreatePatient $e0 $x1))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 46 / 11   gate: FAIL
;; A fillers: here ×3, Derwent Isle ×2, city ×2, class ×2, garden ×2, southern ×2   e.g. tierB-000523 tierB-001111
;; B fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierB-001932 tierB-001966
;; JSD: 0.93   shared clusters: 2 e.g. {play} {street, road, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  have.Holder ~ work.Agent   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000665 tierB-001861
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-001873 tierB-000212
;; JSD: 0.931   shared clusters: 2 e.g. {Boris, Ivan, Dmitri, Rasputin} {old, elderly}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrWorkAgent $e0 $x1))
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (MnHaveHolderOrWorkAgent $e0 $x1))

;; [different class and role]  bad.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001929
;; JSD: 0.932   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBadExperiencer $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (MnHaveHolderOrBadExperiencer $e0 $x1))

;; [different class and role]  have.Holder ~ make.Patient   n 44 / 20   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001016
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000371
;; JSD: 0.936   shared clusters: 3 e.g. {house, home, houses} {room, rooms} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (MnHaveHolderOrMakePatient $e0 $x1))

;; [different class and role]  have.Theme ~ start.Patient   n 43 / 11   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001816
;; JSD: 0.941   shared clusters: 2 e.g. {thing, things} {blue, purple}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (MnHaveThemeOrStartPatient $e0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 43 / 18   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001920 tierB-001831
;; JSD: 0.943   shared clusters: 2 e.g. {thing, things} {curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnHaveThemeOrMakeAgent $e0 $x1))

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000162 tierB-000797
;; JSD: 0.945   shared clusters: 2 e.g. {thing, things} {gas station, gas pump, gas pumps}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (And (Member $e0 have) (Holder $e0 $x1)))
