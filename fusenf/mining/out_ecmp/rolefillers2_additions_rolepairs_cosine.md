# §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — ROLE PAIRS (our extension, not the paper's method)

> "For every predicate-slot (e.g. go to.Agent or Agent2), we collect the set of fillers across the corpus and embed them in a vector space (using word or subtree embeddings). Clustering these embeddings reveals when two slots share indistinguishable distributions of fillers, indicating they fulfill the same semantic role and can be merged." — FUSE-NF §4.3.2

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| predicate-slot | every argument head attached to an event center in the canonical graph (closed-class roles, preposition-named obliques, and the other heads — temporal, resultative, discourse); the class links Member / Inheritance classify the event and are not slots; entity-center heads reported separately |
| fillers | every argument of such a head, across the corpus; texts per `embeddings.py` (class labels, surface names, constant symbols); un-embeddable fillers (untyped skolems, numbers, strings, structured terms) excluded from the distribution |
| embeddings | out_ecmp/embeddings: Qwen3-Embedding-8B, bf16, normalized; word texts (one per class label, 1/m mass for a multi-label filler) and subtree texts (the label bag / plural form / name as one text) |
| clustering | agglomerative, average linkage on cosine distance, one tree cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0] (1.0 = one cluster per distinct text) |
| slot distribution | raw mass over clusters, no weighting; a slot enters comparison at n >= 3 embedded fillers; a head enters the role-pair level (our extension) at n >= 14 |
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): cosine >= 0.5 with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 87 signals


## faithful word @ cluster cos 0.80

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.43 | 0.764 | Agent (500) | Experiencer (63) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {automobile, car, automobiles} |
| 0.30 | 0.671 | Agent (500) | Recipient (47) | {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} |
| 0.23 | 0.83 | Agent (500) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {physician, doctor} |
| 0.21 | 0.834 | Experiencer (63) | Patient (159) | {person, people} {movie, film, music film, musical film} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} |
| 0.20 | 0.745 | Agent (500) | Theme (367) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.17 | 0.839 | Agent (500) | CoAgent (19) | {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} {family} |
| 0.16 | 0.851 | Patient (159) | Theme (367) | {song, sing, music} {person, people} {answer, decision, permit, decide, …} |
| 0.15 | 0.844 | Recipient (47) | Theme (367) | {query, search} {Ravi, Armaan Jain, Ranbir Kapoor} {child, children} |
| 0.12 | 0.876 | Experiencer (63) | Theme (367) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.11 | 0.907 | Experiencer (63) | Recipient (47) | {person, people} {Cameron, Blair} |
| 0.11 | 0.912 | CoAgent (19) | Theme (367) | {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Ralph, Bo, Bobby, Frankie, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen} |
| 0.10 | 0.937 | Holder (19) | Theme (367) | {answer, decision, permit, decide, …} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall, house, room} |
| 0.09 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.09 | 0.895 | CoAgent (19) | Recipient (47) | {Ralph, Bo, Bobby, Frankie, …} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew, night crew} |
| 0.08 | 0.942 | Holder (19) | Patient (159) | {answer, decision, permit, decide, …} |
| 0.07 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.07 | 0.895 | CoAgent (19) | Holder (19) | {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.07 | 0.959 | Beneficiary (14) | Patient (159) | {hall, house, room} |

## faithful word @ cluster cos 0.85

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.715 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.28 | 0.858 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {George Allen, James David Edgar, Chuck Robb} |
| 0.24 | 0.845 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {storm, hurricane} |
| 0.21 | 0.834 | Experiencer (63) | Patient (159) | {person, people} {movie, film} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} |
| 0.16 | 0.795 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {inomaru, Mie Sonozaki, Soichiro Akizuki} |
| 0.14 | 0.868 | Patient (159) | Theme (367) | {person, people} {song, sing} {movie, film} |
| 0.11 | 0.892 | Agent (500) | CoAgent (19) | {Bo, Bobby, Robbie, Roger} {family} {Corentin Rahier, Cyril Rambour, Peter Gaussen} |
| 0.11 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.11 | 0.907 | Experiencer (63) | Theme (367) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.10 | 0.896 | Recipient (47) | Theme (367) | {query, search} {child, children} {person, people} |
| 0.10 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.08 | 0.943 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.07 | 0.942 | CoAgent (19) | Theme (367) | {Corentin Rahier, Cyril Rambour, Peter Gaussen} {Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Bo, Bobby, Robbie, Roger} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Ana, Jessica, Loren} |
| 0.04 | 0.947 | Agent (500) | Goal (30) | {Ana, Jessica, Loren} {George Allen, James David Edgar, Chuck Robb} {child, children} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.02 | 0.972 | Manner (34) | Theme (367) | {lane, way} {widespread, widely, attention, widespread} |

