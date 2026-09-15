;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_cosine_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
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
;;                   outside the distributions: 177 occurrences excluded in this block, 4131 filler units enter
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

;; ==================== SLOT PAIRS: 28 pass the gate (event 28, entity 0); 179 pairs listed = every pair with >= 2 shared clusters (event 177, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×3, family   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; cosine: 0.99 (gate)   JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 sleep) (Agent $e0 $x1))
(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (And (Member $e0 sleep) (Patient $e0 $x1)))

;; [different class and role]  kill.Patient ~ spend.Agent   n 11 / 4   gate: PASS
;; A fillers: person ×6, soldier ×2, fox, gazelle, zombie   e.g. tierB-001197 tierB-000393
;; B fillers: person ×2, May, giraffe   e.g. tierB-001146 tierC-000047
;; cosine: 0.81 (gate)   JSD: 0.335   shared clusters: 2 e.g. {person, people} {gazelle, giraffe, giraffes}
;; A: (And (Member $e0 kill) (Patient $e0 $x1))
;; B: (And (Member $e0 spend) (Agent $e0 $x1))
(Implication (And (Member $e0 spend) (Agent $e0 $x1)) (And (Member $e0 spend) (Patient $e0 $x1)))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: PASS
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierC-000330 tierB-001156
;; cosine: 0.80 (gate)   JSD: 0.357   shared clusters: 2 e.g. {sister, sisters} {person, people}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ write.Agent   n 6 / 8   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000259 tierC-000260
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierC-000297 tierC-000298
;; cosine: 0.79 (gate)   JSD: 0.322   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ replace.Agent   n 6 / 4   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000259 tierC-000260
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; cosine: 0.76 (gate)   JSD: 0.251   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000050 tierC-000259
;; cosine: 0.76 (gate)   JSD: 0.23   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 appear) (Agent $e0 $x1))
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

;; [same role, different class]  replace.Agent ~ write.Agent   n 4 / 8   gate: PASS
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierC-000297 tierC-000298
;; cosine: 0.69 (gate)   JSD: 0.377   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: PASS
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friend, novelist   e.g. tierB-000327 tierC-000209
;; cosine: 0.67 (gate)   JSD: 0.596   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: PASS
;; A fillers: host, industrialization, whig   e.g. tierC-000087 tierC-000088
;; B fillers: guest, industrialization, whig   e.g. tierB-001868 tierC-000088
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {industrialization, industrial output} {whig, whigs}
;; A: (And (Member $e0 welcome) (Agent $e0 $x1))
;; B: (And (Member $e0 welcome) (Theme $e0 $x1))
(Implication (And (Member $e0 welcome) (Theme $e0 $x1)) (And (Member $e0 welcome) (Agent $e0 $x1)))

