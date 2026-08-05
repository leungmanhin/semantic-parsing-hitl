# M1 — Parse stability (pilot)

- items: **26**, runs/item: 3
- `pairwise_agreement`: **0.846**
- `shape_agreement`: **0.846**
- `unanimity`: **0.769**
- `modal_share`: **0.923**
- `soft_jaccard_mismatch`: **0.542** (over 12 disagreeing pairs)

**Decision rule (metrics.md M1): parse corpora ONCE per item**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **TRIGGERED**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 6 |
| `optional-atom` | 4 |
| `decomposition-depth` | 2 |

> `unclassified` (6) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| allow | 1 | 0.333 |
| discover | 1 | 0.333 |
| cancel | 1 | 0.333 |
| decide | 1 | 0.333 |
| arrive | 1 | 0.333 |
| die | 1 | 0.333 |
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
| teach | 1 | 1.000 |
| lend | 1 | 1.000 |
| work_with | 1 | 1.000 |
| prop_large | 1 | 1.000 |
| prop_huge | 1 | 1.000 |
| prop_difficult | 1 | 1.000 |
| prop_exhausted | 1 | 1.000 |
| entity | 1 | 1.000 |
| entity2 | 1 | 1.000 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierA-000073 | allow | 0.33 | no | 0.67 |
| tierA-000130 | discover | 0.33 | no | 0.67 |
| tierA-000155 | cancel | 0.33 | no | 0.67 |
| tierA-000199 | decide | 0.33 | no | 0.67 |
| tierA-000248 | arrive | 0.33 | no | 0.67 |
| tierA-000258 | die | 0.33 | no | 0.67 |
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
| tierA-000294 | teach | 1.00 | yes | 1.00 |
| tierA-000298 | lend | 1.00 | yes | 1.00 |
| tierA-000312 | work_with | 1.00 | yes | 1.00 |
| tierA-000337 | prop_large | 1.00 | yes | 1.00 |
| tierA-000342 | prop_huge | 1.00 | yes | 1.00 |
| tierA-000355 | prop_difficult | 1.00 | yes | 1.00 |
| tierA-000372 | prop_exhausted | 1.00 | yes | 1.00 |
| tierA-000383 | entity | 1.00 | yes | 1.00 |
| tierA-000395 | entity2 | 1.00 | yes | 1.00 |
