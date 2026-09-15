;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — ROLE PAIRS (our extension) — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_rolepairs_faithful_cosine_<mode>_<cut>.jsonl   (every role pair with its gate verdict)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.85 — the adopted setting. The other 9 mode × cut blocks of the dial:
;;   rolefillers2_additions_rolepairs_cosine_dial/<mode>_<cut>.metta
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

;; ==================== ROLE PAIRS: 22 heads at n >= 14, 231 pairs, 3 pass the gate ====================
;; (OUR EXTENSION, not the paper's method: one head's fillers pooled over every class, against every other
;; head's; the paper's 'Agent2' most likely names the second participant slot of the 'go to' meta-node, i.e. a slot)

;; [role pair]  Agent ~ Experiencer   n 888 / 261   gate: PASS
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.61 (gate)   JSD: 0.65   shared clusters: 72 e.g. {person, people} {thing, things} {child, children, kid, kids}
;; A: (Agent $e $x)
;; B: (Experiencer $e $x)
(Implication (Experiencer $e $x) (Agent $e $x))

;; [role pair]  Patient ~ Theme   n 455 / 594   gate: PASS
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.51 (gate)   JSD: 0.746   shared clusters: 79 e.g. {thing, things} {person, people} {movie, film}
;; A: (Patient $e $x)
;; B: (Theme $e $x)
(Implication (Patient $e $x) (Theme $e $x))

;; [role pair]  Agent ~ Patient   n 888 / 455   gate: PASS
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.50 (gate)   JSD: 0.762   shared clusters: 72 e.g. {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;; A: (Agent $e $x)
;; B: (Patient $e $x)
(Implication (Patient $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.50 (gate)   JSD: 0.664   shared clusters: 96 e.g. {person, people} {thing, things} {door, door, open, door, unlocked}
;; A: (Experiencer $e $x)
;; B: (Patient $e $x)
(Implication (Experiencer $e $x) (Patient $e $x))

;; [role pair]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.42 (gate)   JSD: 0.765   shared clusters: 81 e.g. {person, people} {thing, things} {company, corporation}
;; A: (Agent $e $x)
;; B: (Theme $e $x)
(Implication (Theme $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.41 (gate)   JSD: 0.776   shared clusters: 59 e.g. {thing, things} {person, people} {child, children, kid, kids}
;; A: (Experiencer $e $x)
;; B: (Theme $e $x)
(Implication (Experiencer $e $x) (Theme $e $x))

;; [role pair]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.36 (gate)   JSD: 0.805   shared clusters: 13 e.g. {person, people} {company, corporation} {child, children, kid, kids}
;; A: (Agent $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Agent $e $x))

;; [role pair]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.36 (gate)   JSD: 0.881   shared clusters: 8 e.g. {thing, things} {child, children, kid, kids} {food, eat}
;; A: (Stimulus $e $x)
;; B: (Theme $e $x)
(Implication (Stimulus $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.24 (gate)   JSD: 0.866   shared clusters: 8 e.g. {person, people} {child, children, kid, kids} {man, guy}
;; A: (Experiencer $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Experiencer $e $x))

;; [role pair]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.24 (gate)   JSD: 0.918   shared clusters: 5 e.g. {thing, things} {child, children, kid, kids} {knock}
;; A: (Patient $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Patient $e $x))

;; [role pair]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.23 (gate)   JSD: 0.867   shared clusters: 16 e.g. {thing, things} {house, home, houses} {food, eat}
;; A: (Holder $e $x)
;; B: (Theme $e $x)
(Implication (Holder $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.21 (gate)   JSD: 0.809   shared clusters: 16 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Boris, Ivan, Dmitri, Rasputin}
;; A: (Experiencer $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; cosine: 0.21 (gate)   JSD: 0.886   shared clusters: 5 e.g. {person, people} {child, children, kid, kids} {Olivia, Sophia}
;; A: (Agent $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Agent $e $x))

;; [role pair]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.21 (gate)   JSD: 0.852   shared clusters: 14 e.g. {thing, things} {movie, film} {room, rooms}
;; A: (Holder $e $x)
;; B: (Patient $e $x)
(Implication (Holder $e $x) (Patient $e $x))

;; [role pair]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.18 (gate)   JSD: 0.921   shared clusters: 4 e.g. {thing, things} {child, children, kid, kids} {difficult, hard, difficulty, harder}
;; A: (Experiencer $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.17 (gate)   JSD: 0.91   shared clusters: 6 e.g. {thing, things} {child, children, kid, kids} {Jessica, Beth}
;; A: (Agent $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Agent $e $x))

;; [role pair]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.17 (gate)   JSD: 0.921   shared clusters: 6 e.g. {person, people} {child, children, kid, kids} {big, large, huge, massive, …}
;; A: (Patient $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Patient $e $x))

;; [role pair]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.16 (gate)   JSD: 0.812   shared clusters: 29 e.g. {bad, bad, matter, bad, problem} {black, white} {red}
;; A: (Experiencer $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.16 (gate)   JSD: 0.859   shared clusters: 13 e.g. {house, home, houses} {here} {Eskisehir, Giresun}
;; A: (Goal $e $x)
;; B: (Location $e $x)
(Implication (Goal $e $x) (Location $e $x))

;; [role pair]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.16 (gate)   JSD: 0.857   shared clusters: 8 e.g. {town, towns} {here} {school, education}
;; A: (Goal $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Goal $e $x))

;; [role pair]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.16 (gate)   JSD: 0.914   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Experiencer $e $x)
(Implication (Beneficiary $e $x) (Experiencer $e $x))

;; [role pair]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.15 (gate)   JSD: 0.892   shared clusters: 1 e.g. {now, today, current}
;; A: (Before $e $x)
;; B: (Time $e $x)
(Implication (Before $e $x) (Time $e $x))

;; [role pair]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.15 (gate)   JSD: 0.892   shared clusters: 3 e.g. {thing, things} {author, writer, novelist} {food, eat}
;; A: (Holder $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Holder $e $x))

;; [role pair]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.15 (gate)   JSD: 0.86   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Recipient $e $x)
(Implication (Beneficiary $e $x) (Recipient $e $x))

;; [role pair]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.15 (gate)   JSD: 0.857   shared clusters: 17 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;; A: (Agent $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Agent $e $x))

