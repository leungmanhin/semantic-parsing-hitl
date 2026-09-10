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
;;   pooled floor    a head enters the pooled role level at n >= 14 embedded fillers
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
;;     the majority side (larger n; tie -> the alphabetically first name) is the canonical form; a pooled pair
;;     gives the role-vocabulary collapse (<minority role> -> <majority role>); a pair whose slots already share
;;     the head has no rule (the merge is done by construction) and says so; rendered for PASS and FAIL alike,
;;     the verdict is on the record; naming and direction provisional, the gauntlet decides
;; Pooled pairs: every head pair. Slot pairs: every pair with >= 2 shared clusters (the gate's first
;; condition); a pair sharing fewer clusters cannot pass and is not listed.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as (<Head> $x0 $x1)
;; (an entity centre carries no class link), a pooled role as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== POOLED ROLE LEVEL: 22 heads at n >= 14, 231 pairs, 0 pass the gate ====================
;; (the paper's 'Agent2 ~ Agent' reading: one head's fillers pooled over every predicate, against every other head's)

;; [pooled role]  Agent ~ Experiencer   n 888 / 261   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.65   shared clusters: 72 e.g. {person, people} {thing, things} {child, children, kid, kids}
;; A: (Agent $e $x)
;; B: (Experiencer $e $x)
(Implication (Experiencer $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.664   shared clusters: 96 e.g. {person, people} {thing, things} {door, door, open, door, unlocked}
;; A: (Experiencer $e $x)
;; B: (Patient $e $x)
(Implication (Experiencer $e $x) (Patient $e $x))

;; [pooled role]  Patient ~ Theme   n 455 / 594   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.746   shared clusters: 79 e.g. {thing, things} {person, people} {movie, film}
;; A: (Patient $e $x)
;; B: (Theme $e $x)
(Implication (Patient $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Patient   n 888 / 455   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.762   shared clusters: 72 e.g. {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (Agent $e $x)
;; B: (Patient $e $x)
(Implication (Patient $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.765   shared clusters: 81 e.g. {person, people} {thing, things} {company, corporation}
;; A: (Agent $e $x)
;; B: (Theme $e $x)
(Implication (Theme $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.776   shared clusters: 59 e.g. {thing, things} {person, people} {child, children, kid, kids}
;; A: (Experiencer $e $x)
;; B: (Theme $e $x)
(Implication (Experiencer $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.805   shared clusters: 13 e.g. {person, people} {company, corporation} {child, children, kid, kids}
;; A: (Agent $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.809   shared clusters: 16 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Boris, Ivan, Dmitri, Rasputin}
;; A: (Experiencer $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Experiencer $e $x))

;; [pooled role]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.812   shared clusters: 29 e.g. {bad, bad, matter, bad, problem} {black, white} {red}
;; A: (Experiencer $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Experiencer $e $x))

;; [pooled role]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.852   shared clusters: 14 e.g. {thing, things} {movie, film} {room, rooms}
;; A: (Holder $e $x)
;; B: (Patient $e $x)
(Implication (Holder $e $x) (Patient $e $x))

;; [pooled role]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.857   shared clusters: 17 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (Agent $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Agent $e $x))

;; [pooled role]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.857   shared clusters: 8 e.g. {town, towns} {here} {school, education}
;; A: (Goal $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Goal $e $x))

;; [pooled role]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.859   shared clusters: 13 e.g. {house, home, houses} {here} {Eskisehir, Giresun}
;; A: (Goal $e $x)
;; B: (Location $e $x)
(Implication (Goal $e $x) (Location $e $x))

;; [pooled role]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.86   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Recipient $e $x)
(Implication (Beneficiary $e $x) (Recipient $e $x))

;; [pooled role]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.866   shared clusters: 8 e.g. {person, people} {child, children, kid, kids} {man, guy}
;; A: (Experiencer $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Experiencer $e $x))

;; [pooled role]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.867   shared clusters: 16 e.g. {thing, things} {house, home, houses} {food, eat}
;; A: (Holder $e $x)
;; B: (Theme $e $x)
(Implication (Holder $e $x) (Theme $e $x))

;; [pooled role]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.878   shared clusters: 28 e.g. {bad, bad, matter, bad, problem} {black, white} {red}
;; A: (Patient $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Patient $e $x))

;; [pooled role]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.881   shared clusters: 8 e.g. {thing, things} {child, children, kid, kids} {food, eat}
;; A: (Stimulus $e $x)
;; B: (Theme $e $x)
(Implication (Stimulus $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; JSD: 0.886   shared clusters: 5 e.g. {person, people} {child, children, kid, kids} {Olivia, Sophia}
;; A: (Agent $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Agent $e $x))

;; [pooled role]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.89   shared clusters: 4 e.g. {town, towns} {room, rooms} {place, places}
;; A: (Holder $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Holder $e $x))

;; [pooled role]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.89   shared clusters: 9 e.g. {here} {town, towns} {place, places}
;; A: (Location $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Location $e $x))

;; [pooled role]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.891   shared clusters: 5 e.g. {house, home, houses} {town, towns} {place, places}
;; A: (Goal $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Goal $e $x))

;; [pooled role]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.892   shared clusters: 1 e.g. {now, today, current}
;; A: (Before $e $x)
;; B: (Time $e $x)
(Implication (Before $e $x) (Time $e $x))

;; [pooled role]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.892   shared clusters: 3 e.g. {thing, things} {author, writer, novelist} {food, eat}
;; A: (Holder $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Holder $e $x))

;; [pooled role]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.895   shared clusters: 5 e.g. {well, on, there, be} {direct, straight, directly} {together, come together}
;; A: (Manner $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Manner $e $x))

;; [pooled role]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.896   shared clusters: 17 e.g. {tree, trees} {house, home, houses} {room, rooms}
;; A: (Goal $e $x)
;; B: (Patient $e $x)
(Implication (Goal $e $x) (Patient $e $x))

;; [pooled role]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.9   shared clusters: 26 e.g. {door, door, open, door, unlocked} {table} {hotel}
;; A: (Location $e $x)
;; B: (Patient $e $x)
(Implication (Location $e $x) (Patient $e $x))

;; [pooled role]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.905   shared clusters: 15 e.g. {house, home, houses} {place, places} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (Experiencer $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Experiencer $e $x))

