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
;;   <query A>
;;   <query B>
;; Pooled pairs: every head pair. Slot pairs: every pair with >= 2 shared clusters (the gate's first
;; condition); a pair sharing fewer clusters cannot pass and is not listed.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as (<Head> $x0 $x1)
;; (an entity centre carries no class link), a pooled role as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== POOLED ROLE LEVEL: 22 heads at n >= 14, 231 pairs, 0 pass the gate ====================
;; (the paper's 'Agent2 ~ Agent' reading: one head's fillers pooled over every predicate, against every other head's)

;; [pooled role]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.775   shared clusters: 57 e.g. {thing} {people} {person}
(Experiencer $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Experiencer   n 888 / 261   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.785   shared clusters: 57 e.g. {person} {thing} {people}
(Agent $e $x)
(Experiencer $e $x)

;; [pooled role]  Patient ~ Theme   n 455 / 594   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.827   shared clusters: 49 e.g. {thing} {person} {people}
(Patient $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ Patient   n 888 / 455   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.845   shared clusters: 45 e.g. {person} {thing} {people}
(Agent $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.857   shared clusters: 43 e.g. {person} {thing} {company}
(Agent $e $x)
(Theme $e $x)

;; [pooled role]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.86   shared clusters: 2 e.g. {kids} {person}
(Beneficiary $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.872   shared clusters: 9 e.g. {person} {company} {man}
(Agent $e $x)
(Recipient $e $x)

;; [pooled role]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.894   shared clusters: 6 e.g. {here} {school} {town}
(Goal $e $x)
(Source $e $x)

;; [pooled role]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.895   shared clusters: 9 e.g. {thing} {movie} {room}
(Holder $e $x)
(Patient $e $x)

;; [pooled role]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.91   shared clusters: 20 e.g. {thing} {person} {people}
(Experiencer $e $x)
(Theme $e $x)

;; [pooled role]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.912   shared clusters: 1 e.g. {now}
(Before $e $x)
(Time $e $x)

;; [pooled role]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.917   shared clusters: 2 e.g. {thing} {food}
(Holder $e $x)
(Stimulus $e $x)

;; [pooled role]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.917   shared clusters: 8 e.g. {thing} {food} {house}
(Holder $e $x)
(Theme $e $x)

;; [pooled role]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.921   shared clusters: 5 e.g. {thing} {food} {questions}
(Stimulus $e $x)
(Theme $e $x)

;; [pooled role]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.925   shared clusters: 7 e.g. {here} {home} {town}
(Goal $e $x)
(Location $e $x)

;; [pooled role]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.926   shared clusters: 7 e.g. {thing} {place} {Miroslav}
(Experiencer $e $x)
(Holder $e $x)

;; [pooled role]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.927   shared clusters: 4 e.g. {town} {house} {place}
(Goal $e $x)
(Holder $e $x)

;; [pooled role]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.928   shared clusters: 5 e.g. {here} {town} {office}
(Location $e $x)
(Source $e $x)

;; [pooled role]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; JSD: 0.929   shared clusters: 3 e.g. {person} {Olivia} {customer}
(Agent $e $x)
(Beneficiary $e $x)

;; [pooled role]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.932   shared clusters: 1 e.g. {Karen}
(CoAgent $e $x)
(Holder $e $x)

;; [pooled role]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.933   shared clusters: 11 e.g. {thing} {Wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; [pooled role]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.937   shared clusters: 4 e.g. {thing} {Jessica} {author}
(Agent $e $x)
(Stimulus $e $x)

;; [pooled role]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.938   shared clusters: 10 e.g. {room} {community} {tree}
(Goal $e $x)
(Patient $e $x)

;; [pooled role]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.942   shared clusters: 3 e.g. {thing} {food} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; [pooled role]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.945   shared clusters: 6 e.g. {thing} {talk} {make}
(Theme $e $x)
(To $e $x)

;; [pooled role]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.948   shared clusters: 13 e.g. {table} {hotel} {world}
(Location $e $x)
(Patient $e $x)

;; [pooled role]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.949   shared clusters: 2 e.g. {thing} {repeat}
(Holder $e $x)
(To $e $x)

;; [pooled role]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.95   shared clusters: 2 e.g. {town} {room}
(Holder $e $x)
(Source $e $x)

;; [pooled role]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.953   shared clusters: 7 e.g. {place} {school} {happiness}
(Experiencer $e $x)
(Goal $e $x)

;; [pooled role]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.955   shared clusters: 2 e.g. {thing} {child}
(Experiencer $e $x)
(Stimulus $e $x)

;; [pooled role]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.958   shared clusters: 4 e.g. {person} {company} {friends}
(Recipient $e $x)
(Theme $e $x)

;; [pooled role]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.961   shared clusters: 1 e.g. {thing}
(Stimulus $e $x)
(To $e $x)

;; [pooled role]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.963   shared clusters: 1 e.g. {straight}
(As $e $x)
(Result $e $x)

;; [pooled role]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.964   shared clusters: 9 e.g. {house} {first team} {Islam}
(Goal $e $x)
(Theme $e $x)

;; [pooled role]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.965   shared clusters: 3 e.g. {town} {hotel} {place}
(Holder $e $x)
(Location $e $x)

;; [pooled role]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.967   shared clusters: 1 e.g. {bed}
(For $e $x)
(Goal $e $x)

;; [pooled role]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.969   shared clusters: 3 e.g. {room} {tree} {school}
(Patient $e $x)
(Source $e $x)

;; [pooled role]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.97   shared clusters: 2 e.g. {thing} {doctor}
(Agent $e $x)
(To $e $x)

;; [pooled role]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.97   shared clusters: 2 e.g. {well} {back}
(Goal $e $x)
(Manner $e $x)

;; [pooled role]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.971   shared clusters: 1 e.g. {person}
(Beneficiary $e $x)
(Patient $e $x)

;; [pooled role]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.971   shared clusters: 1 e.g. {food}
(Instrument $e $x)
(Stimulus $e $x)

;; [pooled role]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.971   shared clusters: 10 e.g. {Gareccio} {group} {fire}
(Location $e $x)
(Theme $e $x)

;; [pooled role]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.971   shared clusters: 1 e.g. {person}
(Patient $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 0.974   shared clusters: 3 e.g. {family} {Karen} {Spain}
(Agent $e $x)
(CoAgent $e $x)

;; [pooled role]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.974   shared clusters: 2 e.g. {thing} {doctor}
(Experiencer $e $x)
(To $e $x)

;; [pooled role]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.975   shared clusters: 5 e.g. {Europe} {place} {school}
(Experiencer $e $x)
(Location $e $x)

;; [pooled role]  Holder ~ Instrument   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.975   shared clusters: 1 e.g. {food}
(Holder $e $x)
(Instrument $e $x)

;; [pooled role]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.975   shared clusters: 1 e.g. {thing}
(Patient $e $x)
(To $e $x)

;; [pooled role]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.976   shared clusters: 1 e.g. {person}
(Beneficiary $e $x)
(Experiencer $e $x)

;; [pooled role]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.976   shared clusters: 1 e.g. {person}
(Beneficiary $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.976   shared clusters: 1 e.g. {person}
(Experiencer $e $x)
(Recipient $e $x)

;; [pooled role]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.976   shared clusters: 3 e.g. {work} {polish} {call}
(For $e $x)
(Theme $e $x)

;; [pooled role]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.976   shared clusters: 1 e.g. {poetry}
(In $e $x)
(Stimulus $e $x)

;; [pooled role]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 0.978   shared clusters: 3 e.g. {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; [pooled role]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.978   shared clusters: 7 e.g. {campfire} {community} {Islam}
(Agent $e $x)
(Goal $e $x)

;; [pooled role]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.978   shared clusters: 1 e.g. {Amanda}
(CoAgent $e $x)
(Goal $e $x)

;; [pooled role]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.978   shared clusters: 1 e.g. {bat}
(Result $e $x)
(Source $e $x)

;; [pooled role]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.978   shared clusters: 5 e.g. {eat} {mosquito} {office}
(Source $e $x)
(Theme $e $x)

;; [pooled role]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.979   shared clusters: 3 e.g. {snow} {food} {blood}
(Instrument $e $x)
(Patient $e $x)

;; [pooled role]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.98   shared clusters: 1 e.g. {together}
(Manner $e $x)
(Result $e $x)

;; [pooled role]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.982   shared clusters: 1 e.g. {Loren}
(Goal $e $x)
(Recipient $e $x)

;; [pooled role]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.983   shared clusters: 2 e.g. {road} {train}
(Experiencer $e $x)
(Instrument $e $x)

;; [pooled role]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.983   shared clusters: 1 e.g. {snow}
(Goal $e $x)
(Instrument $e $x)

;; [pooled role]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.983   shared clusters: 2 e.g. {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; [pooled role]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.984   shared clusters: 4 e.g. {train} {plants} {road}
(Agent $e $x)
(Instrument $e $x)

;; [pooled role]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.984   shared clusters: 2 e.g. {modern, street} {open}
(Experiencer $e $x)
(Result $e $x)

;; [pooled role]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.985   shared clusters: 2 e.g. {name} {girl}
(As $e $x)
(Theme $e $x)

;; [pooled role]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.986   shared clusters: 3 e.g. {english} {understand} {nothing}
(In $e $x)
(Theme $e $x)

;; [pooled role]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {point}
(Source $e $x)
(Time $e $x)

;; [pooled role]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; JSD: 0.987   shared clusters: 3 e.g. {Peter} {governor} {president}
(Agent $e $x)
(As $e $x)

;; [pooled role]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.987   shared clusters: 2 e.g. {weather} {field}
(In $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.988   shared clusters: 5 e.g. {France} {fire} {hotel}
(Agent $e $x)
(Location $e $x)

;; [pooled role]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.988   shared clusters: 1 e.g. {weather}
(Experiencer $e $x)
(In $e $x)

;; [pooled role]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.988   shared clusters: 2 e.g. {sleep} {inomaru}
(Result $e $x)
(Theme $e $x)

;; [pooled role]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.99   shared clusters: 1 e.g. {food}
(Instrument $e $x)
(Theme $e $x)

;; [pooled role]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.99   shared clusters: 1 e.g. {cities}
(Location $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.991   shared clusters: 2 e.g. {crow} {sleep}
(Agent $e $x)
(Result $e $x)

;; [pooled role]  Location ~ To   n 210 / 46   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.991   shared clusters: 1 e.g. {shore}
(Location $e $x)
(To $e $x)

;; [pooled role]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.992   shared clusters: 1 e.g. {school}
(Experiencer $e $x)
(Source $e $x)

;; [pooled role]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.993   shared clusters: 1 e.g. {name}
(As $e $x)
(Patient $e $x)

;; [pooled role]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.993   shared clusters: 1 e.g. {night}
(Patient $e $x)
(Time $e $x)

;; [pooled role]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.994   shared clusters: 1 e.g. {Amanda}
(CoAgent $e $x)
(Theme $e $x)

;; [pooled role]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.995   shared clusters: 1 e.g. {morning}
(Theme $e $x)
(Time $e $x)

;; [pooled role]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.997   shared clusters: 1 e.g. {spring}
(Agent $e $x)
(Time $e $x)

;; [pooled role]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Before $e $x)

;; [pooled role]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(In $e $x)

;; [pooled role]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Like $e $x)

;; [pooled role]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Manner $e $x)

;; [pooled role]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Source $e $x)

;; [pooled role]  As ~ Before   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Before $e $x)

;; [pooled role]  As ~ Beneficiary   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Beneficiary $e $x)

;; [pooled role]  As ~ CoAgent   n 15 / 16   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(CoAgent $e $x)

;; [pooled role]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Experiencer $e $x)

;; [pooled role]  As ~ For   n 15 / 39   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(For $e $x)

;; [pooled role]  As ~ Goal   n 15 / 93   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Goal $e $x)

;; [pooled role]  As ~ Holder   n 15 / 48   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Holder $e $x)

;; [pooled role]  As ~ In   n 15 / 50   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(In $e $x)

;; [pooled role]  As ~ Instrument   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Instrument $e $x)

;; [pooled role]  As ~ Like   n 15 / 14   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Like $e $x)

;; [pooled role]  As ~ Location   n 15 / 210   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Location $e $x)