;; [different class and role]  bear.Patient ~ study.Agent   n 6 / 12   gate: PASS
;; A fillers: person ×3, Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-001812 tierC-000199
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000292 tierC-000253
;; cosine: 0.66 (gate)   JSD: 0.541   shared clusters: 2 e.g. {person, people} {Nicolaus Copernicus, Tycho Brahe}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: PASS
;; A fillers: european american settler ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settler ×2, Paul, indigenous american, native american, writer   e.g. tierB-000728 tierB-000863
;; cosine: 0.61 (gate)   JSD: 0.517   shared clusters: 2 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers, french settler, french settlers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 create) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  leave.Patient ~ leave.Result   n 3 / 3   gate: PASS
;; A fillers: door, light ×0.5, on ×0.5, open ×0.5, unlocked ×0.5   e.g. tierB-000747 tierB-000425
;; B fillers: on, open, unlocked   e.g. tierB-000004 tierB-000747
;; cosine: 0.61 (gate)   JSD: 0.311   shared clusters: 3 e.g. {unlocked, locked, lock, door, locked} {open, close, end, closed} {use, well, direct, do, …}
;; A: (And (Member $e0 leave) (Patient $e0 $x1))
;; B: (And (Member $e0 leave) (Result $e0 $x1))
(Implication (And (Member $e0 leave) (Result $e0 $x1)) (And (Member $e0 leave) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: PASS
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000125 tierB-001873
;; cosine: 0.61 (gate)   JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000128 tierC-000050
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierC-000127 tierC-000330
;; cosine: 0.60 (gate)   JSD: 0.487   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
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
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; cosine: 0.60 (gate)   JSD: 0.408   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 sleep) (Agent $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  die.Patient ~ watch.Agent   n 4 / 5   gate: PASS
;; A fillers: person ×3, family   e.g. tierB-001967 tierC-000199
;; B fillers: Baya, coach, family, government, person   e.g. tierB-000258 tierB-000520
;; cosine: 0.57 (gate)   JSD: 0.424   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (And (Member $e0 die) (Agent $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: PASS
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000659
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000487
;; cosine: 0.56 (gate)   JSD: 0.475   shared clusters: 4 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …} {David, William, James} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [different class and role]  appear.Agent ~ replace.Theme   n 6 / 4   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000259 tierC-000260
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; cosine: 0.55 (gate)   JSD: 0.368   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  buy.Agent ~ speak.Agent   n 3 / 8   gate: PASS
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, man   e.g. tierC-000094 tierC-000023
;; cosine: 0.52 (gate)   JSD: 0.464   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  study.Agent ~ succeed.Theme   n 12 / 3   gate: PASS
;; A fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierC-000253
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000100
;; cosine: 0.52 (gate)   JSD: 0.562   shared clusters: 2 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
(Implication (And (Member $e0 succeed) (Theme $e0 $x1)) (And (Member $e0 succeed) (Agent $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 11 / 8   gate: PASS
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: bad ×2, alarmed, conservative, indigenous, inomaru, lax   e.g. tierB-001582 tierC-000158
;; cosine: 0.51 (gate)   JSD: 0.466   shared clusters: 6 e.g. {bad, bad, relationship, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {red, rag, rip, rough, …} {lax}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: PASS
;; A fillers: episode ×2, movie, thing, film ×0.5, syrian film ×0.5   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, insulin, film ×0.833, syrian film ×0.833, mesmerizing ×0.5   e.g. tierC-000009 tierC-000092
;; cosine: 0.51 (gate)   JSD: 0.553   shared clusters: 2 e.g. {movie, film} {syrian film, film, syrian film, destined, film, syrian film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 produce) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: PASS
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-001325
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000025
;; cosine: 0.51 (gate)   JSD: 0.572   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Elias, Tobias, Gabor, Gabriel} {man, guy, man, old}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 9   gate: PASS
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.51 (gate)   JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ speak.Agent   n 15 / 8   gate: PASS
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, man   e.g. tierB-000271 tierC-000094
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
;; A fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000987 tierB-001102
;; cosine: 0.50 (gate)   JSD: 0.635   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-000738
;; cosine: 0.48 (gate)   JSD: 0.57   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {girl, girls, girl, little}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000370 tierB-001658
;; cosine: 0.48 (gate)   JSD: 0.531   shared clusters: 4 e.g. {bad, bad, relationship, bad, matter, bad, problem} {expensive, expensive, thing} {cheap, inexpensive, low, price} {short, shortening}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-000030 tierB-000125
;; cosine: 0.48 (gate)   JSD: 0.554   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (And (Member $e0 stop) (Experiencer $e0 $x1)))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; cosine: 0.47 (gate)   JSD: 0.578   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [different class and role]  replace.Theme ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierC-000297 tierC-000298
;; cosine: 0.47 (gate)   JSD: 0.471   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 replace) (Theme $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [different class and role]  go.To ~ start.Theme   n 3 / 13   gate: FAIL
;; A fillers: talk ×2, see   e.g. tierC-000209 tierC-000210
;; B fillers: appear, chant, cry, disappear, hear, high school   e.g. tierB-001219 tierB-000465
;; cosine: 0.47 (gate)   JSD: 0.602   shared clusters: 2 e.g. {talk, conversation, discussion} {appear, see, display, show, …}
;; A: (And (Member $e0 go) (To $e0 $x1))
;; B: (And (Member $e0 start) (Theme $e0 $x1))
(Implication (And (Member $e0 go) (To $e0 $x1)) (And (Member $e0 go) (Theme $e0 $x1)))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001973 tierB-000338
;; B fillers: person ×2, sister ×2, Amateur Barbershop Harmony Society, David, actress, bird   e.g. tierB-001901 tierC-000127
;; cosine: 0.45 (gate)   JSD: 0.604   shared clusters: 2 e.g. {person, people} {bird, bird dropping, mother bird, birds}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ get.Patient   n 4 / 7   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001910 tierB-000370
;; cosine: 0.45 (gate)   JSD: 0.661   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

;; [different class and role]  find.Theme ~ get.Agent   n 10 / 6   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; B fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; cosine: 0.45 (gate)   JSD: 0.584   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: child ×4, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001538 tierB-001891
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

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierC-000243 tierC-000244
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierB-000706 tierC-000279
;; cosine: 0.43 (gate)   JSD: 0.503   shared clusters: 2 e.g. {Couper} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Theme $e0 $x1)))

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000410
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001753 tierB-001891
;; cosine: 0.42 (gate)   JSD: 0.569   shared clusters: 2 e.g. {child, children, kid, baby, …} {dog, dog feed}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Experiencer $e0 $x1)))

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.42 (gate)   JSD: 0.625   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ become.Patient   n 4 / 11   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; cosine: 0.41 (gate)   JSD: 0.674   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {relationship, relate, relationships}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 become) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001511 tierB-001268
;; cosine: 0.41 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000659 tierB-000695
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.41 (gate)   JSD: 0.656   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Experiencer $e0 $x1)))

