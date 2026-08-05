# M1 — Parse stability (pilot)

- items: **26**, runs/item: 3
- `pairwise_agreement`: **0.654**
- `shape_agreement`: **0.654**
- `unanimity`: **0.538**
- `modal_share`: **0.808**
- `soft_jaccard_mismatch`: **0.503** (over 27 disagreeing pairs)

**Decision rule (metrics.md M1): MAJORITY-OF-3 required for corpus records**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **not triggered**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `optional-atom` | 12 |
| `unclassified` | 7 |
| `decomposition-depth` | 6 |
| `role-choice` | 2 |

> `unclassified` (7) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| die | 1 | 0.000 |
| teach | 1 | 0.000 |
| prop_exhausted | 1 | 0.000 |
| begin | 1 | 0.333 |
| decide | 1 | 0.333 |
| destroy | 1 | 0.333 |
| arrive | 1 | 0.333 |
| give | 1 | 0.333 |
| lend | 1 | 0.333 |
| work_with | 1 | 0.333 |
| entity | 1 | 0.333 |
| entity2 | 1 | 0.333 |
| buy | 1 | 1.000 |
| repair | 1 | 1.000 |
| allow | 1 | 1.000 |
| require | 1 | 1.000 |
| abandon | 1 | 1.000 |
| postpone | 1 | 1.000 |
| discover | 1 | 1.000 |
| cancel | 1 | 1.000 |
| reject | 1 | 1.000 |
| walk | 1 | 1.000 |
| answer | 1 | 1.000 |
| prop_large | 1 | 1.000 |
| prop_huge | 1 | 1.000 |
| prop_difficult | 1 | 1.000 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierA-000258 | die | 0.00 | no | 0.33 |
| tierA-000294 | teach | 0.00 | no | 0.33 |
| tierA-000372 | prop_exhausted | 0.00 | no | 0.33 |
| tierA-000052 | begin | 0.33 | no | 0.67 |
| tierA-000199 | decide | 0.33 | no | 0.67 |
| tierA-000232 | destroy | 0.33 | no | 0.67 |
| tierA-000248 | arrive | 0.33 | no | 0.67 |
| tierA-000277 | give | 0.33 | no | 0.67 |
| tierA-000298 | lend | 0.33 | no | 0.67 |
| tierA-000312 | work_with | 0.33 | no | 0.67 |
| tierA-000383 | entity | 0.33 | no | 0.67 |
| tierA-000395 | entity2 | 0.33 | no | 0.67 |
| tierA-000025 | buy | 1.00 | yes | 1.00 |
| tierA-000037 | repair | 1.00 | yes | 1.00 |
| tierA-000073 | allow | 1.00 | yes | 1.00 |
| tierA-000086 | require | 1.00 | yes | 1.00 |
| tierA-000104 | abandon | 1.00 | yes | 1.00 |
| tierA-000126 | postpone | 1.00 | yes | 1.00 |
| tierA-000130 | discover | 1.00 | yes | 1.00 |
| tierA-000155 | cancel | 1.00 | yes | 1.00 |
| tierA-000168 | reject | 1.00 | yes | 1.00 |
| tierA-000177 | walk | 1.00 | yes | 1.00 |
| tierA-000214 | answer | 1.00 | yes | 1.00 |
| tierA-000337 | prop_large | 1.00 | yes | 1.00 |
| tierA-000342 | prop_huge | 1.00 | yes | 1.00 |
| tierA-000355 | prop_difficult | 1.00 | yes | 1.00 |