## faithful word @ cluster cos 0.90

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.735 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.28 | 0.894 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {Aslan} |
| 0.25 | 0.855 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {electrician} |
| 0.19 | 0.873 | Experiencer (63) | Patient (159) | {person, people} {movie, film} {relationship} |
| 0.15 | 0.822 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {child} |
| 0.13 | 0.879 | Patient (159) | Theme (367) | {person, people} {song, sing} {movie, film} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person, people} {tower} |
| 0.09 | 0.943 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.09 | 0.938 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.08 | 0.929 | Experiencer (63) | Theme (367) | {person, people} {bridge} {view} |
| 0.08 | 0.927 | Agent (500) | CoAgent (19) | {family} {Karen} {ranger} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {child} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function, predictive functions} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |

## faithful word @ cluster cos 0.95

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {school} {depot} |
| 0.24 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile, automobiles} {Aslan} |
| 0.24 | 0.864 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.15 | 0.874 | Experiencer (63) | Patient (159) | {person} {movie, film} {people} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {child} |
| 0.12 | 0.888 | Patient (159) | Theme (367) | {person} {song} {movie, film} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person} {tower} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.07 | 0.934 | Agent (500) | CoAgent (19) | {family} {Karen} {ranger} |
| 0.07 | 0.93 | Experiencer (63) | Theme (367) | {person} {bridge} {view} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {child} {pier} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function, predictive functions} |

## faithful word @ cluster cos 1.00

_(inventory: 571 slots; 1819 embedded filler units (one per label); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {depot} {school} |
| 0.24 | 0.864 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.24 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile} {Aslan} |
| 0.15 | 0.88 | Experiencer (63) | Patient (159) | {person} {bad} {indigenous} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {child} |
| 0.12 | 0.891 | Patient (159) | Theme (367) | {person} {song} {decision} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {elder} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {coach} {foreman} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {child} {person} {query} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.07 | 0.934 | Agent (500) | CoAgent (19) | {family} {ranger} {Karen} |
| 0.07 | 0.93 | Experiencer (63) | Theme (367) | {person} {bridge} {view} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child} {Loren} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {child} {predictive function} |
| 0.02 | 0.978 | Agent (500) | Goal (30) | {child} {pier} |

## faithful subtree @ cluster cos 0.80

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.38 | 0.767 | Agent (500) | Experiencer (63) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {automobile, car, automobiles} |
| 0.30 | 0.671 | Agent (500) | Recipient (47) | {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} |
| 0.21 | 0.835 | Agent (500) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {physician, doctor} |
| 0.20 | 0.745 | Agent (500) | Theme (367) | {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {person, people} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.18 | 0.839 | Experiencer (63) | Patient (159) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.17 | 0.839 | Agent (500) | CoAgent (19) | {Karen, Katherine, Margaret Fleming, Ana, …} {Ralph, Bo, Bobby, Frankie, …} {family} |
| 0.15 | 0.863 | Patient (159) | Theme (367) | {song, sing, music} {person, people} {answer, decision, permit, decide, …} |
| 0.15 | 0.844 | Recipient (47) | Theme (367) | {query, search} {Ravi, Armaan Jain, Ranbir Kapoor} {child, children} |
| 0.12 | 0.882 | Experiencer (63) | Theme (367) | {person, people} {Cowper, Bill Wrubel, Brian Packham, Carl Fenton, …} {bridge, footbridge} |
| 0.11 | 0.912 | CoAgent (19) | Theme (367) | {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Ralph, Bo, Bobby, Frankie, …} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen} |
| 0.10 | 0.937 | Holder (19) | Theme (367) | {answer, decision, permit, decide, …} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.09 | 0.948 | Beneficiary (14) | Location (175) | {hall, house, room} |
| 0.09 | 0.912 | Experiencer (63) | Recipient (47) | {person, people} {Cameron, Blair} |
| 0.09 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.09 | 0.895 | CoAgent (19) | Recipient (47) | {Ralph, Bo, Bobby, Frankie, …} {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.09 | 0.942 | Holder (19) | Patient (159) | {answer, decision, permit, decide, …} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew, night crew} |
| 0.07 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.07 | 0.895 | CoAgent (19) | Holder (19) | {Karen, Katherine, Margaret Fleming, Ana, …} |
| 0.07 | 0.959 | Beneficiary (14) | Patient (159) | {hall, house, room} |

## faithful subtree @ cluster cos 0.85

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.715 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.23 | 0.861 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {George Allen, James David Edgar, Chuck Robb} |
| 0.23 | 0.845 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {storm, hurricane} |
| 0.18 | 0.839 | Experiencer (63) | Patient (159) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.16 | 0.795 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {inomaru, Mie Sonozaki, Soichiro Akizuki} |
| 0.13 | 0.875 | Patient (159) | Theme (367) | {person, people} {song, sing} {decision, decide} |
| 0.11 | 0.892 | Agent (500) | CoAgent (19) | {Bo, Bobby, Robbie, Roger} {family} {Corentin Rahier, Cyril Rambour, Peter Gaussen} |
| 0.11 | 0.804 | Recipient (47) | Source (24) | {coach, trainer} {depot} {potter} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.10 | 0.91 | Experiencer (63) | Theme (367) | {person, people} {Henry Cole, O. R. Woodcock, Thomas Bain, Thomas Fothergill, …} {bridge, footbridge} |
| 0.10 | 0.862 | Agent (500) | Source (24) | {school} {depot} {coach, trainer} |
| 0.10 | 0.896 | Recipient (47) | Theme (367) | {query, search} {child, children} {person, people} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.07 | 0.942 | CoAgent (19) | Theme (367) | {Corentin Rahier, Cyril Rambour, Peter Gaussen} {Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Bo, Bobby, Robbie, Roger} |
| 0.06 | 0.948 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {child, children} {Ana, Jessica, Loren} |
| 0.04 | 0.947 | Agent (500) | Goal (30) | {Ana, Jessica, Loren} {George Allen, James David Edgar, Chuck Robb} {child, children} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.02 | 0.967 | Experiencer (63) | Goal (30) | {George Allen, James David Edgar, Chuck Robb} |

