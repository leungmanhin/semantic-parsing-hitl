# §4.3.1+§3a frequent patterns 2 — item E

- inputs: tierA.canon.jsonl, tierC_p1.canon.jsonl, tierC_p2.canon.jsonl, tierC_p3.canon.jsonl  (762 records, 0 duplicate ids skipped, canon fusenf-canon/4)
- params: k=4, min_support=3, 2 record(s) truncated at 28 atoms
- patterns >= support: **5799** — modes {'cross': 3668, 'kindlevel': 233, 'star': 1898}; shape-stratum (n_lifted>0): **3939**; signals: **363**; slot-valuation rows: **1799**

## Top cross-mode patterns (the new capability)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 270 (303×) | cross | 2 | 0.16 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 212 (250×) | cross | 2 | 0.12 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x0)` |
| 157 (160×) | cross | 2 | 0.18 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x1)` |
| 155 (165×) | cross | 2 | 0.17 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 141 (152×) | cross | 2 | 0.16 | `(Agent $e0 $x0)`<br>`(Member $x0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 117 (162×) | cross | 2 | 0.29 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v0)` |
| 108 (144×) | cross | 2 | 0.15 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Patient $e0 $x0)` |
| 67 (87×) | cross | 2 | 0.07 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)` |
| 60 (87×) | cross | 2 | 0.18 | `(Location $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 49 (59×) | cross | 2 | 0.00 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)`<br>`(Theme $e0 $x0)` |
| 48 (56×) | cross | 2 | 0.10 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Patient $e0 $x1)` |
| 48 (59×) | cross | 2 | 0.11 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x1 $v1)`<br>`(Patient $e0 $x1)` |
| 46 (57×) | cross | 2 | 0.17 | `(Agent $e0 $x0)`<br>`(Member $x0 $v0)`<br>`(Member $x1 $v1)`<br>`(Patient $e0 $x1)` |
| 46 (49×) | cross | 2 | 0.20 | `(GroupOf $x0 $v0)`<br>`(Member $e0 $v1)`<br>`(Theme $e0 $x0)` |
| 46 (61×) | cross | 1 | 7.41 | `(Member $e0 $v0)`<br>`(Member $e1 $v0)` |
| 42 (67×) | cross | 2 | 0.07 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 39 (41×) | cross | 3 | 0.27 | `(Inheritance $v0 $v1)`<br>`(Member $e0 $v2)`<br>`(Member $x0 $v0)`<br>`(Patient $e0 $x0)` |
| 32 (32×) | cross | 2 | 0.13 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Recipient $e0 $x0)` |
| 30 (33×) | cross | 1 | -0.21 | `(Agent $e0 $x0)`<br>`(Member $x0 $v0)`<br>`(Past $e0)`<br>`(Theme $e0 $x1)` |
| 30 (41×) | cross | 3 | -0.01 | `(Agent $e0 $v0)`<br>`(Member $e0 $v1)`<br>`(Member $x0 $v2)`<br>`(Theme $e0 $x0)` |