;; [different class and role]  follow.Agent ~ rule.Theme   n 9 / 3   gate: FAIL
;; A fillers: bhadala ×2, Alexander, Bailey, Sami, muslim house, road   e.g. tierC-000095 tierC-000096
;; B fillers: Cuba, muslim house, house ×0.5, muslim ×0.5   e.g. tierB-000311 tierC-000095
;; cosine: 0.40 (gate)   JSD: 0.639   shared clusters: 2 e.g. {muslim, muslim house, muslim community, house, muslim, …} {house, home, comfortable, house, houses, …}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 rule) (Theme $e0 $x1))
(Implication (And (Member $e0 rule) (Theme $e0 $x1)) (And (Member $e0 rule) (Agent $e0 $x1)))

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 8   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; cosine: 0.40 (gate)   JSD: 0.636   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierC-000053 tierB-000940
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-001726 tierB-000987
;; cosine: 0.40 (gate)   JSD: 0.603   shared clusters: 3 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …} {president, person, president}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ read.Agent   n 10 / 3   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; B fillers: Katya, Thomas, girl ×0.5, little ×0.5   e.g. tierB-001637 tierB-001221
;; cosine: 0.40 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslim, person   e.g. tierB-000450 tierB-000556
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

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; cosine: 0.38 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Santiago, Manila, Havana} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
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

;; [different class and role]  hear.Experiencer ~ read.Agent   n 8 / 3   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Katya, Thomas, girl ×0.5, little ×0.5   e.g. tierB-001637 tierB-001221
;; cosine: 0.36 (gate)   JSD: 0.613   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Experiencer $e0 $x1)))

;; [different class and role]  lead.Agent ~ start.Patient   n 5 / 11   gate: FAIL
;; A fillers: thing ×2, dog, education, general   e.g. tierC-000019 tierC-000020
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001816 tierB-001446
;; cosine: 0.36 (gate)   JSD: 0.7   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {dog, dog feed}
;; A: (And (Member $e0 lead) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 lead) (Agent $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

;; [different class and role]  become.Patient ~ take.Agent   n 11 / 9   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierB-000740 tierC-000001
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierC-000071
;; cosine: 0.36 (gate)   JSD: 0.728   shared clusters: 2 e.g. {person, people} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Patient $e0 $x1)))

;; [same role, different class]  leave.Agent ~ travel.Agent   n 10 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000747
;; B fillers: person ×2, Matthew, Roger, campaigner   e.g. tierB-000995 tierB-001618
;; cosine: 0.36 (gate)   JSD: 0.682   shared clusters: 2 e.g. {person, people} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000704
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; cosine: 0.35 (gate)   JSD: 0.667   shared clusters: 3 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadala ×2, Alexander, Bailey, Sami, muslim house, road   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; cosine: 0.35 (gate)   JSD: 0.639   shared clusters: 2 e.g. {Alexander} {Bailey}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ find.Theme   n 18 / 10   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000119 tierC-000120
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; cosine: 0.34 (gate)   JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {paper, paper factory, paper mill, paper sheet, …}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Patient $e0 $x1)))

;; [different class and role]  find.Theme ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.34 (gate)   JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Theme $e0 $x1)))

;; [different class and role]  eat.Agent ~ have.Theme   n 4 / 43   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000410
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierC-000181
;; cosine: 0.33 (gate)   JSD: 0.827   shared clusters: 2 e.g. {child, children, kid, baby, …} {black, blue, white, brown, …}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Theme $e0 $x1)))

;; [same role, different class]  study.Agent ~ work.Agent   n 12 / 8   gate: FAIL
;; A fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierC-000253
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-000212 tierB-001813
;; cosine: 0.33 (gate)   JSD: 0.727   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierB-000940 tierC-000053
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; cosine: 0.32 (gate)   JSD: 0.718   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  turn.Patient ~ turn.Result   n 7 / 5   gate: FAIL
;; A fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000654 tierB-001675
;; cosine: 0.32 (gate)   JSD: 0.599   shared clusters: 4 e.g. {black, blue, white, brown, …} {gusher} {red, rag, rip, rough, …} {yellow, orange}
;; A: (And (Member $e0 turn) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 18   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; cosine: 0.32 (gate)   JSD: 0.732   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, tradition ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000076 tierC-000337
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
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslim, person   e.g. tierB-000450 tierB-000556
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; cosine: 0.32 (gate)   JSD: 0.683   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plant   e.g. tierC-000227 tierC-000228
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000942
;; cosine: 0.31 (gate)   JSD: 0.661   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {cook, recipe}
;; A: (And (Member $e0 add) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ build.Agent   n 6 / 14   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sister   e.g. tierC-000259 tierC-000260
;; B fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000119 tierC-000120
;; cosine: 0.31 (gate)   JSD: 0.545   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 build) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; cosine: 0.31 (gate)   JSD: 0.737   shared clusters: 3 e.g. {David, William, James} {Gustavo, Alberto, Martino, Pietro, …} {man, guy, man, old}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ want.Experiencer   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; cosine: 0.31 (gate)   JSD: 0.759   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ need.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000819 tierC-000181
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000086 tierB-000061
;; cosine: 0.31 (gate)   JSD: 0.777   shared clusters: 3 e.g. {Karl, Kristoffer} {Gustavo, Alberto, Martino, Pietro, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Holder $e0 $x1)))

