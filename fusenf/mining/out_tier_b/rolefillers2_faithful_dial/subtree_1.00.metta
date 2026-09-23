;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa RENDERING
;; Never loaded: a slot is a conjunctive query over variables, not an assertion. The record of truth is
;;   rolefiller2_signals_faithful_<mode>_<cut>.jsonl   (the gated slot pairs)
;;   rolefiller2_slotdist_faithful_<mode>_<cut>.jsonl  (every compared slot's distribution over clusters)
;;
;; BLOCK: subtree texts @ cluster cosine 1.00 — one point of the dial; the adopted setting (word @ 0.85) is
;;   ../rolefillers2_faithful.metta
;;
;; PARAMETERS (choices the paper leaves open; disclosed)
;;   substrate       out_tier_b/canonical_substrate.jsonl (1950 records); out_tier_b/valuations_occ.jsonl (6713 filler occurrences)
;;   embeddings      out_tier_b/embeddings: Qwen3-Embedding-8B, bf16, normalised; 2909 texts, dim 4096
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
;;                   outside the distributions: 140 occurrences excluded in this block, 2742 filler units enter
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

;; ==================== SLOT PAIRS: 0 pass the gate (event 0, entity 0); 13 pairs listed = every pair with >= 2 shared clusters (event 13, entity 0) among the 13558 pairs of 165 event slots and 8 entity slots at n >= 3 ====================
;; (the paper's method: one (class, role) slot against every other slot of its centre kind; the paper's
;; examples 'go to.Agent' / 'Agent2' are two such slots of the 'go to' meta-node)

;; [same role, different class]  draw.Agent ~ play.Agent   n 3 / 9   gate: FAIL
;; A fillers: child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: children ×3, Tony, Yumi, biology, boys, child   e.g. tierB-000160 tierB-000648
;; JSD: 0.486   shared clusters: 2 e.g. {children} {child}
;; A: (And (Member $e0 draw) (Agent $e0 $x1))
;; B: (And (Member $e0 play) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  draw.Agent ~ sleep.Experiencer   n 3 / 6   gate: FAIL
;; A fillers: child, children, concert   e.g. tierB-001250 tierB-001245
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.541   shared clusters: 2 e.g. {child} {children}
;; A: (And (Member $e0 draw) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnSleepExperiencerOrDrawAgent $e0 $x1))
(Implication (And (Member $e0 draw) (Agent $e0 $x1)) (MnSleepExperiencerOrDrawAgent $e0 $x1))

;; [different class and role]  change.Patient ~ good.Experiencer   n 7 / 4   gate: FAIL
;; A fillers: weather ×2, color, course, name, rain, thing   e.g. tierB-001217 tierB-000517
;; B fillers: barley bread, thing, weather, windshield   e.g. tierB-001238 tierB-000495
;; JSD: 0.547   shared clusters: 2 e.g. {weather} {thing}
;; A: (And (Member $e0 change) (Patient $e0 $x1))
;; B: (And (Member $e0 good) (Experiencer $e0 $x1))
(Implication (And (Member $e0 change) (Patient $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))
(Implication (And (Member $e0 good) (Experiencer $e0 $x1)) (MnChangePatientOrGoodExperiencer $e0 $x1))

;; [same role, different class]  cry.Agent ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000030 tierB-000738
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000125 tierB-001873
;; JSD: 0.554   shared clusters: 2 e.g. {Rima} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  ready.Experiencer ~ stop.Agent   n 5 / 4   gate: FAIL
;; A fillers: Leonid, Skura, Yanni, cake, dinner   e.g. tierB-000044 tierB-001185
;; B fillers: Rima, Skura, Yanni, adaptor, old   e.g. tierB-000030 tierB-000125
;; JSD: 0.554   shared clusters: 2 e.g. {Skura} {Yanni}
;; A: (And (Member $e0 ready) (Experiencer $e0 $x1))
;; B: (And (Member $e0 stop) (Agent $e0 $x1))
(Implication (And (Member $e0 ready) (Experiencer $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))
(Implication (And (Member $e0 stop) (Agent $e0 $x1)) (MnReadyExperiencerOrStopAgent $e0 $x1))

;; [same role, different class]  cry.Agent ~ start.Agent   n 5 / 6   gate: FAIL
;; A fillers: Alberto, Baya, Rima, Skura, girls   e.g. tierB-000738 tierB-000030
;; B fillers: Karl, Skura, cook, crowd, whole, girls, school janitor   e.g. tierB-000043 tierB-000199
;; JSD: 0.636   shared clusters: 2 e.g. {girls} {Skura}
;; A: (And (Member $e0 cry) (Agent $e0 $x1))
;; B: (And (Member $e0 start) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  play.Agent ~ sleep.Experiencer   n 9 / 6   gate: FAIL
;; A fillers: children ×3, Tony, Yumi, biology, boys, child   e.g. tierB-000160 tierB-000648
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001891 tierB-001945
;; JSD: 0.636   shared clusters: 2 e.g. {children} {child}
;; A: (And (Member $e0 play) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 play) (Agent $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnPlayAgentOrSleepExperiencer $e0 $x1))

;; [different class and role]  go.Agent ~ sleep.Experiencer   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-001183 tierB-001496
;; B fillers: cat ×2, Baya, child, children, dog   e.g. tierB-001003 tierB-001334
;; JSD: 0.748   shared clusters: 2 e.g. {cat} {children}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 sleep) (Experiencer $e0 $x1))
(Implication (And (Member $e0 go) (Agent $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))
(Implication (And (Member $e0 sleep) (Experiencer $e0 $x1)) (MnGoAgentOrSleepExperiencer $e0 $x1))

;; [same role, different class]  begin.Agent ~ try.Agent   n 7 / 10   gate: FAIL
;; A fillers: David, Jessica, Mark, William, crowd, legionnaires   e.g. tierB-000075 tierB-000173
;; B fillers: Bob, Claudio, David, Felix, Mark, Santiago   e.g. tierB-000400 tierB-000117
;; JSD: 0.763   shared clusters: 2 e.g. {Mark} {David}
;; A: (And (Member $e0 begin) (Agent $e0 $x1))
;; B: (And (Member $e0 try) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ swim.Agent   n 13 / 5   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000313 tierB-001496
;; B fillers: fish, school ×2, Linda, children, fish, red   e.g. tierB-001511 tierB-001268
;; JSD: 0.764   shared clusters: 2 e.g. {Linda} {children}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 swim) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [same role, different class]  go.Agent ~ talk.Agent   n 13 / 6   gate: FAIL
;; A fillers: Daniel, Donald, Flavio, Kalman, Linda, Mariko   e.g. tierB-000313 tierB-000576
;; B fillers: Daniel, Jordan Peterson, Linda, friends, novelist, school janitor   e.g. tierB-000327 tierB-000078
;; JSD: 0.781   shared clusters: 2 e.g. {Linda} {Daniel}
;; A: (And (Member $e0 go) (Agent $e0 $x1))
;; B: (And (Member $e0 talk) (Agent $e0 $x1))
;;   rule: none — both slots already carry the same head; the merge the paper describes is done by
;;   construction (one closed role vocabulary); the pair is corroboration for a lexical candidate only

;; [different class and role]  hear.Experiencer ~ make.Agent   n 8 / 18   gate: FAIL
;; A fillers: Bruno ×2, Damiano, Fadil, Flavio, James, Jonas   e.g. tierB-000681 tierB-000189
;; B fillers: Augustus, Damiano, David, Elias, Hanako, James   e.g. tierB-000539 tierB-000325
;; JSD: 0.839   shared clusters: 2 e.g. {James} {Damiano}
;; A: (And (Member $e0 hear) (Experiencer $e0 $x1))
;; B: (And (Member $e0 make) (Agent $e0 $x1))
(Implication (And (Member $e0 make) (Agent $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))
(Implication (And (Member $e0 hear) (Experiencer $e0 $x1)) (MnMakeAgentOrHearExperiencer $e0 $x1))

;; [different class and role]  buy.Theme ~ have.Holder   n 5 / 34   gate: FAIL
;; A fillers: blue, shirt, computer, food, house, trouser, yellow   e.g. tierB-000368 tierB-001690
;; B fillers: town ×2, Algiers, Boldi, Diego, Miroslav, Morocco   e.g. tierB-001103 tierB-001016
;; JSD: 0.873   shared clusters: 2 e.g. {food} {house}
;; A: (And (Member $e0 buy) (Theme $e0 $x1))
;; B: (And (Member $e0 have) (Holder $e0 $x1))
(Implication (And (Member $e0 have) (Holder $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
(Implication (And (Member $e0 buy) (Theme $e0 $x1)) (MnHaveHolderOrBuyTheme $e0 $x1))
