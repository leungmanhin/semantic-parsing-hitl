;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_cosine_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: word texts @ cluster cosine 0.90 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful_cosine.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate       out_ecmp/canonical_iteme.jsonl (762 records); out_ecmp/valuations_occ.jsonl (3789 filler occurrences)
;;   embeddings      out_ecmp/embeddings: Qwen3-Embedding-8B, bf16, normalised; 888 texts, dim 4096
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
;;                   outside the distributions: 130 occurrences excluded in this block, 1819 filler units enter
;;   distribution    raw mass over clusters, no weighting
;;   per-slot floor  a (class, role) slot enters comparison at n >= 3 embedded fillers
;;   pooled floor    a head enters the pooled role level at n >= 14 embedded fillers
;;   gate            indistinguishable = cosine >= 0.5 between the two cluster-mass vectors,
;;                   with >= 2 shared clusters; JSD <= 0.4 is the sensitivity value (dial table in the .md report);
;;                   this is the REFERENCE gate; the adopted gate is JSD <= 0.3, rendered beside this file without the suffix
;;
;; RECORD FORMAT (every record is one pair, with its gate verdict)
;;   ;; [bucket]  A ~ B   n <embedded fillers of A> / <of B>   gate: PASS|FAIL
;;   ;; A fillers: the top fillers of A by mass (×mass when not 1)   e.g. <witness record ids>
;;   ;; B fillers: the same for B
;;   ;; cosine: <value> (gate)   JSD: <value>   shared clusters: <count> e.g. {cluster members} …
;;   <query A>
;;   <query B>
;; Pooled pairs: every head pair. Slot pairs: every pair with >= 2 shared clusters (the gate's first
;; condition); a pair sharing fewer clusters cannot pass and is not listed.
;; An event slot renders as (And (Member $e0 <class>) (<Role> $e0 $x1)), an entity slot as (<Head> $x0 $x1)
;; (an entity centre carries no class link), a pooled role as (<Role> $e $x); $x1 / $x stand for any filler.

;; ==================== POOLED ROLE LEVEL: 13 heads at n >= 14, 78 pairs, 0 pass the gate ====================
;; (the paper's 'Agent2 ~ Agent' reading: one head's fillers pooled over every predicate, against every other head's)

;; [pooled role]  Agent ~ Recipient   n 500 / 47   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.29 (gate)   JSD: 0.735   shared clusters: 21 e.g. {person, people} {school} {depot}
(Agent $e $x)
(Recipient $e $x)

;; [pooled role]  Agent ~ Experiencer   n 500 / 63   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; cosine: 0.28 (gate)   JSD: 0.894   shared clusters: 4 e.g. {person, people} {automobile, car, automobiles} {Aslan}
(Agent $e $x)
(Experiencer $e $x)

;; [pooled role]  Agent ~ Patient   n 500 / 159   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.25 (gate)   JSD: 0.855   shared clusters: 21 e.g. {person, people} {physician, doctor} {electrician}
(Agent $e $x)
(Patient $e $x)

;; [pooled role]  Experiencer ~ Patient   n 63 / 159   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.19 (gate)   JSD: 0.873   shared clusters: 9 e.g. {person, people} {movie, film} {relationship}
(Experiencer $e $x)
(Patient $e $x)

;; [pooled role]  Agent ~ Theme   n 500 / 367   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.15 (gate)   JSD: 0.822   shared clusters: 41 e.g. {person, people} {physician, doctor} {child}
(Agent $e $x)
(Theme $e $x)

;; [pooled role]  Patient ~ Theme   n 159 / 367   gate: FAIL
;; A fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.13 (gate)   JSD: 0.879   shared clusters: 15 e.g. {person, people} {song, sing} {movie, film}
(Patient $e $x)
(Theme $e $x)

;; [pooled role]  Recipient ~ Source   n 47 / 24   gate: FAIL
;; A fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.11 (gate)   JSD: 0.813   shared clusters: 6 e.g. {depot} {potter} {foreman}
(Recipient $e $x)
(Source $e $x)

;; [pooled role]  Agent ~ Source   n 500 / 24   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.11 (gate)   JSD: 0.862   shared clusters: 11 e.g. {school} {depot} {potter}
(Agent $e $x)
(Source $e $x)

;; [pooled role]  Beneficiary ~ Location   n 14 / 175   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.10 (gate)   JSD: 0.948   shared clusters: 1 e.g. {hall}
(Beneficiary $e $x)
(Location $e $x)

;; [pooled role]  Recipient ~ Theme   n 47 / 367   gate: FAIL
;; A fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.09 (gate)   JSD: 0.904   shared clusters: 8 e.g. {child} {person, people} {tower}
(Recipient $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Recipient   n 63 / 47   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.09 (gate)   JSD: 0.943   shared clusters: 1 e.g. {person, people}
(Experiencer $e $x)
(Recipient $e $x)

;; [pooled role]  Patient ~ Recipient   n 159 / 47   gate: FAIL
;; A fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.09 (gate)   JSD: 0.938   shared clusters: 2 e.g. {person, people} {crew}
(Patient $e $x)
(Recipient $e $x)

;; [pooled role]  CoAgent ~ Holder   n 19 / 19   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; cosine: 0.08 (gate)   JSD: 0.895   shared clusters: 1 e.g. {Karen}
(CoAgent $e $x)
(Holder $e $x)

;; [pooled role]  Experiencer ~ Theme   n 63 / 367   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.08 (gate)   JSD: 0.929   shared clusters: 10 e.g. {person, people} {bridge} {view}
(Experiencer $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ CoAgent   n 500 / 19   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; cosine: 0.08 (gate)   JSD: 0.927   shared clusters: 7 e.g. {family} {Karen} {ranger}
(Agent $e $x)
(CoAgent $e $x)

;; [pooled role]  Goal ~ Recipient   n 30 / 47   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.05 (gate)   JSD: 0.929   shared clusters: 2 e.g. {child} {Loren}
(Goal $e $x)
(Recipient $e $x)

;; [pooled role]  Experiencer ~ Holder   n 63 / 19   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; cosine: 0.03 (gate)   JSD: 0.962   shared clusters: 1 e.g. {lathe}
(Experiencer $e $x)
(Holder $e $x)

;; [pooled role]  Agent ~ Goal   n 500 / 30   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; cosine: 0.03 (gate)   JSD: 0.964   shared clusters: 3 e.g. {George Allen, Chuck Robb} {child} {pier}
(Agent $e $x)
(Goal $e $x)

;; [pooled role]  Goal ~ Theme   n 30 / 367   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.02 (gate)   JSD: 0.975   shared clusters: 2 e.g. {child} {predictive function, predictive functions}
(Goal $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ Holder   n 500 / 19   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; cosine: 0.02 (gate)   JSD: 0.979   shared clusters: 2 e.g. {recipe} {Karen}
(Agent $e $x)
(Holder $e $x)

;; [pooled role]  CoAgent ~ Theme   n 19 / 367   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.01 (gate)   JSD: 0.991   shared clusters: 1 e.g. {Laurie Aubanel, Muriel Zazoui}
(CoAgent $e $x)
(Theme $e $x)

;; [pooled role]  Experiencer ~ Location   n 63 / 175   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.01 (gate)   JSD: 0.988   shared clusters: 1 e.g. {park}
(Experiencer $e $x)
(Location $e $x)

;; [pooled role]  Location ~ Theme   n 175 / 367   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.01 (gate)   JSD: 0.987   shared clusters: 2 e.g. {mural} {gate}
(Location $e $x)
(Theme $e $x)

;; [pooled role]  Manner ~ Theme   n 34 / 367   gate: FAIL
;; A fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.01 (gate)   JSD: 0.992   shared clusters: 1 e.g. {widespread, widely}
(Manner $e $x)
(Theme $e $x)

;; [pooled role]  Agent ~ Location   n 500 / 175   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.01 (gate)   JSD: 0.987   shared clusters: 3 e.g. {nurse} {north} {ward}
(Agent $e $x)
(Location $e $x)

;; [pooled role]  Source ~ Theme   n 24 / 367   gate: FAIL
;; A fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.01 (gate)   JSD: 0.993   shared clusters: 1 e.g. {depot}
(Source $e $x)
(Theme $e $x)

;; [pooled role]  Theme ~ Time   n 367 / 37   gate: FAIL
;; A fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.01 (gate)   JSD: 0.992   shared clusters: 1 e.g. {current, now}
(Theme $e $x)
(Time $e $x)

;; [pooled role]  Agent ~ Beneficiary   n 500 / 14   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Beneficiary $e $x)

;; [pooled role]  Agent ~ Manner   n 500 / 34   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Manner $e $x)

;; [pooled role]  Agent ~ Time   n 500 / 37   gate: FAIL
;; A fillers: person ×28, board ×9, company ×8, physician ×8, school ×8, depot ×7
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Agent $e $x)
(Time $e $x)

;; [pooled role]  Beneficiary ~ CoAgent   n 14 / 19   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(CoAgent $e $x)

;; [pooled role]  Beneficiary ~ Experiencer   n 14 / 63   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Experiencer $e $x)

