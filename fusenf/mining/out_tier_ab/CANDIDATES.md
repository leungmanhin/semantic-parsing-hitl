# Cross-method candidate table — `out_tier_ab`

Rows = what the proposing methods put forward: §4.3.1 proposals (closed units of size ≥ 2), §4.3.3 passes (joins; part-of restatements counted, not listed), §4.3.4 unifications at gate LICENSED / JOINT-ONLY / CONTESTED (the Tier A instrument — paraphrase pairs exist only in Tier A). Columns = the distributional methods: §4.3.2 signals (word@0.85, JSD ≤ 0.3) and §4.3.5 ties (k 32, cosine ≥ 0.85, init floor) that touch the row, as corroboration or as a flag. Nothing filtered; the record is `candidates.jsonl`.

**Reading.** §4.3.1 and §4.3.3 propose; §4.3.4 licenses (the only evidence that speaks to meaning preservation); §4.3.2 and §4.3.5 measure distributional sameness, which can be semantic, arbitrary (template fillers, names) or contextual, so on their own they license nothing but corroborate or flag. The family every method reaches is the Theme / Patient wobble inside a shared frame.

## Counts

- §4.3.1 proposals: 931 (117 with an exclusive §4.3.5 partner, 3 with a within-class §4.3.2 flag, 90 with a same-role twin class)
- §4.3.3 joins (genuine): 58 (36 also tied by §4.3.5); part-of restatements: 149 (119 tied)
- §4.3.4 unifications (non-FAIL): 42 (25 corroborated by §4.3.2, 1 by §4.3.5)

## §4.3.4 unifications (rows) with §4.3.2 / §4.3.5 corroboration (columns)

