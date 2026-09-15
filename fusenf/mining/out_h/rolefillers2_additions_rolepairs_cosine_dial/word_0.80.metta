;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — ROLE PAIRS (our extension) — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_rolepairs_faithful_cosine_<mode>_<cut>.jsonl   (every role pair with its gate verdict)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_additions_rolepairs_cosine.metta
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
;;   role-pair floor a head enters the role-pair level at n >= 14 embedded fillers
;;   levels          role pairs only = OUR EXTENSION, not the paper's method (--levels role): one head's
;;                   fillers pooled over every class; the paper's slot pairs are the default run
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
;; Role pairs: every head pair.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as
;; (And (Member $x0 <class>) (<Head> $x0 $x1)) (bare (<Head> $x0 $x1) for an unclassed centre), a role pair's
;; side as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== ROLE PAIRS: 22 heads at n >= 14, 231 pairs, 2 pass the gate ====================
;; (OUR EXTENSION, not the paper's method: one head's fillers pooled over every class, against every other
;; head's; the paper's 'Agent2' most likely names the second participant slot of the 'go to' meta-node, i.e. a slot)

;; [role pair]  Agent ~ Experiencer   n 888 / 261   gate: PASS
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.69 (gate)   JSD: 0.584   shared clusters: 69 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (Agent $e $x)
;; B: (Experiencer $e $x)
(Implication (Experiencer $e $x) (Agent $e $x))

;; [role pair]  Patient ~ Theme   n 455 / 594   gate: PASS
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.52 (gate)   JSD: 0.683   shared clusters: 105 e.g. {thing, things, stuff, practice, thing} {person, people} {movie, film}
;; A: (Patient $e $x)
;; B: (Theme $e $x)
(Implication (Patient $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.47 (gate)   JSD: 0.625   shared clusters: 101 e.g. {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Experiencer $e $x)
;; B: (Patient $e $x)
(Implication (Experiencer $e $x) (Patient $e $x))

;; [role pair]  Agent ~ Patient   n 888 / 455   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.47 (gate)   JSD: 0.705   shared clusters: 88 e.g. {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Agent $e $x)
;; B: (Patient $e $x)
(Implication (Patient $e $x) (Agent $e $x))

;; [role pair]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.43 (gate)   JSD: 0.71   shared clusters: 93 e.g. {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …}
;; A: (Agent $e $x)
;; B: (Theme $e $x)
(Implication (Theme $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.42 (gate)   JSD: 0.711   shared clusters: 74 e.g. {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Experiencer $e $x)
;; B: (Theme $e $x)
(Implication (Experiencer $e $x) (Theme $e $x))

;; [role pair]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.38 (gate)   JSD: 0.761   shared clusters: 15 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation}
;; A: (Agent $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Agent $e $x))

;; [role pair]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.38 (gate)   JSD: 0.853   shared clusters: 12 e.g. {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat}
;; A: (Stimulus $e $x)
;; B: (Theme $e $x)
(Implication (Stimulus $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.36 (gate)   JSD: 0.716   shared clusters: 19 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (Experiencer $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Experiencer $e $x))

;; [role pair]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.27 (gate)   JSD: 0.823   shared clusters: 10 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Experiencer $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Experiencer $e $x))

;; [role pair]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.27 (gate)   JSD: 0.818   shared clusters: 22 e.g. {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …}
;; A: (Holder $e $x)
;; B: (Theme $e $x)
(Implication (Holder $e $x) (Theme $e $x))

;; [role pair]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.26 (gate)   JSD: 0.779   shared clusters: 19 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …}
;; A: (Agent $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Agent $e $x))

;; [role pair]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.24 (gate)   JSD: 0.913   shared clusters: 6 e.g. {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {knock, kick, kick out}
;; A: (Patient $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Patient $e $x))

;; [role pair]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; cosine: 0.24 (gate)   JSD: 0.846   shared clusters: 6 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Agent $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Agent $e $x))

;; [role pair]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.24 (gate)   JSD: 0.806   shared clusters: 20 e.g. {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms}
;; A: (Holder $e $x)
;; B: (Patient $e $x)
(Implication (Holder $e $x) (Patient $e $x))

;; [role pair]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.24 (gate)   JSD: 0.797   shared clusters: 17 e.g. {Germany, Denmark, Norway, Sweden} {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …}
;; A: (Goal $e $x)
;; B: (Location $e $x)
(Implication (Goal $e $x) (Location $e $x))

;; [role pair]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.22 (gate)   JSD: 0.789   shared clusters: 3 e.g. {Jessica, Linda, Beth, Katherine, …} {person, people} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Recipient $e $x)
(Implication (Beneficiary $e $x) (Recipient $e $x))

;; [role pair]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.20 (gate)   JSD: 0.829   shared clusters: 13 e.g. {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana}
;; A: (Location $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Location $e $x))

;; [role pair]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.19 (gate)   JSD: 0.883   shared clusters: 8 e.g. {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Experiencer $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.18 (gate)   JSD: 0.886   shared clusters: 9 e.g. {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …}
;; A: (Agent $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Agent $e $x))

;; [role pair]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.17 (gate)   JSD: 0.908   shared clusters: 8 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Patient $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Patient $e $x))

;; [role pair]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.17 (gate)   JSD: 0.88   shared clusters: 1 e.g. {now, today, this year, current, …}
;; A: (Before $e $x)
;; B: (Time $e $x)
(Implication (Before $e $x) (Time $e $x))

;; [role pair]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.16 (gate)   JSD: 0.883   shared clusters: 4 e.g. {use, well, direct, do, …} {together, come together} {former, back, early, backward, …}
;; A: (Manner $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Manner $e $x))

