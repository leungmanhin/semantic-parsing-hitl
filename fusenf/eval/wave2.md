# Wave 2 — §4.3.3 MI grouping + §4.3.5 linear AE (degraded: 862 graphs)

- matrix: 862 records × 1061 wave-1 features (649 with docs>=4)
- MI co-occurrence groups (jaccard>=0.6): 124 (113 non-pure-containment)
- AE interchange pairs (cos>=0.8, jacc<=0.1): 206 — 10 corroborate validated rules, 106 novel symbol pairs

## Top MI groups (meta-node candidates)

| support | size | containment | members |
|---|---|---|---|
| 18 | 2 | pure | `st00007` (Agent $C $x0:person)<br>`st00019` (Agent $C $x0:person) + (Past $C) |
| 17 | 2 | pure | `st00009` (Patient $C $x0)<br>`st00020` (Past $C) + (Patient $C $x0) |
| 14 | 4 | MIXED | `st00011` (Agent $e0:buy $C)<br>`st00012` (Theme $e0:buy $C)<br>`st00014` (Member $C buy) + (Past $C)<br>`st00016` (Member $C buy) |
| 13 | 2 | MIXED | `st00022` (Member $C work)<br>`st00054` (Location $e0:work $C) |
| 12 | 4 | MIXED | `st00023` (Agent $e0:give $C)<br>`st00026` (Recipient $e0:give $C)<br>`st00027` (Theme $e0:give $C)<br>`st00029` (Member $C give) |
| 12 | 2 | MIXED | `st00025` (Member $C physician)<br>`st00078` (Agent $C $x0:physician) |
| 12 | 3 | MIXED | `st00028` (Member $C discover)<br>`st00057` (Theme $e0:discover $C)<br>`st00087` (Agent $e0:discover $C) |
| 11 | 3 | MIXED | `st00036` (Member $C decide)<br>`st00040` (Agent $e0:decide $C)<br>`st00056` (Theme $e0:decide $C) |
| 11 | 2 | MIXED | `st00030` (Member $C board)<br>`st00058` (Agent $C $x0:board) |
| 11 | 3 | MIXED | `st00034` (Patient $e0:destroy $C)<br>`st00037` (Member $C destroy)<br>`st00063` (Agent $e0:destroy $C) |
| 11 | 4 | MIXED | `st00033` (Patient $e0:build $C)<br>`st00035` (Member $C build)<br>`st00077` (Member $C build) + (Past $C)<br>`st00086` (Agent $e0:build $C) |
| 11 | 16 | MIXED | `st00032` (Member $C school)<br>`st00079` (Agent $C $x0:school)<br>`st00127` (Beneficiary $C $x0:hall) + (Past $C)<br>`st00131` (Beneficiary $C $x0:hall) |
| 10 | 3 | MIXED | `st00039` (Agent $e0:answer $C)<br>`st00045` (Theme $e0:answer $C)<br>`st00047` (Member $C answer) |
| 10 | 2 | MIXED | `st00048` (Member $C begin)<br>`st00093` (Patient $e0:begin $C) |
| 10 | 4 | MIXED | `st00046` (Theme $e0:lend $C)<br>`st00049` (Member $C lend)<br>`st00053` (Agent $e0:lend $C)<br>`st00095` (Recipient $e0:lend $C) |

## AE interchangeability — corroborations of validated rules

| cos | jacc | pair | symbol pair |
|---|---|---|---|
| 1.00 | 0.00 | st00333~st00337 | acquire/purchase |
| 1.00 | 0.00 | st00399~st00402 | commence/start |
| 1.00 | 0.00 | st00409~st00414 | acquire/purchase |
| 1.00 | 0.00 | st00523~st00538 | acquire/purchase |
| 1.00 | 0.00 | st00585~st00600 | acquire/purchase |
| 0.99 | 0.00 | st00104~st00590 | commence/start |
| 0.98 | 0.07 | st00042~st00118 | big/large |
| 0.81 | 0.00 | st00093~st00399 | begin/commence |
| 0.81 | 0.00 | st00093~st00402 | begin/start |
| 0.80 | 0.00 | st00050~st00273 | need/require |

