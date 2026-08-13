# M1 — Parse stability (pilot)

- items: **60**, runs/item: 2
- `pairwise_agreement`: **0.433**
- `shape_agreement`: **0.433**
- `unanimity`: **0.433**
- `modal_share`: **0.717**
- `soft_jaccard_mismatch`: **0.635** (over 34 disagreeing pairs)

**Decision rule (metrics.md M1): STOP — fix the prompt before P2 scales**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **not triggered**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 18 |
| `decomposition-depth` | 8 |
| `role-choice` | 4 |
| `optional-atom` | 4 |

> `unclassified` (18) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| ? | 60 | 0.433 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierC-000012 | ? | 0.00 | no | 0.50 |
| tierC-000025 | ? | 0.00 | no | 0.50 |
| tierC-000043 | ? | 0.00 | no | 0.50 |
| tierC-000045 | ? | 0.00 | no | 0.50 |
| tierC-000046 | ? | 0.00 | no | 0.50 |
| tierC-000104 | ? | 0.00 | no | 0.50 |
| tierC-000106 | ? | 0.00 | no | 0.50 |
| tierC-000111 | ? | 0.00 | no | 0.50 |
| tierC-000113 | ? | 0.00 | no | 0.50 |
| tierC-000144 | ? | 0.00 | no | 0.50 |
| tierC-000147 | ? | 0.00 | no | 0.50 |
| tierC-000152 | ? | 0.00 | no | 0.50 |
| tierC-000154 | ? | 0.00 | no | 0.50 |
| tierC-000160 | ? | 0.00 | no | 0.50 |
| tierC-000168 | ? | 0.00 | no | 0.50 |
| tierC-000188 | ? | 0.00 | no | 0.50 |
| tierC-000190 | ? | 0.00 | no | 0.50 |
| tierC-000196 | ? | 0.00 | no | 0.50 |
| tierC-000197 | ? | 0.00 | no | 0.50 |
| tierC-000204 | ? | 0.00 | no | 0.50 |
| tierC-000206 | ? | 0.00 | no | 0.50 |
| tierC-000211 | ? | 0.00 | no | 0.50 |
| tierC-000231 | ? | 0.00 | no | 0.50 |
| tierC-000241 | ? | 0.00 | no | 0.50 |
| tierC-000258 | ? | 0.00 | no | 0.50 |
| tierC-000262 | ? | 0.00 | no | 0.50 |
| tierC-000270 | ? | 0.00 | no | 0.50 |
| tierC-000282 | ? | 0.00 | no | 0.50 |
| tierC-000302 | ? | 0.00 | no | 0.50 |
| tierC-000333 | ? | 0.00 | no | 0.50 |
| tierC-000340 | ? | 0.00 | no | 0.50 |
| tierC-000349 | ? | 0.00 | no | 0.50 |
| tierC-000351 | ? | 0.00 | no | 0.50 |
| tierC-000356 | ? | 0.00 | no | 0.50 |
| tierC-000028 | ? | 1.00 | yes | 1.00 |
| tierC-000031 | ? | 1.00 | yes | 1.00 |
| tierC-000055 | ? | 1.00 | yes | 1.00 |
| tierC-000065 | ? | 1.00 | yes | 1.00 |
| tierC-000076 | ? | 1.00 | yes | 1.00 |
| tierC-000089 | ? | 1.00 | yes | 1.00 |
| tierC-000105 | ? | 1.00 | yes | 1.00 |
| tierC-000128 | ? | 1.00 | yes | 1.00 |
| tierC-000143 | ? | 1.00 | yes | 1.00 |
| tierC-000172 | ? | 1.00 | yes | 1.00 |
| tierC-000209 | ? | 1.00 | yes | 1.00 |
| tierC-000214 | ? | 1.00 | yes | 1.00 |
| tierC-000215 | ? | 1.00 | yes | 1.00 |
| tierC-000226 | ? | 1.00 | yes | 1.00 |
| tierC-000240 | ? | 1.00 | yes | 1.00 |
| tierC-000260 | ? | 1.00 | yes | 1.00 |
| tierC-000286 | ? | 1.00 | yes | 1.00 |
| tierC-000296 | ? | 1.00 | yes | 1.00 |
| tierC-000308 | ? | 1.00 | yes | 1.00 |
| tierC-000309 | ? | 1.00 | yes | 1.00 |
| tierC-000310 | ? | 1.00 | yes | 1.00 |
| tierC-000320 | ? | 1.00 | yes | 1.00 |
| tierC-000325 | ? | 1.00 | yes | 1.00 |
| tierC-000327 | ? | 1.00 | yes | 1.00 |
| tierC-000337 | ? | 1.00 | yes | 1.00 |
| tierC-000343 | ? | 1.00 | yes | 1.00 |