;; [different class and role]  walk.Agent ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000846 tierB-000626
;; cosine: 0.31 (gate)   JSD: 0.703   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001183
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001538 tierB-001003
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

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Karl, Skura, cook, girl, school janitor, crowd ×0.5   e.g. tierB-000043 tierB-001219
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000036
;; cosine: 0.30 (gate)   JSD: 0.713   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {school janitor}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000577 tierB-000672
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-001773
;; cosine: 0.30 (gate)   JSD: 0.704   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {man, guy, man, old} {young, critic, young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
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

;; [different class and role]  have.Holder ~ hear.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000162
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; cosine: 0.29 (gate)   JSD: 0.761   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Holder $e0 $x1)))

;; [same role, different class]  build.Agent ~ replace.Agent   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000119 tierC-000120
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; cosine: 0.28 (gate)   JSD: 0.569   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  work.Agent ~ write.Agent   n 8 / 8   gate: FAIL
;; A fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-001813 tierB-001187
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierB-001962 tierC-000089
;; cosine: 0.28 (gate)   JSD: 0.725   shared clusters: 2 e.g. {person, people} {father, Dad, dad}
;; A: (And (Member $e0 work) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.28 (gate)   JSD: 0.737   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  lead.Goal ~ live.Location   n 5 / 8   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; cosine: 0.28 (gate)   JSD: 0.728   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 live) (Location $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (And (Member $e0 lead) (Location $e0 $x1)))

;; [same role, different class]  decide.Agent ~ study.Agent   n 4 / 12   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-001544 tierB-000401
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000710
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

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.27 (gate)   JSD: 0.82   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [same role, different class]  build.Agent ~ write.Agent   n 14 / 8   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000119 tierC-000120
;; B fillers: person ×2.5, Bill Wrubel ×2, Gilles Thibaut ×2, busy ×0.5, famous ×0.5, father ×0.5   e.g. tierC-000297 tierC-000298
;; cosine: 0.27 (gate)   JSD: 0.61   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ make.Agent   n 10 / 18   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; cosine: 0.26 (gate)   JSD: 0.773   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Agent $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 12   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000421
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000253
;; cosine: 0.26 (gate)   JSD: 0.663   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Fadil, Jamil, Sami}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  help.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Jonas, Karen, Michael, context, hothouse condition, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000004
;; cosine: 0.26 (gate)   JSD: 0.745   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ have.Holder   n 10 / 44   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurine, meteorite, paper sheet   e.g. tierC-000279 tierC-000280
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.25 (gate)   JSD: 0.829   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Holder $e0 $x1)))

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settler ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; cosine: 0.24 (gate)   JSD: 0.772   shared clusters: 2 e.g. {David, William, James} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; cosine: 0.24 (gate)   JSD: 0.754   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [same role, different class]  enter.Agent ~ serve.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslim, person   e.g. tierB-000450 tierB-000556
;; B fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierB-000940 tierC-000053
;; cosine: 0.23 (gate)   JSD: 0.715   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000747
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-000212 tierB-001813
;; cosine: 0.23 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {person, people}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001899 tierB-001816
;; cosine: 0.23 (gate)   JSD: 0.799   shared clusters: 2 e.g. {knock, kick, kick out} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [same role, different class]  become.Patient ~ get.Patient   n 11 / 7   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; cosine: 0.23 (gate)   JSD: 0.807   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000216
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.23 (gate)   JSD: 0.777   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  move.Agent ~ swim.Agent   n 4 / 5   gate: FAIL
;; A fillers: headquarters ×2, Sammy, fish ×0.5, school ×0.5   e.g. tierB-000782 tierB-001570
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-001008 tierB-001268
;; cosine: 0.23 (gate)   JSD: 0.658   shared clusters: 2 e.g. {fish, salmon, fish, red} {school, university, campus, college, …}
;; A: (And (Member $e0 move) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  buy.Theme ~ turn.Result   n 5 / 5   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000367 tierB-001690
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000832 tierB-000476
;; cosine: 0.22 (gate)   JSD: 0.725   shared clusters: 2 e.g. {yellow, orange} {black, blue, white, brown, …}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Theme $e0 $x1)))

