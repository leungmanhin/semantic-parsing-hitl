# §4.3.1 frequent stars — wave 1

- inputs: tierA.canon.jsonl, tierB.canon.jsonl, tierC_p1.canon.jsonl, tierC_p2.canon.jsonl, tierC_p3.canon.jsonl  (862 records, 0 duplicate ids skipped, canon fusenf-canon/4)
- params: k=4, min_support=3 (surface-record atoms dropped)
- patterns >= support: **1061**  |  signals (multi-atom, lexicalized, non-dominated): **253**  |  cross-tier among those: **8**

## Top lexicalized multi-atom units (collapse candidates)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 14 (14×) | tierA | 1.00 | `(Member $C buy)`<br>`(Past $C)` |
| 13 (19×) | tierC | 1.00 | `(Agent $C $x0:person)`<br>`(Past $C)` |
| 10 (10×) | tierA+tierC | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C child)` |
| 8 (12×) | tierB+tierC | 1.00 | `(Member $C build)`<br>`(Past $C)` |
| 7 (7×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C forklift)` |
| 6 (6×) | tierA | 1.00 | `(GroupOf $C lemon)`<br>`(Member $C crate)` |
| 6 (6×) | tierA | 1.00 | `(Member $C budget)`<br>`(Possession $C next_year)` |
| 6 (6×) | tierA | 1.00 | `(Beneficiary $C $x0:hall)`<br>`(Past $C)` |
| 6 (6×) | tierA | 1.00 | `(Member $C repair)`<br>`(Past $C)` |
| 6 (6×) | tierC | 1.00 | `(Member $C write)`<br>`(Past $C)` |
| 6 (6×) | tierA | 1.00 | `(Past $C)`<br>`(Theme $C $x0:kiln)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C climber)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C egg)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(Theme $e0:require $C)` |
| 5 (5×) | tierA | 1.00 | `(Member $C file)`<br>`(Member $C missing)` |
| 5 (5×) | tierA | 1.00 | `(Member $C firm)`<br>`(Possession $x0:tender $C)` |
| 5 (5×) | tierA | 1.00 | `(Member $C gearbox)`<br>`(Member $C seized)` |
| 5 (5×) | tierC | 1.00 | `(Member $C person)`<br>`(Possession $x0 $C)` |
| 5 (5×) | tierA | 1.00 | `(Member $C scan)`<br>`(Ordinal $C <num> scan)` |
| 5 (5×) | tierA | 1.00 | `(Member $C tender)`<br>`(Possession $C $x0:firm)` |
| 5 (5×) | tierA | 1.00 | `(Agent $C $x0:depot)`<br>`(Past $C)`<br>`(Theme $C $x1)` |
| 5 (5×) | tierA | 1.00 | `(Agent $C $x0:electrician)`<br>`(Past $C)`<br>`(Patient $C $x1:yard_floodlight)` |
| 5 (5×) | tierA | 1.00 | `(Agent $C $x0:pottery_studio)`<br>`(Past $C)`<br>`(Theme $C $x1:kiln)` |
| 5 (5×) | tierA | 1.00 | `(Agent $C $x0:school)`<br>`(Beneficiary $C $x1:hall)`<br>`(Past $C)` |
| 5 (6×) | tierC | 1.00 | `(Also appear $C)`<br>`(Member $C appear)`<br>`(Past $C)` |

## Top kind-level units

| support | tiers | mean s | atoms |
|---|---|---|---|
| 5 (5×) | tierA | 1.00 | `(Inheritance monthly_servicing monthly)`<br>`(Inheritance monthly_servicing servicing)` |
| 5 (5×) | tierA | 1.00 | `(Inheritance north_route north)`<br>`(Inheritance north_route route)` |
| 4 (4×) | tierC | 1.00 | `(Inheritance regional_unit regional)`<br>`(Inheritance regional_unit unit)` |

## Cross-tier units (appear in >=2 tiers)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 10 (10×) | tierA+tierC | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C child)` |
| 8 (12×) | tierB+tierC | 1.00 | `(Member $C build)`<br>`(Past $C)` |
| 5 (5×) | tierB+tierC | 1.00 | `(Member $C play)`<br>`(Past $C)` |
| 3 (3×) | tierB+tierC | 1.00 | `(Manner $C well)`<br>`(Past $C)` |
| 3 (5×) | tierB+tierC | 1.00 | `(Member $C begin)`<br>`(Past $C)` |
| 3 (5×) | tierB+tierC | 1.00 | `(Member $C kill)`<br>`(Past $C)` |
| 3 (3×) | tierB+tierC | 1.00 | `(Member $C open)`<br>`(Past $C)` |
| 3 (5×) | tierB+tierC | 1.00 | `(Ongoing $C)`<br>`(Theme $e0:begin $C)` |

## Structural shells (features for wave 2, NOT collapse candidates)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 209 (295×) | tierA+tierB+tierC | 1.00 | `(Past $C)` |
| 52 (54×) | tierA+tierB+tierC | 1.00 | `(Cardinality $C <num>)` |
| 40 (58×) | tierA+tierB+tierC | 1.00 | `(Agent $C $x0)` |
| 38 (40×) | tierA+tierB+tierC | 1.00 | `(Theme $C $x0)` |
| 28 (28×) | tierA | 1.00 | `(Might $C)` |
| 17 (23×) | tierB+tierC | 1.00 | `(Patient $C $x0)` |
| 16 (18×) | tierA+tierB+tierC | 1.00 | `(Past $C)`<br>`(Theme $C $x0)` |
| 14 (20×) | tierA+tierB+tierC | 1.00 | `(Agent $C $x0)`<br>`(Past $C)` |
| 14 (14×) | tierA+tierB | 1.00 | `(Future $C)` |
| 14 (16×) | tierB+tierC | 1.00 | `(Ongoing $C)` |

