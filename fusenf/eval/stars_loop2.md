# §4.3.1 frequent stars — wave 1

- inputs: tierA.canon.jsonl, tierB.canon.jsonl, tierC_p1.canon.jsonl, tierC_p2.canon.jsonl, tierC_p3.canon.jsonl, p4_mine.canon.jsonl  (982 records, 0 duplicate ids skipped, canon fusenf-canon/4)
- params: k=4, min_support=3 (surface-record atoms dropped)
- patterns >= support: **1225**  |  signals (multi-atom, lexicalized, non-dominated): **299**  |  cross-tier among those: **9**

## Top lexicalized multi-atom units (collapse candidates)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 23 (36×) | tierC | 1.00 | `(Agent $C $x0:person)`<br>`(Past $C)` |
| 16 (16×) | tierA+tierC | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C child)` |
| 14 (14×) | tierA | 1.00 | `(Member $C buy)`<br>`(Past $C)` |
| 10 (11×) | tierC | 1.00 | `(Cardinality $C <num>)`<br>`(Theme $e0:have $C)` |
| 10 (10×) | tierC | 1.00 | `(Member $C write)`<br>`(Past $C)` |
| 9 (10×) | tierC | 1.00 | `(Member $C have)`<br>`(Theme $C $x0)` |
| 8 (8×) | tierC | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C child)`<br>`(Theme $e0:have $C)` |
| 8 (8×) | tierC | 1.00 | `(Holder $C kristoffer)`<br>`(Member $C have)`<br>`(Theme $C $x0)` |
| 8 (12×) | tierB+tierC | 1.00 | `(Member $C build)`<br>`(Past $C)` |
| 8 (8×) | tierB+tierC | 1.00 | `(Member $C play)`<br>`(Past $C)` |
| 7 (7×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C forklift)` |
| 6 (6×) | tierA | 1.00 | `(GroupOf $C lemon)`<br>`(Member $C crate)` |
| 6 (6×) | tierA | 1.00 | `(Member $C budget)`<br>`(Possession $C next_year)` |
| 6 (6×) | tierA | 1.00 | `(Beneficiary $C $x0:hall)`<br>`(Past $C)` |
| 6 (6×) | tierC | 1.00 | `(Location $C france)`<br>`(Past $C)` |
| 6 (6×) | tierC | 1.00 | `(Member $C become)`<br>`(Past $C)` |
| 6 (6×) | tierC | 1.00 | `(Member $C find)`<br>`(Past $C)` |
| 6 (6×) | tierA | 1.00 | `(Member $C repair)`<br>`(Past $C)` |
| 6 (6×) | tierA | 1.00 | `(Past $C)`<br>`(Theme $C $x0:kiln)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C climber)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C egg)` |
| 5 (5×) | tierA | 1.00 | `(Cardinality $C <num>)`<br>`(Theme $e0:require $C)` |
| 5 (5×) | tierA | 1.00 | `(Member $C file)`<br>`(Member $C missing)` |
| 5 (5×) | tierA | 1.00 | `(Member $C firm)`<br>`(Possession $x0:tender $C)` |
| 5 (5×) | tierA | 1.00 | `(Member $C gearbox)`<br>`(Member $C seized)` |

## Top kind-level units

| support | tiers | mean s | atoms |
|---|---|---|---|
| 5 (5×) | tierA | 1.00 | `(Inheritance monthly_servicing monthly)`<br>`(Inheritance monthly_servicing servicing)` |
| 5 (5×) | tierA | 1.00 | `(Inheritance north_route north)`<br>`(Inheritance north_route route)` |
| 4 (4×) | tierC | 1.00 | `(Inheritance regional_unit regional)`<br>`(Inheritance regional_unit unit)` |
| 4 (4×) | tierC | 1.00 | `(LocatedIn limbang sarawak)`<br>`(Member limbang district)` |
| 3 (3×) | tierC | 1.00 | `(Past (Member thomas_fothergill academic))`<br>`(Past (Member thomas_fothergill administrator))`<br>`(Past (Member thomas_fothergill english))` |
| 3 (3×) | tierC | 1.00 | `(Member friendship railhead)`<br>`(Member wellsville railhead)` |

## Cross-tier units (appear in >=2 tiers)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 16 (16×) | tierA+tierC | 1.00 | `(Cardinality $C <num>)`<br>`(GroupOf $C child)` |
| 8 (12×) | tierB+tierC | 1.00 | `(Member $C build)`<br>`(Past $C)` |
| 8 (8×) | tierB+tierC | 1.00 | `(Member $C play)`<br>`(Past $C)` |
| 4 (6×) | tierB+tierC | 1.00 | `(Member $C kill)`<br>`(Past $C)` |
| 3 (3×) | tierB+tierC | 1.00 | `(Manner $C well)`<br>`(Past $C)` |
| 3 (5×) | tierB+tierC | 1.00 | `(Member $C begin)`<br>`(Past $C)` |
| 3 (3×) | tierB+tierC | 1.00 | `(Member $C open)`<br>`(Past $C)` |
| 3 (4×) | tierB+tierC | 1.00 | `(Member $C stop)`<br>`(Past $C)` |
| 3 (5×) | tierB+tierC | 1.00 | `(Ongoing $C)`<br>`(Theme $e0:begin $C)` |

## Structural shells (features for wave 2, NOT collapse candidates)

| support | tiers | mean s | atoms |
|---|---|---|---|
| 255 (365×) | tierA+tierB+tierC | 1.00 | `(Past $C)` |
| 64 (67×) | tierA+tierB+tierC | 1.00 | `(Cardinality $C <num>)` |
| 45 (48×) | tierA+tierB+tierC | 1.00 | `(Theme $C $x0)` |
| 42 (62×) | tierA+tierB+tierC | 1.00 | `(Agent $C $x0)` |
| 28 (28×) | tierA | 1.00 | `(Might $C)` |
| 19 (21×) | tierA+tierB+tierC | 1.00 | `(Past $C)`<br>`(Theme $C $x0)` |
| 18 (24×) | tierB+tierC | 1.00 | `(Patient $C $x0)` |
| 15 (15×) | tierA+tierB+tierC | 1.00 | `(Future $C)` |
| 14 (20×) | tierA+tierB+tierC | 1.00 | `(Agent $C $x0)`<br>`(Past $C)` |
| 14 (20×) | tierB+tierC | 1.00 | `(Past $C)`<br>`(Patient $C $x0)` |