;; [pooled role]  Beneficiary ~ Goal   n 14 / 30   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Goal $e $x)

;; [pooled role]  Beneficiary ~ Holder   n 14 / 19   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Holder $e $x)

;; [pooled role]  Beneficiary ~ Manner   n 14 / 34   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Manner $e $x)

;; [pooled role]  Beneficiary ~ Patient   n 14 / 159   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Patient $e $x)

;; [pooled role]  Beneficiary ~ Recipient   n 14 / 47   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Recipient $e $x)

;; [pooled role]  Beneficiary ~ Source   n 14 / 24   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Source $e $x)

;; [pooled role]  Beneficiary ~ Theme   n 14 / 367   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Theme $e $x)

;; [pooled role]  Beneficiary ~ Time   n 14 / 37   gate: FAIL
;; A fillers: hall ×6, shop ×3, Mr. Morel ×2, Nelson ×2, band
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Beneficiary $e $x)
(Time $e $x)

;; [pooled role]  CoAgent ~ Experiencer   n 19 / 63   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Experiencer $e $x)

;; [pooled role]  CoAgent ~ Goal   n 19 / 30   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Goal $e $x)

;; [pooled role]  CoAgent ~ Location   n 19 / 175   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Location $e $x)

;; [pooled role]  CoAgent ~ Manner   n 19 / 34   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Manner $e $x)

;; [pooled role]  CoAgent ~ Patient   n 19 / 159   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Patient $e $x)

;; [pooled role]  CoAgent ~ Recipient   n 19 / 47   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Recipient $e $x)

;; [pooled role]  CoAgent ~ Source   n 19 / 24   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Source $e $x)

;; [pooled role]  CoAgent ~ Time   n 19 / 37   gate: FAIL
;; A fillers: ranger ×3, Bianca Olsen ×2, Bo ×2, Cyril Rambour ×2, Karen ×2, Laurie Aubanel ×2
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(CoAgent $e $x)
(Time $e $x)

;; [pooled role]  Experiencer ~ Goal   n 63 / 30   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Goal $e $x)

;; [pooled role]  Experiencer ~ Manner   n 63 / 34   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Manner $e $x)

;; [pooled role]  Experiencer ~ Source   n 63 / 24   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Source $e $x)

;; [pooled role]  Experiencer ~ Time   n 63 / 37   gate: FAIL
;; A fillers: Paniqui ×4, person ×4, auditor ×3, Alema Nature Reserve ×2, Aslan ×2, Blair ×2
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Experiencer $e $x)
(Time $e $x)

;; [pooled role]  Goal ~ Holder   n 30 / 19   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Holder $e $x)

;; [pooled role]  Goal ~ Location   n 30 / 175   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Location $e $x)

;; [pooled role]  Goal ~ Manner   n 30 / 34   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Manner $e $x)

;; [pooled role]  Goal ~ Patient   n 30 / 159   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Patient $e $x)

;; [pooled role]  Goal ~ Source   n 30 / 24   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Source $e $x)

;; [pooled role]  Goal ~ Time   n 30 / 37   gate: FAIL
;; A fillers: pier ×3, Altoona ×2, Baltimore ×2, Germany ×2, Indonesia ×2, Oscar ×2
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Goal $e $x)
(Time $e $x)

;; [pooled role]  Holder ~ Location   n 19 / 175   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Location $e $x)

;; [pooled role]  Holder ~ Manner   n 19 / 34   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Manner $e $x)

;; [pooled role]  Holder ~ Patient   n 19 / 159   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Patient $e $x)

;; [pooled role]  Holder ~ Recipient   n 19 / 47   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Recipient $e $x)

;; [pooled role]  Holder ~ Source   n 19 / 24   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Source $e $x)

;; [pooled role]  Holder ~ Theme   n 19 / 367   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: forklift ×6, kiln ×6, projector ×6, song ×6, station ×6, budget ×5
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Theme $e $x)

;; [pooled role]  Holder ~ Time   n 19 / 37   gate: FAIL
;; A fillers: Kristoffer ×4, permit ×4, recipe ×4, lathe ×3, Karen ×2, homentropic current
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Holder $e $x)
(Time $e $x)

;; [pooled role]  Location ~ Manner   n 175 / 34   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Location $e $x)
(Manner $e $x)

;; [pooled role]  Location ~ Patient   n 175 / 159   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Location $e $x)
(Patient $e $x)

;; [pooled role]  Location ~ Recipient   n 175 / 47   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Location $e $x)
(Recipient $e $x)

;; [pooled role]  Location ~ Source   n 175 / 24   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Location $e $x)
(Source $e $x)

;; [pooled role]  Location ~ Time   n 175 / 37   gate: FAIL
;; A fillers: ledger ×9, Japan ×6, Turkey ×6, point ×5, survey ×5, Eskisehir ×4
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Location $e $x)
(Time $e $x)

;; [pooled role]  Manner ~ Patient   n 34 / 159   gate: FAIL
;; A fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; B fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Patient $e $x)

;; [pooled role]  Manner ~ Recipient   n 34 / 47   gate: FAIL
;; A fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; B fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Recipient $e $x)

;; [pooled role]  Manner ~ Source   n 34 / 24   gate: FAIL
;; A fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Source $e $x)

;; [pooled role]  Manner ~ Time   n 34 / 37   gate: FAIL
;; A fillers: a cappella ×4, rare ×4, commercial ×2, continuous time ×2, direct ×2, directly ×2
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Manner $e $x)
(Time $e $x)