;; [same role, different class]  change.Patient ~ get.Patient   n 8 / 7   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; cosine: 0.22 (gate)   JSD: 0.784   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslim, person   e.g. tierB-000450 tierB-000556
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

;; [different class and role]  make.Patient ~ talk.Recipient   n 20 / 3   gate: FAIL
;; A fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; B fillers: Loren, teacher, audience ×0.5, large ×0.5   e.g. tierB-001666 tierC-000209
;; cosine: 0.22 (gate)   JSD: 0.808   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {big, large, huge, massive, …}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 talk) (Recipient $e0 $x1))
(Implication (And (Member $e0 talk) (Recipient $e0 $x1)) (And (Member $e0 talk) (Patient $e0 $x1)))

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001457
;; cosine: 0.22 (gate)   JSD: 0.81   shared clusters: 3 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {bad, bad, relationship, bad, matter, bad, problem} {big, large, huge, massive, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ go.Agent   n 5 / 15   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girl   e.g. tierB-000030 tierB-001538
;; B fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; cosine: 0.22 (gate)   JSD: 0.754   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  learn.Theme ~ speak.Theme   n 3 / 6   gate: FAIL
;; A fillers: berber, vocabulary, foreign ×0.5, language ×0.5   e.g. tierB-000608 tierB-000229
;; B fillers: Ashe ×2, czech, english, polish, foreign ×0.5, language ×0.5   e.g. tierB-001068 tierB-000053
;; cosine: 0.22 (gate)   JSD: 0.683   shared clusters: 2 e.g. {language, english} {foreign, foreign language, foreign, language, foreigner}
;; A: (And (Member $e0 learn) (Theme $e0 $x1))
;; B: (And (Member $e0 speak) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ study.Agent   n 15 / 12   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierB-001879
;; cosine: 0.21 (gate)   JSD: 0.787   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ serve.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000704 tierB-000747
;; B fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierB-000940 tierC-000053
;; cosine: 0.21 (gate)   JSD: 0.779   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ take.Agent   n 44 / 9   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; cosine: 0.21 (gate)   JSD: 0.844   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Holder $e0 $x1)))

;; [same role, different class]  leave.Agent ~ try.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; cosine: 0.20 (gate)   JSD: 0.8   shared clusters: 2 e.g. {Jonas, Roger, Bob, Ralph, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001538 tierB-001003
;; cosine: 0.20 (gate)   JSD: 0.795   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; cosine: 0.19 (gate)   JSD: 0.827   shared clusters: 3 e.g. {hotel} {room, changing room, rooms} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (And (Member $e0 build) (Holder $e0 $x1)))

;; [different class and role]  build.Agent ~ replace.Theme   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabite   e.g. tierC-000119 tierC-000120
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; cosine: 0.19 (gate)   JSD: 0.628   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  build.Patient ~ make.Patient   n 18 / 20   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000213 tierC-000214
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001920 tierB-001431
;; cosine: 0.18 (gate)   JSD: 0.853   shared clusters: 2 e.g. {paper, paper factory, paper mill, paper sheet, …} {room, changing room, rooms}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ want.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierB-000855
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; cosine: 0.18 (gate)   JSD: 0.863   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Holder $e0 $x1)))

