# §4.3.3 faithful passes on `out_tier_ab` — tier split (tierA added to tierB)

Per passing pair, the records carrying both units by tier, with the distinct-sentence count the record already holds. A reading of the miner's record ids, never a filter.

| bucket | passes | genuine (not part-of) |
|---|---|---|
| tierA-only | 107 | 37 |
| tierB-only | 54 | 17 |
| cross | 46 | 4 |
| total | 207 | 58 |

## tierB-only genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|
| 0.0740 | 0.96 | 23 / 22 / 22 | 22 | tierB 22 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0685 | 0.74 | 31 / 23 / 23 | 23 | tierB 23 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | `(And (Holder $e0 $x0) (Member $e0 have))` |
| 0.0669 | 0.70 | 33 / 23 / 23 | 23 | tierB 23 | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Member $e0 have))` |
| 0.0561 | 0.56 | 33 / 31 / 23 | 23 | tierB 23 | `(And (Member $e0 have) (Theme $e0 $x0))` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |
| 0.0547 | 0.53 | 35 / 31 / 23 | 23 | tierB 23 | `(Member $e0 have)` | `(And (Holder $e0 $x0) (Theme $e0 $x1))` |
| 0.0538 | 0.52 | 34 / 33 / 23 | 23 | tierB 23 | `(Holder $e0 $x0)` | `(And (Member $e0 have) (Theme $e0 $x0))` |
| 0.0524 | 0.50 | 35 / 34 / 23 | 23 | tierB 23 | `(Member $e0 have)` | `(Holder $e0 $x0)` |
| 0.0440 | 0.92 | 13 / 12 / 12 | 12 | tierB 12 | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0369 | 0.55 | 22 / 12 / 12 | 12 | tierB 12 | `(And (Ongoing $e0) (Theme $e1 $e0))` | `(And (Member $e0 start) (Theme $e0 $e1))` |
| 0.0364 | 0.52 | 23 / 12 / 12 | 12 | tierB 12 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` |
| 0.0352 | 0.60 | 16 / 16 / 12 | 12 | tierB 12 | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` |
| 0.0347 | 0.52 | 22 / 13 / 12 | 12 | tierB 12 | `(And (Patient $e0 $x0) (Result $e0 $e1))` | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` |
| 0.0324 | 0.50 | 20 / 16 / 12 | 12 | tierB 12 | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` |
| 0.0321 | 0.75 | 12 / 9 / 9 | 9 | tierB 9 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` |
| 0.0313 | 0.36 | 33 / 20 / 14 | 14 | tierB 14 | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Theme $e1 $e0))` |
| 0.0309 | 0.89 | 9 / 8 / 8 | 8 | tierB 8 | `(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))` | `(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))` |
| 0.0301 | 0.39 | 23 / 23 / 13 | 13 | tierB 13 | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | `(And (Past $e0) (Result $e0 $e1))` |

## cross genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|
| 0.0594 | 0.94 | 18 / 17 / 17 | 7 | tierA 14 tierB 3 | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(And (Member $e0 buy) (Past $e0))` |
| 0.0386 | 0.59 | 21 / 14 / 13 | 13 | tierA 12 tierB 1 | `(And (Agent $e0 $x0) (Might $e0))` | `(And (Might $e0) (Theme $e0 $x0))` |
| 0.0362 | 1.00 | 9 / 9 / 9 | 4 | tierA 7 tierB 2 | `(And (Agent $e0 $x0) (Member $e0 discover))` | `(And (Member $e0 discover) (Theme $e0 $x0))` |
| 0.0353 | 0.77 | 13 / 10 / 10 | 5 | tierA 8 tierB 2 | `(And (Member $e0 destroy) (Patient $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 destroy))` |

## tierA-only genuine passes (by MI)

| MI | Jaccard | n A / B / both | distinct | shared by tier | A | B |
|---|---|---|---|---|---|---|
| 0.0526 | 1.00 | 14 / 14 / 14 | 4 | tierA 14 | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` |
| 0.0477 | 0.82 | 17 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` |
| 0.0477 | 0.82 | 17 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` |
| 0.0477 | 0.82 | 17 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 0.0477 | 0.82 | 17 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` |
| 0.0477 | 0.82 | 17 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Past $e0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 0.0467 | 0.78 | 18 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` |
| 0.0467 | 0.78 | 18 / 14 / 14 | 4 | tierA 14 | `(And (Member $e0 buy) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 buy))` |
| 0.0462 | 1.00 | 12 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` |
| 0.0462 | 1.00 | 12 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 0.0462 | 1.00 | 12 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 0.0462 | 1.00 | 12 / 12 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 0.0440 | 0.92 | 13 / 12 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Recipient $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` |
| 0.0440 | 0.92 | 13 / 12 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Recipient $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 0.0440 | 0.92 | 13 / 12 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` |
| 0.0440 | 0.92 | 13 / 12 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 0.0419 | 0.86 | 13 / 13 / 12 | 6 | tierA 12 | `(And (Member $e0 give) (Recipient $e0 $x0))` | `(And (Member $e0 give) (Theme $e0 $x0))` |
| 0.0376 | 0.91 | 11 / 10 / 10 | 3 | tierA 10 | `(And (Member $e0 answer) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 answer))` |
| 0.0360 | 0.50 | 24 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` |
| 0.0360 | 0.50 | 24 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` |
| 0.0360 | 0.50 | 24 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` |
| 0.0360 | 0.50 | 24 / 12 / 12 | 6 | tierA 12 | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | `(And (Agent $e0 $x0) (Member $e0 give))` |
| 0.0355 | 0.83 | 11 / 11 / 10 | 3 | tierA 10 | `(And (Agent $e0 $x0) (Member $e0 teach))` | `(And (Member $e0 teach) (Recipient $e0 $x0))` |
| 0.0342 | 0.90 | 10 / 9 / 9 | 3 | tierA 9 | `(And (Agent $e0 $x0) (Member $e0 decide))` | `(And (Member $e0 decide) (Theme $e0 $x0))` |
| 0.0342 | 0.90 | 10 / 9 / 9 | 3 | tierA 9 | `(And (Member $e0 lend) (Theme $e0 $x0))` | `(And (Agent $e0 $x0) (Member $e0 lend))` |