;; [pooled role]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.907   shared clusters: 4 e.g. {thing, things} {practice} {action, act, actions}
;; A: (Stimulus $e $x)
;; B: (To $e $x)
(Implication (Stimulus $e $x) (To $e $x))

;; [pooled role]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.908   shared clusters: 12 e.g. {thing, things} {talk, conversation, discussion} {music}
;; A: (Theme $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.91   shared clusters: 6 e.g. {thing, things} {child, children, kid, kids} {Jessica, Beth}
;; A: (Agent $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Agent $e $x))

;; [pooled role]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.912   shared clusters: 9 e.g. {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
;; A: (Recipient $e $x)
;; B: (Theme $e $x)
(Implication (Recipient $e $x) (Theme $e $x))

;; [pooled role]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.913   shared clusters: 19 e.g. {Europe, Western Europe} {house, home, houses} {place, places}
;; A: (Experiencer $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Experiencer $e $x))

;; [pooled role]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.914   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Experiencer $e $x)
(Implication (Beneficiary $e $x) (Experiencer $e $x))

;; [pooled role]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.914   shared clusters: 1 e.g. {Karen, Ken}
;; A: (CoAgent $e $x)
;; B: (Holder $e $x)
(Implication (CoAgent $e $x) (Holder $e $x))

;; [pooled role]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.918   shared clusters: 5 e.g. {thing, things} {child, children, kid, kids} {knock}
;; A: (Patient $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Patient $e $x))

;; [pooled role]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.921   shared clusters: 4 e.g. {thing, things} {child, children, kid, kids} {difficult, hard, difficulty, harder}
;; A: (Experiencer $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Experiencer $e $x))

;; [pooled role]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.921   shared clusters: 6 e.g. {person, people} {child, children, kid, kids} {big, large, huge, massive, …}
;; A: (Patient $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Patient $e $x))

;; [pooled role]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.925   shared clusters: 24 e.g. {house, home, houses} {Santiago, Havana} {Gareccio, Bologna}
;; A: (Location $e $x)
;; B: (Theme $e $x)
(Implication (Location $e $x) (Theme $e $x))

;; [pooled role]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.927   shared clusters: 6 e.g. {town, towns} {house, home, houses} {place, places}
;; A: (Holder $e $x)
;; B: (Location $e $x)
(Implication (Holder $e $x) (Location $e $x))

;; [pooled role]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.927   shared clusters: 13 e.g. {view, views, common, view, public, view, …} {food, eat} {room, rooms}
;; A: (Source $e $x)
;; B: (Theme $e $x)
(Implication (Source $e $x) (Theme $e $x))

;; [pooled role]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.928   shared clusters: 4 e.g. {late, later, last} {immediately, instantly, right away} {back, backward, before, past}
;; A: (Manner $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Manner $e $x))

;; [pooled role]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.93   shared clusters: 9 e.g. {tree, trees} {room, rooms} {cookie, cookie jar, cookies}
;; A: (Patient $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Patient $e $x))

;; [pooled role]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.933   shared clusters: 15 e.g. {house, home, houses} {Baltimore, Boston, Springfield} {room, rooms}
;; A: (Goal $e $x)
;; B: (Theme $e $x)
(Implication (Goal $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.94   shared clusters: 7 e.g. {thing, things} {doctor, doctors} {George Allen, James David Edgar, Chuck Robb}
;; A: (Agent $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Agent $e $x))

;; [pooled role]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.94   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Patient $e $x)
(Implication (Beneficiary $e $x) (Patient $e $x))

;; [pooled role]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.942   shared clusters: 15 e.g. {Linda, Amanda, Loren, Dora Smith, …} {house, home, houses} {school, education}
;; A: (Agent $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Agent $e $x))

;; [pooled role]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.942   shared clusters: 2 e.g. {thing, things} {repeat, repetition}
;; A: (Holder $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Holder $e $x))

;; [pooled role]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 0.944   shared clusters: 6 e.g. {family, families} {Linda, Amanda, Loren, Dora Smith, …} {cat, cats}
;; A: (Agent $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Agent $e $x))

;; [pooled role]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.944   shared clusters: 7 e.g. {work, job} {portray, portrait, portrayal} {word, word processor}
;; A: (For $e $x)
;; B: (Theme $e $x)
(Implication (For $e $x) (Theme $e $x))

;; [pooled role]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.946   shared clusters: 9 e.g. {place, places} {room, rooms} {school, education}
;; A: (Experiencer $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Experiencer $e $x))

;; [pooled role]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.948   shared clusters: 4 e.g. {dead, die, death, die down, …} {well, on, there, be} {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Goal $e $x))

;; [pooled role]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.949   shared clusters: 7 e.g. {snow, snowstorm, deep, snow} {road, motorway, roads} {blood}
;; A: (Instrument $e $x)
;; B: (Patient $e $x)
(Implication (Instrument $e $x) (Patient $e $x))

;; [pooled role]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.95   shared clusters: 2 e.g. {food, eat} {crash}
;; A: (Instrument $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Instrument $e $x))

;; [pooled role]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.95   shared clusters: 4 e.g. {thing, things} {bake, bakery, bread} {woman, lady, female, women}
;; A: (Patient $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Patient $e $x))