## AE interchangeability — novel candidates (no wave-1 rule)

| cos | jacc | docs | atoms A | atoms B | symbol pair |
|---|---|---|---|---|---|
| 1.00 | 0.00 | 5/5 | (Member $C archive) | (Member $C flood) | archive/flood |
| 1.00 | 0.00 | 5/5 | (Member $C archive) | (Member $C footbridge) | archive/footbridge |
| 1.00 | 0.00 | 5/5 | (Member $C archive) | (Member $C greenhouse) | archive/greenhouse |
| 1.00 | 0.00 | 5/5 | (Member $C archive) | (Member $C storm) | archive/storm |
| 1.00 | 0.00 | 5/5 | (Member $C bank) | (Member $C editor) | bank/editor |
| 1.00 | 0.00 | 5/5 | (Member $C bank) | (Member $C manuscript) | bank/manuscript |
| 1.00 | 0.00 | 5/5 | (Member $C bank) | (Member $C panel) | bank/panel |
| 1.00 | 0.00 | 5/5 | (Member $C bank) | (Member $C proposal) | bank/proposal |
| 1.00 | 0.00 | 5/5 | (Member $C editor) | (Member $C loan_application) | editor/loan_application |
| 1.00 | 0.00 | 5/5 | (Member $C editor) | (Member $C panel) | editor/panel |
| 1.00 | 0.00 | 5/5 | (Member $C editor) | (Member $C proposal) | editor/proposal |
| 1.00 | 0.00 | 5/5 | (Member $C fire) | (Member $C flood) | fire/flood |
| 1.00 | 0.00 | 5/5 | (Member $C fire) | (Member $C footbridge) | fire/footbridge |
| 1.00 | 0.00 | 5/5 | (Member $C fire) | (Member $C greenhouse) | fire/greenhouse |
| 1.00 | 0.00 | 5/5 | (Member $C fire) | (Member $C storm) | fire/storm |
| 1.00 | 0.00 | 5/5 | (Member $C flood) | (Member $C greenhouse) | flood/greenhouse |
| 1.00 | 0.00 | 5/5 | (Member $C flood) | (Member $C storm) | flood/storm |
| 1.00 | 0.00 | 5/5 | (Member $C footbridge) | (Member $C greenhouse) | footbridge/greenhouse |
| 1.00 | 0.00 | 5/5 | (Member $C footbridge) | (Member $C storm) | footbridge/storm |
| 1.00 | 0.00 | 5/5 | (Member $C loan_application) | (Member $C manuscript) | loan_application/manuscript |

## Interpretation (added after first read)

- **The corroboration channel is the wave-2 win**: validated lexical pairs re-discovered from
  distribution alone, no paraphrase labels — the signal §4.3.4 cannot produce on unpaired text.
- **The "novel" list is dominated by scenario siblings, not synonyms** (archive/flood/greenhouse/
  storm = the destruction family's domains; bank/editor = reject's domains). At 862 engineered
  graphs, distributional similarity cannot tell "same meaning" from "same engineered slot" —
  co-hyponym class discovery, not equivalence. This is the plan's frequency≠equivalence warning
  applying to similarity, and exactly why AE is a *generator* whose output must face the
  substitutability probe + control gauntlet before any routing. **No wave-2 signal is promoted
  without gauntlet round 2.**
- Degraded-mode caveat: 862 < the ~1k target; ~5-doc features are single-family artifacts.
  On natural corpora (Tier B scaled) the scenario-sibling failure mode weakens.

## Meta-node encoding decision (P4-start decision, examples in hand)

**Decision: parameterized** — `(<MetaHead> <fillers…>)`, per the plan's working lean: it matches
how compound terms already behave under the chainer (SEALING: nested args stay queryable via
unification), unlike fully-named (vocabulary explosion) or structured (barely consolidates).
Concretely, a validated MI group `{(Member $C <verb>), (Past $C)}` would collapse to
`(PastEv <verb> $C)`-style parameterized nodes ONLY via gauntlet-validated rules. Wave 2's MI
groups are the candidate inventory (113 non-containment groups); none applied yet — M3's
compression claim stays unclaimed until a meta-node rule survives the gauntlet, which is the
honest reading of MDL −39.
