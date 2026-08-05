# M1 — Parse stability (pilot)

- items: **26**, runs/item: 6
- `pairwise_agreement`: **0.856**
- `shape_agreement`: **0.856**
- `unanimity`: **0.692**
- `modal_share`: **0.917**
- `soft_jaccard_mismatch`: **0.391** (over 56 disagreeing pairs)

**Decision rule (metrics.md M1): parse corpora ONCE per item**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **TRIGGERED**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 29 |
| `decomposition-depth` | 16 |
| `optional-atom` | 8 |
| `role-choice` | 3 |

> `unclassified` (29) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| allow | 1 | 0.267 |
| decide | 1 | 0.267 |
| die | 1 | 0.400 |
| discover | 1 | 0.667 |
| cancel | 1 | 0.667 |
| arrive | 1 | 0.667 |
| teach | 1 | 0.667 |
| entity | 1 | 0.667 |
| buy | 1 | 1.000 |
| repair | 1 | 1.000 |
| begin | 1 | 1.000 |
| require | 1 | 1.000 |
| abandon | 1 | 1.000 |
| postpone | 1 | 1.000 |
| reject | 1 | 1.000 |
| walk | 1 | 1.000 |
| answer | 1 | 1.000 |
| destroy | 1 | 1.000 |
| give | 1 | 1.000 |
| lend | 1 | 1.000 |
| work_with | 1 | 1.000 |
| prop_large | 1 | 1.000 |
| prop_huge | 1 | 1.000 |
| prop_difficult | 1 | 1.000 |
| prop_exhausted | 1 | 1.000 |
| entity2 | 1 | 1.000 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierA-000073 | allow | 0.27 | no | 0.50 |
| tierA-000199 | decide | 0.27 | no | 0.50 |
| tierA-000258 | die | 0.40 | no | 0.67 |
| tierA-000130 | discover | 0.67 | no | 0.83 |
| tierA-000155 | cancel | 0.67 | no | 0.83 |
| tierA-000248 | arrive | 0.67 | no | 0.83 |
| tierA-000294 | teach | 0.67 | no | 0.83 |
| tierA-000383 | entity | 0.67 | no | 0.83 |
| tierA-000025 | buy | 1.00 | yes | 1.00 |
| tierA-000037 | repair | 1.00 | yes | 1.00 |
| tierA-000052 | begin | 1.00 | yes | 1.00 |
| tierA-000086 | require | 1.00 | yes | 1.00 |
| tierA-000104 | abandon | 1.00 | yes | 1.00 |
| tierA-000126 | postpone | 1.00 | yes | 1.00 |
| tierA-000168 | reject | 1.00 | yes | 1.00 |
| tierA-000177 | walk | 1.00 | yes | 1.00 |
| tierA-000214 | answer | 1.00 | yes | 1.00 |
| tierA-000232 | destroy | 1.00 | yes | 1.00 |
| tierA-000277 | give | 1.00 | yes | 1.00 |
| tierA-000298 | lend | 1.00 | yes | 1.00 |
| tierA-000312 | work_with | 1.00 | yes | 1.00 |
| tierA-000337 | prop_large | 1.00 | yes | 1.00 |
| tierA-000342 | prop_huge | 1.00 | yes | 1.00 |
| tierA-000355 | prop_difficult | 1.00 | yes | 1.00 |
| tierA-000372 | prop_exhausted | 1.00 | yes | 1.00 |
| tierA-000395 | entity2 | 1.00 | yes | 1.00 |