;; [role pair]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.16 (gate)   JSD: 0.89   shared clusters: 3 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (Experiencer $e $x)
(Implication (Beneficiary $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.16 (gate)   JSD: 0.852   shared clusters: 8 e.g. {city, town, cities, town, unknown, …} {here, host} {school, university, campus, college, …}
;; A: (Goal $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Goal $e $x))

;; [role pair]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.15 (gate)   JSD: 0.906   shared clusters: 9 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Recipient $e $x)
;; B: (Theme $e $x)
(Implication (Recipient $e $x) (Theme $e $x))

;; [role pair]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.15 (gate)   JSD: 0.881   shared clusters: 17 e.g. {thing, things, stuff, practice, thing} {talk, conversation, discussion} {music}
;; A: (Theme $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.15 (gate)   JSD: 0.806   shared clusters: 28 e.g. {bad, bad, relationship, bad, matter, bad, problem} {black, blue, white, brown, …} {use, well, direct, do, …}
;; A: (Experiencer $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Experiencer $e $x))

;; [role pair]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.15 (gate)   JSD: 0.892   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {author, writer, novelist} {food, eat}
;; A: (Holder $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Holder $e $x))

;; [role pair]  As ~ Recipient   n 15 / 29   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.14 (gate)   JSD: 0.906   shared clusters: 1 e.g. {Peter, Paul, Paulus}
;; A: (As $e $x)
;; B: (Recipient $e $x)
(Implication (As $e $x) (Recipient $e $x))

;; [role pair]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.13 (gate)   JSD: 0.888   shared clusters: 23 e.g. {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Baltimore, Boston, San Francisco, Springfield}
;; A: (Goal $e $x)
;; B: (Theme $e $x)
(Implication (Goal $e $x) (Theme $e $x))

;; [role pair]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.13 (gate)   JSD: 0.915   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Manner $e $x)
(Implication (As $e $x) (Manner $e $x))

;; [role pair]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.12 (gate)   JSD: 0.863   shared clusters: 27 e.g. {bad, bad, relationship, bad, matter, bad, problem} {black, blue, white, brown, …} {snow, cold, frost, snowstorm, …}
;; A: (Patient $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Patient $e $x))

;; [role pair]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.12 (gate)   JSD: 0.895   shared clusters: 13 e.g. {tree, trees, treetop} {room, changing room, rooms} {road, way, lane, motorway, …}
;; A: (Patient $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Patient $e $x))

;; [role pair]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.12 (gate)   JSD: 0.891   shared clusters: 5 e.g. {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {place, places, easy, place, full, place}
;; A: (Goal $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Goal $e $x))

;; [role pair]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.12 (gate)   JSD: 0.89   shared clusters: 4 e.g. {city, town, cities, town, unknown, …} {room, changing room, rooms} {place, places, easy, place, full, place}
;; A: (Holder $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Holder $e $x))

;; [role pair]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.12 (gate)   JSD: 0.914   shared clusters: 1 e.g. {Karen, Kalman, Kerr, Ken}
;; A: (CoAgent $e $x)
;; B: (Holder $e $x)
(Implication (CoAgent $e $x) (Holder $e $x))

;; [role pair]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.12 (gate)   JSD: 0.933   shared clusters: 3 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (Patient $e $x)
(Implication (Beneficiary $e $x) (Patient $e $x))

;; [role pair]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.12 (gate)   JSD: 0.883   shared clusters: 8 e.g. {Jessica, Linda, Beth, Katherine, …} {Karen, Kalman, Kerr, Ken} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;; A: (Agent $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Agent $e $x))

;; [role pair]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.11 (gate)   JSD: 0.864   shared clusters: 22 e.g. {tree, trees, treetop} {house, home, comfortable, house, houses, …} {room, changing room, rooms}
;; A: (Goal $e $x)
;; B: (Patient $e $x)
(Implication (Goal $e $x) (Patient $e $x))

;; [role pair]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.11 (gate)   JSD: 0.917   shared clusters: 11 e.g. {work, job, work through, hard, work} {portray, portrait, portrayal} {ship, british ship, israeli military ship, merchant ship, …}
;; A: (For $e $x)
;; B: (Theme $e $x)
(Implication (For $e $x) (Theme $e $x))

;; [role pair]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.10 (gate)   JSD: 0.935   shared clusters: 3 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Theme $e $x)
(Implication (Beneficiary $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.10 (gate)   JSD: 0.869   shared clusters: 18 e.g. {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (Experiencer $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Experiencer $e $x))

;; [role pair]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.10 (gate)   JSD: 0.913   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Recipient $e $x)
;; B: (Stimulus $e $x)
(Implication (Recipient $e $x) (Stimulus $e $x))

;; [role pair]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.10 (gate)   JSD: 0.907   shared clusters: 4 e.g. {Jessica, Linda, Beth, Katherine, …} {city, town, cities, town, unknown, …} {class, classroom}
;; A: (Goal $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Goal $e $x))

;; [role pair]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.10 (gate)   JSD: 0.887   shared clusters: 7 e.g. {sleep, bed} {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
;; A: (Goal $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Goal $e $x))

;; [role pair]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; cosine: 0.09 (gate)   JSD: 0.918   shared clusters: 7 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {Peter, Paul, Paulus} {girl, girls, girl, little}
;; A: (Agent $e $x)
;; B: (As $e $x)
(Implication (As $e $x) (Agent $e $x))

