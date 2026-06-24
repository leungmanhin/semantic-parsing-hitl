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
4. (Optional, statement-side only) load produced atoms into the engine via the PeTTa-fiet
   worktree to catch malformed output. Event **querying** is engine-pending (needs n-conjunct
   conjunctive queries + multi-conclusion projection), so don't expect event QA to run yet.

Coreference cases are **passages** (multiple sentences) — feed the whole passage at once; the
key check is that coreferring mentions (pronoun, "the X", a name, event anaphora) **share one
symbol** across sentences (the exact `sk_*` symbol and some role labels may vary).

Update Expected whenever a convention changes. Add a contrastive case per new prompt feature.

---

## Categorical (copular: "X is a/an N", "X is ADJ")

**[cat-mem] Bob is a teacher.** — named individual → `Member` + `Name`

    (: bob_is_teacher (Member bob teacher) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[cat-def] Dogs are mammals.** — definitional/taxonomic → 1.0 / 0.99

    (: dog_is_mammal (Inheritance dog mammal) (STV 1.0 0.99))

**[cat-emp] All swans are white.** — empirical universal → confidence 0.9

    (: swans_are_white (Inheritance swan white) (STV 1.0 0.9))

**[cat-generic] Apples are sweet.** — bare generic → strength 0.9, empirical 0.9

    (: apples_are_sweet (Inheritance apple sweet) (STV 0.9 0.9))

**[cat-most] Most teachers are patient.** — graded → strength 0.9

    (: most_teachers_patient (Inheritance teacher patient) (STV 0.9 0.9))

**[cat-few] Few politicians are honest.** — graded → strength 0.1

    (: few_politicians_honest (Inheritance politician honest) (STV 0.1 0.9))

**[cat-no] No reptile is warm-blooded.** — strength 0; definitional trait → conf 0.99

    (: reptile_not_warm (Inheritance reptile warm_blooded) (STV 0.0 0.99))

**[cat-neg] Dolphins are not fish.** — negation → strength 0; taxonomic → 0.99

    (: dolphins_not_fish (Inheritance dolphin fish) (STV 0.0 0.99))

**[cat-notall] Not all swans are white.** — ¬∀ → counterexample witness

    (: sk_swan_1_swan (Member sk_swan_1 swan) (STV 1.0 0.99))
    (: sk_swan_1_not_white (Member sk_swan_1 white) (STV 0.0 0.99))

**[cat-antonym] Alice is unhappy.** — antonym is a positive property

    (: alice_unhappy (Member alice unhappy) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[cat-status] John must be asleep.** — modality over a copular clause → wrap the atom (epistemic 0.9)

    (: john_must_asleep (Must (Member john asleep)) (STV 1.0 0.9))
    (: john_name (Name john "John") (STV 1.0 0.99))

**[cat-past] Alice was happy.** — tense over a copular clause → wrap the atom

    (: alice_was_happy (Past (Member alice happy)) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

## Events (verbal)

**[ev-intrans] Bob cooks.** — habitual (unmarked status)

    (: e_cook (Member sk_cook_1 cook) (STV 1.0 0.99))
    (: e_agent (Agent sk_cook_1 bob) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-trans] Bob cooks dinner.** — + Patient role

    (: e_cook (Member sk_cook_1 cook) (STV 1.0 0.99))
    (: e_agent (Agent sk_cook_1 bob) (STV 1.0 0.99))
    (: e_patient (Patient sk_cook_1 dinner) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-ditrans] Maria gave Bob a book.** — Agent/Recipient/Theme + existential Theme + Past

    (: e_give (Member sk_give_1 give) (STV 1.0 0.99))
    (: e_agent (Agent sk_give_1 maria) (STV 1.0 0.99))
    (: e_recip (Recipient sk_give_1 bob) (STV 1.0 0.99))
    (: e_theme (Theme sk_give_1 sk_book_1) (STV 1.0 0.99))
    (: e_book (Member sk_book_1 book) (STV 1.0 0.99))
    (: e_past (Past sk_give_1) (STV 1.0 0.99))
    (: maria_name (Name maria "Maria") (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-stative] Alice owns a dog.** — state eventuality: Holder/Theme + existential Theme

    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_holder (Holder sk_own_1 alice) (STV 1.0 0.99))
    (: e_theme (Theme sk_own_1 sk_dog_1) (STV 1.0 0.99))
    (: e_dog (Member sk_dog_1 dog) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[ev-past] Bob cooked dinner yesterday.** — Past + Time role (fine-temporal as a role)

    (: e_cook (Member sk_cook_1 cook) (STV 1.0 0.99))
    (: e_agent (Agent sk_cook_1 bob) (STV 1.0 0.99))
    (: e_patient (Patient sk_cook_1 dinner) (STV 1.0 0.99))
    (: e_past (Past sk_cook_1) (STV 1.0 0.99))
    (: e_time (Time sk_cook_1 yesterday) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-ongoing] Bob is cooking.** — progressive → Ongoing

    (: e_cook (Member sk_cook_1 cook) (STV 1.0 0.99))
    (: e_agent (Agent sk_cook_1 bob) (STV 1.0 0.99))
    (: e_ongoing (Ongoing sk_cook_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-can] Bob can cook dinner.** — capability → Can

    (: e_cook (Member sk_cook_1 cook) (STV 1.0 0.99))
    (: e_agent (Agent sk_cook_1 bob) (STV 1.0 0.99))
    (: e_patient (Patient sk_cook_1 dinner) (STV 1.0 0.99))
    (: e_can (Can sk_cook_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-epistemic] Bob might leave.** — epistemic over a verbal clause → Might on the event

    (: e_leave (Member sk_leave_1 leave) (STV 1.0 0.99))
    (: e_agent (Agent sk_leave_1 bob) (STV 1.0 0.99))
    (: e_might (Might sk_leave_1) (STV 1.0 0.9))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-deontic] Bob must apologize.** — deontic obligation (individual) → Obligated

    (: e_apologize (Member sk_apologize_1 apologize) (STV 1.0 0.99))
    (: e_agent (Agent sk_apologize_1 bob) (STV 1.0 0.99))
    (: e_obligated (Obligated sk_apologize_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[ev-passive] The cake was eaten.** — passive: Patient, no Agent

    (: e_eat (Member sk_eat_1 eat) (STV 1.0 0.99))
    (: e_patient (Patient sk_eat_1 cake) (STV 1.0 0.99))
    (: e_past (Past sk_eat_1) (STV 1.0 0.99))

**[ev-neg] Bob didn't cook dinner.** — event negation → strength-0 conjunction

    (: bob_not_cook (And (Member sk_cook_1 cook) (Agent sk_cook_1 bob) (Patient sk_cook_1 dinner)) (STV 0.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

## Coordination & plurals

**[coord-vp] Bob sang and danced.** — coordinated VPs → two events, shared agent

    (: e_sing (Member sk_sing_1 sing) (STV 1.0 0.99))
    (: e_sing_agent (Agent sk_sing_1 bob) (STV 1.0 0.99))
    (: e_sing_past (Past sk_sing_1) (STV 1.0 0.99))
    (: e_dance (Member sk_dance_1 dance) (STV 1.0 0.99))
    (: e_dance_agent (Agent sk_dance_1 bob) (STV 1.0 0.99))
    (: e_dance_past (Past sk_dance_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[coord-distrib] Bob and Alice left.** — coordinated NPs, distributive → two events

    (: e_leave1 (Member sk_leave_1 leave) (STV 1.0 0.99))
    (: e_leave1_agent (Agent sk_leave_1 bob) (STV 1.0 0.99))
    (: e_leave1_past (Past sk_leave_1) (STV 1.0 0.99))
    (: e_leave2 (Member sk_leave_2 leave) (STV 1.0 0.99))
    (: e_leave2_agent (Agent sk_leave_2 alice) (STV 1.0 0.99))
    (: e_leave2_past (Past sk_leave_2) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coord-copular] Bob and Alice are teachers.** — distributive copular → one atom per conjunct

    (: bob_teacher (Member bob teacher) (STV 1.0 0.99))
    (: alice_teacher (Member alice teacher) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coord-shared] Bob and Alice ate the cake.** — distributive + shared object (one `cake`)

    (: e_eat1 (Member sk_eat_1 eat) (STV 1.0 0.99))
    (: e_eat1_agent (Agent sk_eat_1 bob) (STV 1.0 0.99))
    (: e_eat1_patient (Patient sk_eat_1 cake) (STV 1.0 0.99))
    (: e_eat1_past (Past sk_eat_1) (STV 1.0 0.99))
    (: e_eat2 (Member sk_eat_2 eat) (STV 1.0 0.99))
    (: e_eat2_agent (Agent sk_eat_2 alice) (STV 1.0 0.99))
    (: e_eat2_patient (Patient sk_eat_2 cake) (STV 1.0 0.99))
    (: e_eat2_past (Past sk_eat_2) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coord-collective] Bob and Alice met.** — reciprocal verb → one event, two `Agent` atoms

    (: e_meet (Member sk_meet_1 meet) (STV 1.0 0.99))
    (: e_meet_agent1 (Agent sk_meet_1 bob) (STV 1.0 0.99))
    (: e_meet_agent2 (Agent sk_meet_1 alice) (STV 1.0 0.99))
    (: e_meet_past (Past sk_meet_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coord-group] The committee approved the plan.** — group as a unit (collective noun) → sum individual

    (: the_committee_committee (Member the_committee committee) (STV 1.0 0.99))
    (: e_approve (Member sk_approve_1 approve) (STV 1.0 0.99))
    (: e_approve_agent (Agent sk_approve_1 the_committee) (STV 1.0 0.99))
    (: e_approve_patient (Patient sk_approve_1 sk_plan_1) (STV 1.0 0.99))
    (: e_plan (Member sk_plan_1 plan) (STV 1.0 0.99))
    (: e_approve_past (Past sk_approve_1) (STV 1.0 0.99))

**[plural-group] The students gathered.** — bare definite plural → group entity + `GroupOf` member kind

    (: sk_group_1_students (GroupOf sk_group_1 student) (STV 1.0 0.99))
    (: e_gather (Member sk_gather_1 gather) (STV 1.0 0.99))
    (: e_gather_agent (Agent sk_gather_1 sk_group_1) (STV 1.0 0.99))
    (: e_gather_past (Past sk_gather_1) (STV 1.0 0.99))

**[coord-pronoun] Bob and Alice arrived. They were tired.** — plural pronoun distributes (passage)

    (: e_arrive1 (Member sk_arrive_1 arrive) (STV 1.0 0.99))
    (: e_arrive1_agent (Agent sk_arrive_1 bob) (STV 1.0 0.99))
    (: e_arrive1_past (Past sk_arrive_1) (STV 1.0 0.99))
    (: e_arrive2 (Member sk_arrive_2 arrive) (STV 1.0 0.99))
    (: e_arrive2_agent (Agent sk_arrive_2 alice) (STV 1.0 0.99))
    (: e_arrive2_past (Past sk_arrive_2) (STV 1.0 0.99))
    (: bob_tired (Past (Member bob tired)) (STV 1.0 0.99))
    (: alice_tired (Past (Member alice tired)) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

## Generics & scope (verbal → rules)

**[gen-verbal] Birds fly.** — verbal generic over a kind → Skolem-event rule, 0.9/0.9

    (: birds_fly (Implication (Premises (Member $x bird)) (Conclusions (Member (sk_fly $x) fly) (Agent (sk_fly $x) $x))) (STV 0.9 0.9))

**[gen-cap] Birds can fly.** — generic capability → rule + Can

    (: birds_can_fly (Implication (Premises (Member $x bird)) (Conclusions (Member (sk_fly $x) fly) (Agent (sk_fly $x) $x) (Can (sk_fly $x)))) (STV 0.9 0.9))

**[gen-deontic] Students must submit homework.** — generic deontic over a kind → rule + Obligated, 1.0/0.99

    (: students_must_submit (Implication (Premises (Member $x student)) (Conclusions (Member (sk_submit $x) submit) (Agent (sk_submit $x) $x) (Patient (sk_submit $x) homework) (Obligated (sk_submit $x)))) (STV 1.0 0.99))

**[scope-ae] Every student read some book.** — ∀∃ dependent → Skolem function event + book

    (: every_student_read_book (Implication (Premises (Member $x student)) (Conclusions (Member (sk_read $x) read) (Agent (sk_read $x) $x) (Theme (sk_read $x) (sk_book $x)) (Member (sk_book $x) book))) (STV 1.0 0.9))

**[scope-ea] Some critic reviewed every film.** — ∃∀ shared → witness constant + rule over films

    (: sk_critic_1_critic (Member sk_critic_1 critic) (STV 1.0 0.99))
    (: critic_reviewed_films (Implication (Premises (Member $y film)) (Conclusions (Member (sk_review $y) review) (Agent (sk_review $y) sk_critic_1) (Theme (sk_review $y) $y) (Past (sk_review $y)))) (STV 1.0 0.9))

**[scope-aa] Every dog chased every cat.** — ∀∀ → two universal premises

    (: every_dog_chased_cat (Implication (Premises (Member $x dog) (Member $y cat)) (Conclusions (Member (sk_chase $x $y) chase) (Agent (sk_chase $x $y) $x) (Patient (sk_chase $x $y) $y) (Past (sk_chase $x $y)))) (STV 1.0 0.9))

**[rel-univ] Everyone who owns a dog is a pet owner.** — event-premise rule + copular conclusion

    (: dog_owner_pet_owner (Implication (Premises (Member $e own) (Holder $e $x) (Theme $e $y) (Member $y dog)) (Conclusions (Member $x pet_owner))) (STV 1.0 0.99))

## Coreference & anaphora (passages)

**[coref-pronoun] Alice has a dog. It is brown.** — "it" = the dog → shared `sk_dog_1`

    (: e_have (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_holder (Holder sk_have_1 alice) (STV 1.0 0.99))
    (: e_theme (Theme sk_have_1 sk_dog_1) (STV 1.0 0.99))
    (: e_dog (Member sk_dog_1 dog) (STV 1.0 0.99))
    (: it_brown (Member sk_dog_1 brown) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coref-definite] A man entered. The man sat down.** — "the man" = `sk_man_1`

    (: sk_man_1_man (Member sk_man_1 man) (STV 1.0 0.99))
    (: e_enter (Member sk_enter_1 enter) (STV 1.0 0.99))
    (: e_enter_agent (Agent sk_enter_1 sk_man_1) (STV 1.0 0.99))
    (: e_enter_past (Past sk_enter_1) (STV 1.0 0.99))
    (: e_sit (Member sk_sit_1 sit) (STV 1.0 0.99))
    (: e_sit_agent (Agent sk_sit_1 sk_man_1) (STV 1.0 0.99))
    (: e_sit_past (Past sk_sit_1) (STV 1.0 0.99))

**[coref-named] Bob met Carol. She smiled.** — "she" = `carol` (gender agreement)

    (: e_meet (Member sk_meet_1 meet) (STV 1.0 0.99))
    (: e_meet_agent (Agent sk_meet_1 bob) (STV 1.0 0.99))
    (: e_meet_patient (Patient sk_meet_1 carol) (STV 1.0 0.99))
    (: e_meet_past (Past sk_meet_1) (STV 1.0 0.99))
    (: e_smile (Member sk_smile_1 smile) (STV 1.0 0.99))
    (: e_smile_agent (Agent sk_smile_1 carol) (STV 1.0 0.99))
    (: e_smile_past (Past sk_smile_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))

**[coref-event] Bob won the race. It surprised Carol.** — event anaphora: "It" = the winning event `sk_win_1`

    (: e_win (Member sk_win_1 win) (STV 1.0 0.99))
    (: e_win_agent (Agent sk_win_1 bob) (STV 1.0 0.99))
    (: e_win_theme (Theme sk_win_1 sk_race_1) (STV 1.0 0.99))
    (: e_race (Member sk_race_1 race) (STV 1.0 0.99))
    (: e_win_past (Past sk_win_1) (STV 1.0 0.99))
    (: e_surprise (Member sk_surprise_1 surprise) (STV 1.0 0.99))
    (: e_surprise_stim (Stimulus sk_surprise_1 sk_win_1) (STV 1.0 0.99))
    (: e_surprise_exp (Experiencer sk_surprise_1 carol) (STV 1.0 0.99))
    (: e_surprise_past (Past sk_surprise_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))

**[coref-reflexive] Bob hurt himself.** — "himself" = the subject `bob`

    (: e_hurt (Member sk_hurt_1 hurt) (STV 1.0 0.99))
    (: e_hurt_agent (Agent sk_hurt_1 bob) (STV 1.0 0.99))
    (: e_hurt_patient (Patient sk_hurt_1 bob) (STV 1.0 0.99))
    (: e_hurt_past (Past sk_hurt_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[coref-bridging] Alice bought a car. The engine was broken.** — "the engine" new, bridged to the car

    (: e_buy (Member sk_buy_1 buy) (STV 1.0 0.99))
    (: e_buy_agent (Agent sk_buy_1 alice) (STV 1.0 0.99))
    (: e_buy_theme (Theme sk_buy_1 sk_car_1) (STV 1.0 0.99))
    (: e_car (Member sk_car_1 car) (STV 1.0 0.99))
    (: e_buy_past (Past sk_buy_1) (STV 1.0 0.99))
    (: e_engine (Member sk_engine_1 engine) (STV 1.0 0.99))
    (: e_engine_partof (PartOf sk_engine_1 sk_car_1) (STV 1.0 0.99))
    (: e_engine_broken (Past (Member sk_engine_1 broken)) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))

**[coref-one] Alice has a red car. Bob has a blue one.** — "one" = a fresh car `sk_car_2` (same class)

    (: e_have1 (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_have1_holder (Holder sk_have_1 alice) (STV 1.0 0.99))
    (: e_have1_theme (Theme sk_have_1 sk_car_1) (STV 1.0 0.99))
    (: e_car1 (Member sk_car_1 car) (STV 1.0 0.99))
    (: e_car1_red (Member sk_car_1 red) (STV 1.0 0.99))
    (: e_have2 (Member sk_have_2 have) (STV 1.0 0.99))
    (: e_have2_holder (Holder sk_have_2 bob) (STV 1.0 0.99))
    (: e_have2_theme (Theme sk_have_2 sk_car_2) (STV 1.0 0.99))
    (: e_car2 (Member sk_car_2 car) (STV 1.0 0.99))
    (: e_car2_blue (Member sk_car_2 blue) (STV 1.0 0.99))
    (: alice_name (Name alice "Alice") (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[coref-donkey] Every farmer who owns a donkey beats it.** — "it" = the premise-bound `$d`

    (: every_farmer_beats_donkey (Implication (Premises (Member $f farmer) (Member $e own) (Holder $e $f) (Theme $e $d) (Member $d donkey)) (Conclusions (Member $b beat) (Agent $b $f) (Patient $b $d))) (STV 1.0 0.9))

## Queries (questions → query patterns)

For these the expected output is a single query line `(: $prf <pattern> $tv)`; check the
conjuncts and variable placement. Named individuals are bound by `(Name $x "…")`.

**[q-yesno-cat] Is Tokyo a city?** — categorical yes/no; named → Name constraint

    (: $prf (And (Name $x "Tokyo") (Member $x city)) $tv)

**[q-yesno-ev] Did Bob cook dinner?** — event yes/no

    (: $prf (And (Name $b "Bob") (Member $e cook) (Agent $e $b) (Patient $e dinner) (Past $e)) $tv)

**[q-wh-what] What did Bob cook?** — wh on the Patient

    (: $prf (And (Name $b "Bob") (Member $e cook) (Agent $e $b) (Patient $e $what) (Past $e)) $tv)

**[q-wh-who] Who cooked dinner?** — wh on the Agent

    (: $prf (And (Member $e cook) (Patient $e dinner) (Agent $e $who) (Past $e)) $tv)

**[q-wh-do] What does Bob do?** — wh on the verb class (habitual, unmarked)

    (: $prf (And (Name $b "Bob") (Member $e $verb) (Agent $e $b)) $tv)

**[q-cap] Can penguins fly?** — capability yes/no (class subject, direct)

    (: $prf (And (Member $e fly) (Agent $e penguin) (Can $e)) $tv)

**[q-neg] What can't penguins do?** — negative/polarity → pin TV to strength 0

    (: $prf (And (Member $e $verb) (Agent $e penguin) (Can $e)) (STV 0.0 $conf))
