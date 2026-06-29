# Regression cases — NL → PeTTaChainer logic (Maximal neo-Davidsonian)

Golden `sentence → expected atoms` pairs for the translator driven by `prompt.txt`.

## How to run (manual / judge-driven)

1. Spawn a Sonnet translator that reads the current `prompt.txt` as its only instructions.
2. Feed each NL input below, independently.
3. Compare each output to Expected **semantically**:
   - **Categorical**: check relation (`Member`/`Inheritance`), args, and STV.
   - **Events**: check the event **class** `(Member e <verb>)`, the **role** atoms, and the
     **status** atoms (`Past`/`Ongoing`/`Can`/…). **Ignore** the event/witness symbol
     (`sk_<verb>_<n>`, `(sk_<verb> $x)`) and proof-names — they may differ in a passing run.
   - **Queries**: check the conjuncts and variable placement; `$prf`/`$tv` names are immaterial.
4. (Optional) load the produced atoms into the chainer to catch malformed output and run the
   paired query; `e2e_regression.py` exercises the full NL→atoms→chainer→answer path for a
   representative subset.

Coreference cases are **passages** (multiple sentences) — feed the whole passage at once; the
key check is that coreferring mentions (pronoun, "the X", a name, event anaphora) **share one
symbol** across sentences (the exact `sk_*` symbol and some role labels may vary).

**Inputs are deliberately NOT the prompt's own examples** — each is structurally parallel to a
`prompt.txt` illustration but lexically different, so a pass reflects the rules generalizing,
not the translator reciting the prompt. Keep it that way: when a convention changes, add a
*new* contrastive sentence rather than copying the prompt's example. Update Expected too.

---

## Categorical (copular: "X is a/an N", "X is ADJ")