;; [role pair]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.09 (gate)   JSD: 0.948   shared clusters: 3 e.g. {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Jessica, Linda, Beth, Katherine, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;; A: (CoAgent $e $x)
;; B: (Theme $e $x)
(Implication (CoAgent $e $x) (Theme $e $x))

;; [role pair]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.09 (gate)   JSD: 0.9   shared clusters: 18 e.g. {view, views, common, view, public, view, …} {food, eat} {room, changing room, rooms}
;; A: (Source $e $x)
;; B: (Theme $e $x)
(Implication (Source $e $x) (Theme $e $x))

;; [role pair]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.09 (gate)   JSD: 0.931   shared clusters: 7 e.g. {thing, things, stuff, practice, thing} {computer, machine} {bake, bakery, bread}
;; A: (Patient $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Patient $e $x))

;; [role pair]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.09 (gate)   JSD: 0.908   shared clusters: 7 e.g. {city, town, cities, town, unknown, …} {house, home, comfortable, house, houses, …} {place, places, easy, place, full, place}
;; A: (Holder $e $x)
;; B: (Location $e $x)
(Implication (Holder $e $x) (Location $e $x))

;; [role pair]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.09 (gate)   JSD: 0.907   shared clusters: 4 e.g. {thing, things, stuff, practice, thing} {practice} {action, activity, active, act, …}
;; A: (Stimulus $e $x)
;; B: (To $e $x)
(Implication (Stimulus $e $x) (To $e $x))

;; [role pair]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.08 (gate)   JSD: 0.877   shared clusters: 29 e.g. {door, back door, door, open, door, unlocked, …} {table} {hotel}
;; A: (Location $e $x)
;; B: (Patient $e $x)
(Implication (Location $e $x) (Patient $e $x))

;; [role pair]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.08 (gate)   JSD: 0.92   shared clusters: 4 e.g. {Jessica, Linda, Beth, Katherine, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …} {cat, cats}
;; A: (CoAgent $e $x)
;; B: (Experiencer $e $x)
(Implication (CoAgent $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.07 (gate)   JSD: 0.907   shared clusters: 20 e.g. {Jessica, Linda, Beth, Katherine, …} {house, home, comfortable, house, houses, …} {sleep, bed}
;; A: (Agent $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Agent $e $x))

;; [role pair]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.07 (gate)   JSD: 0.912   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Stimulus $e $x)
(Implication (Beneficiary $e $x) (Stimulus $e $x))

;; [role pair]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.07 (gate)   JSD: 0.877   shared clusters: 25 e.g. {Europe, Western Europe} {Kazakhstan, North Korea} {house, home, comfortable, house, houses, …}
;; A: (Experiencer $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Experiencer $e $x))

;; [role pair]  Recipient ~ Source   n 29 / 47   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.07 (gate)   JSD: 0.913   shared clusters: 4 e.g. {city, town, cities, town, unknown, …} {local, local level, locals} {company, corporation}
;; A: (Recipient $e $x)
;; B: (Source $e $x)
(Implication (Recipient $e $x) (Source $e $x))

;; [role pair]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.06 (gate)   JSD: 0.926   shared clusters: 11 e.g. {use, well, direct, do, …} {late, later, let, last, …} {truth, fact, true, really, …}
;; A: (Experiencer $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Experiencer $e $x))

;; [role pair]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.06 (gate)   JSD: 0.898   shared clusters: 32 e.g. {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {station, Springfield Station}
;; A: (Location $e $x)
;; B: (Theme $e $x)
(Implication (Location $e $x) (Theme $e $x))

;; [role pair]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.06 (gate)   JSD: 0.945   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Result $e $x)
(Implication (As $e $x) (Result $e $x))

;; [role pair]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.06 (gate)   JSD: 0.95   shared clusters: 3 e.g. {use, well, direct, do, …} {former, back, early, backward, …} {happiness, happy, happily, joy}
;; A: (Goal $e $x)
;; B: (Manner $e $x)
(Implication (Goal $e $x) (Manner $e $x))

;; [role pair]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.05 (gate)   JSD: 0.945   shared clusters: 4 e.g. {use, well, direct, do, …} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {caretaker, keeper}
;; A: (As $e $x)
;; B: (Experiencer $e $x)
(Implication (As $e $x) (Experiencer $e $x))

;; [role pair]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.05 (gate)   JSD: 0.934   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Recipient $e $x)
(Implication (CoAgent $e $x) (Recipient $e $x))

;; [role pair]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.05 (gate)   JSD: 0.947   shared clusters: 10 e.g. {use, well, direct, do, …} {whole, full, entire, fully, …} {truth, fact, true, really, …}
;; A: (Manner $e $x)
;; B: (Theme $e $x)
(Implication (Manner $e $x) (Theme $e $x))

;; [role pair]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.05 (gate)   JSD: 0.937   shared clusters: 7 e.g. {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Agent $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.05 (gate)   JSD: 0.944   shared clusters: 4 e.g. {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Experiencer $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Experiencer $e $x))

;; [role pair]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.05 (gate)   JSD: 0.951   shared clusters: 2 e.g. {sleep, bed} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Goal $e $x)
(Implication (For $e $x) (Goal $e $x))

;; [role pair]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.05 (gate)   JSD: 0.943   shared clusters: 12 e.g. {black, blue, white, brown, …} {use, well, direct, do, …} {sleep, bed}
;; A: (Result $e $x)
;; B: (Theme $e $x)
(Implication (Result $e $x) (Theme $e $x))

;; [role pair]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.05 (gate)   JSD: 0.938   shared clusters: 3 e.g. {road, way, lane, motorway, …} {food, eat} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Source $e $x)
(Implication (Instrument $e $x) (Source $e $x))

;; [role pair]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.05 (gate)   JSD: 0.942   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {repeat, repetition}
;; A: (Holder $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Holder $e $x))

;; [role pair]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.05 (gate)   JSD: 0.925   shared clusters: 12 e.g. {place, places, easy, place, full, place} {road, way, lane, motorway, …} {room, changing room, rooms}
;; A: (Experiencer $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Experiencer $e $x))