;; [role pair]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.14 (gate)   JSD: 0.908   shared clusters: 12 e.g. {thing, things} {talk, conversation, discussion} {music}
;; A: (Theme $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Theme $e $x))

;; [role pair]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.14 (gate)   JSD: 0.914   shared clusters: 1 e.g. {Karen, Ken}
;; A: (CoAgent $e $x)
;; B: (Holder $e $x)
(Implication (CoAgent $e $x) (Holder $e $x))

;; [role pair]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.14 (gate)   JSD: 0.912   shared clusters: 9 e.g. {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
;; A: (Recipient $e $x)
;; B: (Theme $e $x)
(Implication (Recipient $e $x) (Theme $e $x))

;; [role pair]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.13 (gate)   JSD: 0.89   shared clusters: 9 e.g. {here} {town, towns} {place, places}
;; A: (Location $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Location $e $x))

;; [role pair]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.13 (gate)   JSD: 0.891   shared clusters: 5 e.g. {house, home, houses} {town, towns} {place, places}
;; A: (Goal $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Goal $e $x))

;; [role pair]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.13 (gate)   JSD: 0.89   shared clusters: 4 e.g. {town, towns} {room, rooms} {place, places}
;; A: (Holder $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Holder $e $x))

;; [role pair]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.12 (gate)   JSD: 0.94   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Patient $e $x)
(Implication (Beneficiary $e $x) (Patient $e $x))

;; [role pair]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.10 (gate)   JSD: 0.878   shared clusters: 28 e.g. {bad, bad, matter, bad, problem} {black, white} {red}
;; A: (Patient $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Patient $e $x))

;; [role pair]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.09 (gate)   JSD: 0.896   shared clusters: 17 e.g. {tree, trees} {house, home, houses} {room, rooms}
;; A: (Goal $e $x)
;; B: (Patient $e $x)
(Implication (Goal $e $x) (Patient $e $x))

;; [role pair]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.09 (gate)   JSD: 0.907   shared clusters: 4 e.g. {thing, things} {practice} {action, act, actions}
;; A: (Stimulus $e $x)
;; B: (To $e $x)
(Implication (Stimulus $e $x) (To $e $x))