;; [pooled role]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Manner $e $x)

;; [pooled role]  As ~ Recipient   n 15 / 29   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Recipient $e $x)

;; [pooled role]  As ~ Source   n 15 / 47   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Source $e $x)

;; [pooled role]  As ~ Stimulus   n 15 / 34   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Stimulus $e $x)

;; [pooled role]  As ~ Time   n 15 / 107   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(Time $e $x)

;; [pooled role]  As ~ To   n 15 / 46   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(As $e $x)
(To $e $x)

;; [pooled role]  Before ~ Beneficiary   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Beneficiary $e $x)

;; [pooled role]  Before ~ CoAgent   n 16 / 16   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(CoAgent $e $x)

;; [pooled role]  Before ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Experiencer $e $x)

;; [pooled role]  Before ~ For   n 16 / 39   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(For $e $x)

;; [pooled role]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Goal $e $x)

;; [pooled role]  Before ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Holder $e $x)

;; [pooled role]  Before ~ In   n 16 / 50   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(In $e $x)

;; [pooled role]  Before ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Instrument $e $x)

;; [pooled role]  Before ~ Like   n 16 / 14   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Like $e $x)

;; [pooled role]  Before ~ Location   n 16 / 210   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Location $e $x)

;; [pooled role]  Before ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Manner $e $x)

