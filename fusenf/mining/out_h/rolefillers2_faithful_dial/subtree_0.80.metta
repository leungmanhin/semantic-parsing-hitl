;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 0.80 — one point of the dial; the adopted setting (word @ 0.85) is
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
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.626   shared clusters: 55 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Agent $e $x)
;; B: (Experiencer $e $x)
(Implication (Experiencer $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.678   shared clusters: 69 e.g. {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Experiencer $e $x)
;; B: (Patient $e $x)
(Implication (Experiencer $e $x) (Patient $e $x))

;; [pooled role]  Patient ~ Theme   n 455 / 594   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.721   shared clusters: 80 e.g. {thing, things, stuff, practice, thing} {person, people} {song, sing, chant}
;; A: (Patient $e $x)
;; B: (Theme $e $x)
(Implication (Patient $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.725   shared clusters: 80 e.g. {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …}
;; A: (Agent $e $x)
;; B: (Theme $e $x)
(Implication (Theme $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Patient   n 888 / 455   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.734   shared clusters: 74 e.g. {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Agent $e $x)
;; B: (Patient $e $x)
(Implication (Patient $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.738   shared clusters: 16 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (Experiencer $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Experiencer $e $x))

;; [pooled role]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.767   shared clusters: 47 e.g. {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (Experiencer $e $x)
;; B: (Theme $e $x)
(Implication (Experiencer $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.77   shared clusters: 14 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation}
;; A: (Agent $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.782   shared clusters: 18 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …}
;; A: (Agent $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Agent $e $x))

;; [pooled role]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.789   shared clusters: 3 e.g. {Jessica, Linda, Beth, Katherine, …} {person, people} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Recipient $e $x)
(Implication (Beneficiary $e $x) (Recipient $e $x))

;; [pooled role]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.802   shared clusters: 14 e.g. {house, home, comfortable, house, houses, …} {Germany, Denmark, Norway, Sweden} {city, town, cities, town, unknown, …}
;; A: (Goal $e $x)
;; B: (Location $e $x)
(Implication (Goal $e $x) (Location $e $x))

;; [pooled role]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.814   shared clusters: 18 e.g. {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms}
;; A: (Holder $e $x)
;; B: (Patient $e $x)
(Implication (Holder $e $x) (Patient $e $x))

;; [pooled role]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.82   shared clusters: 21 e.g. {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …}
;; A: (Holder $e $x)
;; B: (Theme $e $x)
(Implication (Holder $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; JSD: 0.847   shared clusters: 6 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Agent $e $x)
;; B: (Beneficiary $e $x)
(Implication (Beneficiary $e $x) (Agent $e $x))

;; [pooled role]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.852   shared clusters: 7 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Experiencer $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Experiencer $e $x))

;; [pooled role]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.859   shared clusters: 7 e.g. {city, town, cities, town, unknown, …} {here, host} {school, university, campus, college, …}
;; A: (Goal $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Goal $e $x))

;; [pooled role]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.864   shared clusters: 8 e.g. {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana}
;; A: (Location $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Location $e $x))

;; [pooled role]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.873   shared clusters: 9 e.g. {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat}
;; A: (Stimulus $e $x)
;; B: (Theme $e $x)
(Implication (Stimulus $e $x) (Theme $e $x))

;; [pooled role]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.88   shared clusters: 1 e.g. {now, today, this year, current, …}
;; A: (Before $e $x)
;; B: (Time $e $x)
(Implication (Before $e $x) (Time $e $x))

;; [pooled role]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.882   shared clusters: 12 e.g. {bad, bad, relationship, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {unlocked, locked, lock, door, locked}
;; A: (Experiencer $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Experiencer $e $x))

;; [pooled role]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 0.883   shared clusters: 8 e.g. {Jessica, Linda, Beth, Katherine, …} {Karen, Kalman, Kerr, Ken} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;; A: (Agent $e $x)
;; B: (CoAgent $e $x)
(Implication (CoAgent $e $x) (Agent $e $x))

;; [pooled role]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.884   shared clusters: 16 e.g. {house, home, comfortable, house, houses, …} {tree, trees, treetop} {room, changing room, rooms}
;; A: (Goal $e $x)
;; B: (Patient $e $x)
(Implication (Goal $e $x) (Patient $e $x))

;; [pooled role]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.888   shared clusters: 5 e.g. {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {place, places, easy, place, full, place}
;; A: (Goal $e $x)
;; B: (Holder $e $x)
(Implication (Holder $e $x) (Goal $e $x))

;; [pooled role]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.89   shared clusters: 7 e.g. {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …}
;; A: (Agent $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Agent $e $x))

;; [pooled role]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.891   shared clusters: 21 e.g. {door, back door, door, open, door, unlocked, …} {table} {house, home, comfortable, house, houses, …}
;; A: (Location $e $x)
;; B: (Patient $e $x)
(Implication (Location $e $x) (Patient $e $x))

;; [pooled role]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.892   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {author, writer, novelist} {food, eat}
;; A: (Holder $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Holder $e $x))

;; [pooled role]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.895   shared clusters: 4 e.g. {city, town, cities, town, unknown, …} {place, places, easy, place, full, place} {room, changing room, rooms}
;; A: (Holder $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Holder $e $x))

;; [pooled role]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.896   shared clusters: 12 e.g. {thing, things, stuff, practice, thing} {talk, conversation, discussion} {computer, machine}
;; A: (Theme $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Theme $e $x))

;; [pooled role]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.897   shared clusters: 3 e.g. {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (Experiencer $e $x)
(Implication (Beneficiary $e $x) (Experiencer $e $x))

;; [pooled role]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.897   shared clusters: 3 e.g. {use, well, direct, do, …} {together, come together} {effective, affect, effect, effectively}
;; A: (Manner $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Manner $e $x))

;; [pooled role]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.898   shared clusters: 12 e.g. {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (Experiencer $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Experiencer $e $x))

;; [pooled role]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.9   shared clusters: 29 e.g. {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {station, Springfield Station}
;; A: (Location $e $x)
;; B: (Theme $e $x)
(Implication (Location $e $x) (Theme $e $x))

;; [pooled role]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.902   shared clusters: 6 e.g. {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (Experiencer $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Experiencer $e $x))

;; [pooled role]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.903   shared clusters: 17 e.g. {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Baltimore, Boston, San Francisco, Springfield}
;; A: (Goal $e $x)
;; B: (Theme $e $x)
(Implication (Goal $e $x) (Theme $e $x))

;; [pooled role]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.903   shared clusters: 16 e.g. {view, views, common, view, public, view, …} {food, eat} {cave, hole, lair, burrow}
;; A: (Source $e $x)
;; B: (Theme $e $x)
(Implication (Source $e $x) (Theme $e $x))

;; [pooled role]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.904   shared clusters: 15 e.g. {house, home, comfortable, house, houses, …} {Europe, Western Europe} {Kazakhstan, North Korea}
;; A: (Experiencer $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Experiencer $e $x))

;; [pooled role]  As ~ Recipient   n 15 / 29   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.906   shared clusters: 1 e.g. {Peter, Paul, Paulus}
;; A: (As $e $x)
;; B: (Recipient $e $x)
(Implication (As $e $x) (Recipient $e $x))

;; [pooled role]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.906   shared clusters: 4 e.g. {late, later, let, last, …} {immediately, instantly, next instant, right away} {former, back, early, backward, …}
;; A: (Manner $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Manner $e $x))

;; [pooled role]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.907   shared clusters: 7 e.g. {city, town, cities, town, unknown, …} {house, home, comfortable, house, houses, …} {place, places, easy, place, full, place}
;; A: (Holder $e $x)
;; B: (Location $e $x)
(Implication (Holder $e $x) (Location $e $x))

;; [pooled role]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.912   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Stimulus $e $x)
(Implication (Beneficiary $e $x) (Stimulus $e $x))

;; [pooled role]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.913   shared clusters: 3 e.g. {city, town, cities, town, unknown, …} {Jessica, Linda, Beth, Katherine, …} {class, classroom}
;; A: (Goal $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Goal $e $x))

;; [pooled role]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.913   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Recipient $e $x)
;; B: (Stimulus $e $x)
(Implication (Recipient $e $x) (Stimulus $e $x))