;; [pooled role]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.951   shared clusters: 9 e.g. {well, on, there, be} {direct, straight, directly} {late, later, last}
;; A: (Experiencer $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Experiencer $e $x))

;; [pooled role]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.951   shared clusters: 3 e.g. {thing, things} {George Allen, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Experiencer $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Experiencer $e $x))

;; [pooled role]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.951   shared clusters: 2 e.g. {bed} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Goal $e $x)
(Implication (For $e $x) (Goal $e $x))

;; [pooled role]  Recipient ~ Source   n 29 / 47   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.951   shared clusters: 3 e.g. {company, corporation} {local, locals} {big, large, huge, massive, …}
;; A: (Recipient $e $x)
;; B: (Source $e $x)
(Implication (Recipient $e $x) (Source $e $x))

;; [pooled role]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.952   shared clusters: 2 e.g. {crop, rice crop, corn, crops} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Instrument $e $x))

;; [pooled role]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.953   shared clusters: 1 e.g. {direct, straight, directly}
;; A: (As $e $x)
;; B: (Manner $e $x)
(Implication (As $e $x) (Manner $e $x))

;; [pooled role]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.953   shared clusters: 2 e.g. {action, act, actions} {poetry}
;; A: (In $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (In $e $x))

;; [pooled role]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.954   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Theme $e $x)
(Implication (Beneficiary $e $x) (Theme $e $x))

;; [pooled role]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.954   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Recipient $e $x)
(Implication (CoAgent $e $x) (Recipient $e $x))

;; [pooled role]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.956   shared clusters: 17 e.g. {Santiago, Havana} {house, home, houses} {sun, sunlight, direct sun}
;; A: (Agent $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Agent $e $x))

;; [pooled role]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.956   shared clusters: 1 e.g. {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Stimulus $e $x)
(Implication (Beneficiary $e $x) (Stimulus $e $x))

;; [pooled role]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.957   shared clusters: 1 e.g. {child, children, kid, kids}
;; A: (Recipient $e $x)
;; B: (Stimulus $e $x)
(Implication (Recipient $e $x) (Stimulus $e $x))

;; [pooled role]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.96   shared clusters: 3 e.g. {well, on, there, be} {happiness, happy, happily, joy} {back, backward, before, past}
;; A: (Goal $e $x)
;; B: (Manner $e $x)
(Implication (Goal $e $x) (Manner $e $x))

;; [pooled role]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; JSD: 0.961   shared clusters: 5 e.g. {Jason Suecof, Nick De Caro, Robert Day, Matt Brown, …} {girl, girls} {Peter}
;; A: (Agent $e $x)
;; B: (As $e $x)
(Implication (As $e $x) (Agent $e $x))

;; [pooled role]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.963   shared clusters: 1 e.g. {direct, straight, directly}
;; A: (As $e $x)
;; B: (Result $e $x)
(Implication (As $e $x) (Result $e $x))

;; [pooled role]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.963   shared clusters: 2 e.g. {food, eat} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Source $e $x)
(Implication (Instrument $e $x) (Source $e $x))

;; [pooled role]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.963   shared clusters: 2 e.g. {bat} {big, large, huge, massive, …}
;; A: (Result $e $x)
;; B: (Source $e $x)
(Implication (Result $e $x) (Source $e $x))

;; [pooled role]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.964   shared clusters: 2 e.g. {Linda, Amanda, Loren, Dora Smith, …} {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Goal $e $x))

;; [pooled role]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 0.965   shared clusters: 4 e.g. {train} {road, motorway, roads} {crop, rice crop, corn, crops}
;; A: (Experiencer $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Experiencer $e $x))

;; [pooled role]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.965   shared clusters: 3 e.g. {city, cities} {little, small, minor} {big, large, huge, massive, …}
;; A: (Location $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Location $e $x))

;; [pooled role]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.965   shared clusters: 8 e.g. {sleep} {king, queen, kings} {big, large, huge, massive, …}
;; A: (Result $e $x)
;; B: (Theme $e $x)
(Implication (Result $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 0.966   shared clusters: 6 e.g. {bus, bus ride} {cook} {ship, merchant ship, modern ship}
;; A: (Agent $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Agent $e $x))

;; [pooled role]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.966   shared clusters: 2 e.g. {cat, cats} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Experiencer $e $x)
(Implication (CoAgent $e $x) (Experiencer $e $x))

;; [pooled role]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.966   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Goal $e $x)
(Implication (CoAgent $e $x) (Goal $e $x))

;; [pooled role]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 0.966   shared clusters: 3 e.g. {snow, snowstorm, deep, snow} {big, large, huge, massive, …} {new, brand new, new, product}
;; A: (Goal $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Goal $e $x))

;; [pooled role]  Experiencer ~ Time   n 261 / 107   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.968   shared clusters: 5 e.g. {night, tonight, midnight} {late, later, last} {modern times, modern}
;; A: (Experiencer $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Experiencer $e $x))

;; [pooled role]  Result ~ Time   n 43 / 107   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.968   shared clusters: 2 e.g. {modern times, modern} {back, backward, before, past}
;; A: (Result $e $x)
;; B: (Time $e $x)
(Implication (Result $e $x) (Time $e $x))

;; [pooled role]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 0.969   shared clusters: 2 e.g. {way, ways} {field, fields}
;; A: (Goal $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Goal $e $x))

