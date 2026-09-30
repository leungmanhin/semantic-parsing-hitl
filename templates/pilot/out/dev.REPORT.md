# Template pilot — set `dev`

- items: 10; arms: t26, ctl
- registry sha256 `4f20313721ec872a` · generated prompt `927aee64e15c450a` · prompt.txt `2ed18b934e28afac` · emitter `c53b280a5430b8f2`

## Summary

| measure | t26 | ctl |
|---|---|---|
| raw files read | 30 | 30 |
| parse records | 30 | 30 |
| invalid records (R-checks) | 0 | 0 |
| R findings | — | — |
| C findings (validator, C7 off) | — | — |
| stability: items / pairs | 10 / 30 | 10 / 30 |
| stability: pairwise agreement | 1.0 | 0.9333 |
| stability: unanimity | 1.0 | 0.9 |
| fidelity: parses scored vs golden | 30 | 30 |
| fidelity: parses claiming full coverage | 15 | 30 |
| fidelity: exact on claiming-full | 12 | 23 |
| fidelity: exact rate on claiming-full | 0.8 | 0.7667 |
| fidelity: exact overall | 12 | 23 |
| precision (emitted ⊆ golden), mean | 0.9643 | 0.969 |
| precision on partial-coverage parses | 0.9524 | None |
| recall, mean | 0.735 | 0.9875 |
| soft Jaccard, mean | 0.7124 | 0.9593 |
| parses with atoms not in the golden | 6 | 7 |
| silent drops (claims full, golden atoms missing) | 0 | 3 |
| mismatch buckets | optional-atom 15, unclassified 3 | optional-atom 4, role-choice 3 |
| extra atoms by owning template | R03 3, V01 3 | ? 7 |

## Coverage (template arm)

- share of parses claiming full coverage: 0.5
- unmapped codes: G00 15
- templates fired: E02 18, O01 18, V01 18, E01 15, E03 6, R03 6, J01 3, R01 3
- covered by composition or slot: C03 6, R02 3
- losses recorded by the emitter: —