;; [role pair]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.09 (gate)   JSD: 0.944   shared clusters: 7 e.g. {work, job} {portray, portrait, portrayal} {word, word processor}
;; A: (For $e $x)
;; B: (Theme $e $x)
(Implication (For $e $x) (Theme $e $x))

;; [role pair]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.09 (gate)   JSD: 0.895   shared clusters: 5 e.g. {well, on, there, be} {direct, straight, directly} {together, come together}
;; A: (Manner $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Manner $e $x))

;; [role pair]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.09 (gate)   JSD: 0.905   shared clusters: 15 e.g. {house, home, houses} {place, places} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (Experiencer $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Experiencer $e $x))

;; [role pair]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.08 (gate)   JSD: 0.95   shared clusters: 4 e.g. {thing, things} {bake, bakery, bread} {woman, lady, female, women}
;; A: (Patient $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Patient $e $x))

;; [role pair]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.08 (gate)   JSD: 0.93   shared clusters: 9 e.g. {tree, trees} {room, rooms} {cookie, cookie jar, cookies}
;; A: (Patient $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Patient $e $x))

;; [role pair]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.07 (gate)   JSD: 0.954   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Theme $e $x)
(Implication (Beneficiary $e $x) (Theme $e $x))

;; [role pair]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.07 (gate)   JSD: 0.933   shared clusters: 15 e.g. {house, home, houses} {Baltimore, Boston, Springfield} {room, rooms}
;; A: (Goal $e $x)
;; B: (Theme $e $x)
(Implication (Goal $e $x) (Theme $e $x))

;; [role pair]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.07 (gate)   JSD: 0.927   shared clusters: 13 e.g. {view, views, common, view, public, view, …} {food, eat} {room, rooms}
;; A: (Source $e $x)
;; B: (Theme $e $x)
(Implication (Source $e $x) (Theme $e $x))

;; [role pair]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.06 (gate)   JSD: 0.927   shared clusters: 6 e.g. {town, towns} {house, home, houses} {place, places}
;; A: (Holder $e $x)
;; B: (Location $e $x)
(Implication (Holder $e $x) (Location $e $x))

;; [role pair]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.06 (gate)   JSD: 0.94   shared clusters: 7 e.g. {thing, things} {doctor, doctors} {George Allen, James David Edgar, Chuck Robb}
;; A: (Agent $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.06 (gate)   JSD: 0.951   shared clusters: 3 e.g. {thing, things} {George Allen, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Experiencer $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Experiencer $e $x))

;; [role pair]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.06 (gate)   JSD: 0.9   shared clusters: 26 e.g. {door, door, open, door, unlocked} {table} {hotel}
;; A: (Location $e $x)
;; B: (Patient $e $x)
(Implication (Location $e $x) (Patient $e $x))

;; [role pair]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.06 (gate)   JSD: 0.913   shared clusters: 19 e.g. {Europe, Western Europe} {house, home, houses} {place, places}
;; A: (Experiencer $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.06 (gate)   JSD: 0.944   shared clusters: 6 e.g. {family, families} {Linda, Amanda, Loren, Dora Smith, …} {cat, cats}
;; A: (Agent $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Agent $e $x))

;; [role pair]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.05 (gate)   JSD: 0.951   shared clusters: 2 e.g. {bed} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Goal $e $x)
(Implication (For $e $x) (Goal $e $x))

;; [role pair]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.05 (gate)   JSD: 0.942   shared clusters: 2 e.g. {thing, things} {repeat, repetition}
;; A: (Holder $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Holder $e $x))

;; [role pair]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.05 (gate)   JSD: 0.957   shared clusters: 1 e.g. {child, children, kid, kids}
;; A: (Recipient $e $x)
;; B: (Stimulus $e $x)
(Implication (Recipient $e $x) (Stimulus $e $x))

;; [role pair]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.05 (gate)   JSD: 0.953   shared clusters: 1 e.g. {direct, straight, directly}
;; A: (As $e $x)
;; B: (Manner $e $x)
(Implication (As $e $x) (Manner $e $x))

;; [role pair]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.04 (gate)   JSD: 0.925   shared clusters: 24 e.g. {house, home, houses} {Santiago, Havana} {Gareccio, Bologna}
;; A: (Location $e $x)
;; B: (Theme $e $x)
(Implication (Location $e $x) (Theme $e $x))