**[cat-mem] Grace is a pilot.** — named individual → `Member` + `Name`

    (: grace_is_pilot (Member grace pilot) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[cat-def] Oaks are trees.** — definitional/taxonomic → 1.0 / 0.99

    (: oak_is_tree (Inheritance oak tree) (STV 1.0 0.99))

**[cat-emp] All lions are fierce.** — empirical universal → confidence 0.9

    (: lions_are_fierce (Inheritance lion fierce) (STV 1.0 0.9))

**[cat-generic] Lemons are sour.** — bare generic → strength 0.9, empirical 0.9

    (: lemons_are_sour (Inheritance lemon sour) (STV 0.9 0.9))

**[cat-most] Most athletes are fit.** — graded → strength 0.9

    (: most_athletes_fit (Inheritance athlete fit) (STV 0.9 0.9))

**[cat-few] Few volcanoes are active.** — graded → strength 0.1

    (: few_volcanoes_active (Inheritance volcano active) (STV 0.1 0.9))

**[cat-no] No square is round.** — strength 0; definitional trait → conf 0.99

    (: square_not_round (Inheritance square round) (STV 0.0 0.99))

**[cat-neg] Spiders are not insects.** — negation → strength 0; taxonomic → 0.99

    (: spiders_not_insects (Inheritance spider insect) (STV 0.0 0.99))

**[cat-notall] Not all metals are magnetic.** — ¬∀ → counterexample witness

    (: sk_metal_1_metal (Member sk_metal_1 metal) (STV 1.0 0.99))
    (: sk_metal_1_not_magnetic (Member sk_metal_1 magnetic) (STV 0.0 0.99))

**[cat-antonym] Victor is dishonest.** — antonym is a positive property

    (: victor_dishonest (Member victor dishonest) (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[cat-status] Mary must be ill.** — epistemic modality over a copular clause → wrap the atom (0.9)

    (: mary_must_ill (Must (Member mary ill)) (STV 1.0 0.9))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[cat-past] Tom was nervous.** — tense over a copular clause → wrap the atom

    (: tom_was_nervous (Past (Member tom nervous)) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

## Events (verbal)

**[ev-intrans] Felix jogs.** — habitual (unmarked status)

    (: e_jog (Member sk_jog_1 jog) (STV 1.0 0.99))
    (: e_agent (Agent sk_jog_1 felix) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))

**[ev-trans] Nina brews coffee.** — + Patient role

    (: e_brew (Member sk_brew_1 brew) (STV 1.0 0.99))
    (: e_agent (Agent sk_brew_1 nina) (STV 1.0 0.99))
    (: e_patient (Patient sk_brew_1 coffee) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[ev-ditrans] Tom sent Grace a letter.** — Agent/Recipient/Theme + existential Theme + Past

    (: e_send (Member sk_send_1 send) (STV 1.0 0.99))
    (: e_agent (Agent sk_send_1 tom) (STV 1.0 0.99))
    (: e_recip (Recipient sk_send_1 grace) (STV 1.0 0.99))
    (: e_theme (Theme sk_send_1 sk_letter_1) (STV 1.0 0.99))
    (: e_letter (Member sk_letter_1 letter) (STV 1.0 0.99))
    (: e_past (Past sk_send_1) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[ev-stative] Victor owns a yacht.** — state eventuality: Holder/Theme + existential Theme

    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_holder (Holder sk_own_1 victor) (STV 1.0 0.99))
    (: e_theme (Theme sk_own_1 sk_yacht_1) (STV 1.0 0.99))
    (: e_yacht (Member sk_yacht_1 yacht) (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[ev-past] Leo served lunch yesterday.** — Past + Time role (fine-temporal as a role)

    (: e_serve (Member sk_serve_1 serve) (STV 1.0 0.99))
    (: e_agent (Agent sk_serve_1 leo) (STV 1.0 0.99))
    (: e_patient (Patient sk_serve_1 lunch) (STV 1.0 0.99))
    (: e_past (Past sk_serve_1) (STV 1.0 0.99))
    (: e_time (Time sk_serve_1 yesterday) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[ev-ongoing] Oscar is running.** — progressive → Ongoing

    (: e_run (Member sk_run_1 run) (STV 1.0 0.99))
    (: e_agent (Agent sk_run_1 oscar) (STV 1.0 0.99))
    (: e_ongoing (Ongoing sk_run_1) (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[ev-can] Grace can speak French.** — capability → Can

    (: e_speak (Member sk_speak_1 speak) (STV 1.0 0.99))
    (: e_agent (Agent sk_speak_1 grace) (STV 1.0 0.99))
    (: e_patient (Patient sk_speak_1 french) (STV 1.0 0.99))
    (: e_can (Can sk_speak_1) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[ev-epistemic] Oscar might resign.** — epistemic over a verbal clause → Might on the event

    (: e_resign (Member sk_resign_1 resign) (STV 1.0 0.99))
    (: e_agent (Agent sk_resign_1 oscar) (STV 1.0 0.99))
    (: e_might (Might sk_resign_1) (STV 1.0 0.9))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[ev-deontic] Tom must comply.** — deontic obligation (individual) → Obligated

    (: e_comply (Member sk_comply_1 comply) (STV 1.0 0.99))
    (: e_agent (Agent sk_comply_1 tom) (STV 1.0 0.99))
    (: e_obligated (Obligated sk_comply_1) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

**[ev-passive] The report was published.** — passive: Patient, no Agent

    (: e_publish (Member sk_publish_1 publish) (STV 1.0 0.99))
    (: e_patient (Patient sk_publish_1 sk_report_1) (STV 1.0 0.99))
    (: e_report (Member sk_report_1 report) (STV 1.0 0.99))
    (: e_past (Past sk_publish_1) (STV 1.0 0.99))

**[ev-neg] Grace didn't sign the contract.** — event negation → strength-0 conjunction

    (: sk_contract_1_contract (Member sk_contract_1 contract) (STV 1.0 0.99))
    (: grace_not_sign (And (Member sk_sign_1 sign) (Agent sk_sign_1 grace) (Patient sk_sign_1 sk_contract_1) (Past sk_sign_1)) (STV 0.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

### Thematic role: Theme vs Patient (#23)

The object role must be the **same** in a statement and its question or the query misses (roles are opaque). Rule: `Patient` only when the action creates / destroys / consumes / physically changes the object; otherwise (acquired / transferred / perceived / evaluated) `Theme`, the default when unclear. These fresh verbs (not in the prompt's lists) check the rule generalizes; each statement/question pair must agree.

**[role-theme-stmt] Maya purchased a bicycle.** — acquire, object unchanged → `Theme`

    (: e_buy (Member sk_purchase_1 purchase) (STV 1.0 0.99))
    (: e_agent (Agent sk_purchase_1 maya) (STV 1.0 0.99))
    (: e_theme (Theme sk_purchase_1 sk_bicycle_1) (STV 1.0 0.99))
    (: e_bike (Member sk_bicycle_1 bicycle) (STV 1.0 0.99))
    (: e_past (Past sk_purchase_1) (STV 1.0 0.99))
    (: maya_name (Name maya "Maya") (STV 1.0 0.99))

**[role-theme-q] What did Maya purchase?** — same verb → same `Theme` role, so the query matches the statement

    (: $prf (And (Name $m "Maya") (Member $e purchase) (Agent $e $m) (Theme $e $what) (Past $e)) $tv)

**[role-eval-stmt] The auditor inspected the ledger.** — evaluate/perceive, object unchanged → `Theme`

    (: e_insp (Member sk_inspect_1 inspect) (STV 1.0 0.99))
    (: e_agent (Agent sk_inspect_1 sk_auditor_1) (STV 1.0 0.99))
    (: e_aud (Member sk_auditor_1 auditor) (STV 1.0 0.99))
    (: e_theme (Theme sk_inspect_1 sk_ledger_1) (STV 1.0 0.99))
    (: e_ledg (Member sk_ledger_1 ledger) (STV 1.0 0.99))
    (: e_past (Past sk_inspect_1) (STV 1.0 0.99))

**[role-patient-stmt] The worker assembled a cabinet.** — creates / physically forms the object → `Patient`

    (: e_asm (Member sk_assemble_1 assemble) (STV 1.0 0.99))
    (: e_agent (Agent sk_assemble_1 sk_worker_1) (STV 1.0 0.99))
    (: e_wkr (Member sk_worker_1 worker) (STV 1.0 0.99))
    (: e_patient (Patient sk_assemble_1 sk_cabinet_1) (STV 1.0 0.99))
    (: e_cab (Member sk_cabinet_1 cabinet) (STV 1.0 0.99))
    (: e_past (Past sk_assemble_1) (STV 1.0 0.99))

**[role-patient-q] What did the worker assemble?** — same verb → same `Patient` role

    (: $prf (And (Member $w worker) (Member $e assemble) (Agent $e $w) (Patient $e $what) (Past $e)) $tv)

## Coordination & plurals

**[coord-vp] Nina laughed and cried.** — coordinated VPs → two events, shared agent

    (: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))
    (: e_laugh_agent (Agent sk_laugh_1 nina) (STV 1.0 0.99))
    (: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))
    (: e_cry (Member sk_cry_1 cry) (STV 1.0 0.99))
    (: e_cry_agent (Agent sk_cry_1 nina) (STV 1.0 0.99))
    (: e_cry_past (Past sk_cry_1) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[coord-distrib] Tom and Grace departed.** — coordinated NPs, distributive → two events

    (: e_depart1 (Member sk_depart_1 depart) (STV 1.0 0.99))
    (: e_depart1_agent (Agent sk_depart_1 tom) (STV 1.0 0.99))
    (: e_depart1_past (Past sk_depart_1) (STV 1.0 0.99))
    (: e_depart2 (Member sk_depart_2 depart) (STV 1.0 0.99))
    (: e_depart2_agent (Agent sk_depart_2 grace) (STV 1.0 0.99))
    (: e_depart2_past (Past sk_depart_2) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[coord-copular] Leo and Mary are nurses.** — distributive copular → one atom per conjunct

    (: leo_nurse (Member leo nurse) (STV 1.0 0.99))
    (: mary_nurse (Member mary nurse) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[coord-shared] Tom and Grace cleaned the kitchen.** — distributive + shared object (one `kitchen`)

    (: sk_kitchen_1_kitchen (Member sk_kitchen_1 kitchen) (STV 1.0 0.99))
    (: e_clean1 (Member sk_clean_1 clean) (STV 1.0 0.99))
    (: e_clean1_agent (Agent sk_clean_1 tom) (STV 1.0 0.99))
    (: e_clean1_patient (Patient sk_clean_1 sk_kitchen_1) (STV 1.0 0.99))
    (: e_clean1_past (Past sk_clean_1) (STV 1.0 0.99))
    (: e_clean2 (Member sk_clean_2 clean) (STV 1.0 0.99))
    (: e_clean2_agent (Agent sk_clean_2 grace) (STV 1.0 0.99))
    (: e_clean2_patient (Patient sk_clean_2 sk_kitchen_1) (STV 1.0 0.99))
    (: e_clean2_past (Past sk_clean_2) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[coord-collective] Leo and Mary argued.** — reciprocal verb → one event, two `Agent` atoms

    (: e_argue (Member sk_argue_1 argue) (STV 1.0 0.99))
    (: e_argue_agent1 (Agent sk_argue_1 leo) (STV 1.0 0.99))
    (: e_argue_agent2 (Agent sk_argue_1 mary) (STV 1.0 0.99))
    (: e_argue_past (Past sk_argue_1) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[coord-group] The orchestra performed.** — group as a unit (collective noun) → sum individual

    (: sk_orchestra_1_orchestra (Member sk_orchestra_1 orchestra) (STV 1.0 0.99))
    (: e_perform (Member sk_perform_1 perform) (STV 1.0 0.99))
    (: e_perform_agent (Agent sk_perform_1 sk_orchestra_1) (STV 1.0 0.99))
    (: e_perform_past (Past sk_perform_1) (STV 1.0 0.99))

**[plural-group] The tourists assembled.** — bare definite plural → group entity + `GroupOf` member kind

    (: sk_group_1_tourists (GroupOf sk_group_1 tourist) (STV 1.0 0.99))
    (: e_assemble (Member sk_assemble_1 assemble) (STV 1.0 0.99))
    (: e_assemble_agent (Agent sk_assemble_1 sk_group_1) (STV 1.0 0.99))
    (: e_assemble_past (Past sk_assemble_1) (STV 1.0 0.99))

**[coord-pronoun] Felix and Diana traveled. They were exhausted.** — plural pronoun distributes (passage)

    (: e_travel1 (Member sk_travel_1 travel) (STV 1.0 0.99))
    (: e_travel1_agent (Agent sk_travel_1 felix) (STV 1.0 0.99))
    (: e_travel1_past (Past sk_travel_1) (STV 1.0 0.99))
    (: e_travel2 (Member sk_travel_2 travel) (STV 1.0 0.99))
    (: e_travel2_agent (Agent sk_travel_2 diana) (STV 1.0 0.99))
    (: e_travel2_past (Past sk_travel_2) (STV 1.0 0.99))
    (: felix_exhausted (Past (Member felix exhausted)) (STV 1.0 0.99))
    (: diana_exhausted (Past (Member diana exhausted)) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

## Cardinality (counting)

**[card-exact] Four chefs prepared the banquet.** — exact cardinal → `GroupOf` + `Cardinality n`, predicate over the group

    (: sk_group_1_chefs (GroupOf sk_group_1 chef) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 4) (STV 1.0 0.99))
    (: e_prepare (Member sk_prepare_1 prepare) (STV 1.0 0.99))
    (: e_prepare_agent (Agent sk_prepare_1 sk_group_1) (STV 1.0 0.99))
    (: e_prepare_patient (Patient sk_prepare_1 sk_banquet_1) (STV 1.0 0.99))
    (: e_banquet (Member sk_banquet_1 banquet) (STV 1.0 0.99))
    (: e_prepare_past (Past sk_prepare_1) (STV 1.0 0.99))

**[card-both] Both twins laughed.** — "both" = exactly 2 (definite)

    (: sk_group_1_twins (GroupOf sk_group_1 twin) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 2) (STV 1.0 0.99))
    (: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))
    (: e_laugh_agent (Agent sk_laugh_1 sk_group_1) (STV 1.0 0.99))
    (: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))

**[card-possess] Bob has three cars.** — cardinal possession → group is the Theme

    (: sk_group_1_cars (GroupOf sk_group_1 car) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 3) (STV 1.0 0.99))
    (: e_have (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_have_holder (Holder sk_have_1 bob) (STV 1.0 0.99))
    (: e_have_theme (Theme sk_have_1 sk_group_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[card-atleast] More than five passengers complained.** — bounded → `CardinalityAtLeast` (>5 ⇒ ≥6)

    (: sk_group_1_passengers (GroupOf sk_group_1 passenger) (STV 1.0 0.99))
    (: sk_group_1_atleast (CardinalityAtLeast sk_group_1 6) (STV 1.0 0.99))
    (: e_complain (Member sk_complain_1 complain) (STV 1.0 0.99))
    (: e_complain_agent (Agent sk_complain_1 sk_group_1) (STV 1.0 0.99))
    (: e_complain_past (Past sk_complain_1) (STV 1.0 0.99))

**[card-atmost] Fewer than ten students attended.** — bounded → `CardinalityAtMost` (<10 ⇒ ≤9)

    (: sk_group_1_students (GroupOf sk_group_1 student) (STV 1.0 0.99))
    (: sk_group_1_atmost (CardinalityAtMost sk_group_1 9) (STV 1.0 0.99))
    (: e_attend (Member sk_attend_1 attend) (STV 1.0 0.99))
    (: e_attend_agent (Agent sk_attend_1 sk_group_1) (STV 1.0 0.99))
    (: e_attend_past (Past sk_attend_1) (STV 1.0 0.99))

**[card-vague] A few children napped.** — vague phrase → `GroupOf` + `CardinalityPhrase`, no number (seeded rules derive the bound)

    (: sk_group_1_children (GroupOf sk_group_1 child) (STV 1.0 0.99))
    (: sk_group_1_phrase (CardinalityPhrase sk_group_1 "a few") (STV 1.0 0.99))
    (: e_nap (Member sk_nap_1 nap) (STV 1.0 0.99))
    (: e_nap_agent (Agent sk_nap_1 sk_group_1) (STV 1.0 0.99))
    (: e_nap_past (Past sk_nap_1) (STV 1.0 0.99))

**[card-phrase] Dozens of protesters marched.** — large vague magnitude → `CardinalityPhrase "dozens"` (seeded rule ⟹ `CardinalityAtLeast 24`)

    (: sk_group_1_protesters (GroupOf sk_group_1 protester) (STV 1.0 0.99))
    (: sk_group_1_phrase (CardinalityPhrase sk_group_1 "dozens") (STV 1.0 0.99))
    (: e_march (Member sk_march_1 march) (STV 1.0 0.99))
    (: e_march_agent (Agent sk_march_1 sk_group_1) (STV 1.0 0.99))
    (: e_march_past (Past sk_march_1) (STV 1.0 0.99))

**[card-howmany-q] How many visitors registered?** — count question → bind `(Cardinality $g $n)`

    (: $prf (And (Member $e register) (Agent $e $g) (GroupOf $g visitor) (Cardinality $g $n) (Past $e)) $tv)

**[card-bounded-q] Did more than four players score?** — bounded (lower) question: a count may be stored exact *or* as a bound, so emit the `Cardinality` branch **and** the `CardinalityAtLeast` branch + union (disjoint); "more than" → `>`

    (: $prf (And (Member $e score) (Agent $e $g) (GroupOf $g player) (Cardinality $g $n) (Compute > ($n 4) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e score) (Agent $e $g) (GroupOf $g player) (CardinalityAtLeast $g $m) (Compute > ($m 4) -> true) (Past $e)) $tv)

**[card-bounded-upper-q] Did fewer than seven hikers return?** — bounded (upper) question → `Cardinality` branch **and** `CardinalityAtMost` branch + union; "fewer than" → `<`

    (: $prf (And (Member $e return) (Agent $e $g) (GroupOf $g hiker) (Cardinality $g $n) (Compute < ($n 7) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e return) (Agent $e $g) (GroupOf $g hiker) (CardinalityAtMost $g $k) (Compute < ($k 7) -> true) (Past $e)) $tv)

### Partitives — "Q of the Ns" (#6)

"Q **of the** Ns" quantifies a **definite, specific set**: emit a definite superset group + a `SubsetOf` subset, predicate on the subset, and **no** generic kind-claim. Cardinal → `Cardinality`; proportional → `ProportionOf S G level`. The two control cases (bare generic / bare count, no "of the") must **not** get a superset.

**[part-card] Four of the jurors disagreed.** — cardinal partitive → definite superset + `SubsetOf` subset + `Cardinality`

    (: jurors_set (GroupOf sk_jurors_1 juror) (STV 1.0 0.99))
    (: sub_grp (GroupOf sk_group_1 juror) (STV 1.0 0.99))
    (: sub_of (SubsetOf sk_group_1 sk_jurors_1) (STV 1.0 0.99))
    (: sub_card (Cardinality sk_group_1 4) (STV 1.0 0.99))
    (: e_disagree (Member sk_disagree_1 disagree) (STV 1.0 0.99))
    (: e_agent (Agent sk_disagree_1 sk_group_1) (STV 1.0 0.99))
    (: e_past (Past sk_disagree_1) (STV 1.0 0.99))

**[part-card-q] How many of the jurors disagreed?** — partitive count question → bind `Cardinality` of the `SubsetOf` subset

    (: $prf (And (Member $e disagree) (Agent $e $s) (SubsetOf $s sk_jurors_1) (Cardinality $s $n) (Past $e)) $tv)

**[part-prop] Most of the votes were valid.** — proportional partitive → `ProportionOf S G most` + property on the subset

    (: votes_set (GroupOf sk_votes_1 vote) (STV 1.0 0.99))
    (: sub_grp (GroupOf sk_group_1 vote) (STV 1.0 0.99))
    (: sub_of (SubsetOf sk_group_1 sk_votes_1) (STV 1.0 0.99))
    (: sub_prop (ProportionOf sk_group_1 sk_votes_1 most) (STV 1.0 0.99))
    (: valid_past (Past (Member sk_group_1 valid)) (STV 1.0 0.99))

**[part-generic-ctrl] Most insects are harmless.** — bare generic (no "of the") → kind `Inheritance` @0.9, **no** superset / `SubsetOf`

    (: insects_harmless (Inheritance insect harmless) (STV 0.9 0.9))

**[part-count-ctrl] Five swimmers finished.** — bare count (no "of the") → group + `Cardinality`, **no** superset / `SubsetOf`

    (: swimmers_grp (GroupOf sk_group_1 swimmer) (STV 1.0 0.99))
    (: swimmers_card (Cardinality sk_group_1 5) (STV 1.0 0.99))
    (: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e_agent (Agent sk_finish_1 sk_group_1) (STV 1.0 0.99))
    (: e_past (Past sk_finish_1) (STV 1.0 0.99))

## Comparatives & degree

**[comp-basic] Carol is faster than Dan.** — comparative → `More` (no positive property)

    (: comp_basic (More fast carol dan) (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))
    (: dan_name (Name dan "Dan") (STV 1.0 0.99))

**[comp-less] Leo is less experienced than Mary.** — "less" → swap the pair

    (: comp_less (More experienced mary leo) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[comp-antonym] Nina is weaker than Oscar.** — antonym → positive pole `strong` + swap (keep-lemma `(More weak nina oscar)` also valid)

    (: comp_antonym (More strong oscar nina) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[comp-super] Felix is the smartest engineer.** — superlative → `Most` + class membership

    (: comp_super (Most smart felix engineer) (STV 1.0 0.99))
    (: felix_engineer (Member felix engineer) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))

**[comp-equative] Grace is as old as Victor.** — equative → `SameDegree`

    (: comp_equative (SameDegree old grace victor) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[comp-very] Diana is extremely calm.** — intensifier → positive + `Degree high`

    (: diana_calm (Member diana calm) (STV 1.0 0.99))
    (: diana_calm_deg (Degree diana calm high) (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[comp-too] The coffee is too sweet.** — "too" → `Degree excessive` (definite `the coffee` typed)

    (: sk_coffee_1_coffee (Member sk_coffee_1 coffee) (STV 1.0 0.99))
    (: sk_coffee_1_sweet (Member sk_coffee_1 sweet) (STV 1.0 0.99))
    (: sk_coffee_1_deg (Degree sk_coffee_1 sweet excessive) (STV 1.0 0.99))

**[comp-enough] The rope is long enough.** — "enough" → `Degree sufficient`

    (: sk_rope_1_rope (Member sk_rope_1 rope) (STV 1.0 0.99))
    (: sk_rope_1_long (Member sk_rope_1 long) (STV 1.0 0.99))
    (: sk_rope_1_deg (Degree sk_rope_1 long sufficient) (STV 1.0 0.99))

**[comp-tense] Carol was taller than Dan.** — tense wraps the comparative atom

    (: comp_tense (Past (More tall carol dan)) (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))
    (: dan_name (Name dan "Dan") (STV 1.0 0.99))

**[comp-q-who] Who is faster than Dan?** — wh on the higher term

    (: $prf (And (Name $d "Dan") (More fast $x $d)) $tv)

**[comp-q-super] Who is the smartest engineer?** — superlative query

    (: $prf (Most smart $x engineer) $tv)

**[comp-diff] Nora is 6 centimeters taller than Owen.** — differential comparative → `MoreBy` (seeded `morebydiff` derives the plain `More`)

    (: nora_owen_diff (MoreBy tall nora owen 6 centimeter) (STV 1.0 0.99))
    (: nora_name (Name nora "Nora") (STV 1.0 0.99))
    (: owen_name (Name owen "Owen") (STV 1.0 0.99))

**[comp-diff-antonym] The pony is 30 kilograms lighter than the horse.** — antonym → swap to the positive pole `heavy`

    (: pony_horse_diff (MoreBy heavy sk_horse_1 sk_pony_1 30 kilogram) (STV 1.0 0.99))
    (: pony_member (Member sk_pony_1 pony) (STV 1.0 0.99))
    (: horse_member (Member sk_horse_1 horse) (STV 1.0 0.99))

**[comp-diff-q] How much taller is Nora than Owen?** — gap query → bind magnitude + unit

    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m $u)) $tv)

**[comp-diff-threshold] Is Nora more than 5 cm taller than Owen?** — gap threshold; the gap may be stored exact or approximate, so emit BOTH branches (`Compute` ∪ `GreaterThan`) + union

    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m centimeter) (Compute > ($m 5) -> true)) $tv)
    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m centimeter) (GreaterThan $m 5)) $tv)

## Measures & units

**[meas-adj] Grace is 165 centimeters tall.** — measure on a stated adjective scale

    (: meas_adj (Measure grace tall 165 centimeter) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[meas-age] Leo is 40 years old.** — age → `old` scale

    (: meas_age (Measure leo old 40 year) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[meas-verb] The parcel weighs 2 kilograms.** — verb → dimension noun `weight` (no adjective stated)

    (: sk_parcel_1_parcel (Member sk_parcel_1 parcel) (STV 1.0 0.99))
    (: meas_verb (Measure sk_parcel_1 weight 2 kilogram) (STV 1.0 0.99))

**[meas-price] The ticket costs 50 dollars.** — "costs" → `price` scale

    (: sk_ticket_1_ticket (Member sk_ticket_1 ticket) (STV 1.0 0.99))
    (: meas_price (Measure sk_ticket_1 price 50 dollar) (STV 1.0 0.99))

**[meas-tense] The bridge was 200 meters long.** — tense wraps the measure atom

    (: sk_bridge_1_bridge (Member sk_bridge_1 bridge) (STV 1.0 0.99))
    (: meas_tense (Past (Measure sk_bridge_1 long 200 meter)) (STV 1.0 0.99))

**[meas-atleast] The fence is at least 4 meters long.** — bounded → `MeasureAtLeast`

    (: sk_fence_1_fence (Member sk_fence_1 fence) (STV 1.0 0.99))
    (: meas_atleast (MeasureAtLeast sk_fence_1 long 4 meter) (STV 1.0 0.99))

**[meas-atmost] The package weighs no more than 3 kilograms.** — bounded → `MeasureAtMost`

    (: sk_package_1_package (Member sk_package_1 package) (STV 1.0 0.99))
    (: meas_atmost (MeasureAtMost sk_package_1 weight 3 kilogram) (STV 1.0 0.99))

**[meas-q-how] How old is Leo?** — measure question → bind magnitude + unit

    (: $prf (And (Name $l "Leo") (Measure $l old $n $u)) $tv)

**[meas-q-threshold] Is Grace taller than 160 centimeters?** — a threshold question can't know if the target is stored exact or approximate → emit BOTH branches + union

    (: $prf (And (Name $g "Grace") (Measure $g tall $n centimeter) (Compute > ($n 160) -> true)) $tv)
    (: $prf (And (Name $g "Grace") (Measure $g tall $n centimeter) (GreaterThan $n 160)) $tv)

**[meas-approx-adj] The fence is about 3 meters tall.** — approximate, **tight** hedge ("about") → distribution magnitude `(ParticleFromNormal X σ)`, σ ≈ 10% of X

    (: fence_tall (Measure sk_fence_1 tall (ParticleFromNormal 3 0.3) meter) (STV 1.0 0.99))
    (: fence_member (Member sk_fence_1 fence) (STV 1.0 0.99))

**[meas-approx-verb] The crate weighs roughly 40 kilograms.** — approximate, **loose** hedge ("roughly") on a dimension-noun scale → σ ≈ 20% of X

    (: crate_weight (Measure sk_crate_1 weight (ParticleFromNormal 40 8) kilogram) (STV 1.0 0.99))
    (: crate_member (Member sk_crate_1 crate) (STV 1.0 0.99))

**[meas-q-threshold-open] Which beams are longer than 5 meters?** — open threshold over a possibly-mixed KB (some beams exact, some approximate); BOTH branches + union, branches disjoint so no double-count

    (: $prf (And (Member $b beam) (Measure $b long $n meter) (Compute > ($n 5) -> true)) $tv)
    (: $prf (And (Member $b beam) (Measure $b long $n meter) (GreaterThan $n 5)) $tv)

### Cross-unit conversion

Measures keep their stated unit (a seeded lexicon auto-derives the canonical unit — meter/kilogram/second). Compare or threshold **in the canonical unit**; convert a non-canonical threshold in-query via `Compute *`.

**[unit-compare] The plank is 2 meters long. The beam is 250 centimeters long. Is the beam longer than the plank?** — cross-unit comparison → query both in canonical `meter`

    (: plank_mem (Member sk_plank_1 plank) (STV 1.0 0.99))
    (: plank_long (Measure sk_plank_1 long 2 meter) (STV 1.0 0.99))
    (: beam_mem (Member sk_beam_1 beam) (STV 1.0 0.99))
    (: beam_long (Measure sk_beam_1 long 250 centimeter) (STV 1.0 0.99))
    (: $prf (And (Member $b beam) (Measure $b long $mb meter) (Member $p plank) (Measure $p long $mp meter) (Compute > ($mb $mp) -> true)) $tv)

**[unit-threshold] The fence is 300 centimeters tall. Is it taller than 8 feet?** — cross-unit threshold → entity auto-converts to `meter`, threshold converted in-query (foot 0.3048)

    (: fence_mem (Member sk_fence_1 fence) (STV 1.0 0.99))
    (: fence_tall (Measure sk_fence_1 tall 300 centimeter) (STV 1.0 0.99))
    (: $prf (And (Member $f fence) (Measure $f tall $m meter) (Compute * (8 0.3048) -> $t) (Compute > ($m $t) -> true)) $tv)

**[unit-mass] The cat weighs 4 kilograms. The dog weighs 8000 grams. Is the dog heavier than the cat?** — cross-unit mass comparison → query both in canonical `kilogram`

    (: cat_mem (Member sk_cat_1 cat) (STV 1.0 0.99))
    (: cat_weight (Measure sk_cat_1 weight 4 kilogram) (STV 1.0 0.99))
    (: dog_mem (Member sk_dog_1 dog) (STV 1.0 0.99))
    (: dog_weight (Measure sk_dog_1 weight 8000 gram) (STV 1.0 0.99))
    (: $prf (And (Member $d dog) (Measure $d weight $md kilogram) (Member $c cat) (Measure $c weight $mc kilogram) (Compute > ($md $mc) -> true)) $tv)

**[temp-compare] The forge is 1500°C. The kiln is 2000°F. Is the forge hotter than the kiln?** — temperature is affine; canonical `kelvin`; scale = `temperature`; compare in kelvin

    (: forge_m (Member sk_forge_1 forge) (STV 1.0 0.99))
    (: forge_temp (Measure sk_forge_1 temperature 1500 celsius) (STV 1.0 0.99))
    (: kiln_m (Member sk_kiln_1 kiln) (STV 1.0 0.99))
    (: kiln_temp (Measure sk_kiln_1 temperature 2000 fahrenheit) (STV 1.0 0.99))
    (: $prf (And (Member $f forge) (Measure $f temperature $kf kelvin) (Member $k kiln) (Measure $k temperature $kk kelvin) (Compute > ($kf $kk) -> true)) $tv)

**[temp-threshold] The freezer is at 4°C. Is it colder than 10°C?** — "colder" = stored < threshold; threshold converted in-query (`+273.15`); dual-branch per cross-type routing

    (: freezer_m (Member sk_freezer_1 freezer) (STV 1.0 0.99))
    (: freezer_temp (Measure sk_freezer_1 temperature 4 celsius) (STV 1.0 0.99))
    (: $prf (And (Member $f freezer) (Measure $f temperature $k kelvin) (Compute + (10 273.15) -> $t) (Compute < ($k $t) -> true)) $tv)
    (: $prf (And (Member $f freezer) (Measure $f temperature $k kelvin) (Compute + (10 273.15) -> $t) (GreaterThan $t $k)) $tv)

**[unit-bound] The ladder is at least 12 feet tall. What is its minimum height in meters?** — bounded measure converts the bound; query in canonical `meter`

    (: ladder_mem (Member sk_ladder_1 ladder) (STV 1.0 0.99))
    (: ladder_tall (MeasureAtLeast sk_ladder_1 tall 12 foot) (STV 1.0 0.99))
    (: $prf (And (Member $l ladder) (MeasureAtLeast $l tall $m meter)) $tv)

## Generics & scope (verbal → rules)

**[gen-verbal] Fish swim.** — verbal generic over a kind → Skolem-event rule, 0.9/0.9

    (: fish_swim (Implication (Premises (Member $x fish)) (Conclusions (Member (sk_swim $x) swim) (Agent (sk_swim $x) $x))) (STV 0.9 0.9))

**[gen-cap] Cats can climb.** — generic capability → rule + Can

    (: cats_can_climb (Implication (Premises (Member $x cat)) (Conclusions (Member (sk_climb $x) climb) (Agent (sk_climb $x) $x) (Can (sk_climb $x)))) (STV 0.9 0.9))

**[gen-deontic] Citizens must pay tax.** — generic deontic over a kind → rule + Obligated, 1.0/0.99

    (: citizens_must_pay (Implication (Premises (Member $x citizen)) (Conclusions (Member (sk_pay $x) pay) (Agent (sk_pay $x) $x) (Patient (sk_pay $x) tax) (Obligated (sk_pay $x)))) (STV 1.0 0.99))

**[scope-ae] Every guest brings a gift.** — ∀∃ dependent → Skolem function event + gift

    (: every_guest_brings_gift (Implication (Premises (Member $x guest)) (Conclusions (Member (sk_bring $x) bring) (Agent (sk_bring $x) $x) (Theme (sk_bring $x) (sk_gift $x)) (Member (sk_gift $x) gift))) (STV 1.0 0.9))

**[scope-ea] Some teacher graded every exam.** — ∃∀ shared → witness constant + rule over exams

    (: sk_teacher_1_teacher (Member sk_teacher_1 teacher) (STV 1.0 0.99))
    (: teacher_graded_exams (Implication (Premises (Member $y exam)) (Conclusions (Member (sk_grade $y) grade) (Agent (sk_grade $y) sk_teacher_1) (Theme (sk_grade $y) $y) (Past (sk_grade $y)))) (STV 1.0 0.9))

**[scope-aa] Every wolf hunted every deer.** — ∀∀ → two universal premises

    (: every_wolf_hunted_deer (Implication (Premises (Member $x wolf) (Member $y deer)) (Conclusions (Member (sk_hunt $x $y) hunt) (Agent (sk_hunt $x $y) $x) (Patient (sk_hunt $x $y) $y) (Past (sk_hunt $x $y)))) (STV 1.0 0.9))

**[scope-aae] Every coach assigned every player a drill.** — ∀∀∃ → two universal premises; dependent existential = Skolem of **both** `(sk_drill $c $p)`

    (: every_coach_assigned_drill (Implication (Premises (Member $c coach) (Member $p player)) (Conclusions (Member (sk_assign $c $p) assign) (Agent (sk_assign $c $p) $c) (Recipient (sk_assign $c $p) $p) (Theme (sk_assign $c $p) (sk_drill $c $p)) (Member (sk_drill $c $p) drill) (Past (sk_assign $c $p)))) (STV 1.0 0.9))

**[scope-num] Every student memorized three poems.** — numeric under ∀ → Skolem **group** + `Cardinality` (a function of `$x`)

    (: every_student_memorized_poems (Implication (Premises (Member $x student)) (Conclusions (Member (sk_memorize $x) memorize) (Agent (sk_memorize $x) $x) (Theme (sk_memorize $x) (sk_poems $x)) (GroupOf (sk_poems $x) poem) (Cardinality (sk_poems $x) 3) (Past (sk_memorize $x)))) (STV 1.0 0.9))

**[scope-shared] Every senator emailed every colleague the same memo.** — ∀∀ + "the same" → one **shared constant** memo (not a Skolem function)

    (: sk_memo_1_memo (Member sk_memo_1 memo) (STV 1.0 0.99))
    (: every_senator_emailed_colleague (Implication (Premises (Member $s senator) (Member $c colleague)) (Conclusions (Member (sk_email $s $c) email) (Agent (sk_email $s $c) $s) (Recipient (sk_email $s $c) $c) (Theme (sk_email $s $c) sk_memo_1) (Past (sk_email $s $c)))) (STV 1.0 0.9))

**[rel-univ] Everyone who has a garden is a gardener.** — event-premise rule + copular conclusion

    (: gardener_rule (Implication (Premises (Member $e have) (Holder $e $x) (Theme $e $y) (Member $y garden)) (Conclusions (Member $x gardener))) (STV 1.0 0.99))

### Striking & relational generics

Judge whether the property holds of *most* individuals. A bare generic relating two KINDS → a kind-level relation (no instance distribution, strength stays high). A striking *minority* copular generic → `Inheritance` at a lowered strength. (An *explicit* universal stays a ∀∀ rule — see [scope-aa].)

**[genR-rel-eat] Vultures eat carrion.** — relational generic (two kinds) → kind-level relation, never distributes to instances, strength high

    (: vultures_eat_carrion (Eat vulture carrion) (STV 0.9 0.9))

**[genR-rel-catch] Spiders catch insects.** — relational generic → kind-level relation

    (: spiders_catch_insects (Catch spider insect) (STV 0.9 0.9))

**[genR-strike] Programmers are antisocial.** — striking *minority* copular generic → `Inheritance` at LOWERED strength (~0.2–0.3, not 0.9)

    (: programmers_antisocial (Inheritance programmer antisocial) (STV 0.3 0.9))

**[genR-majority] Eagles are predators.** — *majority* copular generic (control) → `Inheritance` at 0.9, NOT lowered

    (: eagles_predators (Inheritance eagle predator) (STV 0.9 0.9))

### Defeasible generics & exceptions

A general generic + a sub-kind exception: emit the general `Inheritance` at empirical **0.9**, the taxonomy link, and the exception at the **opposite** strength and **higher** confidence **0.99** — revision then overrides the general for that sub-kind while ordinary members keep it. Capability `(can V)` for ability contrasts, plain property for copular; the exception's property symbol must **match** the general's.

**[defeas-cap] Cats can retract their claws, but cheetahs can't.** — capability defeasible → exception `(can …)` at strength 0 / conf 0.99

    (: cat_retract (Inheritance cat (can retract_claws)) (STV 0.9 0.9))
    (: cheetah_cat (Inheritance cheetah cat) (STV 0.99 0.99))
    (: cheetah_noretract (Inheritance cheetah (can retract_claws)) (STV 0.0 0.99))

**[defeas-prop] Citrus fruits are sour, but oranges aren't.** — copular property defeasible → exception against the SAME property `sour` at strength 0

    (: citrus_sour (Inheritance citrus_fruit sour) (STV 0.9 0.9))
    (: orange_citrus (Inheritance orange citrus_fruit) (STV 0.99 0.99))
    (: orange_notsour (Inheritance orange sour) (STV 0.0 0.99))

**[defeas-rev] Fish can't survive on land, but lungfish can.** — reverse polarity: negative general (0.0/0.9), positive exception (1.0/0.99)

    (: fish_noland (Inheritance fish (can survive_on_land)) (STV 0.0 0.9))
    (: lungfish_fish (Inheritance lungfish fish) (STV 0.99 0.99))
    (: lungfish_land (Inheritance lungfish (can survive_on_land)) (STV 1.0 0.99))

**[defeas-control] Owls are nocturnal.** — generic with NO stated exception → plain generic, no exception fact

    (: owls_nocturnal (Inheritance owl nocturnal) (STV 0.9 0.9))

### Defeasible deontic norms

A deontic norm with a stated exemption: reify the obligation/permission as a property `(obligated <action>)` / `(permitted <action>)` (so revision can override it — the event-rule form does not), then the Group S three-fact pattern. Plain norms (no exemption) keep the event-rule with `Obligated`/`Permitted`.

**[deon-oblig] Passengers must wear seatbelts, but infants are exempt.** — defeasible obligation → reified `(obligated …)` property, exemption at strength 0 / conf 0.99

    (: passenger_seatbelt (Inheritance passenger (obligated wear_seatbelt)) (STV 0.9 0.9))
    (: infant_passenger (Inheritance infant passenger) (STV 0.99 0.99))
    (: infant_exempt (Inheritance infant (obligated wear_seatbelt)) (STV 0.0 0.99))

**[deon-perm] Staff may access the archive, but interns may not.** — defeasible permission → reified `(permitted …)` property

    (: staff_archive (Inheritance staff (permitted access_archive)) (STV 0.9 0.9))
    (: intern_staff (Inheritance intern staff) (STV 0.99 0.99))
    (: intern_noperm (Inheritance intern (permitted access_archive)) (STV 0.0 0.99))

**[deon-control] Pedestrians must use the crosswalk.** — plain deontic norm (no exemption) → event-rule with `Obligated`, NOT the property form

    (: pedestrian_crosswalk (Implication (Premises (Member $x pedestrian)) (Conclusions (Member (sk_use $x) use) (Agent (sk_use $x) $x) (Patient (sk_use $x) crosswalk) (Obligated (sk_use $x)))) (STV 1.0 0.99))

## Compound decomposition (cross-cutting)

Prefer single-word symbols; when a compound is genuinely needed, also emit decomposition atoms at `0.99/0.99` — **action** `verb_object` → genus `(Inheritance compound verb)` + object `(Patient compound obj)`; **kind** `modifier_noun` → genus `(Inheritance compound head-noun)` (+ adjective modifier when it genuinely describes the compound); **agent-nominalization** `X-er` → capability `(Inheritance nom (can verb))` + kind-relation `(Verb nom obj)` if an object is incorporated. Stop at single-word lemmas; leave purpose/association modifiers opaque (and adjective/condition compounds, deferred).

**[decomp-action] Residents must recycle waste, but tenants are exempt.** — compound action `recycle_waste` (inside `(obligated …)`) → genus `recycle` + object `waste`

    (: resident_recycle (Inheritance resident (obligated recycle_waste)) (STV 0.9 0.9))
    (: tenant_resident (Inheritance tenant resident) (STV 0.99 0.99))
    (: tenant_exempt (Inheritance tenant (obligated recycle_waste)) (STV 0.0 0.99))
    (: rw_genus (Inheritance recycle_waste recycle) (STV 0.99 0.99))
    (: rw_obj (Patient recycle_waste waste) (STV 0.99 0.99))

**[decomp-kind] A police dog barked.** — compound kind `police_dog` → genus `dog`; "police" is an association modifier, left in the symbol (a police dog is not `police`)

    (: sk_police_dog_1_m (Member sk_police_dog_1 police_dog) (STV 1.0 0.99))
    (: pd_genus (Inheritance police_dog dog) (STV 0.99 0.99))
    (: e_bark (Member sk_bark_1 bark) (STV 1.0 0.99))
    (: e_agent (Agent sk_bark_1 sk_police_dog_1) (STV 1.0 0.99))
    (: e_past (Past sk_bark_1) (STV 1.0 0.99))

**[decomp-kind-adj] The wooden bridge is old.** — compound kind `wooden_bridge` → genus `bridge` + adjective modifier `wooden` (a wooden bridge IS wooden)

    (: sk_wooden_bridge_1_m (Member sk_wooden_bridge_1 wooden_bridge) (STV 1.0 0.99))
    (: wb_genus (Inheritance wooden_bridge bridge) (STV 0.99 0.99))
    (: wb_adj (Inheritance wooden_bridge wooden) (STV 0.99 0.99))
    (: wb_old (Member sk_wooden_bridge_1 old) (STV 1.0 0.99))

**[nom-intrans] Greyhounds are racers.** — intransitive agent-nominalization → capability `(can <verb>)`, no object

    (: greyhound_racer (Inheritance greyhound racer) (STV 0.9 0.9))
    (: racer_can (Inheritance racer (can race)) (STV 0.99 0.99))

**[nom-trans] Beavers are dam-builders.** — transitive nominalization (object incorporated) → capability + kind-relation `(Build dam_builder dam)`

    (: beaver_builder (Inheritance beaver dam_builder) (STV 0.9 0.9))
    (: builder_can (Inheritance dam_builder (can build)) (STV 0.99 0.99))
    (: builder_rel (Build dam_builder dam) (STV 0.99 0.99))

**[nom-noobject] Hawks are hunters.** — verb takes an object but the noun doesn't incorporate one → capability only, no kind-relation

    (: hawk_hunter (Inheritance hawk hunter) (STV 0.9 0.9))
    (: hunter_can (Inheritance hunter (can hunt)) (STV 0.99 0.99))

## Conditional properties

"X is P when/at/under/if C" → reified `(ConditionalProperty kind property condition)` (do NOT assert the bare property unconditionally); a seeded `cond_prop` rule gives the property to a kind-member also in the condition-state. Decompose a compound condition per **Compound concepts**.

**[cond-adj] Clay is malleable when wet.** — adjectival condition → reified conditional, condition `wet`

    (: clay_malleable (ConditionalProperty clay malleable wet) (STV 0.9 0.9))

**[cond-measure] Chocolate is soft in warm weather.** — environment condition; the compound `warm_weather` decomposes to its head noun

    (: choc_soft (ConditionalProperty chocolate soft warm_weather) (STV 0.9 0.9))
    (: ww_genus (Inheritance warm_weather weather) (STV 0.99 0.99))

**[cond-if] Berries are dangerous if unripe.** — "if" condition

    (: berry_danger (ConditionalProperty berry dangerous unripe) (STV 0.9 0.9))

## Coreference & anaphora (passages)

**[coref-pronoun] Nina owns a parrot. It is green.** — "it" = the parrot → shared `sk_parrot_1`

    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_holder (Holder sk_own_1 nina) (STV 1.0 0.99))
    (: e_theme (Theme sk_own_1 sk_parrot_1) (STV 1.0 0.99))
    (: e_parrot (Member sk_parrot_1 parrot) (STV 1.0 0.99))
    (: it_green (Member sk_parrot_1 green) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[coref-definite] A stranger appeared. The stranger spoke.** — "the stranger" = `sk_stranger_1`

    (: sk_stranger_1_stranger (Member sk_stranger_1 stranger) (STV 1.0 0.99))
    (: e_appear (Member sk_appear_1 appear) (STV 1.0 0.99))
    (: e_appear_agent (Agent sk_appear_1 sk_stranger_1) (STV 1.0 0.99))
    (: e_appear_past (Past sk_appear_1) (STV 1.0 0.99))
    (: e_speak (Member sk_speak_1 speak) (STV 1.0 0.99))
    (: e_speak_agent (Agent sk_speak_1 sk_stranger_1) (STV 1.0 0.99))
    (: e_speak_past (Past sk_speak_1) (STV 1.0 0.99))

**[coref-named] Felix greeted Diana. She waved.** — "she" = `diana` (gender agreement)

    (: e_greet (Member sk_greet_1 greet) (STV 1.0 0.99))
    (: e_greet_agent (Agent sk_greet_1 felix) (STV 1.0 0.99))
    (: e_greet_patient (Patient sk_greet_1 diana) (STV 1.0 0.99))
    (: e_greet_past (Past sk_greet_1) (STV 1.0 0.99))
    (: e_wave (Member sk_wave_1 wave) (STV 1.0 0.99))
    (: e_wave_agent (Agent sk_wave_1 diana) (STV 1.0 0.99))
    (: e_wave_past (Past sk_wave_1) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[coref-event] Felix scored a goal. It thrilled Diana.** — event anaphora: "It" = the scoring event `sk_score_1`

    (: e_score (Member sk_score_1 score) (STV 1.0 0.99))
    (: e_score_agent (Agent sk_score_1 felix) (STV 1.0 0.99))
    (: e_score_patient (Patient sk_score_1 sk_goal_1) (STV 1.0 0.99))
    (: e_goal (Member sk_goal_1 goal) (STV 1.0 0.99))
    (: e_score_past (Past sk_score_1) (STV 1.0 0.99))
    (: e_thrill (Member sk_thrill_1 thrill) (STV 1.0 0.99))
    (: e_thrill_stim (Stimulus sk_thrill_1 sk_score_1) (STV 1.0 0.99))
    (: e_thrill_exp (Experiencer sk_thrill_1 diana) (STV 1.0 0.99))
    (: e_thrill_past (Past sk_thrill_1) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[coref-reflexive] Oscar blamed himself.** — "himself" = the subject `oscar`

    (: e_blame (Member sk_blame_1 blame) (STV 1.0 0.99))
    (: e_blame_agent (Agent sk_blame_1 oscar) (STV 1.0 0.99))
    (: e_blame_patient (Patient sk_blame_1 oscar) (STV 1.0 0.99))
    (: e_blame_past (Past sk_blame_1) (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[coref-bridging] Tom rented a house. The roof was damaged.** — "the roof" new, bridged to the house

    (: e_rent (Member sk_rent_1 rent) (STV 1.0 0.99))
    (: e_rent_agent (Agent sk_rent_1 tom) (STV 1.0 0.99))
    (: e_rent_theme (Theme sk_rent_1 sk_house_1) (STV 1.0 0.99))
    (: e_house (Member sk_house_1 house) (STV 1.0 0.99))
    (: e_rent_past (Past sk_rent_1) (STV 1.0 0.99))
    (: e_roof (Member sk_roof_1 roof) (STV 1.0 0.99))
    (: e_roof_partof (PartOf sk_roof_1 sk_house_1) (STV 1.0 0.99))
    (: e_roof_damaged (Past (Member sk_roof_1 damaged)) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

**[coref-one] Nina bought a wooden table. Leo bought a metal one.** — "one" = a fresh table `sk_table_2` (same class)

    (: e_buy1 (Member sk_buy_1 buy) (STV 1.0 0.99))
    (: e_buy1_agent (Agent sk_buy_1 nina) (STV 1.0 0.99))
    (: e_buy1_theme (Theme sk_buy_1 sk_table_1) (STV 1.0 0.99))
    (: e_table1 (Member sk_table_1 table) (STV 1.0 0.99))
    (: e_table1_wooden (Member sk_table_1 wooden) (STV 1.0 0.99))
    (: e_buy1_past (Past sk_buy_1) (STV 1.0 0.99))
    (: e_buy2 (Member sk_buy_2 buy) (STV 1.0 0.99))
    (: e_buy2_agent (Agent sk_buy_2 leo) (STV 1.0 0.99))
    (: e_buy2_theme (Theme sk_buy_2 sk_table_2) (STV 1.0 0.99))
    (: e_table2 (Member sk_table_2 table) (STV 1.0 0.99))
    (: e_table2_metal (Member sk_table_2 metal) (STV 1.0 0.99))
    (: e_buy2_past (Past sk_buy_2) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[coref-donkey] Every shepherd who owns a sheep shears it.** — "it" = the premise-bound `$d`

    (: every_shepherd_shears_sheep (Implication (Premises (Member $f shepherd) (Member $e own) (Holder $e $f) (Theme $e $d) (Member $d sheep)) (Conclusions (Member (sk_shear $f $d) shear) (Agent (sk_shear $f $d) $f) (Patient (sk_shear $f $d) $d))) (STV 1.0 0.9))

## Reciprocals & symmetric relations

**[recip-directed-pair] Hannah and Ivan congratulated each other.** — "each other" + directed verb, named → one directed event per ordered pair, roles swapped

    (: e_congrat1 (Member sk_congratulate_1 congratulate) (STV 1.0 0.99))
    (: e_congrat1_agent (Agent sk_congratulate_1 hannah) (STV 1.0 0.99))
    (: e_congrat1_patient (Patient sk_congratulate_1 ivan) (STV 1.0 0.99))
    (: e_congrat1_past (Past sk_congratulate_1) (STV 1.0 0.99))
    (: e_congrat2 (Member sk_congratulate_2 congratulate) (STV 1.0 0.99))
    (: e_congrat2_agent (Agent sk_congratulate_2 ivan) (STV 1.0 0.99))
    (: e_congrat2_patient (Patient sk_congratulate_2 hannah) (STV 1.0 0.99))
    (: e_congrat2_past (Past sk_congratulate_2) (STV 1.0 0.99))
    (: hannah_name (Name hannah "Hannah") (STV 1.0 0.99))
    (: ivan_name (Name ivan "Ivan") (STV 1.0 0.99))

**[recip-group-kind] The rivals undermine one another.** — unnamed group, plural names the kind → rule over `(Member $x rival)`, distinctness guard, Skolem-pair event

    (: rivals_undermine (Implication (Premises (Member $x rival) (Member $y rival) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_undermine $x $y) undermine) (Agent (sk_undermine $x $y) $x) (Patient (sk_undermine $x $y) $y))) (STV 1.0 0.9))

**[recip-group-collnoun] The panel members questioned one another.** — collective noun → rule over `(PartOf $x <group>)`, tense **inside** Conclusions (a compound-kind `(Member $x panel_member)` reading is an accepted equivalent)

    (: panel_question (Implication (Premises (PartOf $x sk_panel_1) (PartOf $y sk_panel_1) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_question $x $y) question) (Agent (sk_question $x $y) $x) (Patient (sk_question $x $y) $y) (Past (sk_question $x $y)))) (STV 1.0 0.9))
    (: sk_panel_1_panel (Member sk_panel_1 panel) (STV 1.0 0.99))

**[recip-sym-pair] Wendy and Xavier are cousins.** — symmetric relation → assert once + `(Symmetric <Rel>)` tag (seeded `sym_rel` derives the reverse)

    (: wendy_xavier_cousin (Cousin wendy xavier) (STV 1.0 0.99))
    (: cousin_sym_tag (Symmetric Cousin) (STV 1.0 0.99))
    (: wendy_name (Name wendy "Wendy") (STV 1.0 0.99))
    (: xavier_name (Name xavier "Xavier") (STV 1.0 0.99))

**[recip-sym-group] All the finalists are rivals.** — symmetric relation over a group → literal-head rule (both directions from the pair-range), **no** separate symmetry rule

    (: finalists_rivals (Implication (Premises (Member $x finalist) (Member $y finalist) (Compute == ($x $y) -> false)) (Conclusions (Rival $x $y))) (STV 1.0 0.9))

**[recip-routing] Hassan and Omar reconciled with each other.** — eventive symmetric verb + "each other" → **collective** (one event, two `Agent` atoms), not two directed events

    (: e_reconcile (Member sk_reconcile_1 reconcile) (STV 1.0 0.99))
    (: e_reconcile_agent1 (Agent sk_reconcile_1 hassan) (STV 1.0 0.99))
    (: e_reconcile_agent2 (Agent sk_reconcile_1 omar) (STV 1.0 0.99))
    (: e_reconcile_past (Past sk_reconcile_1) (STV 1.0 0.99))
    (: hassan_name (Name hassan "Hassan") (STV 1.0 0.99))
    (: omar_name (Name omar "Omar") (STV 1.0 0.99))

**[recip-q-sym] Who is Wendy a cousin of?** — symmetric-relation query (reverse derived by the symmetry rule)

    (: $prf (And (Name $w "Wendy") (Cousin $w $x)) $tv)

**[recip-q-directed] Did Hannah congratulate Ivan?** — directed each-other query (one direction)

    (: $prf (And (Name $h "Hannah") (Name $i "Ivan") (Member $e congratulate) (Agent $e $h) (Patient $e $i) (Past $e)) $tv)

## Disjunction ("or")

**[disj-subj-named] Greg or Tina will win.** — disjoint named subject → narrow `(Or …)` over the Agent inside one `(And …)` fact

    (: greg_or_tina_win (And (Member sk_win_1 win) (Or (Agent sk_win_1 greg) (Agent sk_win_1 tina)) (Future sk_win_1)) (STV 1.0 0.99))
    (: greg_name (Name greg "Greg") (STV 1.0 0.99))
    (: tina_name (Name tina "Tina") (STV 1.0 0.99))

**[disj-obj] Carla drinks juice or water.** — disjoint bare-noun object → narrow `(Or …)` over the Theme (habitual, unmarked)

    (: carla_drink (And (Member sk_drink_1 drink) (Agent sk_drink_1 carla) (Or (Theme sk_drink_1 juice) (Theme sk_drink_1 water))) (STV 1.0 0.99))
    (: carla_name (Name carla "Carla") (STV 1.0 0.99))

**[disj-obj-indef] Sam will buy a bike or a scooter.** — disjoint *indefinite* object → each witness's `(Member …)` lives **inside** its Or branch

    (: sam_buy (And (Member sk_buy_1 buy) (Agent sk_buy_1 sam) (Or (And (Theme sk_buy_1 sk_bike_1) (Member sk_bike_1 bike)) (And (Theme sk_buy_1 sk_scooter_1) (Member sk_scooter_1 scooter))) (Future sk_buy_1)) (STV 1.0 0.99))
    (: sam_name (Name sam "Sam") (STV 1.0 0.99))

**[disj-cop] The light is red or amber.** — disjoint property → `(Or …)` of two `Member` atoms + definite subject membership

    (: light_color (Or (Member sk_light_1 red) (Member sk_light_1 amber)) (STV 1.0 0.99))
    (: light (Member sk_light_1 light) (STV 1.0 0.99))

**[disj-wide] The engine stalled or the brakes failed.** — independent clauses → wide `(Or <bundleA> <bundleB>)`, definite subjects outside

    (: engine_or_brakes (Or (And (Member sk_stall_1 stall) (Agent sk_stall_1 sk_engine_1) (Past sk_stall_1)) (And (Member sk_fail_1 fail) (Agent sk_fail_1 sk_brake_1) (Past sk_fail_1))) (STV 1.0 0.99))
    (: engine (Member sk_engine_1 engine) (STV 1.0 0.99))
    (: brake (Member sk_brake_1 brake) (STV 1.0 0.99))

**[disj-rule] A driver who is reckless or drunk is fined.** — disjunctive rule condition → one rule per disjunct

    (: reckless_fined (Implication (Premises (Member $x driver) (Member $x reckless)) (Conclusions (Member (sk_fine $x) fine) (Patient (sk_fine $x) $x))) (STV 1.0 0.99))
    (: drunk_fined (Implication (Premises (Member $x driver) (Member $x drunk)) (Conclusions (Member (sk_fine $x) fine) (Patient (sk_fine $x) $x))) (STV 1.0 0.99))

**[disj-q-comp] Who is older or taller than Tom?** — disjunctive question → one query line per disjunct

    (: $prf (And (Name $t "Tom") (More old $x $t)) $tv)
    (: $prf (And (Name $t "Tom") (More tall $x $t)) $tv)

**[disj-q-event] Did the bell chime or the phone buzz?** — disjunctive event question → one query line per disjunct

    (: $prf (And (Member $e chime) (Agent $e sk_bell_1) (Member sk_bell_1 bell) (Past $e)) $tv)
    (: $prf (And (Member $e buzz) (Agent $e sk_phone_1) (Member sk_phone_1 phone) (Past $e)) $tv)

## Exclusive or (XOR)

Bare "or" is inclusive (above); these carry an exclusivity cue — explicit "but not both" / "exactly one of", or contradictory states of one entity — so *exactly one* holds. Reify as `(Xor a b)`; **atomic** disjuncts also get two strength-0 implications (`a→¬b`, `b→¬a`) for the rule-out inference; **complex/event** disjuncts get the label only.

**[xor-atomic-states] The reactor is either online or offline.** — contradictory states → exclusive; atomic → `Xor` + two strength-0 rules

    (: sk_reactor_1_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))
    (: reactor_xor (Xor (Member sk_reactor_1 online) (Member sk_reactor_1 offline)) (STV 1.0 0.99))
    (: reactor_excl_1 (Implication (Premises (Member sk_reactor_1 online)) (Conclusions (Member sk_reactor_1 offline))) (STV 0.0 0.99))
    (: reactor_excl_2 (Implication (Premises (Member sk_reactor_1 offline)) (Conclusions (Member sk_reactor_1 online))) (STV 0.0 0.99))

**[xor-atomic-cue] The patient is either conscious or unconscious, but not both.** — explicit "but not both" → exclusive; atomic

    (: sk_patient_1_patient (Member sk_patient_1 patient) (STV 1.0 0.99))
    (: patient_xor (Xor (Member sk_patient_1 conscious) (Member sk_patient_1 unconscious)) (STV 1.0 0.99))
    (: patient_excl_1 (Implication (Premises (Member sk_patient_1 conscious)) (Conclusions (Member sk_patient_1 unconscious))) (STV 0.0 0.99))
    (: patient_excl_2 (Implication (Premises (Member sk_patient_1 unconscious)) (Conclusions (Member sk_patient_1 conscious))) (STV 0.0 0.99))

**[xor-event-label] Either the committee will approve the proposal or it will reject it, but not both.** — complex/event disjuncts → `Xor` **label only** (no rules)

    (: sk_committee_1_committee (Member sk_committee_1 committee) (STV 1.0 0.99))
    (: sk_proposal_1_proposal (Member sk_proposal_1 proposal) (STV 1.0 0.99))
    (: committee_xor (Xor (And (Member sk_approve_1 approve) (Agent sk_approve_1 sk_committee_1) (Patient sk_approve_1 sk_proposal_1) (Future sk_approve_1)) (And (Member sk_reject_1 reject) (Agent sk_reject_1 sk_committee_1) (Patient sk_reject_1 sk_proposal_1) (Future sk_reject_1))) (STV 1.0 0.99))

**[xor-passage-ruleout] The reactor is either online or offline. It is currently online.** — passage: the confirmed state is **bare/present** (not `Ongoing`), so the rule rules out "offline" at strength 0

    (: sk_reactor_1_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))
    (: reactor_xor (Xor (Member sk_reactor_1 online) (Member sk_reactor_1 offline)) (STV 1.0 0.99))
    (: reactor_excl_1 (Implication (Premises (Member sk_reactor_1 online)) (Conclusions (Member sk_reactor_1 offline))) (STV 0.0 0.99))
    (: reactor_excl_2 (Implication (Premises (Member sk_reactor_1 offline)) (Conclusions (Member sk_reactor_1 online))) (STV 0.0 0.99))
    (: reactor_online (Member sk_reactor_1 online) (STV 1.0 0.99))

**[xor-control-inclusive] The fabric is either waterproof or breathable.** — "either…or" but the two properties are NOT mutually exclusive and there is no cue → stays **inclusive** `Or`, NOT `Xor`

    (: sk_fabric_1_fabric (Member sk_fabric_1 fabric) (STV 1.0 0.99))
    (: fabric_props (Or (Member sk_fabric_1 waterproof) (Member sk_fabric_1 breathable)) (STV 1.0 0.99))

## Queries (questions → query patterns)

For these the expected output is a single query line `(: $prf <pattern> $tv)`; check the
conjuncts and variable placement. Named individuals are bound by `(Name $x "…")`.

**[q-yesno-cat] Is Paris a capital?** — categorical yes/no; named → Name constraint

    (: $prf (And (Name $x "Paris") (Member $x capital)) $tv)

**[q-yesno-ev] Did Leo serve lunch?** — event yes/no

    (: $prf (And (Name $l "Leo") (Member $e serve) (Agent $e $l) (Patient $e lunch) (Past $e)) $tv)

**[q-wh-what] What did Oscar bake?** — wh on the Patient

    (: $prf (And (Name $o "Oscar") (Member $e bake) (Agent $e $o) (Patient $e $what) (Past $e)) $tv)

**[q-wh-who] Who painted the mural?** — wh on the Agent (definite object bound by kind)

    (: $prf (And (Member $e paint) (Patient $e $m) (Member $m mural) (Agent $e $who) (Past $e)) $tv)

**[q-wh-do] What does Nina do?** — wh on the verb class (habitual, unmarked)

    (: $prf (And (Name $n "Nina") (Member $e $verb) (Agent $e $n)) $tv)

**[q-cap] Can ostriches fly?** — capability yes/no (class subject, direct)

    (: $prf (And (Member $e fly) (Agent $e ostrich) (Can $e)) $tv)

**[q-neg] What can't infants do?** — negative/polarity → pin TV to strength 0

    (: $prf (And (Member $e $verb) (Agent $e infant) (Can $e)) (STV 0.0 $conf))

**[q-compound-chain] Who is the smartest, and what do they study?** — compound (shared referent) → one query, `$who` chains the parts, two unknowns

    (: $prf (And (Most smart $who person) (Member $e study) (Agent $e $who) (Patient $e $what)) $tv)

**[q-compound-obj] What did Nora paint, and who bought it?** — compound chained via the object "it" (shared `$work`)

    (: $prf (And (Name $n "Nora") (Member $pe paint) (Agent $pe $n) (Patient $pe $work) (Past $pe) (Member $be buy) (Agent $be $who) (Patient $be $work) (Past $be)) $tv)

**[q-compound-indep] Who is the oldest dog, and who is the youngest cat?** — independent parts still **one** query (the `And` binds both jointly)

    (: $prf (And (Most old $d dog) (Most young $c cat)) $tv)

**[q-compound-difftv] What can robots do, and what can't they do?** — different truth-value pins → the one case that splits into two lines

    (: $prf (And (Member $e $verb) (Agent $e robot) (Can $e)) $tv)
    (: $prf (And (Member $e $verb) (Agent $e robot) (Can $e)) (STV 0.0 $conf))
