# Cross-method candidate table — `out_tier_b`

Rows = what the proposing methods put forward: §4.3.1 proposals (closed units of size ≥ 2), §4.3.3 passes (joins; part-of restatements counted, not listed), §4.3.4 unifications at gate LICENSED / JOINT-ONLY / CONTESTED (the Tier A instrument — paraphrase pairs exist only in Tier A). Columns = the distributional methods: §4.3.2 signals (word@0.85, JSD ≤ 0.3) and §4.3.5 ties (k 32, cosine ≥ 0.85, init floor) that touch the row, as corroboration or as a flag. Nothing filtered; the record is `candidates.jsonl`.

**Reading.** §4.3.1 and §4.3.3 propose; §4.3.4 licenses (the only evidence that speaks to meaning preservation); §4.3.2 and §4.3.5 measure distributional sameness, which can be semantic, arbitrary (template fillers, names) or contextual, so on their own they license nothing but corroborate or flag. The family every method reaches is the Theme / Patient wobble inside a shared frame.

## Counts

- §4.3.1 proposals: 465 (13 with an exclusive §4.3.5 partner, 0 with a within-class §4.3.2 flag, 0 with a same-role twin class)
- §4.3.3 joins (genuine): 15 (11 also tied by §4.3.5); part-of restatements: 45 (38 tied)
- §4.3.4: not applicable (no paraphrase pairs in this substrate)

## §4.3.3 genuine joins (rows = the 11 distinct merged features, pairs collapsed) with §4.3.5 ties and §4.3.2 flags (columns)

| pairs | max MI | Jaccard range | shared (distinct) | tier | merged feature | §4.3.5 tied pairs | §4.3.2 flags / twins |
|---|---|---|---|---|---|---|---|
| 1 | 0.0925 | 1.00–1.00 | 23 (23) | tierB-only | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | 1 of 1 (same-records) | — |
| 1 | 0.0861 | 0.96–0.96 | 22 (22) | tierB-only | `(And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0))` | 1 of 1 (nested) | — |
| 3 | 0.0514 | 0.52–0.92 | 12 (12) | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))` | 1 of 3 (nested) | — |
| 1 | 0.0428 | 0.55–0.55 | 12 (12) | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | 0 of 1 | — |
| 3 | 0.0407 | 0.43–0.60 | 12 (12) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))` | 3 of 3 (overlapping) | — |
| 1 | 0.0404 | 0.47–0.47 | 14 (14) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1))` | 1 of 1 (overlapping) | — |
| 1 | 0.0375 | 0.75–0.75 | 9 (9) | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | 1 of 1 (nested) | — |
| 1 | 0.0361 | 0.89–0.89 | 8 (8) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0))` | 1 of 1 (nested) | — |
| 1 | 0.0345 | 0.39–0.39 | 13 (13) | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | 0 of 1 | — |
| 1 | 0.0343 | 1.00–1.00 | 7 (7) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | 1 of 1 (same-records) | — |
| 1 | 0.0343 | 1.00–1.00 | 7 (7) | tierB-only | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | 1 of 1 (same-records) | — |

## §4.3.1 proposals (rows; shown: support ≥ 10 or with a §4.3.5 exclusive partner or a §4.3.2 flag — 61 of 465) with §4.3.5 ties and §4.3.2 flags (columns)