;; [role pair]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.04 (gate)   JSD: 0.939   shared clusters: 9 e.g. {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {ticket, issue, bug, tickets}
;; A: (Instrument $e $x)
;; B: (Patient $e $x)
(Implication (Instrument $e $x) (Patient $e $x))

;; [role pair]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.04 (gate)   JSD: 0.946   shared clusters: 4 e.g. {city, town, cities, town, unknown, …} {local, local level, locals} {little, small, low, thin, …}
;; A: (Location $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Location $e $x))

;; [role pair]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.04 (gate)   JSD: 0.939   shared clusters: 10 e.g. {company, corporation} {Santiago, Manila, Havana} {plane, flight, aeroplane, airplane, …}
;; A: (Agent $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Agent $e $x))

;; [role pair]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.04 (gate)   JSD: 0.959   shared clusters: 5 e.g. {use, well, direct, do, …} {name} {girl, girls, girl, little}
;; A: (As $e $x)
;; B: (Theme $e $x)
(Implication (As $e $x) (Theme $e $x))

;; [role pair]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.04 (gate)   JSD: 0.937   shared clusters: 3 e.g. {red, rag, rip, rough, …} {snow, cold, frost, snowstorm, …} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Result $e $x)
(Implication (Instrument $e $x) (Result $e $x))

;; [role pair]  Manner ~ Patient   n 115 / 455   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.04 (gate)   JSD: 0.966   shared clusters: 6 e.g. {use, well, direct, do, …} {whole, full, entire, fully, …} {together, come together}
;; A: (Manner $e $x)
;; B: (Patient $e $x)
(Implication (Manner $e $x) (Patient $e $x))

;; [role pair]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.04 (gate)   JSD: 0.948   shared clusters: 7 e.g. {community, society} {road, way, lane, motorway, …} {weather, bad, weather}
;; A: (In $e $x)
;; B: (Patient $e $x)
(Implication (In $e $x) (Patient $e $x))

;; [role pair]  Beneficiary ~ CoAgent   n 14 / 16   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.04 (gate)   JSD: 0.933   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (CoAgent $e $x)
(Implication (Beneficiary $e $x) (CoAgent $e $x))

;; [role pair]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.04 (gate)   JSD: 0.955   shared clusters: 7 e.g. {food, eat} {drum, snare, drums} {new, brand new, language, new, new, product}
;; A: (Instrument $e $x)
;; B: (Theme $e $x)
(Implication (Instrument $e $x) (Theme $e $x))

;; [role pair]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.04 (gate)   JSD: 0.904   shared clusters: 4 e.g. {late, later, let, last, …} {immediately, instantly, next instant, right away} {former, back, early, backward, …}
;; A: (Manner $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Manner $e $x))

;; [role pair]  Beneficiary ~ Goal   n 14 / 93   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.04 (gate)   JSD: 0.964   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (Goal $e $x)
(Implication (Beneficiary $e $x) (Goal $e $x))

;; [role pair]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.04 (gate)   JSD: 0.948   shared clusters: 6 e.g. {weather, bad, weather} {action, activity, active, act, …} {road, way, lane, motorway, …}
;; A: (Experiencer $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Experiencer $e $x))

;; [role pair]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.04 (gate)   JSD: 0.95   shared clusters: 2 e.g. {food, eat} {accident, crash}
;; A: (Instrument $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Instrument $e $x))

;; [role pair]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.04 (gate)   JSD: 0.957   shared clusters: 5 e.g. {use, well, direct, do, …} {world, international, global, internationally} {former, back, early, backward, …}
;; A: (Location $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Location $e $x))

;; [role pair]  Holder ~ Recipient   n 48 / 29   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.04 (gate)   JSD: 0.962   shared clusters: 1 e.g. {city, town, cities, town, unknown, …}
;; A: (Holder $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Holder $e $x))

;; [role pair]  Experiencer ~ Time   n 261 / 107   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.04 (gate)   JSD: 0.956   shared clusters: 6 e.g. {now, today, this year, current, …} {night, tonight, night shift, midnight, …} {late, later, let, last, …}
;; A: (Experiencer $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Experiencer $e $x))

;; [role pair]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.04 (gate)   JSD: 0.961   shared clusters: 7 e.g. {language, english} {understand, misunderstand} {truth, fact, true, really, …}
;; A: (In $e $x)
;; B: (Theme $e $x)
(Implication (In $e $x) (Theme $e $x))

;; [role pair]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.03 (gate)   JSD: 0.953   shared clusters: 2 e.g. {action, activity, active, act, …} {poetry}
;; A: (In $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (In $e $x))

;; [role pair]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.03 (gate)   JSD: 0.95   shared clusters: 6 e.g. {train} {road, way, lane, motorway, …} {snow, cold, frost, snowstorm, …}
;; A: (Experiencer $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Experiencer $e $x))

;; [role pair]  Before ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.03 (gate)   JSD: 0.958   shared clusters: 1 e.g. {break out, bang, break, burst, …}
;; A: (Before $e $x)
;; B: (Stimulus $e $x)
(Implication (Before $e $x) (Stimulus $e $x))

;; [role pair]  For ~ Result   n 39 / 43   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.951   shared clusters: 2 e.g. {beautiful, beauty, gorgeous, pretty} {sleep, bed}
;; A: (For $e $x)
;; B: (Result $e $x)
(Implication (For $e $x) (Result $e $x))

;; [role pair]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.03 (gate)   JSD: 0.95   shared clusters: 4 e.g. {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Goal $e $x))

;; [role pair]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.03 (gate)   JSD: 0.954   shared clusters: 3 e.g. {road, way, lane, motorway, …} {community, society} {field, fields}
;; A: (Goal $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Goal $e $x))