;; [pooled role]  Patient ~ Source   n 159 / 24   gate: FAIL
;; A fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; B fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Patient $e $x)
(Source $e $x)

;; [pooled role]  Patient ~ Time   n 159 / 37   gate: FAIL
;; A fillers: person ×8, movie ×6, apple harvest ×5, shoreline survey ×5, yard floodlight ×5, afternoon session ×4
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Patient $e $x)
(Time $e $x)

;; [pooled role]  Recipient ~ Time   n 47 / 37   gate: FAIL
;; A fillers: Ravi ×3, apprentice ×3, child ×3, gallery ×3, recruit ×3, winner ×3
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Recipient $e $x)
(Time $e $x)

;; [pooled role]  Source ~ Time   n 24 / 37   gate: FAIL
;; A fillers: Manila ×3, New Jersey ×2, Tarlac City ×2, batangas ×2, mainstream media ×2, social media ×2
;; B fillers: dawn ×5, later ×4, modern times ×4, morning ×4, today ×4, that autumn ×3
;; cosine: 0.00 (gate)   JSD: 1.0   shared clusters: 0
(Source $e $x)
(Time $e $x)

;; ==================== SLOT PAIRS: 60 pass the gate (event 60, entity 0); 89 pairs listed = every pair with >= 2 shared clusters (event 89, entity 0) among the 16914 pairs of 184 event slots and 13 entity slots at n >= 3 ====================
;; (the paper's 'go to.Agent' reading: one (class, role) slot against every other slot of its centre kind)

;; [same role, different class]  acquire.Agent ~ purchase.Agent   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000024 tierA-000017
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000023 tierA-000016
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {pottery studio} {chef} {school} {depot}
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; [different class and role]  acquire.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000024 tierA-000017
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000025 tierA-000018
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {pottery studio} {chef} {school} {depot}
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; [same role, different class]  acquire.Theme ~ purchase.Theme   n 4 / 4   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000017
;; B fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000016
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; [same role, different class]  begin.Agent ~ create.Agent   n 4 / 4   gate: PASS
;; A fillers: european american settler ×2, indigenous american, native american   e.g. tierC-000025 tierC-000026
;; B fillers: european american settler ×2, indigenous american, native american   e.g. tierC-000025 tierC-000026
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 2 e.g. {european american settler, european american settlers} {indigenous american, native american, indigenous americans, native americans}
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 create) (Agent $e0 $x1))

;; [same role, different class]  commence.Patient ~ start.Patient   n 4 / 4   gate: PASS
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000064 tierA-000069
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000063 tierA-000068
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {dress rehearsal} {apple harvest} {hearing} {shoreline survey}
(And (Member $e0 commence) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; [same role, different class]  make.Agent ~ reach.Agent   n 4 / 4   gate: PASS
;; A fillers: board, committee, family, judge   e.g. tierA-000186 tierA-000197
;; B fillers: board, committee, family, judge   e.g. tierA-000187 tierA-000198
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {committee} {family} {board} {judge}
(And (Member $e0 make) (Agent $e0 $x1))
(And (Member $e0 reach) (Agent $e0 $x1))

;; [different class and role]  purchase.Agent ~ sell.Recipient   n 4 / 4   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000023 tierA-000016
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000025 tierA-000018
;; cosine: 1.00 (gate)   JSD: 0.0   shared clusters: 4 e.g. {pottery studio} {chef} {school} {depot}
(And (Member $e0 purchase) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; [same role, different class]  learn.Theme ~ teach.Theme   n 3 / 10   gate: PASS
;; A fillers: drill, glazing, song   e.g. tierA-000287 tierA-000292
;; B fillers: glazing ×4, drill ×3, song ×3   e.g. tierA-000286 tierA-000288
;; cosine: 0.99 (gate)   JSD: 0.003   shared clusters: 3 e.g. {glazing} {drill} {song, sing}
(And (Member $e0 learn) (Theme $e0 $x1))
(And (Member $e0 teach) (Theme $e0 $x1))

;; [same role, different class]  need.Theme ~ require.Theme   n 3 / 10   gate: PASS
;; A fillers: countersignature, egg, monthly servicing   e.g. tierA-000085 tierA-000090
;; B fillers: egg ×4, countersignature ×3, monthly servicing ×3   e.g. tierA-000084 tierA-000086
;; cosine: 0.99 (gate)   JSD: 0.003   shared clusters: 3 e.g. {egg, eggs} {countersignature, countersignatures} {monthly servicing}
(And (Member $e0 need) (Theme $e0 $x1))
(And (Member $e0 require) (Theme $e0 $x1))

;; [same role, different class]  abandon.Agent ~ give_up.Agent   n 8 / 3   gate: PASS
;; A fillers: climber ×3, firm ×3, rescue team ×2   e.g. tierA-000099 tierA-000101
;; B fillers: climber, firm, rescue team   e.g. tierA-000100 tierA-000110
;; cosine: 0.98 (gate)   JSD: 0.006   shared clusters: 3 e.g. {climber, climbers} {firm} {rescue team}
(And (Member $e0 abandon) (Agent $e0 $x1))
(And (Member $e0 give_up) (Agent $e0 $x1))

;; [same role, different class]  abandon.Theme ~ give_up.Theme   n 8 / 3   gate: PASS
;; A fillers: north route ×3, tender ×3, search ×2   e.g. tierA-000104 tierA-000106
;; B fillers: north route, search, tender   e.g. tierA-000105 tierA-000110
;; cosine: 0.98 (gate)   JSD: 0.006   shared clusters: 3 e.g. {tender} {north route} {search}
(And (Member $e0 abandon) (Theme $e0 $x1))
(And (Member $e0 give_up) (Theme $e0 $x1))

;; [same role, different class]  need.Holder ~ require.Holder   n 3 / 8   gate: PASS
;; A fillers: lathe, permit, recipe   e.g. tierA-000085 tierA-000095
;; B fillers: permit ×3, recipe ×3, lathe ×2   e.g. tierA-000086 tierA-000087
;; cosine: 0.98 (gate)   JSD: 0.006   shared clusters: 3 e.g. {recipe} {permit, allow} {lathe}
(And (Member $e0 need) (Holder $e0 $x1))
(And (Member $e0 require) (Holder $e0 $x1))

;; [same role, different class]  postpone.Agent ~ put_off.Agent   n 7 / 3   gate: PASS
;; A fillers: club ×3, board ×2, ferry ×2   e.g. tierA-000123 tierA-000125
;; B fillers: board, club, ferry   e.g. tierA-000124 tierA-000115
;; cosine: 0.98 (gate)   JSD: 0.007   shared clusters: 3 e.g. {club} {board} {ferry}
(And (Member $e0 postpone) (Agent $e0 $x1))
(And (Member $e0 put_off) (Agent $e0 $x1))

;; [same role, different class]  postpone.Theme ~ put_off.Theme   n 7 / 3   gate: PASS
;; A fillers: tournament ×3, departure ×2, vote ×2   e.g. tierA-000123 tierA-000125
;; B fillers: departure, tournament, vote   e.g. tierA-000124 tierA-000115
;; cosine: 0.98 (gate)   JSD: 0.007   shared clusters: 3 e.g. {tournament} {vote} {departure, depart}
(And (Member $e0 postpone) (Theme $e0 $x1))
(And (Member $e0 put_off) (Theme $e0 $x1))

;; [same role, different class]  begin.Patient ~ commence.Patient   n 7 / 4   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing   e.g. tierA-000062 tierA-000066
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000064 tierA-000069
;; cosine: 0.97 (gate)   JSD: 0.013   shared clusters: 4 e.g. {dress rehearsal} {apple harvest} {shoreline survey} {hearing}
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 commence) (Patient $e0 $x1))