;; [pooled role]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.913   shared clusters: 7 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Recipient $e $x)
;; B: (Theme $e $x)
(Implication (Recipient $e $x) (Theme $e $x))

;; [pooled role]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.914   shared clusters: 1 e.g. {Karen, Kalman, Kerr, Ken}
;; A: (CoAgent $e $x)
;; B: (Holder $e $x)
(Implication (CoAgent $e $x) (Holder $e $x))

;; [pooled role]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.915   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Manner $e $x)
(Implication (As $e $x) (Manner $e $x))

;; [pooled role]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; JSD: 0.916   shared clusters: 7 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {Peter, Paul, Paulus} {girl, girls, girl, little}
;; A: (Agent $e $x)
;; B: (As $e $x)
(Implication (As $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.916   shared clusters: 18 e.g. {Jessica, Linda, Beth, Katherine, …} {house, home, comfortable, house, houses, …} {sleep, bed}
;; A: (Agent $e $x)
;; B: (Goal $e $x)
(Implication (Goal $e $x) (Agent $e $x))

;; [pooled role]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.916   shared clusters: 9 e.g. {tree, trees, treetop} {room, changing room, rooms} {city, town, cities, town, unknown, …}
;; A: (Patient $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Patient $e $x))

;; [pooled role]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.918   shared clusters: 4 e.g. {sleep, bed} {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
;; A: (Goal $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Goal $e $x))

;; [pooled role]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.918   shared clusters: 10 e.g. {bad, bad, relationship, bad, matter, bad, problem} {snow, cold, frost, snowstorm, …} {indigenous, indigenous, people, native american, indigenous american, …}
;; A: (Patient $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Patient $e $x))

;; [pooled role]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.92   shared clusters: 4 e.g. {Jessica, Linda, Beth, Katherine, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …} {cat, cats}
;; A: (CoAgent $e $x)
;; B: (Experiencer $e $x)
(Implication (CoAgent $e $x) (Experiencer $e $x))

;; [pooled role]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.922   shared clusters: 5 e.g. {thing, things, stuff, practice, thing} {knock, kick, kick out} {Jessica, Linda, Beth, Katherine, …}
;; A: (Patient $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Patient $e $x))

;; [pooled role]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.928   shared clusters: 5 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Patient $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Patient $e $x))

;; [pooled role]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.932   shared clusters: 22 e.g. {here, host} {Santiago, Manila, Havana} {France, French Dahomey}
;; A: (Agent $e $x)
;; B: (Location $e $x)
(Implication (Location $e $x) (Agent $e $x))

;; [pooled role]  Beneficiary ~ CoAgent   n 14 / 16   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 0.933   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (CoAgent $e $x)
(Implication (Beneficiary $e $x) (CoAgent $e $x))

;; [pooled role]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.933   shared clusters: 8 e.g. {work, job, work through, hard, work} {portray, portrait, portrayal} {ship, british ship, israeli military ship, merchant ship, …}
;; A: (For $e $x)
;; B: (Theme $e $x)
(Implication (For $e $x) (Theme $e $x))

;; [pooled role]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.933   shared clusters: 5 e.g. {thing, things, stuff, practice, thing} {computer, machine} {bake, bakery, bread}
;; A: (Patient $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Patient $e $x))

;; [pooled role]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.934   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Recipient $e $x)
(Implication (CoAgent $e $x) (Recipient $e $x))

;; [pooled role]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.935   shared clusters: 3 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Theme $e $x)
(Implication (Beneficiary $e $x) (Theme $e $x))

;; [pooled role]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.936   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {repeat, repetition}
;; A: (Holder $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Holder $e $x))

;; [pooled role]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.937   shared clusters: 6 e.g. {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Agent $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Agent $e $x))

;; [pooled role]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.939   shared clusters: 3 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (Beneficiary $e $x)
;; B: (Patient $e $x)
(Implication (Beneficiary $e $x) (Patient $e $x))

;; [pooled role]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.94   shared clusters: 1 e.g. {thing, things, stuff, practice, thing}
;; A: (Stimulus $e $x)
;; B: (To $e $x)
(Implication (Stimulus $e $x) (To $e $x))

;; [pooled role]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.944   shared clusters: 6 e.g. {weather, bad, weather} {silent, silence, forest, silent} {action, activity, active, act, …}
;; A: (Experiencer $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Experiencer $e $x))

;; [pooled role]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.945   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Result $e $x)
(Implication (As $e $x) (Result $e $x))

;; [pooled role]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.945   shared clusters: 6 e.g. {place, places, easy, place, full, place} {view, views, common, view, public, view, …} {ceiling, black, ceiling}
;; A: (Experiencer $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Experiencer $e $x))

;; [pooled role]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.948   shared clusters: 3 e.g. {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Jessica, Linda, Beth, Katherine, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;; A: (CoAgent $e $x)
;; B: (Theme $e $x)
(Implication (CoAgent $e $x) (Theme $e $x))

;; [pooled role]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.948   shared clusters: 6 e.g. {community, society} {weather, bad, weather} {silent, silence, forest, silent}
;; A: (In $e $x)
;; B: (Patient $e $x)
(Implication (In $e $x) (Patient $e $x))

;; [pooled role]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.95   shared clusters: 3 e.g. {use, well, direct, do, …} {former, back, early, backward, …} {happiness, happy, happily, joy}
;; A: (Goal $e $x)
;; B: (Manner $e $x)
(Implication (Goal $e $x) (Manner $e $x))

;; [pooled role]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.95   shared clusters: 2 e.g. {road, way, lane, motorway, …} {food, eat}
;; A: (Instrument $e $x)
;; B: (Source $e $x)
(Implication (Instrument $e $x) (Source $e $x))

;; [pooled role]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.951   shared clusters: 2 e.g. {sleep, bed} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Goal $e $x)
(Implication (For $e $x) (Goal $e $x))

;; [pooled role]  For ~ Result   n 39 / 43   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.951   shared clusters: 2 e.g. {beautiful, beauty, gorgeous, pretty} {sleep, bed}
;; A: (For $e $x)
;; B: (Result $e $x)
(Implication (For $e $x) (Result $e $x))

;; [pooled role]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.955   shared clusters: 6 e.g. {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {ticket, issue, bug, tickets}
;; A: (Instrument $e $x)
;; B: (Patient $e $x)
(Implication (Instrument $e $x) (Patient $e $x))

;; [pooled role]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.956   shared clusters: 3 e.g. {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
;; A: (Experiencer $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Experiencer $e $x))

;; [pooled role]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.957   shared clusters: 9 e.g. {Santiago, Manila, Havana} {plane, flight, aeroplane, airplane, …} {here, host}
;; A: (Agent $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Agent $e $x))

;; [pooled role]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.957   shared clusters: 3 e.g. {road, way, lane, motorway, …} {community, society} {field, fields}
;; A: (Goal $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Goal $e $x))

;; [pooled role]  Before ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.958   shared clusters: 1 e.g. {break out, bang, break, burst, …}
;; A: (Before $e $x)
;; B: (Stimulus $e $x)
(Implication (Before $e $x) (Stimulus $e $x))

;; [pooled role]  CoAgent ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.958   shared clusters: 1 e.g. {bicycle, rider, bike, cyclist, …}
;; A: (CoAgent $e $x)
;; B: (Instrument $e $x)
(Implication (CoAgent $e $x) (Instrument $e $x))

;; [pooled role]  CoAgent ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.958   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Stimulus $e $x)
(Implication (CoAgent $e $x) (Stimulus $e $x))

;; [pooled role]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.959   shared clusters: 3 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {caretaker, keeper} {girl, girls, girl, little}
;; A: (As $e $x)
;; B: (Experiencer $e $x)
(Implication (As $e $x) (Experiencer $e $x))

;; [pooled role]  Holder ~ Recipient   n 48 / 29   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.962   shared clusters: 1 e.g. {city, town, cities, town, unknown, …}
;; A: (Holder $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Holder $e $x))

;; [pooled role]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.962   shared clusters: 4 e.g. {use, well, direct, do, …} {world, international, global, internationally} {dark, darkness, dimly}
;; A: (Location $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Location $e $x))

;; [pooled role]  Recipient ~ Source   n 29 / 47   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.962   shared clusters: 1 e.g. {city, town, cities, town, unknown, …}
;; A: (Recipient $e $x)
;; B: (Source $e $x)
(Implication (Recipient $e $x) (Source $e $x))