;; [pooled role]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.969   shared clusters: 3 e.g. {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
;; A: (In $e $x)
;; B: (Location $e $x)
(Implication (In $e $x) (Location $e $x))

;; [pooled role]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.969   shared clusters: 6 e.g. {language, english} {understand, misunderstand} {way, ways}
;; A: (In $e $x)
;; B: (Theme $e $x)
(Implication (In $e $x) (Theme $e $x))

;; [pooled role]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.969   shared clusters: 4 e.g. {food, eat} {drum, snare, drums} {new, brand new, new, product}
;; A: (Instrument $e $x)
;; B: (Theme $e $x)
(Implication (Instrument $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.97   shared clusters: 3 e.g. {company, corporation} {plane, flight, aeroplane, airplane, …} {school, education}
;; A: (Agent $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Agent $e $x))

;; [pooled role]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.97   shared clusters: 1 e.g. {silent, silence}
;; A: (In $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (In $e $x))

;; [pooled role]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.971   shared clusters: 7 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {crow, caw} {red}
;; A: (Agent $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 0.971   shared clusters: 3 e.g. {word, word processor} {happiness, happy, happily, joy} {general, general purpose}
;; A: (Experiencer $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Experiencer $e $x))

;; [pooled role]  Like ~ Result   n 14 / 43   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.971   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Result $e $x)
(Implication (Like $e $x) (Result $e $x))

;; [pooled role]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.972   shared clusters: 5 e.g. {weather} {field, fields} {language, english}
;; A: (In $e $x)
;; B: (Patient $e $x)
(Implication (In $e $x) (Patient $e $x))

;; [pooled role]  For ~ Stimulus   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.973   shared clusters: 1 e.g. {start, begin}
;; A: (For $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (For $e $x))

;; [pooled role]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.975   shared clusters: 3 e.g. {caretaker, keeper} {girl, girls} {direct, straight, directly}
;; A: (As $e $x)
;; B: (Experiencer $e $x)
(Implication (As $e $x) (Experiencer $e $x))

;; [pooled role]  Holder ~ Instrument   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Holder $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Holder $e $x))

;; [pooled role]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.975   shared clusters: 1 e.g. {way, ways}
;; A: (In $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (In $e $x))

;; [pooled role]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Source $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Source $e $x))

;; [pooled role]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 0.976   shared clusters: 3 e.g. {weather} {silent, silence} {nothing, no, empty, zero, …}
;; A: (Experiencer $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Experiencer $e $x))

;; [pooled role]  Holder ~ Result   n 48 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.976   shared clusters: 1 e.g. {bad, bad, matter, bad, problem}
;; A: (Holder $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Holder $e $x))

;; [pooled role]  Like ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 0.976   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Recipient $e $x)
(Implication (Like $e $x) (Recipient $e $x))

;; [pooled role]  For ~ Holder   n 39 / 48   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.977   shared clusters: 1 e.g. {word, word processor}
;; A: (For $e $x)
;; B: (Holder $e $x)
(Implication (For $e $x) (Holder $e $x))

;; [pooled role]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.977   shared clusters: 1 e.g. {really, real, reality, actual, …}
;; A: (In $e $x)
;; B: (Manner $e $x)
(Implication (In $e $x) (Manner $e $x))

;; [pooled role]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.978   shared clusters: 1 e.g. {escape, exit}
;; A: (Before $e $x)
;; B: (Goal $e $x)
(Implication (Before $e $x) (Goal $e $x))

;; [pooled role]  Instrument ~ Like   n 34 / 14   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 0.978   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Instrument $e $x))

;; [pooled role]  Location ~ To   n 210 / 46   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.978   shared clusters: 2 e.g. {talk, conversation, discussion} {shore, coast, shoreline}
;; A: (Location $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Location $e $x))

;; [pooled role]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.978   shared clusters: 6 e.g. {full, fully, full fledged, complete, …} {really, real, reality, actual, …} {widespread, widely, wide, attention, widespread, …}
;; A: (Manner $e $x)
;; B: (Theme $e $x)
(Implication (Manner $e $x) (Theme $e $x))

;; [pooled role]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.979   shared clusters: 2 e.g. {Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Theme $e $x)
(Implication (CoAgent $e $x) (Theme $e $x))

;; [pooled role]  Manner ~ Patient   n 115 / 455   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.979   shared clusters: 4 e.g. {well, on, there, be} {direct, straight, directly} {together, come together}
;; A: (Manner $e $x)
;; B: (Patient $e $x)
(Implication (Manner $e $x) (Patient $e $x))

;; [pooled role]  Recipient ~ Result   n 29 / 43   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.98   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Recipient $e $x)
;; B: (Result $e $x)
(Implication (Recipient $e $x) (Result $e $x))

;; [pooled role]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 0.981   shared clusters: 5 e.g. {train} {plant, plants} {snow, snowstorm, deep, snow}
;; A: (Agent $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Agent $e $x))

;; [pooled role]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.981   shared clusters: 2 e.g. {name} {girl, girls}
;; A: (As $e $x)
;; B: (Theme $e $x)
(Implication (As $e $x) (Theme $e $x))

;; [pooled role]  In ~ To   n 50 / 46   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.981   shared clusters: 1 e.g. {action, act, actions}
;; A: (In $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (In $e $x))

;; [pooled role]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.981   shared clusters: 4 e.g. {now, today, current} {morning, early morning, this morning} {day, days, days, short}
;; A: (Theme $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Theme $e $x))

;; [pooled role]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.982   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Result $e $x)
(Implication (Instrument $e $x) (Result $e $x))

;; [pooled role]  Like ~ Source   n 14 / 47   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.982   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Source $e $x)
(Implication (Like $e $x) (Source $e $x))

;; [pooled role]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 0.982   shared clusters: 2 e.g. {big, large, huge, massive, …} {well, on, there, be}
;; A: (Location $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Location $e $x))

;; [pooled role]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.983   shared clusters: 4 e.g. {word, word processor} {call, telephone call} {dance}
;; A: (For $e $x)
;; B: (Patient $e $x)
(Implication (For $e $x) (Patient $e $x))

;; [pooled role]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.983   shared clusters: 3 e.g. {imprison, jail, prison} {gold coin, gold, gold coins} {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Theme $e $x)
(Implication (Like $e $x) (Theme $e $x))