## Top shape-stratum patterns (n_lifted>0, non-dominated)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 301 (347×) | star | 1 | 0.29 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)` |
| 270 (303×) | cross | 2 | 0.16 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 247 (264×) | star | 1 | 0.29 | `(Member $e0 $v0)`<br>`(Theme $e0 $x0)` |
| 212 (250×) | cross | 2 | 0.12 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x0)` |
| 176 (257×) | star | 1 | 0.29 | `(Member $e0 $v0)`<br>`(Past $e0)` |
| 171 (171×) | star | 1 | 0.29 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Theme $e0 $x1)` |
| 157 (160×) | cross | 2 | 0.18 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x1)` |
| 155 (165×) | cross | 2 | 0.17 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 141 (152×) | cross | 2 | 0.16 | `(Agent $e0 $x0)`<br>`(Member $x0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 122 (148×) | star | 1 | 0.29 | `(Member $e0 $v0)`<br>`(Patient $e0 $x0)` |
| 117 (162×) | cross | 2 | 0.29 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v0)` |
| 109 (163×) | star | 2 | 0.29 | `(Agent $e0 $v0)`<br>`(Member $e0 $v1)` |
| 108 (144×) | cross | 2 | 0.15 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Patient $e0 $x0)` |
| 99 (151×) | star | 2 | 3.37 | `(Member $x0 $v0)`<br>`(Member $x0 $v1)` |
| 86 (153×) | kindlevel | 3 | 0.38 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v0 $v2)` |
| 77 (101×) | star | 1 | 0.10 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Past $e0)` |
| 67 (87×) | cross | 2 | 0.07 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)` |
| 66 (100×) | star | 2 | 0.29 | `(Agent $e0 $v0)`<br>`(Member $e0 $v1)`<br>`(Past $e0)` |
| 65 (83×) | star | 1 | 0.29 | `(Location $e0 $x0)`<br>`(Member $e0 $v0)` |
| 63 (71×) | star | 1 | 0.09 | `(Member $e0 $v0)`<br>`(Past $e0)`<br>`(Theme $e0 $x0)` |

## Top by nisurp (multi-clause, non-dominated)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 3 (3×) | cross | 1 | 143.13 | `(Member $x0 $v0)`<br>`(Member $x1 $v0)` |
| 6 (13×) | star | 2 | 63.49 | `(Member $e0 $v0)`<br>`(Member $e0 $v1)` |
| 5 (11×) | cross | 2 | 13.68 | `(Member $e0 $v1)`<br>`(Member $v0 $v1)` |
| 46 (61×) | cross | 1 | 7.41 | `(Member $e0 $v0)`<br>`(Member $e1 $v0)` |
| 4 (4×) | cross | 1 | 7.19 | `(Member $e0 $v0)`<br>`(Member $e1 $v0)`<br>`(Member $e2 $v0)` |
| 3 (3×) | cross | 1 | 4.68 | `(GroupOf $x0 $v0)`<br>`(GroupOf $x1 $v0)` |
| 99 (151×) | star | 2 | 3.37 | `(Member $x0 $v0)`<br>`(Member $x0 $v1)` |
| 22 (38×) | star | 2 | 2.90 | `(GroupOf $x0 $v0)`<br>`(Member $x0 $v1)` |
| 23 (23×) | star | 3 | 2.24 | `(Member $x0 $v0)`<br>`(Member $x0 $v1)`<br>`(Member $x0 $v2)` |
| 3 (3×) | cross | 4 | 1.64 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v0 $v2)`<br>`(Inheritance $v0 $v3)`<br>`(Member $x0 $v0)` |
| 3 (3×) | star | 1 | 1.51 | `(Member $x0 $v0)`<br>`(Member $x0 crate)` |
| 13 (27×) | cross | 2 | 1.31 | `(GroupOf $x0 $v0)`<br>`(Inheritance $v0 $v1)` |
| 3 (7×) | cross | 3 | 1.10 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v0)`<br>`(Possession $x0 $v2)` |
| 3 (3×) | cross | 0 | 1.00 | `(Agent $e0 $x0)`<br>`(Member $x0 warden)`<br>`(Theme $e0 visitor)`<br>`(Time $e0 (Weekday sunday))` |
| 3 (3×) | cross | 0 | 0.99 | `(Agent $e0 $x0)`<br>`(GroupOf $x0 soil_sample)`<br>`(Inheritance soil_sample sample)`<br>`(Instrument $e0 post)` |
| 3 (3×) | cross | 0 | 0.99 | `(Agent $e0 $x0)`<br>`(Inheritance night_delivery delivery)`<br>`(Member $x0 licence)`<br>`(Theme $e0 night_delivery)` |
| 4 (4×) | cross | 0 | 0.99 | `(Agent $e0 $x0)`<br>`(Location $e0 $x1)`<br>`(Member $x0 biologist)`<br>`(Member $x1 survey)` |
| 3 (3×) | cross | 0 | 0.99 | `(Agent $e0 $x0)`<br>`(Location $e0 $x1)`<br>`(Member $x0 welder)`<br>`(Member $x1 frame)` |
| 3 (3×) | cross | 0 | 0.99 | `(CoAgent $e0 $x0)`<br>`(Location $e0 $x1)`<br>`(Member $x0 ranger)`<br>`(Member $x1 survey)` |
| 4 (4×) | cross | 0 | 0.99 | `(GroupOf $x0 sequence)`<br>`(Manner $e0 $x1)`<br>`(Member $e0 define)`<br>`(Theme $e0 $x0)` |

## Top lexicalized star units (batch-1 continuity)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 14 (14×) | star | 0 | 0.60 | `(Agent $e0 $x0)`<br>`(Member $e0 buy)`<br>`(Past $e0)`<br>`(Theme $e0 $x1)` |
| 13 (13×) | star | 0 | 0.89 | `(Member $x0 person)`<br>`(Possession $x1 $x0)` |
| 12 (12×) | star | 0 | 0.60 | `(Agent $e0 $x0)`<br>`(Member $e0 give)`<br>`(Recipient $e0 $x1)`<br>`(Theme $e0 $x2)` |
| 10 (10×) | star | 0 | 0.89 | `(Cardinality $x0 <num>)`<br>`(GroupOf $x0 child)` |
| 10 (14×) | star | 0 | 0.84 | `(Member $e0 build)`<br>`(Patient $e0 $x0)` |
| 10 (10×) | star | 0 | 0.68 | `(Member $e0 lend)`<br>`(Theme $e0 $x0)` |
| 8 (8×) | star | 0 | 0.68 | `(Member $e0 have)`<br>`(Theme $e0 $x0)` |
| 7 (11×) | star | 0 | 0.67 | `(Member $e0 build)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 7 (7×) | star | 0 | 0.93 | `(Cardinality $x0 <num>)`<br>`(GroupOf $x0 forklift)` |
| 7 (7×) | star | 0 | 0.54 | `(Member $e0 require)`<br>`(Theme $e0 $x0)` |
| 6 (6×) | star | 0 | 0.54 | `(Agent $e0 $x0)`<br>`(Member $e0 lend)`<br>`(Recipient $e0 $x1)`<br>`(Theme $e0 $x2)` |
| 6 (6×) | star | 0 | 0.60 | `(Agent $e0 $x0)`<br>`(Member $e0 repair)`<br>`(Past $e0)`<br>`(Patient $e0 $x1)` |
| 6 (6×) | star | 0 | 0.46 | `(Agent $e0 $x0)`<br>`(Member $e0 teach)`<br>`(Recipient $e0 $x1)`<br>`(Theme $e0 $x2)` |
| 6 (6×) | star | 0 | 0.60 | `(Agent $e0 $x0)`<br>`(Member $e0 arrive)` |
| 6 (6×) | star | 0 | 0.99 | `(GroupOf $x0 lemon)`<br>`(Member $x0 crate)` |
| 6 (6×) | star | 0 | 0.99 | `(Member $x0 budget)`<br>`(Possession $x0 next_year)` |
| 5 (9×) | star | 0 | 0.45 | `(Agent $e0 $x0)`<br>`(Member $e0 build)`<br>`(Past $e0)`<br>`(Patient $e0 $x1)` |
| 5 (5×) | star | 0 | 0.60 | `(Agent $e0 $x0)`<br>`(Member $e0 take)` |
| 5 (5×) | star | 0 | 0.37 | `(Agent $e0 $x0)`<br>`(Member $e0 walk)` |
| 5 (5×) | star | 0 | 0.81 | `(Member $e0 become)`<br>`(Patient $e0 $x0)` |

