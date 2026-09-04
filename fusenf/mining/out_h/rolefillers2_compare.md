# §4.3.2 exact-label vs embedding clusters — the dial (H, 2026-09-03)

- embeddings: /home/manhin/Dev/semantic-parsing-hitl/fusenf/mining/out_h/embeddings (3399 texts, dim 4096); clustering = average linkage on cosine distance, cut at cluster-cosine [0.8, 0.85, 0.9, 1.0] (1.0 = distinct texts = the exact-label method up to rendering)
- comparison: ppmi weighting, >=2 shared informative units, cosine>=0.5, slot n>=3 (identical to the exact-label run); occurrence texts per embeddings.py (modes word, subtree)
- exact-label baseline: 8 signals ({'cross-event': 2, 'cross-role': 3, 'cross-both': 2, 'cross-entity-class': 1})

## Signals across the dial

| mode | cluster cos | clusters (non-singleton) | cross-event | cross-role | cross-both | entity | raw criterion (event / entity) |
|---|---|---|---|---|---|---|---|
| exact label | — | — | 2 | 3 | 2 | 1 | — |
| embed word | 0.80 | 1781 (914) | 3 | 4 | 5 | 3 | 16+2+9 / 3+1+0 |
| embed word | 0.85 | 2382 (772) | 2 | 4 | 4 | 3 | 9+1+6 / 2+0+0 |
| embed word | 0.90 | 2939 (427) | 2 | 3 | 2 | 1 | 7+1+4 / 2+0+0 |
| embed word | 1.00 | 3399 (0) | 2 | 2 | 1 | 1 | 6+1+3 / 2+1+0 |
| embed subtree | 0.80 | 1781 (914) | 2 | 4 | 5 | 3 | 13+2+9 / 3+1+0 |
| embed subtree | 0.85 | 2382 (772) | 2 | 4 | 4 | 3 | 8+1+6 / 2+0+0 |
| embed subtree | 0.90 | 2939 (427) | 2 | 3 | 2 | 1 | 6+1+4 / 2+0+0 |
| embed subtree | 1.00 | 3399 (0) | 2 | 2 | 0 | 1 | 6+1+1 / 2+0+0 |

