# Regression cases — NL → PeTTaChainer logic

Golden `sentence → expected atoms` pairs for the translator driven by `prompt.txt`.

## How to run (manual / judge-driven)

1. Spawn a Sonnet translator that reads the current `prompt.txt` as its only instructions.
2. Feed it each NL sentence below, independently.
3. Compare each output to the Expected atoms **semantically**: check the relation, the
   arguments, and the STV. **Ignore** the proof-name / rule-name (the `(: <here> ...)` id)
   and the witness/Skolem names (`sk_<class>_<n>`, `(sk_<class> $x)`) — those may differ in
   a passing run. For scope cases, the things that must match are the **rule structure**
   (premises/conclusions) and whether the existential is a **shared constant** vs a
   **dependent Skolem function**.
4. (Optional) Load the produced atoms into the engine (`add_atom`, via the PeTTa-fiet
   worktree) to catch any malformed output.

Update Expected atoms whenever a convention changes (e.g. a retuned strength). Add a case —
ideally a contrastive one — for every new prompt feature.

---

## A — universals & membership

**[A-def] Every triangle is a polygon.**

    (: triangle_is_polygon (Inheritance triangle polygon) (STV 1.0 0.99))

**[A-emp] All swans are white.**  — empirical universal → confidence 0.9 (black swans exist)

    (: swans_are_white (Inheritance swan white) (STV 1.0 0.9))

**[A-mem] Tokyo is a city.**  — named individual → `Member` + `Name`

    (: tokyo_is_city (Member tokyo city) (STV 1.0 0.99))
    (: tokyo_name (Name tokyo "Tokyo") (STV 1.0 0.99))

## B — existence & relations

**[B-there] There is a hungry lion.**

    (: sk_lion_1_is_lion (Member sk_lion_1 lion) (STV 1.0 0.99))
    (: sk_lion_1_is_hungry (Member sk_lion_1 hungry) (STV 1.0 0.99))

**[B-some] Some door is open.**  — singular "some" → witness, NOT a proportion (contrast C-most)

    (: sk_door_1_is_door (Member sk_door_1 door) (STV 1.0 0.99))
    (: sk_door_1_is_open (Member sk_door_1 open) (STV 1.0 0.99))

**[B-rel] Maria owns a bicycle.**  — named + relation + existential object

    (: maria_name (Name maria "Maria") (STV 1.0 0.99))
    (: sk_bicycle_1_is_bicycle (Member sk_bicycle_1 bicycle) (STV 1.0 0.99))
    (: maria_owns_sk_bicycle_1 (Owns maria sk_bicycle_1) (STV 1.0 0.99))

## C — graded quantifiers

**[C-most] Most teachers are patient.**  — empirical graded → confidence 0.9

    (: most_teachers_are_patient (Inheritance teacher patient) (STV 0.9 0.9))

**[C-alot] A lot of buildings are tall.**

    (: a_lot_of_buildings_are_tall (Inheritance building tall) (STV 0.8 0.9))

**[C-many] Many snakes are venomous.**

    (: many_snakes_are_venomous (Inheritance snake venomous) (STV 0.7 0.9))

**[C-few] Few politicians are honest.**  — low proportion (contrast C-afew)

    (: few_politicians_are_honest (Inheritance politician honest) (STV 0.1 0.9))

**[C-afew] A few apples are rotten.**  — "a few" = witness, NOT a low proportion (contrast C-few)

    (: sk_apple_1_is_apple (Member sk_apple_1 apple) (STV 1.0 0.99))
    (: sk_apple_1_is_rotten (Member sk_apple_1 rotten) (STV 1.0 0.99))

**[C-no] No reptiles are warm-blooded.**  — definitional biological trait → confidence stays 0.99 (dial is by judgment, not mechanical; contrast the empirical graded cases above)

    (: no_reptiles_are_warm_blooded (Inheritance reptile warm_blooded) (STV 0.0 0.99))

## E — generics & confidence

**[E-bare-emp] Apples are sweet.**  — bare generic, empirical → strength 0.9, confidence 0.9

    (: apples_are_sweet (Inheritance apple sweet) (STV 0.9 0.9))

**[E-bare-def] Whales are mammals.**  — bare generic but definitional → strength 1.0, confidence 0.99

    (: whales_are_mammals (Inheritance whale mammal) (STV 1.0 0.99))

