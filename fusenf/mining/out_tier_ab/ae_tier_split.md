# §4.3.5 faithful pairs on `out_tier_ab` — tier split (tierA added to tierB; ae_faithful, adopted point)

Per passing pair (cosine gate + norm floor at the adopted point): the records of each unit by tier, the co-occurrence relation, and whether the pair is shape-parallel and exclusive (the only pairs rendered as a rule). A reading of the record, never a filter.

| bucket (tiers of the two units' records) | passes | of which shape-parallel exclusive (rule-rendered) | exclusive | overlapping | nested | same-records |
|---|---|---|---|---|---|---|
| tierA-only | 8728 | 64 | 1417 | 1445 | 3566 | 2300 |
| tierB-only | 574 | 0 | 2 | 190 | 310 | 72 |
| cross | 2511 | 39 | 254 | 958 | 1284 | 15 |
| total | 11813 | 103 | 1673 | 2593 | 5160 | 2387 |

## Shape-parallel exclusive pairs (rule-rendered), by cosine

| cosine | stable (seeds at 0.85) | bucket | A records | B records | A | B | substitution |
|---|---|---|---|---|---|---|---|
| 1.000 | 5 | tierA-only | tierA 4 | tierA 4 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` | (Member $x0 tutor) -> (Member $x0 council) |
| 1.000 | 5 | tierA-only | tierA 4 | tierA 4 | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` | (Member $x1 summer_fair) -> (Member $x1 afternoon_session) |
| 1.000 | 5 | tierA-only | tierA 4 | tierA 4 | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` | (Member $x0 summer_fair) -> (Member $x0 afternoon_session) |
| 1.000 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor) (Patient $e0 $x1))` | (Member $x0 tutor) -> (Member $x0 council) |
| 1.000 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x1 summer_fair) (Patient $e0 $x1))` | (Member $x1 summer_fair) -> (Member $x1 afternoon_session) |
| 1.000 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 council))` | `(And (Agent $e0 $x0) (Member $e0 cancel) (Member $x0 tutor))` | (Member $x0 tutor) -> (Member $x0 council) |
| 1.000 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Member $e0 cancel) (Member $x0 afternoon_session) (Patient $e0 $x0))` | `(And (Member $e0 cancel) (Member $x0 summer_fair) (Patient $e0 $x0))` | (Member $x0 summer_fair) -> (Member $x0 afternoon_session) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 4 | `(And (Agent $e0 $x0) (Member $x0 tutor))` | `(And (Agent $e0 $x0) (Member $x0 council))` | (Member $x0 council) -> (Member $x0 tutor) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 5 | `(Inheritance afternoon_session session)` | `(Inheritance summer_fair fair)` | (Inheritance summer_fair fair) -> (Inheritance afternoon_session session) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 afternoon_session)` | `(Member $x0 council)` | (Member $x0 council) -> (Member $x0 afternoon_session) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 afternoon_session)` | `(Member $x0 summer_fair)` | (Member $x0 summer_fair) -> (Member $x0 afternoon_session) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 council)` | `(Member $x0 tutor)` | (Member $x0 tutor) -> (Member $x0 council) |
| 0.999 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 summer_fair)` | `(Member $x0 tutor)` | (Member $x0 tutor) -> (Member $x0 summer_fair) |
| 0.997 | 5 | tierA-only | tierA 5 | tierA 4 | `(And (Member $x0 apple_harvest) (Patient $e0 $x0))` | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` | (Member $x0 dress_rehearsal) -> (Member $x0 apple_harvest) |
| 0.997 | 5 | tierA-only | tierA 5 | tierA 5 | `(Inheritance apple_harvest harvest)` | `(Inheritance dress_rehearsal rehearsal)` | (Inheritance dress_rehearsal rehearsal) -> (Inheritance apple_harvest harvest) |
| 0.997 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 apple_harvest)` | `(Member $x0 dress_rehearsal)` | (Member $x0 dress_rehearsal) -> (Member $x0 apple_harvest) |
| 0.997 | 5 | tierA-only | tierA 5 | tierA 5 | `(Member $x0 apple_harvest)` | `(Member $x0 lunch)` | (Member $x0 lunch) -> (Member $x0 apple_harvest) |
| 0.996 | 5 | tierA-only | tierA 4 | tierA 3 | `(And (Future $e0) (Member $x0 apple_harvest) (Patient $e0 $x0))` | `(And (Future $e0) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` | (Member $x0 dress_rehearsal) -> (Member $x0 apple_harvest) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Recipient $e0 $x1))` | (Member $x0 trainer) -> (Member $x0 school) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer) (Theme $e0 $x1))` | (Member $x0 trainer) -> (Member $x0 school) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 recruit) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x1 winner) (Recipient $e0 $x1))` | (Member $x1 winner) -> (Member $x1 recruit) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $x0 school) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $x0 trainer) (Recipient $e0 $x1) (Theme $e0 $x2))` | (Member $x0 trainer) -> (Member $x0 school) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $x1 recruit) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $x1 winner) (Recipient $e0 $x1) (Theme $e0 $x2))` | (Member $x1 winner) -> (Member $x1 recruit) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Member $e0 give) (Member $x0 recruit) (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Member $e0 give) (Member $x0 winner) (Recipient $e0 $x0) (Theme $e0 $x1))` | (Member $x0 winner) -> (Member $x0 recruit) |
| 0.991 | 5 | tierA-only | tierA 3 | tierA 3 | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 school))` | `(And (Agent $e0 $x0) (Member $e0 give) (Member $x0 trainer))` | (Member $x0 trainer) -> (Member $x0 school) |