;; [pooled role]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.983   shared clusters: 4 e.g. {night, tonight, midnight} {summer, this summer} {hour, hours}
;; A: (Patient $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Patient $e $x))

;; [pooled role]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.984   shared clusters: 2 e.g. {well, on, there, be} {early}
;; A: (Location $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Location $e $x))

;; [pooled role]  Manner ~ Stimulus   n 115 / 34   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 0.985   shared clusters: 1 e.g. {difficult, hard, difficulty, harder}
;; A: (Manner $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Manner $e $x))

;; [pooled role]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 3 e.g. {now, today, current} {hurricane, hurricane season} {spring}
;; A: (Agent $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Agent $e $x))

;; [pooled role]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.986   shared clusters: 2 e.g. {name} {direct, straight, directly}
;; A: (As $e $x)
;; B: (Patient $e $x)
(Implication (As $e $x) (Patient $e $x))

;; [pooled role]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.986   shared clusters: 1 e.g. {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Manner $e $x)
(Implication (For $e $x) (Manner $e $x))

;; [pooled role]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {back, backward, before, past}
;; A: (Goal $e $x)
;; B: (Time $e $x)
(Implication (Goal $e $x) (Time $e $x))

;; [pooled role]  Holder ~ In   n 48 / 50   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 0.986   shared clusters: 1 e.g. {weather}
;; A: (Holder $e $x)
;; B: (In $e $x)
(Implication (Holder $e $x) (In $e $x))

;; [pooled role]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.986   shared clusters: 2 e.g. {snow, snowstorm, deep, snow} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Location $e $x)
(Implication (Instrument $e $x) (Location $e $x))

;; [pooled role]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {point, point out}
;; A: (Source $e $x)
;; B: (Time $e $x)
(Implication (Source $e $x) (Time $e $x))

;; [pooled role]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 0.988   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Goal $e $x))

;; [pooled role]  Instrument ~ Time   n 34 / 107   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.988   shared clusters: 1 e.g. {present, presented}
;; A: (Instrument $e $x)
;; B: (Time $e $x)
(Implication (Instrument $e $x) (Time $e $x))

;; [pooled role]  As ~ Goal   n 15 / 93   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 0.989   shared clusters: 1 e.g. {potential, possibility}
;; A: (As $e $x)
;; B: (Goal $e $x)
(Implication (As $e $x) (Goal $e $x))

;; [pooled role]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; JSD: 0.989   shared clusters: 2 e.g. {now, today, current} {repair, repairs}
;; A: (Before $e $x)
;; B: (Theme $e $x)
(Implication (Before $e $x) (Theme $e $x))

;; [pooled role]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 0.989   shared clusters: 2 e.g. {spider, huge, spider, spiders} {big, large, huge, massive, …}
;; A: (Experiencer $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Experiencer $e $x))

;; [pooled role]  Like ~ Location   n 14 / 210   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.989   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Location $e $x)
(Implication (Like $e $x) (Location $e $x))

;; [pooled role]  Manner ~ Source   n 115 / 47   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 0.99   shared clusters: 1 e.g. {international, internationally}
;; A: (Manner $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Manner $e $x))

;; [pooled role]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 0.992   shared clusters: 2 e.g. {centipede, centipedes, pillar} {flame, flames}
;; A: (Agent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Agent $e $x))

;; [pooled role]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.992   shared clusters: 1 e.g. {family, families}
;; A: (CoAgent $e $x)
;; B: (Patient $e $x)
(Implication (CoAgent $e $x) (Patient $e $x))

;; [pooled role]  Like ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 0.992   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Patient $e $x)
(Implication (Like $e $x) (Patient $e $x))

;; [pooled role]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 0.994   shared clusters: 2 e.g. {really, real, reality, actual, …} {context}
;; A: (Agent $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.995   shared clusters: 2 e.g. {quickly, quick, fast} {really, real, reality, actual, …}
;; A: (Agent $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 0.996   shared clusters: 1 e.g. {now, today, current}
;; A: (Agent $e $x)
;; B: (Before $e $x)
(Implication (Before $e $x) (Agent $e $x))

;; [pooled role]  As ~ Before   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Before $e $x)
(Implication (As $e $x) (Before $e $x))

;; [pooled role]  As ~ Beneficiary   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (As $e $x))

;; [pooled role]  As ~ CoAgent   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (CoAgent $e $x)
(Implication (As $e $x) (CoAgent $e $x))

;; [pooled role]  As ~ For   n 15 / 39   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (For $e $x)
(Implication (As $e $x) (For $e $x))

;; [pooled role]  As ~ Holder   n 15 / 48   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Holder $e $x)
(Implication (As $e $x) (Holder $e $x))

;; [pooled role]  As ~ In   n 15 / 50   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (In $e $x)
(Implication (As $e $x) (In $e $x))

;; [pooled role]  As ~ Instrument   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Instrument $e $x)
(Implication (As $e $x) (Instrument $e $x))

;; [pooled role]  As ~ Like   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (As $e $x))

;; [pooled role]  As ~ Location   n 15 / 210   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Location $e $x)
(Implication (As $e $x) (Location $e $x))

;; [pooled role]  As ~ Recipient   n 15 / 29   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Recipient $e $x)
(Implication (As $e $x) (Recipient $e $x))

;; [pooled role]  As ~ Source   n 15 / 47   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Source $e $x)
(Implication (As $e $x) (Source $e $x))

;; [pooled role]  As ~ Stimulus   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Stimulus $e $x)
(Implication (As $e $x) (Stimulus $e $x))

;; [pooled role]  As ~ Time   n 15 / 107   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Time $e $x)
(Implication (As $e $x) (Time $e $x))

;; [pooled role]  As ~ To   n 15 / 46   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (To $e $x)
(Implication (As $e $x) (To $e $x))