;; [pooled role]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.963   shared clusters: 5 e.g. {name} {girl, girls, girl, little} {opportunity, golden opportunity}
;; A: (As $e $x)
;; B: (Theme $e $x)
(Implication (As $e $x) (Theme $e $x))

;; [pooled role]  Beneficiary ~ Goal   n 14 / 93   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.964   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Beneficiary $e $x)
;; B: (Goal $e $x)
(Implication (Beneficiary $e $x) (Goal $e $x))

;; [pooled role]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.964   shared clusters: 5 e.g. {widespread, widely, wide, attention, widespread, …} {truth, fact, true, really, …} {poor, man, poor, poorly}
;; A: (Experiencer $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Experiencer $e $x))

;; [pooled role]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.964   shared clusters: 2 e.g. {city, town, cities, town, unknown, …} {local, local level, locals}
;; A: (Location $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Location $e $x))

;; [pooled role]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.965   shared clusters: 6 e.g. {Mark, marker, markers} {snow, cold, frost, snowstorm, …} {train}
;; A: (Agent $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Agent $e $x))

;; [pooled role]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.965   shared clusters: 2 e.g. {around, ring, round} {happiness, happy, happily, joy}
;; A: (For $e $x)
;; B: (Manner $e $x)
(Implication (For $e $x) (Manner $e $x))

;; [pooled role]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.965   shared clusters: 7 e.g. {understand, misunderstand} {truth, fact, true, really, …} {action, activity, active, act, …}
;; A: (In $e $x)
;; B: (Theme $e $x)
(Implication (In $e $x) (Theme $e $x))

;; [pooled role]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.965   shared clusters: 5 e.g. {food, eat} {drum, snare, drums} {ticket, issue, bug, tickets}
;; A: (Instrument $e $x)
;; B: (Theme $e $x)
(Implication (Instrument $e $x) (Theme $e $x))

;; [pooled role]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.965   shared clusters: 7 e.g. {sleep, bed} {use, well, direct, do, …} {cheap, inexpensive, low, price}
;; A: (Result $e $x)
;; B: (Theme $e $x)
(Implication (Result $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 0.966   shared clusters: 6 e.g. {bus, bus ride} {cook, recipe} {ship, british ship, israeli military ship, merchant ship, …}
;; A: (Agent $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Agent $e $x))

;; [pooled role]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.966   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Goal $e $x)
(Implication (CoAgent $e $x) (Goal $e $x))

;; [pooled role]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.966   shared clusters: 2 e.g. {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …}
;; A: (Goal $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Goal $e $x))

;; [pooled role]  CoAgent ~ Location   n 16 / 210   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.967   shared clusters: 2 e.g. {Spain, Italy} {sidewalk, pedestrian}
;; A: (CoAgent $e $x)
;; B: (Location $e $x)
(Implication (CoAgent $e $x) (Location $e $x))

;; [pooled role]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 0.967   shared clusters: 3 e.g. {flag, philippine flag, inverted, philippine flag} {cake, pastry, pie, hot cake, …} {spider, huge, spider, spider, vegetarian, spiders}
;; A: (Experiencer $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Experiencer $e $x))

;; [pooled role]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.968   shared clusters: 5 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {crow, eagle, stork, caw} {snow, cold, frost, snowstorm, …}
;; A: (Agent $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Agent $e $x))

;; [pooled role]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.968   shared clusters: 1 e.g. {crop, rice crop, corn, crops}
;; A: (Instrument $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Instrument $e $x))

;; [pooled role]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 0.97   shared clusters: 4 e.g. {dung beetle, insect, centipede, centipedes, …} {crocodile, snake} {imprison, inmate, jail, prison}
;; A: (Agent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Agent $e $x))

;; [pooled role]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.97   shared clusters: 1 e.g. {silent, silence, forest, silent}
;; A: (In $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (In $e $x))

;; [pooled role]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.97   shared clusters: 6 e.g. {night, tonight, night shift, midnight, …} {storm, soon, thunder} {hour, hour, late, hours}
;; A: (Patient $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Patient $e $x))

;; [pooled role]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.971   shared clusters: 1 e.g. {food, eat}
;; A: (Instrument $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Instrument $e $x))

;; [pooled role]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.972   shared clusters: 3 e.g. {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
;; A: (In $e $x)
;; B: (Location $e $x)
(Implication (In $e $x) (Location $e $x))

;; [pooled role]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.974   shared clusters: 3 e.g. {train} {road, way, lane, motorway, …} {crop, rice crop, corn, crops}
;; A: (Experiencer $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Experiencer $e $x))

;; [pooled role]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.974   shared clusters: 1 e.g. {snow, cold, frost, snowstorm, …}
;; A: (Instrument $e $x)
;; B: (Result $e $x)
(Implication (Instrument $e $x) (Result $e $x))

;; [pooled role]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 0.975   shared clusters: 3 e.g. {happiness, happy, happily, joy} {general, generalization, general purpose, easy, generalization} {nothing, no, almost nothing, empty, …}
;; A: (Experiencer $e $x)
;; B: (For $e $x)
(Implication (For $e $x) (Experiencer $e $x))

;; [pooled role]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.975   shared clusters: 1 e.g. {Jessica, Linda, Beth, Katherine, …}
;; A: (Goal $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Goal $e $x))

;; [pooled role]  Holder ~ Instrument   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Holder $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (Holder $e $x))

;; [pooled role]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
;; A: (Source $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Source $e $x))

;; [pooled role]  In ~ Instrument   n 50 / 34   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.976   shared clusters: 1 e.g. {road, way, lane, motorway, …}
;; A: (In $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (In $e $x))

;; [pooled role]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.976   shared clusters: 1 e.g. {poetry}
;; A: (In $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (In $e $x))

;; [pooled role]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.976   shared clusters: 4 e.g. {use, well, direct, do, …} {truth, fact, true, really, …} {widespread, widely, wide, attention, widespread, …}
;; A: (Manner $e $x)
;; B: (Theme $e $x)
(Implication (Manner $e $x) (Theme $e $x))

;; [pooled role]  As ~ Goal   n 15 / 93   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.977   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Goal $e $x)
(Implication (As $e $x) (Goal $e $x))

;; [pooled role]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.977   shared clusters: 3 e.g. {Karen, Kalman, Kerr, Ken} {family, family business, families} {Jessica, Linda, Beth, Katherine, …}
;; A: (CoAgent $e $x)
;; B: (Patient $e $x)
(Implication (CoAgent $e $x) (Patient $e $x))

;; [pooled role]  For ~ In   n 39 / 50   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.977   shared clusters: 1 e.g. {nothing, no, almost nothing, empty, …}
;; A: (For $e $x)
;; B: (In $e $x)
(Implication (For $e $x) (In $e $x))

;; [pooled role]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.977   shared clusters: 1 e.g. {truth, fact, true, really, …}
;; A: (In $e $x)
;; B: (Manner $e $x)
(Implication (In $e $x) (Manner $e $x))

;; [pooled role]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.978   shared clusters: 1 e.g. {escape, exit}
;; A: (Before $e $x)
;; B: (Goal $e $x)
(Implication (Before $e $x) (Goal $e $x))

;; [pooled role]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.978   shared clusters: 4 e.g. {liftoff, lift, lift, other} {ship, british ship, israeli military ship, merchant ship, …} {call, telephone call, call for}
;; A: (For $e $x)
;; B: (Patient $e $x)
(Implication (For $e $x) (Patient $e $x))

;; [pooled role]  Location ~ To   n 210 / 46   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.978   shared clusters: 2 e.g. {talk, conversation, discussion} {shore, beach, coast, shoreline}
;; A: (Location $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Location $e $x))

;; [pooled role]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.978   shared clusters: 1 e.g. {bat}
;; A: (Result $e $x)
;; B: (Source $e $x)
(Implication (Result $e $x) (Source $e $x))

;; [pooled role]  Experiencer ~ Time   n 261 / 107   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.979   shared clusters: 2 e.g. {night, tonight, night shift, midnight, …} {day, days, days, short, one day}
;; A: (Experiencer $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Experiencer $e $x))

;; [pooled role]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.979   shared clusters: 1 e.g. {road, way, lane, motorway, …}
;; A: (In $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (In $e $x))