;; [role pair]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.03 (gate)   JSD: 0.952   shared clusters: 2 e.g. {crop, rice crop, corn, crops} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Instrument $e $x))

;; [role pair]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.03 (gate)   JSD: 0.962   shared clusters: 5 e.g. {dung beetle, insect, centipede, centipedes, …} {fire, flame, burn, scorch, …} {crocodile, snake}
;; A: (Agent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Agent $e $x))

;; [role pair]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.03 (gate)   JSD: 0.926   shared clusters: 24 e.g. {here, host} {Santiago, Manila, Havana} {France, French Dahomey}
;; A: (Agent $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Agent $e $x))

;; [role pair]  Holder ~ Result   n 48 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.976   shared clusters: 1 e.g. {bad, bad, relationship, bad, matter, bad, problem}
;; A: (Holder $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Holder $e $x))

;; [role pair]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.03 (gate)   JSD: 0.976   shared clusters: 4 e.g. {take, take over, take off} {expand, spread, unfold, stretch} {now, today, this year, current, …}
;; A: (Before $e $x)
;; B: (Theme $e $x)
(Implication (Before $e $x) (Theme $e $x))

;; [role pair]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.03 (gate)   JSD: 0.966   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Goal $e $x)
(Implication (CoAgent $e $x) (Goal $e $x))

;; [role pair]  CoAgent ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.03 (gate)   JSD: 0.958   shared clusters: 1 e.g. {bicycle, rider, bike, cyclist, …}
;; A: (CoAgent $e $x)
;; B: (Instrument $e $x)
(Implication (CoAgent $e $x) (Instrument $e $x))

;; [role pair]  CoAgent ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.03 (gate)   JSD: 0.958   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Stimulus $e $x)
(Implication (CoAgent $e $x) (Stimulus $e $x))

;; [role pair]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.03 (gate)   JSD: 0.945   shared clusters: 3 e.g. {whole, full, entire, fully, …} {around, ring, round} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Manner $e $x)
(Implication (For $e $x) (Manner $e $x))

;; [role pair]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.97   shared clusters: 1 e.g. {silent, silence, forest, silent}
;; A: (In $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (In $e $x))

;; [role pair]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.03 (gate)   JSD: 0.972   shared clusters: 3 e.g. {use, well, direct, do, …} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {name}
;; A: (As $e $x)
;; B: (Patient $e $x)
(Implication (As $e $x) (Patient $e $x))

;; [role pair]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.03 (gate)   JSD: 0.963   shared clusters: 2 e.g. {bat} {big, large, huge, massive, …}
;; A: (Result $e $x)
;; B: (Source $e $x)
(Implication (Result $e $x) (Source $e $x))

;; [role pair]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.03 (gate)   JSD: 0.976   shared clusters: 5 e.g. {now, today, this year, current, …} {morning, dawn, early morning, morning light, …} {day, days, days, short, one day}
;; A: (Theme $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.03 (gate)   JSD: 0.957   shared clusters: 5 e.g. {word, word processor} {happiness, happy, happily, joy} {beautiful, beauty, gorgeous, pretty}
;; A: (Experiencer $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.03 (gate)   JSD: 0.975   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Goal $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Goal $e $x))

;; [role pair]  In ~ Instrument   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.03 (gate)   JSD: 0.97   shared clusters: 1 e.g. {road, way, lane, motorway, …}
;; A: (In $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (In $e $x))

;; [role pair]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.959   shared clusters: 6 e.g. {use, well, direct, do, …} {big, large, huge, massive, …} {snow, cold, frost, snowstorm, …}
;; A: (Location $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Location $e $x))

;; [role pair]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.02 (gate)   JSD: 0.956   shared clusters: 10 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {crow, eagle, stork, caw} {black, blue, white, brown, …}
;; A: (Agent $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Agent $e $x))

;; [role pair]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.02 (gate)   JSD: 0.958   shared clusters: 9 e.g. {Mark, marker, markers} {snow, cold, frost, snowstorm, …} {train}
;; A: (Agent $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Agent $e $x))

;; [role pair]  As ~ Goal   n 15 / 93   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.02 (gate)   JSD: 0.966   shared clusters: 2 e.g. {use, well, direct, do, …} {potential, possibility, new, possibilities}
;; A: (As $e $x)
;; B: (Goal $e $x)
(Implication (As $e $x) (Goal $e $x))

;; [role pair]  CoAgent ~ Location   n 16 / 210   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.02 (gate)   JSD: 0.967   shared clusters: 2 e.g. {Spain, Italy} {sidewalk, pedestrian}
;; A: (CoAgent $e $x)
;; B: (Location $e $x)
(Implication (CoAgent $e $x) (Location $e $x))

;; [role pair]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.02 (gate)   JSD: 0.977   shared clusters: 3 e.g. {Karen, Kalman, Kerr, Ken} {family, family business, families} {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Patient $e $x)
(Implication (CoAgent $e $x) (Patient $e $x))

;; [role pair]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.02 (gate)   JSD: 0.969   shared clusters: 3 e.g. {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
;; A: (In $e $x)
;; B: (Location $e $x)
(Implication (In $e $x) (Location $e $x))

;; [role pair]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 1 e.g. {road, way, lane, motorway, …}
;; A: (In $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (In $e $x))

;; [role pair]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Source $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Source $e $x))

;; [role pair]  For ~ Stimulus   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.02 (gate)   JSD: 0.973   shared clusters: 1 e.g. {start, begin}
;; A: (For $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (For $e $x))

;; [role pair]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.02 (gate)   JSD: 0.969   shared clusters: 4 e.g. {cake, pastry, pie, hot cake, …} {flag, philippine flag, inverted, philippine flag} {big, large, huge, massive, …}
;; A: (Experiencer $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Experiencer $e $x))