;; [pooled role]  Before ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Patient $e $x)

;; [pooled role]  Before ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Recipient $e $x)

;; [pooled role]  Before ~ Result   n 16 / 43   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Result $e $x)

;; [pooled role]  Before ~ Source   n 16 / 47   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Source $e $x)

;; [pooled role]  Before ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Stimulus $e $x)

;; [pooled role]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(Theme $e $x)

;; [pooled role]  Before ~ To   n 16 / 46   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Before $e $x)
(To $e $x)

;; [pooled role]  Beneficiary ~ CoAgent   n 14 / 16   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(CoAgent $e $x)

;; [pooled role]  Beneficiary ~ For   n 14 / 39   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(For $e $x)

;; [pooled role]  Beneficiary ~ Goal   n 14 / 93   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Goal $e $x)

;; [pooled role]  Beneficiary ~ Holder   n 14 / 48   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Holder $e $x)

;; [pooled role]  Beneficiary ~ In   n 14 / 50   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(In $e $x)

;; [pooled role]  Beneficiary ~ Instrument   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Instrument $e $x)

;; [pooled role]  Beneficiary ~ Like   n 14 / 14   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Like $e $x)

;; [pooled role]  Beneficiary ~ Location   n 14 / 210   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Location $e $x)

;; [pooled role]  Beneficiary ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Manner $e $x)

