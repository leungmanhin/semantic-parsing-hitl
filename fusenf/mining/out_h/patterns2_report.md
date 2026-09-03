# §4.3.1+§3a frequent patterns 2 — item E

- inputs: canonical_substrate.jsonl  (2302 records, 0 duplicate ids skipped, canon fusenf-canon/4)
- params: k=4, min_support=3, 2 record(s) truncated at 28 atoms
- patterns >= support: **7766** — modes {'cross': 4126, 'kindlevel': 626, 'star': 3014}; shape-stratum (n_lifted>0): **6037**; signals: **779**; slot-valuation rows: **6066**

## Top cross-mode patterns (the new capability)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 290 (391×) | cross | 2 | 0.18 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 264 (368×) | cross | 2 | 0.25 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Patient $e0 $x0)` |
| 239 (329×) | cross | 2 | 0.19 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x0)` |
| 212 (305×) | cross | 2 | 0.68 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v0)` |
| 176 (225×) | cross | 2 | 0.19 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)` |
| 157 (216×) | cross | 1 | 0.23 | `(Member $x0 $v0)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 156 (217×) | cross | 2 | 0.23 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 123 (171×) | cross | 2 | 0.25 | `(Experiencer $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 116 (154×) | cross | 2 | 0.18 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)`<br>`(Theme $e0 $x0)` |
| 108 (136×) | cross | 2 | 0.26 | `(Agent $e0 $x0)`<br>`(GroupOf $x0 $v0)`<br>`(Member $e0 $v1)` |
| 101 (127×) | cross | 2 | 0.32 | `(Location $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 91 (105×) | cross | 2 | 0.23 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x1)` |
| 87 (97×) | cross | 2 | 0.24 | `(GroupOf $x0 $v0)`<br>`(Member $e0 $v1)`<br>`(Theme $e0 $x0)` |
| 83 (109×) | cross | 2 | 0.15 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 75 (84×) | cross | 2 | 0.10 | `(GroupOf $x0 $v0)`<br>`(Member $e0 $v1)`<br>`(Patient $e0 $x0)` |
| 72 (81×) | cross | 2 | 0.46 | `(Member $e0 $v0)`<br>`(Member $e1 $v1)`<br>`(Theme $e0 $e1)` |
| 65 (85×) | cross | 2 | 0.30 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x1 $v1)`<br>`(Patient $e0 $x1)` |
| 65 (90×) | cross | 2 | 0.14 | `(Agent $e0 $x0)`<br>`(Member $x0 $v0)`<br>`(Member $x1 $v1)`<br>`(Theme $e0 $x1)` |
| 65 (77×) | cross | 3 | -0.18 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v0 $v2)`<br>`(Member $x0 $v0)` |
| 64 (73×) | cross | 3 | -0.55 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Member $x0 $v2)`<br>`(Theme $e0 $x0)` |

## Top shape-stratum patterns (n_lifted>0, non-dominated)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 703 (855×) | star | 1 | 0.46 | `(Member $e0 $v0)`<br>`(Past $e0)` |
| 385 (479×) | star | 1 | 0.46 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)` |
| 385 (504×) | star | 2 | 1.27 | `(Member $x0 $v0)`<br>`(Member $x0 $v1)` |
| 323 (371×) | star | 1 | 0.46 | `(Member $e0 $v0)`<br>`(Patient $e0 $x0)` |
| 315 (347×) | star | 1 | 0.46 | `(Member $e0 $v0)`<br>`(Theme $e0 $x0)` |
| 306 (406×) | star | 2 | 0.46 | `(Agent $e0 $v0)`<br>`(Member $e0 $v1)` |
| 290 (391×) | cross | 2 | 0.18 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)` |
| 274 (425×) | kindlevel | 3 | 0.47 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v0 $v2)` |
| 265 (365×) | star | 1 | 0.25 | `(Member $x0 $v0)`<br>`(Patient $e0 $x0)` |
| 264 (368×) | cross | 2 | 0.25 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Patient $e0 $x0)` |
| 239 (329×) | cross | 2 | 0.19 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Theme $e0 $x0)` |
| 232 (272×) | star | 1 | 0.46 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Past $e0)` |
| 212 (305×) | cross | 2 | 0.68 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v0)` |
| 203 (256×) | star | 2 | 0.46 | `(Agent $e0 $v0)`<br>`(Member $e0 $v1)`<br>`(Past $e0)` |
| 195 (226×) | star | 1 | 0.46 | `(Member $e0 $v0)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 176 (225×) | cross | 2 | 0.19 | `(Agent $e0 $x0)`<br>`(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)` |
| 157 (216×) | cross | 1 | 0.23 | `(Member $x0 $v0)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 156 (217×) | cross | 2 | 0.23 | `(Member $e0 $v0)`<br>`(Member $x0 $v1)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |
| 154 (171×) | star | 1 | 0.37 | `(Member $e0 $v0)`<br>`(Past $e0)`<br>`(Theme $e0 $x0)` |
| 150 (171×) | star | 1 | 0.46 | `(Experiencer $e0 $x0)`<br>`(Member $e0 $v0)` |

## Top by nisurp (multi-clause, non-dominated)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 6 (6×) | cross | 2 | 58.44 | `(Inheritance $v0 $v1)`<br>`(Member $x0 $v1)` |
| 6 (12×) | cross | 2 | 51.40 | `(Inheritance $v0 $v1)`<br>`(Member $e0 $v0)` |
| 26 (26×) | cross | 1 | 32.59 | `(Member $x0 $v0)`<br>`(Member $x1 $v0)` |
| 11 (12×) | cross | 1 | 25.88 | `(GroupOf $x0 $v0)`<br>`(Member $x1 $v0)` |
| 30 (38×) | star | 2 | 21.63 | `(Member $e0 $v0)`<br>`(Member $e0 $v1)` |
| 55 (63×) | cross | 1 | 13.00 | `(Member $e0 $v0)`<br>`(Member $x0 $v0)` |
| 54 (74×) | cross | 1 | 11.57 | `(Member $e0 $v0)`<br>`(Member $e1 $v0)` |
| 13 (22×) | kindlevel | 3 | 10.20 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v1 $v2)` |
| 14 (26×) | kindlevel | 3 | 9.40 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v2 $v0)` |
| 4 (4×) | star | 1 | 7.93 | `(Member $x0 $v0)`<br>`(Member $x0 person)` |
| 3 (3×) | star | 1 | 5.98 | `(GroupOf $x0 person)`<br>`(Member $x0 $v0)` |
| 3 (7×) | cross | 2 | 4.87 | `(Inheritance $v0 $v1)`<br>`(Past (Member $x0 $v0))` |
| 51 (67×) | star | 2 | 4.80 | `(GroupOf $x0 $v0)`<br>`(Member $x0 $v1)` |
| 41 (49×) | star | 3 | 4.78 | `(Member $x0 $v0)`<br>`(Member $x0 $v1)`<br>`(Member $x0 $v2)` |
| 13 (15×) | star | 1 | 4.40 | `(Member $x0 $v0)`<br>`(Member $x0 thing)` |
| 27 (33×) | kindlevel | 3 | 4.39 | `(Inheritance $v0 $v1)`<br>`(Inheritance $v2 $v1)` |
| 6 (6×) | cross | 1 | 3.89 | `(Member $e0 $v0)`<br>`(Member $e1 $v0)`<br>`(Member $e2 $v0)` |
| 3 (3×) | star | 2 | 3.87 | `(GroupOf $x0 $v0)`<br>`(Past (Member $x0 $v1))` |
| 24 (24×) | cross | 1 | 3.17 | `(GroupOf $x0 $v0)`<br>`(GroupOf $x1 $v0)` |
| 4 (4×) | star | 3 | 3.07 | `(Member $e0 $v0)`<br>`(Member $e0 $v1)`<br>`(Member $e0 $v2)` |

## Top lexicalized star units (batch-1 continuity)

| support | mode | lift | nisurp | atoms |
|---|---|---|---|---|
| 40 (40×) | star | 0 | 0.85 | `(Member $e0 have)`<br>`(Theme $e0 $x0)` |
| 27 (27×) | star | 0 | 0.98 | `(Holder $e0 $x0)`<br>`(Member $e0 have)` |
| 26 (26×) | star | 0 | 0.86 | `(Holder $e0 $x0)`<br>`(Member $e0 have)`<br>`(Theme $e0 $x1)` |
| 17 (17×) | star | 0 | 0.92 | `(Member $x0 person)`<br>`(Possession $x1 $x0)` |
| 15 (15×) | star | 0 | 0.79 | `(Member $e0 make)`<br>`(Patient $e0 $x0)` |
| 14 (14×) | star | 0 | 0.54 | `(Member $e0 start)`<br>`(Past $e0)` |
| 12 (12×) | star | 0 | 0.09 | `(Member $e0 have)`<br>`(Past $e0)` |
| 11 (11×) | star | 0 | -0.11 | `(Member $e0 have)`<br>`(Past $e0)`<br>`(Theme $e0 $x0)` |
| 10 (12×) | star | 0 | 0.63 | `(Member $e0 begin)`<br>`(Past $e0)` |
| 10 (11×) | star | 0 | 0.51 | `(Member $e0 go)`<br>`(Past $e0)` |
| 9 (11×) | star | 0 | 0.86 | `(Member $e0 kill)`<br>`(Patient $e0 $x0)` |
| 9 (9×) | star | 0 | 0.25 | `(Member $e0 make)`<br>`(Past $e0)` |
| 9 (9×) | star | 0 | 0.67 | `(Member $e0 start)`<br>`(Patient $e0 $x0)` |
| 9 (10×) | star | 0 | 0.69 | `(Member $e0 use)`<br>`(Theme $e0 $x0)` |
| 8 (8×) | star | 0 | 0.54 | `(Agent $e0 $x0)`<br>`(Member $e0 make)` |
| 8 (9×) | star | 0 | 0.94 | `(Location $e0 $x0)`<br>`(Member $e0 find)` |
| 8 (8×) | star | 0 | 0.54 | `(Member $e0 become)`<br>`(Past $e0)` |
| 8 (8×) | star | 0 | 0.66 | `(Member $e0 hear)`<br>`(Past $e0)` |
| 8 (8×) | star | 0 | 0.58 | `(Member $e0 try)`<br>`(Past $e0)` |
| 7 (9×) | star | 0 | 0.61 | `(Member $e0 kill)`<br>`(Past $e0)`<br>`(Patient $e0 $x0)` |