;; [role pair]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.04 (gate)   JSD: 0.949   shared clusters: 7 e.g. {snow, snowstorm, deep, snow} {road, motorway, roads} {blood}
;; A: (Instrument $e $x)
;; B: (Patient $e $x)
(Implication (Instrument $e $x) (Patient $e $x))

;; [role pair]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.04 (gate)   JSD: 0.946   shared clusters: 9 e.g. {place, places} {room, rooms} {school, education}
;; A: (Experiencer $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Experiencer $e $x))

;; [role pair]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.04 (gate)   JSD: 0.942   shared clusters: 15 e.g. {Linda, Amanda, Loren, Dora Smith, …} {house, home, houses} {school, education}
;; A: (Agent $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Agent $e $x))

;; [role pair]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; cosine: 0.04 (gate)   JSD: 0.961   shared clusters: 5 e.g. {Jason Suecof, Nick De Caro, Robert Day, Matt Brown, …} {girl, girls} {Peter}
;; A: (Agent $e $x)
;; B: (As $e $x)
(Implication (As $e $x) (Agent $e $x))

;; [role pair]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.04 (gate)   JSD: 0.956   shared clusters: 1 e.g. {child, children, kid, kids}
;; A: (Beneficiary $e $x)
;; B: (Stimulus $e $x)
(Implication (Beneficiary $e $x) (Stimulus $e $x))

;; [role pair]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.04 (gate)   JSD: 0.95   shared clusters: 2 e.g. {food, eat} {crash}
;; A: (Instrument $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Instrument $e $x))

;; [role pair]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.04 (gate)   JSD: 0.953   shared clusters: 2 e.g. {action, act, actions} {poetry}
;; A: (In $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (In $e $x))

;; [role pair]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.04 (gate)   JSD: 0.928   shared clusters: 4 e.g. {late, later, last} {immediately, instantly, right away} {back, backward, before, past}
;; A: (Manner $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Manner $e $x))

;; [role pair]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.03 (gate)   JSD: 0.966   shared clusters: 2 e.g. {cat, cats} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Experiencer $e $x)
(Implication (CoAgent $e $x) (Experiencer $e $x))

;; [role pair]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.03 (gate)   JSD: 0.979   shared clusters: 2 e.g. {Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Theme $e $x)
(Implication (CoAgent $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.03 (gate)   JSD: 0.951   shared clusters: 9 e.g. {well, on, there, be} {direct, straight, directly} {late, later, last}
;; A: (Experiencer $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.03 (gate)   JSD: 0.96   shared clusters: 3 e.g. {well, on, there, be} {happiness, happy, happily, joy} {back, backward, before, past}
;; A: (Goal $e $x)
;; B: (Manner $e $x)
(Implication (Goal $e $x) (Manner $e $x))

;; [role pair]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.03 (gate)   JSD: 0.966   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Goal $e $x)
(Implication (CoAgent $e $x) (Goal $e $x))

;; [role pair]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.03 (gate)   JSD: 0.954   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
;; A: (CoAgent $e $x)
;; B: (Recipient $e $x)
(Implication (CoAgent $e $x) (Recipient $e $x))

;; [role pair]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.948   shared clusters: 4 e.g. {dead, die, death, die down, …} {well, on, there, be} {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Goal $e $x))

;; [role pair]  Holder ~ Result   n 48 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.976   shared clusters: 1 e.g. {bad, bad, matter, bad, problem}
;; A: (Holder $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Holder $e $x))

;; [role pair]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.03 (gate)   JSD: 0.952   shared clusters: 2 e.g. {crop, rice crop, corn, crops} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Instrument $e $x))

;; [role pair]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.03 (gate)   JSD: 0.975   shared clusters: 3 e.g. {caretaker, keeper} {girl, girls} {direct, straight, directly}
;; A: (As $e $x)
;; B: (Experiencer $e $x)
(Implication (As $e $x) (Experiencer $e $x))

;; [role pair]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.963   shared clusters: 1 e.g. {direct, straight, directly}
;; A: (As $e $x)
;; B: (Result $e $x)
(Implication (As $e $x) (Result $e $x))

;; [role pair]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.03 (gate)   JSD: 0.965   shared clusters: 4 e.g. {train} {road, motorway, roads} {crop, rice crop, corn, crops}
;; A: (Experiencer $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.03 (gate)   JSD: 0.964   shared clusters: 2 e.g. {Linda, Amanda, Loren, Dora Smith, …} {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Goal $e $x))

