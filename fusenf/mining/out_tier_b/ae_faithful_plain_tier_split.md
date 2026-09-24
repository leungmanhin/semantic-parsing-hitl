# §4.3.5 faithful pairs on `out_tier_b` — tier split (tierA added to tierB; ae_faithful_plain, adopted point)

Per passing pair (cosine gate + norm floor at the adopted point): the records of each unit by tier, the co-occurrence relation, and whether the pair is shape-parallel and exclusive (the only pairs rendered as a rule). A reading of the record, never a filter.

| bucket (tiers of the two units' records) | passes | of which shape-parallel exclusive (rule-rendered) | exclusive | overlapping | nested | same-records |
|---|---|---|---|---|---|---|
| tierA-only | 0 | 0 | 0 | 0 | 0 | 0 |
| tierB-only | 723 | 5 | 20 | 247 | 343 | 113 |
| cross | 0 | 0 | 0 | 0 | 0 | 0 |
| total | 723 | 5 | 20 | 247 | 343 | 113 |

## Shape-parallel exclusive pairs (rule-rendered), by cosine

| cosine | stable (seeds at 0.85) | bucket | A records | B records | A | B | substitution |
|---|---|---|---|---|---|---|---|
| 0.905 | 5 | tierB-only | tierB 8 | tierB 5 | `(And (Patient $e0 $x0) (Source $e0 $x1))` | `(And (Source $e0 $x0) (Theme $e0 $x1))` | (Theme $e0 $x1) -> (Patient $e0 $x0) |
| 0.869 | 5 | tierB-only | tierB 9 | tierB 4 | `(Member $e0 work)` | `(Member $e0 cry)` | (Member $e0 cry) -> (Member $e0 work) |
| 0.869 | 5 | tierB-only | tierB 8 | tierB 5 | `(And (Agent $e0 $x0) (GroupOf $x0 person))` | `(And (GroupOf $x0 person) (Patient $e0 $x0))` | (Patient $e0 $x0) -> (Agent $e0 $x0) |
| 0.869 | 5 | tierB-only | tierB 3 | tierB 3 | `(Agent $e0 david)` | `(Agent $e0 mark)` | (Agent $e0 mark) -> (Agent $e0 david) |
| 0.857 | 2 | tierB-only | tierB 11 | tierB 8 | `(And (Future $e0) (Patient $e0 $x0))` | `(And (Future $e0) (Theme $e0 $x0))` | (Theme $e0 $x0) -> (Patient $e0 $x0) |

## Other exclusive passes (15), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 0.906 | tierB-only | tierB 6 | tierB 5 | 0 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` | `(And (Source $e0 $x0) (Theme $e0 $x1))` |
| 0.885 | tierB-only | tierB 5 | tierB 5 | 0 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` | `(Member $e0 travel)` |
| 0.882 | tierB-only | tierB 5 | tierB 4 | 0 | `(And (Member $e0 work) (Past $e0))` | `(Member $e0 cry)` |
| 0.880 | tierB-only | tierB 5 | tierB 3 | 0 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` | `(And (Member $e0 travel) (Past $e0))` |
| 0.871 | tierB-only | tierB 7 | tierB 5 | 0 | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` | `(And (GroupOf $x0 person) (Patient $e0 $x0))` |
| 0.869 | tierB-only | tierB 5 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` | `(And (Goal $e0 bed) (Member $e0 go))` |
| 0.869 | tierB-only | tierB 5 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` | `(Goal $e0 bed)` |
| 0.868 | tierB-only | tierB 6 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go))` | `(And (Goal $e0 bed) (Member $e0 go))` |
| 0.868 | tierB-only | tierB 6 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go))` | `(Goal $e0 bed)` |
| 0.864 | tierB-only | tierB 5 | tierB 4 | 0 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` | `(Time $e0 night)` |
| 0.863 | tierB-only | tierB 6 | tierB 4 | 0 | `(And (Goal $e0 $x0) (Member $e0 go))` | `(Time $e0 night)` |
| 0.861 | tierB-only | tierB 5 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` | `(And (Past $e0) (Time $e0 night))` |
| 0.860 | tierB-only | tierB 6 | tierB 3 | 0 | `(And (Goal $e0 $x0) (Member $e0 go))` | `(And (Past $e0) (Time $e0 night))` |
| 0.858 | tierB-only | tierB 5 | tierB 3 | 0 | `(Member $e0 travel)` | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` |
| 0.852 | tierB-only | tierB 3 | tierB 3 | 0 | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` | `(And (Member $e0 travel) (Past $e0))` |

## Other overlapping passes (247), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 0.999 | tierB-only | tierB 4 | tierB 4 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 4 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Past $e0) (Theme $e1 $e0))` |
| 0.998 | tierB-only | tierB 5 | tierB 5 | 4 | `(And (Member $e0 get) (Ongoing $e0))` | `(And (Member $e0 get) (Result $e0 $e1))` |
| 0.998 | tierB-only | tierB 5 | tierB 5 | 4 | `(And (Member $e0 get) (Ongoing $e0))` | `(And (Member $e0 get) (Patient $e0 $x0))` |
| 0.997 | tierB-only | tierB 8 | tierB 8 | 6 | `(And (Member $e0 hear) (Past $e0))` | `(And (Past $e0) (Stimulus $e0 $x0))` |
| 0.997 | tierB-only | tierB 5 | tierB 4 | 3 | `(Member $e0 stop)` | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` |
| 0.997 | tierB-only | tierB 5 | tierB 4 | 3 | `(Member $e0 stop)` | `(And (Past $e0) (Theme $e1 $e0))` |
| 0.996 | tierB-only | tierB 5 | tierB 4 | 3 | `(And (Member $e0 get) (Patient $e0 $x0))` | `(And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))` |
| 0.996 | tierB-only | tierB 9 | tierB 8 | 6 | `(Member $e0 hear)` | `(And (Past $e0) (Stimulus $e0 $x0))` |
| 0.996 | tierB-only | tierB 4 | tierB 4 | 3 | `(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))` | `(And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))` |
| 0.996 | tierB-only | tierB 4 | tierB 3 | 2 | `(And (Location $e0 $x0) (Member $x0 table) (Past $e0))` | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))` |
| 0.996 | tierB-only | tierB 4 | tierB 3 | 2 | `(And (Location $e0 $x0) (Member $x0 table))` | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))` |
| 0.995 | tierB-only | tierB 8 | tierB 7 | 6 | `(And (Past $e0) (Stimulus $e0 $x0))` | `(And (Member $e0 hear) (Stimulus $e0 $x0))` |
| 0.995 | tierB-only | tierB 8 | tierB 7 | 6 | `(And (Member $e0 hear) (Past $e0))` | `(And (Member $e0 hear) (Stimulus $e0 $x0))` |
| 0.995 | tierB-only | tierB 5 | tierB 5 | 3 | `(And (Member $e0 get) (Patient $e0 $x0))` | `(And (Member $e0 get) (Result $e0 $e1))` |
| 0.994 | tierB-only | tierB 5 | tierB 4 | 3 | `(And (Member $e0 get) (Result $e0 $e1))` | `(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))` |
| 0.993 | tierB-only | tierB 18 | tierB 9 | 7 | `(Stimulus $e0 $x0)` | `(Member $e0 hear)` |
| 0.993 | tierB-only | tierB 4 | tierB 4 | 2 | `(And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))` | `(And (Location $e0 $x0) (Member $x0 table) (Past $e0))` |
| 0.993 | tierB-only | tierB 4 | tierB 4 | 2 | `(And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))` | `(And (Location $e0 $x0) (Member $x0 table))` |
| 0.991 | tierB-only | tierB 7 | tierB 3 | 1 | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` | `(And (Member $e0 travel) (Past $e0))` |
| 0.990 | tierB-only | tierB 6 | tierB 4 | 2 | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))` | `(And (Location $e0 $x0) (Member $x0 table) (Past $e0))` |
| 0.990 | tierB-only | tierB 6 | tierB 4 | 2 | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))` | `(And (Location $e0 $x0) (Member $x0 table))` |
| 0.990 | tierB-only | tierB 18 | tierB 8 | 6 | `(Stimulus $e0 $x0)` | `(And (Member $e0 hear) (Past $e0))` |
| 0.989 | tierB-only | tierB 6 | tierB 4 | 3 | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))` | `(And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))` |
| 0.986 | tierB-only | tierB 8 | tierB 3 | 1 | `(And (Agent $e0 $x0) (GroupOf $x0 person))` | `(And (Member $e0 travel) (Past $e0))` |

## Other nested passes (343), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | tierB-only | tierB 5 | tierB 4 | 4 | `(And (Member $e0 get) (Result $e0 $e1))` | `(And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))` |
| 1.000 | tierB-only | tierB 8 | tierB 7 | 7 | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 8 | tierB 7 | 7 | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 8 | tierB 7 | 7 | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 8 | tierB 7 | 7 | `(And (Member $e0 begin) (Past $e0))` | `(And (Member $e0 begin) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 5 | tierB 4 | 4 | `(And (Member $e0 contain) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 5 | tierB 4 | 4 | `(And (Member $e0 contain) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 contain))` |
| 1.000 | tierB-only | tierB 5 | tierB 4 | 4 | `(Member $e0 contain)` | `(And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 5 | tierB 4 | 4 | `(Member $e0 contain)` | `(And (Agent $e0 $x0) (Member $e0 contain))` |
| 1.000 | tierB-only | tierB 35 | tierB 33 | 33 | `(Member $e0 have)` | `(And (Member $e0 have) (Theme $e0 $x0))` |
| 0.999 | tierB-only | tierB 5 | tierB 4 | 4 | `(And (Member $e0 get) (Patient $e0 $x0))` | `(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))` |
| 0.999 | tierB-only | tierB 5 | tierB 4 | 4 | `(Member $e0 stop)` | `(And (Member $e0 stop) (Past $e0))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` | `(And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` | `(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` | `(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Past $e1) (Theme $e0 $e1))` | `(And (Member $e0 stop) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Member $e0 stop) (Past $e0))` | `(And (Member $e0 stop) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Theme $e1 $e0))` | `(And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Theme $e1 $e0))` | `(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Theme $e1 $e0))` | `(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 4 | tierB 3 | 3 | `(And (Past $e0) (Theme $e1 $e0))` | `(And (Member $e0 stop) (Theme $e0 $e1))` |
| 0.999 | tierB-only | tierB 23 | tierB 22 | 22 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` |

## Other same-records passes (113), by cosine

| cosine | bucket | A records | B records | shared | A | B |
|---|---|---|---|---|---|---|
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` |
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | `(Holder $e0 $x0)` |
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Member $e0 have))` | `(Holder $e0 $x0)` |
| 1.000 | tierB-only | tierB 23 | tierB 23 | 23 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | `(Holder $e0 $x0)` |
| 1.000 | tierB-only | tierB 12 | tierB 12 | 12 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 9 | tierB 9 | 9 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 7 | tierB 7 | 7 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` | `(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Past $e0))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` | `(And (Holder $e0 $x0) (Past $e0))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Past $e0))` |
| 1.000 | tierB-only | tierB 5 | tierB 5 | 5 | `(And (Member $e0 contain) (Theme $e0 $x0))` | `(Member $e0 contain)` |
| 1.000 | tierB-only | tierB 4 | tierB 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` |
| 1.000 | tierB-only | tierB 4 | tierB 4 | 4 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))` |
