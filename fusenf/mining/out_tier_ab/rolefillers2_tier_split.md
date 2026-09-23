# §4.3.2 faithful slot pairs on `out_tier_ab` — tier / control split (block word_0.85 (jsd))

Per passing slot pair: the occurrences behind each slot by tier, and for Tier A by designed role (paraphrase variant vs control kind). `swap_share` = share of the two slots' occurrences that come from participant-swap controls (the same nouns placed in both roles by design). A reading of the signals files, never a filter.

## Buckets over the passing pairs

| bucket | pairs |
|---|---|
| tierA-only | 15 |
| tierB-only | 0 |
| cross | 15 |
| total | 30 |

- same-class / different-role pairs with any participant-swap occurrences (`swap_role_pairs`: the swap controls put the same nouns in both roles, which is what makes the two slots indistinguishable): 2 of 2; pairs touched by any control variant: 26

## Passing pairs

| subtype | slot A | slot B | n | JSD | bucket | occurrences by tier | by designed role | swap_share | control_share | example |
|---|---|---|---|---|---|---|---|---|---|---|
| cross-both | borrow.Agent | lend.Recipient | 3 | 0.113 | tierA-only | tierA 13 | paraphrase 9 participant-swap 2 quantity-change 2 | 0.15 | 0.31 | The gallery borrows a painting from the museum. |
| cross-both | borrow.Source | lend.Agent | 3 | 0.113 | tierA-only | tierA 13 | paraphrase 9 participant-swap 2 quantity-change 2 | 0.15 | 0.31 | The gallery borrows a painting from the museum. |
| cross-both | buy.Agent | sell.Recipient | 4 | 0.208 | cross | tierA 18 tierB 3 | natural 3 paraphrase 12 participant-swap 3 quantity-change 3 | 0.14 | 0.29 | The depot bought two forklifts. |
| cross-both | learn.Agent | teach.Recipient | 3 | 0.157 | cross | tierA 13 tierB 1 | modality-shift 2 natural 1 paraphrase 9 participant-swap 2 | 0.14 | 0.29 | The squad learns a drill from a coach. |
| cross-both | learn.Source | teach.Agent | 3 | 0.196 | cross | tierA 13 tierB 2 | modality-shift 2 natural 2 paraphrase 9 participant-swap 2 | 0.13 | 0.27 | The squad learns a drill from a coach. |
| cross-both | acquire.Agent | sell.Recipient | 4 | 0.0 | tierA-only | tierA 8 | paraphrase 8 | 0.0 | 0.0 | The depot acquired two forklifts. |
| cross-both | purchase.Agent | sell.Recipient | 4 | 0.0 | tierA-only | tierA 8 | paraphrase 8 | 0.0 | 0.0 | The depot purchased two forklifts. |
| cross-event | reject.Agent | turn_down.Agent | 3 | 0.138 | tierA-only | tierA 11 | paraphrase 9 participant-swap 2 | 0.18 | 0.18 | A panel rejects the proposal. |
| cross-event | reject.Theme | turn_down.Theme | 3 | 0.138 | tierA-only | tierA 11 | paraphrase 9 participant-swap 2 | 0.18 | 0.18 | A bank rejects the loan application. |
| cross-event | borrow.Theme | lend.Theme | 3 | 0.003 | tierA-only | tierA 13 | paraphrase 9 participant-swap 2 quantity-change 2 | 0.15 | 0.31 | Ravi borrows a ladder from a neighbour. |
| cross-event | acquire.Agent | buy.Agent | 4 | 0.208 | cross | tierA 18 tierB 3 | natural 3 paraphrase 12 participant-swap 3 quantity-change 3 | 0.14 | 0.29 | The depot acquired two forklifts. |
| cross-event | buy.Agent | purchase.Agent | 4 | 0.208 | cross | tierA 18 tierB 3 | natural 3 paraphrase 12 participant-swap 3 quantity-change 3 | 0.14 | 0.29 | The depot bought two forklifts. |
| cross-event | acquire.Theme | buy.Theme | 4 | 0.255 | cross | tierA 18 tierB 5 | natural 5 paraphrase 12 participant-swap 3 quantity-change 3 | 0.13 | 0.26 | The depot acquired two forklifts. |
| cross-event | decide.Theme | decision.Theme | 6 | 0.157 | cross | tierA 19 tierB 4 | modality-shift 3 natural 4 paraphrase 14 participant-swap 2 | 0.09 | 0.22 | A committee decides on a new roof. |
| cross-event | abandon.Agent | give_up.Agent | 4 | 0.143 | cross | tierA 11 tierB 1 | modality-shift 2 natural 1 paraphrase 9 | 0.0 | 0.17 | Two climbers abandon the north route. |
| cross-event | abandon.Theme | give_up.Theme | 4 | 0.143 | cross | tierA 11 tierB 1 | modality-shift 2 natural 1 paraphrase 9 | 0.0 | 0.17 | A firm abandons its tender. |
| cross-event | acquire.Agent | purchase.Agent | 4 | 0.0 | tierA-only | tierA 8 | paraphrase 8 | 0.0 | 0.0 | The depot acquired two forklifts. |
| cross-event | acquire.Theme | purchase.Theme | 4 | 0.108 | cross | tierA 8 tierB 1 | natural 1 paraphrase 8 | 0.0 | 0.0 | The depot acquired two forklifts. |
| cross-event | allow.Agent | permit.Agent | 3 | 0.021 | tierA-only | tierA 7 | modality-shift 2 paraphrase 5 | 0.0 | 0.29 | A warden might allow visitors on Sundays. |
| cross-event | allow.Theme | permit.Theme | 3 | 0.021 | tierA-only | tierA 7 | modality-shift 2 paraphrase 5 | 0.0 | 0.29 | A warden might allow visitors on Sundays. |
| cross-event | begin.Patient | commence.Patient | 4 | 0.221 | cross | tierA 11 tierB 4 | modality-shift 3 natural 4 paraphrase 8 | 0.0 | 0.2 | A hearing begins on Monday morning. |
| cross-event | begin.Time | end.Time | 3 | 0.208 | cross | tierA 10 tierB 5 | antonym 4 modality-shift 2 natural 5 paraphrase 4 | 0.0 | 0.4 | A hearing begins on Monday morning. |
| cross-event | begin.Time | start.Time | 3 | 0.208 | cross | tierA 10 tierB 5 | modality-shift 2 natural 5 paraphrase 8 | 0.0 | 0.13 | A hearing begins on Monday morning. |
| cross-event | call_off.Agent | cancel.Agent | 3 | 0.064 | tierA-only | tierA 12 | antonym 1 modality-shift 2 paraphrase 9 | 0.0 | 0.25 | An airline calls off the evening flight. |
| cross-event | call_off.Patient | cancel.Patient | 3 | 0.247 | cross | tierA 9 tierB 1 | modality-shift 2 natural 1 paraphrase 7 | 0.0 | 0.2 | A tutor calls off the afternoon session. |
| cross-event | need.Holder | require.Holder | 3 | 0.006 | tierA-only | tierA 11 | modality-shift 1 paraphrase 8 quantity-change 2 | 0.0 | 0.27 | A lathe needs monthly servicing. |
| cross-event | postpone.Agent | put_off.Agent | 3 | 0.007 | tierA-only | tierA 10 | modality-shift 2 paraphrase 8 | 0.0 | 0.2 | A club postpones the tournament. |
| cross-event | postpone.Theme | put_off.Theme | 3 | 0.007 | tierA-only | tierA 10 | modality-shift 2 paraphrase 8 | 0.0 | 0.2 | A ferry postpones its departure. |
| cross-role | repair.Agent | repair.Patient | 8 | 0.116 | cross | tierA 16 tierB 1 | natural 1 paraphrase 10 participant-swap 6 | 0.35 | 0.35 | A seized gearbox repaired the mechanic. |
| cross-role | discover.Experiencer | discover.Stimulus | 3 | 0.082 | tierA-only | tierA 6 | paraphrase 4 participant-swap 2 | 0.33 | 0.33 | An error discovers an auditor in the ledger. |