;; [role pair]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.03 (gate)   JSD: 0.97   shared clusters: 1 e.g. {silent, silence}
;; A: (In $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (In $e $x))

;; [role pair]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.03 (gate)   JSD: 0.969   shared clusters: 6 e.g. {language, english} {understand, misunderstand} {way, ways}
;; A: (In $e $x)
;; B: (Theme $e $x)
(Implication (In $e $x) (Theme $e $x))

;; [role pair]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.03 (gate)   JSD: 0.969   shared clusters: 4 e.g. {food, eat} {drum, snare, drums} {new, brand new, new, product}
;; A: (Instrument $e $x)
;; B: (Theme $e $x)
(Implication (Instrument $e $x) (Theme $e $x))

;; [role pair]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.03 (gate)   JSD: 0.97   shared clusters: 3 e.g. {company, corporation} {plane, flight, aeroplane, airplane, …} {school, education}
;; A: (Agent $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Agent $e $x))

;; [role pair]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.03 (gate)   JSD: 0.963   shared clusters: 2 e.g. {food, eat} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Source $e $x)
(Implication (Instrument $e $x) (Source $e $x))

;; [role pair]  Recipient ~ Source   n 29 / 47   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.03 (gate)   JSD: 0.951   shared clusters: 3 e.g. {company, corporation} {local, locals} {big, large, huge, massive, …}
;; A: (Recipient $e $x)
;; B: (Source $e $x)
(Implication (Recipient $e $x) (Source $e $x))

;; [role pair]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.03 (gate)   JSD: 0.963   shared clusters: 2 e.g. {bat} {big, large, huge, massive, …}
;; A: (Result $e $x)
;; B: (Source $e $x)
(Implication (Result $e $x) (Source $e $x))

;; [role pair]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.03 (gate)   JSD: 0.965   shared clusters: 8 e.g. {sleep} {king, queen, kings} {big, large, huge, massive, …}
;; A: (Result $e $x)
;; B: (Theme $e $x)
(Implication (Result $e $x) (Theme $e $x))

;; [role pair]  Experiencer ~ Time   n 261 / 107   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.03 (gate)   JSD: 0.968   shared clusters: 5 e.g. {night, tonight, midnight} {late, later, last} {modern times, modern}
;; A: (Experiencer $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Experiencer $e $x))

;; [role pair]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.03 (gate)   JSD: 0.965   shared clusters: 3 e.g. {city, cities} {little, small, minor} {big, large, huge, massive, …}
;; A: (Location $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Location $e $x))

;; [role pair]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 1 e.g. {way, ways}
;; A: (In $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (In $e $x))

;; [role pair]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.02 (gate)   JSD: 0.981   shared clusters: 4 e.g. {now, today, current} {morning, early morning, this morning} {day, days, days, short}
;; A: (Theme $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Theme $e $x))

;; [role pair]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.02 (gate)   JSD: 0.981   shared clusters: 2 e.g. {name} {girl, girls}
;; A: (As $e $x)
;; B: (Theme $e $x)
(Implication (As $e $x) (Theme $e $x))

;; [role pair]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.02 (gate)   JSD: 0.969   shared clusters: 2 e.g. {way, ways} {field, fields}
;; A: (Goal $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Goal $e $x))

;; [role pair]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.02 (gate)   JSD: 0.969   shared clusters: 3 e.g. {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
;; A: (In $e $x)
;; B: (Location $e $x)
(Implication (In $e $x) (Location $e $x))

;; [role pair]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Source $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Source $e $x))

;; [role pair]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.02 (gate)   JSD: 0.971   shared clusters: 3 e.g. {word, word processor} {happiness, happy, happily, joy} {general, general purpose}
;; A: (Experiencer $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Experiencer $e $x))

;; [role pair]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.02 (gate)   JSD: 0.972   shared clusters: 5 e.g. {weather} {field, fields} {language, english}
;; A: (In $e $x)
;; B: (Patient $e $x)
(Implication (In $e $x) (Patient $e $x))

;; [role pair]  For ~ Stimulus   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.02 (gate)   JSD: 0.973   shared clusters: 1 e.g. {start, begin}
;; A: (For $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (For $e $x))