;; [pooled role]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.979   shared clusters: 2 e.g. {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
;; A: (Location $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Location $e $x))

;; [pooled role]  Holder ~ In   n 48 / 50   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.98   shared clusters: 1 e.g. {weather, bad, weather}
;; A: (Holder $e $x)
;; B: (In $e $x)
(Implication (Holder $e $x) (In $e $x))

;; [pooled role]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.98   shared clusters: 2 e.g. {snow, cold, frost, snowstorm, …} {plant, bushes, plants}
;; A: (Instrument $e $x)
;; B: (Location $e $x)
(Implication (Instrument $e $x) (Location $e $x))

;; [pooled role]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.981   shared clusters: 3 e.g. {take, take over, take off} {expand, spread, unfold, stretch} {repair, repairs}
;; A: (Before $e $x)
;; B: (Theme $e $x)
(Implication (Before $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.985   shared clusters: 4 e.g. {community, society} {life, life experience} {truth, fact, true, really, …}
;; A: (Agent $e $x)
;; B: (In $e $x)
(Implication (In $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.985   shared clusters: 3 e.g. {hurricane, typhoon, hurricane season} {storm, soon, thunder} {spring}
;; A: (Agent $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Agent $e $x))

;; [pooled role]  Manner ~ Stimulus   n 115 / 34   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.985   shared clusters: 1 e.g. {difficult, hard, difficulty, harder}
;; A: (Manner $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Manner $e $x))

;; [pooled role]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.986   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {name}
;; A: (As $e $x)
;; B: (Patient $e $x)
(Implication (As $e $x) (Patient $e $x))

;; [pooled role]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {former, back, early, backward, …}
;; A: (Goal $e $x)
;; B: (Time $e $x)
(Implication (Goal $e $x) (Time $e $x))

;; [pooled role]  Manner ~ Patient   n 115 / 455   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.986   shared clusters: 3 e.g. {whole, full, entire, fully, …} {poor, man, poor, poorly} {world, international, global, internationally}
;; A: (Manner $e $x)
;; B: (Patient $e $x)
(Implication (Manner $e $x) (Patient $e $x))

;; [pooled role]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {point, point out, indicate, mention}
;; A: (Source $e $x)
;; B: (Time $e $x)
(Implication (Source $e $x) (Time $e $x))

;; [pooled role]  As ~ Location   n 15 / 210   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.987   shared clusters: 1 e.g. {use, well, direct, do, …}
;; A: (As $e $x)
;; B: (Location $e $x)
(Implication (As $e $x) (Location $e $x))

;; [pooled role]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.988   shared clusters: 2 e.g. {imprison, inmate, jail, prison} {gold coin, gold, gold coins}
;; A: (Like $e $x)
;; B: (Theme $e $x)
(Implication (Like $e $x) (Theme $e $x))

;; [pooled role]  Location ~ Time   n 210 / 107   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.989   shared clusters: 1 e.g. {morning, dawn, early morning, morning light, …}
;; A: (Location $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Location $e $x))

;; [pooled role]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.989   shared clusters: 2 e.g. {morning, dawn, early morning, morning light, …} {day, days, days, short, one day}
;; A: (Theme $e $x)
;; B: (Time $e $x)
(Implication (Time $e $x) (Theme $e $x))

;; [pooled role]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.992   shared clusters: 2 e.g. {use, well, direct, do, …} {truth, fact, true, really, …}
;; A: (Agent $e $x)
;; B: (Manner $e $x)
(Implication (Manner $e $x) (Agent $e $x))

;; [pooled role]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 0.996   shared clusters: 1 e.g. {break out, bang, break, burst, …}
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
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
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
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
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
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (In $e $x)
(Implication (As $e $x) (In $e $x))

;; [pooled role]  As ~ Instrument   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Instrument $e $x)
(Implication (As $e $x) (Instrument $e $x))

;; [pooled role]  As ~ Like   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (As $e $x))

;; [pooled role]  As ~ Source   n 15 / 47   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (As $e $x)
;; B: (Source $e $x)
(Implication (As $e $x) (Source $e $x))

;; [pooled role]  As ~ Stimulus   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
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
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
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
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Experiencer $e $x)
(Implication (Before $e $x) (Experiencer $e $x))

;; [pooled role]  Before ~ For   n 16 / 39   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
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
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (In $e $x)
(Implication (Before $e $x) (In $e $x))

;; [pooled role]  Before ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Instrument $e $x)
(Implication (Before $e $x) (Instrument $e $x))

;; [pooled role]  Before ~ Like   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
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
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Patient $e $x)
(Implication (Before $e $x) (Patient $e $x))

;; [pooled role]  Before ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Recipient $e $x)
(Implication (Before $e $x) (Recipient $e $x))

;; [pooled role]  Before ~ Result   n 16 / 43   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Result $e $x)
(Implication (Before $e $x) (Result $e $x))

;; [pooled role]  Before ~ Source   n 16 / 47   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (Source $e $x)
(Implication (Before $e $x) (Source $e $x))

;; [pooled role]  Before ~ To   n 16 / 46   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Before $e $x)
;; B: (To $e $x)
(Implication (Before $e $x) (To $e $x))

;; [pooled role]  Beneficiary ~ For   n 14 / 39   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (For $e $x)
(Implication (Beneficiary $e $x) (For $e $x))

;; [pooled role]  Beneficiary ~ Holder   n 14 / 48   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Holder $e $x)
(Implication (Beneficiary $e $x) (Holder $e $x))

;; [pooled role]  Beneficiary ~ In   n 14 / 50   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (In $e $x)
(Implication (Beneficiary $e $x) (In $e $x))

;; [pooled role]  Beneficiary ~ Instrument   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Instrument $e $x)
(Implication (Beneficiary $e $x) (Instrument $e $x))

;; [pooled role]  Beneficiary ~ Like   n 14 / 14   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Beneficiary $e $x))

;; [pooled role]  Beneficiary ~ Location   n 14 / 210   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Location $e $x)
(Implication (Beneficiary $e $x) (Location $e $x))

;; [pooled role]  Beneficiary ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Manner $e $x)
(Implication (Beneficiary $e $x) (Manner $e $x))

;; [pooled role]  Beneficiary ~ Result   n 14 / 43   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Result $e $x)
(Implication (Beneficiary $e $x) (Result $e $x))

;; [pooled role]  Beneficiary ~ Source   n 14 / 47   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Source $e $x)
(Implication (Beneficiary $e $x) (Source $e $x))

;; [pooled role]  Beneficiary ~ Time   n 14 / 107   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (Time $e $x)
(Implication (Beneficiary $e $x) (Time $e $x))

;; [pooled role]  Beneficiary ~ To   n 14 / 46   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Beneficiary $e $x)
;; B: (To $e $x)
(Implication (Beneficiary $e $x) (To $e $x))

;; [pooled role]  CoAgent ~ For   n 16 / 39   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (For $e $x)
(Implication (CoAgent $e $x) (For $e $x))

;; [pooled role]  CoAgent ~ In   n 16 / 50   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (In $e $x)
(Implication (CoAgent $e $x) (In $e $x))

;; [pooled role]  CoAgent ~ Like   n 16 / 14   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (CoAgent $e $x))

;; [pooled role]  CoAgent ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Manner $e $x)
(Implication (CoAgent $e $x) (Manner $e $x))

;; [pooled role]  CoAgent ~ Result   n 16 / 43   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Result $e $x)
(Implication (CoAgent $e $x) (Result $e $x))

;; [pooled role]  CoAgent ~ Source   n 16 / 47   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (CoAgent $e $x)
;; B: (Source $e $x)
(Implication (CoAgent $e $x) (Source $e $x))

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

;; [pooled role]  For ~ Holder   n 39 / 48   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Holder $e $x)
(Implication (For $e $x) (Holder $e $x))

;; [pooled role]  For ~ Instrument   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Instrument $e $x)
(Implication (Instrument $e $x) (For $e $x))

;; [pooled role]  For ~ Like   n 39 / 14   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (For $e $x))

;; [pooled role]  For ~ Location   n 39 / 210   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Location $e $x)
(Implication (For $e $x) (Location $e $x))

;; [pooled role]  For ~ Recipient   n 39 / 29   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (For $e $x))

;; [pooled role]  For ~ Source   n 39 / 47   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Source $e $x)
(Implication (For $e $x) (Source $e $x))

