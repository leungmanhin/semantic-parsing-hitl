# Regression cases — NL → PeTTaChainer logic

Golden `sentence → expected atoms` pairs for the translator driven by `prompt.txt`.

## How to run (manual / judge-driven)

1. Spawn a Sonnet translator that reads the current `prompt.txt` as its only instructions.
2. Feed it each NL sentence below, independently.
3. Compare each output to the Expected atoms **semantically**: check the relation, the
   arguments, and the STV. **Ignore** the proof-name (the `(: <here> ...)` id) and the
   witness index (`sk_<class>_<n>`) — those may differ in a passing run.
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