| support | tier | unit | §4.3.5 ties by relation | best exclusive partner | §4.3.2 flags / twins |
|---|---|---|---|---|---|
| 190 | tierB-only | `(And (Agent $e0 $x0) (Past $e0))` | — | — | — |
| 151 | tierB-only | `(And (Past $e0) (Patient $e0 $x0))` | — | — | — |
| 114 | tierB-only | `(And (Past $e0) (Theme $e0 $x0))` | — | — | — |
| 89 | tierB-only | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | — | — | — |
| 61 | tierB-only | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | nested 1 | — | — |
| 58 | tierB-only | `(And (Location $e0 $x0) (Past $e0))` | nested 1 | — | — |
| 56 | tierB-only | `(And (Agent $e0 $x0) (Ongoing $e0))` | — | — | — |
| 46 | tierB-only | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | — | — | — |
| 43 | tierB-only | `(And (Past $e0) (Theme $e0 $e1))` | nested 1 | — | — |
| 42 | tierB-only | `(And (Experiencer $e0 $x0) (Past $e0))` | — | — | — |
| 41 | tierB-only | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | nested 1 | — | — |
| 37 | tierB-only | `(And (Goal $e0 $x0) (Past $e0))` | nested 1 | — | — |
| 37 | tierB-only | `(And (Ongoing $e0) (Past $e0))` | — | — | — |
| 35 | tierB-only | `(And (Ongoing $e0) (Patient $e0 $x0))` | — | — | — |
| 33 | tierB-only | `(And (Member $e0 have) (Theme $e0 $x0))` | nested 5 | — | — |
| 27 | tierB-only | `(And (Agent $e0 $x0) (Location $e0 $x1))` | — | — | — |
| 25 | tierB-only | `(And (Location $e0 $x0) (Ongoing $e0))` | — | — | — |
| 24 | tierB-only | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | nested 1 overlapping 2 | — | — |
| 23 | tierB-only | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | nested 2 same-records 3 | — | — |
| 23 | tierB-only | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | nested 2 | — | — |
| 23 | tierB-only | `(And (Past $e0) (Result $e0 $e1))` | nested 3 | — | — |
| 22 | tierB-only | `(And (Ongoing $e0) (Theme $e1 $e0))` | nested 1 | — | — |
| 22 | tierB-only | `(And (Patient $e0 $x0) (Result $e0 $e1))` | nested 2 | — | — |
| 20 | tierB-only | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | nested 1 overlapping 2 | — | — |
| 19 | tierB-only | `(And (Past $e0) (Source $e0 $x0))` | nested 6 overlapping 3 | — | — |
| 17 | tierB-only | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | nested 1 | — | — |
| 16 | tierB-only | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | nested 1 overlapping 2 | — | — |
| 16 | tierB-only | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | nested 1 overlapping 2 | — | — |
| 16 | tierB-only | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | nested 1 | — | — |
| 15 | tierB-only | `(And (Experiencer $e0 $x0) (Ongoing $e0))` | nested 3 overlapping 5 | — | — |
| 15 | tierB-only | `(And (Member $e0 make) (Patient $e0 $x0))` | nested 4 overlapping 5 | — | — |
| 14 | tierB-only | `(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))` | overlapping 1 | — | — |
| 14 | tierB-only | `(And (Location $e0 $x0) (Patient $e0 $x1))` | nested 1 | — | — |
| 14 | tierB-only | `(And (Member $e0 start) (Past $e0))` | nested 3 overlapping 2 | — | — |
| 14 | tierB-only | `(And (Ongoing $e0) (Theme $e0 $x0))` | nested 1 | — | — |
| 14 | tierB-only | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | nested 1 | — | — |
| 13 | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | nested 2 overlapping 3 | — | — |
| 13 | tierB-only | `(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))` | nested 1 | — | — |
| 12 | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | nested 4 overlapping 1 same-records 1 | — | — |
| 12 | tierB-only | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0))` | — | — | — |
| 12 | tierB-only | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | nested 2 overlapping 3 | — | — |
| 11 | tierB-only | `(And (Experiencer $e0 $x0) (Location $e0 $x1))` | nested 3 overlapping 7 | — | — |
| 11 | tierB-only | `(And (Future $e0) (Patient $e0 $x0))` | nested 1 overlapping 1 | — | — |
| 10 | tierB-only | `(And (Agent $e0 $x0) (Future $e0))` | nested 2 overlapping 2 | — | — |
| 10 | tierB-only | `(And (Manner $e0 quickly) (Past $e0))` | nested 2 overlapping 1 | — | — |
| 10 | tierB-only | `(And (Member $e0 go) (Past $e0))` | nested 2 overlapping 5 | — | — |
| 10 | tierB-only | `(And (Member $e0 have) (Past $e0))` | nested 5 | — | — |
| 10 | tierB-only | `(And (Member $x0 door) (Patient $e0 $x0))` | nested 4 overlapping 10 | — | — |
| 8 | tierB-only | `(And (Agent $e0 $x0) (GroupOf $x0 person))` | exclusive 1 nested 2 overlapping 2 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` 0.88 parallel [tierB-only] | — |
| 8 | tierB-only | `(And (Patient $e0 $x0) (Source $e0 $x1))` | exclusive 2 nested 2 overlapping 7 | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` 0.93 [tierB-only] | — |
| 7 | tierB-only | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` | exclusive 1 nested 2 overlapping 2 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` 0.88 [tierB-only] | — |
| 6 | tierB-only | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` | exclusive 2 nested 3 overlapping 6 | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` 0.92 parallel [tierB-only] | — |
| 6 | tierB-only | `(And (Goal $e0 $x0) (Member $e0 go))` | exclusive 4 nested 2 overlapping 1 | `(And (Goal $e0 bed) (Member $e0 go))` 0.91 [tierB-only] | — |
| 5 | tierB-only | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` | exclusive 4 nested 3 | `(And (Goal $e0 bed) (Member $e0 go))` 0.91 [tierB-only] | — |
| 5 | tierB-only | `(And (GroupOf $x0 person) (Patient $e0 $x0))` | exclusive 4 nested 2 | `(And (Member $e0 travel) (Past $e0))` 0.88 [tierB-only] | — |
| 5 | tierB-only | `(And (Source $e0 $x0) (Theme $e0 $x1))` | exclusive 2 nested 2 overlapping 3 | `(And (Patient $e0 $x0) (Source $e0 $x1))` 0.90 parallel [tierB-only] | — |
| 4 | tierB-only | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` | exclusive 2 nested 3 overlapping 2 | `(And (Patient $e0 $x0) (Source $e0 $x1))` 0.93 [tierB-only] | — |
| 3 | tierB-only | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` | exclusive 1 nested 2 | `(And (Member $e0 travel) (Past $e0))` 0.85 [tierB-only] | — |
| 3 | tierB-only | `(And (Goal $e0 bed) (Member $e0 go))` | exclusive 2 nested 1 overlapping 3 same-records 1 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` 0.91 [tierB-only] | — |
| 3 | tierB-only | `(And (Member $e0 travel) (Past $e0))` | exclusive 2 nested 1 overlapping 3 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` 0.88 [tierB-only] | — |
| 3 | tierB-only | `(And (Past $e0) (Time $e0 night))` | exclusive 2 nested 1 overlapping 4 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` 0.90 [tierB-only] | — |