;; [pooled role]  Beneficiary ~ Result   n 14 / 43   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Result $e $x)

;; [pooled role]  Beneficiary ~ Source   n 14 / 47   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Source $e $x)

;; [pooled role]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Stimulus $e $x)

;; [pooled role]  Beneficiary ~ Time   n 14 / 107   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Time $e $x)

;; [pooled role]  Beneficiary ~ To   n 14 / 46   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(To $e $x)

;; [pooled role]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Experiencer $e $x)

;; [pooled role]  CoAgent ~ For   n 16 / 39   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(For $e $x)

;; [pooled role]  CoAgent ~ In   n 16 / 50   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(In $e $x)

;; [pooled role]  CoAgent ~ Instrument   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Instrument $e $x)

;; [pooled role]  CoAgent ~ Like   n 16 / 14   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Like $e $x)

;; [pooled role]  CoAgent ~ Location   n 16 / 210   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Location $e $x)

;; [pooled role]  CoAgent ~ Manner   n 16 / 115   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Manner $e $x)

;; [pooled role]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Patient $e $x)

;; [pooled role]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Recipient $e $x)

;; [pooled role]  CoAgent ~ Result   n 16 / 43   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Result $e $x)

;; [pooled role]  CoAgent ~ Source   n 16 / 47   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Source $e $x)

;; [pooled role]  CoAgent ~ Stimulus   n 16 / 34   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Stimulus $e $x)

;; [pooled role]  CoAgent ~ Time   n 16 / 107   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Time $e $x)

;; [pooled role]  CoAgent ~ To   n 16 / 46   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(To $e $x)

;; [pooled role]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(For $e $x)

;; [pooled role]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Like $e $x)

;; [pooled role]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Manner $e $x)

;; [pooled role]  Experiencer ~ Time   n 261 / 107   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Time $e $x)

;; [pooled role]  For ~ Holder   n 39 / 48   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Holder $e $x)

;; [pooled role]  For ~ In   n 39 / 50   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(In $e $x)

;; [pooled role]  For ~ Instrument   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Instrument $e $x)

;; [pooled role]  For ~ Like   n 39 / 14   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Like $e $x)

;; [pooled role]  For ~ Location   n 39 / 210   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Location $e $x)

;; [pooled role]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Manner $e $x)

;; [pooled role]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Patient $e $x)

