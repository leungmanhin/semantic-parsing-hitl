# M1 — Parse stability (pilot)

- items: **29**, runs/item: 3
- `pairwise_agreement`: **0.931**
- `shape_agreement`: **0.931**
- `unanimity`: **0.897**
- `modal_share`: **0.966**
- `soft_jaccard_mismatch`: **0.737** (over 6 disagreeing pairs)

**Decision rule (metrics.md M1): parse corpora ONCE per item**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **not triggered**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 4 |
| `optional-atom` | 2 |

> `unclassified` (4) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| buy | 1 | 0.333 |
| decide | 1 | 0.333 |
| destroy | 1 | 0.333 |
| repair | 1 | 1.000 |
| begin | 1 | 1.000 |
| allow | 1 | 1.000 |
| require | 1 | 1.000 |
| abandon | 1 | 1.000 |
| postpone | 1 | 1.000 |
| discover | 1 | 1.000 |
| cancel | 1 | 1.000 |
| reject | 1 | 1.000 |
| walk | 1 | 1.000 |
| answer | 1 | 1.000 |
| arrive | 1 | 1.000 |
| die | 1 | 1.000 |
| give | 1 | 1.000 |
| teach | 1 | 1.000 |
| lend | 1 | 1.000 |
| work_with | 1 | 1.000 |
| prop_large | 1 | 1.000 |
| prop_huge | 1 | 1.000 |
| prop_difficult | 1 | 1.000 |
| prop_exhausted | 2 | 1.000 |
| entity | 2 | 1.000 |
| entity2 | 2 | 1.000 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| tierA-000025 | buy | 0.33 | no | 0.67 |
| tierA-000199 | decide | 0.33 | no | 0.67 |
| tierA-000232 | destroy | 0.33 | no | 0.67 |
| tierA-000037 | repair | 1.00 | yes | 1.00 |
| tierA-000052 | begin | 1.00 | yes | 1.00 |
| tierA-000073 | allow | 1.00 | yes | 1.00 |
| tierA-000086 | require | 1.00 | yes | 1.00 |
| tierA-000104 | abandon | 1.00 | yes | 1.00 |
| tierA-000126 | postpone | 1.00 | yes | 1.00 |
| tierA-000130 | discover | 1.00 | yes | 1.00 |
| tierA-000155 | cancel | 1.00 | yes | 1.00 |
| tierA-000168 | reject | 1.00 | yes | 1.00 |
| tierA-000177 | walk | 1.00 | yes | 1.00 |
| tierA-000214 | answer | 1.00 | yes | 1.00 |
| tierA-000248 | arrive | 1.00 | yes | 1.00 |
| tierA-000258 | die | 1.00 | yes | 1.00 |
| tierA-000277 | give | 1.00 | yes | 1.00 |
| tierA-000294 | teach | 1.00 | yes | 1.00 |
| tierA-000298 | lend | 1.00 | yes | 1.00 |
| tierA-000312 | work_with | 1.00 | yes | 1.00 |
| tierA-000337 | prop_large | 1.00 | yes | 1.00 |
| tierA-000342 | prop_huge | 1.00 | yes | 1.00 |
| tierA-000355 | prop_difficult | 1.00 | yes | 1.00 |
| tierA-000366 | prop_exhausted | 1.00 | yes | 1.00 |
| tierA-000372 | prop_exhausted | 1.00 | yes | 1.00 |
| tierA-000379 | entity | 1.00 | yes | 1.00 |
| tierA-000383 | entity | 1.00 | yes | 1.00 |
| tierA-000395 | entity2 | 1.00 | yes | 1.00 |
| tierA-000402 | entity2 | 1.00 | yes | 1.00 |