;; [pooled role]  For ~ Stimulus   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (For $e $x))

;; [pooled role]  For ~ Time   n 39 / 107   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (Time $e $x)
(Implication (For $e $x) (Time $e $x))

;; [pooled role]  For ~ To   n 39 / 46   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (For $e $x)
;; B: (To $e $x)
(Implication (For $e $x) (To $e $x))

;; [pooled role]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Goal $e $x))

;; [pooled role]  Goal ~ To   n 93 / 46   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Goal $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Goal $e $x))

;; [pooled role]  Holder ~ Like   n 48 / 14   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
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

;; [pooled role]  Holder ~ Result   n 48 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Result $e $x)
(Implication (Result $e $x) (Holder $e $x))

;; [pooled role]  Holder ~ Time   n 48 / 107   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Holder $e $x)
;; B: (Time $e $x)
(Implication (Holder $e $x) (Time $e $x))

;; [pooled role]  In ~ Like   n 50 / 14   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (In $e $x))

;; [pooled role]  In ~ Recipient   n 50 / 29   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (In $e $x))

;; [pooled role]  In ~ Time   n 50 / 107   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (Time $e $x)
(Implication (In $e $x) (Time $e $x))

;; [pooled role]  In ~ To   n 50 / 46   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (In $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (In $e $x))

;; [pooled role]  Instrument ~ Like   n 34 / 14   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (Like $e $x)
(Implication (Like $e $x) (Instrument $e $x))

;; [pooled role]  Instrument ~ Manner   n 34 / 115   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (Manner $e $x)
(Implication (Instrument $e $x) (Manner $e $x))

;; [pooled role]  Instrument ~ Time   n 34 / 107   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (Time $e $x)
(Implication (Instrument $e $x) (Time $e $x))

;; [pooled role]  Instrument ~ To   n 34 / 46   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Instrument $e $x)
;; B: (To $e $x)
(Implication (Instrument $e $x) (To $e $x))

;; [pooled role]  Like ~ Location   n 14 / 210   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Location $e $x)
(Implication (Like $e $x) (Location $e $x))

;; [pooled role]  Like ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Manner $e $x)
(Implication (Like $e $x) (Manner $e $x))

;; [pooled role]  Like ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Patient $e $x)
(Implication (Like $e $x) (Patient $e $x))

;; [pooled role]  Like ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Recipient $e $x)
(Implication (Like $e $x) (Recipient $e $x))

;; [pooled role]  Like ~ Result   n 14 / 43   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Result $e $x)
(Implication (Like $e $x) (Result $e $x))

;; [pooled role]  Like ~ Source   n 14 / 47   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Source $e $x)
(Implication (Like $e $x) (Source $e $x))

;; [pooled role]  Like ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Stimulus $e $x)
(Implication (Like $e $x) (Stimulus $e $x))

;; [pooled role]  Like ~ Time   n 14 / 107   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (Time $e $x)
(Implication (Like $e $x) (Time $e $x))

;; [pooled role]  Like ~ To   n 14 / 46   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Like $e $x)
;; B: (To $e $x)
(Implication (Like $e $x) (To $e $x))

;; [pooled role]  Location ~ Stimulus   n 210 / 34   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
;; A: (Location $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Location $e $x))

;; [pooled role]  Manner ~ Recipient   n 115 / 29   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (Recipient $e $x)
(Implication (Recipient $e $x) (Manner $e $x))

;; [pooled role]  Manner ~ Source   n 115 / 47   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (Source $e $x)
(Implication (Source $e $x) (Manner $e $x))

;; [pooled role]  Manner ~ To   n 115 / 46   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Manner $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Manner $e $x))

;; [pooled role]  Recipient ~ Result   n 29 / 43   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (Result $e $x)
(Implication (Recipient $e $x) (Result $e $x))

;; [pooled role]  Recipient ~ Time   n 29 / 107   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (Time $e $x)
(Implication (Recipient $e $x) (Time $e $x))

;; [pooled role]  Recipient ~ To   n 29 / 46   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Recipient $e $x)
;; B: (To $e $x)
(Implication (Recipient $e $x) (To $e $x))

;; [pooled role]  Result ~ Stimulus   n 43 / 34   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (Stimulus $e $x)
(Implication (Stimulus $e $x) (Result $e $x))

;; [pooled role]  Result ~ Time   n 43 / 107   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (Time $e $x)
(Implication (Result $e $x) (Time $e $x))

;; [pooled role]  Result ~ To   n 43 / 46   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Result $e $x)
;; B: (To $e $x)
(Implication (Result $e $x) (To $e $x))

;; [pooled role]  Source ~ To   n 47 / 46   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
;; A: (Source $e $x)
;; B: (To $e $x)
(Implication (To $e $x) (Source $e $x))

;; [pooled role]  Stimulus ~ Time   n 34 / 107   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
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

;; ==================== SLOT PAIRS: 3 pass the gate (event 3, entity 0); 134 pairs listed = every pair with >= 2 shared clusters (event 132, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's 'go to.Agent' reading: one (class, role) slot against every other slot of its centre kind)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 sleep) (Agent $e0 $x1))
(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (And (Member $e0 sleep) (Patient $e0 $x1)))

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000259
;; JSD: 0.23   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 appear) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  appear.Agent ~ replace.Agent   n 6 / 4   gate: PASS
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; JSD: 0.251   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: FAIL
;; A fillers: host, industrialization, whigs   e.g. tierC-000087 tierC-000088
;; B fillers: guests, industrialization, whigs   e.g. tierB-001868 tierC-000088
;; JSD: 0.333   shared clusters: 2 e.g. {industrialization, industrial output} {whig, whigs}
;; A: (And (Member $e0 welcome) (Agent $e0 $x1))
;; B: (And (Member $e0 welcome) (Theme $e0 $x1))
(Implication (And (Member $e0 welcome) (Theme $e0 $x1)) (And (Member $e0 welcome) (Agent $e0 $x1)))

;; [different class and role]  kill.Patient ~ spend.Agent   n 11 / 4   gate: FAIL
;; A fillers: people ×4, person ×2, fox, gazelle, soldier, soldiers   e.g. tierB-001197 tierB-000393
;; B fillers: person ×2, May, giraffes   e.g. tierB-001146 tierC-000047
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
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001156 tierB-000827
;; JSD: 0.357   shared clusters: 2 e.g. {sister, sisters} {person, people}
;; A: (And (Member $e0 accompany) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  appear.Agent ~ replace.Theme   n 6 / 4   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; JSD: 0.368   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  appear.Agent ~ write.Agent   n 6 / 8   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; JSD: 0.368   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
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

;; [same class, different role]  replace.Agent ~ replace.Theme   n 4 / 4   gate: FAIL
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; JSD: 0.406   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  replace.Agent ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; JSD: 0.406   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  sleep.Agent ~ watch.Agent   n 3 / 5   gate: FAIL
;; A fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; JSD: 0.408   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 sleep) (Agent $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  die.Patient ~ watch.Agent   n 4 / 5   gate: FAIL
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; JSD: 0.424   shared clusters: 2 e.g. {person, people} {family, family business, families}
;; A: (And (Member $e0 die) (Patient $e0 $x1))
;; B: (And (Member $e0 watch) (Agent $e0 $x1))
(Implication (And (Member $e0 die) (Patient $e0 $x1)) (And (Member $e0 die) (Agent $e0 $x1)))

;; [same class, different role]  become.Patient ~ become.Result   n 11 / 8   gate: FAIL
;; A fillers: bad, relationship ×2, indigenous, people ×2, Lady Ashton, conservative, revolutionary, discipline, lax, earth, red   e.g. tierC-000241 tierC-000242
;; B fillers: bad ×2, alarmed, conservative, indigenous, inomaru, lax   e.g. tierB-001817 tierC-000237
;; JSD: 0.426   shared clusters: 4 e.g. {bad, bad, relationship, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {conservative, conservative, revolutionary} {inomaru, inomaru, person}
;; A: (And (Member $e0 become) (Patient $e0 $x1))
;; B: (And (Member $e0 become) (Result $e0 $x1))
(Implication (And (Member $e0 become) (Result $e0 $x1)) (And (Member $e0 become) (Patient $e0 $x1)))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000247
;; JSD: 0.449   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
;; A: (And (Member $e0 portray) (Agent $e0 $x1))
;; B: (And (Member $e0 portray) (Theme $e0 $x1))
(Implication (And (Member $e0 portray) (Theme $e0 $x1)) (And (Member $e0 portray) (Agent $e0 $x1)))

;; [same role, different class]  buy.Agent ~ speak.Agent   n 3 / 8   gate: FAIL
;; A fillers: Keike ×2, Regis   e.g. tierB-000367 tierB-001690
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, men   e.g. tierC-000094 tierC-000023
;; JSD: 0.464   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis}
;; A: (And (Member $e0 buy) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; JSD: 0.465   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Rima}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ try.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000659
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000487
;; JSD: 0.475   shared clusters: 4 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …} {David, William, James} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000128 tierC-000050
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierB-001156
;; JSD: 0.487   shared clusters: 2 e.g. {person, people} {sister, sisters}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  replace.Theme ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; JSD: 0.5   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 replace) (Theme $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierC-000243 tierC-000244
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierB-000706 tierC-000279
;; JSD: 0.503   shared clusters: 2 e.g. {Couper} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Agent $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Agent $e0 $x1)) (And (Member $e0 find) (Theme $e0 $x1)))

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settlers ×2, Paul, indigenous americans, native americans, writer   e.g. tierB-000728 tierB-000863
;; JSD: 0.517   shared clusters: 2 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers, french settler, french settlers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 create) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  bad.Experiencer ~ get.Patient   n 4 / 7   gate: FAIL
;; A fillers: bad, relationship ×2, bad, matter, bad, weather   e.g. tierB-001594 tierC-000241
;; B fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000748
;; JSD: 0.531   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {weather, bad, weather}
;; A: (And (Member $e0 bad) (Experiencer $e0 $x1))
;; B: (And (Member $e0 get) (Patient $e0 $x1))
(Implication (And (Member $e0 bad) (Experiencer $e0 $x1)) (And (Member $e0 bad) (Patient $e0 $x1)))