;; [pooled role]  For ~ Recipient   n 39 / 29   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Recipient $e $x)

;; [pooled role]  For ~ Result   n 39 / 43   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Result $e $x)

;; [pooled role]  For ~ Source   n 39 / 47   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Source $e $x)

;; [pooled role]  For ~ Stimulus   n 39 / 34   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Stimulus $e $x)

;; [pooled role]  For ~ Time   n 39 / 107   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(Time $e $x)

;; [pooled role]  For ~ To   n 39 / 46   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(For $e $x)
(To $e $x)

;; [pooled role]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(In $e $x)

;; [pooled role]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Like $e $x)

;; [pooled role]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Result $e $x)

;; [pooled role]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Stimulus $e $x)

;; [pooled role]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Time $e $x)

;; [pooled role]  Goal ~ To   n 93 / 46   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(To $e $x)

;; [pooled role]  Holder ~ In   n 48 / 50   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(In $e $x)

;; [pooled role]  Holder ~ Like   n 48 / 14   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Like $e $x)

;; [pooled role]  Holder ~ Manner   n 48 / 115   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Manner $e $x)

;; [pooled role]  Holder ~ Recipient   n 48 / 29   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Recipient $e $x)

;; [pooled role]  Holder ~ Result   n 48 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Result $e $x)

;; [pooled role]  Holder ~ Time   n 48 / 107   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Time $e $x)

;; [pooled role]  In ~ Instrument   n 50 / 34   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Instrument $e $x)

;; [pooled role]  In ~ Like   n 50 / 14   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Like $e $x)

;; [pooled role]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Manner $e $x)

;; [pooled role]  In ~ Recipient   n 50 / 29   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Recipient $e $x)

;; [pooled role]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Result $e $x)

;; [pooled role]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Source $e $x)

;; [pooled role]  In ~ Time   n 50 / 107   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Time $e $x)

;; [pooled role]  In ~ To   n 50 / 46   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(To $e $x)

;; [pooled role]  Instrument ~ Like   n 34 / 14   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Like $e $x)

;; [pooled role]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Location $e $x)

;; [pooled role]  Instrument ~ Manner   n 34 / 115   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Manner $e $x)

;; [pooled role]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Recipient $e $x)

;; [pooled role]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Result $e $x)

;; [pooled role]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Source $e $x)

;; [pooled role]  Instrument ~ Time   n 34 / 107   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Time $e $x)

;; [pooled role]  Instrument ~ To   n 34 / 46   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(To $e $x)

;; [pooled role]  Like ~ Location   n 14 / 210   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Location $e $x)

;; [pooled role]  Like ~ Manner   n 14 / 115   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Manner $e $x)

;; [pooled role]  Like ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Patient $e $x)

;; [pooled role]  Like ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Recipient $e $x)

;; [pooled role]  Like ~ Result   n 14 / 43   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Result $e $x)

;; [pooled role]  Like ~ Source   n 14 / 47   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Source $e $x)

;; [pooled role]  Like ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Stimulus $e $x)

;; [pooled role]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Theme $e $x)

;; [pooled role]  Like ~ Time   n 14 / 107   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(Time $e $x)

;; [pooled role]  Like ~ To   n 14 / 46   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Like $e $x)
(To $e $x)

;; [pooled role]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Location $e $x)
(Manner $e $x)

;; [pooled role]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Location $e $x)
(Result $e $x)

;; [pooled role]  Location ~ Stimulus   n 210 / 34   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Location $e $x)
(Stimulus $e $x)

;; [pooled role]  Location ~ Time   n 210 / 107   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Location $e $x)
(Time $e $x)

;; [pooled role]  Manner ~ Patient   n 115 / 455   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Patient $e $x)

;; [pooled role]  Manner ~ Recipient   n 115 / 29   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Recipient $e $x)

;; [pooled role]  Manner ~ Source   n 115 / 47   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Source $e $x)

;; [pooled role]  Manner ~ Stimulus   n 115 / 34   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Stimulus $e $x)

;; [pooled role]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Theme $e $x)

;; [pooled role]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Time $e $x)

;; [pooled role]  Manner ~ To   n 115 / 46   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(To $e $x)

;; [pooled role]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Patient $e $x)
(Result $e $x)

;; [pooled role]  Recipient ~ Result   n 29 / 43   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(Result $e $x)

;; [pooled role]  Recipient ~ Source   n 29 / 47   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(Source $e $x)