;; [role pair]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.02 (gate)   JSD: 0.979   shared clusters: 4 e.g. {imprison, inmate, jail, prison} {gold coin, gold, gold coins} {fire, flame, burn, scorch, …}
;; A: (Like $e $x)
;; B: (Theme $e $x)
(Implication (Like $e $x) (Theme $e $x))

;; [role pair]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.02 (gate)   JSD: 0.963   shared clusters: 7 e.g. {bus, bus ride} {cook, recipe} {ship, british ship, israeli military ship, merchant ship, …}
;; A: (Agent $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Agent $e $x))

;; [role pair]  Holder ~ Instrument   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Holder $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Holder $e $x))

;; [role pair]  Location ~ To   n 210 / 46   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.02 (gate)   JSD: 0.978   shared clusters: 2 e.g. {talk, conversation, discussion} {shore, beach, coast, shoreline}
;; A: (Location $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Location $e $x))

;; [role pair]  Like ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.02 (gate)   JSD: 0.976   shared clusters: 3 e.g. {fire, flame, burn, scorch, …} {big, large, huge, massive, …} {cake, pastry, pie, hot cake, …}
;; A: (Like $e $x)
;; B: (Patient $e $x)
(Implication (Like $e $x) (Patient $e $x))

;; [role pair]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.02 (gate)   JSD: 0.978   shared clusters: 1 e.g. {escape, exit}
;; A: (Before $e $x)
;; B: (Goal $e $x)
(Implication (Before $e $x) (Goal $e $x))

;; [role pair]  Like ~ Result   n 14 / 43   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.02 (gate)   JSD: 0.971   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Result $e $x)
(Implication (Like $e $x) (Result $e $x))

;; [role pair]  For ~ Holder   n 39 / 48   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.01 (gate)   JSD: 0.977   shared clusters: 1 e.g. {word, word processor}
;; A: (For $e $x)
;; B: (Holder $e $x)
(Implication (For $e $x) (Holder $e $x))

;; [role pair]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.01 (gate)   JSD: 0.971   shared clusters: 7 e.g. {ship, british ship, israeli military ship, merchant ship, …} {call, telephone call, call for} {word, word processor}
;; A: (For $e $x)
;; B: (Patient $e $x)
(Implication (For $e $x) (Patient $e $x))

;; [role pair]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.01 (gate)   JSD: 0.977   shared clusters: 1 e.g. {truth, fact, true, really, …}
;; A: (In $e $x)
;; B: (Manner $e $x)
(Implication (In $e $x) (Manner $e $x))

;; [role pair]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.97   shared clusters: 7 e.g. {night, tonight, night shift, midnight, …} {storm, soon, thunder} {hurricane, typhoon, hurricane season}
;; A: (Patient $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Patient $e $x))

;; [role pair]  For ~ In   n 39 / 50   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.01 (gate)   JSD: 0.977   shared clusters: 1 e.g. {nothing, no, almost nothing, empty, …}
;; A: (For $e $x)
;; B: (In $e $x)
(Implication (For $e $x) (In $e $x))

;; [role pair]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.977   shared clusters: 5 e.g. {now, today, this year, current, …} {hurricane, typhoon, hurricane season} {storm, soon, thunder}
;; A: (Agent $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Agent $e $x))

;; [role pair]  Like ~ Location   n 14 / 210   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.01 (gate)   JSD: 0.979   shared clusters: 2 e.g. {fire, flame, burn, scorch, …} {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Location $e $x)
(Implication (Like $e $x) (Location $e $x))

;; [role pair]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.01 (gate)   JSD: 0.984   shared clusters: 5 e.g. {use, well, direct, do, …} {quickly, quick, fast} {whole, full, entire, fully, …}
;; A: (Agent $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Agent $e $x))

;; [role pair]  In ~ To   n 50 / 46   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.01 (gate)   JSD: 0.981   shared clusters: 1 e.g. {action, activity, active, act, …}
;; A: (In $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (In $e $x))

;; [role pair]  As ~ Location   n 15 / 210   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.01 (gate)   JSD: 0.987   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Location $e $x)
(Implication (As $e $x) (Location $e $x))

;; [role pair]  Instrument ~ Like   n 34 / 14   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.978   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Instrument $e $x))

;; [role pair]  Like ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.01 (gate)   JSD: 0.976   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Recipient $e $x)
(Implication (Like $e $x) (Recipient $e $x))

;; [role pair]  Recipient ~ Result   n 29 / 43   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.01 (gate)   JSD: 0.98   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Recipient $e $x)
;; B: (Result $e $x)
(Implication (Recipient $e $x) (Result $e $x))

;; [role pair]  Like ~ Source   n 14 / 47   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.01 (gate)   JSD: 0.982   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Source $e $x)
(Implication (Like $e $x) (Source $e $x))

;; [role pair]  Instrument ~ To   n 34 / 46   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.01 (gate)   JSD: 0.983   shared clusters: 1 e.g. {ticket, issue, bug, tickets}
;; A: (Instrument $e $x)
;; B: (To $e $x)
(Implication (Instrument $e $x) (To $e $x))

;; [role pair]  Result ~ Time   n 43 / 107   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.968   shared clusters: 2 e.g. {modern times, modern} {former, back, early, backward, …}
;; A: (Result $e $x)
;; B: (Time $e $x)
(Implication (Result $e $x) (Time $e $x))

;; [role pair]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.01 (gate)   JSD: 0.981   shared clusters: 5 e.g. {community, society} {context, condition, situation} {road, way, lane, motorway, …}
;; A: (Agent $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Agent $e $x))