;; [different class and role]  bear.Patient ~ study.Agent   n 6 / 12   gate: FAIL
;; A fillers: person ×3, Tobias, Tycho Brahe, man, poor   e.g. tierB-001812 tierC-000199
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000292 tierC-000253
;; JSD: 0.541   shared clusters: 2 e.g. {person, people} {Nicolaus Copernicus, Tycho Brahe}
;; A: (And (Member $e0 bear) (Patient $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 bear) (Patient $e0 $x1)) (And (Member $e0 bear) (Agent $e0 $x1)))

;; [same role, different class]  appear.Agent ~ build.Agent   n 6 / 14   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000259 tierC-000260
;; B fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; JSD: 0.545   shared clusters: 2 e.g. {person, people} {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;; A: (And (Member $e0 appear) (Agent $e0 $x1))
;; B: (And (Member $e0 build) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, cyanide, harmless, trace, destined, film, syrian film, film, syrian film, insulin   e.g. tierC-000009 tierC-000092
;; JSD: 0.545   shared clusters: 2 e.g. {movie, film} {syrian film, film, syrian film, destined, film, syrian film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 produce) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (And (Member $e0 stop) (Experiencer $e0 $x1)))

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.557   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {David, William, James}
;; A: (And (Member $e0 give) (Agent $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 give) (Agent $e0 $x1)) (And (Member $e0 give) (Experiencer $e0 $x1)))

;; [different class and role]  study.Agent ~ succeed.Theme   n 12 / 3   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierC-000253
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000100
;; JSD: 0.562   shared clusters: 2 e.g. {person, people} {Jessica, Linda, Beth, Katherine, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
(Implication (And (Member $e0 succeed) (Theme $e0 $x1)) (And (Member $e0 succeed) (Agent $e0 $x1)))

;; [same role, different class]  build.Agent ~ replace.Agent   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000359 tierC-000360
;; JSD: 0.569   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000738
;; JSD: 0.57   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {girl, girls, girl, little}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.578   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Patient $e0 $x1)))

;; [different class and role]  find.Theme ~ get.Agent   n 10 / 6   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; JSD: 0.584   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 get) (Agent $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Theme $e0 $x1)))

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.595   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friends, novelist   e.g. tierB-000327 tierC-000209
;; JSD: 0.596   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Dan, Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.To ~ start.Theme   n 3 / 13   gate: FAIL
;; A fillers: talk ×2, see   e.g. tierC-000209 tierC-000210
;; B fillers: appear, chant, cry, disappear, feel, light headed, hear   e.g. tierB-001219 tierB-000465
;; JSD: 0.602   shared clusters: 2 e.g. {talk, conversation, discussion} {appear, see, display, show, …}
;; A: (And (Member $e0 go) (To $e0 $x1))
;; B: (And (Member $e0 start) (Theme $e0 $x1))
(Implication (And (Member $e0 go) (To $e0 $x1)) (And (Member $e0 go) (Theme $e0 $x1)))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001891
;; JSD: 0.602   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: birds, brown, dog, children, person   e.g. tierB-001973 tierB-000338
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001901 tierC-000127
;; JSD: 0.604   shared clusters: 2 e.g. {person, people} {bird, bird dropping, mother bird, birds}
;; A: (And (Member $e0 eat) (Agent $e0 $x1))
;; B: (And (Member $e0 sing) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000252 tierB-000987
;; JSD: 0.607   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people} {Michael, Marco, Marcus}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierC-000053 tierB-000940
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-001726 tierB-000987
;; JSD: 0.607   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people} {president, person, president}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ read.Agent   n 8 / 3   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; JSD: 0.613   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Experiencer $e0 $x1)))

;; [same role, different class]  enter.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000987 tierB-001102
;; JSD: 0.617   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  hear.Experiencer ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000756 tierB-000189
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; JSD: 0.625   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ leave.Agent   n 8 / 10   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000756
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.626   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [different class and role]  build.Agent ~ replace.Theme   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000100 tierC-000099
;; JSD: 0.628   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 replace) (Theme $e0 $x1))
(Implication (And (Member $e0 replace) (Theme $e0 $x1)) (And (Member $e0 replace) (Agent $e0 $x1)))

;; [same role, different class]  build.Agent ~ write.Agent   n 14 / 8   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000119 tierC-000120
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000297 tierC-000298
;; JSD: 0.628   shared clusters: 2 e.g. {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;; A: (And (Member $e0 build) (Agent $e0 $x1))
;; B: (And (Member $e0 write) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  study.Agent ~ take.Agent   n 12 / 9   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000987 tierB-001102
;; JSD: 0.635   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ walk.Agent   n 5 / 8   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.636   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Alexander} {Bailey}
;; A: (And (Member $e0 follow) (Agent $e0 $x1))
;; B: (And (Member $e0 succeed) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, traditions ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000076 tierC-000337
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Cowper, Henry Cole}
;; A: (And (Member $e0 follow) (Theme $e0 $x1))
;; B: (And (Member $e0 succeed) (Theme $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-001325
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000025
;; JSD: 0.639   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Elias, Tobias, Gabor, Gabriel}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001183
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001003
;; JSD: 0.639   shared clusters: 3 e.g. {cat, cats} {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ speak.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, men   e.g. tierB-000271 tierC-000094
;; JSD: 0.653   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 speak) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ walk.Agent   n 8 / 8   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000659 tierB-000695
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; JSD: 0.656   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Experiencer $e0 $x1)))

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plants   e.g. tierC-000227 tierC-000228
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000942
;; JSD: 0.661   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {cook, recipe}
;; A: (And (Member $e0 add) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; JSD: 0.662   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ read.Agent   n 10 / 3   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; JSD: 0.662   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  pick_up.Agent ~ try.Agent   n 3 / 10   gate: FAIL
;; A fillers: Jay, Santiago, camera   e.g. tierB-001072 tierB-000334
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000547 tierB-000947
;; JSD: 0.662   shared clusters: 2 e.g. {Santiago, Manila, Havana} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 pick_up) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ find.Theme   n 18 / 10   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000119 tierC-000120
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {paper, paper factory, paper mill, paper sheet, …}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 find) (Theme $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Patient $e0 $x1)))

;; [different class and role]  find.Theme ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.663   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Theme $e0 $x1)))

