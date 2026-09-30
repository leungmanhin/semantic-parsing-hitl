# Template pilot — set `dev`

- items: 10; arms: t26, ctl
- registry sha256 `d27e05ae5cd0ee9c` · generated prompt `2bcc941a89c3af38` · prompt.txt `2ed18b934e28afac` · emitter `c53b280a5430b8f2`

## Summary

| measure | t26 | ctl |
|---|---|---|
| raw files read | 30 | 30 |
| parse records | 30 | 30 |
| invalid records (R-checks) | 0 | 0 |
| R findings | — | — |
| C findings (validator, C7 off) | — | — |
| stability: items / pairs | 10 / 30 | 10 / 30 |
| stability: pairwise agreement | 0.9333 | 0.9333 |
| stability: unanimity | 0.9 | 0.9 |
| fidelity: parses scored vs golden | 30 | 30 |
| fidelity: parses claiming full coverage | 14 | 30 |
| fidelity: exact on claiming-full | 9 | 23 |
| fidelity: exact rate on claiming-full | 0.6429 | 0.7667 |
| fidelity: exact overall | 9 | 23 |
| precision (emitted ⊆ golden), mean | 0.8758 | 0.969 |
| precision on partial-coverage parses | 0.9524 | None |
| recall, mean | 0.635 | 0.9875 |
| soft Jaccard, mean | 0.6124 | 0.9593 |
| parses with atoms not in the golden | 8 | 7 |
| silent drops (claims full, golden atoms missing) | 2 | 3 |
| mismatch buckets | optional-atom 16, unclassified 5 | optional-atom 4, role-choice 3 |
| extra atoms by owning template | R03 5, V01 3, E03 2, O03 2 | ? 7 |

## Coverage (template arm)

- share of parses claiming full coverage: 0.4667
- unmapped codes: G00 16
- templates fired: O01 20, V01 20, E02 18, E01 15, E03 8, R03 8, J01 3, O03 2
- covered by composition or slot: C03 3, R02 2
- losses recorded by the emitter: —