**[E-def] Sharks are fish.**  — definitional/taxonomic → 1.0 / 0.99 (contrast E-emp)

    (: sharks_are_fish (Inheritance shark fish) (STV 1.0 0.99))

**[E-emp] Sharks are dangerous.**  — empirical property, bare generic → 0.9 / 0.9 (contrast E-def)

    (: sharks_are_dangerous (Inheritance shark dangerous) (STV 0.9 0.9))

## F — quantifier scope (two quantifiers over a relation)

**[F-aa] Every dog chased every cat.**  — ∀∀, two universal premises

    (: every_dog_chased_every_cat (Implication (Premises (Member $x dog) (Member $y cat)) (Conclusions (Chased $x $y))) (STV 1.0 0.9))

**[F-ae] Every student read some book.**  — ∀∃ dependent → Skolem function (each its own book)

    (: every_student_read_some_book (Implication (Premises (Member $x student)) (Conclusions (Member (sk_book $x) book) (Read $x (sk_book $x)))) (STV 1.0 0.9))

**[F-ea] Some critic reviewed every film.**  — ∃∀ shared → witness constant + rule over films

    (: sk_critic_1_is_critic (Member sk_critic_1 critic) (STV 1.0 0.99))
    (: that_critic_reviewed_every_film (Implication (Premises (Member $y film)) (Conclusions (Reviewed sk_critic_1 $y))) (STV 1.0 0.9))

**[F-ee] Some dog chased some cat.**  — ∃∃, two witness constants + plain fact

    (: sk_dog_1_is_dog (Member sk_dog_1 dog) (STV 1.0 0.99))
    (: sk_cat_1_is_cat (Member sk_cat_1 cat) (STV 1.0 0.99))
    (: sk_dog_1_chased_sk_cat_1 (Chased sk_dog_1 sk_cat_1) (STV 1.0 0.99))

**[F-inv-dist] A nurse is assigned to every patient.**  — INVERSE scope: universal = patient (object), dependent existential = nurse

    (: every_patient_has_a_nurse (Implication (Premises (Member $p patient)) (Conclusions (Member (sk_nurse $p) nurse) (AssignedTo (sk_nurse $p) $p))) (STV 1.0 0.9))

**[F-inv-shared] Every guest brought the same gift.**  — "same" forces SHARED → witness constant despite ∀ first

    (: sk_gift_1_is_gift (Member sk_gift_1 gift) (STV 1.0 0.99))
    (: every_guest_brought_sk_gift_1 (Implication (Premises (Member $g guest)) (Conclusions (Brought $g sk_gift_1))) (STV 1.0 0.9))

**[F-not-all] Not every guest arrived.**  — ¬∀ → counterexample witness (one guest who did not arrive)

    (: sk_guest_1_is_guest (Member sk_guest_1 guest) (STV 1.0 0.99))
    (: sk_guest_1_not_arrived (Arrived sk_guest_1) (STV 0.0 0.99))

**[F-none] No key opens this lock.**  — ∀¬ → universal rule with strength-0 conclusion

    (: no_key_opens_this_lock (Implication (Premises (Member $x key)) (Conclusions (Opens $x this_lock))) (STV 0.0 0.99))

## G — capability & modality

**[G-cap-gen] Birds can fly.**  — generic capability → `(can …)` property, empirical 0.9/0.9

    (: birds_can_fly (Inheritance bird (can fly)) (STV 0.9 0.9))

