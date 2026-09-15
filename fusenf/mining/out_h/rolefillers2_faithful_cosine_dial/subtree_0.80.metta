;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_cosine_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful_cosine.metta
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

;; ==================== SLOT PAIRS: 24 pass the gate (event 24, entity 0); 134 pairs listed = every pair with >= 2 shared clusters (event 132, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; cosine: 0.99 (gate)   JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 sleep) (Agent $e0 $x1))
(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (And (Member $e0 sleep) (Patient $e0 $x1)))

;; [different class and role]  kill.Patient ~ spend.Agent   n 11 / 4   gate: PASS
;; A fillers: people ×4, person ×2, fox, gazelle, soldier, soldiers   e.g. tierB-001197 tierB-000393
;; B fillers: person ×2, May, giraffes   e.g. tierB-001146 tierC-000047
;; cosine: 0.83 (gate)   JSD: 0.335   shared clusters: 2 e.g. {person, people} {gazelle, giraffe, giraffes}
;; A: (And (Member $e0 kill) (Patient $e0 $x1))
;; B: (And (Member $e0 spend) (Agent $e0 $x1))
(Implication (And (Member $e0 spend) (Agent $e0 $x1)) (And (Member $e0 spend) (Patient $e0 $x1)))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001156 tierB-000827
;; cosine: 0.78 (gate)   JSD: 0.357   shared clusters: 2 e.g. {sister, sisters} {person, people}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ replace.Agent   n 6 / 4   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; cosine: 0.76 (gate)   JSD: 0.251   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000259
;; cosine: 0.76 (gate)   JSD: 0.23   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 appear) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ write.Agent   n 6 / 8   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; cosine: 0.71 (gate)   JSD: 0.368   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  portray.Agent ~ win.Agent   n 5 / 7   gate: PASS
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000301
;; cosine: 0.69 (gate)   JSD: 0.349   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: PASS
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friends, novelist   e.g. tierB-000327 tierC-000209
;; cosine: 0.67 (gate)   JSD: 0.596   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: PASS
;; A fillers: host, industrialization, whigs   e.g. tierC-000087 tierC-000088
;; B fillers: guests, industrialization, whigs   e.g. tierB-001868 tierC-000088
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {industrialization, industrial output} {whig, whigs}
;; A: (And (Member $e0 welcome) (Agent $e0 $x1))
;; B: (And (Member $e0 welcome) (Theme $e0 $x1))
(Implication (And (Member $e0 welcome) (Theme $e0 $x1)) (And (Member $e0 welcome) (Agent $e0 $x1)))

