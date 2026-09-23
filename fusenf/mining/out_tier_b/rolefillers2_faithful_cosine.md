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
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): cosine >= 0.5 with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 0 signals

## Signals across the dial (gate: cosine >= 0.50)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 0 | 0 | 0 | 0 | — |
| faithful word | 0.80 | 1566 (773) | 2 | 1 | 3 | 0 | 2+1+3 / 0+0+0 |
| faithful word | 0.85 | 2084 (652) | 0 | 1 | 1 | 0 | 0+1+1 / 0+0+0 |
| faithful word | 0.90 | 2541 (344) | 0 | 1 | 1 | 0 | 0+1+1 / 0+0+0 |
| faithful word | 0.95 | 2831 (78) | 0 | 1 | 1 | 0 | 0+1+1 / 0+0+0 |
| faithful word | 1.00 | 2909 (0) | 0 | 1 | 1 | 0 | 0+1+1 / 0+0+0 |
| faithful subtree | 0.80 | 1566 (773) | 2 | 0 | 3 | 0 | 2+0+3 / 0+0+0 |
| faithful subtree | 0.85 | 2084 (652) | 0 | 0 | 1 | 0 | 0+0+1 / 0+0+0 |
| faithful subtree | 0.90 | 2541 (344) | 1 | 0 | 1 | 0 | 1+0+1 / 0+0+0 |
| faithful subtree | 0.95 | 2831 (78) | 1 | 0 | 1 | 0 | 1+0+1 / 0+0+0 |
| faithful subtree | 1.00 | 2909 (0) | 1 | 0 | 1 | 0 | 1+0+1 / 0+0+0 |

## faithful word @ cluster cos 0.80

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.465 | cry.Agent (5) | stop.Agent (4) | {Rima} {Baya, Skura, Hanako, Iga, …} | Rima and Skura stopped crying. | The old adaptor stopped working suddenly. |
| 0.51 (0.51) | 0.569 | hear.Experiencer (8) | want.Experiencer (6) | {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} | Jonas heard something in the closet. | Tony and Pepper wanted to experience a peaceful life away from the city. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {open, close, end, closed} {use, well, do, on, …} {unlocked, locked, lock, door, locked} | Brian left the door open. | Someone must have left the door unlocked. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.62 (0.62) | 0.482 | play.Agent (9) | sleep.Experiencer (6) | {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …} | The child likes to play with the cats. | The child is apparently sleeping. |
| 0.56 (0.56) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing, things, stuff, practice, thing} {weather, bad, weather} | Things have changed a lot over the past year. | Until today, everything was good. |

## faithful word @ cluster cos 0.85

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {well, on, there, be} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 0.90

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 0.95

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing} | Looks like the weather is changing. | The weather looks good today. |

## faithful word @ cluster cos 1.00

_(inventory: 1753 slots; 3065 embedded filler units (one per label); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {on} {open} {unlocked} | Tom leaves the lights on all day. | Someone must have left the door unlocked. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing} {weather} | Things have changed a lot over the past year. | Until today, everything was good. |

## faithful subtree @ cluster cos 0.80

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.57 (0.57) | 0.465 | cry.Agent (5) | stop.Agent (4) | {Rima} {Baya, Skura, Hanako, Iga, …} | Rima and Skura stopped crying. | Yanni stopped at a rest area. |
| 0.51 (0.51) | 0.569 | hear.Experiencer (8) | want.Experiencer (6) | {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} | Jonas heard something in the closet. | Tony and Pepper wanted to experience a peaceful life away from the city. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.62 (0.62) | 0.482 | play.Agent (9) | sleep.Experiencer (6) | {child, children, kid, baby, …} {Baya, Skura, Hanako, Iga, …} | The child likes to play with the cats. | The child is apparently sleeping. |
| 0.55 (0.55) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James, Donald, …} {Jonas, Bob, Thomas, John, …} {Gustavo, Alberto, Martino, Pietro, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing, things, stuff, practice, thing} {weather, bad, weather} | Things have changed a lot over the past year. | Until today, everything was good. |

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
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 0.90

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.60 (0.60) | 0.486 | draw.Agent (3) | play.Agent (9) | {children, kids} {child, kid} | The children drew on the sidewalk with chalk. | The children play the harp. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing, things} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 0.95

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.60 (0.60) | 0.486 | draw.Agent (3) | play.Agent (9) | {children, kids} {child, kid} | The children drew on the sidewalk with chalk. | The children play the harp. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {weather} {thing} | Looks like the weather is changing. | The weather looks good today. |

## faithful subtree @ cluster cos 1.00

_(inventory: 1753 slots; 2742 embedded filler units (one per filler); 140 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.60 (0.60) | 0.486 | draw.Agent (3) | play.Agent (9) | {child} {children} | The child drew on the page with markers that had vibrant colours. | The child likes to play with the cats. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.50 (0.50) | 0.547 | change.Patient (7) | good.Experiencer (4) | {thing} {weather} | Things have changed a lot over the past year. | Until today, everything was good. |
