# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | /home/manhin/Dev/semantic-parsing-hitl/fusenf/mining/out_h/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): Jensen-Shannon divergence <= 0.3 (0 = identical, 1 = disjoint) with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 8 signals

## Signals across the dial (gate: JSD <= 0.30)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) | JSD <= 0.40 (sensitivity; event) |
|---|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 2 | 3 | 2 | 1 | — | — |
| faithful word | 0.80 | 1781 (914) | 2 | 0 | 1 | 0 | 16+4+8 / 0+0+0 | 6+2+4 |
| faithful word | 0.85 | 2382 (772) | 2 | 0 | 1 | 0 | 9+3+6 / 0+0+0 | 5+2+4 |
| faithful word | 0.90 | 2939 (427) | 1 | 0 | 1 | 0 | 7+3+4 / 0+0+0 | 3+2+2 |
| faithful word | 0.95 | 3294 (103) | 1 | 0 | 1 | 0 | 7+3+3 / 0+0+0 | 3+2+1 |
| faithful word | 1.00 | 3399 (0) | 1 | 0 | 1 | 0 | 6+3+3 / 0+0+0 | 3+2+1 |
| faithful subtree | 0.80 | 1781 (914) | 2 | 0 | 1 | 0 | 13+3+8 / 0+0+0 | 5+1+4 |
| faithful subtree | 0.85 | 2382 (772) | 2 | 0 | 1 | 0 | 8+1+6 / 0+0+0 | 4+1+4 |
| faithful subtree | 0.90 | 2939 (427) | 1 | 0 | 1 | 0 | 6+1+4 / 0+0+0 | 3+1+2 |
| faithful subtree | 0.95 | 3294 (103) | 1 | 0 | 0 | 0 | 6+1+1 / 0+0+0 | 3+1+0 |
| faithful subtree | 1.00 | 3399 (0) | 1 | 0 | 0 | 0 | 6+1+1 / 0+0+0 | 3+1+0 |

## faithful word @ cluster cos 0.80

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.76 (0.76) | 0.251 | appear.Agent (6) | replace.Agent (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | Lex Luthor was also replaced as Scott Wells by Sherman Howard . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful word @ cluster cos 0.85

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.88 (0.88) | 0.25 | design.Agent (4) | produce.Agent (8) | {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limited of Aus | The album was produced by Colin Richardson and mixed by Jason Suecof . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful word @ cluster cos 0.90

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful word @ cluster cos 0.95

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person} {family} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful word @ cluster cos 1.00

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {person} {sister} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {family} {person} | Four families died in the fire. | The family had been sleeping for about two hours when the fire broke out. |

## faithful subtree @ cluster cos 0.80

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.76 (0.76) | 0.251 | appear.Agent (6) | replace.Agent (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | Lex Luthor was also replaced as Scott Wells by Sherman Howard . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful subtree @ cluster cos 0.85

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.87 (0.87) | 0.25 | design.Agent (4) | produce.Agent (8) | {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limited of Aus | The album was produced by Colin Richardson and mixed by Jason Suecof . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful subtree @ cluster cos 0.90

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |

## faithful subtree @ cluster cos 0.95

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sisters} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

## faithful subtree @ cluster cos 1.00

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {person} {sisters} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
