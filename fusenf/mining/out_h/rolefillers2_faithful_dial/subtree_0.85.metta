;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 0.85 — one point of the dial; the adopted setting (word @ 0.85) is
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

;; [pooled role]  Agent ~ Experiencer   n 888 / 261   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.691   shared clusters: 59 e.g. {person, people} {thing, things} {child, children, kid, kids}
(Agent $e $x)
(Experiencer $e $x)

;; [pooled role]  Experiencer ~ Patient   n 261 / 455   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.709   shared clusters: 67 e.g. {person, people} {thing, things} {door, door, open, door, unlocked}
(Experiencer $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Theme   n 888 / 594   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.783   shared clusters: 67 e.g. {person, people} {thing, things} {company, corporation}
(Agent $e $x)
(Theme $e $x)

;; [pooled role]  Patient ~ Theme   n 455 / 594   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.785   shared clusters: 58 e.g. {thing, things} {person, people} {song, sing, chant}
(Patient $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ Patient   n 888 / 455   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.794   shared clusters: 56 e.g. {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(Agent $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Recipient   n 888 / 29   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.816   shared clusters: 12 e.g. {person, people} {company, corporation} {child, children, kid, kids}
(Agent $e $x)
(Recipient $e $x)

;; [pooled role]  Experiencer ~ Theme   n 261 / 594   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.82   shared clusters: 38 e.g. {thing, things} {person, people} {child, children, kid, kids}
(Experiencer $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Holder   n 261 / 48   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.838   shared clusters: 13 e.g. {Gustavo, Alberto, Diego, Rodrigo, …} {thing, things} {Boris, Ivan, Dmitri, Rasputin}
(Experiencer $e $x)
(Holder $e $x)

;; [pooled role]  Beneficiary ~ Recipient   n 14 / 29   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.86   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
(Beneficiary $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ Holder   n 888 / 48   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.861   shared clusters: 16 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(Agent $e $x)
(Holder $e $x)

;; [pooled role]  Goal ~ Source   n 93 / 47   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.871   shared clusters: 7 e.g. {town, towns} {here} {school, education}
(Goal $e $x)
(Source $e $x)

;; [pooled role]  Holder ~ Patient   n 48 / 455   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.871   shared clusters: 12 e.g. {thing, things} {movie, film} {room, rooms}
(Holder $e $x)
(Patient $e $x)

;; [pooled role]  Holder ~ Theme   n 48 / 594   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.876   shared clusters: 14 e.g. {thing, things} {food, eat} {house, home, houses}
(Holder $e $x)
(Theme $e $x)

;; [pooled role]  Goal ~ Location   n 93 / 210   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.877   shared clusters: 11 e.g. {house, home, houses} {here} {Eskisehir, Giresun}
(Goal $e $x)
(Location $e $x)

;; [pooled role]  Agent ~ Beneficiary   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; JSD: 0.887   shared clusters: 5 e.g. {person, people} {child, children, kid, kids} {Olivia, Sophia}
(Agent $e $x)
(Beneficiary $e $x)

;; [pooled role]  Before ~ Time   n 16 / 107   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.892   shared clusters: 1 e.g. {now, today, current}
(Before $e $x)
(Time $e $x)

;; [pooled role]  Holder ~ Stimulus   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.892   shared clusters: 3 e.g. {thing, things} {author, writer, novelist} {food, eat}
(Holder $e $x)
(Stimulus $e $x)

;; [pooled role]  Experiencer ~ Recipient   n 261 / 29   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.895   shared clusters: 5 e.g. {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
(Experiencer $e $x)
(Recipient $e $x)

;; [pooled role]  Goal ~ Holder   n 93 / 48   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.895   shared clusters: 5 e.g. {house, home, houses} {town, towns} {place, places}
(Goal $e $x)
(Holder $e $x)

;; [pooled role]  Holder ~ Source   n 48 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.895   shared clusters: 4 e.g. {town, towns} {place, places} {room, rooms}
(Holder $e $x)
(Source $e $x)

;; [pooled role]  Stimulus ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.897   shared clusters: 6 e.g. {thing, things} {child, children, kid, kids} {food, eat}
(Stimulus $e $x)
(Theme $e $x)

;; [pooled role]  Manner ~ Result   n 115 / 43   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.905   shared clusters: 4 e.g. {well, on, there, be} {direct, straight, directly} {together, come together}
(Manner $e $x)
(Result $e $x)

;; [pooled role]  Location ~ Source   n 210 / 47   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.91   shared clusters: 6 e.g. {here} {town, towns} {place, places}
(Location $e $x)
(Source $e $x)

;; [pooled role]  Experiencer ~ Result   n 261 / 43   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.912   shared clusters: 10 e.g. {bad, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {modern, street}
(Experiencer $e $x)
(Result $e $x)

;; [pooled role]  CoAgent ~ Holder   n 16 / 48   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; JSD: 0.914   shared clusters: 1 e.g. {Karen, Ken}
(CoAgent $e $x)
(Holder $e $x)

;; [pooled role]  Agent ~ Stimulus   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.915   shared clusters: 4 e.g. {thing, things} {child, children, kid, kids} {Jessica, Beth}
(Agent $e $x)
(Stimulus $e $x)

;; [pooled role]  Recipient ~ Theme   n 29 / 594   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.916   shared clusters: 8 e.g. {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
(Recipient $e $x)
(Theme $e $x)

;; [pooled role]  Location ~ Patient   n 210 / 455   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.919   shared clusters: 20 e.g. {table} {hotel} {floor, wood floor}
(Location $e $x)
(Patient $e $x)

;; [pooled role]  Beneficiary ~ Experiencer   n 14 / 261   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.921   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
(Beneficiary $e $x)
(Experiencer $e $x)

;; [pooled role]  Goal ~ Patient   n 93 / 455   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.921   shared clusters: 11 e.g. {tree, trees} {house, home, houses} {room, rooms}
(Goal $e $x)
(Patient $e $x)

;; [pooled role]  Experiencer ~ Goal   n 261 / 93   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.922   shared clusters: 10 e.g. {house, home, houses} {place, places} {Linda, Amanda, Loren, Dora Smith, …}
(Experiencer $e $x)
(Goal $e $x)

;; [pooled role]  Patient ~ Stimulus   n 455 / 34   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.928   shared clusters: 4 e.g. {thing, things} {child, children, kid, kids} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; [pooled role]  Manner ~ Time   n 115 / 107   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.93   shared clusters: 4 e.g. {late, later, last} {immediately, instantly, right away} {back, backward, before, past}
(Manner $e $x)
(Time $e $x)

;; [pooled role]  Holder ~ Location   n 48 / 210   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.933   shared clusters: 6 e.g. {town, towns} {place, places} {house, home, houses}
(Holder $e $x)
(Location $e $x)

;; [pooled role]  Theme ~ To   n 594 / 46   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.933   shared clusters: 8 e.g. {thing, things} {talk, conversation, discussion} {make}
(Theme $e $x)
(To $e $x)

;; [pooled role]  Location ~ Theme   n 210 / 594   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.934   shared clusters: 21 e.g. {house, home, houses} {Santiago, Havana} {Gareccio, Bologna}
(Location $e $x)
(Theme $e $x)

;; [pooled role]  Source ~ Theme   n 47 / 594   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.937   shared clusters: 9 e.g. {view, views, common, view, public, view, …} {food, eat} {Tokyo, Nagoya, Narita, Osaka}
(Source $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Location   n 261 / 210   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.94   shared clusters: 11 e.g. {Europe, Western Europe} {place, places} {village, villager, villagers}
(Experiencer $e $x)
(Location $e $x)

;; [pooled role]  Patient ~ Recipient   n 455 / 29   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.941   shared clusters: 3 e.g. {person, people} {child, children, kid, kids} {city, cities}
(Patient $e $x)
(Recipient $e $x)

;; [pooled role]  Patient ~ Result   n 455 / 43   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.943   shared clusters: 8 e.g. {bad, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {cozy, living room, theater, cozy, theater}
(Patient $e $x)
(Result $e $x)

;; [pooled role]  Agent ~ CoAgent   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; JSD: 0.944   shared clusters: 6 e.g. {family, families} {Linda, Amanda, Loren, Dora Smith, …} {cat, cats}
(Agent $e $x)
(CoAgent $e $x)

;; [pooled role]  Patient ~ Source   n 455 / 47   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.944   shared clusters: 6 e.g. {tree, trees} {room, rooms} {cookie, cookie jar, cookies}
(Patient $e $x)
(Source $e $x)

;; [pooled role]  Experiencer ~ Stimulus   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.945   shared clusters: 2 e.g. {thing, things} {child, children, kid, kids}
(Experiencer $e $x)
(Stimulus $e $x)

;; [pooled role]  Beneficiary ~ Patient   n 14 / 455   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.946   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
(Beneficiary $e $x)
(Patient $e $x)

;; [pooled role]  Goal ~ Theme   n 93 / 594   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.946   shared clusters: 11 e.g. {house, home, houses} {Baltimore, Boston, Springfield} {room, rooms}
(Goal $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ To   n 888 / 46   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.949   shared clusters: 6 e.g. {thing, things} {doctor, doctors} {George Allen, James David Edgar, Chuck Robb}
(Agent $e $x)
(To $e $x)

;; [pooled role]  Holder ~ To   n 48 / 46   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.949   shared clusters: 2 e.g. {thing, things} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; [pooled role]  For ~ Goal   n 39 / 93   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.951   shared clusters: 2 e.g. {bed} {happiness, happy, happily, joy}
(For $e $x)
(Goal $e $x)

;; [pooled role]  As ~ Manner   n 15 / 115   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.953   shared clusters: 1 e.g. {direct, straight, directly}
(As $e $x)
(Manner $e $x)

;; [pooled role]  Experiencer ~ Source   n 261 / 47   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.953   shared clusters: 5 e.g. {place, places} {view, views, common, view, public, view, …} {ceiling, black, ceiling}
(Experiencer $e $x)
(Source $e $x)

;; [pooled role]  Agent ~ Goal   n 888 / 93   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.954   shared clusters: 12 e.g. {Linda, Amanda, Loren, Dora Smith, …} {house, home, houses} {campfire}
(Agent $e $x)
(Goal $e $x)

;; [pooled role]  Beneficiary ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.954   shared clusters: 2 e.g. {person, people} {child, children, kid, kids}
(Beneficiary $e $x)
(Theme $e $x)

;; [pooled role]  CoAgent ~ Recipient   n 16 / 29   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.954   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
(CoAgent $e $x)
(Recipient $e $x)

;; [pooled role]  Beneficiary ~ Stimulus   n 14 / 34   gate: FAIL
;; A fillers: Mr. Morel ×2, Nelson ×2, CIA, Olivia, archaeologists, band
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.956   shared clusters: 1 e.g. {child, children, kid, kids}
(Beneficiary $e $x)
(Stimulus $e $x)

;; [pooled role]  Recipient ~ Stimulus   n 29 / 34   gate: FAIL
;; A fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.957   shared clusters: 1 e.g. {child, children, kid, kids}
(Recipient $e $x)
(Stimulus $e $x)

;; [pooled role]  For ~ Theme   n 39 / 594   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.958   shared clusters: 5 e.g. {work, job} {portray, portrait, portrayal} {ship, merchant ship, modern ship}
(For $e $x)
(Theme $e $x)

;; [pooled role]  Goal ~ Manner   n 93 / 115   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.96   shared clusters: 3 e.g. {well, on, there, be} {happiness, happy, happily, joy} {back, backward, before, past}
(Goal $e $x)
(Manner $e $x)

;; [pooled role]  Patient ~ To   n 455 / 46   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.96   shared clusters: 3 e.g. {thing, things} {bake, bakery, bread} {woman, lady, female, women}
(Patient $e $x)
(To $e $x)

;; [pooled role]  Agent ~ As   n 888 / 15   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; JSD: 0.961   shared clusters: 5 e.g. {Jason Suecof, Nick De Caro, Robert Day, Matt Brown, …} {girl, girls} {president, person, president}
(Agent $e $x)
(As $e $x)

;; [pooled role]  Instrument ~ Patient   n 34 / 455   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.961   shared clusters: 5 e.g. {snow, snowstorm, deep, snow} {road, motorway, roads} {blood}
(Instrument $e $x)
(Patient $e $x)

;; [pooled role]  Stimulus ~ To   n 34 / 46   gate: FAIL
;; A fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.961   shared clusters: 1 e.g. {thing, things}
(Stimulus $e $x)
(To $e $x)

;; [pooled role]  Agent ~ Location   n 888 / 210   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.962   shared clusters: 15 e.g. {Santiago, Havana} {sun, sunlight, direct sun} {fire, burn, scorch}
(Agent $e $x)
(Location $e $x)

;; [pooled role]  Experiencer ~ To   n 261 / 46   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.962   shared clusters: 3 e.g. {thing, things} {George Allen, James David Edgar, Chuck Robb} {doctor, doctors}
(Experiencer $e $x)
(To $e $x)

;; [pooled role]  As ~ Result   n 15 / 43   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.963   shared clusters: 1 e.g. {direct, straight, directly}
(As $e $x)
(Result $e $x)

;; [pooled role]  CoAgent ~ Experiencer   n 16 / 261   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.966   shared clusters: 2 e.g. {cat, cats} {Linda, Amanda, Loren, Dora Smith, …}
(CoAgent $e $x)
(Experiencer $e $x)

;; [pooled role]  CoAgent ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.966   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
(CoAgent $e $x)
(Goal $e $x)

;; [pooled role]  Instrument ~ Recipient   n 34 / 29   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.968   shared clusters: 1 e.g. {crop, rice crop, corn, crops}
(Instrument $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ For   n 888 / 39   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 0.969   shared clusters: 5 e.g. {bus, bus ride} {cook} {ship, merchant ship, modern ship}
(Agent $e $x)
(For $e $x)

;; [pooled role]  Goal ~ Result   n 93 / 43   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.969   shared clusters: 2 e.g. {dead, die, death, die down, …} {well, on, there, be}
(Goal $e $x)
(Result $e $x)

;; [pooled role]  In ~ Result   n 50 / 43   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.97   shared clusters: 1 e.g. {silent, silence}
(In $e $x)
(Result $e $x)

;; [pooled role]  Goal ~ In   n 93 / 50   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.971   shared clusters: 2 e.g. {way, ways} {field, fields}
(Goal $e $x)
(In $e $x)

;; [pooled role]  Instrument ~ Stimulus   n 34 / 34   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.971   shared clusters: 1 e.g. {food, eat}
(Instrument $e $x)
(Stimulus $e $x)

;; [pooled role]  In ~ Location   n 50 / 210   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.972   shared clusters: 3 e.g. {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; [pooled role]  Goal ~ Recipient   n 93 / 29   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.973   shared clusters: 1 e.g. {Linda, Amanda, Loren, Dora Smith, …}
(Goal $e $x)
(Recipient $e $x)

;; [pooled role]  In ~ Theme   n 50 / 594   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.973   shared clusters: 6 e.g. {language, english} {understand, misunderstand} {green, greenery}
(In $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Instrument   n 261 / 34   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.974   shared clusters: 3 e.g. {train} {road, motorway, roads} {crop, rice crop, corn, crops}
(Experiencer $e $x)
(Instrument $e $x)

;; [pooled role]  Holder ~ Instrument   n 48 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
(Holder $e $x)
(Instrument $e $x)

;; [pooled role]  Instrument ~ Source   n 34 / 47   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
(Instrument $e $x)
(Source $e $x)

;; [pooled role]  Result ~ Theme   n 43 / 594   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.975   shared clusters: 5 e.g. {sleep} {cheap, inexpensive, low, price} {powerful, power}
(Result $e $x)
(Theme $e $x)

;; [pooled role]  Source ~ Stimulus   n 47 / 34   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.975   shared clusters: 1 e.g. {food, eat}
(Source $e $x)
(Stimulus $e $x)

;; [pooled role]  In ~ Stimulus   n 50 / 34   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.976   shared clusters: 1 e.g. {poetry}
(In $e $x)
(Stimulus $e $x)

;; [pooled role]  In ~ Manner   n 50 / 115   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.977   shared clusters: 1 e.g. {really, real, reality, actual, …}
(In $e $x)
(Manner $e $x)

;; [pooled role]  Agent ~ Result   n 888 / 43   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.978   shared clusters: 4 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {crow, caw} {cold, frost}
(Agent $e $x)
(Result $e $x)

;; [pooled role]  Before ~ Goal   n 16 / 93   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; JSD: 0.978   shared clusters: 1 e.g. {escape, exit}
(Before $e $x)
(Goal $e $x)

;; [pooled role]  In ~ Patient   n 50 / 455   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.978   shared clusters: 3 e.g. {weather} {field, fields} {water, water source, clear, water, good, water}
(In $e $x)
(Patient $e $x)

;; [pooled role]  Location ~ To   n 210 / 46   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 0.978   shared clusters: 2 e.g. {talk, conversation, discussion} {shore, coast, shoreline}
(Location $e $x)
(To $e $x)

;; [pooled role]  Result ~ Source   n 43 / 47   gate: FAIL
;; A fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.978   shared clusters: 1 e.g. {bat}
(Result $e $x)
(Source $e $x)

;; [pooled role]  CoAgent ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.979   shared clusters: 2 e.g. {Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Linda, Amanda, Loren, Dora Smith, …}
(CoAgent $e $x)
(Theme $e $x)

;; [pooled role]  In ~ Source   n 50 / 47   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.979   shared clusters: 1 e.g. {way, ways}
(In $e $x)
(Source $e $x)

;; [pooled role]  Instrument ~ Theme   n 34 / 594   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.98   shared clusters: 2 e.g. {food, eat} {drum, snare, drums}
(Instrument $e $x)
(Theme $e $x)

;; [pooled role]  As ~ Theme   n 15 / 594   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.981   shared clusters: 2 e.g. {name} {girl, girls}
(As $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ In   n 261 / 50   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.981   shared clusters: 2 e.g. {weather} {nothing, no, empty, zero, …}
(Experiencer $e $x)
(In $e $x)

;; [pooled role]  Experiencer ~ Manner   n 261 / 115   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.983   shared clusters: 2 e.g. {widespread, widely, wide, attention, widespread, …} {happiness, happy, happily, joy}
(Experiencer $e $x)
(Manner $e $x)

;; [pooled role]  Goal ~ Instrument   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.983   shared clusters: 1 e.g. {snow, snowstorm, deep, snow}
(Goal $e $x)
(Instrument $e $x)

;; [pooled role]  Location ~ Recipient   n 210 / 29   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 0.983   shared clusters: 1 e.g. {city, cities}
(Location $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ Instrument   n 888 / 34   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; JSD: 0.984   shared clusters: 4 e.g. {train} {plant, plants} {snow, snowstorm, deep, snow}
(Agent $e $x)
(Instrument $e $x)

;; [pooled role]  Experiencer ~ For   n 261 / 39   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; JSD: 0.984   shared clusters: 2 e.g. {happiness, happy, happily, joy} {general, general purpose}
(Experiencer $e $x)
(For $e $x)

;; [pooled role]  Manner ~ Stimulus   n 115 / 34   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 0.985   shared clusters: 1 e.g. {difficult, hard, difficulty, harder}
(Manner $e $x)
(Stimulus $e $x)

;; [pooled role]  For ~ Manner   n 39 / 115   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.986   shared clusters: 1 e.g. {happiness, happy, happily, joy}
(For $e $x)
(Manner $e $x)

;; [pooled role]  Goal ~ Time   n 93 / 107   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {back, backward, before, past}
(Goal $e $x)
(Time $e $x)

;; [pooled role]  Source ~ Time   n 47 / 107   gate: FAIL
;; A fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.986   shared clusters: 1 e.g. {point, point out}
(Source $e $x)
(Time $e $x)

;; [pooled role]  As ~ Experiencer   n 15 / 261   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; JSD: 0.987   shared clusters: 1 e.g. {caretaker, keeper}
(As $e $x)
(Experiencer $e $x)

;; [pooled role]  Agent ~ Source   n 888 / 47   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: Manila ×2, here ×2, Narita, New York, Pyongyang, aeroplane
;; JSD: 0.988   shared clusters: 2 e.g. {plane, flight, aeroplane, airplane, …} {school, education}
(Agent $e $x)
(Source $e $x)

;; [pooled role]  Like ~ Theme   n 14 / 594   gate: FAIL
;; A fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.988   shared clusters: 2 e.g. {imprison, jail, prison} {gold coin, gold, gold coins}
(Like $e $x)
(Theme $e $x)

;; [pooled role]  Location ~ Manner   n 210 / 115   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.988   shared clusters: 1 e.g. {well, on, there, be}
(Location $e $x)
(Manner $e $x)

;; [pooled role]  Patient ~ Time   n 455 / 107   gate: FAIL
;; A fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.988   shared clusters: 2 e.g. {night, tonight, midnight} {summer, this summer}
(Patient $e $x)
(Time $e $x)

;; [pooled role]  Manner ~ Theme   n 115 / 594   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.989   shared clusters: 2 e.g. {widespread, widely, wide, attention, widespread, …} {really, real, reality, actual, …}
(Manner $e $x)
(Theme $e $x)

;; [pooled role]  Instrument ~ Location   n 34 / 210   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; JSD: 0.99   shared clusters: 1 e.g. {snow, snowstorm, deep, snow}
(Instrument $e $x)
(Location $e $x)

;; [pooled role]  Agent ~ Time   n 888 / 107   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.991   shared clusters: 2 e.g. {hurricane, hurricane season} {spring}
(Agent $e $x)
(Time $e $x)

;; [pooled role]  Location ~ Result   n 210 / 43   gate: FAIL
;; A fillers: table ×6, Japan ×5, couch ×5, here ×5, Kazakhstan ×4, cafe ×4
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 0.991   shared clusters: 1 e.g. {well, on, there, be}
(Location $e $x)
(Result $e $x)

;; [pooled role]  CoAgent ~ Patient   n 16 / 455   gate: FAIL
;; A fillers: Bianca Olsen ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2, family ×2, Amanda
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.992   shared clusters: 1 e.g. {family, families}
(CoAgent $e $x)
(Patient $e $x)

;; [pooled role]  As ~ Patient   n 15 / 455   gate: FAIL
;; A fillers: Peter ×2, caretaker ×2, Scott Wells, girl, governor, joke
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.993   shared clusters: 1 e.g. {name}
(As $e $x)
(Patient $e $x)

;; [pooled role]  Before ~ Theme   n 16 / 594   gate: FAIL
;; A fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; B fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; JSD: 0.994   shared clusters: 1 e.g. {repair, repairs}
(Before $e $x)
(Theme $e $x)

;; [pooled role]  For ~ Patient   n 39 / 455   gate: FAIL
;; A fillers: Oscar ×3, portray ×3, fresh, start ×2, job ×2, term ×2, Bombay
;; B fillers: thing ×13, door ×8, people ×8, person ×7, movie ×6, room ×5
;; JSD: 0.994   shared clusters: 1 e.g. {call, telephone call}
(For $e $x)
(Patient $e $x)

;; [pooled role]  Theme ~ Time   n 594 / 107   gate: FAIL
;; A fillers: thing ×20, person ×7, views ×7, things ×6, work ×6, Ashe ×4
;; B fillers: now ×14, today ×10, night ×7, this year ×6, yesterday ×6, tonight ×5
;; JSD: 0.995   shared clusters: 1 e.g. {morning, early morning, this morning}
(Theme $e $x)
(Time $e $x)

;; [pooled role]  Agent ~ Like   n 888 / 14   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 0.996   shared clusters: 1 e.g. {centipede, centipedes, pillar}
(Agent $e $x)
(Like $e $x)

;; [pooled role]  Agent ~ In   n 888 / 50   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; JSD: 0.997   shared clusters: 1 e.g. {really, real, reality, actual, …}
(Agent $e $x)
(In $e $x)

;; [pooled role]  Agent ~ Manner   n 888 / 115   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 0.997   shared clusters: 1 e.g. {really, real, reality, actual, …}
(Agent $e $x)
(Manner $e $x)

;; [pooled role]  Agent ~ Before   n 888 / 16   gate: FAIL
;; A fillers: person ×44, thing ×21, company ×19, people ×10, children ×8, father ×7
;; B fillers: cease ×2, expand ×2, move back ×2, take over ×2, Memorial Day, break out
;; JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Before $e $x)

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

;; [pooled role]  Experiencer ~ Like   n 261 / 14   gate: FAIL
;; A fillers: people ×5, diverse, established, genre ×4, thing ×4, Boris ×3, Low German ×3, Oleg ×3
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Like $e $x)

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

;; [pooled role]  Goal ~ Like   n 93 / 14   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: aspects ×2, Kermit the Frog, developed country, flame, fragile, gold, hot cake
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Like $e $x)

;; [pooled role]  Goal ~ Stimulus   n 93 / 34   gate: FAIL
;; A fillers: bed ×4, home ×4, Altoona ×2, Baltimore ×2, Germany ×2, Giresun ×2
;; B fillers: thing ×3, Jessica, Mandela, action, appropriate, animal, animals
;; JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Stimulus $e $x)

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

;; [pooled role]  In ~ Recipient   n 50 / 29   gate: FAIL
;; A fillers: continuous time ×2, discrete time ×2, english ×2, fluid mechanics ×2, japanese ×2, mathematics ×2
;; B fillers: Cameron ×2, Harvey ×2, Paulus ×2, kids ×2, person ×2, police ×2
;; JSD: 1.0   shared clusters: 0
(In $e $x)
(Recipient $e $x)

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

;; [pooled role]  Instrument ~ Manner   n 34 / 115   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Manner $e $x)

;; [pooled role]  Instrument ~ Result   n 34 / 43   gate: FAIL
;; A fillers: help ×3, barometer ×2, bike, blood, brand new, ferrari, chalk
;; B fillers: bad ×4, black ×2, red ×2, alarmed, backward, country, bat
;; JSD: 1.0   shared clusters: 0
(Instrument $e $x)
(Result $e $x)

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

;; [pooled role]  Manner ~ To   n 115 / 46   gate: FAIL
;; A fillers: quickly ×11, well ×6, directly ×4, immediately ×4, often ×4, carefully ×3
;; B fillers: accompany ×4, avoid ×3, talk ×3, bake ×2, learn ×2, make ×2
;; JSD: 1.0   shared clusters: 0
(Manner $e $x)
(To $e $x)

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

;; ==================== SLOT PAIRS: 3 pass the gate (event 3, entity 0); 69 pairs listed = every pair with >= 2 shared clusters (event 67, entity 2) among the 32718 pairs of 256 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's 'go to.Agent' reading: one (class, role) slot against every other slot of its centre kind)

;; [different class and role]  die.Patient ~ sleep.Agent   n 4 / 3   gate: PASS
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; JSD: 0.006   shared clusters: 2 e.g. {person, people} {family, families}
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 6   gate: PASS
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000259
;; JSD: 0.23   shared clusters: 2 e.g. {person, people} {sister, sisters}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  design.Agent ~ produce.Agent   n 4 / 8   gate: PASS
;; A fillers: Henry L. Taylor ×2, Philip Hercus, Robert Allan Limited   e.g. tierC-000184 tierC-000119
;; B fillers: Colin Richardson ×2, Harvey Hayutin ×2, Sy Weintraub ×2, layer, oil, thin, pancreas   e.g. tierC-000103 tierC-000104
;; JSD: 0.25   shared clusters: 2 e.g. {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(And (Member $e0 design) (Agent $e0 $x1))
(And (Member $e0 produce) (Agent $e0 $x1))

;; [same class, different role]  welcome.Agent ~ welcome.Theme   n 3 / 3   gate: FAIL
;; A fillers: host, industrialization, whigs   e.g. tierC-000087 tierC-000088
;; B fillers: guests, industrialization, whigs   e.g. tierB-001868 tierC-000088
;; JSD: 0.333   shared clusters: 2 e.g. {industrialization} {whig, whigs}
(And (Member $e0 welcome) (Agent $e0 $x1))
(And (Member $e0 welcome) (Theme $e0 $x1))

;; [different class and role]  kill.Patient ~ spend.Agent   n 11 / 4   gate: FAIL
;; A fillers: people ×4, person ×2, fox, gazelle, soldier, soldiers   e.g. tierB-001197 tierB-000393
;; B fillers: person ×2, May, giraffes   e.g. tierB-001146 tierC-000047
;; JSD: 0.335   shared clusters: 2 e.g. {person, people} {gazelle, giraffe, giraffes}
(And (Member $e0 kill) (Patient $e0 $x1))
(And (Member $e0 spend) (Agent $e0 $x1))

;; [same role, different class]  portray.Agent ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000301
;; JSD: 0.349   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: person ×2, sisters ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001901 tierC-000330
;; JSD: 0.357   shared clusters: 2 e.g. {sister, sisters} {person, people}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [different class and role]  appear.Agent ~ replace.Theme   n 6 / 4   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000128
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000099 tierC-000100
;; JSD: 0.368   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 replace) (Theme $e0 $x1))

;; [different class and role]  portray.Theme ~ win.Agent   n 5 / 7   gate: FAIL
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000277
;; B fillers: James Woods ×2, Wilson ×2, away team, horse, wilson   e.g. tierB-000730 tierC-000278
;; JSD: 0.38   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
(And (Member $e0 portray) (Theme $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [same role, different class]  replace.Agent ~ write.Agent   n 4 / 8   gate: FAIL
;; A fillers: Sherman Howard ×2, Peter Gaussen, person   e.g. tierC-000100 tierC-000359
;; B fillers: Bill Wrubel ×2, Gilles Thibaut ×2, person ×2, busy, father, famous, person   e.g. tierC-000089 tierC-000090
;; JSD: 0.406   shared clusters: 2 e.g. {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} {person, people}
(And (Member $e0 replace) (Agent $e0 $x1))
(And (Member $e0 write) (Agent $e0 $x1))

;; [same role, different class]  sleep.Agent ~ watch.Agent   n 3 / 5   gate: FAIL
;; A fillers: person ×2, family   e.g. tierC-000041 tierC-000042
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; JSD: 0.408   shared clusters: 2 e.g. {person, people} {family, families}
(And (Member $e0 sleep) (Agent $e0 $x1))
(And (Member $e0 watch) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ watch.Agent   n 4 / 5   gate: FAIL
;; A fillers: person ×2, families, people   e.g. tierB-001967 tierC-000199
;; B fillers: Baya, coach, family, government, people   e.g. tierB-000258 tierB-000520
;; JSD: 0.424   shared clusters: 2 e.g. {person, people} {family, families}
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 watch) (Agent $e0 $x1))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 5 / 5   gate: FAIL
;; A fillers: Soichiro Akizuki ×2, James Woods, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson   e.g. tierC-000301 tierC-000247
;; JSD: 0.449   shared clusters: 2 e.g. {Wilson, wilson} {James Woods, Jeremy Irons}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 portray) (Theme $e0 $x1))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 6 / 9   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000128 tierC-000050
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierC-000127 tierB-001901
;; JSD: 0.487   shared clusters: 2 e.g. {person, people} {sister, sisters}
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same role, different class]  begin.Agent ~ create.Agent   n 11 / 6   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierC-000025 tierC-000026
;; B fillers: european american settlers ×2, Paul, indigenous americans, native americans, writer   e.g. tierB-000728 tierB-000863
;; JSD: 0.517   shared clusters: 2 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 create) (Agent $e0 $x1))

;; [different class and role]  bear.Patient ~ study.Agent   n 6 / 12   gate: FAIL
;; A fillers: person ×3, Tobias, Tycho Brahe, man, poor   e.g. tierC-000199 tierC-000200
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; JSD: 0.541   shared clusters: 2 e.g. {person, people} {Nicolaus Copernicus, Tycho Brahe}
(And (Member $e0 bear) (Patient $e0 $x1))
(And (Member $e0 study) (Agent $e0 $x1))

;; [same role, different class]  appear.Agent ~ build.Agent   n 6 / 14   gate: FAIL
;; A fillers: person ×3, Brian Packham ×2, sisters   e.g. tierC-000050 tierC-000128
;; B fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000071 tierC-000072
;; JSD: 0.545   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 build) (Agent $e0 $x1))

;; [same role, different class]  direct.Patient ~ produce.Patient   n 5 / 11   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, cyanide, harmless, trace, destined, film, syrian film, film, syrian film, insulin   e.g. tierC-000009 tierC-000092
;; JSD: 0.545   shared clusters: 2 e.g. {movie, film} {syrian film, film, syrian film, destined, film, syrian film}
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 produce) (Patient $e0 $x1))

;; [same class, different role]  find.Agent ~ find.Theme   n 4 / 10   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierC-000243 tierC-000244
;; B fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierB-000706 tierC-000279
;; JSD: 0.547   shared clusters: 2 e.g. {Couper} {Martino, Pietro, Lorenzo, Damiano}
(And (Member $e0 find) (Agent $e0 $x1))
(And (Member $e0 find) (Theme $e0 $x1))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; JSD: 0.554   shared clusters: 2 e.g. {Skura, Inomaru, Barako} {Rima}
(And (Member $e0 cry) (Agent $e0 $x1))
(And (Member $e0 stop) (Agent $e0 $x1))

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura, Inomaru, Barako} {Yanni}
(And (Member $e0 ready) (Experiencer $e0 $x1))
(And (Member $e0 stop) (Agent $e0 $x1))

;; [different class and role]  give.Agent ~ hear.Experiencer   n 3 / 8   gate: FAIL
;; A fillers: Vladimir ×2, William   e.g. tierB-001046 tierB-000137
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-001479 tierB-000681
;; JSD: 0.557   shared clusters: 2 e.g. {Oleg, Vladimir} {William, James}
(And (Member $e0 give) (Agent $e0 $x1))
(And (Member $e0 hear) (Experiencer $e0 $x1))

;; [different class and role]  change.Patient ~ good.Experiencer   n 8 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000517 tierB-001491
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-000495 tierB-001238
;; JSD: 0.578   shared clusters: 2 e.g. {weather} {thing, things}
(And (Member $e0 change) (Patient $e0 $x1))
(And (Member $e0 good) (Experiencer $e0 $x1))

;; [same role, different class]  get.Agent ~ take.Agent   n 6 / 9   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.595   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
(And (Member $e0 get) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same role, different class]  eat.Agent ~ sing.Agent   n 4 / 9   gate: FAIL
;; A fillers: birds, brown, dog, children, person   e.g. tierB-001973 tierB-000338
;; B fillers: person ×2, sisters ×2, Amateur Barbershop Harmony Society, David, actress, birds   e.g. tierB-001901 tierC-000127
;; JSD: 0.604   shared clusters: 2 e.g. {person, people} {bird, bird dropping, birds}
(And (Member $e0 eat) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [different class and role]  bad.Experiencer ~ get.Patient   n 4 / 7   gate: FAIL
;; A fillers: bad, relationship ×2, bad, matter, bad, weather   e.g. tierB-001594 tierB-000748
;; B fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000890
;; JSD: 0.628   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {bad, weather}
(And (Member $e0 bad) (Experiencer $e0 $x1))
(And (Member $e0 get) (Patient $e0 $x1))

;; [different class and role]  build.Agent ~ replace.Theme   n 14 / 4   gate: FAIL
;; A fillers: company ×8, O. R. Woodcock ×2, person ×2, community, mozabites   e.g. tierC-000071 tierC-000072
;; B fillers: Lex Lex Luthor, Lex Luthor, William Ewer, person   e.g. tierC-000099 tierC-000100
;; JSD: 0.628   shared clusters: 2 e.g. {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(And (Member $e0 build) (Agent $e0 $x1))
(And (Member $e0 replace) (Theme $e0 $x1))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-001219
;; JSD: 0.636   shared clusters: 2 e.g. {girl, girls} {Skura, Inomaru, Barako}
(And (Member $e0 cry) (Agent $e0 $x1))
(And (Member $e0 start) (Agent $e0 $x1))

;; [same class, different role]  become.Patient ~ become.Result   n 11 / 8   gate: FAIL
;; A fillers: bad, relationship ×2, indigenous, people ×2, Lady Ashton, conservative, revolutionary, discipline, lax, earth, red   e.g. tierB-001817 tierC-000237
;; B fillers: bad ×2, alarmed, conservative, indigenous, inomaru, lax   e.g. tierC-000001 tierB-001079
;; JSD: 0.638   shared clusters: 3 e.g. {indigenous, indigenous, people, native american, indigenous american, …} {conservative, conservative, revolutionary} {inomaru, inomaru, person}
(And (Member $e0 become) (Patient $e0 $x1))
(And (Member $e0 become) (Result $e0 $x1))

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 9 / 3   gate: FAIL
;; A fillers: bhadalas ×2, Alexander, Bailey, Sami, beast, crawling, house, muslim   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Alexander} {Bailey}
(And (Member $e0 follow) (Agent $e0 $x1))
(And (Member $e0 succeed) (Agent $e0 $x1))

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 9 / 3   gate: FAIL
;; A fillers: region ×2, traditions ×2, Henry Cole, Layla, Lukas, Margaret Fleming   e.g. tierC-000076 tierC-000337
;; B fillers: Henry Cole, Margaret Fleming, person   e.g. tierC-000075 tierC-000338
;; JSD: 0.639   shared clusters: 2 e.g. {Margaret Fleming, Martha, Anne, Marie} {Henry Cole}
(And (Member $e0 follow) (Theme $e0 $x1))
(And (Member $e0 succeed) (Theme $e0 $x1))

;; [same role, different class]  go.Agent ~ talk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierC-000209 tierC-000210
;; B fillers: Katherine ×2, Daniel, Jordan Peterson, Linda, friends, novelist   e.g. tierB-000327 tierB-000078
;; JSD: 0.643   shared clusters: 3 e.g. {Katherine, Isabella, Kate} {Linda, Amanda, Loren, Dora Smith, …} {Daniel}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 talk) (Agent $e0 $x1))

;; [same role, different class]  leave.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-001350
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.645   shared clusters: 3 e.g. {person, people} {Michael, Marco, Marcus} {Gustavo, Alberto, Diego, Rodrigo, …}
(And (Member $e0 leave) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same role, different class]  serve.Agent ~ take.Agent   n 10 / 9   gate: FAIL
;; A fillers: Indooroopilly ×2, Ipswich, Ipswich & Rosewood, Janos, Rosewood, Yitzhak   e.g. tierC-000054 tierC-000053
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.645   shared clusters: 3 e.g. {person, people} {president, person, president} {Janos, Miroslav, Lajos}
(And (Member $e0 serve) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [different class and role]  find.Agent ~ hear.Experiencer   n 4 / 8   gate: FAIL
;; A fillers: Couper ×2, Flavio, Pietro   e.g. tierB-001139 tierB-000706
;; B fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000751 tierB-000189
;; JSD: 0.656   shared clusters: 2 e.g. {Adriano, Claudio, Flavio} {Martino, Pietro, Lorenzo, Damiano}
(And (Member $e0 find) (Agent $e0 $x1))
(And (Member $e0 hear) (Experiencer $e0 $x1))

;; [same role, different class]  add.Agent ~ take.Agent   n 5 / 9   gate: FAIL
;; A fillers: thing ×2, J. Augustus Knapp, cook, plants   e.g. tierC-000227 tierC-000228
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000942
;; JSD: 0.661   shared clusters: 2 e.g. {thing, things} {cook}
(And (Member $e0 add) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same role, different class]  study.Agent ~ take.Agent   n 12 / 9   gate: FAIL
;; A fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierC-000071 tierC-000072
;; JSD: 0.669   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Diego, Rodrigo, …}
(And (Member $e0 study) (Agent $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same class, different role]  form.Agent ~ form.Patient   n 7 / 6   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, complex, simple, labourers, technetium   e.g. tierC-000164 tierC-000163
;; B fillers: main songwriting unit ×2, complex, simple, human barricade, main, songwriting unit, technetium   e.g. tierB-000780 tierC-000179
;; JSD: 0.692   shared clusters: 2 e.g. {complex, complex, simple, complicated} {technetium}
(And (Member $e0 form) (Agent $e0 $x1))
(And (Member $e0 form) (Patient $e0 $x1))

;; [same class, different role]  get.Patient ~ get.Result   n 7 / 6   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000370
;; B fillers: bad, cheap, expensive, powerful, ready, short   e.g. tierB-000748 tierB-000206
;; JSD: 0.692   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {expensive, expensive, thing}
(And (Member $e0 get) (Patient $e0 $x1))
(And (Member $e0 get) (Result $e0 $x1))

;; [different class and role]  lead.Agent ~ start.Patient   n 5 / 11   gate: FAIL
;; A fillers: thing ×2, dog, education, general   e.g. tierB-001086 tierC-000019
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001446 tierB-001816
;; JSD: 0.7   shared clusters: 2 e.g. {thing, things} {dog, dog feed}
(And (Member $e0 lead) (Agent $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 15 / 6   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.74   shared clusters: 2 e.g. {cat, cats} {child, children, kid, kids}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 sleep) (Experiencer $e0 $x1))

;; [same role, different class]  leave.Agent ~ study.Agent   n 10 / 12   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000704
;; B fillers: person ×3, scientists ×2, Beth, Carlos, Fadil, Nicolaus Copernicus   e.g. tierC-000253 tierC-000254
;; JSD: 0.758   shared clusters: 2 e.g. {person, people} {Gustavo, Alberto, Diego, Rodrigo, …}
(And (Member $e0 leave) (Agent $e0 $x1))
(And (Member $e0 study) (Agent $e0 $x1))

;; [different class and role]  find.Theme ~ make.Agent   n 10 / 18   gate: FAIL
;; A fillers: thing ×4, Couper ×2, Pietro, clay figurines, meteorite, paper sheets   e.g. tierC-000279 tierC-000280
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000325
;; JSD: 0.773   shared clusters: 2 e.g. {thing, things} {Martino, Pietro, Lorenzo, Damiano}
(And (Member $e0 find) (Theme $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [same role, different class]  leave.Agent ~ work.Agent   n 10 / 8   gate: FAIL
;; A fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000747 tierB-000564
;; B fillers: Asserson, Dad, Dan, Dmitri, Mr. Jones, adaptor, old   e.g. tierB-001813 tierB-000212
;; JSD: 0.777   shared clusters: 2 e.g. {person, people} {Boris, Ivan, Dmitri, Rasputin}
(And (Member $e0 leave) (Agent $e0 $x1))
(And (Member $e0 work) (Agent $e0 $x1))

;; [same role, different class]  try.Agent ~ walk.Agent   n 10 / 8   gate: FAIL
;; A fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000487 tierB-000216
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000148 tierB-001044
;; JSD: 0.777   shared clusters: 2 e.g. {Felix} {Adriano, Claudio, Flavio}
(And (Member $e0 try) (Agent $e0 $x1))
(And (Member $e0 walk) (Agent $e0 $x1))

;; [same role, different class]  go.Agent ~ swim.Agent   n 15 / 5   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001496 tierB-000313
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; JSD: 0.784   shared clusters: 2 e.g. {child, children, kid, kids} {Linda, Amanda, Loren, Dora Smith, …}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 swim) (Agent $e0 $x1))

;; [same role, different class]  go.Agent ~ speak.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-000012 tierB-001857
;; B fillers: Oates ×2, Sophia ×2, Kari Wahlgren, Mie Sonozaki, Xavier, men   e.g. tierB-000271 tierC-000094
;; JSD: 0.793   shared clusters: 2 e.g. {Olivia, Sophia} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 speak) (Agent $e0 $x1))