;; [different class and role]  go.Goal ~ swim.Agent   n 12 / 5   gate: FAIL
;; A fillers: bed ×4, Loren, aesthetic salon, bathroom, hospital, place   e.g. tierC-000210 tierB-001628
;; B fillers: fish ×1.5, Linda, child, school, red ×0.5   e.g. tierB-000313 tierB-000782
;; cosine: 0.17 (gate)   JSD: 0.752   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {school, university, campus, college, …}
;; A: (And (Member $e0 go) (Goal $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
(Implication (And (Member $e0 swim) (Agent $e0 $x1)) (And (Member $e0 swim) (Goal $e0 $x1)))

;; [different class and role]  go.Agent ~ want.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001183
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; cosine: 0.17 (gate)   JSD: 0.793   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 11 / 9   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierB-000740 tierB-000352
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000695
;; cosine: 0.17 (gate)   JSD: 0.837   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [same role, different class]  go.Agent ~ make.Agent   n 15 / 18   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; cosine: 0.16 (gate)   JSD: 0.794   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Inomaru, Barako, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 44   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-001910
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.16 (gate)   JSD: 0.843   shared clusters: 4 e.g. {thing, things, stuff, practice, thing} {Algeria, Afghanistan, Iran, Morocco, …} {bad, bad, relationship, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ try.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000947
;; cosine: 0.16 (gate)   JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (And (Member $e0 try) (Holder $e0 $x1)))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, movie, thing, film ×0.5, syrian film ×0.5   e.g. tierC-000138 tierC-000010
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; cosine: 0.16 (gate)   JSD: 0.856   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {movie, film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (And (Member $e0 direct) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Agent   n 44 / 18   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; cosine: 0.16 (gate)   JSD: 0.882   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [same class, different role]  lead.Goal ~ lead.Theme   n 5 / 3   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierC-000020 tierB-001086
;; B fillers: sheep, squad, big ×0.5, cat fight ×0.5   e.g. tierC-000019 tierB-001782
;; cosine: 0.16 (gate)   JSD: 0.745   shared clusters: 2 e.g. {big, large, huge, massive, …} {cat fight, big, cat fight}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 lead) (Theme $e0 $x1))
(Implication (And (Member $e0 lead) (Theme $e0 $x1)) (And (Member $e0 lead) (Goal $e0 $x1)))

;; [different class and role]  have.Holder ~ leave.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; cosine: 0.16 (gate)   JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (And (Member $e0 leave) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ read.Agent   n 44 / 3   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Katya, Thomas, girl ×0.5, little ×0.5   e.g. tierB-001637 tierB-001221
;; cosine: 0.16 (gate)   JSD: 0.878   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Holder $e0 $x1)))

;; [different class and role]  good.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.15 (gate)   JSD: 0.875   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 good) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ help.Agent   n 44 / 6   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierC-000182
;; B fillers: Jonas, Karen, Michael, context, hothouse condition, life experience   e.g. tierB-000319 tierC-000071
;; cosine: 0.15 (gate)   JSD: 0.87   shared clusters: 2 e.g. {Karen, Kalman, Kerr, Ken} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 help) (Agent $e0 $x1))
(Implication (And (Member $e0 help) (Agent $e0 $x1)) (And (Member $e0 help) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ play.Agent   n 15 / 15   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001496
;; B fillers: child ×4, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; cosine: 0.15 (gate)   JSD: 0.813   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ need.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001496
;; B fillers: Algeria, Karl, Martino, Yanni, child, doctor   e.g. tierB-000107 tierB-000455
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

;; [different class and role]  bear.Patient ~ get.Agent   n 6 / 6   gate: FAIL
;; A fillers: person ×3, Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-000906 tierB-001568
;; B fillers: Diego, Gabriel, Janos, Leonid, thing, man ×0.5   e.g. tierB-001325 tierB-001773
;; cosine: 0.14 (gate)   JSD: 0.75   shared clusters: 2 e.g. {Elias, Tobias, Gabor, Gabriel} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  have.Holder ~ walk.Agent   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000855
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; cosine: 0.13 (gate)   JSD: 0.883   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Holder $e0 $x1)))

;; [different class and role]  bad.Experiencer ~ make.Patient   n 4 / 20   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000371 tierB-001920
;; cosine: 0.13 (gate)   JSD: 0.879   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {matter, mass}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; cosine: 0.12 (gate)   JSD: 0.894   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {food, eat}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Holder $e0 $x1)))

;; [same role, different class]  make.Agent ~ speak.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-001182
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, man   e.g. tierC-000094 tierB-001068
;; cosine: 0.12 (gate)   JSD: 0.839   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {man, guy, man, old}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  start.Patient ~ turn.Result   n 11 / 5   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-000654
;; B fillers: black, crow, gusher, red, yellow   e.g. tierB-000476 tierB-000832
;; cosine: 0.12 (gate)   JSD: 0.85   shared clusters: 2 e.g. {gusher} {black, blue, white, brown, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Result $e0 $x1))
(Implication (And (Member $e0 turn) (Result $e0 $x1)) (And (Member $e0 turn) (Patient $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Holder   n 8 / 44   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.12 (gate)   JSD: 0.895   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Holder $e0 $x1)))

;; [different class and role]  lead.Goal ~ make.Patient   n 5 / 20   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000371 tierB-001457
;; cosine: 0.12 (gate)   JSD: 0.875   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, labourer, technetium, complex ×0.5, simple ×0.5   e.g. tierC-000164 tierC-000163
;; B fillers: main songwriting unit ×2, human barricade, technetium, complex ×0.5, main ×0.5, simple ×0.5   e.g. tierC-000179 tierB-000780
;; cosine: 0.12 (gate)   JSD: 0.692   shared clusters: 3 e.g. {technetium} {complex, complex, simple, complicated} {easy, simple, soft}
;; A: (And (Member $e0 form) (Agent $e0 $x1))
;; B: (And (Member $e0 form) (Patient $e0 $x1))
(Implication (And (Member $e0 form) (Patient $e0 $x1)) (And (Member $e0 form) (Agent $e0 $x1)))