| kind | gate | support | control | A | B | §4.3.2 | §4.3.5 |
|---|---|---|---|---|---|---|---|
| role | LICENSED | 13 | 0 | `Agent` | `Recipient` | acquire.Agent ~ sell.Recipient (n 4, swap 0.0)<br>purchase.Agent ~ sell.Recipient (n 4, swap 0.0)<br>borrow.Agent ~ lend.Recipient (n 3, swap 0.15)<br>learn.Agent ~ teach.Recipient (n 3, swap 0.14)<br>buy.Agent ~ sell.Recipient (n 4, swap 0.14) | — |
| role | LICENSED | 9 | 0 | `Agent` | `Source` | borrow.Source ~ lend.Agent (n 3, swap 0.15)<br>learn.Source ~ teach.Agent (n 3, swap 0.13) | — |
| joint | LICENSED | 4 | 0 | `(And (Agent $e0 $x0) (Member $e0 acquire))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | acquire.Agent ~ sell.Recipient (n 4, swap 0.0) | — |
| joint | LICENSED | 4 | 0 | `(And (Agent $e0 $x0) (Member $e0 buy))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | buy.Agent ~ sell.Recipient (n 4, swap 0.14) | — |
| joint | LICENSED | 4 | 0 | `(And (Agent $e0 $x0) (Member $e0 purchase))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | purchase.Agent ~ sell.Recipient (n 4, swap 0.0) | — |
| joint | LICENSED | 4 | 0 | `(And (Member $e0 reach) (Theme $e0 $e1))` | `(And (Member $e0 make) (Patient $e0 $e1))` | — | — |
| factor | LICENSED | 4 | 0 | `(Member $e0 buy)` | `(Member $e0 acquire)` | acquire.Agent ~ buy.Agent (n 4, swap 0.14)<br>acquire.Theme ~ buy.Theme (n 4, swap 0.13) | — |
| factor | LICENSED | 4 | 0 | `(Member $e0 commence)` | `(Member $e0 begin)` | begin.Patient ~ commence.Patient (n 4, swap 0.0) | (And (Member $e0 begin) (Patient $e0 $x0)) ~ (And (Member $e0 commence) (Patient $e0 $x0)) (0.98, cross) |
| factor | LICENSED | 4 | 0 | `(Member $e0 purchase)` | `(Member $e0 acquire)` | acquire.Agent ~ purchase.Agent (n 4, swap 0.0)<br>acquire.Theme ~ purchase.Theme (n 4, swap 0.0) | — |
| factor | LICENSED | 4 | 0 | `(Member $e0 purchase)` | `(Member $e0 buy)` | buy.Agent ~ purchase.Agent (n 4, swap 0.14) | — |
| factor | LICENSED | 4 | 0 | `(Member $e0 start)` | `(Member $e0 begin)` | begin.Time ~ start.Time (n 3, swap 0.0) | — |
| factor | LICENSED | 4 | 0 | `(Member $e0 start)` | `(Member $e0 commence)` | — | — |
| joint | LICENSED | 3 | 0 | `(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0))` | — | — |
| joint | LICENSED | 3 | 0 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0))` | learn.Agent ~ teach.Recipient (n 3, swap 0.14)<br>learn.Source ~ teach.Agent (n 3, swap 0.13) | — |
| joint | LICENSED | 3 | 0 | `(And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | decide.Theme ~ decision.Theme (n 6, swap 0.09) | — |
| joint | LICENSED | 3 | 0 | `(And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | decide.Theme ~ decision.Theme (n 6, swap 0.09) | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 cancel)` | `(Member $e0 call_off)` | call_off.Agent ~ cancel.Agent (n 3, swap 0.0)<br>call_off.Patient ~ cancel.Patient (n 3, swap 0.0) | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 find_out)` | `(Member $e0 discover)` | — | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 give_up)` | `(Member $e0 abandon)` | abandon.Agent ~ give_up.Agent (n 4, swap 0.0)<br>abandon.Theme ~ give_up.Theme (n 4, swap 0.0) | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 put_off)` | `(Member $e0 postpone)` | postpone.Agent ~ put_off.Agent (n 3, swap 0.0)<br>postpone.Theme ~ put_off.Theme (n 3, swap 0.0) | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 require)` | `(Member $e0 need)` | need.Holder ~ require.Holder (n 3, swap 0.0) | — |
| factor | LICENSED | 3 | 0 | `(Member $e0 turn_down)` | `(Member $e0 reject)` | reject.Agent ~ turn_down.Agent (n 3, swap 0.18)<br>reject.Theme ~ turn_down.Theme (n 3, swap 0.18) | — |
| factor | LICENSED | 3 | 0 | `(Member $x0 car)` | `(Member $x0 automobile)` | — | — |
| factor | LICENSED | 3 | 0 | `(Member $x0 hard)` | `(Member $x0 difficult)` | — | — |
| joint | LICENSED | 3 | 0 | `(Member $x0 huge)` | `(And (Degree $x0 big very) (Member $x0 big))` | — | — |
| factor | LICENSED | 3 | 0 | `(Member $x0 large)` | `(Member $x0 big)` | — | — |
| factor | LICENSED | 3 | 0 | `(Member $x0 physician)` | `(Member $x0 doctor)` | — | — |
| factor | JOINT-ONLY | 9 | 0 | `(Agent $e0 $x0)` | `(Source $e0 $x0)` | borrow.Source ~ lend.Agent (n 3, swap 0.15)<br>learn.Source ~ teach.Agent (n 3, swap 0.13) | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 make)` | `(Member $e0 decide)` | — | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 reach)` | `(Member $e0 decide)` | — | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 reach)` | `(Member $e0 make)` | — | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 sell)` | `(Member $e0 acquire)` | acquire.Agent ~ sell.Recipient (n 4, swap 0.0) | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 sell)` | `(Member $e0 buy)` | buy.Agent ~ sell.Recipient (n 4, swap 0.14) | — |
| factor | JOINT-ONLY | 4 | 0 | `(Member $e0 sell)` | `(Member $e0 purchase)` | purchase.Agent ~ sell.Recipient (n 4, swap 0.0) | — |
| factor | JOINT-ONLY | 4 | 0 | `(Theme $e0 $e1)` | `(Patient $e0 $e1)` | — | — |
| factor | JOINT-ONLY | 3 | 0 | `(Member $e0 give)` | `(Member $e0 answer)` | — | — |
| factor | JOINT-ONLY | 3 | 0 | `(Member $e0 lend)` | `(Member $e0 borrow)` | borrow.Agent ~ lend.Recipient (n 3, swap 0.15)<br>borrow.Source ~ lend.Agent (n 3, swap 0.15)<br>borrow.Theme ~ lend.Theme (n 3, swap 0.15) | — |
| factor | JOINT-ONLY | 3 | 0 | `(Member $e0 receive)` | `(Member $e0 give)` | — | — |
| factor | JOINT-ONLY | 3 | 0 | `(Member $e0 teach)` | `(Member $e0 learn)` | learn.Agent ~ teach.Recipient (n 3, swap 0.14)<br>learn.Source ~ teach.Agent (n 3, swap 0.13) | — |
| factor | JOINT-ONLY | 3 | 0 | `(Member $x0 huge)` | `(Member $x0 big)` | — | — |
| factor | CONTESTED | 12 | 1 | `(Agent $e0 $x0)` | `(Recipient $e0 $x0)` | acquire.Agent ~ sell.Recipient (n 4, swap 0.0)<br>borrow.Agent ~ lend.Recipient (n 3, swap 0.15)<br>buy.Agent ~ sell.Recipient (n 4, swap 0.14)<br>learn.Agent ~ teach.Recipient (n 3, swap 0.14)<br>purchase.Agent ~ sell.Recipient (n 4, swap 0.0) | — |
| role | CONTESTED | 5 | 3 | `Theme` | `Patient` | — | — |

