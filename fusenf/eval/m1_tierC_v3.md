# M1 — Parse stability (pilot)

- items: **60**, runs/item: 2
- `pairwise_agreement`: **0.483**
- `shape_agreement`: **0.483**
- `unanimity`: **0.483**
- `modal_share`: **0.742**
- `soft_jaccard_mismatch`: **0.580** (over 31 disagreeing pairs)

**Decision rule (metrics.md M1): STOP — fix the prompt before P2 scales**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **not triggered**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 12 |
| `decomposition-depth` | 9 |
| `optional-atom` | 7 |
| `role-choice` | 2 |
| `attachment` | 1 |

> `unclassified` (12) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| ? | 60 | 0.483 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierC-000012 | ? | 0.00 | no | 0.50 |
| tierC-000028 | ? | 0.00 | no | 0.50 |
| tierC-000043 | ? | 0.00 | no | 0.50 |
| tierC-000055 | ? | 0.00 | no | 0.50 |
| tierC-000065 | ? | 0.00 | no | 0.50 |
| tierC-000076 | ? | 0.00 | no | 0.50 |
| tierC-000111 | ? | 0.00 | no | 0.50 |
| tierC-000143 | ? | 0.00 | no | 0.50 |
| tierC-000147 | ? | 0.00 | no | 0.50 |
| tierC-000152 | ? | 0.00 | no | 0.50 |
| tierC-000168 | ? | 0.00 | no | 0.50 |
| tierC-000172 | ? | 0.00 | no | 0.50 |
| tierC-000188 | ? | 0.00 | no | 0.50 |
| tierC-000190 | ? | 0.00 | no | 0.50 |
| tierC-000196 | ? | 0.00 | no | 0.50 |
| tierC-000197 | ? | 0.00 | no | 0.50 |
| tierC-000204 | ? | 0.00 | no | 0.50 |
| tierC-000206 | ? | 0.00 | no | 0.50 |
| tierC-000209 | ? | 0.00 | no | 0.50 |
| tierC-000211 | ? | 0.00 | no | 0.50 |
| tierC-000241 | ? | 0.00 | no | 0.50 |
| tierC-000262 | ? | 0.00 | no | 0.50 |
| tierC-000282 | ? | 0.00 | no | 0.50 |
| tierC-000296 | ? | 0.00 | no | 0.50 |
| tierC-000308 | ? | 0.00 | no | 0.50 |
| tierC-000309 | ? | 0.00 | no | 0.50 |
| tierC-000333 | ? | 0.00 | no | 0.50 |
| tierC-000340 | ? | 0.00 | no | 0.50 |
| tierC-000349 | ? | 0.00 | no | 0.50 |
| tierC-000351 | ? | 0.00 | no | 0.50 |
| tierC-000356 | ? | 0.00 | no | 0.50 |
| tierC-000025 | ? | 1.00 | yes | 1.00 |
| tierC-000031 | ? | 1.00 | yes | 1.00 |
| tierC-000045 | ? | 1.00 | yes | 1.00 |
| tierC-000046 | ? | 1.00 | yes | 1.00 |
| tierC-000089 | ? | 1.00 | yes | 1.00 |
| tierC-000104 | ? | 1.00 | yes | 1.00 |
| tierC-000105 | ? | 1.00 | yes | 1.00 |
| tierC-000106 | ? | 1.00 | yes | 1.00 |
| tierC-000113 | ? | 1.00 | yes | 1.00 |
| tierC-000128 | ? | 1.00 | yes | 1.00 |
| tierC-000144 | ? | 1.00 | yes | 1.00 |
| tierC-000154 | ? | 1.00 | yes | 1.00 |
| tierC-000160 | ? | 1.00 | yes | 1.00 |
| tierC-000214 | ? | 1.00 | yes | 1.00 |
| tierC-000215 | ? | 1.00 | yes | 1.00 |
| tierC-000226 | ? | 1.00 | yes | 1.00 |
| tierC-000231 | ? | 1.00 | yes | 1.00 |
| tierC-000240 | ? | 1.00 | yes | 1.00 |
| tierC-000258 | ? | 1.00 | yes | 1.00 |
| tierC-000260 | ? | 1.00 | yes | 1.00 |
| tierC-000270 | ? | 1.00 | yes | 1.00 |
| tierC-000286 | ? | 1.00 | yes | 1.00 |
| tierC-000302 | ? | 1.00 | yes | 1.00 |
| tierC-000310 | ? | 1.00 | yes | 1.00 |
| tierC-000320 | ? | 1.00 | yes | 1.00 |
| tierC-000325 | ? | 1.00 | yes | 1.00 |
| tierC-000327 | ? | 1.00 | yes | 1.00 |
| tierC-000337 | ? | 1.00 | yes | 1.00 |
| tierC-000343 | ? | 1.00 | yes | 1.00 |