;; [same role, different class]  begin.Patient ~ start.Patient   n 7 / 4   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing   e.g. tierA-000062 tierA-000066
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000063 tierA-000068
;; cosine: 0.97 (gate)   JSD: 0.013   shared clusters: 4 e.g. {dress rehearsal} {apple harvest} {shoreline survey} {hearing}
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; [same role, different class]  decide.Theme ~ decision.Theme   n 9 / 6   gate: PASS
;; A fillers: budget ×3, case ×3, judge, new, roof   e.g. tierA-000185 tierA-000189
;; B fillers: budget ×2, case ×2, new, roof   e.g. tierA-000186 tierA-000187
;; cosine: 0.97 (gate)   JSD: 0.064   shared clusters: 4 e.g. {budget} {case} {roof} {new}
(And (Member $e0 decide) (Theme $e0 $x1))
(And (Member $e0 decision) (Theme $e0 $x1))

;; [same role, different class]  call_off.Agent ~ cancel.Agent   n 3 / 9   gate: PASS
;; A fillers: airline, council, tutor   e.g. tierA-000144 tierA-000149
;; B fillers: council ×3, tutor ×3, airline ×2, physician   e.g. tierA-000143 tierA-000145
;; cosine: 0.96 (gate)   JSD: 0.064   shared clusters: 3 e.g. {council} {tutor} {airline}
(And (Member $e0 call_off) (Agent $e0 $x1))
(And (Member $e0 cancel) (Agent $e0 $x1))

;; [same role, different class]  acquire.Agent ~ buy.Agent   n 4 / 14   gate: PASS
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000024 tierA-000017
;; B fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000022 tierA-000026
;; cosine: 0.95 (gate)   JSD: 0.121   shared clusters: 4 e.g. {pottery studio} {school} {depot} {chef}
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 buy) (Agent $e0 $x1))

;; [same role, different class]  buy.Agent ~ purchase.Agent   n 14 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000022 tierA-000026
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000023 tierA-000016
;; cosine: 0.95 (gate)   JSD: 0.121   shared clusters: 4 e.g. {pottery studio} {school} {depot} {chef}
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; [different class and role]  buy.Agent ~ sell.Recipient   n 14 / 4   gate: PASS
;; A fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000022 tierA-000026
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000025 tierA-000018
;; cosine: 0.95 (gate)   JSD: 0.121   shared clusters: 4 e.g. {pottery studio} {school} {depot} {chef}
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; [same role, different class]  acquire.Theme ~ buy.Theme   n 4 / 14   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000017
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000008 tierA-000012
;; cosine: 0.94 (gate)   JSD: 0.121   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 buy) (Theme $e0 $x1))

;; [same role, different class]  buy.Theme ~ purchase.Theme   n 14 / 4   gate: PASS
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000008 tierA-000012
;; B fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000016
;; cosine: 0.94 (gate)   JSD: 0.121   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; [same role, different class]  allow.Agent ~ permit.Agent   n 4 / 3   gate: PASS
;; A fillers: licence ×2, curator, warden   e.g. tierA-000075 tierA-000080
;; B fillers: curator, licence, warden   e.g. tierA-000073 tierA-000081
;; cosine: 0.94 (gate)   JSD: 0.021   shared clusters: 3 e.g. {licence} {warden} {curator}
(And (Member $e0 allow) (Agent $e0 $x1))
(And (Member $e0 permit) (Agent $e0 $x1))

;; [same role, different class]  allow.Theme ~ permit.Theme   n 4 / 3   gate: PASS
;; A fillers: night delivery ×2, photography, visitor   e.g. tierA-000080 tierA-000076
;; B fillers: night delivery, photography, visitor   e.g. tierA-000081 tierA-000077
;; cosine: 0.94 (gate)   JSD: 0.021   shared clusters: 3 e.g. {night delivery} {photography} {visitor}
(And (Member $e0 allow) (Theme $e0 $x1))
(And (Member $e0 permit) (Theme $e0 $x1))

;; [different class and role]  borrow.Agent ~ lend.Recipient   n 3 / 10   gate: PASS
;; A fillers: Ravi, crew, gallery   e.g. tierA-000297 tierA-000307
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000296 tierA-000298
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {Ravi} {gallery} {crew}
(And (Member $e0 borrow) (Agent $e0 $x1))
(And (Member $e0 lend) (Recipient $e0 $x1))

;; [different class and role]  borrow.Source ~ lend.Agent   n 3 / 10   gate: PASS
;; A fillers: depot, museum, neighbour   e.g. tierA-000307 tierA-000297
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000306 tierA-000308
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {museum} {neighbour, neighbouring} {depot}
(And (Member $e0 borrow) (Source $e0 $x1))
(And (Member $e0 lend) (Agent $e0 $x1))

;; [different class and role]  learn.Agent ~ teach.Recipient   n 3 / 10   gate: PASS
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: apprentice ×3, child ×3, squad ×2, coach, potter   e.g. tierA-000286 tierA-000288
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {apprentice} {child} {squad}
(And (Member $e0 learn) (Agent $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; [different class and role]  learn.Source ~ teach.Agent   n 3 / 10   gate: PASS
;; A fillers: coach, elder, potter   e.g. tierA-000282 tierA-000287
;; B fillers: elder ×3, potter ×3, coach ×2, apprentice, squad   e.g. tierA-000281 tierA-000283
;; cosine: 0.94 (gate)   JSD: 0.113   shared clusters: 3 e.g. {potter} {elder} {coach}
(And (Member $e0 learn) (Source $e0 $x1))
(And (Member $e0 teach) (Agent $e0 $x1))

;; [same role, different class]  cause.Agent ~ destroy.Agent   n 3 / 8   gate: PASS
;; A fillers: fire, flood, storm   e.g. tierA-000223 tierA-000233
;; B fillers: fire ×2, flood ×2, storm ×2, archive, greenhouse   e.g. tierA-000222 tierA-000224
;; cosine: 0.93 (gate)   JSD: 0.138   shared clusters: 3 e.g. {storm} {flood} {fire}
(And (Member $e0 cause) (Agent $e0 $x1))
(And (Member $e0 destroy) (Agent $e0 $x1))

;; [same role, different class]  reject.Agent ~ turn_down.Agent   n 8 / 3   gate: PASS
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000158 tierA-000160
;; B fillers: bank, editor, panel   e.g. tierA-000159 tierA-000164
;; cosine: 0.93 (gate)   JSD: 0.138   shared clusters: 3 e.g. {editor} {bank} {panel}
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 turn_down) (Agent $e0 $x1))

