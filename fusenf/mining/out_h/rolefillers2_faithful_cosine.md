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
| 'indistinguishable' | similarity, not a homogeneity test (slot sizes are far too small for one): cosine >= 0.5 with >= 2 shared clusters; the other statistic is reported beside it |
| slot pairs compared | all pairs of the same center kind; shown by bucket for reading only: same role / different class, same class / different role, different class and role |

- exact-label baseline on the same substrate (augmented arm, for reference only): 8 signals

## Signals across the dial (gate: cosine >= 0.50)

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw cosine criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label (augmented arm, cosine gate) | — | — | 2 | 3 | 2 | 1 | — |
| faithful word | 0.80 | 1781 (914) | 16 | 4 | 8 | 0 | 16+4+8 / 0+0+0 |
| faithful word | 0.85 | 2382 (772) | 9 | 3 | 6 | 0 | 9+3+6 / 0+0+0 |
| faithful word | 0.90 | 2939 (427) | 7 | 3 | 4 | 0 | 7+3+4 / 0+0+0 |
| faithful word | 0.95 | 3294 (103) | 7 | 3 | 3 | 0 | 7+3+3 / 0+0+0 |
| faithful word | 1.00 | 3399 (0) | 6 | 3 | 3 | 0 | 6+3+3 / 0+0+0 |
| faithful subtree | 0.80 | 1781 (914) | 13 | 3 | 8 | 0 | 13+3+8 / 0+0+0 |
| faithful subtree | 0.85 | 2382 (772) | 8 | 1 | 6 | 0 | 8+1+6 / 0+0+0 |
| faithful subtree | 0.90 | 2939 (427) | 6 | 1 | 4 | 0 | 6+1+4 / 0+0+0 |
| faithful subtree | 0.95 | 3294 (103) | 6 | 1 | 1 | 0 | 6+1+1 / 0+0+0 |
| faithful subtree | 1.00 | 3399 (0) | 6 | 1 | 1 | 0 | 6+1+1 / 0+0+0 |