## Other exclusive passes (1570), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 4 | tierA 4 | 0 | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` |

## Other overlapping passes (2593), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | cross | tierA 5 tierB 2 | tierA 5 tierB 1 | 5 | `(Member $x0 recipe)` | `(And (Cardinality $x0 <num>) (GroupOf $x0 egg))` |
| 1.000 | tierA-only | tierA 10 | tierA 7 | 6 | `(Member $x0 crate)` | `(Member $x0 chef)` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair))` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(Inheritance summer_fair fair)` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(Member $x0 council)` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(Member $x0 summer_fair)` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 tutor) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x1 summer_fair) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $x0 council))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Member $x0 afternoon_session) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Agent $e0 $x0) (Member $e0 cancel) (Patient $e0 $x1))` | `(And (Member $x0 summer_fair) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair))` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(Inheritance summer_fair fair)` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(Member $x0 council)` |
| 1.000 | tierA-only | tierA 7 | tierA 5 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(Member $x0 summer_fair)` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 7 | tierA 4 | 3 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` |

## Other nested passes (5160), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | tierA-only | tierA 7 | tierA 6 | 6 | `(Member $x0 chef)` | `(And (GroupOf $x0 lemon) (Member $x0 crate))` |
| 1.000 | tierA-only | tierA 7 | tierA 6 | 6 | `(Member $x0 chef)` | `(GroupOf $x0 lemon)` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(And (Member $x0 budget) (Possession $x0 next_year))` | `(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(And (Member $x0 budget) (Possession $x0 next_year))` | `(And (Member $x0 budget) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(And (Member $x0 budget) (Possession $x0 next_year))` | `(And (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 budget)` | `(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 budget)` | `(And (Member $x0 budget) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 budget)` | `(And (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 mechanic)` | `(And (Member $x0 gearbox) (Member $x0 seized))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 mechanic)` | `(Member $x0 gearbox)` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Member $x0 mechanic)` | `(Member $x0 seized)` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Possession $x0 next_year)` | `(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Possession $x0 next_year)` | `(And (Member $x0 budget) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 6 | tierA 5 | 5 | `(Possession $x0 next_year)` | `(And (Possession $x0 next_year) (Theme $e0 $x0))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Member $x0 lunch) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Member $x0 lunch) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Member $x0 lunch))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Before $x0 $e0) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | `(And (Member $x0 dress_rehearsal) (Patient $e0 $x0))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(Inheritance dress_rehearsal rehearsal)` | `(And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(Inheritance dress_rehearsal rehearsal)` | `(And (Before $x0 $e0) (Member $x0 lunch) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` |
| 1.000 | tierA-only | tierA 5 | tierA 4 | 4 | `(Inheritance dress_rehearsal rehearsal)` | `(And (Before $x0 $e0) (Member $x0 lunch) (Patient $e0 $x1))` |

## Other same-records passes (2387), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` |
| 1.000 | cross | tierA 14 tierB 4 | tierA 14 tierB 4 | 18 | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(Member $e0 buy)` |
| 1.000 | cross | tierA 14 tierB 3 | tierA 14 tierB 3 | 17 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Member $e0 buy) (Past $e0))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 1.000 | tierA-only | tierA 14 | tierA 14 | 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 1.000 | cross | tierA 11 tierB 2 | tierA 11 tierB 2 | 13 | `(And (Member $e0 destroy) (Patient $e0 $x0))` | `(Member $e0 destroy)` |
| 1.000 | tierB-only | tierB 12 | tierB 12 | 12 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Theme $e0 $e1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 1.000 | tierA-only | tierA 12 | tierA 12 | 12 | `(And (Agent $e0 $x0) (Member $e0 give))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | cross | tierA 10 tierB 1 | tierA 10 tierB 1 | 11 | `(And (Member $e0 answer) (Theme $e0 $x0))` | `(Member $e0 answer)` |
| 1.000 | tierA-only | tierA 10 | tierA 10 | 10 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 answer))` |
| 1.000 | cross | tierA 8 tierB 2 | tierA 8 tierB 2 | 10 | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 destroy))` |
| 1.000 | tierA-only | tierA 10 | tierA 10 | 10 | `(And (Member $e0 lend) (Theme $e0 $x0))` | `(Member $e0 lend)` |