;; [same role, different class]  replace.Agent ~ write.Agent   n 4 / 8   gate: PASS
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; cosine: 0.66 (gate)   JSD: 0.406   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  become.Patient ~ become.Result   n 11 / 8   gate: PASS
;; A fillers: bad, relationship ×2, indigenous, people ×2, Lady Ashton, conservative, revolutionary, discipline, lax, earth, red   e.g. tierC-000241 tierC-000242
;; B fillers: bad ×2, alarmed, conservative, indigenous, inomaru, lax   e.g. tierB-001817 tierC-000237
;; cosine: 0.65 (gate)   JSD: 0.426   shared clusters: 4 e.g. {bad, bad, relationship, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {conservative, conservative, revolutionary} {inomaru, inomaru, person}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [different class and role]  bear.Patient ~ study.Agent   n 6 / 12   gate: PASS
;; A fillers: person ×3, Tobias, Tycho Brahe, man, poor   e.g. tierB-001812 tierC-000199
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000292 tierC-000253
;; cosine: 0.65 (gate)   JSD: 0.541   shared clusters: 2 e.g. {person, people} {Nicolaus Copernicus, Tycho Brahe}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: PASS
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settlers ×2, Paul, indigenous americans, native americans, writer   e.g. tierB-000728 tierB-000863
;; cosine: 0.61 (gate)   JSD: 0.517   shared clusters: 2 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers, french settler, french settlers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 create) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  portray.Theme ~ win.Agent   n 5 / 7   gate: PASS
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000277
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000278
;; cosine: 0.60 (gate)   JSD: 0.38   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Theme $e0 $x1))
;; B: (And (Member $e0 win) (Agent $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

;; [same role, different class]  sleep.Agent ~ watch.Agent   n 3 / 5   gate: PASS
;; A fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; cosine: 0.60 (gate)   JSD: 0.408   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 sleep) (Agent $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000128 tierC-000050
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierB-001156
;; cosine: 0.59 (gate)   JSD: 0.487   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: PASS
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; cosine: 0.57 (gate)   JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  die.Patient ~ watch.Agent   n 4 / 5   gate: PASS
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; cosine: 0.57 (gate)   JSD: 0.424   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (And (Member $e0 die) (Agent $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: PASS
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000659
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000487
;; cosine: 0.55 (gate)   JSD: 0.475   shared clusters: 4 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …} {David, William, James} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [different class and role]  appear.Agent ~ replace.Theme   n 6 / 4   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; cosine: 0.55 (gate)   JSD: 0.368   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  buy.Agent ~ speak.Agent   n 3 / 8   gate: PASS
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, men   e.g. tierC-000094 tierC-000023
;; cosine: 0.52 (gate)   JSD: 0.464   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  study.Agent ~ succeed.Theme   n 12 / 3   gate: PASS
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierC-000253
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000100
;; cosine: 0.52 (gate)   JSD: 0.562   shared clusters: 2 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
(Implication (And (Member $e0 succeed) (Theme $e0 $x1)) (And (Member $e0 succeed) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ speak.Agent   n 15 / 8   gate: PASS
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, men   e.g. tierB-000271 tierC-000094
;; cosine: 0.50 (gate)   JSD: 0.653   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  replace.Agent ~ replace.Theme   n 4 / 4   gate: PASS
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; cosine: 0.50 (gate)   JSD: 0.406   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  study.Agent ~ take.Agent   n 12 / 9   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000987 tierB-001102
;; cosine: 0.50 (gate)   JSD: 0.635   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.49 (gate)   JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ get.Patient   n 4 / 7   gate: FAIL
;; A fillers: bad, relationship ×2, bad, matter, bad, weather   e.g. tierB-001594 tierC-000241
;; B fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000748
;; cosine: 0.48 (gate)   JSD: 0.531   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; cosine: 0.47 (gate)   JSD: 0.578   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000738
;; cosine: 0.46 (gate)   JSD: 0.57   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {girl, girls, girl, little}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.To ~ start.Theme   n 3 / 13   gate: FAIL
;; A fillers: talk ×2, see   e.g. tierC-000209 tierC-000210
;; B fillers: appear, chant, cry, disappear, feel, light headed, hear   e.g. tierB-001219 tierB-000465
;; cosine: 0.46 (gate)   JSD: 0.602   shared clusters: 2 e.g. {talk, conversation, discussion} {appear, see, display, show, …}
;; A: (And (Member $e0 go) (To $e0 $x1))
;; B: (And (Member $e0 start) (Theme $e0 $x1))
(Implication (And (Member $e0 go) (To $e0 $x1)) (And (Member $e0 go) (Theme $e0 $x1)))

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-001325
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000025
;; cosine: 0.45 (gate)   JSD: 0.639   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Elias, Tobias, Gabor, Gabriel}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; cosine: 0.45 (gate)   JSD: 0.554   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (And (Member $e0 stop) (Experiencer $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001891
;; cosine: 0.44 (gate)   JSD: 0.602   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000247
;; cosine: 0.44 (gate)   JSD: 0.449   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 portray) (Theme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000252 tierB-000987
;; cosine: 0.44 (gate)   JSD: 0.607   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people} {Michael, Marco, Marcus}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, cyanide, harmless, trace, destined, film, syrian film, film, syrian film, insulin   e.g. tierC-000009 tierC-000092
;; cosine: 0.44 (gate)   JSD: 0.545   shared clusters: 2 e.g. {movie, film} {syrian film, film, syrian film, destined, film, syrian film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 produce) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  replace.Theme ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; cosine: 0.44 (gate)   JSD: 0.5   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Theme $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierC-000243 tierC-000244
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierB-000706 tierC-000279
;; cosine: 0.43 (gate)   JSD: 0.503   shared clusters: 2 e.g. {Couper} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Theme $e0 $x1)))

;; [different class and role]  find.Theme ~ get.Agent   n 10 / 6   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; cosine: 0.43 (gate)   JSD: 0.584   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.42 (gate)   JSD: 0.625   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: birds, brown, dog, children, person   e.g. tierB-001973 tierB-000338
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001901 tierC-000127
;; cosine: 0.42 (gate)   JSD: 0.604   shared clusters: 2 e.g. {person, people} {bird, bird dropping, mother bird, birds}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000659 tierB-000695
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.41 (gate)   JSD: 0.656   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Experiencer $e0 $x1)))

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 8   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; cosine: 0.40 (gate)   JSD: 0.636   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000987 tierB-001102
;; cosine: 0.39 (gate)   JSD: 0.617   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; cosine: 0.39 (gate)   JSD: 0.557   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (And (Member $e0 give) (Experiencer $e0 $x1)))