;; [same role, different class]  reject.Theme ~ turn_down.Theme   n 8 / 3   gate: PASS
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000158 tierA-000160
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000159 tierA-000164
;; cosine: 0.93 (gate)   JSD: 0.138   shared clusters: 3 e.g. {manuscript} {loan application} {proposal}
(And (Member $e0 reject) (Theme $e0 $x1))
(And (Member $e0 turn_down) (Theme $e0 $x1))

;; [different class and role]  give.Agent ~ receive.Source   n 12 / 3   gate: PASS
;; A fillers: school ×3, trainer ×3, foreman ×2, clerk, driver, pilot   e.g. tierA-000271 tierA-000273
;; B fillers: foreman, school, trainer   e.g. tierA-000272 tierA-000262
;; cosine: 0.91 (gate)   JSD: 0.196   shared clusters: 3 e.g. {trainer} {school} {foreman}
(And (Member $e0 give) (Agent $e0 $x1))
(And (Member $e0 receive) (Source $e0 $x1))

;; [different class and role]  give.Recipient ~ receive.Agent   n 12 / 3   gate: PASS
;; A fillers: recruit ×3, winner ×3, driver ×2, caller, foreman, query   e.g. tierA-000261 tierA-000263
;; B fillers: driver, recruit, winner   e.g. tierA-000262 tierA-000272
;; cosine: 0.91 (gate)   JSD: 0.196   shared clusters: 3 e.g. {recruit} {winner, win} {driver}
(And (Member $e0 give) (Recipient $e0 $x1))
(And (Member $e0 receive) (Agent $e0 $x1))

;; [same role, different class]  decide.Agent ~ make.Agent   n 11 / 4   gate: PASS
;; A fillers: board ×3, judge ×3, committee ×2, case, family, north   e.g. tierA-000185 tierA-000189
;; B fillers: board, committee, family, judge   e.g. tierA-000186 tierA-000197
;; cosine: 0.90 (gate)   JSD: 0.123   shared clusters: 4 e.g. {board} {judge} {committee} {family}
(And (Member $e0 decide) (Agent $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; [same role, different class]  decide.Agent ~ reach.Agent   n 11 / 4   gate: PASS
;; A fillers: board ×3, judge ×3, committee ×2, case, family, north   e.g. tierA-000185 tierA-000189
;; B fillers: board, committee, family, judge   e.g. tierA-000187 tierA-000198
;; cosine: 0.90 (gate)   JSD: 0.123   shared clusters: 4 e.g. {board} {judge} {committee} {family}
(And (Member $e0 decide) (Agent $e0 $x1))
(And (Member $e0 reach) (Agent $e0 $x1))

;; [same role, different class]  commence.Patient ~ end.Patient   n 4 / 3   gate: PASS
;; A fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000069 tierA-000059
;; B fillers: apple harvest, hearing, shoreline survey   e.g. tierA-000071 tierA-000060
;; cosine: 0.87 (gate)   JSD: 0.138   shared clusters: 3 e.g. {apple harvest} {hearing} {shoreline survey}
(And (Member $e0 commence) (Patient $e0 $x1))
(And (Member $e0 end) (Patient $e0 $x1))

;; [same role, different class]  end.Patient ~ start.Patient   n 3 / 4   gate: PASS
;; A fillers: apple harvest, hearing, shoreline survey   e.g. tierA-000071 tierA-000060
;; B fillers: apple harvest, dress rehearsal, hearing, shoreline survey   e.g. tierA-000068 tierA-000058
;; cosine: 0.87 (gate)   JSD: 0.138   shared clusters: 3 e.g. {apple harvest} {hearing} {shoreline survey}
(And (Member $e0 end) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; [same class, different role]  repair.Agent ~ repair.Patient   n 8 / 8   gate: PASS
;; A fillers: electrician ×2, mechanic ×2, crew, yard floodlight, cracked ×0.5, feed pipe ×0.5   e.g. tierA-000051 tierA-000049
;; B fillers: yard floodlight ×2, crew, electrician, gearbox, mechanic, seized   e.g. tierA-000039 tierA-000029
;; cosine: 0.83 (gate)   JSD: 0.061   shared clusters: 8 e.g. {electrician} {mechanic} {yard floodlight} {crew}
(And (Member $e0 repair) (Agent $e0 $x1))
(And (Member $e0 repair) (Patient $e0 $x1))

;; [same role, different class]  portray.Agent ~ win.Agent   n 6 / 4   gate: PASS
;; A fillers: James Woods ×2, Soichiro Akizuki ×2, Wilson, wilson   e.g. tierC-000301 tierC-000302
;; B fillers: James Woods ×2, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; cosine: 0.82 (gate)   JSD: 0.191   shared clusters: 2 e.g. {James Woods} {Wilson, wilson}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [different class and role]  portray.Theme ~ win.Agent   n 6 / 4   gate: PASS
;; A fillers: James Woods ×2, Kantaro Suga ×2, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; B fillers: James Woods ×2, Wilson, wilson   e.g. tierC-000301 tierC-000302
;; cosine: 0.82 (gate)   JSD: 0.191   shared clusters: 2 e.g. {James Woods} {Wilson, wilson}
(And (Member $e0 portray) (Theme $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; [same role, different class]  begin.Patient ~ end.Patient   n 7 / 3   gate: PASS
;; A fillers: apple harvest ×2, dress rehearsal ×2, shoreline survey ×2, hearing   e.g. tierA-000067 tierA-000070
;; B fillers: apple harvest, hearing, shoreline survey   e.g. tierA-000071 tierA-000060
;; cosine: 0.80 (gate)   JSD: 0.174   shared clusters: 3 e.g. {apple harvest} {shoreline survey} {hearing}
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 end) (Patient $e0 $x1))

;; [same class, different role]  discover.Experiencer ~ discover.Stimulus   n 3 / 3   gate: PASS
;; A fillers: auditor ×2, error   e.g. tierA-000128 tierA-000130
;; B fillers: error ×2, auditor   e.g. tierA-000132 tierA-000128
;; cosine: 0.80 (gate)   JSD: 0.082   shared clusters: 2 e.g. {auditor} {error}
(And (Member $e0 discover) (Experiencer $e0 $x1))
(And (Member $e0 discover) (Stimulus $e0 $x1))

;; [same role, different class]  accompany.Agent ~ appear.Agent   n 4 / 8   gate: PASS
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: person ×5, Brian Packham ×2, sister   e.g. tierC-000049 tierC-000050
;; cosine: 0.78 (gate)   JSD: 0.217   shared clusters: 2 e.g. {person, people} {sister, sisters}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  accompany.Agent ~ sing.Agent   n 4 / 8   gate: PASS
;; A fillers: person ×2, sister ×2   e.g. tierC-000127 tierC-000128
;; B fillers: Barbershop Harmony Society ×2, person ×2, sister ×2, occupational group, professional group   e.g. tierC-000329 tierC-000330
;; cosine: 0.76 (gate)   JSD: 0.311   shared clusters: 2 e.g. {person, people} {sister, sisters}
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same class, different role]  become.Patient ~ become.Result   n 4 / 4   gate: PASS
;; A fillers: bad, relationship, discipline ×0.5, indigenous ×0.5, lax ×0.5, people ×0.5   e.g. tierC-000158 tierC-000001
;; B fillers: bad ×2, indigenous, lax   e.g. tierC-000241 tierC-000242
;; cosine: 0.71 (gate)   JSD: 0.311   shared clusters: 3 e.g. {bad} {lax} {indigenous, indigenous, people}
(And (Member $e0 become) (Patient $e0 $x1))
(And (Member $e0 become) (Result $e0 $x1))

;; [same role, different class]  acquire.Theme ~ sell.Theme   n 4 / 6   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000010 tierA-000017
;; B fillers: ice cream ×2, forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000011 tierA-000018
;; cosine: 0.68 (gate)   JSD: 0.191   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; [same role, different class]  purchase.Theme ~ sell.Theme   n 4 / 6   gate: PASS
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000009 tierA-000016
;; B fillers: ice cream ×2, forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000011 tierA-000018
;; cosine: 0.68 (gate)   JSD: 0.191   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 purchase) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; [same class, different role]  portray.Agent ~ portray.Theme   n 6 / 6   gate: PASS
;; A fillers: James Woods ×2, Soichiro Akizuki ×2, Wilson, wilson   e.g. tierC-000301 tierC-000302
;; B fillers: James Woods ×2, Kantaro Suga ×2, Wilson, wilson   e.g. tierC-000277 tierC-000278
;; cosine: 0.67 (gate)   JSD: 0.333   shared clusters: 2 e.g. {James Woods} {Wilson, wilson}
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 portray) (Theme $e0 $x1))

