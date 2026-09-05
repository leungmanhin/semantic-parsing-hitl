# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm (paper as written)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | /home/manhin/Dev/semantic-parsing-hitl/fusenf/mining/out_h/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers; a head enters the pooled view at n >= 20 |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.69 | 0.584 | Agent (888) | Experiencer (261) | {person, people} {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} |
| 0.52 | 0.683 | Patient (455) | Theme (594) | {thing, things, stuff, practice, thing} {person, people} {movie, film} |
| 0.47 | 0.625 | Experiencer (261) | Patient (455) | {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.47 | 0.705 | Agent (888) | Patient (455) | {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.43 | 0.71 | Agent (888) | Theme (594) | {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} |
| 0.42 | 0.711 | Experiencer (261) | Theme (594) | {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.38 | 0.761 | Agent (888) | Recipient (29) | {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation} |
| 0.38 | 0.853 | Stimulus (34) | Theme (594) | {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat} |
| 0.36 | 0.716 | Experiencer (261) | Holder (48) | {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boris, Ivan, Oleg, Fyodor, …} |
| 0.27 | 0.823 | Experiencer (261) | Recipient (29) | {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …} |
| 0.27 | 0.818 | Holder (48) | Theme (594) | {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …} |
| 0.26 | 0.779 | Agent (888) | Holder (48) | {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …} |
| 0.24 | 0.913 | Patient (455) | Stimulus (34) | {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {knock, kick, kick out} |
| 0.24 | 0.806 | Holder (48) | Patient (455) | {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms} |
| 0.24 | 0.797 | Goal (93) | Location (210) | {Germany, Denmark, Norway, Sweden} {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} |
| 0.20 | 0.829 | Location (210) | Source (47) | {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana} |
| 0.19 | 0.883 | Experiencer (261) | Stimulus (34) | {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …} |
| 0.18 | 0.886 | Agent (888) | Stimulus (34) | {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …} |
| 0.17 | 0.908 | Patient (455) | Recipient (29) | {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …} |
| 0.16 | 0.883 | Manner (115) | Result (43) | {use, well, direct, do, …} {together, come together} {former, back, early, backward, …} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.61 | 0.65 | Agent (888) | Experiencer (261) | {person, people} {thing, things} {child, children, kid, kids} |
| 0.51 | 0.746 | Patient (455) | Theme (594) | {thing, things} {person, people} {movie, film} |
| 0.50 | 0.762 | Agent (888) | Patient (455) | {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} |
| 0.50 | 0.664 | Experiencer (261) | Patient (455) | {person, people} {thing, things} {door, door, open, door, unlocked} |
| 0.42 | 0.765 | Agent (888) | Theme (594) | {person, people} {thing, things} {company, corporation} |
| 0.41 | 0.776 | Experiencer (261) | Theme (594) | {thing, things} {person, people} {child, children, kid, kids} |
| 0.36 | 0.805 | Agent (888) | Recipient (29) | {person, people} {company, corporation} {child, children, kid, kids} |
| 0.36 | 0.881 | Stimulus (34) | Theme (594) | {thing, things} {child, children, kid, kids} {food, eat} |
| 0.24 | 0.866 | Experiencer (261) | Recipient (29) | {person, people} {child, children, kid, kids} {man, guy} |
| 0.24 | 0.918 | Patient (455) | Stimulus (34) | {thing, things} {child, children, kid, kids} {knock} |
| 0.23 | 0.867 | Holder (48) | Theme (594) | {thing, things} {house, home, houses} {food, eat} |
| 0.21 | 0.809 | Experiencer (261) | Holder (48) | {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Boris, Ivan, Dmitri, Rasputin} |
| 0.21 | 0.852 | Holder (48) | Patient (455) | {thing, things} {movie, film} {room, rooms} |
| 0.18 | 0.921 | Experiencer (261) | Stimulus (34) | {thing, things} {child, children, kid, kids} {difficult, hard, difficulty, harder} |
| 0.17 | 0.91 | Agent (888) | Stimulus (34) | {thing, things} {child, children, kid, kids} {Jessica, Beth} |
| 0.17 | 0.921 | Patient (455) | Recipient (29) | {person, people} {child, children, kid, kids} {big, large, huge, massive, …} |
| 0.16 | 0.812 | Experiencer (261) | Result (43) | {bad, bad, matter, bad, problem} {black, white} {red} |
| 0.16 | 0.859 | Goal (93) | Location (210) | {house, home, houses} {here} {Eskisehir, Giresun} |
| 0.16 | 0.857 | Goal (93) | Source (47) | {town, towns} {here} {school, education} |
| 0.15 | 0.892 | Holder (48) | Stimulus (34) | {thing, things} {author, writer, novelist} {food, eat} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.56 | 0.719 | Agent (888) | Experiencer (261) | {person, people} {thing, things} {child, kid} |
| 0.51 | 0.795 | Agent (888) | Patient (455) | {person, people} {thing, things} {child, kid} |
| 0.51 | 0.775 | Patient (455) | Theme (594) | {thing, things} {person, people} {movie, film} |
| 0.50 | 0.695 | Experiencer (261) | Patient (455) | {person, people} {thing, things} {door} |
| 0.41 | 0.82 | Agent (888) | Theme (594) | {person, people} {thing, things} {company} |
| 0.39 | 0.821 | Experiencer (261) | Theme (594) | {thing, things} {person, people} {child, kid} |
| 0.36 | 0.887 | Stimulus (34) | Theme (594) | {thing, things} {child, kid} {music} |
| 0.35 | 0.833 | Agent (888) | Recipient (29) | {person, people} {company} {child, kid} |
| 0.25 | 0.918 | Patient (455) | Stimulus (34) | {thing, things} {child, kid} {food} |
| 0.23 | 0.898 | Experiencer (261) | Recipient (29) | {person, people} {child, kid} {man, guy} |
| 0.22 | 0.887 | Holder (48) | Theme (594) | {thing, things} {house, home} {food} |
| 0.20 | 0.871 | Holder (48) | Patient (455) | {thing, things} {movie, film} {room, rooms} |
| 0.19 | 0.926 | Experiencer (261) | Stimulus (34) | {thing, things} {child, kid} {difficult, difficulty} |
| 0.17 | 0.919 | Agent (888) | Stimulus (34) | {thing, things} {child, kid} {Jessica} |
| 0.17 | 0.925 | Patient (455) | Recipient (29) | {person, people} {child, kid} {city, cities} |
| 0.16 | 0.821 | Experiencer (261) | Result (43) | {bad} {red} {black} |
| 0.16 | 0.864 | Goal (93) | Source (47) | {town} {here} {school} |
| 0.16 | 0.862 | Experiencer (261) | Holder (48) | {thing, things} {house, home} {place, places} |
| 0.15 | 0.919 | Theme (594) | To (46) | {thing, things} {talk, conversation} {music} |
| 0.14 | 0.917 | Holder (48) | Stimulus (34) | {thing, things} {food} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.56 | 0.735 | Agent (888) | Experiencer (261) | {person} {thing} {child, kid} |
| 0.51 | 0.801 | Agent (888) | Patient (455) | {person} {thing} {child, kid} |
| 0.50 | 0.789 | Patient (455) | Theme (594) | {thing} {person} {movie, film} |
| 0.49 | 0.708 | Experiencer (261) | Patient (455) | {person} {thing} {door} |
| 0.41 | 0.835 | Agent (888) | Theme (594) | {person} {thing} {company} |
| 0.39 | 0.834 | Experiencer (261) | Theme (594) | {thing} {person} {child, kid} |
| 0.36 | 0.833 | Agent (888) | Recipient (29) | {person} {company} {child, kid} |
| 0.36 | 0.89 | Stimulus (34) | Theme (594) | {thing} {child, kid} {music} |
| 0.25 | 0.918 | Patient (455) | Stimulus (34) | {thing} {child, kid} {food} |
| 0.23 | 0.905 | Experiencer (261) | Recipient (29) | {person} {child, kid} {man} |
| 0.21 | 0.896 | Holder (48) | Theme (594) | {thing} {house} {food} |
| 0.20 | 0.871 | Holder (48) | Patient (455) | {thing} {movie, film} {room} |
| 0.19 | 0.931 | Experiencer (261) | Stimulus (34) | {thing} {child, kid} |
| 0.17 | 0.919 | Agent (888) | Stimulus (34) | {thing} {child, kid} {Jessica} |
| 0.16 | 0.821 | Experiencer (261) | Result (43) | {bad} {red} {black} |
| 0.16 | 0.864 | Goal (93) | Source (47) | {town} {school} {here} |
| 0.16 | 0.933 | Patient (455) | Recipient (29) | {person} {child, kid} {city} |
| 0.15 | 0.869 | Experiencer (261) | Holder (48) | {thing} {house} {place} |
| 0.15 | 0.923 | Theme (594) | To (46) | {thing} {talk} {music} |
| 0.14 | 0.917 | Holder (48) | Stimulus (34) | {thing} {food} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.56 | 0.735 | Agent (888) | Experiencer (261) | {person} {thing} {child} |
| 0.51 | 0.804 | Agent (888) | Patient (455) | {person} {thing} {child} |
| 0.50 | 0.789 | Patient (455) | Theme (594) | {thing} {person} {room} |
| 0.49 | 0.711 | Experiencer (261) | Patient (455) | {person} {thing} {door} |
| 0.41 | 0.835 | Agent (888) | Theme (594) | {person} {thing} {company} |
| 0.39 | 0.834 | Experiencer (261) | Theme (594) | {thing} {person} {child} |
| 0.36 | 0.89 | Stimulus (34) | Theme (594) | {thing} {child} {music} |
| 0.32 | 0.856 | Agent (888) | Recipient (29) | {person} {company} {man} |
| 0.25 | 0.918 | Patient (455) | Stimulus (34) | {thing} {child} {food} |
| 0.21 | 0.903 | Holder (48) | Theme (594) | {thing} {house} {food} |
| 0.20 | 0.873 | Holder (48) | Patient (455) | {thing} {movie} {room} |
| 0.19 | 0.931 | Experiencer (261) | Stimulus (34) | {thing} {child} |
| 0.17 | 0.919 | Agent (888) | Stimulus (34) | {thing} {child} {Jessica} |
| 0.16 | 0.821 | Experiencer (261) | Result (43) | {bad} {red} {black} |
| 0.16 | 0.864 | Goal (93) | Source (47) | {town} {here} {school} |
| 0.15 | 0.938 | Experiencer (261) | Recipient (29) | {person} {man} {large} |
| 0.15 | 0.923 | Theme (594) | To (46) | {thing} {talk} {music} |
| 0.15 | 0.877 | Experiencer (261) | Holder (48) | {thing} {house} {place} |
| 0.14 | 0.942 | Patient (455) | Recipient (29) | {person} {city} {man} |
| 0.14 | 0.917 | Holder (48) | Stimulus (34) | {thing} {food} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.62 | 0.626 | Agent (888) | Experiencer (261) | {person, people} {Gustavo, Alberto, Martino, Pietro, …} {Jessica, Linda, Beth, Katherine, …} |
| 0.49 | 0.721 | Patient (455) | Theme (594) | {thing, things, stuff, practice, thing} {person, people} {song, sing, chant} |
| 0.44 | 0.734 | Agent (888) | Patient (455) | {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.42 | 0.725 | Agent (888) | Theme (594) | {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} |
| 0.38 | 0.678 | Experiencer (261) | Patient (455) | {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.37 | 0.77 | Agent (888) | Recipient (29) | {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation} |
| 0.35 | 0.873 | Stimulus (34) | Theme (594) | {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat} |
| 0.34 | 0.738 | Experiencer (261) | Holder (48) | {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …} |
| 0.33 | 0.767 | Experiencer (261) | Theme (594) | {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …} |
| 0.26 | 0.82 | Holder (48) | Theme (594) | {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …} |
| 0.26 | 0.782 | Agent (888) | Holder (48) | {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …} |
| 0.25 | 0.802 | Goal (93) | Location (210) | {house, home, comfortable, house, houses, …} {Germany, Denmark, Norway, Sweden} {city, town, cities, town, unknown, …} |
| 0.24 | 0.814 | Holder (48) | Patient (455) | {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms} |
| 0.23 | 0.852 | Experiencer (261) | Recipient (29) | {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …} |
| 0.23 | 0.922 | Patient (455) | Stimulus (34) | {thing, things, stuff, practice, thing} {knock, kick, kick out} {Jessica, Linda, Beth, Katherine, …} |
| 0.18 | 0.864 | Location (210) | Source (47) | {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana} |
| 0.18 | 0.89 | Agent (888) | Stimulus (34) | {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …} |
| 0.17 | 0.896 | Theme (594) | To (46) | {thing, things, stuff, practice, thing} {talk, conversation, discussion} {computer, machine} |
| 0.16 | 0.859 | Goal (93) | Source (47) | {city, town, cities, town, unknown, …} {here, host} {school, university, campus, college, …} |
| 0.15 | 0.897 | Manner (115) | Result (43) | {use, well, direct, do, …} {together, come together} {effective, affect, effect, effectively} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.50 | 0.691 | Agent (888) | Experiencer (261) | {person, people} {thing, things} {child, children, kid, kids} |
| 0.48 | 0.785 | Patient (455) | Theme (594) | {thing, things} {person, people} {song, sing, chant} |
| 0.47 | 0.794 | Agent (888) | Patient (455) | {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} |
| 0.41 | 0.783 | Agent (888) | Theme (594) | {person, people} {thing, things} {company, corporation} |
| 0.39 | 0.709 | Experiencer (261) | Patient (455) | {person, people} {thing, things} {door, door, open, door, unlocked} |
| 0.34 | 0.816 | Agent (888) | Recipient (29) | {person, people} {company, corporation} {child, children, kid, kids} |
| 0.34 | 0.897 | Stimulus (34) | Theme (594) | {thing, things} {child, children, kid, kids} {food, eat} |
| 0.30 | 0.82 | Experiencer (261) | Theme (594) | {thing, things} {person, people} {child, children, kid, kids} |
| 0.23 | 0.928 | Patient (455) | Stimulus (34) | {thing, things} {child, children, kid, kids} {knock} |
| 0.22 | 0.876 | Holder (48) | Theme (594) | {thing, things} {food, eat} {house, home, houses} |
| 0.20 | 0.895 | Experiencer (261) | Recipient (29) | {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie} |
| 0.19 | 0.871 | Holder (48) | Patient (455) | {thing, things} {movie, film} {room, rooms} |
| 0.17 | 0.838 | Experiencer (261) | Holder (48) | {Gustavo, Alberto, Diego, Rodrigo, …} {thing, things} {Boris, Ivan, Dmitri, Rasputin} |
| 0.17 | 0.915 | Agent (888) | Stimulus (34) | {thing, things} {child, children, kid, kids} {Jessica, Beth} |
| 0.15 | 0.892 | Holder (48) | Stimulus (34) | {thing, things} {author, writer, novelist} {food, eat} |
| 0.15 | 0.861 | Agent (888) | Holder (48) | {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …} |
| 0.14 | 0.941 | Patient (455) | Recipient (29) | {person, people} {child, children, kid, kids} {city, cities} |
| 0.13 | 0.871 | Goal (93) | Source (47) | {town, towns} {here} {school, education} |
| 0.13 | 0.916 | Recipient (29) | Theme (594) | {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie} |
| 0.13 | 0.877 | Goal (93) | Location (210) | {house, home, houses} {here} {Eskisehir, Giresun} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.48 | 0.822 | Agent (888) | Patient (455) | {person, people} {thing, things} {children, kids} |
| 0.48 | 0.812 | Patient (455) | Theme (594) | {thing, things} {person, people} {song, sing} |
| 0.43 | 0.765 | Agent (888) | Experiencer (261) | {person, people} {thing, things} {children, kids} |
| 0.40 | 0.839 | Agent (888) | Theme (594) | {person, people} {thing, things} {company} |
| 0.36 | 0.753 | Experiencer (261) | Patient (455) | {person, people} {thing, things} {indigenous, indigenous, people} |
| 0.33 | 0.845 | Agent (888) | Recipient (29) | {person, people} {company} {children, kids} |
| 0.32 | 0.912 | Stimulus (34) | Theme (594) | {thing, things} {food} {question, questions, ask} |
| 0.25 | 0.894 | Experiencer (261) | Theme (594) | {thing, things} {person, people} {children, kids} |
| 0.23 | 0.933 | Patient (455) | Stimulus (34) | {thing, things} {food} {knock} |
| 0.21 | 0.896 | Holder (48) | Theme (594) | {thing, things} {food} {house, home} |
| 0.19 | 0.89 | Holder (48) | Patient (455) | {thing, things} {movie, film} {room, rooms} |
| 0.16 | 0.932 | Experiencer (261) | Recipient (29) | {person, people} {children, kids} |
| 0.15 | 0.936 | Agent (888) | Stimulus (34) | {thing, things} {Jessica} {child, kid} |
| 0.14 | 0.941 | Patient (455) | Recipient (29) | {person, people} {children, kids} {city, cities} |
| 0.13 | 0.917 | Holder (48) | Stimulus (34) | {thing, things} {food} |
| 0.12 | 0.895 | Goal (93) | Holder (48) | {house, home} {town} {place, places} |
| 0.12 | 0.932 | Recipient (29) | Theme (594) | {person, people} {children, kids} {company} |
| 0.12 | 0.879 | Goal (93) | Source (47) | {town} {here} {school} |
| 0.11 | 0.923 | Location (210) | Source (47) | {here} {place, places} {town} |
| 0.10 | 0.938 | Theme (594) | To (46) | {thing, things} {talk, conversation} {make} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.38 | 0.827 | Patient (455) | Theme (594) | {thing} {person} {people} |
| 0.36 | 0.857 | Agent (888) | Theme (594) | {person} {thing} {company} |
| 0.35 | 0.841 | Agent (888) | Patient (455) | {person} {thing} {people} |
| 0.33 | 0.852 | Agent (888) | Recipient (29) | {person} {company} {children, kids} |
| 0.30 | 0.785 | Agent (888) | Experiencer (261) | {person} {thing} {people} |
| 0.29 | 0.772 | Experiencer (261) | Patient (455) | {thing} {people} {person} |
| 0.29 | 0.921 | Stimulus (34) | Theme (594) | {thing} {food} {questions} |
| 0.20 | 0.942 | Patient (455) | Stimulus (34) | {thing} {food} {knock} |
| 0.19 | 0.91 | Experiencer (261) | Theme (594) | {thing} {person} {people} |
| 0.18 | 0.913 | Holder (48) | Theme (594) | {thing} {food} {house} |
| 0.18 | 0.895 | Holder (48) | Patient (455) | {thing} {movie, film} {room} |
| 0.17 | 0.937 | Agent (888) | Stimulus (34) | {thing} {Jessica} {child, kid} |
| 0.14 | 0.917 | Holder (48) | Stimulus (34) | {thing} {food} |
| 0.11 | 0.941 | Recipient (29) | Theme (594) | {person} {children, kids} {company} |
| 0.11 | 0.955 | Experiencer (261) | Stimulus (34) | {thing} {child, kid} |
| 0.11 | 0.894 | Goal (93) | Source (47) | {school} {town} {here} |
| 0.10 | 0.928 | Location (210) | Source (47) | {here} {town} {school} |
| 0.10 | 0.933 | Agent (888) | Holder (48) | {thing} {Wilson} {Karen} |
| 0.10 | 0.918 | Experiencer (261) | Holder (48) | {thing} {place} {sea, ocean} |
| 0.09 | 0.945 | Theme (594) | To (46) | {thing} {talk} {make} |
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

### role level — pooled filler distributions per head (the 'Agent2 ~ Agent' reading)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.38 | 0.827 | Patient (455) | Theme (594) | {thing} {person} {people} |
| 0.36 | 0.857 | Agent (888) | Theme (594) | {person} {thing} {company} |
| 0.35 | 0.845 | Agent (888) | Patient (455) | {person} {thing} {people} |
| 0.30 | 0.785 | Agent (888) | Experiencer (261) | {person} {thing} {people} |
| 0.29 | 0.775 | Experiencer (261) | Patient (455) | {thing} {people} {person} |
| 0.29 | 0.872 | Agent (888) | Recipient (29) | {person} {company} {man} |
| 0.29 | 0.921 | Stimulus (34) | Theme (594) | {thing} {food} {questions} |
| 0.20 | 0.942 | Patient (455) | Stimulus (34) | {thing} {food} {knock} |
| 0.19 | 0.91 | Experiencer (261) | Theme (594) | {thing} {person} {people} |
| 0.18 | 0.895 | Holder (48) | Patient (455) | {thing} {movie} {room} |
| 0.18 | 0.917 | Holder (48) | Theme (594) | {thing} {food} {house} |
| 0.17 | 0.937 | Agent (888) | Stimulus (34) | {thing} {Jessica} {author} |
| 0.14 | 0.917 | Holder (48) | Stimulus (34) | {thing} {food} |
| 0.11 | 0.955 | Experiencer (261) | Stimulus (34) | {thing} {child} |
| 0.11 | 0.894 | Goal (93) | Source (47) | {here} {school} {town} |
| 0.10 | 0.928 | Location (210) | Source (47) | {here} {town} {office} |
| 0.10 | 0.933 | Agent (888) | Holder (48) | {thing} {Wilson} {Karen} |
| 0.09 | 0.945 | Theme (594) | To (46) | {thing} {talk} {make} |
| 0.09 | 0.926 | Experiencer (261) | Holder (48) | {thing} {place} {Miroslav} |
| 0.08 | 0.925 | Goal (93) | Location (210) | {here} {home} {town} |
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