;; [different class and role]  hear.Experiencer ~ study.Agent   n 8 / 12   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000421
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000253
;; JSD: 0.663   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Fadil, Jamil, Sami}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  leave.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000704
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; JSD: 0.667   shared clusters: 3 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ travel.Agent   n 10 / 5   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000747
;; B fillers: people ×2, Matthew, Roger, campaigner   e.g. tierB-000995 tierB-001618
;; JSD: 0.682   shared clusters: 2 e.g. {person, people} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 travel) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ study.Agent   n 6 / 12   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; JSD: 0.683   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  decide.Agent ~ study.Agent   n 4 / 12   gate: FAIL
;; A fillers: Fyodor ×2, Beth, Elias   e.g. tierB-001544 tierB-000401
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-000710
;; JSD: 0.692   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jessica, Linda, Beth, Katherine, …}
;; A: (And (Member $e0 decide) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, complex, simple, labourers, technetium   e.g. tierC-000164 tierC-000163
;; B fillers: main songwriting unit ×2, complex, simple, human barricade, main, songwriting unit, technetium   e.g. tierB-000780 tierC-000179
;; JSD: 0.692   shared clusters: 2 e.g. {complex, complex, simple, complicated} {technetium}
;; A: (And (Member $e0 form) (Agent $e0 $x1))
;; B: (And (Member $e0 form) (Patient $e0 $x1))
(Implication (And (Member $e0 form) (Patient $e0 $x1)) (And (Member $e0 form) (Agent $e0 $x1)))

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000370
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; JSD: 0.692   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {expensive, expensive, thing}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 get) (Result $e0 $x1))
(Implication (And (Member $e0 get) (Result $e0 $x1)) (And (Member $e0 get) (Patient $e0 $x1)))

;; [different class and role]  bring.Theme ~ leave.Agent   n 4 / 10   gate: FAIL
;; A fillers: Jonathan, advantage, british ship, chinese dumpling   e.g. tierB-000636 tierB-000427
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000100 tierB-000004
;; JSD: 0.698   shared clusters: 2 e.g. {ship, british ship, israeli military ship, merchant ship, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 bring) (Theme $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 bring) (Theme $e0 $x1)) (And (Member $e0 bring) (Agent $e0 $x1)))

;; [different class and role]  lead.Agent ~ start.Patient   n 5 / 11   gate: FAIL
;; A fillers: thing ×2, dog, education, general   e.g. tierC-000019 tierC-000020
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001816 tierB-001446
;; JSD: 0.7   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {dog, dog feed}
;; A: (And (Member $e0 lead) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 lead) (Agent $e0 $x1)) (And (Member $e0 lead) (Patient $e0 $x1)))

;; [different class and role]  walk.Agent ~ want.Experiencer   n 8 / 8   gate: FAIL
;; A fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000805 tierB-001044
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000846 tierB-000626
;; JSD: 0.703   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Leon, Lukas}
;; A: (And (Member $e0 walk) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  get.Agent ~ try.Agent   n 6 / 10   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000577 tierB-000672
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000216 tierB-001773
;; JSD: 0.704   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {man, young}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  start.Agent ~ walk.Agent   n 6 / 8   gate: FAIL
;; A fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-001219
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-000036
;; JSD: 0.713   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {school janitor}
;; A: (And (Member $e0 start) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  take.Agent ~ walk.Agent   n 9 / 8   gate: FAIL
;; A fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000252 tierB-000987
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; JSD: 0.719   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Michael, Marco, Marcus}
;; A: (And (Member $e0 take) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; JSD: 0.721   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {David, William, James}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Agent $e0 $x1)))

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-001044 tierB-000324
;; JSD: 0.721   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Inomaru, Barako, …} {customer, customers}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  study.Agent ~ work.Agent   n 12 / 8   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierC-000253
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, adaptor, old   e.g. tierB-000212 tierB-001813
;; JSD: 0.727   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 study) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ make.Agent   n 5 / 18   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; JSD: 0.732   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  leave.Agent ~ want.Experiencer   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; JSD: 0.737   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  try.Agent ~ want.Experiencer   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; JSD: 0.737   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  enter.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000704 tierB-000747
;; JSD: 0.745   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  enter.Agent ~ serve.Agent   n 6 / 10   gate: FAIL
;; A fillers: Lake Sammamish ×2, Layla, Martino, muslims, people   e.g. tierB-000450 tierB-000556
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; JSD: 0.745   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 enter) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  help.Agent ~ leave.Agent   n 6 / 10   gate: FAIL
;; A fillers: Jonas, Karen, Michael, context, hothouse conditions, life experience   e.g. tierB-001094 tierB-000319
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000004
;; JSD: 0.745   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 help) (Agent $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  cry.Agent ~ go.Agent   n 5 / 15   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-001538
;; B fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; JSD: 0.754   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 go) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  serve.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001879 tierC-000253
;; JSD: 0.758   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 serve) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ want.Experiencer   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000325 tierB-001594
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; JSD: 0.759   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ hear.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000162
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000659
;; JSD: 0.761   shared clusters: 4 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 hear) (Experiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (And (Member $e0 hear) (Holder $e0 $x1)))

;; [same role, different class]  make.Agent ~ take.Agent   n 18 / 9   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.77   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000173 tierB-000240
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000400
;; JSD: 0.772   shared clusters: 2 e.g. {David, William, James} {Mark, marker, markers}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  find.Theme ~ make.Agent   n 10 / 18   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; JSD: 0.773   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Agent $e0 $x1)))

;; [different class and role]  have.Holder ~ need.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000819 tierC-000181
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000086 tierB-000061
;; JSD: 0.777   shared clusters: 3 e.g. {Karl, Kristoffer} {Gustavo, Alberto, Martino, Pietro, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Holder $e0 $x1)))

;; [same role, different class]  leave.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-001350 tierB-000704
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000929 tierB-001044
;; JSD: 0.777   shared clusters: 2 e.g. {Michael, Marco, Marcus} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000747
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, adaptor, old   e.g. tierB-000212 tierB-001813
;; JSD: 0.777   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {person, people}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 work) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000216
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; JSD: 0.777   shared clusters: 2 e.g. {Boldi, Bruno, Felix, Maurice, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 try) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ study.Agent   n 15 / 12   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-000313
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-001544 tierB-001879
;; JSD: 0.787   shared clusters: 2 e.g. {Jessica, Linda, Beth, Katherine, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  make.Agent ~ try.Agent   n 18 / 10   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000173 tierB-000539
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000117 tierB-000216
;; JSD: 0.789   shared clusters: 2 e.g. {David, William, James} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  go.Agent ~ want.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001183
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-000626 tierB-001390
;; JSD: 0.793   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ make.Agent   n 15 / 18   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000325
;; JSD: 0.794   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Baya, Skura, Inomaru, Barako, …} {cat, cats}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  make.Agent ~ sleep.Experiencer   n 18 / 6   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-000073
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001538 tierB-001003
;; JSD: 0.795   shared clusters: 2 e.g. {cat, cats} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (And (Member $e0 sleep) (Agent $e0 $x1)))

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, barking, growling, noises, crash, knock, music, upbeat, noise, ticking   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001899 tierB-001816
;; JSD: 0.799   shared clusters: 2 e.g. {knock, kick, kick out} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 hear) (Stimulus $e0 $x1))
;; B: (And (Member $e0 start) (Patient $e0 $x1))
(Implication (And (Member $e0 hear) (Stimulus $e0 $x1)) (And (Member $e0 hear) (Patient $e0 $x1)))

;; [same role, different class]  leave.Agent ~ serve.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000704 tierB-000747
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierC-000054
;; JSD: 0.8   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {person, people}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  leave.Agent ~ try.Agent   n 10 / 10   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000004 tierB-000704
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000947 tierB-000216
;; JSD: 0.8   shared clusters: 2 e.g. {Jonas, Roger, Bob, Ralph, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 leave) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ play.Agent   n 15 / 15   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001496
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-000160
;; JSD: 0.813   shared clusters: 2 e.g. {child, children, kid, baby, …} {Baya, Skura, Inomaru, Barako, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.82   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 get) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Agent $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  go.Agent ~ need.Experiencer   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-001496
;; B fillers: Algeria, Karl, Martino, Yanni, children, doctor   e.g. tierB-000107 tierB-000455
;; JSD: 0.821   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {child, children, kid, baby, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 need) (Experiencer $e0 $x1))
(Implication (And (Member $e0 need) (Experiencer $e0 $x1)) (And (Member $e0 need) (Agent $e0 $x1)))