;; [same role, different class]  borrow.Theme ~ lend.Theme   n 5 / 10   gate: PASS
;; A fillers: inomaru ×2, generator, ladder, painting   e.g. tierA-000307 tierA-000297
;; B fillers: ladder ×4, generator ×3, painting ×3   e.g. tierA-000306 tierA-000308
;; cosine: 0.65 (gate)   JSD: 0.239   shared clusters: 3 e.g. {ladder, ladders} {painting, paintings} {generator}
(And (Member $e0 borrow) (Theme $e0 $x1))
(And (Member $e0 lend) (Theme $e0 $x1))

;; [same role, different class]  buy.Theme ~ sell.Theme   n 14 / 6   gate: PASS
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000008 tierA-000012
;; B fillers: ice cream ×2, forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000011 tierA-000018
;; cosine: 0.65 (gate)   JSD: 0.281   shared clusters: 5 e.g. {projector, projectors} {forklift, forklifts} {kiln} {lemon}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; [same class, different role]  order.Agent ~ order.Theme   n 4 / 4   gate: PASS
;; A fillers: physician ×2, doctor, scan   e.g. tierA-000385 tierA-000386
;; B fillers: scan ×3, physician   e.g. tierA-000389 tierA-000387
;; cosine: 0.60 (gate)   JSD: 0.189   shared clusters: 2 e.g. {physician, doctor} {scan}
(And (Member $e0 order) (Agent $e0 $x1))
(And (Member $e0 order) (Theme $e0 $x1))

;; [same class, different role]  sign.Agent ~ sign.Patient   n 4 / 4   gate: PASS
;; A fillers: physician ×2, chart, doctor   e.g. tierA-000375 tierA-000376
;; B fillers: chart ×3, physician   e.g. tierA-000378 tierA-000377
;; cosine: 0.60 (gate)   JSD: 0.189   shared clusters: 2 e.g. {physician, doctor} {chart}
(And (Member $e0 sign) (Agent $e0 $x1))
(And (Member $e0 sign) (Patient $e0 $x1))

;; [same class, different role]  walk.Agent ~ walk.Goal   n 5 / 3   gate: PASS
;; A fillers: child, nurse, pier, shepherd, ward   e.g. tierA-000181 tierA-000183
;; B fillers: pier ×2, child   e.g. tierA-000182 tierA-000183
;; cosine: 0.60 (gate)   JSD: 0.408   shared clusters: 2 e.g. {pier} {child}
(And (Member $e0 walk) (Agent $e0 $x1))
(And (Member $e0 walk) (Goal $e0 $x1))

;; [same role, different class]  appear.Agent ~ sing.Agent   n 8 / 8   gate: PASS
;; A fillers: person ×5, Brian Packham ×2, sister   e.g. tierC-000049 tierC-000050
;; B fillers: Barbershop Harmony Society ×2, person ×2, sister ×2, occupational group, professional group   e.g. tierC-000127 tierC-000128
;; cosine: 0.59 (gate)   JSD: 0.45   shared clusters: 2 e.g. {person, people} {sister, sisters}
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 sing) (Agent $e0 $x1))

;; [same role, different class]  follow.Agent ~ succeed.Agent   n 4 / 3   gate: PASS
;; A fillers: Alexander, Bailey, house, muslim   e.g. tierC-000076 tierC-000337
;; B fillers: Alexander, Bailey, Peter Gaussen   e.g. tierC-000075 tierC-000338
;; cosine: 0.58 (gate)   JSD: 0.425   shared clusters: 2 e.g. {Alexander} {Bailey}
(And (Member $e0 follow) (Agent $e0 $x1))
(And (Member $e0 succeed) (Agent $e0 $x1))

;; [same class, different role]  reject.Agent ~ reject.Theme   n 8 / 8   gate: PASS
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000162 tierA-000158
;; B fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000160 tierA-000163
;; cosine: 0.57 (gate)   JSD: 0.311   shared clusters: 4 e.g. {manuscript} {editor} {loan application} {bank}
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 reject) (Theme $e0 $x1))

;; [same role, different class]  direct.Patient ~ produce.Patient   n 4 / 8   gate: PASS
;; A fillers: episode ×2, movie, film ×0.5, syrian ×0.5   e.g. tierC-000010 tierC-000091
;; B fillers: movie ×4, album ×2, film ×0.833, syrian ×0.833, destined ×0.333   e.g. tierC-000009 tierC-000092
;; cosine: 0.57 (gate)   JSD: 0.416   shared clusters: 2 e.g. {movie, film} {syrian}
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 produce) (Patient $e0 $x1))

;; [same role, different class]  give.Theme ~ receive.Theme   n 12 / 5   gate: PASS
;; A fillers: answer ×3, manifest ×3, medal ×3, whistle ×3   e.g. tierA-000261 tierA-000263
;; B fillers: work ×2, manifest, medal, whistle   e.g. tierA-000262 tierA-000272
;; cosine: 0.57 (gate)   JSD: 0.331   shared clusters: 3 e.g. {whistle} {manifest} {medal, medals}
(And (Member $e0 give) (Theme $e0 $x1))
(And (Member $e0 receive) (Theme $e0 $x1))

;; [same role, different class]  take.Agent ~ walk.Agent   n 5 / 5   gate: PASS
;; A fillers: person ×2, child, nurse, shepherd   e.g. tierA-000178 tierA-000174
;; B fillers: child, nurse, pier, shepherd, ward   e.g. tierA-000177 tierA-000173
;; cosine: 0.51 (gate)   JSD: 0.4   shared clusters: 3 e.g. {nurse} {shepherd} {child}
(And (Member $e0 take) (Agent $e0 $x1))
(And (Member $e0 walk) (Agent $e0 $x1))