;; [role pair]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.02 (gate)   JSD: 0.966   shared clusters: 6 e.g. {bus, bus ride} {cook} {ship, merchant ship, modern ship}
;; A: (Agent $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Agent $e $x))

;; [role pair]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.02 (gate)   JSD: 0.976   shared clusters: 3 e.g. {weather} {silent, silence} {nothing, no, empty, zero, …}
;; A: (Experiencer $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Experiencer $e $x))

;; [role pair]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.02 (gate)   JSD: 0.966   shared clusters: 3 e.g. {snow, snowstorm, deep, snow} {big, large, huge, massive, …} {new, brand new, new, product}
;; A: (Goal $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Goal $e $x))

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
;; cosine: 0.02 (gate)   JSD: 0.978   shared clusters: 2 e.g. {talk, conversation, discussion} {shore, coast, shoreline}
;; A: (Location $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Location $e $x))

;; [role pair]  Manner ~ Patient   n 115 / 455   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.02 (gate)   JSD: 0.979   shared clusters: 4 e.g. {well, on, there, be} {direct, straight, directly} {together, come together}
;; A: (Manner $e $x)
;; B: (Patient $e $x)
(Implication (Manner $e $x) (Patient $e $x))

;; [role pair]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.02 (gate)   JSD: 0.956   shared clusters: 17 e.g. {Santiago, Havana} {house, home, houses} {sun, sunlight, direct sun}
;; A: (Agent $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Agent $e $x))

;; [role pair]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.02 (gate)   JSD: 0.977   shared clusters: 1 e.g. {really, real, reality, actual, …}
;; A: (In $e $x)
;; B: (Manner $e $x)
(Implication (In $e $x) (Manner $e $x))

;; [role pair]  Like ~ Result   n 14 / 43   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.02 (gate)   JSD: 0.971   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Result $e $x)
(Implication (Like $e $x) (Result $e $x))

;; [role pair]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.02 (gate)   JSD: 0.971   shared clusters: 7 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {crow, caw} {red}
;; A: (Agent $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Agent $e $x))

;; [role pair]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.02 (gate)   JSD: 0.978   shared clusters: 1 e.g. {escape, exit}
;; A: (Before $e $x)
;; B: (Goal $e $x)
(Implication (Before $e $x) (Goal $e $x))

;; [role pair]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.02 (gate)   JSD: 0.983   shared clusters: 3 e.g. {imprison, jail, prison} {gold coin, gold, gold coins} {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Theme $e $x)
(Implication (Like $e $x) (Theme $e $x))

;; [role pair]  For ~ Holder   n 39 / 48   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; cosine: 0.01 (gate)   JSD: 0.977   shared clusters: 1 e.g. {word, word processor}
;; A: (For $e $x)
;; B: (Holder $e $x)
(Implication (For $e $x) (Holder $e $x))

;; [role pair]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.01 (gate)   JSD: 0.984   shared clusters: 2 e.g. {well, on, there, be} {early}
;; A: (Location $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Location $e $x))

;; [role pair]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.01 (gate)   JSD: 0.978   shared clusters: 6 e.g. {full, fully, full fledged, complete, …} {really, real, reality, actual, …} {widespread, widely, wide, attention, widespread, …}
;; A: (Manner $e $x)
;; B: (Theme $e $x)
(Implication (Manner $e $x) (Theme $e $x))

;; [role pair]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.983   shared clusters: 4 e.g. {night, tonight, midnight} {summer, this summer} {hour, hours}
;; A: (Patient $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Patient $e $x))

;; [role pair]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 3 e.g. {now, today, current} {hurricane, hurricane season} {spring}
;; A: (Agent $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Agent $e $x))

;; [role pair]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 2 e.g. {name} {direct, straight, directly}
;; A: (As $e $x)
;; B: (Patient $e $x)
(Implication (As $e $x) (Patient $e $x))

;; [role pair]  In ~ To   n 50 / 46   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.01 (gate)   JSD: 0.981   shared clusters: 1 e.g. {action, act, actions}
;; A: (In $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (In $e $x))

;; [role pair]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.01 (gate)   JSD: 0.982   shared clusters: 2 e.g. {big, large, huge, massive, …} {well, on, there, be}
;; A: (Location $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Location $e $x))