;; [different class and role]  eat.Agent ~ start.Patient   n 4 / 11   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-001973
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001446
;; cosine: 0.11 (gate)   JSD: 0.839   shared clusters: 2 e.g. {dog, dog feed} {black, blue, white, brown, …}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Patient $e0 $x1)))

;; [different class and role]  beautiful.Experiencer ~ make.Patient   n 3 / 20   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000904
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000371
;; cosine: 0.11 (gate)   JSD: 0.881   shared clusters: 2 e.g. {beautiful, beauty, gorgeous, pretty} {room, changing room, rooms}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Patient $e0 $x1)))

;; [different class and role]  build.Patient ~ sell.Theme   n 18 / 7   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierB-001867 tierC-000119
;; B fillers: ice cream ×2, copy, milk, thing, bean ×0.5, cell phone ×0.5   e.g. tierB-001168 tierB-001956
;; cosine: 0.11 (gate)   JSD: 0.832   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {new, brand new, language, new, new, product}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 sell) (Theme $e0 $x1))
(Implication (And (Member $e0 sell) (Theme $e0 $x1)) (And (Member $e0 sell) (Patient $e0 $x1)))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 20   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; cosine: 0.11 (gate)   JSD: 0.851   shared clusters: 3 e.g. {house, home, comfortable, house, houses, …} {big, large, huge, massive, …} {cozy, comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (And (Member $e0 live) (Patient $e0 $x1)))

;; [different class and role]  become.Patient ~ have.Holder   n 11 / 44   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; cosine: 0.10 (gate)   JSD: 0.912   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {bad, bad, relationship, bad, matter, bad, problem}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (And (Member $e0 become) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ serve.Agent   n 15 / 10   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000204
;; B fillers: Indooroopilly ×2, person ×1.5, Ipswich, Ipswich & Rosewood, Janos, Rosewood   e.g. tierB-000940 tierB-000864
;; cosine: 0.10 (gate)   JSD: 0.838   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Mom, mother, grandmother, parent, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  stop.Agent ~ work.Agent   n 4 / 8   gate: FAIL
;; A fillers: Rima, Skura, Yanni, adaptor ×0.5, old ×0.5   e.g. tierB-001873 tierB-000030
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-000212 tierC-000079
;; cosine: 0.10 (gate)   JSD: 0.828   shared clusters: 2 e.g. {adaptor, adaptor, old} {old, aging, ages ago, elderly}
;; A: (And (Member $e0 stop) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  give.Theme ~ have.Theme   n 4 / 43   gate: FAIL
;; A fillers: chocolate, mock champagne, thing, advice ×0.5, good ×0.5   e.g. tierC-000111 tierB-000137
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000162 tierB-001103
;; cosine: 0.10 (gate)   JSD: 0.914   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {good, great, nice, pleasant, …}
;; A: (And (Member $e0 give) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ have.Holder   n 15 / 44   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000012
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000855 tierB-001216
;; cosine: 0.10 (gate)   JSD: 0.891   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karen, Kalman, Kerr, Ken}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (And (Member $e0 go) (Holder $e0 $x1)))

;; [different class and role]  bear.Patient ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: person ×3, Tobias, Tycho Brahe, man ×0.5, poor ×0.5   e.g. tierB-000906 tierB-001568
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000025 tierB-001182
;; cosine: 0.09 (gate)   JSD: 0.842   shared clusters: 2 e.g. {Elias, Tobias, Gabor, Gabriel} {man, guy, man, old}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [same class, different role]  make.Patient ~ make.Result   n 20 / 7   gate: FAIL
;; A fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-001920
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-000325 tierB-001754
;; cosine: 0.09 (gate)   JSD: 0.898   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {beautiful, beauty, gorgeous, pretty}
;; A: (And (Member $e0 make) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Patient $e0 $x1)))

;; [same role, different class]  start.Patient ~ turn.Patient   n 11 / 7   gate: FAIL
;; A fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-000654
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-001579
;; cosine: 0.09 (gate)   JSD: 0.843   shared clusters: 3 e.g. {gusher} {freedom movement, freedom, independence} {black, blue, white, brown, …}
;; A: (And (Member $e0 start) (Patient $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ have.Theme   n 8 / 43   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000098 tierB-001217
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000722 tierB-000162
;; cosine: 0.09 (gate)   JSD: 0.907   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Theme $e0 $x1)))

;; [different class and role]  buy.Theme ~ turn.Patient   n 5 / 7   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-000367 tierB-001690
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000832 tierB-000476
;; cosine: 0.09 (gate)   JSD: 0.849   shared clusters: 2 e.g. {black, blue, white, brown, …} {yellow, orange}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Patient $e0 $x1)))

