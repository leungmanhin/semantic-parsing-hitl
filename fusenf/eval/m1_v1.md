# M1 — Parse stability (pilot)

- items: **20**, runs/item: 3
- `pairwise_agreement`: **0.800**
- `shape_agreement`: **0.800**
- `unanimity`: **0.750**
- `modal_share`: **0.883**
- `soft_jaccard_mismatch`: **0.662** (over 12 disagreeing pairs)

**Decision rule (metrics.md M1): parse corpora ONCE per item**

Expansion trigger (pairwise in [0.70, 0.90] -> expand to 60x5): **TRIGGERED**

## Variance attribution (mechanical)

| bucket | pairs |
|---|---|
| `unclassified` | 8 |
| `role-choice` | 2 |
| `optional-atom` | 2 |

> `unclassified` (8) needs the agent reviewer — these are the semantic buckets (genuine ambiguity vs a convention gap) that no program can separate.

## Per-family (lowest first — anything < 0.50 goes to the prompt loop before P2)

| family | items | pairwise |
|---|---|---|
| coreference | 1 | 0.000 |
| attitude | 1 | 0.000 |
| event-transitive | 1 | 0.333 |
| deontic | 1 | 0.333 |
| quant-scope | 1 | 0.333 |
| categorical | 1 | 1.000 |
| event-ditrans | 1 | 1.000 |
| tense-passive | 1 | 1.000 |
| modality-epist | 1 | 1.000 |
| negation | 1 | 1.000 |
| generic | 1 | 1.000 |
| cardinality | 1 | 1.000 |
| comparative | 1 | 1.000 |
| measure | 1 | 1.000 |
| time | 1 | 1.000 |
| coordination | 1 | 1.000 |
| disjunction | 1 | 1.000 |
| connective | 1 | 1.000 |
| focus | 1 | 1.000 |
| possession-part | 1 | 1.000 |

## Per-item

| id | family | pairwise | unanimous | modal |
|---|---|---|---|---|
| pilot-000016 | coreference | 0.00 | no | 0.33 |
| pilot-000019 | attitude | 0.00 | no | 0.33 |
| pilot-000002 | event-transitive | 0.33 | no | 0.67 |
| pilot-000006 | deontic | 0.33 | no | 0.67 |
| pilot-000009 | quant-scope | 0.33 | no | 0.67 |
| pilot-000001 | categorical | 1.00 | yes | 1.00 |
| pilot-000003 | event-ditrans | 1.00 | yes | 1.00 |
| pilot-000004 | tense-passive | 1.00 | yes | 1.00 |
| pilot-000005 | modality-epist | 1.00 | yes | 1.00 |
| pilot-000007 | negation | 1.00 | yes | 1.00 |
| pilot-000008 | generic | 1.00 | yes | 1.00 |
| pilot-000010 | cardinality | 1.00 | yes | 1.00 |
| pilot-000011 | comparative | 1.00 | yes | 1.00 |
| pilot-000012 | measure | 1.00 | yes | 1.00 |
| pilot-000013 | time | 1.00 | yes | 1.00 |
| pilot-000014 | coordination | 1.00 | yes | 1.00 |
| pilot-000015 | disjunction | 1.00 | yes | 1.00 |
| pilot-000017 | connective | 1.00 | yes | 1.00 |
| pilot-000018 | focus | 1.00 | yes | 1.00 |
| pilot-000020 | possession-part | 1.00 | yes | 1.00 |