;; [same class, different role]  destroy.Agent ~ destroy.Patient   n 8 / 11   gate: FAIL
;; A fillers: fire ×2, flood ×2, storm ×2, archive, greenhouse   e.g. tierA-000230 tierA-000226
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, fire, storm   e.g. tierA-000227 tierA-000228
;; cosine: 0.50 (gate)   JSD: 0.358   shared clusters: 4 e.g. {archive} {greenhouse} {storm} {fire}
(And (Member $e0 destroy) (Agent $e0 $x1))
(And (Member $e0 destroy) (Patient $e0 $x1))

;; [same role, different class]  follow.Theme ~ succeed.Theme   n 4 / 3   gate: FAIL
;; A fillers: region ×2, Henry Cole, Margaret Fleming   e.g. tierC-000337 tierC-000076
;; B fillers: Henry Cole, Margaret Fleming, governor   e.g. tierC-000338 tierC-000075
;; cosine: 0.47 (gate)   JSD: 0.425   shared clusters: 2 e.g. {Henry Cole} {Margaret Fleming}
(And (Member $e0 follow) (Theme $e0 $x1))
(And (Member $e0 succeed) (Theme $e0 $x1))

;; [same class, different role]  buy.Agent ~ buy.Theme   n 14 / 14   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000022 tierA-000026
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000027 tierA-000015
;; cosine: 0.46 (gate)   JSD: 0.34   shared clusters: 7 e.g. {pottery studio} {forklift, forklifts} {kiln} {depot}
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 buy) (Theme $e0 $x1))

;; [same class, different role]  walk.Agent ~ walk.Location   n 5 / 5   gate: FAIL
;; A fillers: child, nurse, pier, shepherd, ward   e.g. tierA-000177 tierA-000180
;; B fillers: ridge ×2, ward ×2, nurse   e.g. tierA-000178 tierA-000173
;; cosine: 0.45 (gate)   JSD: 0.525   shared clusters: 2 e.g. {ward} {nurse}
(And (Member $e0 walk) (Agent $e0 $x1))
(And (Member $e0 walk) (Location $e0 $x1))

;; [same class, different role]  answer.Agent ~ answer.Theme   n 10 / 10   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, caller, query   e.g. tierA-000207 tierA-000209
;; B fillers: query ×3, tower ×3, caller ×2, clerk, vet   e.g. tierA-000210 tierA-000217
;; cosine: 0.42 (gate)   JSD: 0.4   shared clusters: 4 e.g. {clerk} {query} {caller} {vet}
(And (Member $e0 answer) (Agent $e0 $x1))
(And (Member $e0 answer) (Theme $e0 $x1))

;; [same class, different role]  lend.Agent ~ lend.Recipient   n 10 / 10   gate: FAIL
;; A fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000300 tierA-000304
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000296 tierA-000298
;; cosine: 0.42 (gate)   JSD: 0.4   shared clusters: 4 e.g. {Ravi} {neighbour, neighbouring} {crew} {depot}
(And (Member $e0 lend) (Agent $e0 $x1))
(And (Member $e0 lend) (Recipient $e0 $x1))

;; [same class, different role]  teach.Agent ~ teach.Recipient   n 10 / 10   gate: FAIL
;; A fillers: elder ×3, potter ×3, coach ×2, apprentice, squad   e.g. tierA-000281 tierA-000283
;; B fillers: apprentice ×3, child ×3, squad ×2, coach, potter   e.g. tierA-000285 tierA-000286
;; cosine: 0.42 (gate)   JSD: 0.4   shared clusters: 4 e.g. {potter} {apprentice} {squad} {coach}
(And (Member $e0 teach) (Agent $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; [same role, different class]  answer.Agent ~ give.Agent   n 10 / 12   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, caller, query   e.g. tierA-000212 tierA-000214
;; B fillers: school ×3, trainer ×3, foreman ×2, clerk, driver, pilot   e.g. tierA-000213 tierA-000208
;; cosine: 0.32 (gate)   JSD: 0.587   shared clusters: 3 e.g. {pilot} {clerk} {vet}
(And (Member $e0 answer) (Agent $e0 $x1))
(And (Member $e0 give) (Agent $e0 $x1))

;; [different class and role]  answer.Theme ~ give.Recipient   n 10 / 12   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, vet   e.g. tierA-000212 tierA-000214
;; B fillers: recruit ×3, winner ×3, driver ×2, caller, foreman, query   e.g. tierA-000213 tierA-000218
;; cosine: 0.32 (gate)   JSD: 0.587   shared clusters: 3 e.g. {tower} {query} {caller}
(And (Member $e0 answer) (Theme $e0 $x1))
(And (Member $e0 give) (Recipient $e0 $x1))

;; [same class, different role]  discover.Agent ~ discover.Theme   n 7 / 9   gate: FAIL
;; A fillers: diver ×3, intern ×3, wreck   e.g. tierA-000133 tierA-000135
;; B fillers: wreck ×3, name ×2, file ×1.5, missing ×1.5, diver   e.g. tierA-000136 tierA-000137
;; cosine: 0.32 (gate)   JSD: 0.592   shared clusters: 2 e.g. {diver} {wreck}
(And (Member $e0 discover) (Agent $e0 $x1))
(And (Member $e0 discover) (Theme $e0 $x1))

;; [same class, different role]  work.Agent ~ work.CoAgent   n 17 / 7   gate: FAIL
;; A fillers: Ana ×3, Dara ×3, biologist ×3, welder ×2, Asserson, Bo   e.g. tierA-000312 tierA-000324
;; B fillers: Bo ×2, Nils ×2, ranger ×2, fitter   e.g. tierA-000311 tierA-000313
;; cosine: 0.32 (gate)   JSD: 0.571   shared clusters: 4 e.g. {Bo} {Nils} {ranger} {fitter}
(And (Member $e0 work) (Agent $e0 $x1))
(And (Member $e0 work) (CoAgent $e0 $x1))

;; [different class and role]  reject.Agent ~ turn_down.Theme   n 8 / 3   gate: FAIL
;; A fillers: bank ×2, editor ×2, panel ×2, loan application, manuscript   e.g. tierA-000162 tierA-000166
;; B fillers: loan application, manuscript, proposal   e.g. tierA-000159 tierA-000164
;; cosine: 0.31 (gate)   JSD: 0.613   shared clusters: 2 e.g. {manuscript} {loan application}
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 turn_down) (Theme $e0 $x1))

;; [different class and role]  reject.Theme ~ turn_down.Agent   n 8 / 3   gate: FAIL
;; A fillers: loan application ×2, manuscript ×2, proposal ×2, bank, editor   e.g. tierA-000162 tierA-000166
;; B fillers: bank, editor, panel   e.g. tierA-000159 tierA-000164
;; cosine: 0.31 (gate)   JSD: 0.613   shared clusters: 2 e.g. {editor} {bank}
(And (Member $e0 reject) (Theme $e0 $x1))
(And (Member $e0 turn_down) (Agent $e0 $x1))

;; [different class and role]  acquire.Agent ~ buy.Theme   n 4 / 14   gate: FAIL
;; A fillers: chef, depot, pottery studio, school   e.g. tierA-000024 tierA-000017
;; B fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000027 tierA-000021
;; cosine: 0.27 (gate)   JSD: 0.632   shared clusters: 3 e.g. {pottery studio} {chef} {depot}
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 buy) (Theme $e0 $x1))