;; [role pair]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.01 (gate)   JSD: 0.981   shared clusters: 5 e.g. {train} {plant, plants} {snow, snowstorm, deep, snow}
;; A: (Agent $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Agent $e $x))

;; [role pair]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×26, person ×9, view ×7, work ×6.5, Ashe ×4, child ×4
;; cosine: 0.01 (gate)   JSD: 0.989   shared clusters: 2 e.g. {now, today, current} {repair, repairs}
;; A: (Before $e $x)
;; B: (Theme $e $x)
(Implication (Before $e $x) (Theme $e $x))

;; [role pair]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.01 (gate)   JSD: 0.992   shared clusters: 1 e.g. {family, families}
;; A: (CoAgent $e $x)
;; B: (Patient $e $x)
(Implication (CoAgent $e $x) (Patient $e $x))

;; [role pair]  Instrument ~ Like   n 34 / 14   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.978   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Instrument $e $x))

;; [role pair]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.01 (gate)   JSD: 0.982   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Result $e $x)
(Implication (Instrument $e $x) (Result $e $x))

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

;; [role pair]  Result ~ Time   n 43 / 107   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.968   shared clusters: 2 e.g. {modern times, modern} {back, backward, before, past}
;; A: (Result $e $x)
;; B: (Time $e $x)
(Implication (Result $e $x) (Time $e $x))

;; [role pair]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.01 (gate)   JSD: 0.983   shared clusters: 4 e.g. {word, word processor} {call, telephone call} {dance}
;; A: (For $e $x)
;; B: (Patient $e $x)
(Implication (For $e $x) (Patient $e $x))

;; [role pair]  Like ~ Source   n 14 / 47   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.01 (gate)   JSD: 0.982   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Source $e $x)
(Implication (Like $e $x) (Source $e $x))

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
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 1 e.g. {weather}
;; A: (Holder $e $x)
;; B: (In $e $x)
(Implication (Holder $e $x) (In $e $x))

;; [role pair]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 2 e.g. {snow, snowstorm, deep, snow} {big, large, huge, massive, …}
;; A: (Instrument $e $x)
;; B: (Location $e $x)
(Implication (Instrument $e $x) (Location $e $x))

;; [role pair]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.989   shared clusters: 2 e.g. {spider, huge, spider, spiders} {big, large, huge, massive, …}
;; A: (Experiencer $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Experiencer $e $x))

;; [role pair]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 1 e.g. {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Manner $e $x)
(Implication (For $e $x) (Manner $e $x))

;; [role pair]  Like ~ Location   n 14 / 210   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.01 (gate)   JSD: 0.989   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Location $e $x)
(Implication (Like $e $x) (Location $e $x))

;; [role pair]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.992   shared clusters: 2 e.g. {centipede, centipedes, pillar} {flame, flames}
;; A: (Agent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Agent $e $x))

;; [role pair]  As ~ Goal   n 15 / 93   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.01 (gate)   JSD: 0.989   shared clusters: 1 e.g. {potential, possibility}
;; A: (As $e $x)
;; B: (Goal $e $x)
(Implication (As $e $x) (Goal $e $x))

;; [role pair]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.01 (gate)   JSD: 0.988   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Goal $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Goal $e $x))

;; [role pair]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 1 e.g. {back, backward, before, past}
;; A: (Goal $e $x)
;; B: (Time $e $x)
(Implication (Goal $e $x) (Time $e $x))

;; [role pair]  Like ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; B fillers: thing ×18, person ×16, door ×9.5, tree ×6.333, movie ×6, room ×5.5
;; cosine: 0.01 (gate)   JSD: 0.992   shared clusters: 1 e.g. {big, large, huge, massive, …}
;; A: (Like $e $x)
;; B: (Patient $e $x)
(Implication (Like $e $x) (Patient $e $x))

;; [role pair]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.01 (gate)   JSD: 0.986   shared clusters: 1 e.g. {point, point out}
;; A: (Source $e $x)
;; B: (Time $e $x)
(Implication (Source $e $x) (Time $e $x))

;; [role pair]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; cosine: 0.00 (gate)   JSD: 0.995   shared clusters: 2 e.g. {quickly, quick, fast} {really, real, reality, actual, …}
;; A: (Agent $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Agent $e $x))