## §4.3.3 genuine joins (rows = the 28 distinct merged features, pairs collapsed) with §4.3.5 ties and §4.3.2 flags (columns)

| pairs | max MI | Jaccard range | shared (distinct) | tier | merged feature | §4.3.5 tied pairs | §4.3.2 flags / twins |
|---|---|---|---|---|---|---|---|
| 1 | 0.0740 | 0.96–0.96 | 22 (22) | tierB-only | `(And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0))` | 1 of 1 (nested) | — |
| 5 | 0.0685 | 0.52–0.74 | 23 (23) | tierB-only | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | 1 of 5 (nested) | — |
| 1 | 0.0594 | 0.94–0.94 | 17 (7) | cross | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | 1 of 1 (nested) | twin: acquire.Theme ~ buy.Theme |
| 6 | 0.0526 | 0.78–1.00 | 14 (4) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | 6 of 6 (nested, same-records) | twin: acquire.Agent ~ buy.Agent<br>twin: acquire.Theme ~ buy.Theme<br>twin: buy.Agent ~ purchase.Agent |
| 1 | 0.0524 | 0.50–0.50 | 23 (23) | tierB-only | `(And (Holder $e0 $x0) (Member $e0 have))` | 0 of 1 | — |
| 1 | 0.0477 | 0.82–0.82 | 14 (4) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0))` | 1 of 1 (nested) | twin: acquire.Agent ~ buy.Agent<br>twin: buy.Agent ~ purchase.Agent |
| 1 | 0.0467 | 0.78–0.78 | 14 (4) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | 1 of 1 (nested) | twin: acquire.Agent ~ buy.Agent<br>twin: acquire.Theme ~ buy.Theme<br>twin: buy.Agent ~ purchase.Agent |
| 16 | 0.0462 | 0.40–1.00 | 12 (6) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | 6 of 16 (nested, same-records) | — |
| 3 | 0.0440 | 0.52–0.92 | 12 (12) | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))` | 1 of 3 (nested) | — |
| 1 | 0.0440 | 0.92–0.92 | 12 (6) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1))` | 1 of 1 (nested) | — |
| 1 | 0.0440 | 0.92–0.92 | 12 (6) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 give) (Theme $e0 $x1))` | 1 of 1 (nested) | — |
| 4 | 0.0419 | 0.38–0.86 | 12 (6) | tierA-only | `(And (Member $e0 give) (Recipient $e0 $x0) (Theme $e0 $x1))` | 1 of 4 (overlapping) | — |
| 1 | 0.0386 | 0.59–0.59 | 13 (13) | cross | `(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))` | 1 of 1 (overlapping) | — |
| 1 | 0.0376 | 0.91–0.91 | 10 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | 1 of 1 (nested) | — |
| 1 | 0.0369 | 0.55–0.55 | 12 (12) | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | 1 of 1 (nested) | — |
| 1 | 0.0362 | 1.00–1.00 | 9 (4) | cross | `(And (Agent $e0 $x0) (Member $e0 discover) (Theme $e0 $x1))` | 1 of 1 (same-records) | — |
| 1 | 0.0355 | 0.83–0.83 | 10 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | 1 of 1 (overlapping) | — |
| 1 | 0.0353 | 0.77–0.77 | 10 (5) | cross | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` | 1 of 1 (nested) | — |
| 2 | 0.0352 | 0.50–0.60 | 12 (12) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))` | 2 of 2 (overlapping) | — |
| 1 | 0.0342 | 0.90–0.90 | 9 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 decide) (Theme $e0 $x1))` | 1 of 1 (nested) | twin: decide.Theme ~ decision.Theme |
| 1 | 0.0342 | 0.90–0.90 | 9 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 lend) (Theme $e0 $x1))` | 1 of 1 (nested) | twin: borrow.Theme ~ lend.Theme |
| 1 | 0.0328 | 1.00–1.00 | 8 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))` | 1 of 1 (same-records) | twin: abandon.Agent ~ give_up.Agent<br>twin: abandon.Theme ~ give_up.Theme |
| 1 | 0.0328 | 1.00–1.00 | 8 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 reject) (Theme $e0 $x1))` | 0 of 1 | twin: reject.Agent ~ turn_down.Agent<br>twin: reject.Theme ~ turn_down.Theme |
| 1 | 0.0321 | 0.75–0.75 | 9 (9) | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` | 1 of 1 (nested) | — |
| 1 | 0.0313 | 0.36–0.36 | 14 (14) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1))` | 0 of 1 | — |
| 1 | 0.0309 | 0.89–0.89 | 8 (8) | tierB-only | `(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0))` | 1 of 1 (nested) | — |
| 1 | 0.0309 | 0.89–0.89 | 8 (3) | tierA-only | `(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))` | 1 of 1 (nested) | repair.Agent ~ repair.Patient (n 8, swap 0.35) |
| 1 | 0.0301 | 0.39–0.39 | 13 (13) | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | 1 of 1 (overlapping) | — |