;; [pooled role]  Before ~ Beneficiary   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Before $e $x))

;; [pooled role]  Before ~ CoAgent   n 16 / 16   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Before $e $x))

;; [pooled role]  Before ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Experiencer $e $x)
(Implication (Before $e $x) (Experiencer $e $x))

;; [pooled role]  Before ~ For   n 16 / 39   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (For $e $x)
(Implication (Before $e $x) (For $e $x))

;; [pooled role]  Before ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Holder $e $x)
(Implication (Before $e $x) (Holder $e $x))

;; [pooled role]  Before ~ In   n 16 / 50   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (In $e $x)
(Implication (Before $e $x) (In $e $x))

;; [pooled role]  Before ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Instrument $e $x)
(Implication (Before $e $x) (Instrument $e $x))

;; [pooled role]  Before ~ Like   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Before $e $x))

;; [pooled role]  Before ~ Location   n 16 / 210   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Location $e $x)
(Implication (Before $e $x) (Location $e $x))

;; [pooled role]  Before ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Manner $e $x)
(Implication (Before $e $x) (Manner $e $x))

;; [pooled role]  Before ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Patient $e $x)
(Implication (Before $e $x) (Patient $e $x))

;; [pooled role]  Before ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Recipient $e $x)
(Implication (Before $e $x) (Recipient $e $x))

;; [pooled role]  Before ~ Result   n 16 / 43   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Result $e $x)
(Implication (Before $e $x) (Result $e $x))

;; [pooled role]  Before ~ Source   n 16 / 47   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Source $e $x)
(Implication (Before $e $x) (Source $e $x))

;; [pooled role]  Before ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Stimulus $e $x)
(Implication (Before $e $x) (Stimulus $e $x))

;; [pooled role]  Before ~ To   n 16 / 46   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (To $e $x)
(Implication (Before $e $x) (To $e $x))

;; [pooled role]  Beneficiary ~ CoAgent   n 14 / 16   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (CoAgent $e $x)
(Implication (Beneficiary $e $x) (CoAgent $e $x))

;; [pooled role]  Beneficiary ~ For   n 14 / 39   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (For $e $x)
(Implication (Beneficiary $e $x) (For $e $x))

;; [pooled role]  Beneficiary ~ Goal   n 14 / 93   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Goal $e $x)
(Implication (Beneficiary $e $x) (Goal $e $x))

;; [pooled role]  Beneficiary ~ Holder   n 14 / 48   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Holder $e $x)
(Implication (Beneficiary $e $x) (Holder $e $x))

;; [pooled role]  Beneficiary ~ In   n 14 / 50   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (In $e $x)
(Implication (Beneficiary $e $x) (In $e $x))

;; [pooled role]  Beneficiary ~ Instrument   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Instrument $e $x)
(Implication (Beneficiary $e $x) (Instrument $e $x))

;; [pooled role]  Beneficiary ~ Like   n 14 / 14   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Beneficiary $e $x))

;; [pooled role]  Beneficiary ~ Location   n 14 / 210   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Location $e $x)
(Implication (Beneficiary $e $x) (Location $e $x))

;; [pooled role]  Beneficiary ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Manner $e $x)
(Implication (Beneficiary $e $x) (Manner $e $x))

;; [pooled role]  Beneficiary ~ Result   n 14 / 43   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Result $e $x)
(Implication (Beneficiary $e $x) (Result $e $x))

;; [pooled role]  Beneficiary ~ Source   n 14 / 47   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Source $e $x)
(Implication (Beneficiary $e $x) (Source $e $x))

;; [pooled role]  Beneficiary ~ Time   n 14 / 107   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Time $e $x)
(Implication (Beneficiary $e $x) (Time $e $x))

;; [pooled role]  Beneficiary ~ To   n 14 / 46   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (To $e $x)
(Implication (Beneficiary $e $x) (To $e $x))

;; [pooled role]  CoAgent ~ For   n 16 / 39   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (For $e $x)
(Implication (CoAgent $e $x) (For $e $x))

;; [pooled role]  CoAgent ~ In   n 16 / 50   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (In $e $x)
(Implication (CoAgent $e $x) (In $e $x))

;; [pooled role]  CoAgent ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Instrument $e $x)
(Implication (CoAgent $e $x) (Instrument $e $x))

;; [pooled role]  CoAgent ~ Like   n 16 / 14   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (CoAgent $e $x))

;; [pooled role]  CoAgent ~ Location   n 16 / 210   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Location $e $x)
(Implication (CoAgent $e $x) (Location $e $x))

;; [pooled role]  CoAgent ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Manner $e $x)
(Implication (CoAgent $e $x) (Manner $e $x))

;; [pooled role]  CoAgent ~ Result   n 16 / 43   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Result $e $x)
(Implication (CoAgent $e $x) (Result $e $x))

;; [pooled role]  CoAgent ~ Source   n 16 / 47   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Source $e $x)
(Implication (CoAgent $e $x) (Source $e $x))

;; [pooled role]  CoAgent ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Stimulus $e $x)
(Implication (CoAgent $e $x) (Stimulus $e $x))

;; [pooled role]  CoAgent ~ Time   n 16 / 107   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Time $e $x)
(Implication (CoAgent $e $x) (Time $e $x))

;; [pooled role]  CoAgent ~ To   n 16 / 46   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (To $e $x)
(Implication (CoAgent $e $x) (To $e $x))

;; [pooled role]  For ~ In   n 39 / 50   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (In $e $x)
(Implication (For $e $x) (In $e $x))

;; [pooled role]  For ~ Instrument   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (For $e $x))

;; [pooled role]  For ~ Like   n 39 / 14   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (For $e $x))

;; [pooled role]  For ~ Location   n 39 / 210   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Location $e $x)
(Implication (For $e $x) (Location $e $x))