;; [role pair]  Manner ~ Source   n 115 / 47   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Manila ×2, here ×2, town ×2, room ×1.5, Narita, New York
;; cosine: 0.00 (gate)   JSD: 0.99   shared clusters: 1 e.g. {international, internationally}
;; A: (Manner $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Manner $e $x))

;; [role pair]  Instrument ~ Time   n 34 / 107   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 0.988   shared clusters: 1 e.g. {present, presented}
;; A: (Instrument $e $x)
;; B: (Time $e $x)
(Implication (Instrument $e $x) (Time $e $x))

;; [role pair]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; cosine: 0.00 (gate)   JSD: 0.996   shared clusters: 1 e.g. {now, today, current}
;; A: (Agent $e $x)
;; B: (Before $e $x)
(Implication (Before $e $x) (Agent $e $x))

;; [role pair]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×55.5, thing ×22, company ×19, child ×10, man ×10, boy ×8.5
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 0.994   shared clusters: 2 e.g. {really, real, reality, actual, …} {context}
;; A: (Agent $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Agent $e $x))

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

;; [role pair]  As ~ Location   n 15 / 210   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Location $e $x)
(Implication (As $e $x) (Location $e $x))

;; [role pair]  As ~ Recipient   n 15 / 29   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Recipient $e $x)
(Implication (As $e $x) (Recipient $e $x))

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

;; [role pair]  Before ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: person ×10.5, thing ×7, child ×5, Boris ×3, Low German ×3, Oleg ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Experiencer $e $x)
(Implication (Before $e $x) (Experiencer $e $x))

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

;; [role pair]  Before ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Stimulus $e $x)
(Implication (Before $e $x) (Stimulus $e $x))

;; [role pair]  Before ~ To   n 16 / 46   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (To $e $x)
(Implication (Before $e $x) (To $e $x))

;; [role pair]  Beneficiary ~ CoAgent   n 14 / 16   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (CoAgent $e $x)
(Implication (Beneficiary $e $x) (CoAgent $e $x))

;; [role pair]  Beneficiary ~ For   n 14 / 39   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (For $e $x)
(Implication (Beneficiary $e $x) (For $e $x))

;; [role pair]  Beneficiary ~ Goal   n 14 / 93   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologist, band
;; B fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Goal $e $x)
(Implication (Beneficiary $e $x) (Goal $e $x))

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

;; [role pair]  CoAgent ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Instrument $e $x)
(Implication (CoAgent $e $x) (Instrument $e $x))

;; [role pair]  CoAgent ~ Like   n 16 / 14   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: aspect ×2, Kermit the Frog, developed country, gold, hot cake, locker room
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (CoAgent $e $x))

;; [role pair]  CoAgent ~ Location   n 16 / 210   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Location $e $x)
(Implication (CoAgent $e $x) (Location $e $x))

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

;; [role pair]  CoAgent ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Stimulus $e $x)
(Implication (CoAgent $e $x) (Stimulus $e $x))

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

;; [role pair]  For ~ In   n 39 / 50   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (In $e $x)
(Implication (For $e $x) (In $e $x))

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

;; [role pair]  For ~ Result   n 39 / 43   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, job ×2, term ×2, Bombay, almost nothing
;; B fillers: bad ×4, black ×2, red ×2, alarmed, bat, beautiful
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Result $e $x)
(Implication (For $e $x) (Result $e $x))

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

;; [role pair]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, town ×2.5, Altoona ×2, Baltimore ×2, Germany ×2
;; B fillers: thing ×3, animal ×2, Jessica, Mandela, author, bang
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Goal $e $x))

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

;; [role pair]  Holder ~ Recipient   n 48 / 29   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kid ×2, person ×2, police ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Holder $e $x))

;; [role pair]  Holder ~ Time   n 48 / 107   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Time $e $x)
(Implication (Holder $e $x) (Time $e $x))

;; [role pair]  In ~ Instrument   n 50 / 34   gate: FAIL
;; A fillers: action ×2, continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2
;; B fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (In $e $x))

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

;; [role pair]  Instrument ~ To   n 34 / 46   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, chalk, corn
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (To $e $x)
(Implication (Instrument $e $x) (To $e $x))

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

;; [role pair]  Location ~ Time   n 210 / 107   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
;; A: (Location $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Location $e $x))

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