;; [role pair]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 2 e.g. {snow, cold, frost, snowstorm, …} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Location $e $x)
(Implication (Instrument $e $x) (Location $e $x))

;; [role pair]  Manner ~ Stimulus   n 115 / 34   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.01 (gate)   JSD: 0.985   shared clusters: 1 e.g. {difficult, hard, difficulty, harder}
;; A: (Manner $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Manner $e $x))

;; [role pair]  Holder ~ In   n 48 / 50   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 1 e.g. {weather, bad, weather}
;; A: (Holder $e $x)
;; B: (In $e $x)
(Implication (Holder $e $x) (In $e $x))

;; [role pair]  Manner ~ Source   n 115 / 47   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.01 (gate)   JSD: 0.981   shared clusters: 2 e.g. {dark, darkness, dimly} {world, international, global, internationally}
;; A: (Manner $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Manner $e $x))

;; [role pair]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.988   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Goal $e $x))

;; [role pair]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; cosine: 0.00 (gate)   JSD: 0.992   shared clusters: 2 e.g. {break out, bang, break, burst, …} {now, today, this year, current, …}
;; A: (Agent $e $x)
;; B: (Before $e $x)
(Implication (Before $e $x) (Agent $e $x))

;; [role pair]  Before ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.00 (gate)   JSD: 0.994   shared clusters: 1 e.g. {now, today, this year, current, …}
;; A: (Before $e $x)
;; B: (Experiencer $e $x)
(Implication (Before $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.986   shared clusters: 1 e.g. {former, back, early, backward, …}
;; A: (Goal $e $x)
;; B: (Time $e $x)
(Implication (Goal $e $x) (Time $e $x))

;; [role pair]  Location ~ Time   n 210 / 107   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.988   shared clusters: 2 e.g. {morning, dawn, early morning, morning light, …} {former, back, early, backward, …}
;; A: (Location $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Location $e $x))

;; [role pair]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.986   shared clusters: 1 e.g. {point, point out, indicate, mention}
;; A: (Source $e $x)
;; B: (Time $e $x)
(Implication (Source $e $x) (Time $e $x))

;; [role pair]  Holder ~ Time   n 48 / 107   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.99   shared clusters: 1 e.g. {old, aging, ages ago, elderly}
;; A: (Holder $e $x)
;; B: (Time $e $x)
(Implication (Holder $e $x) (Time $e $x))

;; [role pair]  Instrument ~ Time   n 34 / 107   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.988   shared clusters: 1 e.g. {present, presented}
;; A: (Instrument $e $x)
;; B: (Time $e $x)
(Implication (Instrument $e $x) (Time $e $x))

;; [role pair]  As ~ Before   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Before $e $x)
(Implication (As $e $x) (Before $e $x))

;; [role pair]  As ~ Beneficiary   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (As $e $x))

;; [role pair]  As ~ CoAgent   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (CoAgent $e $x)
(Implication (As $e $x) (CoAgent $e $x))

;; [role pair]  As ~ For   n 15 / 39   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (For $e $x)
(Implication (As $e $x) (For $e $x))

;; [role pair]  As ~ Holder   n 15 / 48   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Holder $e $x)
(Implication (As $e $x) (Holder $e $x))

;; [role pair]  As ~ In   n 15 / 50   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (In $e $x)
(Implication (As $e $x) (In $e $x))

;; [role pair]  As ~ Instrument   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Instrument $e $x)
(Implication (As $e $x) (Instrument $e $x))

;; [role pair]  As ~ Like   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (As $e $x))

;; [role pair]  As ~ Source   n 15 / 47   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Source $e $x)
(Implication (As $e $x) (Source $e $x))

;; [role pair]  As ~ Stimulus   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Stimulus $e $x)
(Implication (As $e $x) (Stimulus $e $x))

;; [role pair]  As ~ Time   n 15 / 107   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Time $e $x)
(Implication (As $e $x) (Time $e $x))

;; [role pair]  As ~ To   n 15 / 46   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (To $e $x)
(Implication (As $e $x) (To $e $x))

;; [role pair]  Before ~ Beneficiary   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Before $e $x))

;; [role pair]  Before ~ CoAgent   n 16 / 16   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Before $e $x))

;; [role pair]  Before ~ For   n 16 / 39   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (For $e $x)
(Implication (Before $e $x) (For $e $x))

;; [role pair]  Before ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Holder $e $x)
(Implication (Before $e $x) (Holder $e $x))

;; [role pair]  Before ~ In   n 16 / 50   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (In $e $x)
(Implication (Before $e $x) (In $e $x))

;; [role pair]  Before ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Instrument $e $x)
(Implication (Before $e $x) (Instrument $e $x))

;; [role pair]  Before ~ Like   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Before $e $x))

;; [role pair]  Before ~ Location   n 16 / 210   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Location $e $x)
(Implication (Before $e $x) (Location $e $x))

;; [role pair]  Before ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Manner $e $x)
(Implication (Before $e $x) (Manner $e $x))

;; [role pair]  Before ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Patient $e $x)
(Implication (Before $e $x) (Patient $e $x))

;; [role pair]  Before ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Recipient $e $x)
(Implication (Before $e $x) (Recipient $e $x))

;; [role pair]  Before ~ Result   n 16 / 43   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Result $e $x)
(Implication (Before $e $x) (Result $e $x))

;; [role pair]  Before ~ Source   n 16 / 47   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Source $e $x)
(Implication (Before $e $x) (Source $e $x))

;; [role pair]  Before ~ To   n 16 / 46   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (To $e $x)
(Implication (Before $e $x) (To $e $x))

;; [role pair]  Beneficiary ~ For   n 14 / 39   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (For $e $x)
(Implication (Beneficiary $e $x) (For $e $x))