;; [same role, different class]  go.Agent ~ walk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.821   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; JSD: 0.827   shared clusters: 3 e.g. {hotel} {room, changing room, rooms} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 build) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 build) (Patient $e0 $x1)) (And (Member $e0 build) (Holder $e0 $x1)))

;; [different class and role]  find.Theme ~ have.Holder   n 10 / 44   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.829   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
;; A: (And (Member $e0 find) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 find) (Theme $e0 $x1)) (And (Member $e0 find) (Holder $e0 $x1)))

;; [same role, different class]  go.Agent ~ serve.Agent   n 15 / 10   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000204
;; B fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierB-000940 tierB-000864
;; JSD: 0.838   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Mom, mother, grandmother, parent, …}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 serve) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000206
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-001594 tierB-001504
;; JSD: 0.841   shared clusters: 2 e.g. {bad, bad, relationship, bad, matter, bad, problem} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ take.Agent   n 44 / 9   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.844   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 take) (Agent $e0 $x1))
(Implication (And (Member $e0 take) (Agent $e0 $x1)) (And (Member $e0 take) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ leave.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 leave) (Agent $e0 $x1))
(Implication (And (Member $e0 leave) (Agent $e0 $x1)) (And (Member $e0 leave) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ try.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000358
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000947
;; JSD: 0.85   shared clusters: 3 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
(Implication (And (Member $e0 try) (Agent $e0 $x1)) (And (Member $e0 try) (Holder $e0 $x1)))

;; [different class and role]  good.Experiencer ~ have.Holder   n 4 / 44   gate: FAIL
;; A fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.852   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {weather, bad, weather}
;; A: (And (Member $e0 good) (Experiencer $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (And (Member $e0 good) (Holder $e0 $x1)))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000138 tierC-000091
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.862   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {movie, film}
;; A: (And (Member $e0 direct) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 direct) (Patient $e0 $x1)) (And (Member $e0 direct) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ want.Experiencer   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierB-000855
;; B fillers: Aslan ×2, Benedito, Edmundo, Leon, Pepper, Tony   e.g. tierB-001988 tierB-000626
;; JSD: 0.863   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 want) (Experiencer $e0 $x1))
(Implication (And (Member $e0 want) (Experiencer $e0 $x1)) (And (Member $e0 want) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ help.Agent   n 44 / 6   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000358 tierC-000182
;; B fillers: Jonas, Karen, Michael, context, hothouse conditions, life experience   e.g. tierB-000319 tierC-000071
;; JSD: 0.87   shared clusters: 2 e.g. {Karen, Kalman, Kerr, Ken} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 help) (Agent $e0 $x1))
(Implication (And (Member $e0 help) (Agent $e0 $x1)) (And (Member $e0 help) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Holder   n 8 / 44   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierC-000271
;; JSD: 0.872   shared clusters: 2 e.g. {weather, bad, weather} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ read.Agent   n 44 / 3   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Katya, Thomas, girl, little   e.g. tierB-001637 tierB-001221
;; JSD: 0.878   shared clusters: 2 e.g. {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 read) (Agent $e0 $x1))
(Implication (And (Member $e0 read) (Agent $e0 $x1)) (And (Member $e0 read) (Holder $e0 $x1)))

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 15   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000951 tierB-001457
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000939 tierB-001840
;; JSD: 0.879   shared clusters: 2 e.g. {Baya, Skura, Inomaru, Barako, …} {boy, boys}
;; A: (And (Member $e0 make) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  have.Holder ~ make.Agent   n 44 / 18   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; JSD: 0.882   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ walk.Agent   n 44 / 8   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000162 tierB-000855
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; JSD: 0.883   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boldi, Bruno, Felix, Maurice, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 walk) (Agent $e0 $x1))
(Implication (And (Member $e0 walk) (Agent $e0 $x1)) (And (Member $e0 walk) (Holder $e0 $x1)))

;; [different class and role]  go.Agent ~ have.Holder   n 15 / 44   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001145 tierB-000012
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000855 tierB-001216
;; JSD: 0.891   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Karen, Kalman, Kerr, Ken}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (And (Member $e0 go) (Holder $e0 $x1)))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; JSD: 0.894   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {food, eat}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (And (Member $e0 buy) (Holder $e0 $x1)))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000314 tierC-000114
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000313 tierC-000113
;; JSD: 0.896   shared clusters: 2 e.g. {Yunnan, Chongqing} {islamic ivory, ivory}
;; A: (PartOf $x0 $x1)
;; B: (Possession $x0 $x1)
(Implication (PartOf $x0 $x1) (Possession $x0 $x1))

;; [different class and role]  have.Holder ~ study.Agent   n 44 / 12   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000855
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierB-000203 tierB-001879
;; JSD: 0.9   shared clusters: 2 e.g. {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 study) (Agent $e0 $x1))
(Implication (And (Member $e0 study) (Agent $e0 $x1)) (And (Member $e0 study) (Holder $e0 $x1)))

;; [different class and role]  get.Patient ~ have.Holder   n 7 / 44   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-000748 tierB-000206
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000790 tierB-000819
;; JSD: 0.904   shared clusters: 2 e.g. {weather, bad, weather} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 get) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 get) (Patient $e0 $x1)) (And (Member $e0 get) (Holder $e0 $x1)))

;; [different class and role]  change.Patient ~ have.Theme   n 8 / 43   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000098 tierB-001217
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000722 tierB-000162
;; JSD: 0.907   shared clusters: 2 e.g. {color} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (And (Member $e0 change) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001264 tierB-000142
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-001378 tierB-000971
;; JSD: 0.908   shared clusters: 3 e.g. {room, changing room, rooms} {sentence, english sentence, sentences} {word, word processor}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 use) (Theme $e0 $x1))
(Implication (And (Member $e0 use) (Theme $e0 $x1)) (And (Member $e0 use) (Holder $e0 $x1)))

;; [different class and role]  have.Holder ~ write.Patient   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000931 tierB-000142
;; B fillers: episode ×2, song ×2, book, character, letter, screenplay   e.g. tierB-001962 tierB-000971
;; JSD: 0.915   shared clusters: 2 e.g. {book, library, books} {sentence, english sentence, sentences}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 write) (Patient $e0 $x1))
(Implication (And (Member $e0 write) (Patient $e0 $x1)) (And (Member $e0 write) (Holder $e0 $x1)))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 46 / 11   gate: FAIL
;; A fillers: here ×3, Derwent Isle ×2, city ×2, class ×2, garden ×2, southern ×2   e.g. tierB-000523 tierB-001111
;; B fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierB-001932 tierB-001966
;; JSD: 0.92   shared clusters: 2 e.g. {play} {street, road, street, entire, street}
;; A: (LocatedIn $x0 $x1)
;; B: (PartOf $x0 $x1)
(Implication (PartOf $x0 $x1) (LocatedIn $x0 $x1))

;; [different class and role]  have.Theme ~ make.Agent   n 43 / 18   gate: FAIL
;; A fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-001264 tierB-000162
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001920 tierB-001831
;; JSD: 0.931   shared clusters: 2 e.g. {curtain, blue, curtain, curtains} {thing, things, stuff, practice, thing}
;; A: (And (Member $e0 have) (Theme $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (And (Member $e0 make) (Theme $e0 $x1)))

;; [different class and role]  have.Holder ~ make.Patient   n 44 / 20   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-000819
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-000371 tierB-001504
;; JSD: 0.935   shared clusters: 2 e.g. {house, home, comfortable, house, houses, …} {Algeria, Afghanistan, Iran, Morocco, …}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 make) (Patient $e0 $x1))
(Implication (And (Member $e0 make) (Patient $e0 $x1)) (And (Member $e0 make) (Holder $e0 $x1)))

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000162 tierB-000797
;; JSD: 0.945   shared clusters: 2 e.g. {thing, things, stuff, practice, thing} {gas station, gas pump, gas pumps}
;; A: (And (Member $e0 have) (Holder $e0 $x1))
;; B: (And (Member $e0 have) (Theme $e0 $x1))
(Implication (And (Member $e0 have) (Theme $e0 $x1)) (And (Member $e0 have) (Holder $e0 $x1)))
