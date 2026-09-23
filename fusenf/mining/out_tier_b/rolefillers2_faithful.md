# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | out_tier_b/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): Jensen-Shannon divergence <= 0.3 (0 = identical, 1 = disjoint) with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 0 signals

## Signals across the dial (gate: JSD <= 0.30)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) | JSD <= 0.40 (sensitivity; event) |
|---|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 0 | 0 | 0 | 0 | — | — |
| faithful word | 0.80 | 1566 (773) | 0 | 0 | 0 | 0 | 2+1+3 / 0+0+0 | 0+1+0 |
| faithful word | 0.85 | 2084 (652) | 0 | 0 | 0 | 0 | 0+1+1 / 0+0+0 | 0+1+0 |
| faithful word | 0.90 | 2541 (344) | 0 | 0 | 0 | 0 | 0+1+1 / 0+0+0 | 0+1+0 |
| faithful word | 0.95 | 2831 (78) | 0 | 0 | 0 | 0 | 0+1+1 / 0+0+0 | 0+1+0 |
| faithful word | 1.00 | 2909 (0) | 0 | 0 | 0 | 0 | 0+1+1 / 0+0+0 | 0+1+0 |
| faithful subtree | 0.80 | 1566 (773) | 0 | 0 | 0 | 0 | 2+0+3 / 0+0+0 | 0+0+0 |
| faithful subtree | 0.85 | 2084 (652) | 0 | 0 | 0 | 0 | 0+0+1 / 0+0+0 | 0+0+0 |
| faithful subtree | 0.90 | 2541 (344) | 0 | 0 | 0 | 0 | 1+0+1 / 0+0+0 | 0+0+0 |
| faithful subtree | 0.95 | 2831 (78) | 0 | 0 | 0 | 0 | 1+0+1 / 0+0+0 | 0+0+0 |
| faithful subtree | 1.00 | 2909 (0) | 0 | 0 | 0 | 0 | 1+0+1 / 0+0+0 | 0+0+0 |

## faithful word @ cluster cos 0.80

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful word @ cluster cos 0.85

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful word @ cluster cos 0.90

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful word @ cluster cos 0.95

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful word @ cluster cos 1.00

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 0.80

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 0.85

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 0.90

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 0.95

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 1.00

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