;; [pooled role]  For ~ Recipient   n 39 / 29   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (For $e $x))

;; [pooled role]  For ~ Result   n 39 / 43   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Result $e $x)
(Implication (For $e $x) (Result $e $x))

;; [pooled role]  For ~ Source   n 39 / 47   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Source $e $x)
(Implication (For $e $x) (Source $e $x))

;; [pooled role]  For ~ Time   n 39 / 107   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Time $e $x)
(Implication (For $e $x) (Time $e $x))

;; [pooled role]  For ~ To   n 39 / 46   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (To $e $x)
(Implication (For $e $x) (To $e $x))

;; [pooled role]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Goal $e $x))

;; [pooled role]  Goal ~ To   n 93 / 46   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Goal $e $x))

;; [pooled role]  Holder ~ Like   n 48 / 14   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Holder $e $x))

;; [pooled role]  Holder ~ Manner   n 48 / 115   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Manner $e $x)
(Implication (Holder $e $x) (Manner $e $x))

;; [pooled role]  Holder ~ Recipient   n 48 / 29   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Holder $e $x))

;; [pooled role]  Holder ~ Time   n 48 / 107   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Time $e $x)
(Implication (Holder $e $x) (Time $e $x))

;; [pooled role]  In ~ Instrument   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (In $e $x))

;; [pooled role]  In ~ Like   n 50 / 14   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (In $e $x))

;; [pooled role]  In ~ Recipient   n 50 / 29   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (In $e $x))

;; [pooled role]  In ~ Time   n 50 / 107   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Time $e $x)
(Implication (In $e $x) (Time $e $x))

;; [pooled role]  Instrument ~ Manner   n 34 / 115   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (Manner $e $x)
(Implication (Instrument $e $x) (Manner $e $x))

;; [pooled role]  Instrument ~ To   n 34 / 46   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (To $e $x)
(Implication (Instrument $e $x) (To $e $x))

;; [pooled role]  Like ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Manner $e $x)
(Implication (Like $e $x) (Manner $e $x))

;; [pooled role]  Like ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Stimulus $e $x)
(Implication (Like $e $x) (Stimulus $e $x))

;; [pooled role]  Like ~ Time   n 14 / 107   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Time $e $x)
(Implication (Like $e $x) (Time $e $x))

;; [pooled role]  Like ~ To   n 14 / 46   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (To $e $x)
(Implication (Like $e $x) (To $e $x))

;; [pooled role]  Location ~ Stimulus   n 210 / 34   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (Location $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Location $e $x))

;; [pooled role]  Location ~ Time   n 210 / 107   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Location $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Location $e $x))

;; [pooled role]  Manner ~ Recipient   n 115 / 29   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Manner $e $x))

;; [pooled role]  Manner ~ To   n 115 / 46   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Manner $e $x))

;; [pooled role]  Recipient ~ Time   n 29 / 107   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (Time $e $x)
(Implication (Recipient $e $x) (Time $e $x))

;; [pooled role]  Recipient ~ To   n 29 / 46   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (To $e $x)
(Implication (Recipient $e $x) (To $e $x))

;; [pooled role]  Result ~ Stimulus   n 43 / 34   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Result $e $x))

;; [pooled role]  Result ~ To   n 43 / 46   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (To $e $x)
(Implication (Result $e $x) (To $e $x))

;; [pooled role]  Source ~ To   n 47 / 46   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Source $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Source $e $x))

;; [pooled role]  Stimulus ~ Time   n 34 / 107   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Stimulus $e $x)
;; B: (Time $e $x)
(Implication (Stimulus $e $x) (Time $e $x))

;; [pooled role]  Time ~ To   n 107 / 46   gate: FAIL
;; A fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Time $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Time $e $x))

;; ==================== SLOT PAIRS: 3 pass the gate (event 3, entity 0); 110 pairs listed = every pair with >= 2 shared clusters (event 108, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's 'go to.Agent' reading: one (class, role) slot against every other slot of its centre kind)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×3, family   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 sleep) (Agent $e0 $x1))
(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (And (Member $e0 sleep) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 spend) (Agent $e0 $x1)) (And (Member $e0 spend) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (And (Member $e0 die) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (And (Member $e0 stop) (Experiencer $e0 $x1)))

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.557   shared clusters: 2 e.g. {Oleg, Vladimir} {William, James}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (And (Member $e0 give) (Experiencer $e0 $x1)))

;; [different class and role]  eat.Agent ~ sleep.Experiencer   n 4 / 6   gate: FAIL
;; A fillers: bird, child, person, brown ×0.5, dog ×0.5   e.g. tierB-001551 tierB-000410
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001753 tierB-001891
;; JSD: 0.569   shared clusters: 2 e.g. {child, children, kid, kids} {dog, dog feed}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 eat) (Agent $e0 $x1)) (And (Member $e0 eat) (Experiencer $e0 $x1)))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.578   shared clusters: 2 e.g. {weather} {thing, things}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 rule) (Theme $e0 $x1)) (And (Member $e0 rule) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Experiencer $e0 $x1)))

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
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 lead) (Agent $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Patient $e0 $x1)))

;; [different class and role]  lead.Goal ~ live.Location   n 5 / 8   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; JSD: 0.728   shared clusters: 2 e.g. {house, home, houses} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 live) (Location $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (And (Member $e0 lead) (Location $e0 $x1)))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, child ×2, Baya, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.74   shared clusters: 2 e.g. {cat, cats} {child, children, kid, kids}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 swim) (Agent $e0 $x1)) (And (Member $e0 swim) (Goal $e0 $x1)))

