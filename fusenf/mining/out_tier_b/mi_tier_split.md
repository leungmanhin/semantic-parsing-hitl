# §4.3.3 faithful passes on `out_tier_b` — tier split (tierA added to tierB)

Per passing pair, the records carrying both units by tier, with the distinct-sentence count the record already holds. A reading of the miner's record ids, never a filter.

| bucket | passes | genuine (not part-of) |
|---|---|---|
| tierA-only | 0 | 0 |
| tierB-only | 60 | 15 |
| cross | 0 | 0 |
| total | 60 | 15 |

## tierB-only genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|
| 0.0925 | 1.00 | 23 / 23 / 23 | 23 | tierB 23 | `(And (Holder $e0 $x0) (Member $e0 have))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |
| 0.0861 | 0.96 | 23 / 22 / 22 | 22 | tierB 22 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0514 | 0.92 | 13 / 12 / 12 | 12 | tierB 12 | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0428 | 0.55 | 22 / 12 / 12 | 12 | tierB 12 | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Member $e0 start) (Theme $e0 $e1))` |
| 0.0423 | 0.52 | 23 / 12 / 12 | 12 | tierB 12 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0407 | 0.60 | 16 / 16 / 12 | 12 | tierB 12 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` |
| 0.0404 | 0.47 | 24 / 20 / 14 | 14 | tierB 14 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Theme $e1 $e0))` |
| 0.0402 | 0.52 | 22 / 13 / 12 | 12 | tierB 12 | `(And (Patient $e0 $x0) (Result $e0 $e1))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` |
| 0.0375 | 0.75 | 12 / 9 / 9 | 9 | tierB 9 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` |
| 0.0374 | 0.50 | 20 / 16 / 12 | 12 | tierB 12 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` |
| 0.0361 | 0.89 | 9 / 8 / 8 | 8 | tierB 8 | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` |
| 0.0351 | 0.43 | 24 / 16 / 12 | 12 | tierB 12 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` |
| 0.0345 | 0.39 | 23 / 23 / 13 | 13 | tierB 13 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Result $e0 $e1))` |
| 0.0343 | 1.00 | 7 / 7 / 7 | 7 | tierB 7 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` |
| 0.0343 | 1.00 | 7 / 7 / 7 | 7 | tierB 7 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` |

## cross genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|

## tierA-only genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|

