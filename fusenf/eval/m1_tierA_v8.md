# M1 — Parse stability (pilot)

- items: **29**, runs/item: 3
- `pairwise_agreement`: **0.931**
- `shape_agreement`: **0.931**
- `unanimity`: **0.897**
- `modal_share`: **0.966**
- `soft_jaccard_mismatch`: **0.611** (over 6 disagreeing pairs)

**Decision rule (metrics.md M1): parse corpora ONCE per item**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **not triggered**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `decomposition-depth` | 2 |
| `optional-atom` | 2 |
| `unclassified` | 2 |

> `unclassified` (2) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| decide | 1 | 0.333 |
| destroy | 1 | 0.333 |
| die | 1 | 0.333 |
| buy | 1 | 1.000 |
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
| tierA-000199 | decide | 0.33 | no | 0.67 |
| tierA-000232 | destroy | 0.33 | no | 0.67 |
| tierA-000258 | die | 0.33 | no | 0.67 |
| tierA-000025 | buy | 1.00 | yes | 1.00 |
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

---

## v8 vs v7 — the migration is stability-neutral

Same 29 items, same 3-runs-per-item design. v7 was measured under prompt sha `68d2695309ea`
(pre-migration); v8 under `38fc16af2089` (post-migration, new `Implication` syntax). Both canonicalized
with `fusenf-canon/3` — re-running v7 under `/3` reproduced its 0.931 exactly, so the canonicalizer
change is semantics-preserving and the migrated prompt is the only variable.

| | v7 (pre-migration) | **v8 (post-migration)** |
|---|---|---|
| `pairwise_agreement` | 0.931 | **0.931** |
| `unanimity` | 0.897 | **0.897** |
| `modal_share` | 0.966 | **0.966** |
| disagreeing pairs | 6 | **6** |
| expansion trigger | not triggered | **not triggered** |

An identical aggregate can still hide churn, so the paired per-item check: **27 of 29 unchanged**,
one better (`buy` 0.33 → 1.00), one worse (`die` 1.00 → 0.33). Net zero, and **both are items
already identified as noise-dominated** — `buy`'s split is the `(Ordinal … 2 sell|kiln)` outlier that
ran 8-of-9 one way, and `die` was explicitly not claimed as fixed in the v7 report ("its pooled score
was 0.40 … 3-of-3 here may be luck"). That caution proved correct.

**The negation fix survived the migration**: all three out-of-sample negation controls remain 1.000.

Persistently unstable: `decide` (infinitival complement) and `destroy` (compound-genus optionality),
both 0.33 in each measurement — singletons, not a class.

**Zero old-syntax leakage**: none of the 87 parses emitted `(Premises …)`/`(Conclusions …)`. The
migrated prompt produces the new form natively, and all 87 records validate clean on C1–C8.