;; [same role, different class]  serve.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierC-000053 tierB-000940
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-001726 tierB-000987
;; cosine: 0.37 (gate)   JSD: 0.607   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people} {president, person, president}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; cosine: 0.37 (gate)   JSD: 0.721   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ leave.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; cosine: 0.36 (gate)   JSD: 0.626   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  leave.Agent ~ read.Agent   n 10 / 3   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; cosine: 0.36 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; cosine: 0.36 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Santiago, Manila, Havana} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; cosine: 0.36 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ travel.Agent   n 10 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000747
;; B fillers: people ×2, Matthew, Roger, campaigner   e.g. tierB-000995 tierB-001618
;; cosine: 0.36 (gate)   JSD: 0.682   shared clusters: 2 e.g. {person, people} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000704
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; cosine: 0.35 (gate)   JSD: 0.667   shared clusters: 3 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  lead.Agent ~ start.Patient   n 5 / 11   gate: FAIL
;; A fillers: thing ×2, dog, education, general   e.g. tierC-000019 tierC-000020
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001816 tierB-001446
;; cosine: 0.34 (gate)   JSD: 0.7   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {dog, dog feed}
;; A: (And (Member $e0 lead) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 lead) (Agent $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

;; [different class and role]  build.Patient ~ find.Theme   n 18 / 10   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000119 tierC-000120
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; cosine: 0.34 (gate)   JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {paper, paper factory, paper mill, paper sheet, …}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Patient $e0 $x1)))

;; [different class and role]  find.Theme ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.34 (gate)   JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Theme $e0 $x1)))

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-000672
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-001773
;; cosine: 0.34 (gate)   JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {man, young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ read.Agent   n 8 / 3   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; cosine: 0.33 (gate)   JSD: 0.613   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Experiencer $e0 $x1)))

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 18   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; cosine: 0.32 (gate)   JSD: 0.732   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; cosine: 0.32 (gate)   JSD: 0.639   shared clusters: 2 e.g. {Alexander} {Bailey}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, traditions ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000076 tierC-000337
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000338
;; cosine: 0.32 (gate)   JSD: 0.639   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Cowper, Henry Cole}
;; A: (And (Member $e0 follow) (Theme $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bring.Theme ~ leave.Agent   n 4 / 10   gate: FAIL
;; A fillers: Jonathan, advantage, british ship, chinese dumpling   e.g. tierB-000636 tierB-000427
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000100 tierB-000004
;; cosine: 0.32 (gate)   JSD: 0.698   shared clusters: 2 e.g. {ship, british ship, israeli military ship, merchant ship, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 bring) (Theme $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 bring) (Theme $e0 $x1)) (And (Member $e0 bring) (Agent $e0 $x1)))

;; [same role, different class]  enter.Agent ~ study.Agent   n 6 / 12   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; cosine: 0.32 (gate)   JSD: 0.683   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  study.Agent ~ work.Agent   n 12 / 8   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierC-000253
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, adaptor, old   e.g. tierB-000212 tierB-001813
;; cosine: 0.32 (gate)   JSD: 0.727   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plants   e.g. tierC-000227 tierC-000228
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000942
;; cosine: 0.31 (gate)   JSD: 0.661   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {cook, recipe}
;; A: (And (Member $e0 add) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ build.Agent   n 6 / 14   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; cosine: 0.31 (gate)   JSD: 0.545   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 build) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000370
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; cosine: 0.31 (gate)   JSD: 0.692   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {expensive, expensive, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  make.Agent ~ want.Experiencer   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; cosine: 0.31 (gate)   JSD: 0.759   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  walk.Agent ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000846 tierB-000626
;; cosine: 0.31 (gate)   JSD: 0.703   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ need.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000819 tierC-000181
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000086 tierB-000061
;; cosine: 0.30 (gate)   JSD: 0.777   shared clusters: 3 e.g. {Karl, Kristoffer} {Gustavo, Alberto, Martino, Pietro, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Holder $e0 $x1)))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001183
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001003
;; cosine: 0.30 (gate)   JSD: 0.639   shared clusters: 3 e.g. {cat, cats} {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000324
;; cosine: 0.30 (gate)   JSD: 0.721   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Inomaru, Barako, …} {customer, customers}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ take.Agent   n 18 / 9   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.30 (gate)   JSD: 0.77   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  take.Agent ~ walk.Agent   n 9 / 8   gate: FAIL
;; A fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000252 tierB-000987
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; cosine: 0.29 (gate)   JSD: 0.719   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Michael, Marco, Marcus}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-001219
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000036
;; cosine: 0.29 (gate)   JSD: 0.713   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {school janitor}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  build.Agent ~ replace.Agent   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; cosine: 0.28 (gate)   JSD: 0.569   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ hear.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000162
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; cosine: 0.28 (gate)   JSD: 0.761   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Holder $e0 $x1)))