;; [pooled role]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(Stimulus $e $x)

;; [pooled role]  Recipient ~ Time   n 29 / 107   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(Time $e $x)

;; [pooled role]  Recipient ~ To   n 29 / 46   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(To $e $x)

;; [pooled role]  Result ~ Stimulus   n 43 / 34   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Result $e $x)
(Stimulus $e $x)

;; [pooled role]  Result ~ Time   n 43 / 107   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Result $e $x)
(Time $e $x)

;; [pooled role]  Result ~ To   n 43 / 46   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Result $e $x)
(To $e $x)

;; [pooled role]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Source $e $x)
(Stimulus $e $x)

;; [pooled role]  Source ~ To   n 47 / 46   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Source $e $x)
(To $e $x)

;; [pooled role]  Stimulus ~ Time   n 34 / 107   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 1.0   shared clusters: 0
(Stimulus $e $x)
(Time $e $x)

;; [pooled role]  Time ~ To   n 107 / 46   gate: FAIL
;; A fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Time $e $x)
(To $e $x)

;; ==================== SLOT PAIRS: 1 pass the gate (event 1, entity 0); 34 pairs listed = every pair with >= 2 shared clusters (event 33, entity 1) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's 'go to.Agent' reading: one (class, role) slot against every other slot of its centre kind)

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000259
;; JSD: 0.23   shared clusters: 2 e.g. {person} {sisters}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: FAIL
;; A fillers: host, industrialization, whigs   e.g. tierC-000087 tierC-000088
;; B fillers: guests, industrialization, whigs   e.g. tierB-001868 tierC-000088
;; JSD: 0.333   shared clusters: 2 e.g. {industrialization} {whigs}
(And (Member $e0 welcome) (Agent $e0 $x1))
(And (Member $e0 welcome) (Theme $e0 $x1))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000330 tierB-001156
;; JSD: 0.357   shared clusters: 2 e.g. {person} {sisters}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same role, different class]  portray.Agent ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000301 tierC-000277
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierC-000302 tierB-000730
;; JSD: 0.357   shared clusters: 3 e.g. {James Woods} {Wilson} {wilson}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [same role, different class]  die.Patient ~ kill.Patient   n 4 / 11   gate: FAIL
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: people ×4, person ×2, fox, gazelle, soldier, soldiers   e.g. tierB-000393 tierB-000412
;; JSD: 0.416   shared clusters: 2 e.g. {people} {person}
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 kill) (Patient $e0 $x1))

;; [different class and role]  portray.Theme ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierC-000301 tierC-000302
;; JSD: 0.427   shared clusters: 2 e.g. {James Woods} {Wilson}
(And (Member $e0 portray) (Theme $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierC-000330
;; JSD: 0.487   shared clusters: 2 e.g. {person} {sisters}
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settlers ×2, Paul, indigenous americans, native americans, writer   e.g. tierB-000863 tierB-000728
;; JSD: 0.517   shared clusters: 3 e.g. {european american settlers} {indigenous americans} {native americans}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 create) (Agent $e0 $x1))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000301 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000277 tierC-000247
;; JSD: 0.525   shared clusters: 2 e.g. {James Woods} {Wilson}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 portray) (Theme $e0 $x1))

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierB-000706 tierC-000243
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000244 tierB-000585
;; JSD: 0.547   shared clusters: 2 e.g. {Couper} {Pietro}
(And (Member $e0 find) (Agent $e0 $x1))
(And (Member $e0 find) (Theme $e0 $x1))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; JSD: 0.554   shared clusters: 2 e.g. {Rima} {Skura}
(And (Member $e0 cry) (Agent $e0 $x1))
(And (Member $e0 stop) (Agent $e0 $x1))

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-000168
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura} {Yanni}
(And (Member $e0 ready) (Experiencer $e0 $x1))
(And (Member $e0 stop) (Agent $e0 $x1))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.578   shared clusters: 2 e.g. {weather} {thing}
(And (Member $e0 change) (Patient $e0 $x1))
(And (Member $e0 good) (Experiencer $e0 $x1))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: birds, brown, dog, children, person   e.g. tierB-000338 tierB-001973
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierC-000128
;; JSD: 0.604   shared clusters: 2 e.g. {person} {birds}
(And (Member $e0 eat) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, cyanide, harmless, trace, destined, film, syrian film, film, syrian film, insulin   e.g. tierC-000092 tierB-001995
;; JSD: 0.605   shared clusters: 2 e.g. {movie} {film, syrian film}
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 produce) (Patient $e0 $x1))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000942
;; JSD: 0.636   shared clusters: 2 e.g. {girls} {Skura}
(And (Member $e0 cry) (Agent $e0 $x1))
(And (Member $e0 start) (Agent $e0 $x1))