;; [different class and role]  get.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: Iran, bad, big ×0.5, cheap ×0.5, day ×0.5, excuse ×0.5   e.g. tierB-000748 tierB-000370
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.754   shared clusters: 2 e.g. {weather} {thing, things}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.802   shared clusters: 2 e.g. {Martino, Pietro, Lorenzo, Damiano} {William, James}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

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
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (And (Member $e0 build) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 sell) (Theme $e0 $x1)) (And (Member $e0 sell) (Patient $e0 $x1)))

;; [different class and role]  become.Patient ~ hear.Stimulus   n 11 / 9   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierB-000740 tierB-000352
;; B fillers: bang, crash, knock, shot, start, thing   e.g. tierB-000756 tierB-000695
;; JSD: 0.837   shared clusters: 2 e.g. {thing, things} {noise, noises}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 hear) (Stimulus $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Holder $e0 $x1)))

;; [different class and role]  live.Location ~ make.Patient   n 8 / 20   gate: FAIL
;; A fillers: Norway ×2, house ×1.5, group, southeastern corner, suburb, comfortable ×0.5   e.g. tierB-000048 tierB-000371
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001457 tierB-001831
;; JSD: 0.851   shared clusters: 3 e.g. {house, home, houses} {big, large, huge, massive, …} {comfortable}
;; A: (And (Member $e0 live) (Location $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 live) (Location $e0 $x1)) (And (Member $e0 live) (Patient $e0 $x1)))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, movie, thing, film ×0.5, syrian film ×0.5   e.g. tierC-000138 tierC-000010
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.856   shared clusters: 2 e.g. {thing, things} {movie, film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (And (Member $e0 direct) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (And (Member $e0 leave) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Holder $e0 $x1)))

;; [different class and role]  lead.Goal ~ make.Patient   n 5 / 20   gate: FAIL
;; A fillers: happiness, home, peace, big ×0.5, cat fight ×0.5, glory ×0.5   e.g. tierB-001086 tierC-000020
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000371 tierB-001457
;; JSD: 0.875   shared clusters: 2 e.g. {house, home, houses} {big, large, huge, massive, …}
;; A: (And (Member $e0 lead) (Goal $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 lead) (Goal $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

;; [different class and role]  bad.Experiencer ~ make.Patient   n 4 / 20   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-000539 tierB-000371
;; JSD: 0.879   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {matter, mass}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Patient $e0 $x1)))

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
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: computer, food, house, blue ×0.5, shirt ×0.5, trouser ×0.5   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; JSD: 0.894   shared clusters: 2 e.g. {house, home, houses} {food, eat}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Holder   n 8 / 44   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.895   shared clusters: 2 e.g. {thing, things} {weather}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000142 tierB-001177
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-000971 tierB-001154
;; JSD: 0.908   shared clusters: 3 e.g. {sentence, sentences} {word, word processor} {room, rooms}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (And (Member $e0 use) (Holder $e0 $x1)))

;; [different class and role]  become.Patient ~ have.Holder   n 11 / 44   gate: FAIL
;; A fillers: Lady Ashton, bad, indigenous, person, relationship, thing   e.g. tierC-000241 tierC-000242
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.912   shared clusters: 2 e.g. {thing, things} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 become) (Patient $e0 $x1)) (And (Member $e0 become) (Holder $e0 $x1)))

;; [different class and role]  beautiful.Experiencer ~ have.Holder   n 3 / 44   gate: FAIL
;; A fillers: beautiful, weather, moon ×0.5, room ×0.5   e.g. tierB-001920 tierB-000565
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000790
;; JSD: 0.914   shared clusters: 2 e.g. {room, rooms} {weather}
;; A: (And (Member $e0 beautiful) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 beautiful) (Experiencer $e0 $x1)) (And (Member $e0 beautiful) (Holder $e0 $x1)))

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
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [different class and role]  create.Patient ~ use.Theme   n 7 / 23   gate: FAIL
;; A fillers: community ×4, particle accelerator, calendar ×0.5, language ×0.5, new ×0.5, various ×0.5   e.g. tierB-000089 tierB-000728
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001884 tierB-000866
;; JSD: 0.927   shared clusters: 2 e.g. {schedule, calendar} {various}
;; A: (And (Member $e0 create) (Patient $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 create) (Patient $e0 $x1)) (And (Member $e0 create) (Theme $e0 $x1)))

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
(Implication (And (Member $e0 work) (Agent $e0 $x1)) (And (Member $e0 work) (Holder $e0 $x1)))

;; [different class and role]  bad.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: bad ×2, relationship, matter ×0.5, weather ×0.5   e.g. tierB-000748 tierB-001594
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001929
;; JSD: 0.932   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Patient   n 44 / 20   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-001016
;; B fillers: difference ×1.5, Afghanistan, Augustus, Isabella, big, chicken fried steak   e.g. tierB-001594 tierB-000371
;; JSD: 0.936   shared clusters: 3 e.g. {house, home, houses} {room, rooms} {bad, bad, matter, bad, problem}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  have.Theme ~ start.Patient   n 43 / 11   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Milky Way, concert, crack, dog feed, knock, national fibre optic network project   e.g. tierB-001940 tierB-001816
;; JSD: 0.941   shared clusters: 2 e.g. {thing, things} {blue, purple}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 start) (Patient $e0 $x1)) (And (Member $e0 start) (Theme $e0 $x1)))

;; [different class and role]  have.Theme ~ make.Agent   n 43 / 18   gate: FAIL
;; A fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-001264 tierB-000162
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001920 tierB-001831
;; JSD: 0.943   shared clusters: 2 e.g. {thing, things} {curtain, curtains}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: child ×4, representation ×2, antler, beauty salon, cemetery, chance   e.g. tierB-000162 tierB-000797
;; JSD: 0.945   shared clusters: 2 e.g. {thing, things} {gas station, gas pump, gas pumps}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (And (Member $e0 have) (Holder $e0 $x1)))
