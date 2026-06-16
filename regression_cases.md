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

**[A-emp] All swans are white.**

    (: swans_are_white (Inheritance swan white) (STV 1.0 0.99))

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

**[C-most] Most teachers are patient.**

    (: most_teachers_are_patient (Inheritance teacher patient) (STV 0.9 0.99))

**[C-alot] A lot of buildings are tall.**

    (: a_lot_of_buildings_are_tall (Inheritance building tall) (STV 0.8 0.99))

**[C-many] Many snakes are venomous.**

    (: many_snakes_are_venomous (Inheritance snake venomous) (STV 0.7 0.99))

**[C-few] Few politicians are honest.**  — low proportion (contrast C-afew)

    (: few_politicians_are_honest (Inheritance politician honest) (STV 0.1 0.99))

**[C-afew] A few apples are rotten.**  — "a few" = witness, NOT a low proportion (contrast C-few)

    (: sk_apple_1_is_apple (Member sk_apple_1 apple) (STV 1.0 0.99))
    (: sk_apple_1_is_rotten (Member sk_apple_1 rotten) (STV 1.0 0.99))

**[C-no] No reptiles are warm-blooded.**

    (: no_reptiles_are_warm_blooded (Inheritance reptile warm_blooded) (STV 0.0 0.99))