## faithful subtree @ cluster cos 0.90

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.29 | 0.735 | Agent (500) | Recipient (47) | {person, people} {school} {depot} |
| 0.23 | 0.858 | Agent (500) | Patient (159) | {person, people} {physician, doctor} {electrician} |
| 0.22 | 0.901 | Agent (500) | Experiencer (63) | {person, people} {automobile, car, automobiles} {Aslan} |
| 0.15 | 0.886 | Experiencer (63) | Patient (159) | {person, people} {bad, relationship} {indigenous, indigenous, people} |
| 0.15 | 0.822 | Agent (500) | Theme (367) | {person, people} {physician, doctor} {children} |
| 0.12 | 0.887 | Patient (159) | Theme (367) | {person, people} {song, sing} {decision, decide} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person, people} {tower} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.08 | 0.94 | Patient (159) | Recipient (47) | {person, people} {crew} |
| 0.07 | 0.927 | Agent (500) | CoAgent (19) | {family} {Karen} {ranger} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person, people} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person, people} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {children} {pier} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive function, predictive functions} |

## faithful subtree @ cluster cos 0.95

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {school} {depot} |
| 0.22 | 0.901 | Agent (500) | Experiencer (63) | {person} {automobile, automobiles} {Aslan} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {children} |
| 0.15 | 0.881 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {potter} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {potter} {foreman} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.10 | 0.905 | Experiencer (63) | Patient (159) | {person} {bad, relationship} {indigenous, people} |
| 0.10 | 0.9 | Patient (159) | Theme (367) | {song} {person} {decision} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person} {tower} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.07 | 0.934 | Agent (500) | CoAgent (19) | {family} {Karen} {ranger} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.04 | 0.954 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.03 | 0.964 | Agent (500) | Goal (30) | {George Allen, Chuck Robb} {children} {pier} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive function, predictive functions} |

## faithful subtree @ cluster cos 1.00

_(inventory: 571 slots; 1697 embedded filler units (one per filler); 130 un-embeddable occurrences excluded: untyped / number / string / term)_

### role pairs — each head's fillers pooled over every class (OUR EXTENSION, not the paper's method)

| cosine | JSD | head A (n) | head B (n) | shared clusters |
|---|---|---|---|---|
| 0.30 | 0.735 | Agent (500) | Recipient (47) | {person} {depot} {school} |
| 0.21 | 0.903 | Agent (500) | Experiencer (63) | {person} {automobile} {Aslan} |
| 0.15 | 0.83 | Agent (500) | Theme (367) | {person} {physician} {children} |
| 0.15 | 0.881 | Agent (500) | Patient (159) | {person} {physician} {electrician} |
| 0.11 | 0.862 | Agent (500) | Source (24) | {school} {depot} {elder} |
| 0.11 | 0.813 | Recipient (47) | Source (24) | {depot} {coach} {foreman} |
| 0.10 | 0.948 | Beneficiary (14) | Location (175) | {hall} |
| 0.10 | 0.905 | Experiencer (63) | Patient (159) | {person} {bad, relationship} {indigenous, people} |
| 0.10 | 0.9 | Patient (159) | Theme (367) | {song} {decision} {person} |
| 0.09 | 0.904 | Recipient (47) | Theme (367) | {children} {person} {query} |
| 0.08 | 0.895 | CoAgent (19) | Holder (19) | {Karen} |
| 0.07 | 0.934 | Agent (500) | CoAgent (19) | {family} {ranger} {Karen} |
| 0.07 | 0.948 | Experiencer (63) | Recipient (47) | {person} |
| 0.06 | 0.952 | Experiencer (63) | Theme (367) | {person} {bridge} {destined, film, syrian} |
| 0.05 | 0.929 | Goal (30) | Recipient (47) | {children} {Loren} |
| 0.04 | 0.954 | Patient (159) | Recipient (47) | {person} {crew} |
| 0.03 | 0.962 | Experiencer (63) | Holder (19) | {lathe} |
| 0.02 | 0.979 | Agent (500) | Holder (19) | {recipe} {Karen} |
| 0.02 | 0.978 | Agent (500) | Goal (30) | {children} {pier} |
| 0.02 | 0.975 | Goal (30) | Theme (367) | {children} {predictive functions} |