;; [same role, different class]  decide.Agent ~ study.Agent   n 4 / 12   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-001544 tierB-000401
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000710
;; cosine: 0.27 (gate)   JSD: 0.692   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  leave.Agent ~ want.Experiencer   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.27 (gate)   JSD: 0.737   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.27 (gate)   JSD: 0.737   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; cosine: 0.27 (gate)   JSD: 0.789   shared clusters: 2 e.g. {David, William, James} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ make.Agent   n 10 / 18   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; cosine: 0.26 (gate)   JSD: 0.773   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Agent $e0 $x1)))

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.26 (gate)   JSD: 0.82   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 12   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000421
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000253
;; cosine: 0.26 (gate)   JSD: 0.663   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Fadil, Jamil, Sami}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  help.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Jonas, Karen, Michael, context, hothouse conditions, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000004
;; cosine: 0.26 (gate)   JSD: 0.745   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ have.Holder   n 10 / 44   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.25 (gate)   JSD: 0.829   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Holder $e0 $x1)))

;; [same role, different class]  build.Agent ~ write.Agent   n 14 / 8   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; cosine: 0.25 (gate)   JSD: 0.628   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; cosine: 0.24 (gate)   JSD: 0.758   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; cosine: 0.23 (gate)   JSD: 0.772   shared clusters: 2 e.g. {David, William, James} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000704 tierB-000747
;; cosine: 0.22 (gate)   JSD: 0.745   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; cosine: 0.22 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000747
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, adaptor, old   e.g. tierB-000212 tierB-001813
;; cosine: 0.22 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {person, people}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000216
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.22 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ go.Agent   n 5 / 15   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; cosine: 0.22 (gate)   JSD: 0.754   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ study.Agent   n 15 / 12   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierB-001879
;; cosine: 0.21 (gate)   JSD: 0.787   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ take.Agent   n 44 / 9   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.20 (gate)   JSD: 0.844   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Holder $e0 $x1)))

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001003
;; cosine: 0.20 (gate)   JSD: 0.795   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, barking, growling, noises, crash, knock, music, upbeat, noise, ticking   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001899 tierB-001816
;; cosine: 0.20 (gate)   JSD: 0.799   shared clusters: 2 e.g. {knock, kick, kick out} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [same role, different class]  leave.Agent ~ try.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; cosine: 0.20 (gate)   JSD: 0.8   shared clusters: 2 e.g. {Jonas, Roger, Bob, Ralph, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Agent ~ replace.Theme   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; cosine: 0.19 (gate)   JSD: 0.628   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  enter.Agent ~ serve.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; cosine: 0.19 (gate)   JSD: 0.745   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; cosine: 0.19 (gate)   JSD: 0.827   shared clusters: 3 e.g. {hotel} {room, changing room, rooms} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (And (Member $e0 build) (Holder $e0 $x1)))

;; [different class and role]  good.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.18 (gate)   JSD: 0.852   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 good) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ want.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierB-000855
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.18 (gate)   JSD: 0.863   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Holder $e0 $x1)))

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000206
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-001594 tierB-001504
;; cosine: 0.17 (gate)   JSD: 0.841   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ serve.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000704 tierB-000747
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; cosine: 0.17 (gate)   JSD: 0.8   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ want.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001183
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; cosine: 0.17 (gate)   JSD: 0.793   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ make.Agent   n 15 / 18   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; cosine: 0.16 (gate)   JSD: 0.794   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Inomaru, Barako, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ make.Agent   n 44 / 18   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; cosine: 0.16 (gate)   JSD: 0.882   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Holder   n 8 / 44   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.16 (gate)   JSD: 0.872   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ leave.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; cosine: 0.16 (gate)   JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (And (Member $e0 leave) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ try.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000947
;; cosine: 0.16 (gate)   JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (And (Member $e0 try) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ help.Agent   n 44 / 6   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierC-000182
;; B fillers: Jonas, Karen, Michael, context, hothouse conditions, life experience   e.g. tierB-000319 tierC-000071
;; cosine: 0.15 (gate)   JSD: 0.87   shared clusters: 2 e.g. {Karen, Kalman, Kerr, Ken} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 help) (Agent $e0 $x1))
(Implication (And (Member $e0 help) (Agent $e0 $x1)) (And (Member $e0 help) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ play.Agent   n 15 / 15   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001496
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; cosine: 0.15 (gate)   JSD: 0.813   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ read.Agent   n 44 / 3   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; cosine: 0.14 (gate)   JSD: 0.878   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Holder $e0 $x1)))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000138 tierC-000091
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.14 (gate)   JSD: 0.862   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {movie, film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (And (Member $e0 direct) (Holder $e0 $x1)))