;; [role pair]  Beneficiary ~ Holder   n 14 / 48   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Holder $e $x)
(Implication (Beneficiary $e $x) (Holder $e $x))

;; [role pair]  Beneficiary ~ In   n 14 / 50   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (In $e $x)
(Implication (Beneficiary $e $x) (In $e $x))

;; [role pair]  Beneficiary ~ Instrument   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Instrument $e $x)
(Implication (Beneficiary $e $x) (Instrument $e $x))

;; [role pair]  Beneficiary ~ Like   n 14 / 14   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Beneficiary $e $x))

;; [role pair]  Beneficiary ~ Location   n 14 / 210   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Location $e $x)
(Implication (Beneficiary $e $x) (Location $e $x))

;; [role pair]  Beneficiary ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Manner $e $x)
(Implication (Beneficiary $e $x) (Manner $e $x))

;; [role pair]  Beneficiary ~ Result   n 14 / 43   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Result $e $x)
(Implication (Beneficiary $e $x) (Result $e $x))

;; [role pair]  Beneficiary ~ Source   n 14 / 47   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Source $e $x)
(Implication (Beneficiary $e $x) (Source $e $x))

;; [role pair]  Beneficiary ~ Time   n 14 / 107   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Time $e $x)
(Implication (Beneficiary $e $x) (Time $e $x))

;; [role pair]  Beneficiary ~ To   n 14 / 46   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (To $e $x)
(Implication (Beneficiary $e $x) (To $e $x))

;; [role pair]  CoAgent ~ For   n 16 / 39   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (For $e $x)
(Implication (CoAgent $e $x) (For $e $x))

;; [role pair]  CoAgent ~ In   n 16 / 50   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (In $e $x)
(Implication (CoAgent $e $x) (In $e $x))

;; [role pair]  CoAgent ~ Like   n 16 / 14   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (CoAgent $e $x))

;; [role pair]  CoAgent ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Manner $e $x)
(Implication (CoAgent $e $x) (Manner $e $x))

;; [role pair]  CoAgent ~ Result   n 16 / 43   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Result $e $x)
(Implication (CoAgent $e $x) (Result $e $x))

;; [role pair]  CoAgent ~ Source   n 16 / 47   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Source $e $x)
(Implication (CoAgent $e $x) (Source $e $x))

;; [role pair]  CoAgent ~ Time   n 16 / 107   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Time $e $x)
(Implication (CoAgent $e $x) (Time $e $x))

;; [role pair]  CoAgent ~ To   n 16 / 46   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (To $e $x)
(Implication (CoAgent $e $x) (To $e $x))

;; [role pair]  For ~ Instrument   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (For $e $x))

;; [role pair]  For ~ Like   n 39 / 14   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (For $e $x))

;; [role pair]  For ~ Location   n 39 / 210   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Location $e $x)
(Implication (For $e $x) (Location $e $x))

;; [role pair]  For ~ Recipient   n 39 / 29   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (For $e $x))

;; [role pair]  For ~ Source   n 39 / 47   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Source $e $x)
(Implication (For $e $x) (Source $e $x))

;; [role pair]  For ~ Time   n 39 / 107   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Time $e $x)
(Implication (For $e $x) (Time $e $x))

;; [role pair]  For ~ To   n 39 / 46   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (To $e $x)
(Implication (For $e $x) (To $e $x))

;; [role pair]  Goal ~ To   n 93 / 46   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Goal $e $x))

;; [role pair]  Holder ~ Like   n 48 / 14   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Holder $e $x))

;; [role pair]  Holder ~ Manner   n 48 / 115   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Manner $e $x)
(Implication (Holder $e $x) (Manner $e $x))

;; [role pair]  In ~ Like   n 50 / 14   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (In $e $x))

;; [role pair]  In ~ Recipient   n 50 / 29   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (In $e $x))

;; [role pair]  In ~ Time   n 50 / 107   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Time $e $x)
(Implication (In $e $x) (Time $e $x))

;; [role pair]  Instrument ~ Manner   n 34 / 115   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (Manner $e $x)
(Implication (Instrument $e $x) (Manner $e $x))

;; [role pair]  Like ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Manner $e $x)
(Implication (Like $e $x) (Manner $e $x))

;; [role pair]  Like ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Stimulus $e $x)
(Implication (Like $e $x) (Stimulus $e $x))

;; [role pair]  Like ~ Time   n 14 / 107   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Time $e $x)
(Implication (Like $e $x) (Time $e $x))

;; [role pair]  Like ~ To   n 14 / 46   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (To $e $x)
(Implication (Like $e $x) (To $e $x))

;; [role pair]  Location ~ Stimulus   n 210 / 34   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Location $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Location $e $x))

;; [role pair]  Manner ~ Recipient   n 115 / 29   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Manner $e $x))

;; [role pair]  Manner ~ To   n 115 / 46   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Manner $e $x))

;; [role pair]  Recipient ~ Time   n 29 / 107   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (Time $e $x)
(Implication (Recipient $e $x) (Time $e $x))

;; [role pair]  Recipient ~ To   n 29 / 46   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (To $e $x)
(Implication (Recipient $e $x) (To $e $x))

;; [role pair]  Result ~ Stimulus   n 43 / 34   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Result $e $x))

;; [role pair]  Result ~ To   n 43 / 46   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (To $e $x)
(Implication (Result $e $x) (To $e $x))

;; [role pair]  Source ~ To   n 47 / 46   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Source $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Source $e $x))

;; [role pair]  Stimulus ~ Time   n 34 / 107   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Stimulus $e $x)
;; B: (Time $e $x)
(Implication (Stimulus $e $x) (Time $e $x))

;; [role pair]  Time ~ To   n 107 / 46   gate: FAIL
;; A fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Time $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Time $e $x))