## embed word @ cluster cos 0.80

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.84 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.66 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |
| 0.50 (0.52) | buy.Agent (3) | speak.Agent (8) | {Baya, Skura, Inomaru, Barako, …} {Horner, Oates, Wyman, Regis} | Keike bought a pair of yellow trousers and a blue shirt. | Ashe was spoken by Kari Wahlgren in English and by Mie Sonozaki in Japanese . |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.68 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization, industrial output} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.58 (0.43) | find.Agent (4) | find.Theme (10) | {Couper} {Gustavo, Alberto, Martino, Pietro, …} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |
| 0.55 (0.12) | form.Agent (7) | form.Patient (6) | {complex, complex, simple, complicated} {easy, simple, soft} {technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.78) | suggest.Theme (3) | write.CoAgent (6) | {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …} | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | He wrote the script in cooperation with Bianca Olsen , Laurie Aubanel and Cyril Rambour . |
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.58 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.54 (0.39) | give.Agent (3) | hear.Experiencer (8) | {Boris, Ivan, Oleg, Fyodor, …} {David, William, James} | Vladimir gave the kids chocolate and mock champagne. | Oleg started hearing barking and growling noises. |
| 0.52 (0.55) | appear.Agent (6) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.85 | 0.311 | {thing, things, stuff} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela, pear, persimmon} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.58 | 0.459 | {top, peak} |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion, church, faith} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.29 | 0.717 | {sequence, series, sequences} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 0.85

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.75 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.57 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.64 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.55 (0.12) | form.Agent (7) | form.Patient (6) | {complex, complex, simple, complicated} {simple} {technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band . |
| 0.53 (0.42) | find.Agent (4) | find.Theme (10) | {Couper} {Martino, Pietro, Lorenzo, Damiano} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.58 (0.55) | appear.Agent (6) | replace.Theme (4) | {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} | He also appeared in musical films and later in life , in comedic roles . | He dissolved William Ewer as Governor and was replaced by Peter Gaussen . |
| 0.53 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.51 (0.42) | give.Agent (3) | hear.Experiencer (8) | {Oleg, Vladimir} {William, James} | Vladimir gave the kids chocolate and mock champagne. | Oleg started hearing barking and growling noises. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.85 | 0.311 | {thing, things} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.58 | 0.459 | {top, peak} |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion, faith} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.29 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 0.90

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.68 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.54 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.62 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.53 (0.42) | find.Agent (4) | find.Theme (10) | {Couper} {Pietro} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.54 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.85 | 0.311 | {thing, things} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.29 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed word @ cluster cos 1.00

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.61 (0.57) | portray.Agent (5) | win.Agent (7) | {James Woods} {wilson} {Wilson} | James Woods won an Emmy for his portrayal of Wilson . | James Woods won an Emmy for his portrayal of the Wilson . |
| 0.60 (0.76) | accompany.Agent (4) | appear.Agent (6) | {person} {sister} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.50 (0.42) | find.Agent (4) | find.Theme (10) | {Pietro} {Couper} | Pietro found himself inside the station. | Kerr broke this season into the first team , but Couper found himself on the bench . |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {family} {person} | Four families died in the fire. | The family had been sleeping for about two hours when the fire broke out. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.85 | 0.311 | {thing} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.29 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.80

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.84 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.66 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.68 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization, industrial output} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.58 (0.43) | find.Agent (4) | find.Theme (10) | {Couper} {Gustavo, Alberto, Martino, Pietro, …} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |
| 0.51 (0.13) | form.Agent (7) | form.Patient (6) | {complex, complex, simple, complicated} {technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | The labourers formed a human barricade. |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.78) | suggest.Theme (3) | write.CoAgent (6) | {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas} {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …} | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner  | He wrote the script in cooperation with Bianca Olsen , Laurie Aubanel and Cyril Rambour . |
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, family business, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.58 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.54 (0.39) | give.Agent (3) | hear.Experiencer (8) | {Boris, Ivan, Oleg, Fyodor, …} {David, William, James} | Vladimir gave the kids chocolate and mock champagne. | Oleg started hearing barking and growling noises. |
| 0.52 (0.55) | appear.Agent (6) | replace.Theme (4) | {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people} | Brian Packham also appeared as Peter in Coronation Street . | He replaced William Ewer as Governor and was succeeded by Peter Gaussen . |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.82 | 0.311 | {thing, things, stuff} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela, pear, persimmon} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion, church, faith} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.27 | 0.717 | {sequence, series, sequences} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.85

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.75 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.57 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.64 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods, Jeremy Irons} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.53 (0.42) | find.Agent (4) | find.Theme (10) | {Couper} {Martino, Pietro, Lorenzo, Damiano} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |
| 0.50 (0.13) | form.Agent (7) | form.Patient (6) | {complex, complex, simple, complicated} {technetium} | The simple complex forms the technetium , whose potassium salt is isostructural . | The labourers formed a human barricade. |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.58 (0.55) | appear.Agent (6) | replace.Theme (4) | {person, people} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} | He also appeared in musical films and later in life , in comedic roles . | He dissolved William Ewer as Governor and was replaced by Peter Gaussen . |
| 0.53 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods, Jeremy Irons} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |
| 0.51 (0.42) | give.Agent (3) | hear.Experiencer (8) | {Oleg, Vladimir} {William, James} | Vladimir gave the kids chocolate and mock champagne. | Oleg started hearing barking and growling noises. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.82 | 0.311 | {thing, things} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion, faith} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.27 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 0.90

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.68 (0.76) | accompany.Agent (4) | appear.Agent (6) | {sister, sisters} {person, people} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.54 (0.69) | portray.Agent (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | Wilson clearly had the best chance to win. |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whig, whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.62 (0.44) | portray.Agent (5) | portray.Theme (5) | {Wilson, wilson} {James Woods} | A Wilson won an Emmy for his portrayal of James Woods . | James Woods won an Emmy for his portrayal of Wilson . |
| 0.53 (0.42) | find.Agent (4) | find.Theme (10) | {Couper} {Pietro} | Kerr broke into the first team that season , but Couper found himself on the bench . | Pietro found himself inside the station. |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 1.00 (0.99) | die.Patient (4) | sleep.Agent (3) | {person, people} {family, families} | Every year millions of people die from mosquitoes. | Jessica forces him to sleep on the couch , where he is seduced by Emily . |
| 0.54 (0.60) | portray.Theme (5) | win.Agent (7) | {Wilson, wilson} {James Woods} | James Woods won an Emmy for his portrayal of Wilson . | Wilson clearly had the best chance to win. |

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.82 | 0.311 | {thing, things} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {session, sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.27 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |

## embed subtree @ cluster cos 1.00

### cross-event (same role, different event class)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.61 (0.76) | accompany.Agent (4) | appear.Agent (6) | {person} {sisters} | She and her sisters also performed in cafes and sang music to accompany silent films . | He also appeared in musical films and later in life , in comedic roles . |
| 0.61 (0.57) | portray.Agent (5) | win.Agent (7) | {James Woods} {wilson} {Wilson} | James Woods won an Emmy for his portrayal of Wilson . | James Woods won an Emmy for his portrayal of the Wilson . |

### cross-role (same event class, different role)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|
| 0.67 (0.67) | welcome.Agent (3) | welcome.Theme (3) | {industrialization} {whigs} | On the other hand , many democrats feared an industrialization that welcomed the whigs . | The host warmly welcomed the guests, and everyone was offered a glass of wine. |
| 0.50 (0.42) | find.Agent (4) | find.Theme (10) | {Pietro} {Couper} | Pietro found himself inside the station. | Kerr broke this season into the first team , but Couper found himself on the bench . |

### cross-both (different class AND role — converses)

| cosine (raw) | slot A | slot B | shared clusters | A e.g. | B e.g. |
|---|---|---|---|---|---|

### #23 flip classes — Theme vs Patient in cluster space (entity fillers)

| class | Theme n / Patient n | cluster cosine | JSD | shared clusters |
|---|---|---|---|---|
| get | 3 / 7 | 0.00 | 1.0 |  |
| leave | 3 / 3 | 0.00 | 1.0 |  |
| do | 2 / 4 | 0.50 | 0.549 | {thing} |
| take | 10 / 2 | 0.00 | 1.0 |  |
| arrange | 1 / 1 | 1.00 | 0.0 | {sessions} |
| base | 2 / 1 | 0.00 | 1.0 |  |
| become | 1 / 11 | 0.00 | 1.0 |  |
| cause | 1 / 4 | 0.00 | 1.0 |  |
| celebrate | 2 / 1 | 0.71 | 0.311 | {mela} |
| clarify | 1 / 1 | 0.00 | 1.0 |  |
| conduct | 3 / 1 | 0.00 | 1.0 |  |
| connect | 4 / 1 | 0.00 | 1.0 |  |
| cover | 1 / 3 | 0.00 | 1.0 |  |
| develop | 1 / 1 | 0.00 | 1.0 |  |
| direct | 1 / 5 | 0.00 | 1.0 |  |
| draw | 1 / 2 | 0.00 | 1.0 |  |
| hold | 1 / 3 | 0.00 | 1.0 |  |
| hold_up | 2 / 1 | 0.00 | 1.0 |  |
| influence | 1 / 2 | 0.71 | 0.311 | {religion} |
| make | 1 / 20 | 0.00 | 1.0 |  |
| pass | 2 / 1 | 0.00 | 1.0 |  |
| pick_up | 2 / 1 | 0.00 | 1.0 |  |
| play | 8 / 1 | 0.29 | 0.717 | {series} |
| reach | 2 / 1 | 0.00 | 1.0 |  |
| spend | 3 / 1 | 0.00 | 1.0 |  |
| spread | 1 / 1 | 0.00 | 1.0 |  |
| start | 1 / 10 | 0.00 | 1.0 |  |
| strike | 1 / 1 | 0.00 | 1.0 |  |
| take_over | 2 / 1 | 0.00 | 1.0 |  |