## All blocks (signals per block; swap_role_pairs; control-touched)

| block | signals | swap_role_pairs | control-touched |
|---|---|---|---|
| cosine_subtree_0.80 | 61 | 5 | 48 |
| cosine_subtree_0.85 | 59 | 5 | 51 |
| cosine_subtree_0.90 | 60 | 5 | 51 |
| cosine_subtree_0.95 | 63 | 5 | 54 |
| cosine_subtree_1.00 | 63 | 5 | 54 |
| cosine_word_0.80 | 62 | 5 | 48 |
| cosine_word_0.85 | 60 | 5 | 51 |
| cosine_word_0.90 | 60 | 5 | 51 |
| cosine_word_0.95 | 64 | 5 | 55 |
| cosine_word_1.00 | 64 | 5 | 55 |
| subtree_0.80 | 28 | 2 | 24 |
| subtree_0.85 | 30 | 2 | 26 |
| subtree_0.90 | 30 | 2 | 26 |
| subtree_0.95 | 31 | 2 | 27 |
| subtree_1.00 | 30 | 2 | 26 |
| word_0.80 | 28 | 2 | 24 |
| word_0.85 | 30 | 2 | 26 |
| word_0.90 | 30 | 2 | 26 |
| word_0.95 | 31 | 2 | 27 |
| word_1.00 | 31 | 2 | 27 |