;; [different class and role]  buy.Theme ~ purchase.Agent   n 14 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000027 tierA-000021
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000023 tierA-000016
;; cosine: 0.27 (gate)   JSD: 0.632   shared clusters: 3 e.g. {pottery studio} {chef} {depot}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; [different class and role]  buy.Theme ~ sell.Recipient   n 14 / 4   gate: FAIL
;; A fillers: forklift ×3, kiln ×3, projector ×3, chef, crate, depot   e.g. tierA-000027 tierA-000021
;; B fillers: chef, depot, pottery studio, school   e.g. tierA-000025 tierA-000018
;; cosine: 0.27 (gate)   JSD: 0.632   shared clusters: 3 e.g. {pottery studio} {chef} {depot}
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; [same class, different role]  decide.Agent ~ decide.Theme   n 11 / 9   gate: FAIL
;; A fillers: board ×3, judge ×3, committee ×2, case, family, north   e.g. tierA-000195 tierA-000190
;; B fillers: budget ×3, case ×3, judge, new, roof   e.g. tierA-000193 tierA-000194
;; cosine: 0.26 (gate)   JSD: 0.674   shared clusters: 2 e.g. {case} {judge}
(And (Member $e0 decide) (Agent $e0 $x1))
(And (Member $e0 decide) (Theme $e0 $x1))

;; [same role, different class]  borrow.Agent ~ lend.Agent   n 3 / 10   gate: FAIL
;; A fillers: Ravi, crew, gallery   e.g. tierA-000297 tierA-000302
;; B fillers: museum ×3, neighbour ×3, depot ×2, Ravi, crew   e.g. tierA-000300 tierA-000304
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {Ravi} {crew}
(And (Member $e0 borrow) (Agent $e0 $x1))
(And (Member $e0 lend) (Agent $e0 $x1))

;; [different class and role]  borrow.Source ~ lend.Recipient   n 3 / 10   gate: FAIL
;; A fillers: depot, museum, neighbour   e.g. tierA-000297 tierA-000302
;; B fillers: Ravi ×3, gallery ×3, crew ×2, depot, neighbour   e.g. tierA-000300 tierA-000304
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {neighbour, neighbouring} {depot}
(And (Member $e0 borrow) (Source $e0 $x1))
(And (Member $e0 lend) (Recipient $e0 $x1))

;; [same role, different class]  learn.Agent ~ teach.Agent   n 3 / 10   gate: FAIL
;; A fillers: apprentice, child, squad   e.g. tierA-000287 tierA-000282
;; B fillers: elder ×3, potter ×3, coach ×2, apprentice, squad   e.g. tierA-000289 tierA-000285
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {squad} {apprentice}
(And (Member $e0 learn) (Agent $e0 $x1))
(And (Member $e0 teach) (Agent $e0 $x1))

;; [different class and role]  learn.Source ~ teach.Recipient   n 3 / 10   gate: FAIL
;; A fillers: coach, elder, potter   e.g. tierA-000282 tierA-000287
;; B fillers: apprentice ×3, child ×3, squad ×2, coach, potter   e.g. tierA-000285 tierA-000289
;; cosine: 0.24 (gate)   JSD: 0.662   shared clusters: 2 e.g. {potter} {coach}
(And (Member $e0 learn) (Source $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; [different class and role]  acquire.Theme ~ buy.Agent   n 4 / 14   gate: FAIL
;; A fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000017 tierA-000003
;; B fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000021 tierA-000006
;; cosine: 0.23 (gate)   JSD: 0.632   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {lemon} {crate}
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 buy) (Agent $e0 $x1))

;; [different class and role]  buy.Agent ~ purchase.Theme   n 14 / 4   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000021 tierA-000006
;; B fillers: forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000016 tierA-000002
;; cosine: 0.23 (gate)   JSD: 0.632   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {lemon} {crate}
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; [different class and role]  cause.Agent ~ destroy.Patient   n 3 / 11   gate: FAIL
;; A fillers: fire, flood, storm   e.g. tierA-000223 tierA-000228
;; B fillers: archive ×3, footbridge ×3, greenhouse ×3, fire, storm   e.g. tierA-000226 tierA-000230
;; cosine: 0.21 (gate)   JSD: 0.682   shared clusters: 2 e.g. {storm} {fire}
(And (Member $e0 cause) (Agent $e0 $x1))
(And (Member $e0 destroy) (Patient $e0 $x1))

;; [same class, different role]  form.Agent ~ form.Patient   n 6 / 4   gate: FAIL
;; A fillers: Jon Bon Jovi ×2, Sambora ×2, Technetium, complex ×0.5, simple ×0.5   e.g. tierC-000163 tierC-000164
;; B fillers: main songwriting unit ×2, Technetium, complex ×0.5, simple ×0.5   e.g. tierC-000179 tierC-000180
;; cosine: 0.21 (gate)   JSD: 0.595   shared clusters: 3 e.g. {Technetium} {complex, complex, simple} {simple}
(And (Member $e0 form) (Agent $e0 $x1))
(And (Member $e0 form) (Patient $e0 $x1))

;; [different class and role]  buy.Agent ~ sell.Theme   n 14 / 6   gate: FAIL
;; A fillers: depot ×3, pottery studio ×3, school ×3, chef ×2, forklift, kiln   e.g. tierA-000021 tierA-000006
;; B fillers: ice cream ×2, forklift, kiln, projector, crate ×0.5, lemon ×0.5   e.g. tierA-000018 tierA-000004
;; cosine: 0.16 (gate)   JSD: 0.685   shared clusters: 4 e.g. {forklift, forklifts} {kiln} {lemon} {crate}
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; [same class, different role]  give.Agent ~ give.Recipient   n 12 / 12   gate: FAIL
;; A fillers: school ×3, trainer ×3, foreman ×2, clerk, driver, pilot   e.g. tierA-000271 tierA-000273
;; B fillers: recruit ×3, winner ×3, driver ×2, caller, foreman, query   e.g. tierA-000274 tierA-000261
;; cosine: 0.15 (gate)   JSD: 0.77   shared clusters: 2 e.g. {foreman} {driver}
(And (Member $e0 give) (Agent $e0 $x1))
(And (Member $e0 give) (Recipient $e0 $x1))

;; [different class and role]  answer.Agent ~ give.Recipient   n 10 / 12   gate: FAIL
;; A fillers: clerk ×3, pilot ×3, vet ×2, caller, query   e.g. tierA-000221 tierA-000210
;; B fillers: recruit ×3, winner ×3, driver ×2, caller, foreman, query   e.g. tierA-000218 tierA-000208
;; cosine: 0.08 (gate)   JSD: 0.818   shared clusters: 2 e.g. {caller} {query}
(And (Member $e0 answer) (Agent $e0 $x1))
(And (Member $e0 give) (Recipient $e0 $x1))

;; [different class and role]  answer.Theme ~ give.Agent   n 10 / 12   gate: FAIL
;; A fillers: query ×3, tower ×3, caller ×2, clerk, vet   e.g. tierA-000210 tierA-000221
;; B fillers: school ×3, trainer ×3, foreman ×2, clerk, driver, pilot   e.g. tierA-000208 tierA-000218
;; cosine: 0.08 (gate)   JSD: 0.818   shared clusters: 2 e.g. {clerk} {vet}
(And (Member $e0 answer) (Theme $e0 $x1))
(And (Member $e0 give) (Agent $e0 $x1))