;; [different class and role]  draw.Agent ~ sleep.Experiencer   n 5 / 6   gate: FAIL
;; A fillers: Cowper ×2, child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.636   shared clusters: 2 e.g. {child} {children}
(And (Member $e0 draw) (Agent $e0 $x1))
(And (Member $e0 sleep) (Experiencer $e0 $x1))

;; [different class and role]  follow.Agent ~ rule.Theme   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000095 tierC-000096
;; B fillers: Cuba, house, muslim, muslim house   e.g. tierB-000311 tierC-000095
;; JSD: 0.639   shared clusters: 2 e.g. {house, muslim} {muslim house}
(And (Member $e0 follow) (Agent $e0 $x1))
(And (Member $e0 rule) (Theme $e0 $x1))

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000337 tierC-000076
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000338 tierC-000075
;; JSD: 0.639   shared clusters: 2 e.g. {Bailey} {Alexander}
(And (Member $e0 follow) (Agent $e0 $x1))
(And (Member $e0 succeed) (Agent $e0 $x1))

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, traditions ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000337 tierC-000076
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000338 tierC-000075
;; JSD: 0.639   shared clusters: 2 e.g. {Henry Cole} {Margaret Fleming}
(And (Member $e0 follow) (Theme $e0 $x1))
(And (Member $e0 succeed) (Theme $e0 $x1))

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierC-000209 tierC-000210
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friends, novelist   e.g. tierB-000327 tierB-000078
;; JSD: 0.643   shared clusters: 3 e.g. {Katherine} {Linda} {Daniel}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 talk) (Agent $e0 $x1))

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plants   e.g. tierB-000462 tierC-000227
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000942 tierB-000978
;; JSD: 0.661   shared clusters: 2 e.g. {thing} {cook}
(And (Member $e0 add) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same role, different class]  draw.Agent ~ play.Agent   n 5 / 15   gate: FAIL
;; A fillers: Cowper ×2, child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; JSD: 0.692   shared clusters: 2 e.g. {children} {child}
(And (Member $e0 draw) (Agent $e0 $x1))
(And (Member $e0 play) (Agent $e0 $x1))

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, complex, simple, labourers, technetium   e.g. tierC-000163 tierC-000164
;; B fillers: main songwriting unit ×2, complex, simple, human barricade, main, songwriting unit, technetium   e.g. tierB-000780 tierC-000180
;; JSD: 0.692   shared clusters: 2 e.g. {technetium} {complex, simple}
(And (Member $e0 form) (Agent $e0 $x1))
(And (Member $e0 form) (Patient $e0 $x1))

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.717   shared clusters: 2 e.g. {children} {child}
(And (Member $e0 play) (Agent $e0 $x1))
(And (Member $e0 sleep) (Experiencer $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.769   shared clusters: 2 e.g. {cat} {children}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 sleep) (Experiencer $e0 $x1))

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000313 tierB-001496
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; JSD: 0.784   shared clusters: 2 e.g. {Linda} {children}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 swim) (Agent $e0 $x1))

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.809   shared clusters: 2 e.g. {Mark} {David}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 try) (Agent $e0 $x1))

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; JSD: 0.827   shared clusters: 3 e.g. {hotel} {room} {thing}
(And (Member $e0 build) (Patient $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.839   shared clusters: 2 e.g. {James} {Damiano}
(And (Member $e0 hear) (Experiencer $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000091 tierC-000138
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001555 tierC-000271
;; JSD: 0.862   shared clusters: 2 e.g. {thing} {movie}
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.87   shared clusters: 2 e.g. {thing} {Diego}
(And (Member $e0 get) (Agent $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-000368 tierB-001690
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001103 tierB-001016
;; JSD: 0.894   shared clusters: 2 e.g. {food} {house}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000114 tierC-000314
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000113 tierC-000313
;; JSD: 0.896   shared clusters: 2 e.g. {islamic ivory} {Yunnan}
(PartOf $x0 $x1)
(Possession $x0 $x1)