;; [different class and role]  go.Agent ~ need.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001496
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000107 tierB-000455
;; cosine: 0.14 (gate)   JSD: 0.821   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ walk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; cosine: 0.14 (gate)   JSD: 0.821   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, complex, simple, labourers, technetium   e.g. tierC-000164 tierC-000163
;; B fillers: main songwriting unit ×2, complex, simple, human barricade, main, songwriting unit, technetium   e.g. tierB-000780 tierC-000179
;; cosine: 0.13 (gate)   JSD: 0.692   shared clusters: 2 e.g. {complex, complex, simple, complicated} {technetium}
;; A: (And (Member $e0 form) (Agent $e0 $x1))
;; B: (And (Member $e0 form) (Patient $e0 $x1))
(Implication (And (Member $e0 form) (Patient $e0 $x1)) (And (Member $e0 form) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ walk.Agent   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000855
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.13 (gate)   JSD: 0.883   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Holder $e0 $x1)))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; cosine: 0.11 (gate)   JSD: 0.894   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {food, eat}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ serve.Agent   n 15 / 10   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000204
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierB-000864
;; cosine: 0.10 (gate)   JSD: 0.838   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Mom, mother, grandmother, parent, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ have.Holder   n 15 / 44   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000012
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000855 tierB-001216
;; cosine: 0.10 (gate)   JSD: 0.891   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karen, Kalman, Kerr, Ken}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (And (Member $e0 go) (Holder $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 44   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-000748 tierB-000206
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-000819
;; cosine: 0.09 (gate)   JSD: 0.904   shared clusters: 2 e.g. {weather, bad, weather} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ study.Agent   n 44 / 12   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000855
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; cosine: 0.08 (gate)   JSD: 0.9   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (And (Member $e0 study) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Theme   n 8 / 43   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000098 tierB-001217
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000722 tierB-000162
;; cosine: 0.08 (gate)   JSD: 0.907   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000142
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001378 tierB-000971
;; cosine: 0.07 (gate)   JSD: 0.908   shared clusters: 3 e.g. {room, changing room, rooms} {sentence, english sentence, sentences} {word, word processor}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (And (Member $e0 use) (Holder $e0 $x1)))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 46 / 11   gate: FAIL
;; A fillers: here ×3, Derwent Isle ×2, city ×2, class ×2, garden ×2, southern ×2   e.g. tierB-000523 tierB-001111
;; B fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierB-001932 tierB-001966
;; cosine: 0.07 (gate)   JSD: 0.92   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 15   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-001457
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-001840
;; cosine: 0.07 (gate)   JSD: 0.879   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {boy, boys}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ write.Patient   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000931 tierB-000142
;; B fillers: episode ×2, song ×2, book, character, letter, screenplay   e.g. tierB-001962 tierB-000971
;; cosine: 0.06 (gate)   JSD: 0.915   shared clusters: 2 e.g. {book, library, books} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (And (Member $e0 write) (Holder $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Agent   n 43 / 18   gate: FAIL
;; A fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-001264 tierB-000162
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001920 tierB-001831
;; cosine: 0.06 (gate)   JSD: 0.931   shared clusters: 2 e.g. {curtain, blue, curtain, curtains} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Patient   n 44 / 20   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-000819
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-000371 tierB-001504
;; cosine: 0.06 (gate)   JSD: 0.935   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000314 tierC-000114
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000313 tierC-000113
;; cosine: 0.05 (gate)   JSD: 0.896   shared clusters: 2 e.g. {Yunnan, Chongqing} {islamic ivory, ivory}
;; A: (PartOf $x0 $x1)
;; B: (Possession $x0 $x1)
(Implication (PartOf $x0 $x1) (Possession $x0 $x1))

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000162 tierB-000797
;; cosine: 0.05 (gate)   JSD: 0.945   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {gas station, gas pump, gas pumps}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (And (Member $e0 have) (Holder $e0 $x1)))