;; [different class and role]  hear.Stimulus ~ start.Patient   n 9 / 11   gate: FAIL
;; A fillers: bang, barking, growling, noises, crash, knock, music, upbeat, noise, ticking   e.g. tierB-000751 tierB-000756
;; B fillers: Milky Way, blue, pockets, sky, concert, crack, dog feed, freedom movement, gusher   e.g. tierB-001899 tierB-001816
;; JSD: 0.799   shared clusters: 2 e.g. {knock} {thing, things}
(And (Member $e0 hear) (Stimulus $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.802   shared clusters: 2 e.g. {Martino, Pietro, Lorenzo, Damiano} {William, James}
(And (Member $e0 hear) (Experiencer $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [same role, different class]  begin.Agent ~ try.Agent   n 11 / 10   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.809   shared clusters: 2 e.g. {Mark} {David}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 try) (Agent $e0 $x1))

;; [same role, different class]  go.Agent ~ play.Agent   n 15 / 15   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001496 tierB-001857
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-000160 tierB-000648
;; JSD: 0.813   shared clusters: 2 e.g. {child, children, kid, kids} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 play) (Agent $e0 $x1))

;; [different class and role]  get.Agent ~ have.Holder   n 6 / 44   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-000577
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.82   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
(And (Member $e0 get) (Agent $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [same role, different class]  get.Agent ~ make.Agent   n 6 / 18   gate: FAIL
;; A fillers: Diego, Gabriel, Janos, Leonid, man, young, thing   e.g. tierB-000770 tierB-001325
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001831 tierB-000025
;; JSD: 0.82   shared clusters: 2 e.g. {thing, things} {Elias, Gabriel}
(And (Member $e0 get) (Agent $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [same role, different class]  go.Agent ~ walk.Agent   n 15 / 8   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001857 tierB-001145
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000951 tierB-001044
;; JSD: 0.821   shared clusters: 2 e.g. {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …} {Adriano, Claudio, Flavio}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 walk) (Agent $e0 $x1))

;; [different class and role]  build.Patient ~ have.Holder   n 18 / 44   gate: FAIL
;; A fillers: hotel ×4, room ×3, horn ×2, paper factory ×2, paper mill ×2, thing ×2   e.g. tierC-000045 tierC-000046
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001043 tierB-001264
;; JSD: 0.827   shared clusters: 3 e.g. {hotel} {room, rooms} {thing, things}
(And (Member $e0 build) (Patient $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [same role, different class]  make.Agent ~ walk.Agent   n 18 / 8   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001623 tierB-000951
;; B fillers: Adriano, Felix, Hanako, Leon, Michael, ant   e.g. tierB-000324 tierB-001219
;; JSD: 0.839   shared clusters: 2 e.g. {customer, customers} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(And (Member $e0 make) (Agent $e0 $x1))
(And (Member $e0 walk) (Agent $e0 $x1))

;; [same role, different class]  get.Patient ~ make.Patient   n 7 / 20   gate: FAIL
;; A fillers: Iran, bad, problem, bad, weather, big, fire, cheap, excuses, days, short   e.g. tierB-001910 tierB-000206
;; B fillers: Afghanistan, Augustus, Isabella, bad, matter, beautiful, room, big, difference   e.g. tierB-001594 tierB-001504
;; JSD: 0.841   shared clusters: 2 e.g. {bad, bad, matter, bad, problem} {Afghanistan, Iran, Iraq, Persia}
(And (Member $e0 get) (Patient $e0 $x1))
(And (Member $e0 make) (Patient $e0 $x1))

;; [different class and role]  have.Holder ~ take.Agent   n 44 / 9   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: person ×2, Gustavo, Jerry Rawlings, Lajos, Michael, cook   e.g. tierB-000978 tierB-000987
;; JSD: 0.844   shared clusters: 3 e.g. {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Janos, Miroslav, Lajos}
(And (Member $e0 have) (Holder $e0 $x1))
(And (Member $e0 take) (Agent $e0 $x1))

;; [same role, different class]  begin.Agent ~ make.Agent   n 11 / 18   gate: FAIL
;; A fillers: european american settlers ×2, David, Jessica, Mark, William, crowd   e.g. tierB-000240 tierB-000173
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000073
;; JSD: 0.86   shared clusters: 2 e.g. {William, James} {David}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [different class and role]  direct.Patient ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: episode ×2, film, syrian film, movie, thing   e.g. tierC-000138 tierC-000091
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; JSD: 0.862   shared clusters: 2 e.g. {thing, things} {movie, film}
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [different class and role]  have.Holder ~ leave.Agent   n 44 / 10   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001861 tierB-000358
;; B fillers: Brian, Ivan, Marcus, Rodrigo, Tom, bus   e.g. tierB-000564 tierB-000004
;; JSD: 0.873   shared clusters: 3 e.g. {Boris, Ivan, Dmitri, Rasputin} {Thomas, Tom, Tommy} {Gustavo, Alberto, Diego, Rodrigo, …}
(And (Member $e0 have) (Holder $e0 $x1))
(And (Member $e0 leave) (Agent $e0 $x1))

;; [same role, different class]  go.Agent ~ make.Agent   n 15 / 18   gate: FAIL
;; A fillers: Katherine ×2, Daniel, Donald, Flavio, Kalman, Linda   e.g. tierB-001183 tierB-001857
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000073 tierB-000951
;; JSD: 0.879   shared clusters: 2 e.g. {cat, cats} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(And (Member $e0 go) (Agent $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [same role, different class]  make.Agent ~ play.Agent   n 18 / 15   gate: FAIL
;; A fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-001457 tierB-000951
;; B fillers: children ×3, Boston Red Sox ×2, Cincinnati Reds ×2, Audrey Hepburn, Audrey Heppurn, Tony   e.g. tierB-001840 tierB-000939
;; JSD: 0.879   shared clusters: 2 e.g. {boy, boys} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(And (Member $e0 make) (Agent $e0 $x1))
(And (Member $e0 play) (Agent $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 44   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-001690 tierB-000368
;; B fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-001016 tierB-001103
;; JSD: 0.894   shared clusters: 2 e.g. {house, home, houses} {food, eat}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 have) (Holder $e0 $x1))

;; [same entity class, different head]  <unclassed>.PartOf ~ <unclassed>.Possession   n 11 / 30   gate: FAIL
;; A fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierC-000314 tierC-000114
;; B fillers: person ×5, Free Soil Party ×4, Republican Party ×4, subsequent game ×2, Dora Smith, God   e.g. tierC-000313 tierC-000113
;; JSD: 0.896   shared clusters: 2 e.g. {Yunnan} {islamic ivory, ivory}
(PartOf $x0 $x1)
(Possession $x0 $x1)

;; [different class and role]  change.Patient ~ have.Theme   n 8 / 43   gate: FAIL
;; A fillers: weather ×2, color, course, mind, name, rain   e.g. tierB-000098 tierB-001217
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000722 tierB-000162
;; JSD: 0.907   shared clusters: 2 e.g. {color} {thing, things}
(And (Member $e0 change) (Patient $e0 $x1))
(And (Member $e0 have) (Theme $e0 $x1))

;; [different class and role]  have.Holder ~ use.Theme   n 44 / 23   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierB-000142 tierB-001177
;; B fillers: banach mackey topology ×2, weak arens space topology ×2, Iga, Laravel, Midway, auto tune   e.g. tierB-000971 tierB-001154
;; JSD: 0.908   shared clusters: 3 e.g. {sentence, sentences} {word, word processor} {room, rooms}
(And (Member $e0 have) (Holder $e0 $x1))
(And (Member $e0 use) (Theme $e0 $x1))

;; [same entity class, different head]  <unclassed>.LocatedIn ~ <unclassed>.PartOf   n 46 / 11   gate: FAIL
;; A fillers: here ×3, Derwent Isle ×2, city ×2, class ×2, garden ×2, southern ×2   e.g. tierB-000523 tierB-001111
;; B fillers: Khurda Road ×2, Yunnan, animal, cake, islamic ivory, ivy   e.g. tierB-001932 tierB-001966
;; JSD: 0.92   shared clusters: 2 e.g. {play} {street, road, street}
(LocatedIn $x0 $x1)
(PartOf $x0 $x1)

;; [same class, different role]  have.Holder ~ have.Theme   n 44 / 43   gate: FAIL
;; A fillers: Kristoffer ×4, Karen ×2, thing ×2, town ×2, Algiers, Boldi   e.g. tierC-000271 tierC-000272
;; B fillers: children ×4, constant, entropy, uniform ×2, representation ×2, antlers, atmosphere, homely, bank, documents, valuable   e.g. tierB-000162 tierB-000797
;; JSD: 0.945   shared clusters: 2 e.g. {thing, things} {gas station, gas pump, gas pumps}
(And (Member $e0 have) (Holder $e0 $x1))
(And (Member $e0 have) (Theme $e0 $x1))