## faithful word @ cluster cos 0.80

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are amateur Barbershop Harmony Society and professional groups that sing a cappella  |
| 0.79 (0.79) | 0.322 | appear.Agent (6) | write.Agent (8) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | The episode was written by Bill Wrubel and directed by Lev L. Spiro . |
| 0.76 (0.76) | 0.251 | appear.Agent (6) | replace.Agent (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | Lex Luthor was also replaced as Scott Wells by Sherman Howard . |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.69 (0.69) | 0.377 | replace.Agent (4) | write.Agent (8) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | The episode was written by Bill Wrubel and directed by Lev L. Spiro . |
| 0.67 (0.67) | 0.596 | go.Agent (15) | talk.Agent (8) | {Jessica, Linda, Beth, Katherine, …} {Dan, Daniel} | Kalman and Olivia partied that night and went to bed late. | This is the car that Linda was talking about yesterday. |
| 0.61 (0.61) | 0.517 | begin.Agent (11) | create.Agent (6) | {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers, french settler, french settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.61 (0.61) | 0.465 | cry.Agent (5) | stop.Agent (4) | {Baya, Skura, Inomaru, Barako, …} {Rima} | Rima and Skura stopped crying. | Yanni stopped at a rest area. |
| 0.60 (0.60) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, family business, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.52 (0.52) | 0.464 | buy.Agent (3) | speak.Agent (8) | {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis} | Keike bought a pair of yellow trousers and a blue shirt. | Ashe was spoken by Kari Wahlgren in English and by Mie Sonozaki in Japanese . |
| 0.51 (0.51) | 0.553 | direct.Patient (5) | produce.Patient (11) | {syrian film, film, syrian film, destined, film, syrian film} {movie, film} | The film is a first Syrian nominated film produced and directed for Oscar . | The film is a first Syrian nominated film , produced and destined for Oscar . |
| 0.51 (0.51) | 0.572 | get.Agent (6) | make.Agent (18) | {thing, things, stuff, practice, thing} {Elias, Tobias, Gabor, Gabriel} {Gustavo, Alberto, Martino, Pietro, …} | This was enough to get Stefan arrested. | That makes a big difference. |
| 0.51 (0.51) | 0.595 | get.Agent (6) | take.Agent (9) | {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …} | This was enough to get Stefan arrested. | That could take a while. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization, industrial output} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked, locked, lock, door, locked} {open, close, end, closed} {use, well, direct, do, …} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.51 (0.51) | 0.466 | become.Patient (11) | become.Result (8) | {bad, bad, relationship, bad, matter, bad, problem} {red, rag, rip, rough, …} {lax} | The once strategic relationship between Poland and Germany has now become a bad relationsh | The earth became red with blood. |
| 0.50 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.81 (0.81) | 0.335 | kill.Patient (11) | spend.Agent (4) | {gazelle, giraffe, giraffes} {person, people} | The lions killed the gazelle. | The giraffes spent another day without finding food. |
| 0.66 (0.66) | 0.541 | bear.Patient (6) | study.Agent (12) | {Nicolaus Copernicus, Tycho Brahe} {person, people} | Tycho Brahe was born in 1546 in Denmark. | Nicolaus Copernicus studied canon law at the university of Bologna. |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |
| 0.56 (0.56) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James} {Boldi, Bruno, Felix, Maurice, …} {Jonas, Roger, Bob, Ralph, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.55 (0.55) | 0.368 | appear.Agent (6) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |
| 0.52 (0.52) | 0.562 | study.Agent (12) | succeed.Theme (3) | {Jessica, Linda, Beth, Katherine, …} {person, people} | After much consideration, Beth decided to study mechanical engineering. | Margaret Fleming married James of Barrochan and was succeeded by Alexander , his eldest so |

## faithful word @ cluster cos 0.85

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.88 (0.88) | 0.25 | design.Agent (4) | produce.Agent (8) | {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limited of Aus | The album was produced by Colin Richardson and mixed by Jason Suecof . |
| 0.80 (0.80) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | The birds sang in the early morning light. |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.69 (0.69) | 0.377 | replace.Agent (4) | write.Agent (8) | {person, people} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . | This book had been written by someone famous. |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.51 (0.51) | 0.553 | direct.Patient (5) | produce.Patient (11) | {syrian film, film, syrian film, destined, film, syrian film} {movie, film} | The film is a first Syrian nominated film produced and directed for Oscar . | The film is a first Syrian nominated film , produced and destined for Oscar . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {well, on, there, be} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.51 (0.51) | 0.466 | become.Patient (11) | become.Result (8) | {bad, bad, matter, bad, problem} {lax} {red} | The once strategic relationship between Poland and Germany has now become a bad relationsh | Corruption was widespread in Persia and discipline in the army became dangerously lax . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.81 (0.81) | 0.335 | kill.Patient (11) | spend.Agent (4) | {gazelle, giraffe, giraffes} {person, people} | The lions killed the gazelle. | The giraffes spent another day without finding food. |
| 0.66 (0.66) | 0.541 | bear.Patient (6) | study.Agent (12) | {person, people} {Nicolaus Copernicus, Tycho Brahe} | He was born in Bromma and died in Stockholm . | He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne . |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |
| 0.55 (0.55) | 0.368 | appear.Agent (6) | replace.Theme (4) | {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} | He also appeared in musical films and later in life , in comedic roles . | He dissolved William Ewer as Governor and was replaced by Peter Gaussen . |

## faithful word @ cluster cos 0.90

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {native american, indigenous american, indigenous americans, native americans} {european american settler, european american settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.51 (0.51) | 0.553 | direct.Patient (5) | produce.Patient (11) | {syrian film, film, syrian film} {movie, film} | The film is a first Syrian nominated film produced and directed for Oscar . | The film is a first Syrian nominated film , produced and destined for Oscar . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.51 (0.51) | 0.466 | become.Patient (11) | become.Result (8) | {indigenous, indigenous, people} {bad} {lax} | Once the indigenous people had become indigenous , they would cease to be French . | The once strategic relationship between Poland and Germany has now become a bad relationsh |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.66 (0.66) | 0.541 | bear.Patient (6) | study.Agent (12) | {person, people} {Nicolaus Copernicus, Tycho Brahe} | He was born in Bromma and died in Stockholm . | He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne . |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |

## faithful word @ cluster cos 0.95

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {native american, indigenous american, indigenous americans, native americans} {european american settler} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister} {person} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person} {family} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.57 (0.57) | 0.357 | portray.Agent (5) | win.Agent (7) | {Wilson} {wilson} {James Woods} | Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.51 (0.51) | 0.553 | direct.Patient (5) | produce.Patient (11) | {syrian film, film, syrian film} {movie, film} | The film is a first Syrian nominated film produced and directed for Oscar . | The film is a first Syrian nominated film , produced and destined for Oscar . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {unlocked} {open} {on} | Someone must have left the door unlocked. | Tom leaves the lights on all day. |
| 0.54 (0.54) | 0.466 | become.Patient (11) | become.Result (8) | {indigenous} {bad} {lax} | Once the indigenous people had become indigenous , they would cease to be French . | The once strategic relationship between Poland and Germany has now become a bad relationsh |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person} {family} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.60 (0.60) | 0.427 | portray.Theme (5) | win.Agent (7) | {Wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person} {family} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |

## faithful word @ cluster cos 1.00

_(inventory: 2077 slots; 4131 embedded filler units (one per label); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.80 (0.80) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {person} {sister} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are amateur Barbershop Harmony Society and professional groups that sing a cappella  |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {person} {sister} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.60 (0.60) | 0.487 | appear.Agent (6) | sing.Agent (9) | {person} {sister} | He also appeared in musical films and later in life , in comedic roles . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {family} {person} | The family had been sleeping for about two hours when the fire broke out. | The family is watching a movie together. |
| 0.59 (0.59) | 0.517 | begin.Agent (11) | create.Agent (6) | {european american settler} {indigenous american} {native american} | Some indigenous Americans and European-American settlers began to create a community aroun | Paul created a particle accelerator. |
| 0.57 (0.57) | 0.357 | portray.Agent (5) | win.Agent (7) | {James Woods} {wilson} {Wilson} | James Woods won an Emmy for his portrayal of Wilson . | James Woods won an Emmy for his portrayal of the Wilson . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.61 (0.61) | 0.311 | leave.Patient (3) | leave.Result (3) | {on} {open} {unlocked} | Tom leaves the lights on all day. | Someone must have left the door unlocked. |
| 0.54 (0.54) | 0.466 | become.Patient (11) | become.Result (8) | {indigenous} {inomaru} {lax} | Once the indigenous people had become indigenous , they would cease to be French . | He is the and can become the Inomaru to borrow . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {family} {person} | Four families died in the fire. | The family had been sleeping for about two hours when the fire broke out. |
| 0.60 (0.60) | 0.427 | portray.Theme (5) | win.Agent (7) | {James Woods} {Wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {family} {person} | Four families died in the fire. | The family is watching a movie together. |

## faithful subtree @ cluster cos 0.80

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.78 (0.78) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | The song the actress sang was a song by Mariah Carey. |
| 0.76 (0.76) | 0.251 | appear.Agent (6) | replace.Agent (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | Lex Luthor was also replaced as Scott Wells by Sherman Howard . |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.71 (0.71) | 0.368 | appear.Agent (6) | write.Agent (8) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | The episode was written by Bill Wrubel and directed by Lev L. Spiro . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.67 (0.67) | 0.596 | go.Agent (15) | talk.Agent (8) | {Jessica, Linda, Beth, Katherine, …} {Dan, Daniel} | Kalman and Olivia partied that night and went to bed late. | This is the car that Linda was talking about yesterday. |
| 0.66 (0.66) | 0.406 | replace.Agent (4) | write.Agent (8) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | The episode was written by Bill Wrubel and directed by Lev L. Spiro . |
| 0.61 (0.61) | 0.517 | begin.Agent (11) | create.Agent (6) | {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers, french settler, french settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, family business, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.59 (0.59) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.57 (0.57) | 0.465 | cry.Agent (5) | stop.Agent (4) | {Baya, Skura, Inomaru, Barako, …} {Rima} | Rima and Skura stopped crying. | Yanni stopped at a rest area. |
| 0.52 (0.52) | 0.464 | buy.Agent (3) | speak.Agent (8) | {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis} | Keike bought a pair of yellow trousers and a blue shirt. | Ashe was spoken by Kari Wahlgren in English and by Mie Sonozaki in Japanese . |
| 0.50 (0.50) | 0.653 | go.Agent (15) | speak.Agent (8) | {Jessica, Linda, Beth, Katherine, …} {Baya, Skura, Inomaru, Barako, …} | Kalman and Olivia partied that night and went to bed late. | Sophia speaks Polish and Czech. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization, industrial output} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.65 (0.65) | 0.426 | become.Patient (11) | become.Result (8) | {bad, bad, relationship, bad, matter, bad, problem} {conservative, conservative, revolutionary} {inomaru, inomaru, person} | The once strategic relationship between Poland and Germany has now become a bad relationsh | The most radical revolutionary will become a conservative the day after the revolution. |
| 0.50 (0.50) | 0.406 | replace.Agent (4) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Lex Luthor was also replaced as Scott Wells by Sherman Howard . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.83 (0.83) | 0.335 | kill.Patient (11) | spend.Agent (4) | {gazelle, giraffe, giraffes} {person, people} | The lions killed the gazelle. | The giraffes spent another day without finding food. |
| 0.65 (0.65) | 0.541 | bear.Patient (6) | study.Agent (12) | {Nicolaus Copernicus, Tycho Brahe} {person, people} | Tycho Brahe was born in 1546 in Denmark. | Nicolaus Copernicus studied canon law at the university of Bologna. |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |
| 0.55 (0.55) | 0.475 | hear.Experiencer (8) | try.Agent (10) | {David, William, James} {Boldi, Bruno, Felix, Maurice, …} {Jonas, Roger, Bob, Ralph, …} | James heard upbeat music outside. | David was trying to reach Amanda. |
| 0.55 (0.55) | 0.368 | appear.Agent (6) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |
| 0.52 (0.52) | 0.562 | study.Agent (12) | succeed.Theme (3) | {Jessica, Linda, Beth, Katherine, …} {person, people} | After much consideration, Beth decided to study mechanical engineering. | Margaret Fleming married James of Barrochan and was succeeded by Alexander , his eldest so |

## faithful subtree @ cluster cos 0.85

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.87 (0.87) | 0.25 | design.Agent (4) | produce.Agent (8) | {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limited of Aus | The album was produced by Colin Richardson and mixed by Jason Suecof . |
| 0.78 (0.78) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | The birds sang in the early morning light. |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.66 (0.66) | 0.406 | replace.Agent (4) | write.Agent (8) | {person, people} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …} | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . | He wrote the script in cooperation with Bianca Olsen , Laurie Aubanel and Cyril Rambour . |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {indigenous, indigenous, people, native american, indigenous american, …} {european american settler, european american settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.59 (0.59) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.83 (0.83) | 0.335 | kill.Patient (11) | spend.Agent (4) | {gazelle, giraffe, giraffes} {person, people} | The lions killed the gazelle. | The giraffes spent another day without finding food. |
| 0.65 (0.65) | 0.541 | bear.Patient (6) | study.Agent (12) | {person, people} {Nicolaus Copernicus, Tycho Brahe} | He was born in Bromma and died in Stockholm . | He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne . |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |
| 0.55 (0.55) | 0.368 | appear.Agent (6) | replace.Theme (4) | {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} | He also appeared in musical films and later in life , in comedic roles . | He dissolved William Ewer as Governor and was replaced by Peter Gaussen . |

## faithful subtree @ cluster cos 0.90

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.78 (0.78) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.69 (0.69) | 0.349 | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {native american, indigenous american, indigenous americans, native americans} {european american settler, european american settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.60 (0.60) | 0.408 | sleep.Agent (3) | watch.Agent (5) | {person, people} {family, families} | Jessica forces him to sleep on the couch , where he is seduced by Emily . | Thousands gathered to watch the event. |
| 0.59 (0.59) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sister, sisters} {person, people} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.99 (0.99) | 0.006 | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.65 (0.65) | 0.541 | bear.Patient (6) | study.Agent (12) | {person, people} {Nicolaus Copernicus, Tycho Brahe} | He was born in Bromma and died in Stockholm . | He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne . |
| 0.60 (0.60) | 0.38 | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.57 (0.57) | 0.424 | die.Patient (4) | watch.Agent (5) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Thousands gathered to watch the event. |

## faithful subtree @ cluster cos 0.95

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.78 (0.78) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {sisters} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {sisters} {person} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.65 (0.65) | 0.517 | begin.Agent (11) | create.Agent (6) | {native american, indigenous american, indigenous americans, native americans} {european american settlers} | Some indigenous Americans and European-American settlers began to create a community aroun | This writer created a new language. |
| 0.65 (0.65) | 0.416 | die.Patient (4) | kill.Patient (11) | {people} {person} | Every year millions of people die from mosquitoes. | Cancer kills thousands of people every year. |
| 0.59 (0.59) | 0.487 | appear.Agent (6) | sing.Agent (9) | {sisters} {person} | She and her sisters also appeared in cafes and sang music to accompany silent films . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.57 (0.57) | 0.357 | portray.Agent (5) | win.Agent (7) | {Wilson} {wilson} {James Woods} | Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.60 (0.60) | 0.427 | portray.Theme (5) | win.Agent (7) | {Wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |

## faithful subtree @ cluster cos 1.00

_(inventory: 2077 slots; 3733 embedded filler units (one per filler); 177 un-embeddable occurrences excluded: untyped / number / string / term)_

### cross-event (same role, different event class)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.78 (0.78) | 0.357 | accompany.Agent (4) | sing.Agent (9) | {person} {sisters} | She and her sisters also performed in cafes and sang music to accompany silent films . | There are amateur Barbershop Harmony Society and professional groups that sing a cappella  |
| 0.76 (0.76) | 0.23 | accompany.Agent (4) | appear.Agent (6) | {person} {sisters} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.65 (0.65) | 0.416 | die.Patient (4) | kill.Patient (11) | {people} {person} | Every year millions of people die from mosquitoes. | Cancer kills thousands of people every year. |
| 0.59 (0.59) | 0.487 | appear.Agent (6) | sing.Agent (9) | {person} {sisters} | He also appeared in musical films and later in life , in comedic roles . | She and her sisters also performed in cafes and sang music to accompany silent films . |
| 0.59 (0.59) | 0.517 | begin.Agent (11) | create.Agent (6) | {european american settlers} {indigenous americans} {native americans} | Some indigenous Americans and European-American settlers began to create a community aroun | Paul created a particle accelerator. |
| 0.57 (0.57) | 0.357 | portray.Agent (5) | win.Agent (7) | {James Woods} {wilson} {Wilson} | James Woods won an Emmy for his portrayal of Wilson . | James Woods won an Emmy for his portrayal of the Wilson . |

### cross-role (same event class, different role)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.67 (0.67) | 0.333 | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |

### cross-both (different class AND role — converses)

| cosine (raw) | JSD | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|---|
| 0.60 (0.60) | 0.427 | portray.Theme (5) | win.Agent (7) | {James Woods} {Wilson} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