;; [different class and role]  have.Holder ~ study.Agent   n 44 / 12   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000855
;; B fillers: person ×3, scientist ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; cosine: 0.08 (gate)   JSD: 0.9   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (And (Member $e0 study) (Holder $e0 $x1)))

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 44   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000790
;; cosine: 0.08 (gate)   JSD: 0.914   shared clusters: 2 e.g. {room, changing room, rooms} {weather, bad, weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000142
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001378 tierB-000971
;; cosine: 0.07 (gate)   JSD: 0.908   shared clusters: 3 e.g. {room, changing room, rooms} {sentence, english sentence, sentences} {word, word processor}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (And (Member $e0 use) (Holder $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Theme   n 7 / 43   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-001658 tierB-000370
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001553 tierB-000162
;; cosine: 0.07 (gate)   JSD: 0.924   shared clusters: 2 e.g. {day, days, days, short, one day} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 15   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-001457
;; B fillers: child ×4, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-001840
;; cosine: 0.07 (gate)   JSD: 0.879   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {boy, boys}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001016
;; cosine: 0.07 (gate)   JSD: 0.932   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Patient   n 44 / 20   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001016
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000371
;; cosine: 0.07 (gate)   JSD: 0.903   shared clusters: 4 e.g. {Algeria, Afghanistan, Iran, Morocco, …} {house, home, comfortable, house, houses, …} {room, changing room, rooms} {bad, bad, relationship, bad, matter, bad, problem}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ write.Patient   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000931 tierB-000142
;; B fillers: episode ×2, song ×2, book, character, letter, screenplay   e.g. tierB-001962 tierB-000971
;; cosine: 0.06 (gate)   JSD: 0.915   shared clusters: 2 e.g. {book, library, books} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (And (Member $e0 write) (Holder $e0 $x1)))

;; [same role, different class]  become.Patient ~ make.Patient   n 11 / 20   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000073
;; cosine: 0.06 (gate)   JSD: 0.923   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ work.Agent   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000665
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, person   e.g. tierB-000212 tierB-001873
;; cosine: 0.06 (gate)   JSD: 0.931   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {old, aging, ages ago, elderly}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (And (Member $e0 work) (Holder $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Result   n 43 / 7   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001016 tierB-001264
;; B fillers: bad, beautiful, hazardous, king, uncomfortable, white   e.g. tierB-001920 tierB-001431
;; cosine: 0.06 (gate)   JSD: 0.94   shared clusters: 2 e.g. {beautiful, beauty, gorgeous, pretty} {black, blue, white, brown, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Result $e0 $x1))
(Implication (And (Member $e0 make) (Result $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000314 tierC-000114
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000313 tierC-000113
;; cosine: 0.05 (gate)   JSD: 0.896   shared clusters: 2 e.g. {Yunnan, Chongqing} {islamic ivory, ivory}
;; A: (PartOf $x0 $x1)
;; B: (Possession $x0 $x1)
(Implication (PartOf $x0 $x1) (Possession $x0 $x1))

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000162 tierB-000797
;; cosine: 0.05 (gate)   JSD: 0.945   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {gas station, gas pump, gas pumps}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (And (Member $e0 have) (Holder $e0 $x1)))

;; [different class and role]  have.Theme ~ start.Patient   n 43 / 11   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001816
;; cosine: 0.05 (gate)   JSD: 0.941   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {black, blue, white, brown, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (And (Member $e0 start) (Theme $e0 $x1)))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 46 / 11   gate: FAIL
;; A fillers: here ×3, Derwent Isle ×2, city ×2, class ×2, garden ×2, southern ×2   e.g. tierB-000523 tierB-001111
;; B fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierB-001932 tierB-001966
;; cosine: 0.05 (gate)   JSD: 0.93   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 43 / 18   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001920 tierB-001831
;; cosine: 0.05 (gate)   JSD: 0.943   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {curtain, blue, curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ turn.Patient   n 43 / 7   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-001929
;; B fillers: Gustavo, road, russian speech, war, black ×0.5, ceiling ×0.5   e.g. tierB-000476 tierB-000832
;; cosine: 0.04 (gate)   JSD: 0.943   shared clusters: 2 e.g. {leaf, foliage, leaves} {black, blue, white, brown, …}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 turn) (Patient $e0 $x1))
(Implication (And (Member $e0 turn) (Patient $e0 $x1)) (And (Member $e0 turn) (Theme $e0 $x1)))

;; [different class and role]  create.Patient ~ use.Theme   n 7 / 23   gate: FAIL
;; A fillers: community ×4, particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001378 tierB-001304
;; cosine: 0.02 (gate)   JSD: 0.927   shared clusters: 2 e.g. {schedule, calendar} {diverse, various}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (And (Member $e0 create) (Theme $e0 $x1)))