## §4.3.1 proposals (rows; shown: support ≥ 10 or with a §4.3.5 exclusive partner or a §4.3.2 flag — 203 of 931) with §4.3.5 ties and §4.3.2 flags (columns)

| support | tier | unit | §4.3.5 ties by relation | best exclusive partner | §4.3.2 flags / twins |
|---|---|---|---|---|---|
| 235 | cross | `(And (Agent $e0 $x0) (Theme $e0 $x1))` | — | — | — |
| 223 | cross | `(And (Agent $e0 $x0) (Past $e0))` | — | — | — |
| 162 | cross | `(And (Past $e0) (Patient $e0 $x0))` | — | — | — |
| 140 | cross | `(And (Past $e0) (Theme $e0 $x0))` | — | — | — |
| 95 | cross | `(And (Agent $e0 $x0) (Patient $e0 $x1))` | — | — | — |
| 68 | cross | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))` | — | — | — |
| 58 | tierB-only | `(And (Location $e0 $x0) (Past $e0))` | — | — | — |
| 56 | tierB-only | `(And (Agent $e0 $x0) (Ongoing $e0))` | — | — | — |
| 52 | cross | `(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))` | — | — | — |
| 46 | cross | `(And (Agent $e0 $x0) (Location $e0 $x1))` | — | — | — |
| 43 | tierB-only | `(And (Past $e0) (Theme $e0 $e1))` | nested 2 | — | — |
| 42 | tierB-only | `(And (Experiencer $e0 $x0) (Past $e0))` | — | — | — |
| 37 | cross | `(And (Agent $e0 $x0) (Recipient $e0 $x1))` | nested 1 | — | — |
| 37 | tierB-only | `(And (Goal $e0 $x0) (Past $e0))` | nested 4 overlapping 7 | — | — |
| 37 | tierB-only | `(And (Ongoing $e0) (Past $e0))` | — | — | — |
| 35 | tierB-only | `(And (Ongoing $e0) (Patient $e0 $x0))` | — | — | — |
| 33 | cross | `(And (Agent $e0 $x0) (Theme $e0 $e1))` | nested 1 | — | — |
| 33 | tierB-only | `(And (Member $e0 have) (Theme $e0 $x0))` | nested 8 overlapping 1 | — | — |
| 31 | cross | `(And (Holder $e0 $x0) (Theme $e0 $x1))` | nested 1 | — | — |
| 30 | cross | `(And (Recipient $e0 $x0) (Theme $e0 $x1))` | nested 1 | — | — |
| 25 | cross | `(And (Cardinality $x0 <num>) (Theme $e0 $x0))` | nested 2 | — | — |
| 25 | tierB-only | `(And (Location $e0 $x0) (Ongoing $e0))` | nested 2 overlapping 3 | — | — |
| 24 | tierA-only | `(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $x2))` | nested 1 | — | — |
| 23 | tierB-only | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` | nested 6 overlapping 2 same-records 1 | — | — |
| 23 | tierB-only | `(And (Experiencer $e0 $x0) (Result $e1 $e0))` | nested 4 overlapping 2 | — | — |
| 23 | tierB-only | `(And (Past $e0) (Result $e0 $e1))` | nested 3 overlapping 6 | — | — |
| 22 | tierB-only | `(And (Ongoing $e0) (Theme $e1 $e0))` | nested 22 overlapping 2 | — | — |
| 22 | tierB-only | `(And (Patient $e0 $x0) (Result $e0 $e1))` | nested 4 overlapping 1 | — | — |
| 21 | cross | `(And (Agent $e0 $x0) (Might $e0))` | nested 2 overlapping 1 | — | — |
| 20 | tierB-only | `(And (Agent $e0 $x0) (Theme $e1 $e0))` | nested 1 overlapping 1 | — | — |
| 19 | cross | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | exclusive 2 nested 3 overlapping 6 | `(And (Goal $e0 $x0) (Patient $e0 $x1))` 0.88 parallel [tierB-only] | — |
| 19 | tierB-only | `(And (Past $e0) (Source $e0 $x0))` | nested 1 | — | — |
| 18 | cross | `(And (Future $e0) (Patient $e0 $x0))` | nested 15 overlapping 25 | — | — |
| 18 | cross | `(And (Member $e0 buy) (Theme $e0 $x0))` | nested 6 same-records 1 | — | twin: acquire.Theme ~ buy.Theme |
| 17 | tierB-only | `(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` | nested 15 overlapping 6 | — | — |
| 17 | cross | `(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))` | nested 6 same-records 1 | — | twin: acquire.Theme ~ buy.Theme |
| 17 | cross | `(And (Patient $e0 $x0) (Theme $e1 $e0))` | nested 1 | — | — |
| 16 | tierB-only | `(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))` | nested 2 overlapping 1 | — | — |
| 16 | tierB-only | `(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))` | overlapping 2 | — | — |
| 15 | cross | `(And (Agent $e0 $x0) (Cardinality $x0 <num>))` | nested 23 | — | — |
| 15 | cross | `(And (Agent $e0 $x0) (Future $e0))` | nested 1 overlapping 2 | — | — |
| 15 | tierB-only | `(And (Experiencer $e0 $x0) (Ongoing $e0))` | nested 3 overlapping 6 | — | — |
| 15 | tierB-only | `(And (Member $e0 make) (Patient $e0 $x0))` | — | — | — |
| 14 | cross | `(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))` | nested 1 | — | — |
| 14 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 buy) (Past $e0) (Theme $e0 $x1))` | nested 4 same-records 3 | — | twin: acquire.Agent ~ buy.Agent<br>twin: acquire.Theme ~ buy.Theme<br>twin: buy.Agent ~ purchase.Agent |
| 14 | tierB-only | `(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))` | overlapping 1 | — | — |
| 14 | cross | `(And (Agent $e0 $x0) (Source $e0 $x1))` | nested 1 overlapping 1 | — | — |
| 14 | cross | `(And (Experiencer $e0 $x0) (Location $e0 $x1))` | nested 3 overlapping 6 | — | — |
| 14 | tierB-only | `(And (Location $e0 $x0) (Patient $e0 $x1))` | nested 1 | — | — |
| 14 | tierB-only | `(And (Member $e0 start) (Past $e0))` | nested 13 overlapping 11 | — | — |
| 14 | cross | `(And (Might $e0) (Theme $e0 $x0))` | nested 1 overlapping 1 | — | — |
| 14 | tierB-only | `(And (Ongoing $e0) (Theme $e0 $x0))` | nested 1 | — | — |
| 14 | cross | `(And (Possession $x0 $x1) (Theme $e0 $x0))` | nested 16 overlapping 5 | — | — |
| 13 | tierB-only | `(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))` | nested 2 overlapping 4 | — | — |
| 13 | tierB-only | `(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))` | exclusive 1 nested 3 overlapping 6 | `(And (Goal $e0 $x0) (Patient $e0 $x1))` 0.85 [tierB-only] | — |
| 13 | cross | `(And (Agent $e0 $x0) (Might $e0) (Theme $e0 $x1))` | nested 2 | — | — |
| 13 | cross | `(And (Member $e0 destroy) (Patient $e0 $x0))` | nested 11 overlapping 5 same-records 1 | — | — |
| 13 | cross | `(And (Member $e0 give) (Recipient $e0 $x0))` | nested 34 overlapping 4 | — | — |
| 13 | cross | `(And (Member $e0 give) (Theme $e0 $x0))` | nested 34 overlapping 4 | — | — |
| 13 | cross | `(And (Member $e0 start) (Patient $e0 $x0))` | nested 1 | — | — |
| 13 | cross | `(And (Past $e0) (Recipient $e0 $x0))` | — | — | — |
| 13 | cross | `(And (Source $e0 $x0) (Theme $e0 $x1))` | overlapping 1 | — | — |
| 12 | tierB-only | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` | nested 17 overlapping 9 same-records 1 | — | — |
| 12 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 give) (Recipient $e0 $x1) (Theme $e0 $x2))` | nested 31 overlapping 3 same-records 4 | — | — |
| 12 | tierB-only | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0))` | — | — | — |
| 12 | tierB-only | `(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))` | nested 2 overlapping 4 | — | — |
| 12 | cross | `(And (Agent $e0 $x0) (GroupOf $x0 child))` | — | — | — |
| 12 | cross | `(And (Agent $e0 $x0) (Member $e0 make))` | nested 14 overlapping 2 | — | — |
| 12 | cross | `(And (Location $e0 $x0) (Theme $e0 $x1))` | nested 30 overlapping 5 | — | — |
| 11 | cross | `(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))` | nested 22 overlapping 5 | — | — |
| 11 | cross | `(And (Agent $e0 $x0) (Member $e0 teach))` | nested 2 overlapping 2 | — | — |
| 11 | cross | `(And (Location $e0 $x0) (Member $e0 work))` | nested 10 overlapping 25 | — | — |
| 11 | cross | `(And (Member $e0 answer) (Theme $e0 $x0))` | nested 2 same-records 1 | — | — |
| 11 | cross | `(And (Member $e0 require) (Theme $e0 $x0))` | nested 9 overlapping 13 | — | — |
| 11 | cross | `(And (Member $e0 teach) (Recipient $e0 $x0))` | nested 2 overlapping 1 | — | — |
| 10 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | nested 2 same-records 1 | — | — |
| 10 | cross | `(And (Agent $e0 $x0) (Member $e0 destroy) (Patient $e0 $x1))` | nested 2 overlapping 1 same-records 1 | — | — |
| 10 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | nested 3 | — | — |
| 10 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 decide))` | nested 19 overlapping 19 | — | — |
| 10 | cross | `(And (Agent $e0 $x0) (Member $x0 school))` | nested 33 overlapping 16 | — | — |
| 10 | tierB-only | `(And (Manner $e0 quickly) (Past $e0))` | — | — | — |
| 10 | cross | `(And (Member $e0 begin) (Patient $e0 $x0))` | exclusive 4 nested 1 overlapping 36 | `(And (Member $e0 commence) (Patient $e0 $x0))` 0.98 parallel [tierA-only] | twin: begin.Patient ~ commence.Patient |
| 10 | tierB-only | `(And (Member $e0 go) (Past $e0))` | nested 1 | — | — |
| 10 | tierB-only | `(And (Member $e0 have) (Past $e0))` | nested 6 overlapping 3 | — | — |
| 10 | tierA-only | `(And (Member $e0 lend) (Theme $e0 $x0))` | nested 24 overlapping 12 same-records 1 | — | twin: borrow.Theme ~ lend.Theme |
| 10 | tierB-only | `(And (Member $x0 door) (Patient $e0 $x0))` | — | — | — |
| 9 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 board))` | exclusive 12 nested 17 overlapping 11 | `(Member $x0 judge)` 0.98 [tierA-only] | — |
| 9 | cross | `(And (Member $x0 new) (Theme $e0 $x0))` | exclusive 12 nested 4 overlapping 3 | `(And (Agent $e0 $x0) (Member $x0 judge))` 0.91 [tierA-only] | — |
| 8 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1))` | nested 4 overlapping 39 same-records 1 | — | repair.Agent ~ repair.Patient (n 8, swap 0.35) |
| 8 | tierB-only | `(And (Member $e0 try) (Theme $e0 $e1))` | exclusive 11 nested 2 overlapping 2 | `(And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1))` 0.86 [cross] | — |
| 7 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 board) (Theme $e0 $x1))` | exclusive 10 nested 14 overlapping 14 | `(Member $x0 judge)` 0.93 [tierA-only] | — |
| 7 | cross | `(And (Goal $e0 $x0) (Member $e0 walk))` | exclusive 1 nested 4 overlapping 5 | `(And (Goal $e0 $x0) (Member $e0 go))` 0.87 parallel [tierB-only] | — |
| 7 | tierB-only | `(And (Goal $e0 $x0) (Patient $e0 $x1))` | exclusive 3 nested 1 overlapping 2 | `(And (Goal $e0 $x0) (Member $e0 go))` 0.88 [tierB-only] | — |
| 6 | tierA-only | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` | exclusive 21 nested 12 overlapping 8 same-records 3 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 6 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))` | exclusive 1 nested 24 overlapping 11 same-records 1 | `(Member $x0 neighbour)` 0.89 [tierA-only] | twin: borrow.Theme ~ lend.Theme |
| 6 | tierA-only | `(And (Agent $e0 $x0) (Member $e0 repair) (Past $e0) (Patient $e0 $x1))` | nested 6 overlapping 37 same-records 1 | — | repair.Agent ~ repair.Patient (n 8, swap 0.35) |
| 6 | tierB-only | `(And (Goal $e0 $x0) (Member $e0 go))` | exclusive 3 nested 1 overlapping 1 | `(And (Goal $e0 $x0) (Patient $e0 $x1))` 0.88 [tierB-only] | — |
| 6 | tierA-only | `(And (Member $x0 budget) (Possession $x0 next_year))` | exclusive 12 nested 16 overlapping 18 same-records 2 | `(Member $x0 judge)` 0.98 [tierA-only] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Inheritance yard_floodlight floodlight) (Member $x1 yard_floodlight) (Patient $e0 $x1))` | exclusive 21 nested 4 overlapping 8 same-records 11 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 electrician) (Member $x1 yard_floodlight) (Patient $e0 $x1))` | exclusive 21 nested 4 overlapping 8 same-records 11 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 electrician) (Past $e0) (Patient $e0 $x1))` | exclusive 21 nested 4 overlapping 8 same-records 11 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Member $x1 yard_floodlight) (Past $e0) (Patient $e0 $x1))` | exclusive 21 nested 4 overlapping 8 same-records 11 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 5 | tierA-only | `(And (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0) (Time $e0 (Month september)))` | exclusive 20 nested 5 overlapping 7 same-records 8 | `(And (Before $x0 $e0) (Inheritance dress_rehearsal rehearsal) (Member $x1 dress_rehearsal) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 5 | tierA-only | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight) (Past $e0) (Patient $e0 $x0))` | exclusive 21 nested 4 overlapping 8 same-records 11 | `(Member $x0 mechanic)` 0.96 [tierA-only] | — |
| 5 | cross | `(And (Agent $e0 $x0) (Member $x1 song) (Theme $e0 $x1))` | exclusive 1 nested 24 overlapping 5 same-records 1 | `(Member $x0 coach)` 0.85 [cross] | — |
| 5 | tierA-only | `(And (Inheritance afternoon_session session) (Member $x0 afternoon_session))` | exclusive 16 nested 11 overlapping 4 same-records 4 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 5 | tierA-only | `(And (Inheritance dress_rehearsal rehearsal) (Member $x0 dress_rehearsal))` | exclusive 14 nested 15 overlapping 8 same-records 3 | `(And (Future $e0) (Inheritance apple_harvest harvest) (Member $x0 apple_harvest) (Patient $e0 $x0))` 1.00 [tierA-only] | — |
| 5 | tierA-only | `(And (Inheritance summer_fair fair) (Member $x0 summer_fair))` | exclusive 16 nested 12 overlapping 4 same-records 3 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 5 | tierA-only | `(And (Member $x0 budget) (Possession $x0 next_year) (Theme $e0 $x0))` | exclusive 12 nested 17 overlapping 17 same-records 2 | `(Member $x0 judge)` 0.98 [tierA-only] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 judge))` | exclusive 29 nested 2 overlapping 24 same-records 1 | `(Member $x0 committee)` 0.99 [cross] | — |
| 5 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 tutor))` | exclusive 16 nested 11 overlapping 4 same-records 4 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 5 | tierA-only | `(And (Member $x0 case) (Theme $e0 $x0))` | exclusive 29 nested 2 overlapping 24 same-records 1 | `(Member $x0 committee)` 0.99 [cross] | — |
| 5 | tierA-only | `(And (Member $x0 gearbox) (Member $x0 seized))` | exclusive 16 nested 18 overlapping 8 same-records 2 | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` 0.96 [tierA-only] | — |
| 5 | cross | `(And (Member $x0 roof) (Theme $e0 $x0))` | exclusive 25 nested 4 overlapping 36 | `(And (Agent $e0 $x0) (Member $x0 judge))` 0.98 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` | exclusive 16 nested 10 overlapping 4 same-records 5 | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Inheritance summer_fair fair) (Member $x1 summer_fair) (Patient $e0 $x1))` | exclusive 16 nested 9 overlapping 4 same-records 6 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 biologist) (Member $x1 survey))` | exclusive 2 nested 15 overlapping 12 same-records 6 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 frame))` 0.92 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 council) (Member $x1 summer_fair) (Patient $e0 $x1))` | exclusive 16 nested 9 overlapping 4 same-records 6 | `(And (Agent $e0 $x0) (Inheritance afternoon_session session) (Member $x1 afternoon_session) (Patient $e0 $x1))` 1.00 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 gearbox) (Patient $e0 $x1))` | exclusive 16 nested 4 overlapping 8 same-records 16 | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` 0.96 [tierA-only] | — |
| 4 | tierA-only | `(And (Agent $e0 $x0) (Member $x0 mechanic) (Member $x1 seized) (Patient $e0 $x1))` | exclusive 16 nested 4 overlapping 8 same-records 16 | `(And (Inheritance yard_floodlight floodlight) (Member $x0 yard_floodlight))` 0.96 [tierA-only] | — |