**[G-cap-ind] Mary can swim.**  — individual capability → Member + Name, 1.0/0.99

    (: mary_can_swim (Member mary (can swim)) (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[G-cap-neg] Penguins cannot fly.**  — negated capability → strength 0; flightlessness ≈ definitional → conf 0.99

    (: penguins_cannot_fly (Inheritance penguin (can fly)) (STV 0.0 0.99))

**[G-cap-trans] Cats can catch mice.**  — transitive capability → nested action `(can (catch mouse))`

    (: cats_can_catch_mice (Inheritance cat (can (catch mouse))) (STV 0.9 0.9))

**[G-epi-might] It might rain.**  — epistemic possibility → reified `might` over a proposition

    (: might_rain (might (rain)) (STV 1.0 0.9))

**[G-epi-must] John must be asleep.**  — epistemic necessity → reified `must` over the proposition `(Member john asleep)`

    (: john_must_be_asleep (must (Member john asleep)) (STV 1.0 0.9))
    (: john_name (Name john "John") (STV 1.0 0.99))

**[G-epi-prob] It will probably snow.**  — epistemic likelihood → reified `probably`

    (: probably_snow (probably (snow)) (STV 1.0 0.9))

## H — deontic modality

**[H-oblig] Students must submit their homework.**  — obligation → `(obligated <action>)`, prescriptive 1.0/0.99

    (: students_must_submit (Inheritance student (obligated (submit homework))) (STV 1.0 0.99))

**[H-oblig-ind] John must leave.**  — individual obligation → Member + Name

    (: john_must_leave (Member john (obligated leave)) (STV 1.0 0.99))
    (: john_name (Name john "John") (STV 1.0 0.99))

**[H-should] Citizens should vote.**  — weak obligation ("should") → strength 0.7

    (: citizens_should_vote (Inheritance citizen (obligated vote)) (STV 0.7 0.99))

**[H-perm] Visitors may use the lounge.**  — permission → `(permitted <action>)`

    (: visitors_may_use_lounge (Inheritance visitor (permitted (use lounge))) (STV 1.0 0.99))

**[H-prohib] Passengers must not smoke.**  — prohibition → permission at strength 0 (forbidden ≡ ¬permitted)

    (: passengers_not_smoke (Inheritance passenger (permitted smoke)) (STV 0.0 0.99))

## Q — queries (questions → query patterns)

For these the expected output is a single query line `(: $prf <pattern> $tv)`; check the
**pattern and variable placement** (the `$prf`/`$tv` names are immaterial).

**[Q-yesno-mem] Is Tokyo a city?**  — named individual → bind by `Name` constraint, not a hard-coded symbol

    (: $prf (And (Name $x "Tokyo") (Member $x city)) $tv)

**[Q-yesno-cap] Can penguins fly?**  — yes/no over a capability

    (: $prf (Inheritance penguin (can fly)) $tv)

**[Q-wh-rel] What does Maria own?**  — named individual (`Name` constraint) + wh on the relation's object

    (: $prf (And (Name $m "Maria") (Owns $m $x)) $tv)

**[Q-wh-who] Who can swim?**  — "who" → individual (Member) with a capability

    (: $prf (Member $x (can swim)) $tv)

**[Q-wh-cap] What can birds do?**  — variable inside the reified modal

    (: $prf (Inheritance bird (can $x)) $tv)

**[Q-wh-epi] What might happen?**  — variable as the epistemic modal's proposition

    (: $prf (might $x) $tv)

**[Q-neg-cap] What can't penguins do?**  — negative question → pin TV to strength 0

    (: $prf (Inheritance penguin (can $x)) (STV 0.0 $conf))

**[Q-deon-prohib] What must passengers not do?**  — prohibition query → strength-0 permission

    (: $prf (Inheritance passenger (permitted $x)) (STV 0.0 $conf))

## D — negation

**[D-pred] Dolphins are not fish.**

    (: dolphins_not_fish (Inheritance dolphin fish) (STV 0.0 0.99))

**[D-no] No swan is white.**  — categorical ¬∃ = strength 0 on the class; empirical → conf 0.9 (contrast D-notall)

    (: swan_not_white (Inheritance swan white) (STV 0.0 0.9))

**[D-notall] Not all swans are white.**  — counterexample witness, NOT strength 0 (contrast D-no)

    (: sk_swan_1_is_swan   (Member sk_swan_1 swan)  (STV 1.0 0.99))
    (: sk_swan_1_not_white (Member sk_swan_1 white) (STV 0.0 0.99))

**[D-neither] Whales are neither fish nor reptiles.**

    (: whale_not_fish    (Inheritance whale fish)    (STV 0.0 0.99))
    (: whale_not_reptile (Inheritance whale reptile) (STV 0.0 0.99))

**[D-antonym] Alice is unhappy.**  — antonym is a positive property (contrast D-notprop)

    (: alice_unhappy (Member alice unhappy) (STV 1.0 0.99))
    (: alice_name    (Name alice "Alice")   (STV 1.0 0.99))

**[D-notprop] Alice is not happy.**  — explicit "not" → strength 0 on base property (contrast D-antonym)

    (: alice_not_happy (Member alice happy) (STV 0.0 0.99))
    (: alice_name      (Name alice "Alice") (STV 1.0 0.99))
