# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm — per-pair intermediate

One block per pair from `out_ecmp/canonical_iteme.jsonl` over ../corpora/tierA.jsonl, ../corpora/tierC.jsonl: the two sentences, the COMMON subgraph (the atoms the aligner matched identically under its skolem renaming), the differing subgraphs ALIGNED across the pair, the atoms left over inside those, and the RESIDUE (subgraphs with no counterpart). The record is `align_faithful_pairs.jsonl` (same content, one JSON object per pair); the method's outputs are `align_faithful.jsonl / .md / .metta`.

## How to read a block (the view's rules, disclosed)

- Every atom is written in A's variable names; B's atoms are renamed through the alignment's `renaming a->b` (read it backwards); a variable B has and A has not carries a prime (`x2'`). `~NEG` marks a negative-polarity atom. Only the aligner's eligible atoms appear (Implication and surface atoms excluded, as in the method).
- `common` = the atoms matched identically: the maximum common subgraph the method found (its `identical` count).
- The atoms outside the common part are grouped into SUBGRAPHS per side: two atoms belong together when they share a node symbol that the common part does not hold (a skolem, or a constant standing as a term's first argument, e.g. a compound kind); a symbol the common part does hold is an ANCHOR — where the subgraph hangs — and never merges subgraphs. Subgraphs are written `{atom atom …}`.
- A `group` = subgraphs of A and of B aligned to each other. Tier `near` = the method's own near match (same arity, the same skolems in the same positions, a head or constant substituted — the atoms counted in `near` and in the unit / role mappings). Tier `partial` = this view's extra pass among the leftovers: same arity and at least one equal argument position, the equal position holding a skolem unless the heads are equal or both are class links (Member / Inheritance / GroupOf / Name: the same lexeme asserted on both sides, e.g. a compound kind split into two Member atoms); taken greedily by (equal positions, equal head, atom order), one partner each, and never fusing two groups the near matches already formed. `[…]` after a match lists exactly what differs (head, argument slot, arity, polarity).
- `A only` / `B only` = atoms inside an aligned group with no partner: the group's two sides render the same content with a different number of atoms (a compound split, a role hung elsewhere).
- `residue A` / `residue B` = subgraphs with no counterpart on the other side at all, written `{…}@anchors`; these are the method's unmatched atoms minus the partial matches and the leftovers above. The method's residue records (`kind residue` in the .jsonl) count every unmatched atom, i.e. partial + leftover + residue here.

## Totals — paraphrase pairs

- 413 pairs, 113 with identical parses, 367 with no residue subgraph at all; 383 aligned groups
- atoms: 2346 common; 326 aligned by the method's near match + 106 by a partial match; 118 left over inside aligned groups (A only / B only); 104 in 58 residue subgraphs (no counterpart on the other side)

## Totals — control pairs (item-E: same-polarity member × different-polarity member; a measurement column)

- 468 pairs, 6 with identical parses, 214 with no residue subgraph at all; 424 aligned groups
- atoms: 1497 common; 417 aligned by the method's near match + 20 by a partial match; 65 left over inside aligned groups (A only / B only); 854 in 405 residue subgraphs (no counterpart on the other side)

## Paraphrase pairs

### pairC-0001 · tierC-000001 ↔ tierC-000002 · quality 0.00 · common 0 · aligned 1 near + 0 partial · leftover 15 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Once the indigenous people had become indigenous , they would cease to be French .
B: Once the indigenous peoples had become indigenous , they would cease to be French .

```
renaming a->b  x0->x0
common         —
group 1        anchors —
  A            {(Before e0 e1) (Experiencer e2 x0) (Experiencer e3 x0) (Member e0 become) (Member e1 cease) (Member e2 french) (Member e3 indigenous) (Member x0 indigenous) (Member x0 people) (Past (Member x0 french)) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0) (Result e0 e3) (Result e1 e2)}
  B            {(GroupOf x0 people)}
  near         (Member x0 indigenous) ~ (GroupOf x0 people)   [head Member->GroupOf; arg1 indigenous->people]
  A only       (Before e0 e1) (Experiencer e2 x0) (Experiencer e3 x0) (Member e0 become) (Member e1 cease) (Member e2 french) (Member e3 indigenous) (Member x0 people) (Past (Member x0 french)) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0) (Result e0 e3) (Result e1 e2)
residue A      —
residue B      —
```

### pairC-0002 · tierC-000003 ↔ tierC-000004 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The park is located near the foot of Bay Street , just south of Queens Quay .
B: The park is located near the foot of Bay Street , south of Queens Quay .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 locate) (Member x0 park) (Member x1 foot) (PartOf x1 bay_street) (SouthOf e0 queens_quay)
residue A      —
residue B      —
```

### pairC-0003 · tierC-000005 ↔ tierC-000006 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Banach -- Mackey topology and the weak Arens space topology are relatively rarely used .
B: The Banach - Mackey - topology and the weak Arens - space topology are used relatively rarely .

```
renaming a->b  e0->e1 e1->e0
common         (Manner e0 rare) (Manner e1 rare) (Member banach_mackey_topology topology) (Member e0 use) (Member e1 use) (Member weak_arens_space_topology topology) (Theme e0 weak_arens_space_topology) (Theme e1 banach_mackey_topology)
residue A      —
residue B      —
```

### pairC-0004 · tierC-000007 ↔ tierC-000008 · quality 0.83 · common 10 · aligned 0 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: At the executive level , EEAA represents the central arm of the Ministry .
B: At executive level , EEAA represents the central arm of the ministry .

```
renaming a->b  e0->e0 x1->x1 x2->x0
common         (Agent e0 eeaa) (Inheritance central_arm arm) (Inheritance central_arm central) (Inheritance executive_level executive) (Inheritance executive_level level) (Member e0 represent) (Member x1 central_arm) (Member x2 ministry) (PartOf x1 x2) (Theme e0 x1)
group 1        anchors e0 executive_level
  A            {(Location e0 x0) (Member x0 executive_level)}
  B            {(Location e0 executive_level)}
  partial      (Location e0 x0) ~ (Location e0 executive_level)   [arg1 x0->executive_level]
  A only       (Member x0 executive_level)
residue A      —
residue B      —
```

### pairC-0005 · tierC-000009 ↔ tierC-000010 · quality 0.73 · common 8 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The film is a first Syrian nominated film , produced and destined for Oscar .
B: The film is a first Syrian nominated film produced and directed for Oscar .

```
renaming a->b  e0->e0 e1->e2 e2->e1 x0->x0
common         (Goal e0 oscar) (Member e1 nominate) (Member e2 produce) (Member x0 film) (Member x0 syrian) (Ordinal x0 1 nominate) (Patient e2 x0) (Theme e1 x0)
group 1        anchors e0 x0
  A            {(Experiencer e0 x0)}
  B            {(Patient e0 x0)}
  near         (Experiencer e0 x0) ~ (Patient e0 x0)   [head Experiencer->Patient]
group 2        anchors e0
  A            {(Member e0 destined)}
  B            {(Member e0 direct)}
  near         (Member e0 destined) ~ (Member e0 direct)   [arg1 destined->direct]
residue A      {(Member x0 destined)}@x0
residue B      —
```

### pairC-0006 · tierC-000011 ↔ tierC-000012 · quality 1.00 · common 13 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Cameron changed his mind when Horner presented him with the song .
B: Cameron changed his mind when Horner presented the song to him .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 cameron) (Agent e1 horner) (During e0 e1) (Member e0 change) (Member e1 present) (Member x0 song) (Member x1 mind) (Past e0) (Past e1) (Patient e0 x1) (Possession x1 cameron) (Recipient e1 cameron) (Theme e1 x0)
residue A      —
residue B      —
```

### pairC-0007 · tierC-000013 ↔ tierC-000014 · quality 0.88 · common 15 · aligned 0 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He was also a highly celebrated warrior in popular culture and traditional Chinese dramas .
B: He was also a highly celebrated warrior in popular culture and the traditional Chinese dramas .

```
renaming a->b  e0->e0 x0->x0
common         (Also warrior e0) (Degree e0 celebrated highly) (Experiencer e0 x0) (Inheritance popular_culture culture) (Inheritance popular_culture popular) (Inheritance traditional_chinese_drama chinese) (Inheritance traditional_chinese_drama drama) (Inheritance traditional_chinese_drama traditional) (Location e0 popular_culture) (Member e0 celebrated) (Member e0 warrior) (Member x0 person) (Past (Member x0 celebrated)) (Past (Member x0 warrior)) (Past e0)
group 1        anchors e0 traditional_chinese_drama
  A            {(Location e0 traditional_chinese_drama)}
  B            {(GroupOf x1' traditional_chinese_drama) (Location e0 x1')}
  partial      (Location e0 traditional_chinese_drama) ~ (Location e0 x1')   [arg1 traditional_chinese_drama->x1']
  B only       (GroupOf x1' traditional_chinese_drama)
residue A      —
residue B      —
```

### pairC-0008 · tierC-000015 ↔ tierC-000016 · quality 0.40 · common 2 · aligned 0 near + 3 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Rotunda River is a tributary of the Purul River in Romania .
B: The River Rotunda is a tributary of the Purul River in Romania .

```
renaming a->b  
common         (Location purul_river romania) (Member purul_river river)
group 1        anchors purul_river
  A            {(Member rotunda_river river) (Member rotunda_river tributary) (PartOf rotunda_river purul_river)}
  B            {(Member river_rotunda river) (Member river_rotunda tributary) (PartOf river_rotunda purul_river)}
  partial      (Member rotunda_river river) ~ (Member river_rotunda river)   [arg0 rotunda_river->river_rotunda]
  partial      (Member rotunda_river tributary) ~ (Member river_rotunda tributary)   [arg0 rotunda_river->river_rotunda]
  partial      (PartOf rotunda_river purul_river) ~ (PartOf river_rotunda purul_river)   [arg0 rotunda_river->river_rotunda]
residue A      —
residue B      —
```

### pairC-0009 · tierC-000017 ↔ tierC-000018 · quality 0.69 · common 9 · aligned 2 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner .
B: Her family contacted Corentin Rahier , whom Muriel Zazoui suggested as a potential partner .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1
common         (Agent e1 x0) (Member e0 suggest) (Member e1 contact) (Member x0 family) (Member x1 person) (Past e0) (Past e1) (Possession x0 x1) (Theme e1 corentin_rahier)
group 1        anchors e0
  A            {(Agent e0 corentin_rahier)}
  B            {(Agent e0 muriel_zazoui)}
  near         (Agent e0 corentin_rahier) ~ (Agent e0 muriel_zazoui)   [arg1 corentin_rahier->muriel_zazoui]
group 2        anchors corentin_rahier e0
  A            {(Member muriel_zazoui partner) (Member muriel_zazoui potential) (Theme e0 muriel_zazoui)}
  B            {(Member corentin_rahier partner)} {(Member corentin_rahier potential)} {(Theme e0 corentin_rahier)}
  partial      (Member muriel_zazoui partner) ~ (Member corentin_rahier partner)   [arg0 muriel_zazoui->corentin_rahier]
  partial      (Member muriel_zazoui potential) ~ (Member corentin_rahier potential)   [arg0 muriel_zazoui->corentin_rahier]
  near         (Theme e0 muriel_zazoui) ~ (Theme e0 corentin_rahier)   [arg1 muriel_zazoui->corentin_rahier]
residue A      —
residue B      —
```

### pairC-0010 · tierC-000019 ↔ tierC-000020 · quality 0.90 · common 9 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: This all leads to a big cat fight during the large homecoming game .
B: All this leads to a big cat fight during the great homecoming game .

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (During x0 x1) (Experiencer e0 x2) (Goal e0 x0) (Inheritance cat_fight fight) (Inheritance homecoming_game game) (Member e0 lead) (Member x0 big) (Member x0 cat_fight) (Member x1 homecoming_game)
group 1        anchors x1
  A            {(Member x1 large)}
  B            {(Member x1 great)}
  near         (Member x1 large) ~ (Member x1 great)   [arg1 large->great]
residue A      —
residue B      —
```

### pairC-0011 · tierC-000021 ↔ tierC-000022 · quality 0.70 · common 7 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The task of philosophy is to clarify the empirical relationships of logical phrases .
B: The task of philosophy is to clarify the empirical relationships of logical propositions .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 relationship) (Member e0 clarify) (Member x0 task) (Member x1 empirical) (Possession x0 philosophy) (Theme e0 x1)
group 1        anchors x1
  A            {(Inheritance logical_phrase logical) (Inheritance logical_phrase phrase) (Possession x1 logical_phrase)}
  B            {(Inheritance logical_proposition logical) (Inheritance logical_proposition proposition) (Possession x1 logical_proposition)}
  partial      (Inheritance logical_phrase logical) ~ (Inheritance logical_proposition logical)   [arg0 logical_phrase->logical_proposition]
  near         (Possession x1 logical_phrase) ~ (Possession x1 logical_proposition)   [arg1 logical_phrase->logical_proposition]
  A only       (Inheritance logical_phrase phrase)
  B only       (Inheritance logical_proposition proposition)
residue A      —
residue B      —
```

### pairC-0012 · tierC-000023 ↔ tierC-000024 · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Oates had been the last person to speak to Harvey .
B: Oates had been the last to speak to Harvey .

```
renaming a->b  e0->e0
common         (Agent e0 oates) (Member e0 speak) (Ordinal oates last speak) (Past e0) (Recipient e0 harvey)
residue A      {(Member oates person)}@oates
residue B      —
```

### pairC-0013 · tierC-000025 ↔ tierC-000026 · quality 0.88 · common 23 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Some indigenous Americans and European-American settlers began to create a community around the post .
B: Some Native Americans and European-American settlers began to create a community around the post .

```
renaming a->b  e0->e1 e1->e2 e2->e0 e3->e3 x0->x1 x1->x0 x2->x2 x3->x3
common         (Agent e0 x0) (Agent e1 x1) (Agent e2 x1) (Agent e3 x0) (GroupOf x0 european_american_settler) (Inheritance european_american_settler european_american) (Inheritance european_american_settler settler) (Location e0 x2) (Location e1 x2) (Member e0 create) (Member e1 create) (Member e2 begin) (Member e3 begin) (Member x2 post) (Member x3 community) (Ongoing e0) (Ongoing e1) (Past e2) (Past e3) (Patient e0 x3) (Patient e1 x3) (Theme e2 e1) (Theme e3 e0)
group 1        anchors x1
  A            {(GroupOf x1 indigenous_american) (Inheritance indigenous_american american) (Inheritance indigenous_american indigenous)}
  B            {(GroupOf x1 native_american) (Inheritance native_american american) (Inheritance native_american native)}
  near         (GroupOf x1 indigenous_american) ~ (GroupOf x1 native_american)   [arg1 indigenous_american->native_american]
  partial      (Inheritance indigenous_american american) ~ (Inheritance native_american american)   [arg0 indigenous_american->native_american]
  A only       (Inheritance indigenous_american indigenous)
  B only       (Inheritance native_american native)
residue A      —
residue B      —
```

### pairC-0014 · tierC-000027 ↔ tierC-000028 · quality 0.00 · common 0 · aligned 0 near + 3 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The River Frasin is a tributary of the Straja River in Romania .
B: The Frasin River is a tributary of the Straja River in Romania .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(Location river_frasin romania) (Member river_frasin tributary) (PartOf river_frasin straja_river)}
  B            {(Location frasin_river romania) (Member frasin_river tributary) (PartOf frasin_river straja_river)}
  partial      (Location river_frasin romania) ~ (Location frasin_river romania)   [arg0 river_frasin->frasin_river]
  partial      (Member river_frasin tributary) ~ (Member frasin_river tributary)   [arg0 river_frasin->frasin_river]
  partial      (PartOf river_frasin straja_river) ~ (PartOf frasin_river straja_river)   [arg0 river_frasin->frasin_river]
residue A      —
residue B      —
```

### pairC-0015 · tierC-000029 ↔ tierC-000030 · quality 0.80 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Blair hopes to stop Drake at the race .
B: Blair next hopes to stop Drake at the race .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 blair) (Member e0 hope) (Member x0 race) (Theme e0 (And (Agent x1 blair) (Location x1 x0) (Member x1 stop) (Theme x1 drake)))
residue A      —
residue B      {(Time e0 next)}@e0
```

### pairC-0016 · tierC-000031 ↔ tierC-000032 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Methoni is a village and a former municipality in Pieria regional unit , Greece .
B: Methoni is a village and a former municipality in the Pieria regional unit , Greece .

```
renaming a->b  x0->x0
common         (Inheritance regional_unit regional) (Inheritance regional_unit unit) (Location methoni greece) (Location methoni x0) (Member methoni village) (Member x0 regional_unit) (Past (Member methoni municipality))
residue A      —
residue B      —
```

### pairC-0017 · tierC-000033 ↔ tierC-000034 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The leader of the geological party was his old mentor Mike Morton .
B: The geological party leader was his old mentor , Mike Morton .

```
renaming a->b  x0->x0 x1->x1
common         (Inheritance geological_party geological) (Inheritance geological_party party) (Member mike_morton leader) (Member mike_morton mentor) (Member mike_morton old) (Member x0 person) (Member x1 geological_party) (Possession mike_morton x0) (Possession mike_morton x1)
residue A      —
residue B      —
```

### pairC-0018 · tierC-000035 ↔ tierC-000036 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Then Tommy tells him who Tyrone is .
B: Tommy then tells him who Tyrone is .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 tommy) (Member e0 tell) (Member x0 person) (Recipient e0 x0) (Theme e0 (Question who (Member tyrone who)))
residue A      —
residue B      —
```

### pairC-0019 · tierC-000037 ↔ tierC-000038 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Kayalar is a village connected to the Giresun district of the province of Tirebolu .
B: Kayalar is a village connected to the Giresun district of Tirebolu province .

```
renaming a->b  
common         (Connect kayalar giresun) (Member giresun district) (Member kayalar village) (Member tirebolu province) (PartOf giresun tirebolu) (Symmetric Connect)
residue A      —
residue B      —
```

### pairC-0020 · tierC-000039 ↔ tierC-000040 · quality 0.45 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: While prostitution is illegal in Canada , most activities related to prostitution are legal .
B: While prostitution in Canada is illegal , most of the activities related to prostitution are legal .

```
renaming a->b  e0->e0
common         (Experiencer e0 prostitution) (Inheritance prostitution illegal) (Location e0 canada) (Member e0 illegal) (Symmetric Relate)
residue A      —
residue B      {(GroupOf x0' activity) (GroupOf x1' activity) (Inheritance x1' legal) (ProportionOf x1' x0' most) (Relate x0' prostitution) (SubsetOf x1' x0')}@prostitution
```

### pairC-0021 · tierC-000041 ↔ tierC-000042 · quality 0.92 · common 11 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Jessica forces him to sleep on the couch , where he is seduced by Emily .
B: Jessica obliges him to sleep on the couch , where he is seduced by Emily .

```
renaming a->b  e0->e1 e1->e0 e2->e2 x0->x0 x1->x1
common         (Agent e0 jessica) (Agent e1 x0) (Agent e2 emily) (Location e1 x1) (Location e2 x1) (Member e1 sleep) (Member e2 seduce) (Member x0 person) (Member x1 couch) (Theme e0 e1) (Theme e2 x0)
group 1        anchors e0
  A            {(Member e0 force)}
  B            {(Member e0 oblige)}
  near         (Member e0 force) ~ (Member e0 oblige)   [arg1 force->oblige]
residue A      —
residue B      —
```

### pairC-0022 · tierC-000043 ↔ tierC-000044 · quality 0.60 · common 6 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 24 renamings tied

A: Celestia implores Twilight and her friends to stop the Elements of Harmony to recover Chrysalis .
B: Celestia invites Twilight and her friends to stop the elements of harmony to recover Chrysalis .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1 x2->x2 x3->x3 x4->x4
common         (Agent e0 celestia) (Agent e1 celestia) (GroupOf x0 friend) (Possession x0 twilight) (Recipient e0 x0) (Recipient e1 twilight)
group 1        anchors e0
  A            {(Member e0 implore)}
  B            {(Member e0 invite)}
  near         (Member e0 implore) ~ (Member e0 invite)   [arg1 implore->invite]
group 2        anchors e1
  A            {(Member e1 implore)}
  B            {(Member e1 invite)}
  near         (Member e1 implore) ~ (Member e1 invite)   [arg1 implore->invite]
group 3        anchors e0 x0
  A            {(Theme e0 (And (Agent x1 x0) (Agent x2 x0) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2)))}
  B            {(Theme e0 (And (Agent x3 x0) (Agent x4 x0) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3)))}
  near         (Theme e0 (And (Agent x1 x0) (Agent x2 x0) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2))) ~ (Theme e0 (And (Agent x3 x0) (Agent x4 x0) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3)))   [arg1 (And (Agent x1 x0) (Agent x2 x0) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2))->(And (Agent x3 x0) (Agent x4 x0) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3))]
group 4        anchors e1
  A            {(Theme e1 (And (Agent x3 twilight) (Agent x4 twilight) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3)))}
  B            {(Theme e1 (And (Agent x1 twilight) (Agent x2 twilight) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2)))}
  near         (Theme e1 (And (Agent x3 twilight) (Agent x4 twilight) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3))) ~ (Theme e1 (And (Agent x1 twilight) (Agent x2 twilight) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2)))   [arg1 (And (Agent x3 twilight) (Agent x4 twilight) (Member x3 recover) (Member x4 stop) (Patient x4 elements_of_harmony) (Theme x3 chrysalis) (To x4 x3))->(And (Agent x1 twilight) (Agent x2 twilight) (Member x1 stop) (Member x2 recover) (Patient x1 elements_of_harmony) (Theme x2 chrysalis) (To x1 x2))]
residue A      —
residue B      —
```

### pairC-0023 · tierC-000045 ↔ tierC-000046 · quality 0.87 · common 13 · aligned 1 near + 0 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan .
B: In Eskisehir , the company built a hotel in Turkey and a paper mill in Kazakhstan .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Agent e1 x0) (Location e0 eskisehir) (Location e0 turkey) (Location e1 kazakhstan) (Member e0 build) (Member e1 build) (Member x0 company) (Member x2 hotel) (Past e0) (Past e1) (Patient e0 x2) (Patient e1 x1)
group 1        anchors x1
  A            {(Inheritance paper_factory factory) (Member x1 paper_factory)}
  B            {(Inheritance paper_mill mill) (Member x1 paper_mill)}
  near         (Member x1 paper_factory) ~ (Member x1 paper_mill)   [arg1 paper_factory->paper_mill]
  A only       (Inheritance paper_factory factory)
  B only       (Inheritance paper_mill mill)
residue A      —
residue B      —
```

### pairC-0024 · tierC-000047 ↔ tierC-000048 · quality 1.00 · common 13 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: He spent his exile in France and preached Gareccio in Italy where he preached .
B: He spent his exile in France and in Italy preached Gareccio , where he preached .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 x0) (Location e0 gareccio) (Location e0 italy) (Location e1 france) (Member e0 preach) (Member e1 spend) (Member x0 man) (Member x1 exile) (Past e0) (Past e1) (Patient e1 x1) (Possession x1 x0)
residue A      —
residue B      —
```

### pairC-0025 · tierC-000049 ↔ tierC-000050 · quality 0.80 · common 12 · aligned 1 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He also appeared in music films and later in life , in comedic roles .
B: He also appeared in musical films and later in life , in comedic roles .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 x0) (Agent e1 x0) (Also appear e1) (Inheritance comedic_role comedic) (Inheritance comedic_role role) (Location e0 comedic_role) (Member e0 appear) (Member e1 appear) (Member x0 person) (Past e0) (Past e1) (Time e0 later_in_life)
group 1        anchors e1
  A            {(Inheritance music_film film) (Location e1 music_film)}
  B            {(Inheritance musical_film film) (Inheritance musical_film musical) (Location e1 musical_film)}
  partial      (Inheritance music_film film) ~ (Inheritance musical_film film)   [arg0 music_film->musical_film]
  near         (Location e1 music_film) ~ (Location e1 musical_film)   [arg1 music_film->musical_film]
  B only       (Inheritance musical_film musical)
residue A      —
residue B      —
```

### pairC-0026 · tierC-000051 ↔ tierC-000052 · quality 0.00 · common 0 · aligned 0 near + 4 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Olt River is a right tributary of the Madicea River in Romania .
B: The river Olt is a tributary of the river Madicea in Romania .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(Inheritance right_tributary right) (Inheritance right_tributary tributary) (Location olt_river romania) (Member madicea_river river) (Member olt_river right_tributary) (Member olt_river river) (Possession olt_river madicea_river)}
  B            {(Location olt romania) (Member madicea river) (Member olt river) (Member olt tributary) (Possession olt madicea)}
  partial      (Inheritance right_tributary tributary) ~ (Member olt tributary)   [head Inheritance->Member; arg0 right_tributary->olt]
  partial      (Location olt_river romania) ~ (Location olt romania)   [arg0 olt_river->olt]
  partial      (Member madicea_river river) ~ (Member madicea river)   [arg0 madicea_river->madicea]
  partial      (Member olt_river river) ~ (Member olt river)   [arg0 olt_river->olt]
  A only       (Inheritance right_tributary right) (Member olt_river right_tributary) (Possession olt_river madicea_river)
  B only       (Possession olt madicea)
residue A      —
residue B      —
```

### pairC-0027 · tierC-000053 ↔ tierC-000054 · quality 0.78 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: He serves as President of the New York Stock Exchange , including the NYSE Group .
B: He serves as the president of the NYSE Group , including the New York Stock Exchange .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (As e0 x1) (Member e0 serve) (Member new_york_stock_exchange stock_exchange) (Member nyse_group group) (Member x0 person) (Member x1 president)
group 1        anchors new_york_stock_exchange nyse_group x1
  A            {(Possession x1 new_york_stock_exchange)}
  B            {(Possession x1 nyse_group)}
  near         (Possession x1 new_york_stock_exchange) ~ (Possession x1 nyse_group)   [arg1 new_york_stock_exchange->nyse_group]
residue A      {(PartOf nyse_group new_york_stock_exchange)}@new_york_stock_exchange,nyse_group
residue B      {(PartOf new_york_stock_exchange nyse_group)}@new_york_stock_exchange,nyse_group
```

### pairC-0028 · tierC-000055 ↔ tierC-000056 · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Paul Cavanagh also doubled for Nelson .
B: Paul Paul Cavanagh doubled also for Nelson .

```
renaming a->b  e0->e0
common         (Beneficiary e0 nelson) (Member e0 double) (Past e0)
group 1        anchors e0
  A            {(Agent e0 paul_cavanagh)}
  B            {(Agent e0 paul_paul_cavanagh)}
  near         (Agent e0 paul_cavanagh) ~ (Agent e0 paul_paul_cavanagh)   [arg1 paul_cavanagh->paul_paul_cavanagh]
group 2        anchors double e0 nelson
  A            {(Also double e0)}
  B            {(Also nelson e0)}
  near         (Also double e0) ~ (Also nelson e0)   [arg0 double->nelson]
residue A      —
residue B      —
```

### pairC-0029 · tierC-000057 ↔ tierC-000058 · quality 0.50 · common 2 · aligned 0 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Pustnic River or Orociu River is a tributary of the Oraciu River in Romania .
B: The Pustnic River or Orociu River is a tributary of the River Oraciu in Romania .

```
renaming a->b  
common         (Location pustnic_river romania) (Member pustnic_river river)
group 1        anchors pustnic_river
  A            {(Member oraciu_river river) (TributaryOf pustnic_river oraciu_river)}
  B            {(Member river_oraciu river) (TributaryOf pustnic_river river_oraciu)}
  partial      (Member oraciu_river river) ~ (Member river_oraciu river)   [arg0 oraciu_river->river_oraciu]
  partial      (TributaryOf pustnic_river oraciu_river) ~ (TributaryOf pustnic_river river_oraciu)   [arg1 oraciu_river->river_oraciu]
residue A      —
residue B      —
```

### pairC-0030 · tierC-000059 ↔ tierC-000060 · quality 0.67 · common 6 · aligned 0 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Cranoe is a small village and civil community in the district of Harborough Leicestershire , England .
B: Cranoe is a small village and civil parish in the Harborough district of Leicestershire , England .

```
renaming a->b  
common         (Location cranoe harborough) (Location harborough leicestershire) (Location leicestershire england) (Member cranoe small) (Member cranoe village) (Member harborough district)
group 1        anchors cranoe
  A            {(Inheritance civil_community civil) (Inheritance civil_community community) (Member cranoe civil_community)}
  B            {(Inheritance civil_parish civil) (Inheritance civil_parish parish) (Member cranoe civil_parish)}
  partial      (Inheritance civil_community civil) ~ (Inheritance civil_parish civil)   [arg0 civil_community->civil_parish]
  partial      (Member cranoe civil_community) ~ (Member cranoe civil_parish)   [arg1 civil_community->civil_parish]
  A only       (Inheritance civil_community community)
  B only       (Inheritance civil_parish parish)
residue A      —
residue B      —
```

### pairC-0031 · tierC-000061 ↔ tierC-000062 · quality 0.78 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: It was believed that true philosophy could be separated from popular wisdom by this method .
B: It was believed by this method true philosophy could be separated from popular wisdom .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Inheritance popular_wisdom popular) (Inheritance popular_wisdom wisdom) (Inheritance true_philosophy philosophy) (Inheritance true_philosophy true) (Member e0 believe) (Member x0 method) (Past e0)
group 1        anchors e0 popular_wisdom true_philosophy x0
  A            {(Theme e0 (And (Can x1) (Instrument x1 x0) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom)))}
  B            {(Theme e0 (And (Can x1) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom)))}
  near         (Theme e0 (And (Can x1) (Instrument x1 x0) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom))) ~ (Theme e0 (And (Can x1) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom)))   [arg1 (And (Can x1) (Instrument x1 x0) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom))->(And (Can x1) (Member x1 separate) (Patient x1 true_philosophy) (Source x1 popular_wisdom))]
residue A      —
residue B      {(Experiencer e0 x0)}@e0,x0
```

### pairC-0032 · tierC-000063 ↔ tierC-000064 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 2

A: Lake Sammamish enters the Issaquah Creek park .
B: Lake Sammamish enters Issaquah Creek in the park .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 lake_sammamish) (Member e0 enter) (Member lake_sammamish lake)
group 1        anchors e0
  A            {(Inheritance issaquah_creek_park park) (Member x0 issaquah_creek_park) (Theme e0 x0)}
  B            {(Location e0 x0) (Member x0 park)}
  near         (Member x0 issaquah_creek_park) ~ (Member x0 park)   [arg1 issaquah_creek_park->park]
  near         (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
  A only       (Inheritance issaquah_creek_park park)
residue A      —
residue B      {(Member issaquah_creek creek) (Theme e0 issaquah_creek)}@e0
```

### pairC-0033 · tierC-000065 ↔ tierC-000066 · quality 0.82 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 2

A: Among the admirers were Manuel Machado and the brothers Antonio and Jacinto Benavente .
B: Among her admirers were Manuel Machado and the brothers Antonio and Jacinto Benavente .

```
renaming a->b  x0->x0
common         (Brother antonio_benavente jacinto_benavente) (GroupOf x0 admirer) (Past (Member antonio_benavente admirer)) (Past (Member jacinto_benavente admirer)) (Past (Member manuel_machado admirer)) (Past (PartOf antonio_benavente x0)) (Past (PartOf jacinto_benavente x0)) (Past (PartOf manuel_machado x0)) (Symmetric Brother)
residue A      —
residue B      {(Member x1' person) (Possession x0 x1')}@x0
```

### pairC-0034 · tierC-000067 ↔ tierC-000068 · quality 0.80 · common 4 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The direct synthesis is a vigorous reaction of caesium with other halogens .
B: The direct synthesis is a violent reaction of caesium with other halogens .

```
renaming a->b  
common         (Inheritance direct_synthesis direct) (Inheritance direct_synthesis reaction) (Inheritance direct_synthesis synthesis) (React caesium halogen)
group 1        anchors direct_synthesis
  A            {(Inheritance direct_synthesis vigorous)}
  B            {(Inheritance direct_synthesis violent)}
  partial      (Inheritance direct_synthesis vigorous) ~ (Inheritance direct_synthesis violent)   [arg1 vigorous->violent]
residue A      —
residue B      —
```

### pairC-0035 · tierC-000069 ↔ tierC-000070 · quality 0.78 · common 7 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The reduced speed limit is generally , posted as low as within the two cities .
B: The reduced speed limit is generally as low as within the two cities .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 city) (Inheritance speed_limit limit) (Location e0 x0) (Member x1 low) (Member x1 reduced) (Member x1 speed_limit)
group 1        anchors e0
  A            {(Member e0 post)}
  B            {(Member e0 low)}
  near         (Member e0 post) ~ (Member e0 low)   [arg1 post->low]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Experiencer e0 x1)}
  near         (Theme e0 x1) ~ (Experiencer e0 x1)   [head Theme->Experiencer]
residue A      —
residue B      —
```

### pairC-0036 · tierC-000071 ↔ tierC-000072 · quality 0.93 · common 14 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: With the help of Karen , he builds the horn and takes the identity of Herald .
B: With the help of Karen , he built the horn and takes the identity of Herald .

```
renaming a->b  e0->e0 e1->e2 e2->e1 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 karen) (Instrument e0 e2) (Instrument e1 e2) (Member e0 take) (Member e1 build) (Member e2 help) (Member x0 person) (Member x1 horn) (Member x2 identity) (Patient e1 x1) (Possession x2 herald) (Theme e0 x2)
residue A      —
residue B      {(Past e1)}@e1
```

### pairC-0037 · tierC-000073 ↔ tierC-000074 · quality 0.83 · common 5 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: For a number of reasons , some recombinant colonies can not contain the desired white plasmid .
B: Some recombinant colonies may not contain the desired white plasmid for a number of reasons .

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         (Inheritance recombinant_colony colony) (Inheritance recombinant_colony recombinant) (Member x2 desired) (Member x2 plasmid) (Member x2 white)
group 1        anchors recombinant_colony x2
  A            {(And (Agent x0 x1) (Can x0) (GroupOf x1 recombinant_colony) (Member x0 contain) (Theme x0 x2)) ~NEG}
  B            {(And (Agent x0 x1) (GroupOf x1 recombinant_colony) (Member x0 contain) (Might x0) (Theme x0 x2)) ~NEG}
  partial      (And (Agent x0 x1) (Can x0) (GroupOf x1 recombinant_colony) (Member x0 contain) (Theme x0 x2)) ~NEG ~ (And (Agent x0 x1) (GroupOf x1 recombinant_colony) (Member x0 contain) (Might x0) (Theme x0 x2)) ~NEG   [arg1 (Can x0)->(GroupOf x1 recombinant_colony); arg2 (GroupOf x1 recombinant_colony)->(Member x0 contain); arg3 (Member x0 contain)->(Might x0)]
residue A      —
residue B      —
```

### pairC-0038 · tierC-000075 ↔ tierC-000076 · quality 0.91 · common 10 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Margaret Fleming married James of Barrochan and was succeeded by Alexander , his eldest son .
B: Margaret Fleming married James of Barrochan and was followed by Alexander , his eldest son .

```
renaming a->b  e0->e1 e1->e0
common         (Agent e0 margaret) (Agent e1 alexander) (Member alexander son) (Member e0 marry) (Most old alexander son) (Past e0) (Past e1) (Possession alexander james) (Theme e0 james) (Theme e1 margaret)
group 1        anchors e1
  A            {(Member e1 succeed)}
  B            {(Member e1 follow)}
  near         (Member e1 succeed) ~ (Member e1 follow)   [arg1 succeed->follow]
residue A      —
residue B      —
```

### pairC-0039 · tierC-000077 ↔ tierC-000078 · quality 0.56 · common 5 · aligned 2 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The spokesman first was Thomas Bain , and later James David Edgar .
B: The Speaker was first Thomas Bain , and later James David Edgar .

```
renaming a->b  e0->e0 e1->e1
common         (Before e0 e1) (Experiencer e0 thomas_bain) (Experiencer e1 james_david_edgar) (Past e0) (Past e1)
group 1        anchors e0
  A            {(Member e0 spokesman)}
  B            {(Member e0 speaker)}
  near         (Member e0 spokesman) ~ (Member e0 speaker)   [arg1 spokesman->speaker]
group 2        anchors e1
  A            {(Member e1 spokesman)}
  B            {(Member e1 speaker)}
  near         (Member e1 spokesman) ~ (Member e1 speaker)   [arg1 spokesman->speaker]
group 3        anchors james_david_edgar
  A            {(Member james_david_edgar spokesman)}
  B            {(Member james_david_edgar speaker)}
  partial      (Member james_david_edgar spokesman) ~ (Member james_david_edgar speaker)   [arg1 spokesman->speaker]
group 4        anchors thomas_bain
  A            {(Member thomas_bain spokesman)}
  B            {(Member thomas_bain speaker)}
  partial      (Member thomas_bain spokesman) ~ (Member thomas_bain speaker)   [arg1 spokesman->speaker]
residue A      —
residue B      —
```

### pairC-0040 · tierC-000079 ↔ tierC-000080 · quality 0.62 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Asserson was working in the Church of Norway and was married to Eivind Saxlund .
B: Asserson was active in the Church of Norway and was married to Eivind Saxlund .

```
renaming a->b  e0->e0
common         (Location e0 church_of_norway) (Member church_of_norway church) (Past (Married asserson eivind_saxlund)) (Past e0) (Symmetric Married)
group 1        anchors asserson e0
  A            {(Agent e0 asserson)}
  B            {(Experiencer e0 asserson)}
  near         (Agent e0 asserson) ~ (Experiencer e0 asserson)   [head Agent->Experiencer]
group 2        anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 active)}
  near         (Member e0 work) ~ (Member e0 active)   [arg1 work->active]
residue A      {(Ongoing e0)}@e0
residue B      {(Past (Member asserson active))}@asserson
```

### pairC-0041 · tierC-000081 ↔ tierC-000082 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Elati is a village in the Kozani regional unit , Greece .
B: Elati is a village in regional unit Kozani , Greece .

```
renaming a->b  
common         (Inheritance regional_unit regional) (Inheritance regional_unit unit) (Location elati kozani) (Location kozani greece) (Member elati village) (Member kozani regional_unit)
residue A      —
residue B      —
```

### pairC-0042 · tierC-000083 ↔ tierC-000084 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Those who miss it thus often completely quote the third and fourth lines .
B: Therefore , those who miss it often quote the third and fourth lines completely .

```
renaming a->b  x1->x1 x2->x2
common         (Member x1 line) (Member x2 line) (Ordinal x1 3 line) (Ordinal x2 4 line)
residue A      —
residue B      —
```

### pairC-0043 · tierC-000085 ↔ tierC-000086 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Thomas Fothergill was an academic English administrator at the University of Oxford .
B: Thomas Fothergill D.D . was an academic English administrator at the University of Oxford .

```
renaming a->b  e0->e0
common         (Experiencer e0 thomas_fothergill) (Location e0 university_of_oxford) (Member e0 administrator) (Member university_of_oxford university) (Past (Member thomas_fothergill academic)) (Past (Member thomas_fothergill administrator)) (Past (Member thomas_fothergill english)) (Past e0)
residue A      —
residue B      —
```

### pairC-0044 · tierC-000087 ↔ tierC-000088 · quality 0.50 · common 3 · aligned 1 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: On the other hand , many democrats feared an industrialization that welcomed the whigs .
B: On the other hand , many Democrats feared industrialization the Whigs welcomed .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 welcome) (Past e0)
group 1        anchors e0
  A            {(GroupOf x1 whig) (Theme e0 x1)}
  B            {(Theme e0 industrialization)}
  partial      (Theme e0 x1) ~ (Theme e0 industrialization)   [arg1 x1->industrialization]
  A only       (GroupOf x1 whig)
group 2        anchors x0
  A            {(Member x0 industrialization)}
  B            {(GroupOf x0 whig)}
  near         (Member x0 industrialization) ~ (GroupOf x0 whig)   [head Member->GroupOf; arg1 industrialization->whig]
residue A      —
residue B      —
```

### pairC-0045 · tierC-000089 ↔ tierC-000090 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He wrote the script in cooperation with Bianca Olsen , Laurie Aubanel and Cyril Rambour .
B: He wrote the screenplay in cooperation with Cyril Rambour , Laurie Aubanel and Bianca Olsen .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (CoAgent e0 bianca_olsen) (CoAgent e0 cyril_rambour) (CoAgent e0 laurie_aubanel) (Member e0 write) (Member x0 person) (Past e0) (Patient e0 x1)
group 1        anchors x1
  A            {(Member x1 script)}
  B            {(Member x1 screenplay)}
  near         (Member x1 script) ~ (Member x1 screenplay)   [arg1 script->screenplay]
residue A      —
residue B      —
```

### pairC-0046 · tierC-000091 ↔ tierC-000092 · quality 0.92 · common 12 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The movie was produced by Sy Weintraub and Harvey Hayutin and directed by Robert Day .
B: The movie was staged by Robert Day and produced by Sy Weintraub and Harvey Hayutin .

```
renaming a->b  e0->e0 e1->e1 e2->e2 x0->x0
common         (Agent e0 sy_weintraub) (Agent e1 harvey_hayutin) (Agent e2 robert_day) (Member e0 produce) (Member e1 produce) (Member x0 movie) (Past e0) (Past e1) (Past e2) (Patient e0 x0) (Patient e1 x0) (Patient e2 x0)
group 1        anchors e2
  A            {(Member e2 direct)}
  B            {(Member e2 stage)}
  near         (Member e2 direct) ~ (Member e2 stage)   [arg1 direct->stage]
residue A      —
residue B      —
```

### pairC-0047 · tierC-000093 ↔ tierC-000094 · quality 0.80 · common 8 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Ashe was voiced by Kari Wahlgren in English and by Mie Sonozaki in Japanese .
B: Ashe was spoken by Kari Wahlgren in English and by Mie Sonozaki in Japanese .

```
renaming a->b  e0->e1 e1->e0
common         (Agent e0 kari_wahlgren) (Agent e1 mie_sonozaki) (Manner e0 english) (Manner e1 japanese) (Past e0) (Past e1) (Theme e0 ashe) (Theme e1 ashe)
group 1        anchors e0
  A            {(Member e0 voice)}
  B            {(Member e0 speak)}
  near         (Member e0 voice) ~ (Member e0 speak)   [arg1 voice->speak]
group 2        anchors e1
  A            {(Member e1 voice)}
  B            {(Member e1 speak)}
  near         (Member e1 voice) ~ (Member e1 speak)   [arg1 voice->speak]
residue A      —
residue B      —
```

### pairC-0048 · tierC-000095 ↔ tierC-000096 · quality 1.00 · common 12 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The region was then followed by the Muslim house of Arakkal , ruled by Tipu Sultan .
B: The region was followed by the Muslim house of Arakkal , ruled by Tipu Sultan .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 tipu_sultan) (Member e0 follow) (Member e1 rule) (Member x0 house) (Member x0 muslim) (Member x1 region) (Past e0) (Past e1) (Possession x0 arakkal) (Theme e0 x1) (Theme e1 x0)
residue A      —
residue B      —
```

### pairC-0049 · tierC-000097 ↔ tierC-000098 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It is widespread in Europe but is never as common as L. sponsa .
B: It is widespread in Europe , but it is never as common as L. sponsa .

```
renaming a->b  e0->e0 x0->x0
common         (But e0 (SameDegree common x0 l_sponsa)) (Experiencer e0 x0) (KindProperty x0 widespread) (Location e0 europe) (Member e0 widespread) (SameDegree common x0 l_sponsa) ~NEG
residue A      —
residue B      —
```

### pairC-0050 · tierC-000099 ↔ tierC-000100 · quality 0.67 · common 6 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He dissolved William Ewer as Governor and was replaced by Peter Gaussen .
B: He replaced William Ewer as Governor and was succeeded by Peter Gaussen .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 peter_gaussen) (Agent e1 x0) (Member x0 governor) (Past e0) (Past e1) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 replace)}
  B            {(Member e0 succeed)}
  near         (Member e0 replace) ~ (Member e0 succeed)   [arg1 replace->succeed]
group 2        anchors e1
  A            {(Member e1 dissolve)}
  B            {(Member e1 replace)}
  near         (Member e1 dissolve) ~ (Member e1 replace)   [arg1 dissolve->replace]
group 3        anchors e1
  A            {(Patient e1 william_ewer)}
  B            {(Theme e1 william_ewer)}
  near         (Patient e1 william_ewer) ~ (Theme e1 william_ewer)   [head Patient->Theme]
residue A      —
residue B      —
```

### pairC-0051 · tierC-000101 ↔ tierC-000102 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: In physics equipotential ellipsoids appear as confocal surfaces .
B: Equipotential ellipsoids appear in the physics as confocal surfaces .

```
renaming a->b  
common         (Appear equipotential_ellipsoid confocal_surface) (Inheritance confocal_surface confocal) (Inheritance confocal_surface surface) (Inheritance equipotential_ellipsoid ellipsoid) (Inheritance equipotential_ellipsoid equipotential) (Location equipotential_ellipsoid physics)
residue A      —
residue B      —
```

### pairC-0052 · tierC-000103 ↔ tierC-000104 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The album was produced by Colin Richardson and mixed by Jason Suecof .
B: The album was produced by Colin Richardson and merged by Jason Suecof .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 jason_suecof) (Agent e1 colin_richardson) (Member e1 produce) (Member x0 album) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
group 1        anchors e0
  A            {(Member e0 mix)}
  B            {(Member e0 merge)}
  near         (Member e0 mix) ~ (Member e0 merge)   [arg1 mix->merge]
residue A      —
residue B      —
```

### pairC-0053 · tierC-000105 ↔ tierC-000106 · quality 0.60 · common 3 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: East Coast Railway is one of the three divisions of Khurda Road .
B: The East Coast Railway is one of three departments of Khurda Road .

```
renaming a->b  x0->x0
common         (Cardinality x0 3) (PartOf east_coast_railway x0) (PartOf x0 khurda_road)
group 1        anchors x0
  A            {(GroupOf x0 division)}
  B            {(GroupOf x0 department)}
  near         (GroupOf x0 division) ~ (GroupOf x0 department)   [arg1 division->department]
group 2        anchors east_coast_railway
  A            {(Member east_coast_railway division)}
  B            {(Member east_coast_railway department)}
  partial      (Member east_coast_railway division) ~ (Member east_coast_railway department)   [arg1 division->department]
residue A      —
residue B      —
```

### pairC-0054 · tierC-000107 ↔ tierC-000108 · quality 0.82 · common 9 · aligned 1 near + 0 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Ralph encouraged Maurice in mathematics and chess play .
B: Ralph encouraged Maurice in mathematics and chess .

```
renaming a->b  e0->e0 e1->e1
common         (Agent e0 ralph) (Agent e1 ralph) (In e1 mathematics) (Member e0 encourage) (Member e1 encourage) (Past e0) (Past e1) (Theme e0 maurice) (Theme e1 maurice)
group 1        anchors e0
  A            {(In e0 chess_play) (Inheritance chess_play play)}
  B            {(In e0 chess)}
  near         (In e0 chess_play) ~ (In e0 chess)   [arg1 chess_play->chess]
  A only       (Inheritance chess_play play)
residue A      —
residue B      —
```

### pairC-0055 · tierC-000109 ↔ tierC-000110 · quality 1.00 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It was not long after Wyman joined the group that Watts took over the drums .
B: It was not long after Wyman joined the group when Watts took over the drums .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 wyman) (Agent e1 watts) (Before e0 e1) (Member e0 join) (Member e1 take_over) (Member x0 group) (Member x1 drum) (Past e0) (Past e1) (Theme e0 x0) (Theme e1 x1)
residue A      —
residue B      —
```

### pairC-0056 · tierC-000111 ↔ tierC-000112 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: In Japan it was first given on and the name was discovered .
B: In Japan it was first given up and the name was discovered .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Location e0 japan) (Location e1 japan) (Manner e1 first) (Member e0 discover) (Member x0 name) (Past e0) (Past e1) (Theme e0 x0)
group 1        anchors e1
  A            {(Member e1 give_on)}
  B            {(Member e1 give_up)}
  near         (Member e1 give_on) ~ (Member e1 give_up)   [arg1 give_on->give_up]
residue A      —
residue B      —
```

### pairC-0057 · tierC-000113 ↔ tierC-000114 · quality 0.80 · common 8 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam inherited .
B: Like many aspects of Islamic ivory , this reflects the Byzantine traditions that inherited Islam .

```
renaming a->b  e0->e1 e1->e0 x0->x1 x1->x0
common         (Agent e0 x0) (GroupOf x1 tradition) (Member e0 reflect) (Member e1 inherit) (Member x0 aspect) (Member x1 byzantine) (Past e1) (Theme e0 x1)
group 1        anchors e1
  A            {(Agent e1 islam)}
  B            {(Theme e1 islam)}
  near         (Agent e1 islam) ~ (Theme e1 islam)   [head Agent->Theme]
group 2        anchors e1 x1
  A            {(Theme e1 x1)}
  B            {(Agent e1 x1)}
  near         (Theme e1 x1) ~ (Agent e1 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### pairC-0058 · tierC-000115 ↔ tierC-000116 · quality 0.20 · common 2 · aligned 0 near + 5 partial · leftover 6 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The listed buildings of Derwent Isle are a large house and a former chapel .
B: The listed buildings on Derwent Isle are a large house and a former chapel .

```
renaming a->b  
common         (Inheritance listed_building building) (Inheritance listed_building listed)
group 1        anchors listed_building
  A            {(Member x0 chapel) ~NEG (Member x0 listed_building) (Past (Member x0 chapel)) (Possession x0 derwent_isle)} {(Member x1 house) (Member x1 large) (Member x1 listed_building) (Possession x1 derwent_isle)}
  B            {(Location e0' derwent_isle) (Member e0' house) (Member e0' large) (Member e0' listed_building)} {(Location e1' derwent_isle) (Member e1' chapel) ~NEG (Member e1' listed_building) (Past (Member e1' chapel))}
  partial      (Member x0 chapel) ~NEG ~ (Member e1' chapel) ~NEG   [arg0 x0->e1']
  partial      (Member x0 listed_building) ~ (Member e0' listed_building)   [arg0 x0->e0']
  partial      (Member x1 house) ~ (Member e0' house)   [arg0 x1->e0']
  partial      (Member x1 large) ~ (Member e0' large)   [arg0 x1->e0']
  partial      (Member x1 listed_building) ~ (Member e1' listed_building)   [arg0 x1->e1']
  A only       (Past (Member x0 chapel)) (Possession x0 derwent_isle) (Possession x1 derwent_isle)
  B only       (Location e0' derwent_isle) (Location e1' derwent_isle) (Past (Member e1' chapel))
residue A      —
residue B      —
```

### pairC-0059 · tierC-000117 ↔ tierC-000118 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Bhadala are entirely Muslim , and follow the traditions of the other neighbouring Sunni communities .
B: The Bhadala are exclusively Muslim and follow the traditions of the other neighbouring Sunni communities .

```
renaming a->b  x0->x0 x1->x1
common         (GroupOf x0 community) (GroupOf x1 tradition) (Inheritance bhadala muslim) (Member x0 neighbouring) (Member x0 other) (Member x0 sunni) (Possession x1 x0)
residue A      —
residue B      —
```

### pairC-0060 · tierC-000119 ↔ tierC-000120 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It was designed by architect Henry L. Taylor and built by O. R. Woodcock .
B: It was designed by architect Henry L. Taylor and was built by O. R. Woodcock .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 henry_l_taylor) (Agent e1 o_r_woodcock) (Member e0 design) (Member e1 build) (Member henry_l_taylor architect) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      —
residue B      —
```

### pairC-0061 · tierC-000121 ↔ tierC-000122 · quality 0.93 · common 13 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He remained in Japan for three years before moving with his family back to Germany .
B: He stayed in Japan for three years before moving back with his family to Germany .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Before e1 e0) (CoAgent e0 x1) (Experiencer e1 x0) (Goal e0 germany) (Location e1 japan) (Measure e1 duration 3 year) (Member e0 move) (Member x0 person) (Member x1 family) (Past e0) (Past e1) (Possession x1 x0)
group 1        anchors e1
  A            {(Member e1 remain)}
  B            {(Member e1 stay)}
  near         (Member e1 remain) ~ (Member e1 stay)   [arg1 remain->stay]
residue A      —
residue B      —
```

### pairC-0062 · tierC-000123 ↔ tierC-000124 · quality 0.94 · common 16 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: To prevent this , her father cursed her and stabbed Appius Claudius Crassus .
B: To avoid this , her father cursed her and stabbed Appius Claudius Crassus .

```
renaming a->b  e0->e2 e1->e0 e2->e1 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x0) (Member e0 curse) (Member e1 stab) (Member x0 father) (Member x1 person) (Member x2 event) (Past e0) (Past e1) (Patient e1 appius_claudius_crassus) (Patient e2 x2) (Possession x0 x1) (Theme e0 x1) (To e0 e2) (To e1 e2)
group 1        anchors e2
  A            {(Member e2 prevent)}
  B            {(Member e2 avoid)}
  near         (Member e2 prevent) ~ (Member e2 avoid)   [arg1 prevent->avoid]
residue A      —
residue B      —
```

### pairC-0063 · tierC-000125 ↔ tierC-000126 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The bridge starts in Sweden and the tunnel in Denmark .
B: The bridge starts in Sweden and the tunnel is in Denmark .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Experiencer e1 x1) (Location e0 denmark) (Location e1 sweden) (Member e1 start) (Member x0 tunnel) (Member x1 bridge)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 be)}
  near         (Member e0 start) ~ (Member e0 be)   [arg1 start->be]
residue A      —
residue B      —
```

### pairC-0064 · tierC-000127 ↔ tierC-000128 · quality 0.82 · common 23 · aligned 4 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: She and her sisters also performed in cafes and sang music to accompany silent films .
B: She and her sisters also appeared in cafes and sang music to accompany silent films .

```
renaming a->b  e0->e0 e1->e2 e2->e5 e3->e1 e4->e4 e5->e3 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x1) (Agent e3 x1) (Agent e4 x1) (Agent e5 x0) (GroupOf x1 sister) (Inheritance silent_film film) (Inheritance silent_film silent) (Location e1 cafe) (Location e4 cafe) (Member e0 sing) (Member e2 sing) (Member e3 accompany) (Member e5 accompany) (Member x0 person) (Past e0) (Past e1) (Past e2) (Past e4) (Possession x1 x0) (Theme e0 music) (Theme e3 silent_film)
group 1        anchors e1 e4
  A            {(Also perform e1) (Also perform e4) (Member e1 perform) (Member e4 perform)}
  B            {(Also appear e1) (Also appear e4) (Member e1 appear) (Member e4 appear)}
  near         (Also perform e1) ~ (Also appear e1)   [arg0 perform->appear]
  near         (Also perform e4) ~ (Also appear e4)   [arg0 perform->appear]
  near         (Member e1 perform) ~ (Member e1 appear)   [arg1 perform->appear]
  near         (Member e4 perform) ~ (Member e4 appear)   [arg1 perform->appear]
residue A      {(Theme e2 music)}@e2
residue B      {(Theme e5 silent_film)}@e5,silent_film
```

### pairC-0065 · tierC-000129 ↔ tierC-000130 · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: His parents were Sergeant Major Astrid Ingeborg Tuominen and the librarian Rudolf Mikael Friberg .
B: His parents were sergeant major Astrid Ingeborg Tuominen and librarian Rudolf Mikael Friberg .

```
renaming a->b  x0->x0
common         (Member x0 person) (Past (Member astrid_ingeborg_tuominen parent)) (Past (Member rudolf_mikael_friberg parent)) (Possession astrid_ingeborg_tuominen x0) (Possession rudolf_mikael_friberg x0)
residue A      {(Past (Member rudolf_mikael_friberg librarian))}@rudolf_mikael_friberg
residue B      —
```

### pairC-0066 · tierC-000131 ↔ tierC-000132 · quality 0.89 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The song was written by Gilles Thibaut and composed by .
B: The song was written and composed by Gilles Thibaut .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 gilles_thibaut) (Member e0 write) (Member e1 compose) (Member x0 song) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      —
residue B      {(Agent e1 gilles_thibaut)}@e1
```

### pairC-0067 · tierC-000133 ↔ tierC-000134 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Janmashtmi Festival is organised in the village and a mela is also celebrated .
B: Janmashtmi festival is organised in the village and a Mela is also celebrated .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Also celebrate e0) (Location e1 x0) (Member e0 celebrate) (Member e1 organise) (Member janmashtmi_festival festival) (Member x0 village) (Member x1 mela) (Patient e0 x1) (Patient e1 janmashtmi_festival)
residue A      —
residue B      —
```

### pairC-0068 · tierC-000135 ↔ tierC-000136 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: This view is usual in northern India and parts of southern India .
B: This view is common in northern India and parts of southern India .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 northern_india) (Location e0 x1) (Member x0 view) (Member x1 part) (PartOf x1 southern_india)
group 1        anchors e0
  A            {(Member e0 usual)}
  B            {(Member e0 common)}
  near         (Member e0 usual) ~ (Member e0 common)   [arg1 usual->common]
group 2        anchors x0
  A            {(Member x0 usual)}
  B            {(Member x0 common)}
  near         (Member x0 usual) ~ (Member x0 common)   [arg1 usual->common]
residue A      —
residue B      —
```

### pairC-0069 · tierC-000137 ↔ tierC-000138 · quality 0.91 · common 10 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It is addressed by Claude Lelouch and stars Jeremy Irons and French singer Patricia Kaas .
B: It is directed by Claude Lelouch and stars Jeremy Irons and French singer Patricia Kaas .

```
renaming a->b  e0->e1 e1->e0 e2->e2 x0->x0
common         (Agent e0 claude_lelouch) (Agent e1 x0) (Agent e2 x0) (Member e1 star) (Member e2 star) (Member patricia_kaas french) (Member patricia_kaas singer) (Patient e0 x0) (Theme e1 patricia_kaas) (Theme e2 jeremy_irons)
group 1        anchors e0
  A            {(Member e0 address)}
  B            {(Member e0 direct)}
  near         (Member e0 address) ~ (Member e0 direct)   [arg1 address->direct]
residue A      —
residue B      —
```

### pairC-0070 · tierC-000139 ↔ tierC-000140 · quality 0.93 · common 14 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: His nephews include actor Ranbir Kapoor and Armaan Jain and businessman Nikhil Nanda .
B: His nephews include actors Ranbir Kapoor and Armaan Jain , and businessman Nikhil Nanda .

```
renaming a->b  e0->e2 e1->e0 e2->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x0) (GroupOf x0 nephew) (Member e0 include) (Member e1 include) (Member e2 include) (Member nikhil_nanda businessman) (Member ranbir_kapoor actor) (Member x1 person) (Possession x0 x1) (Theme e0 armaan_jain) (Theme e1 nikhil_nanda) (Theme e2 ranbir_kapoor)
residue A      —
residue B      {(Member armaan_jain actor)}@armaan_jain
```

### pairC-0071 · tierC-000141 ↔ tierC-000142 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Chittoor district , is a district in Andhra Pradesh region of the Indian state of Rayalaseema .
B: Chittoor District , is a district of Andhra Pradesh region of the Indian state of Rayalaseema .

```
renaming a->b  
common         (Member andhra_pradesh region) (Member chittoor district) (Member rayalaseema indian) (Member rayalaseema state) (PartOf andhra_pradesh rayalaseema) (PartOf chittoor andhra_pradesh)
residue A      —
residue B      —
```

### pairC-0072 · tierC-000143 ↔ tierC-000144 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The autonomous region Xinjiang Uyghur is a river in the Yarkand River in Western China .
B: The Xinjiang Uyghur Autonomous Region is a river in the Yarkand River of western China .

```
renaming a->b  x0->x0
common         (Member x0 western) (Member xinjiang_uyghur autonomous) (Member xinjiang_uyghur region) (Member xinjiang_uyghur river) (Member yarkand river) (PartOf x0 china) (PartOf xinjiang_uyghur yarkand) (PartOf yarkand x0)
residue A      —
residue B      —
```

### pairC-0073 · tierC-000145 ↔ tierC-000146 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: These algorithmically equivalent sequences can be defined in three random manners .
B: These algorithmically equivalent sequences can be defined in three random ways .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Can e0) (Cardinality x0 3) (GroupOf x1 sequence) (Manner e0 x0) (Member e0 define) (Member x0 random) (Member x1 algorithmically_equivalent) (Theme e0 x1)
group 1        anchors x0
  A            {(GroupOf x0 manner)}
  B            {(GroupOf x0 way)}
  near         (GroupOf x0 manner) ~ (GroupOf x0 way)   [arg1 manner->way]
residue A      —
residue B      —
```

### pairC-0074 · tierC-000147 ↔ tierC-000148 · quality 0.67 · common 8 · aligned 2 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: In modern times it is mainly a recreational sport and sporting activity .
B: In modern times , it is mainly a recreational sport and competitive activity .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Experiencer e0 x0) (Experiencer e1 x0) (Inheritance recreational_sport recreational) (Inheritance recreational_sport sport) (Member e1 recreational_sport) (Member x0 recreational_sport) (Time e0 modern_times) (Time e1 modern_times)
group 1        anchors e0 x0
  A            {(Inheritance sporting_activity activity) (Inheritance sporting_activity sporting) (Member e0 sporting_activity) (Member x0 sporting_activity)}
  B            {(Inheritance competitive_activity activity) (Inheritance competitive_activity competitive) (Member e0 competitive_activity) (Member x0 competitive_activity)}
  partial      (Inheritance sporting_activity activity) ~ (Inheritance competitive_activity activity)   [arg0 sporting_activity->competitive_activity]
  near         (Member e0 sporting_activity) ~ (Member e0 competitive_activity)   [arg1 sporting_activity->competitive_activity]
  near         (Member x0 sporting_activity) ~ (Member x0 competitive_activity)   [arg1 sporting_activity->competitive_activity]
  A only       (Inheritance sporting_activity sporting)
  B only       (Inheritance competitive_activity competitive)
residue A      —
residue B      —
```

### pairC-0075 · tierC-000149 ↔ tierC-000150 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: This can occur due to autosomal dominant diseases such as hereditary hemorrhagic telangiectasia .
B: Can occur due to autosomal dominant diseases , such as hereditary hemorrhagic telangiectasia .

```
renaming a->b  e0->e0
common         (Can e0) (DueTo e0 autosomal_dominant_disease) (Inheritance autosomal_dominant_disease autosomal) (Inheritance autosomal_dominant_disease disease) (Inheritance autosomal_dominant_disease dominant) (Inheritance hereditary_hemorrhagic_telangiectasia autosomal_dominant_disease)
residue A      —
residue B      —
```

### pairC-0076 · tierC-000151 ↔ tierC-000152 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Bruno Simma was in the case of LaGrand assistant to Paulus .
B: Bruno Simma was an assistant to Paulus in the LaGrand case .

```
renaming a->b  e0->e0
common         (Assist bruno_simma paulus) (Experiencer e0 bruno_simma) (Inheritance assistant (can assist)) (Location e0 lagrand_case) (Member bruno_simma assistant) (Member e0 assistant) (Member lagrand_case case)
residue A      —
residue B      —
```

### pairC-0077 · tierC-000153 ↔ tierC-000154 · quality 0.73 · common 8 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: In fluid mechanics , a homentropic flow has uniform and constant entropy .
B: In fluid mechanics , a homentropic current has uniform and constant entropy .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (In e0 fluid_mechanics) (Inheritance fluid_mechanics mechanics) (Member e0 have) (Member x1 constant) (Member x1 entropy) (Member x1 uniform) (Theme e0 x1)
group 1        anchors x0
  A            {(Inheritance homentropic_flow flow) (Inheritance homentropic_flow homentropic) (Member x0 homentropic_flow)}
  B            {(Inheritance homentropic_current current) (Inheritance homentropic_current homentropic) (Member x0 homentropic_current)}
  partial      (Inheritance homentropic_flow homentropic) ~ (Inheritance homentropic_current homentropic)   [arg0 homentropic_flow->homentropic_current]
  near         (Member x0 homentropic_flow) ~ (Member x0 homentropic_current)   [arg1 homentropic_flow->homentropic_current]
  A only       (Inheritance homentropic_flow flow)
  B only       (Inheritance homentropic_current current)
residue A      —
residue B      —
```

### pairC-0078 · tierC-000155 ↔ tierC-000156 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Eschenz is a municipality in Frauenfeld District in the canton of Thurgau in Switzerland .
B: Eschenz is a municipality in the district of Frauenfeld in the Canton Thurgau , Switzerland .

```
renaming a->b  
common         (Member eschenz municipality) (Member frauenfeld_district district) (Member thurgau canton) (PartOf eschenz frauenfeld_district) (PartOf frauenfeld_district thurgau) (PartOf thurgau switzerland)
residue A      —
residue B      —
```

### pairC-0079 · tierC-000157 ↔ tierC-000158 · quality 0.50 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 2 / 7

A: Corruption was widespread in Persia , and discipline in the army was dangerously lax .
B: Corruption was widespread in Persia and discipline in the army became dangerously lax .

```
renaming a->b  e0->e0 e1->e2 x0->x0
common         (Degree e0 lax dangerously) (Location e0 x0) (Location e1 persia) (Member e0 discipline) (Member e1 corruption) (Member x0 army) (Past (Member e1 widespread))
residue A      {(Past (Member e0 lax))}@e0
residue B      {(Experiencer e1' e0) (Member e1' lax) (Member e3' become) (Past e3') (Patient e3' e0) (Result e3' e1')}@e0 {(Member e0 lax)}@e0
```

### pairC-0080 · tierC-000159 ↔ tierC-000160 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It endorsed the views of the Free Soil Party and the Republican Party .
B: It supported the views of the Free Soil Party and the Republican Party .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 view) (Past e0) (Possession x1 free_soil_party) (Possession x1 republican_party) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 endorse)}
  B            {(Member e0 support)}
  near         (Member e0 endorse) ~ (Member e0 support)   [arg1 endorse->support]
residue A      —
residue B      —
```

### pairC-0081 · tierC-000161 ↔ tierC-000162 · quality 0.79 · common 11 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Incumbent George Allen ran for a third term , but lost to Democrat Robb .
B: Incumbent Republican George Allen ran for a third term , but lost to Democrat Chuck Robb .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 george_allen) (Agent e1 george_allen) (But e0 e1) (For e0 x0) (Member e0 run) (Member e1 lose) (Member george_allen incumbent) (Member x0 term) (Ordinal x0 3 term) (Past e0) (Past e1)
group 1        anchors e1
  A            {(Goal e1 robb) (Member robb democrat)}
  B            {(Goal e1 chuck_robb) (Member chuck_robb democrat)}
  near         (Goal e1 robb) ~ (Goal e1 chuck_robb)   [arg1 robb->chuck_robb]
  partial      (Member robb democrat) ~ (Member chuck_robb democrat)   [arg0 robb->chuck_robb]
residue A      —
residue B      {(Member george_allen republican)}@george_allen
```

### pairC-0082 · tierC-000163 ↔ tierC-000164 · quality 0.67 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Technetium forms the simple complex . The potassium salt is isostructural with .
B: The simple complex forms the technetium , whose potassium salt is isostructural .

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance potassium_salt salt) (Member e0 form) (Member x0 isostructural) (Member x0 potassium_salt) (Member x1 complex) (Member x1 simple)
group 1        anchors e0
  A            {(Agent e0 technetium)}
  B            {(Patient e0 technetium)}
  near         (Agent e0 technetium) ~ (Patient e0 technetium)   [head Agent->Patient]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      {(Possession x0 technetium)}@x0
```

### pairC-0083 · tierC-000165 ↔ tierC-000166 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Karthik is the brother of the actress Maheswari and the nephew of actress Sridevi .
B: Karthik is the brother of actress Maheswari and the nephew of actress Sridevi .

```
renaming a->b  
common         (Member karthik brother) (Member karthik nephew) (Member maheswari actress) (Member sridevi actress) (Possession karthik maheswari) (Possession karthik sridevi)
residue A      —
residue B      —
```

### pairC-0084 · tierC-000167 ↔ tierC-000168 · quality 0.83 · common 5 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Chongqing is a district in Wanzhou district , China and the location of a former prefecture .
B: Chongqing is a district in Wanzhou District , China and the site of a former prefecture .

```
renaming a->b  x0->x0
common         (Member chongqing district) (Member wanzhou_district district) (PartOf chongqing wanzhou_district) (Past (Member x0 prefecture)) (Possession chongqing x0)
group 1        anchors chongqing
  A            {(Member chongqing location)}
  B            {(Member chongqing site)}
  partial      (Member chongqing location) ~ (Member chongqing site)   [arg1 location->site]
residue A      —
residue B      —
```

### pairC-0085 · tierC-000169 ↔ tierC-000170 · quality 0.50 · common 1 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Tuen Mun is a bay outside Castle Peak Bay .
B: Tuen Mun is a bay outside Peak Bay Castle .

```
renaming a->b  
common         (Member tuen_mun bay)
group 1        anchors tuen_mun
  A            {(Location tuen_mun castle_peak_bay)}
  B            {(Location tuen_mun peak_bay_castle)}
  partial      (Location tuen_mun castle_peak_bay) ~ (Location tuen_mun peak_bay_castle)   [arg1 castle_peak_bay->peak_bay_castle]
residue A      —
residue B      —
```

### pairC-0086 · tierC-000171 ↔ tierC-000172 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Others during the expedition were Frederick William Beechy , science officer and Edward Sabine .
B: Others on the expedition were Frederick William Beechy , science officer and Edward Sabine .

```
renaming a->b  x0->x0
common         (Inheritance science_officer officer) (Member edward_sabine other) (Member frederick_william_beechy other) (Member frederick_william_beechy science_officer) (Member x0 expedition)
group 1        anchors edward_sabine x0
  A            {(During edward_sabine x0)}
  B            {(Location edward_sabine x0)}
  near         (During edward_sabine x0) ~ (Location edward_sabine x0)   [head During->Location]
group 2        anchors frederick_william_beechy x0
  A            {(During frederick_william_beechy x0)}
  B            {(Location frederick_william_beechy x0)}
  near         (During frederick_william_beechy x0) ~ (Location frederick_william_beechy x0)   [head During->Location]
residue A      —
residue B      —
```

### pairC-0087 · tierC-000173 ↔ tierC-000174 · quality 0.83 · common 10 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The localized versions of subsequent games use the current naming convention instead .
B: The localized versions of subsequent games use instead the current designation convention .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x0 localized_version) (Inheritance localized_version localized) (Inheritance localized_version version) (Inheritance subsequent_game game) (Inheritance subsequent_game subsequent) (Member e0 use) (Member x1 current) (Possession x0 subsequent_game) (Theme e0 x1)
group 1        anchors x1
  A            {(Inheritance naming_convention convention) (Member x1 naming_convention)}
  B            {(Inheritance designation_convention convention) (Member x1 designation_convention)}
  partial      (Inheritance naming_convention convention) ~ (Inheritance designation_convention convention)   [arg0 naming_convention->designation_convention]
  near         (Member x1 naming_convention) ~ (Member x1 designation_convention)   [arg1 naming_convention->designation_convention]
residue A      —
residue B      —
```

### pairC-0088 · tierC-000175 ↔ tierC-000176 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He established the Village of Schererville one mile north of Hartsdale .
B: He founded the village of Schererville one mile north of Hartsdale .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member schererville village) (Member x0 person) (MoreBy north schererville hartsdale 1 mile) (Past e0) (Patient e0 schererville)
group 1        anchors e0
  A            {(Member e0 establish)}
  B            {(Member e0 found)}
  near         (Member e0 establish) ~ (Member e0 found)   [arg1 establish->found]
residue A      —
residue B      —
```

### pairC-0089 · tierC-000177 ↔ tierC-000178 · quality 0.73 · common 11 · aligned 0 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The story attracted widespread attention from mainstream media and social media .
B: The story attracted widespread attention from the social media and the mainstream media .

```
renaming a->b  e0->e0 x0->x0 x1->x3
common         (Agent e0 x0) (Inheritance mainstream_media mainstream) (Inheritance mainstream_media media) (Inheritance social_media media) (Inheritance social_media social) (Member e0 attract) (Member x0 story) (Member x1 attention) (Member x1 widespread) (Past e0) (Theme e0 x1)
group 1        anchors e0 mainstream_media
  A            {(Source e0 mainstream_media)}
  B            {(Member x1' mainstream_media) (Source e0 x1')}
  partial      (Source e0 mainstream_media) ~ (Source e0 x1')   [arg1 mainstream_media->x1']
  B only       (Member x1' mainstream_media)
group 2        anchors e0 social_media
  A            {(Source e0 social_media)}
  B            {(Member x2' social_media) (Source e0 x2')}
  partial      (Source e0 social_media) ~ (Source e0 x2')   [arg1 social_media->x2']
  B only       (Member x2' social_media)
residue A      —
residue B      —
```

### pairC-0090 · tierC-000179 ↔ tierC-000180 · quality 0.93 · common 13 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band .
B: Sambora and lead singer Jon Bon Jovi formed the main - songwriting - unit of the band .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 jon_bon_jovi) (Agent e0 sambora) (Inheritance lead_singer (can sing)) (Inheritance lead_singer lead) (Inheritance lead_singer singer) (Inheritance main_songwriting_unit main) (Inheritance main_songwriting_unit unit) (Member e0 form) (Member jon_bon_jovi lead_singer) (Member x0 band) (Member x1 main_songwriting_unit) (Past e0) (Patient e0 x1)
group 1        anchors e0 x0 x1
  A            {(Beneficiary e0 x0)}
  B            {(PartOf x1 x0)}
  partial      (Beneficiary e0 x0) ~ (PartOf x1 x0)   [head Beneficiary->PartOf; arg0 e0->x1]
residue A      —
residue B      —
```

### pairC-0091 · tierC-000181 ↔ tierC-000182 · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Together with Karen , Kristoffer had eight children .
B: Karen and Kristoffer have eight children together .

```
renaming a->b  e0->e0 x0->x0
common         (Cardinality x0 8) (GroupOf x0 child) (Holder e0 kristoffer) (Member e0 have) (Theme e0 x0)
group 1        anchors e0
  A            {(CoAgent e0 karen)}
  B            {(Holder e0 karen)}
  near         (CoAgent e0 karen) ~ (Holder e0 karen)   [head CoAgent->Holder]
residue A      {(Past e0)}@e0
residue B      —
```

### pairC-0092 · tierC-000183 ↔ tierC-000184 · quality 1.00 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The PacifiCats were designed by Philip Hercus from Vancouver and Robert Allan Limited of Australia .
B: The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limited of Australia .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 philip_hercus) (Agent e1 robert_allan_limited) (GroupOf x0 pacificat) (Location philip_hercus vancouver) (Location robert_allan_limited australia) (Member e0 design) (Member e1 design) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      —
residue B      —
```

### pairC-0093 · tierC-000185 ↔ tierC-000186 · quality 1.00 · common 17 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Springfield station is served by City network Ipswich & Rosewood and Indooroopilly line services .
B: Station Springfield Station is served by City Network Ipswich , Rosewood and Indooroopilly Line Services .

```
renaming a->b  e0->e0 e1->e1 e2->e2 x0->x1 x1->x0
common         (Agent e0 rosewood) (Agent e1 indooroopilly) (Agent e2 ipswich) (Member e0 serve) (Member e1 serve) (Member e2 serve) (Member indooroopilly line) (Member ipswich line) (Member rosewood line) (Member x0 network) (Member x1 station) (PartOf indooroopilly x0) (PartOf ipswich x0) (PartOf rosewood x0) (Theme e0 x1) (Theme e1 x1) (Theme e2 x1)
residue A      —
residue B      —
```

### pairC-0094 · tierC-000187 ↔ tierC-000188 · quality 0.88 · common 7 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Local intradermal injection of botulinum toxin is helpful and chronic painful in focal neuropathies .
B: Local intradermal injection of botulinum toxin in focal neuropathies is helpful and chronically painful .

```
renaming a->b  
common         (ConditionalProperty botulinum_toxin_injection helpful focal_neuropathy) (ConditionalProperty botulinum_toxin_injection painful focal_neuropathy) (Inheritance botulinum_toxin_injection injection) (Inheritance botulinum_toxin_injection intradermal) (Inheritance botulinum_toxin_injection local) (Inheritance focal_neuropathy focal) (Inheritance focal_neuropathy neuropathy)
group 1        anchors botulinum_toxin_injection
  A            {(Degree botulinum_toxin_injection painful chronic)}
  B            {(Degree botulinum_toxin_injection painful chronically)}
  partial      (Degree botulinum_toxin_injection painful chronic) ~ (Degree botulinum_toxin_injection painful chronically)   [arg2 chronic->chronically]
residue A      —
residue B      —
```

### pairC-0095 · tierC-000189 ↔ tierC-000190 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Des Moines is included in the Warren County -- West Des Moines , IA Metropolitan Statistical Area .
B: Des Moines are included in the Warren County -- West Des Moines , Metropolitan Statistical Area IA .

```
renaming a->b  e0->e0
common         (Location e0 warren_co_metro_area) (Member e0 include) (Member warren_co_metro_area metropolitan_statistical_area) (Theme e0 des_moines)
residue A      —
residue B      —
```

### pairC-0096 · tierC-000191 ↔ tierC-000192 · quality 0.57 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Yauli District is one of nineteen districts in the Peruvian province of Huancavelica .
B: Yauli District is one of nineteen districts of the province Peru in Huancavelica .

```
renaming a->b  x0->x0
common         (Cardinality x0 19) (GroupOf x0 district) (Member yauli_district district) (PartOf yauli_district x0)
group 1        anchors x0
  A            {(Member huancavelica peruvian) (Member huancavelica province) (PartOf x0 huancavelica)}
  B            {(Member peru province) (PartOf peru huancavelica) (PartOf x0 peru)}
  partial      (Member huancavelica province) ~ (Member peru province)   [arg0 huancavelica->peru]
  near         (PartOf x0 huancavelica) ~ (PartOf x0 peru)   [arg1 huancavelica->peru]
  A only       (Member huancavelica peruvian)
  B only       (PartOf peru huancavelica)
residue A      —
residue B      —
```

### pairC-0097 · tierC-000193 ↔ tierC-000194 · quality 0.91 · common 10 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Quadratic placement later outperformed combinatorial solutions in both quality and stability .
B: Quadratic placement later exceeded combinatorial solutions in both quality and stability .

```
renaming a->b  e0->e0
common         (Agent e0 quadratic_placement) (In e0 quality) (In e0 stability) (Inheritance combinatorial_solution combinatorial) (Inheritance combinatorial_solution solution) (Inheritance quadratic_placement placement) (Inheritance quadratic_placement quadratic) (Past e0) (Theme e0 combinatorial_solution) (Time e0 later)
group 1        anchors e0
  A            {(Member e0 outperform)}
  B            {(Member e0 exceed)}
  near         (Member e0 outperform) ~ (Member e0 exceed)   [arg1 outperform->exceed]
residue A      —
residue B      —
```

### pairC-0098 · tierC-000195 ↔ tierC-000196 · quality 1.00 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Morrow can either mean the next day in particular , or the future in general .
B: Morrow can mean either the next day in particular or the future in general .

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         (And (Agent x0 morrow) (Can x0) (Member x0 mean) (Or (And (Member x1 next_day) (Theme x0 x1)) (And (Member x2 future) (Theme x0 x2)))) (Inheritance next_day day)
residue A      —
residue B      —
```

### pairC-0099 · tierC-000197 ↔ tierC-000198 · quality 0.87 · common 13 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Company sells ice cream , then expands to bake ice cream cones Headquarters moves to Baltimore .
B: Company sells ice cream , then expands to bake ice cones headquarters moves to Baltimore .

```
renaming a->b  e0->e1 e1->e0 e2->e2 e3->e3 x0->x0
common         (Agent e0 company) (Agent e1 company) (Agent e2 company) (Before e2 e0) (Goal e3 baltimore) (Member e0 expand) (Member e1 bake) (Member e2 sell) (Member e3 move) (Member x0 headquarters) (Patient e3 x0) (Theme e2 ice_cream) (To e0 e1)
group 1        anchors e1
  A            {(Inheritance ice_cream_cone cone) (Patient e1 ice_cream_cone)}
  B            {(Inheritance ice_cone cone) (Patient e1 ice_cone)}
  partial      (Inheritance ice_cream_cone cone) ~ (Inheritance ice_cone cone)   [arg0 ice_cream_cone->ice_cone]
  near         (Patient e1 ice_cream_cone) ~ (Patient e1 ice_cone)   [arg1 ice_cream_cone->ice_cone]
residue A      —
residue B      —
```

### pairC-0100 · tierC-000199 ↔ tierC-000200 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: He was born in Bromma and died in Stockholm .
B: He was born in Bromma , died in Stockholm .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Location e0 bromma) (Location e1 stockholm) (Member e0 bear) (Member e1 die) (Member x0 person) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      —
residue B      —
```

### pairC-0101 · tierC-000201 ↔ tierC-000202 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: In the early morning and late afternoon , it seems most active .
B: It seems to be most active in the early morning and late afternoon .

```
renaming a->b  e0->e0
common         (Degree e0 active most) (Member e0 active) (Time e0 early_morning) (Time e0 late_afternoon)
residue A      —
residue B      —
```

### pairC-0102 · tierC-000203 ↔ tierC-000204 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Barako from Batangas was shipped from Manila to San Francisco .
B: Barako from Batangas was shipped to San Francisco from Manila .

```
renaming a->b  e0->e0 e1->e1
common         (Goal e0 san_francisco) (Member e0 ship) (Member e1 barako) (Past e0) (Source e0 manila) (Source e1 batangas) (Theme e0 e1)
residue A      —
residue B      —
```

### pairC-0103 · tierC-000205 ↔ tierC-000206 · quality 0.70 · common 7 · aligned 2 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: These predictive functions are referred to as pedo-transfer functions in a non-spatial context .
B: These predictive functions , in a non-spatial context are referred to as pedotransfer functions .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 predictive_function) (Inheritance predictive_function function) (Inheritance predictive_function predictive) (Location e0 x1) (Member e0 refer) (Member x1 context) (Member x1 non_spatial)
group 1        anchors e0
  A            {(As e0 pedo_transfer_function) (Inheritance pedo_transfer_function function)}
  B            {(As e0 pedotransfer_function) (Inheritance pedotransfer_function function)}
  near         (As e0 pedo_transfer_function) ~ (As e0 pedotransfer_function)   [arg1 pedo_transfer_function->pedotransfer_function]
  partial      (Inheritance pedo_transfer_function function) ~ (Inheritance pedotransfer_function function)   [arg0 pedo_transfer_function->pedotransfer_function]
group 2        anchors e0 x0
  A            {(Goal e0 x0)}
  B            {(Theme e0 x0)}
  near         (Goal e0 x0) ~ (Theme e0 x0)   [head Goal->Theme]
residue A      —
residue B      —
```

### pairC-0104 · tierC-000207 ↔ tierC-000208 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A synthetic instrument is a kind of virtual instrument that is defined purely by software .
B: A synthetic instrument is a kind of virtual instrument that is purely software defined .

```
renaming a->b  
common         (Inheritance synthetic_instrument instrument) (Inheritance synthetic_instrument synthetic) (Inheritance synthetic_instrument virtual_instrument) (Inheritance virtual_instrument instrument) (Inheritance virtual_instrument virtual)
residue A      —
residue B      —
```

### pairC-0105 · tierC-000209 ↔ tierC-000210 · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Katherine goes to talk to Loren .
B: Katherine goes to Loren to talk .

```
renaming a->b  e0->e0 e1->e1
common         (Agent e0 katherine) (Agent e1 katherine) (Member e0 go) (Member e1 talk) (To e0 e1)
residue A      {(Recipient e1 loren)}@e1
residue B      {(Goal e0 loren)}@e0
```

### pairC-0106 · tierC-000211 ↔ tierC-000212 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Alema Nature Reserve is a nature reserve situated in northern Estonia , in Harju County .
B: Alema Nature Reserve is a nature reserve in northern Estonia , in Harju County .

```
renaming a->b  e0->e0 x0->x0
common         (Experiencer e0 alema_nature_reserve) (Inheritance nature_reserve reserve) (Location e0 harju_county) (Location e0 x0) (Member alema_nature_reserve nature_reserve) (Member x0 north) (PartOf x0 estonia)
group 1        anchors e0
  A            {(Member e0 situate)}
  B            {(Member e0 be)}
  near         (Member e0 situate) ~ (Member e0 be)   [arg1 situate->be]
residue A      —
residue B      —
```

### pairC-0107 · tierC-000213 ↔ tierC-000214 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: This room is built with a barometer and a presented-in scale .
B: This room is built with a barometer and a presented scale .

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Instrument e0 x0) (Instrument e0 x1) (Member e0 build) (Member x0 scale) (Member x1 barometer) (Member x2 room) (Patient e0 x2)
group 1        anchors x0
  A            {(Member x0 present_in)}
  B            {(Member x0 present)}
  near         (Member x0 present_in) ~ (Member x0 present)   [arg1 present_in->present]
residue A      —
residue B      —
```

### pairC-0108 · tierC-000215 ↔ tierC-000216 · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Ellerslie Rugby Park is in Richford .
B: The Ellerslie Rugby Park is located in Richford .

```
renaming a->b  e0->e0
common         (Experiencer e0 ellerslie_rugby_park) (Location e0 richford)
group 1        anchors e0
  A            {(Member e0 be)}
  B            {(Member e0 locate)}
  near         (Member e0 be) ~ (Member e0 locate)   [arg1 be->locate]
residue A      —
residue B      —
```

### pairC-0109 · tierC-000217 ↔ tierC-000218 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Lessos - Kenya border section is jointly funded by the government of Uganda and JICA .
B: The Lessos-Kenya border section is funded jointly by the Government of Uganda and JICA .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 jica) (Agent e0 x0) (Inheritance lessos_kenya_border_section section) (Member e0 fund) (Member x0 government) (Member x1 lessos_kenya_border_section) (Possession x0 uganda) (Theme e0 x1)
residue A      —
residue B      —
```

### pairC-0110 · tierC-000219 ↔ tierC-000220 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Saladas - Department is a department of the Corrientes - province in Argentina .
B: Saladas Department is a department of Corrientes Province in Argentina .

```
renaming a->b  
common         (Member corrientes_province province) (Member saladas_department department) (PartOf corrientes_province argentina) (PartOf saladas_department corrientes_province)
residue A      —
residue B      —
```

### pairC-0111 · tierC-000221 ↔ tierC-000222 · quality 1.00 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: One important distinction is clear , though .
B: One important distinction though is clear .

```
renaming a->b  x0->x0
common         (Member x0 clear) (Member x0 distinction) (Member x0 important)
residue A      —
residue B      —
```

### pairC-0112 · tierC-000223 ↔ tierC-000224 · quality 0.43 · common 3 · aligned 0 near + 1 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Many people were mostly numerically important in the region from New Jersey north to Virginia .
B: Indentured people were numerically important mostly in the region from New Jersey north to Virginia .

```
renaming a->b  e0->e0
common         (Goal e0 virginia) (Member e0 region) (Source e0 new_jersey)
group 1        anchors e0
  A            {(Degree person numerically_important mostly) (Past (ConditionalProperty person numerically_important e0))}
  B            {(Degree indentured_people numerically_important mostly) (Inheritance indentured_people indentured) (Inheritance indentured_people person) (Past (ConditionalProperty indentured_people numerically_important e0))}
  partial      (Degree person numerically_important mostly) ~ (Degree indentured_people numerically_important mostly)   [arg0 person->indentured_people]
  A only       (Past (ConditionalProperty person numerically_important e0))
  B only       (Inheritance indentured_people indentured) (Inheritance indentured_people person) (Past (ConditionalProperty indentured_people numerically_important e0))
residue A      —
residue B      —
```

### pairC-0113 · tierC-000225 ↔ tierC-000226 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The New Mexico State Legislature is the upper house of the New Mexico Senate .
B: The New Mexico State Legislature is the upper house of New Mexico Senate .

```
renaming a->b  
common         (Inheritance upper_house house) (Inheritance upper_house upper) (Member new_mexico_state_legislature upper_house) (PartOf new_mexico_state_legislature new_mexico_senate)
residue A      —
residue B      —
```

### pairC-0114 · tierC-000227 ↔ tierC-000228 · quality 0.91 · common 10 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It also adds to the personality of the character Holly Golightly , played by Audrey Heppurn .
B: It also adds to the personality of the character Holly Golightly , played by Audrey Hepburn .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e1 x0) (Also add e1) (Goal e1 x1) (Member e0 play) (Member e1 add) (Member holly_golightly character) (Member x1 personality) (Past e0) (Possession x1 holly_golightly) (Theme e0 holly_golightly)
group 1        anchors e0
  A            {(Agent e0 audrey_heppurn)}
  B            {(Agent e0 audrey_hepburn)}
  near         (Agent e0 audrey_heppurn) ~ (Agent e0 audrey_hepburn)   [arg1 audrey_heppurn->audrey_hepburn]
residue A      —
residue B      —
```

### pairC-0115 · tierC-000229 ↔ tierC-000230 · quality 0.43 · common 3 · aligned 0 near + 4 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Another series was played between the Boston Red Sox and the Cincinnati Reds in Havana .
B: In Havana , another series between Cincinnati Reds and Boston Red Sox was played .

```
renaming a->b  e0->e1
common         (Location e0 havana) (Member e0 play) (Past e0)
group 1        anchors e0
  A            {(Agent e0 boston_red_sox)} {(Agent e0 cincinnati_reds)} {(Member x0 series) (Theme e0 x0)}
  B            {(Agent e0' boston_red_sox) (Agent e0' cincinnati_reds) (Member e0' series) (Theme e0 e0')}
  partial      (Agent e0 boston_red_sox) ~ (Agent e0' boston_red_sox)   [arg0 e0->e0']
  partial      (Agent e0 cincinnati_reds) ~ (Agent e0' cincinnati_reds)   [arg0 e0->e0']
  partial      (Member x0 series) ~ (Member e0' series)   [arg0 x0->e0']
  partial      (Theme e0 x0) ~ (Theme e0 e0')   [arg1 x0->e0']
residue A      —
residue B      —
```

### pairC-0116 · tierC-000231 ↔ tierC-000232 · quality 0.89 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: When it was printed commercially , illustrations were added by J. Augustus Knapp .
B: When it was printed commercially , illustrations by J. Augustus Knapp were added .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1
common         (GroupOf x0 illustration) (Manner e1 commercial) (Member e0 add) (Member e1 print) (Past e0) (Past e1) (Patient e1 x1) (Theme e0 x0)
residue A      {(Agent e0 j_augustus_knapp)}@e0
residue B      {(Possession x0 j_augustus_knapp)}@x0
```

### pairC-0117 · tierC-000233 ↔ tierC-000234 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The mental world is usually considered subjective and not objective .
B: The mental world is usually considered to be subjective and not objective .

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance mental_world mental) (Inheritance mental_world world) (Member e0 consider) (Member x0 mental_world) (Theme e0 (Member x0 objective)) ~NEG (Theme e0 (Member x0 subjective))
residue A      —
residue B      —
```

### pairC-0118 · tierC-000235 ↔ tierC-000236 · quality 1.00 · common 13 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: As an official Soviet artist , his work was well received and widely exhibited .
B: As an official Soviet artist , his work was well received and exhibited widely .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Manner e0 widely) (Manner e1 well) (Member e0 exhibit) (Member e1 receive) (Member x0 work) (Member x1 artist) (Member x1 official) (Member x1 soviet) (Past e0) (Past e1) (Possession x0 x1) (Theme e0 x0) (Theme e1 x0)
residue A      —
residue B      —
```

### pairC-0119 · tierC-000237 ↔ tierC-000238 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: He is the and can become the Inomaru to borrow .
B: As , he is the and can become the Inomaru to borrow .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Can e0) (Member e0 become) (Member e1 borrow) (Member x0 inomaru) (Patient e0 x1) (Theme e0 x0) (Theme e1 x0)
residue A      —
residue B      —
```

### pairC-0120 · tierC-000239 ↔ tierC-000240 · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Karen and Kristoffer together have eight children .
B: Kristoffer together with Karen had eight children .

```
renaming a->b  e0->e0 x0->x0
common         (Cardinality x0 8) (GroupOf x0 child) (Holder e0 kristoffer) (Member e0 have) (Theme e0 x0)
group 1        anchors e0
  A            {(Holder e0 karen)}
  B            {(CoAgent e0 karen)}
  near         (Holder e0 karen) ~ (CoAgent e0 karen)   [head Holder->CoAgent]
residue A      —
residue B      {(Past e0)}@e0
```

### pairC-0121 · tierC-000241 ↔ tierC-000242 · quality 1.00 · common 12 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The once strategic relationship between Poland and Germany has now become a bad relationship .
B: The once strategic relationship between Poland and Germany now has become a bad relationship .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Between x0 germany) (Between x0 poland) (Experiencer e0 x0) (Member e0 bad) (Member e1 become) (Member x0 bad) (Member x0 relationship) (Past (Member x0 strategic)) (Past e1) (Patient e1 x0) (Result e1 e0) (Time e1 now)
residue A      —
residue B      —
```

### pairC-0122 · tierC-000243 ↔ tierC-000244 · quality 1.00 · common 16 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Kerr broke into the first team that season , but Couper found himself on the bench .
B: Kerr broke this season into the first team , but Couper found himself on the bench .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1 x2->x2
common         (Agent e0 kerr) (Agent e1 couper) (But e0 e1) (Goal e0 x0) (Inheritance first_team first) (Inheritance first_team team) (Location e1 x1) (Member e0 break_into) (Member e1 find) (Member x0 first_team) (Member x1 bench) (Member x2 season) (Past e0) (Past e1) (Theme e1 couper) (Time e0 x2)
residue A      —
residue B      —
```

### pairC-0123 · tierC-000245 ↔ tierC-000246 · quality 0.90 · common 9 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Lessos -- Uganda border section is jointly funded by the government of Kenya and JICA .
B: The Lessos Border Section -- Uganda is financed jointly by the Government of Kenya and JICA .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 jica) (Agent e0 x0) (Between x1 lessos) (Between x1 uganda) (Inheritance border_section section) (Member x0 government) (Member x1 border_section) (Possession x0 kenya) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 fund)}
  B            {(Member e0 finance)}
  near         (Member e0 fund) ~ (Member e0 finance)   [arg1 fund->finance]
residue A      —
residue B      —
```

### pairC-0124 · tierC-000247 ↔ tierC-000248 · quality 1.00 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Portrayed by Soichiro Akizuki , Kantaro Suga is .
B: Kantaro Suga is portrayed by Soichiro Akizuki .

```
renaming a->b  e0->e0
common         (Agent e0 soichiro_akizuki) (Member e0 portray) (Theme e0 kantaro_suga)
residue A      —
residue B      —
```

### pairC-0125 · tierC-000249 ↔ tierC-000250 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Peoria is part of the Peoria County , IL Metropolitan Statistical Area .
B: Peoria is part of Peoria County , IL Metropolitan Statistical Area .

```
renaming a->b  
common         (PartOf peoria peoria_county_msa)
residue A      —
residue B      —
```

### pairC-0126 · tierC-000251 ↔ tierC-000252 · quality 0.60 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 2

A: Michele Emmer was the father of mathematician , writer and director Luciano Emmer .
B: The father of a mathematician , writer and director Luciano Emmer was Michele Michele Emmer .

```
renaming a->b  
common         (Member luciano_emmer director) (Member luciano_emmer mathematician) (Member luciano_emmer writer)
residue A      {(Past (Member michele_emmer father)) (Past (Possession michele_emmer luciano_emmer))}@luciano_emmer
residue B      {(Past (Member michele_michele_emmer father)) (Past (Possession michele_michele_emmer luciano_emmer))}@luciano_emmer
```

### pairC-0127 · tierC-000253 ↔ tierC-000254 · quality 1.00 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne .
B: He studied at Davis Studio , Sydney and at the Julian Ashton Art School in Melbourne .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 x0) (Agent e1 x0) (Location e0 davis_studio) (Location e0 sydney) (Location e1 julian_ashton_art_school) (Location e1 melbourne) (Member e0 study) (Member e1 study) (Member x0 person) (Past e0) (Past e1)
residue A      —
residue B      —
```

### pairC-0128 · tierC-000255 ↔ tierC-000256 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Glasnow returned to Altoona after two starts with West Virginia .
B: After two starts with West Virginia , Glasnow returned to Altoona .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 glasnow) (Before x0 e0) (Cardinality x0 2) (Goal e0 altoona) (GroupOf x0 start) (Member e0 return) (Past e0) (With x0 west_virginia)
residue A      —
residue B      —
```

### pairC-0129 · tierC-000257 ↔ tierC-000258 · quality 0.92 · common 12 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: His religion was directly influenced by the international balance of political powers .
B: His religion was influenced directly from the international balance of political powers .

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Inheritance political_power political) (Inheritance political_power power) (Manner e0 direct) (Member e0 influence) (Member x0 balance) (Member x0 international) (Member x1 person) (Member x2 religion) (Past e0) (Possession x0 political_power) (Possession x2 x1) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
residue A      —
residue B      —
```

### pairC-0130 · tierC-000259 ↔ tierC-000260 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Brian Packham also appeared as Peter in Coronation Street .
B: Brian Packham has also appeared in Coronation Street as Peter .

```
renaming a->b  e0->e0
common         (Agent e0 brian_packham) (Also appear e0) (As e0 peter) (Location e0 coronation_street) (Member e0 appear) (Past e0)
residue A      —
residue B      —
```

### pairC-0131 · tierC-000261 ↔ tierC-000262 · quality 0.90 · common 9 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: These algorithmically equivalent sequences can be defined in three random ways .
B: These algorithmically equivalent sequences can be defined in three accidental ways .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Can e0) (Cardinality x0 3) (Degree x1 equivalent algorithmically) (GroupOf x0 way) (GroupOf x1 sequence) (Manner e0 x0) (Member e0 define) (Member x1 equivalent) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 random)}
  B            {(Member x0 accidental)}
  near         (Member x0 random) ~ (Member x0 accidental)   [arg1 random->accidental]
residue A      —
residue B      —
```

### pairC-0132 · tierC-000263 ↔ tierC-000264 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Albania is a town and municipality in the Santander Department in northeastern Colombia .
B: Albania is a town and municipality in the department of Santander in northeastern Colombia .

```
renaming a->b  x0->x0
common         (Location albania santander) (Location santander x0) (Member albania municipality) (Member albania town) (Member santander department) (Member x0 northeastern) (PartOf x0 colombia)
residue A      —
residue B      —
```

### pairC-0133 · tierC-000265 ↔ tierC-000266 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: They are purple , dense black-hard rocks with a considerable pyrite content .
B: They are purple , dense black-hard rocks with considerable content of pyrite .

```
renaming a->b  x0->x0 x1->x1
common         (GroupOf x0 rock) (Inheritance pyrite_content content) (Member x0 black_hard) (Member x0 dense) (Member x0 purple) (Member x1 considerable) (Member x1 pyrite_content) (PartOf x1 x0)
residue A      —
residue B      —
```

### pairC-0134 · tierC-000267 ↔ tierC-000268 · quality 1.00 · common 10 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The MSM model can be specified in both discrete and continuous time .
B: The MSM model can be specified in both discrete time and continuous time .

```
renaming a->b  e0->e0 x0->x0
common         (Can e0) (Inheritance continuous_time continuous) (Inheritance continuous_time time) (Inheritance discrete_time discrete) (Inheritance discrete_time time) (Manner e0 continuous_time) (Manner e0 discrete_time) (Member e0 specify) (Member x0 model) (Theme e0 x0)
residue A      —
residue B      —
```

### pairC-0135 · tierC-000269 ↔ tierC-000270 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Bobby is kidnapped and Frankie is lured to the same isolated cottage by Roger .
B: Bobby is kidnapped and Frankie is lured by Roger into the same isolated cottage .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 roger) (Goal e0 x0) (Member e0 lure) (Member e1 kidnap) (Member x0 cottage) (Member x0 isolated) (Theme e0 frankie) (Theme e1 bobby)
residue A      —
residue B      —
```

### pairC-0136 · tierC-000271 ↔ tierC-000272 · quality 1.00 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It also has a representation at regional and local level .
B: It has also representation at local and regional level .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Also have e0) (Holder e0 x0) (Inheritance local_level level) (Inheritance local_level local) (Inheritance regional_level level) (Inheritance regional_level regional) (Location e0 local_level) (Location e0 regional_level) (Member e0 have) (Member x1 representation) (Theme e0 x1)
residue A      —
residue B      —
```

### pairC-0137 · tierC-000273 ↔ tierC-000274 · quality 0.00 · common 0 · aligned 0 near + 3 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Valea Voenilor River is a tributary of the Pascu River .
B: The river Valea Voenilor is a tributary of the river Pascu .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(Member pascu_river river) (Member valea_voenilor_river river) (Member valea_voenilor_river tributary) (PartOf valea_voenilor_river pascu_river)}
  B            {(Member pascu river) (Member valea_voenilor river) (Member valea_voenilor tributary) (PartOf valea_voenilor pascu)}
  partial      (Member pascu_river river) ~ (Member pascu river)   [arg0 pascu_river->pascu]
  partial      (Member valea_voenilor_river river) ~ (Member valea_voenilor river)   [arg0 valea_voenilor_river->valea_voenilor]
  partial      (Member valea_voenilor_river tributary) ~ (Member valea_voenilor tributary)   [arg0 valea_voenilor_river->valea_voenilor]
  A only       (PartOf valea_voenilor_river pascu_river)
  B only       (PartOf valea_voenilor pascu)
residue A      —
residue B      —
```

### pairC-0138 · tierC-000275 ↔ tierC-000276 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Murfreesboro is a part of the TN Metropolitan Statistical Area -- Davidson - Hickman County -- Franklin , Nashville .
B: Murfreesboro is part of the TN Metropolitan Statistical Area -- Davidson -- Hickman County -- Franklin , Nashville .

```
renaming a->b  x0->x0
common         (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan) (Inheritance metropolitan_statistical_area statistical) (Member x0 metropolitan_statistical_area) (PartOf murfreesboro x0)
residue A      —
residue B      —
```

### pairC-0139 · tierC-000277 ↔ tierC-000278 · quality 0.70 · common 7 · aligned 0 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A Wilson won an Emmy for his portrayal of James Woods .
B: Wilson won an Emmy for his portrayal of James Woods .

```
renaming a->b  e0->e0 e1->e1 x1->x0
common         (For e0 e1) (Member e0 win) (Member e1 portray) (Member x1 emmy) (Past e0) (Theme e0 x1) (Theme e1 james_woods)
group 1        anchors e0 e1
  A            {(Agent e0 x0) (Agent e1 x0) (Member x0 wilson)}
  B            {(Agent e0 wilson)} {(Agent e1 wilson)}
  partial      (Agent e0 x0) ~ (Agent e0 wilson)   [arg1 x0->wilson]
  partial      (Agent e1 x0) ~ (Agent e1 wilson)   [arg1 x0->wilson]
  A only       (Member x0 wilson)
residue A      —
residue B      —
```

### pairC-0140 · tierC-000279 ↔ tierC-000280 · quality 0.62 · common 5 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: It is found in southern North Africa and western Europe .
B: It is being found in southern North Africa and Western Europe .

```
renaming a->b  e0->e0 x1->x0 x2->x1
common         (Location e0 x1) (Member e0 find) (Member x1 southern) (PartOf x1 north_africa) (Theme e0 x2)
group 1        anchors e0
  A            {(Location e0 x0) (Member x0 western) (PartOf x0 europe)}
  B            {(Location e0 western_europe)}
  partial      (Location e0 x0) ~ (Location e0 western_europe)   [arg1 x0->western_europe]
  A only       (Member x0 western) (PartOf x0 europe)
residue A      —
residue B      {(Ongoing e0)}@e0
```

### pairC-0141 · tierC-000281 ↔ tierC-000282 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: None of the Polish-Russian treaties concerning Kiev has ever been ratified .
B: None of the Polish-Russian treaties concerning Kiev have ever been ratified .

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### pairC-0142 · tierC-000283 ↔ tierC-000284 · quality 0.80 · common 8 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A mass ceremony was held that night , and prayers were prayed until dawn .
B: A mass ceremony was conducted that night , and prayers were held until dawn .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (End e0 dawn) (Inheritance mass_ceremony ceremony) (Member x0 mass_ceremony) (Past e0) (Past e1) (Patient e0 prayer) (Patient e1 x0) (Time e1 that_night)
group 1        anchors e0
  A            {(Member e0 pray)}
  B            {(Member e0 hold)}
  near         (Member e0 pray) ~ (Member e0 hold)   [arg1 pray->hold]
group 2        anchors e1
  A            {(Member e1 hold)}
  B            {(Member e1 conduct)}
  near         (Member e1 hold) ~ (Member e1 conduct)   [arg1 hold->conduct]
residue A      —
residue B      —
```

### pairC-0143 · tierC-000285 ↔ tierC-000286 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Since these laws were opened , many nanobreweries have changed .
B: Many nanobreweries have changed since these laws were opened .

```
renaming a->b  e0->e0 x0->x0
common         (GroupOf x0 law) (Inheritance nanobrewery brewery) (Member e0 open) (Past e0) (Patient e0 x0)
residue A      —
residue B      —
```

### pairC-0144 · tierC-000287 ↔ tierC-000288 · quality 1.00 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The genre is today well established and incredibly diverse .
B: Today , the genre is incredibly diverse and well established .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Degree x0 diverse incredibly) (Degree x0 established well) (Experiencer e0 x0) (Experiencer e1 x0) (Member e0 diverse) (Member e1 established) (Member x0 diverse) (Member x0 established) (Member x0 genre) (Time e0 today) (Time e1 today)
residue A      —
residue B      —
```

### pairC-0145 · tierC-000289 ↔ tierC-000290 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Dora Smith is a widow of two own children : Will and Ma Smith .
B: Dora Smith is a widow with two children of her own : Will and Ma Smith .

```
renaming a->b  x0->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member dora_smith widow) (Member ma_smith child) (Member will child) (PartOf ma_smith x0) (PartOf will x0) (Possession x0 dora_smith)
residue A      —
residue B      —
```

### pairC-0146 · tierC-000291 ↔ tierC-000292 · quality 0.88 · common 14 · aligned 1 near + 0 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: In Turkey , the company built a hotel in Eskisehir and a paper mill in Kazakhstan .
B: The company built a hotel in Eskisehir and a paper factory in Kazakhstan in Turkey .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Agent e1 x0) (Location e0 kazakhstan) (Location e0 turkey) (Location e1 eskisehir) (Location e1 turkey) (Member e0 build) (Member e1 build) (Member x0 company) (Member x2 hotel) (Past e0) (Past e1) (Patient e0 x1) (Patient e1 x2)
group 1        anchors x1
  A            {(Inheritance paper_mill mill) (Member x1 paper_mill)}
  B            {(Inheritance paper_factory factory) (Member x1 paper_factory)}
  near         (Member x1 paper_mill) ~ (Member x1 paper_factory)   [arg1 paper_mill->paper_factory]
  A only       (Inheritance paper_mill mill)
  B only       (Inheritance paper_factory factory)
residue A      —
residue B      —
```

### pairC-0147 · tierC-000293 ↔ tierC-000294 · quality 0.92 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Cowper drew a pencil portrait of John Higgins , and also painted landscapes .
B: Cowper drew a pencil portrait of John Higgins and painted landscapes .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (About x0 john_higgins) (Agent e0 cowper) (Agent e1 cowper) (Inheritance pencil_portrait portrait) (Member e0 paint) (Member e1 draw) (Member x0 pencil_portrait) (Past e0) (Past e1) (Patient e0 landscape) (Patient e1 x0)
residue A      {(Also paint e0)}@e0,paint
residue B      —
```

### pairC-0148 · tierC-000295 ↔ tierC-000296 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Shreveport is a part of the DeSoto Parish -- Bossier City , LA Metropolitan Statistical Area .
B: Shreveport is part of the DeSoto Parish -- Bossier City , LA Metropolitan Statistical Area .

```
renaming a->b  
common         (PartOf shreveport desoto_bossier_msa)
residue A      —
residue B      —
```

### pairC-0149 · tierC-000297 ↔ tierC-000298 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The episode was written by Bill Wrubel and directed by Lev L. Spiro .
B: The episode was written by Bill Wrubel and was directed by Lev L. Spiro .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 bill_wrubel) (Agent e1 lev_l_spiro) (Member e0 write) (Member e1 direct) (Member x0 episode) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      —
residue B      —
```

### pairC-0150 · tierC-000299 ↔ tierC-000300 · quality 1.00 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Vanga Kingdom was the first powerful seafaring nation in South Asia , especially of Bengal .
B: The Vanga Kingdom was the first powerful seafaring nation of South Asia , especially Bengal .

```
renaming a->b  e0->e0
common         (Experiencer e0 vanga_kingdom) (Location e0 bengal) (Location e0 south_asia) (Member e0 nation) (Ordinal vanga_kingdom 1 nation) (Past (Member vanga_kingdom nation)) (Past (Member vanga_kingdom powerful)) (Past (Member vanga_kingdom seafaring)) (Past e0)
residue A      —
residue B      —
```

### pairC-0151 · tierC-000301 ↔ tierC-000302 · quality 0.80 · common 8 · aligned 0 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: James Woods won an Emmy for his portrayal of Wilson .
B: James Woods won an Emmy for his portrayal of the Wilson .

```
renaming a->b  e0->e0 e1->e1 x0->x1
common         (Agent e0 james_woods) (Agent e1 james_woods) (For e1 e0) (Member e0 portray) (Member e1 win) (Member x0 emmy) (Past e1) (Theme e1 x0)
group 1        anchors e0
  A            {(Theme e0 wilson)}
  B            {(Member x0' wilson) (Theme e0 x0')}
  partial      (Theme e0 wilson) ~ (Theme e0 x0')   [arg1 wilson->x0']
  B only       (Member x0' wilson)
residue A      —
residue B      —
```

### pairC-0152 · tierC-000303 ↔ tierC-000304 · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Mr. Jones had been selected for Mr. Morel for a job in Seychelles .
B: Mr. Jones had been selected for a job in Seychelles working for Mr. Morel .

```
renaming a->b  e0->e1 e1->e2
common         (For e0 e1) (Location e1 seychelles) (Member e0 select) (Member e1 job) (Past e0) (Theme e0 jones)
group 1        anchors e0
  A            {(Beneficiary e0 morel)}
  B            {(Agent e0' jones) (Beneficiary e0' morel) (Member e0' work)}
  partial      (Beneficiary e0 morel) ~ (Beneficiary e0' morel)   [arg0 e0->e0']
  B only       (Agent e0' jones) (Member e0' work)
residue A      —
residue B      —
```

### pairC-0153 · tierC-000305 ↔ tierC-000306 · quality 0.25 · common 1 · aligned 0 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Lemnia River is a tributary of the Lutoasa River in Romania .
B: The river Lemnia is a tributary of the Lutoasa River in Romania .

```
renaming a->b  
common         (Location lutoasa_river romania)
group 1        anchors lutoasa_river
  A            {(Member lemnia_river tributary) (PartOf lemnia_river lutoasa_river)}
  B            {(Member lemnia river) (Member lemnia tributary) (PartOf lemnia lutoasa_river)}
  partial      (Member lemnia_river tributary) ~ (Member lemnia tributary)   [arg0 lemnia_river->lemnia]
  partial      (PartOf lemnia_river lutoasa_river) ~ (PartOf lemnia lutoasa_river)   [arg0 lemnia_river->lemnia]
  B only       (Member lemnia river)
residue A      —
residue B      —
```

### pairC-0154 · tierC-000307 ↔ tierC-000308 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Wine Country is located in the Cloverdale , as part of the Alexander Valley AVA .
B: Wine Country is located in the Cloverdale , being part of the Alexander Valley AVA .

```
renaming a->b  e0->e0
common         (Experiencer e0 wine_country) (Location e0 cloverdale) (Member e0 locate) (PartOf wine_country alexander_valley_ava)
residue A      —
residue B      —
```

### pairC-0155 · tierC-000309 ↔ tierC-000310 · quality 0.67 · common 2 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Veymandoo Kandu is the channel between Laamu Atoll and Thaa Atoll of the Maldives .
B: Veymandoo Kandu is the channel between the Thaa Atoll and Laamu Atoll of the Maldives .

```
renaming a->b  
common         (Member veymandoo_kandu channel) (PartOf veymandoo_kandu maldives)
group 1        anchors veymandoo_kandu
  A            {(Between veymandoo_kandu laamu_atoll thaa_atoll)}
  B            {(Between veymandoo_kandu thaa_atoll laamu_atoll)}
  partial      (Between veymandoo_kandu laamu_atoll thaa_atoll) ~ (Between veymandoo_kandu thaa_atoll laamu_atoll)   [arg1 laamu_atoll->thaa_atoll; arg2 thaa_atoll->laamu_atoll]
residue A      —
residue B      —
```

### pairC-0156 · tierC-000311 ↔ tierC-000312 · quality 0.90 · common 9 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Aslan offered to accompany the children because he wanted Frank himself to see .
B: Aslan offered to accompany the children , because he wanted to see Frank himself .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1 x2->x2
common         (Agent e0 aslan) (Because e0 e1) (Experiencer e1 aslan) (GroupOf x0 child) (Member e0 offer) (Member e1 want) (Past e0) (Past e1) (Theme e0 (And (Agent x2 aslan) (Member x2 accompany) (Theme x2 x0)))
group 1        anchors e1
  A            {(Theme e1 (And (Experiencer x1 frank) (Member x1 see)))}
  B            {(Theme e1 (And (Experiencer x1 aslan) (Member x1 see) (Stimulus x1 frank)))}
  near         (Theme e1 (And (Experiencer x1 frank) (Member x1 see))) ~ (Theme e1 (And (Experiencer x1 aslan) (Member x1 see) (Stimulus x1 frank)))   [arg1 (And (Experiencer x1 frank) (Member x1 see))->(And (Experiencer x1 aslan) (Member x1 see) (Stimulus x1 frank))]
residue A      —
residue B      —
```

### pairC-0157 · tierC-000313 ↔ tierC-000314 · quality 0.40 · common 4 · aligned 0 near + 3 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: It is found only in Yunnan and its tributaries in Lake Dianchi , China .
B: It is only found in Yunnan and its tributaries in the Dianchi - Lake , China .

```
renaming a->b  e1->e0 x0->x1
common         (Location e1 yunnan) (Member e1 find) (Only yunnan e1) (Theme e1 x0)
group 1        anchors e1 yunnan
  A            {(GroupOf e0 tributary) (Location e0 lake_dianchi) (Location e1 e0) (Only e0 e1) (PartOf lake_dianchi china) (Possession e0 yunnan)}
  B            {(Location e1 china)} {(Location e1 x0') (Member x0' tributary) (Possession x0' yunnan)}
  partial      (GroupOf e0 tributary) ~ (Member x0' tributary)   [head GroupOf->Member; arg0 e0->x0']
  partial      (Location e1 e0) ~ (Location e1 china)   [arg1 e0->china]
  partial      (Possession e0 yunnan) ~ (Possession x0' yunnan)   [arg0 e0->x0']
  A only       (Location e0 lake_dianchi) (Only e0 e1) (PartOf lake_dianchi china)
  B only       (Location e1 x0')
residue A      —
residue B      {(Location e1 dianchi_lake)}@e1
```

### pairC-0158 · tierC-000315 ↔ tierC-000316 · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Robbie later turns the machine off and Beth is shocked but understanding .
B: Later Robbie switched the machine off and Beth is shocked but understanding .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 robbie) (Member beth shocked) (Member beth understanding) (Member x0 machine) (Patient e0 x0) (Time e0 later)
group 1        anchors e0
  A            {(Member e0 turn_off)}
  B            {(Member e0 switch_off)}
  near         (Member e0 turn_off) ~ (Member e0 switch_off)   [arg1 turn_off->switch_off]
residue A      —
residue B      {(Past e0)}@e0
```

### pairC-0159 · tierC-000317 ↔ tierC-000318 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not permitted , but may be allowed on a footpath .

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### pairC-0160 · tierC-000319 ↔ tierC-000320 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not permitted , but may be allowed on a footpath .

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### pairC-0161 · tierC-000321 ↔ tierC-000322 · quality 0.64 · common 7 · aligned 0 near + 3 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: For shopping , there is a Russian market and a similar Russian market in Pakistani blocks .
B: For shopping there is Russian Market and a similar Russian Market in Pakistani blocks .

```
renaming a->b  e1->e0 x0->x0
common         (Beneficiary e1 shop) (Location e1 x0) (Member e1 market) (Member e1 russian) (Member e1 similar) (Member x0 block) (Member x0 pakistani)
group 1        anchors x0
  A            {(Beneficiary e0 shop) (Location e0 x0) (Member e0 market) (Member e0 russian)}
  B            {(Beneficiary russian_market_1 shop) (Location russian_market_1 x0) (Member russian_market_1 market)}
  partial      (Beneficiary e0 shop) ~ (Beneficiary russian_market_1 shop)   [arg0 e0->russian_market_1]
  partial      (Location e0 x0) ~ (Location russian_market_1 x0)   [arg0 e0->russian_market_1]
  partial      (Member e0 market) ~ (Member russian_market_1 market)   [arg0 e0->russian_market_1]
  A only       (Member e0 russian)
residue A      —
residue B      —
```

### pairC-0162 · tierC-000323 ↔ tierC-000324 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Adolph III was the son of Count Henry VI and his wife Elisabeth of Berg .
B: Adolph III was a son of Count Henry VI and his wife Elisabeth of Berg .

```
renaming a->b  
common         (Member adolph_iii son) (Member elisabeth_of_berg wife) (Possession adolph_iii elisabeth_of_berg) (Possession adolph_iii henry_vi) (Possession elisabeth_of_berg henry_vi)
residue A      —
residue B      —
```

### pairC-0163 · tierC-000325 ↔ tierC-000326 · quality 0.00 · common 0 · aligned 0 near + 4 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not allowed , but may be permitted on a footpath .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(ConditionalProperty bicycle allowed footpath) (Inheritance bicycle permitted) ~NEG}
  B            {(ConditionalProperty bicycle permitted footpath) (Inheritance bicycle allowed) ~NEG}
  partial      (ConditionalProperty bicycle allowed footpath) ~ (ConditionalProperty bicycle permitted footpath)   [arg1 allowed->permitted]
  partial      (Inheritance bicycle permitted) ~NEG ~ (Inheritance bicycle allowed) ~NEG   [arg1 permitted->allowed]
group 2        anchors —
  A            {(ConditionalProperty pedestrian allowed footpath) (Inheritance pedestrian permitted) ~NEG}
  B            {(ConditionalProperty pedestrian permitted footpath) (Inheritance pedestrian allowed) ~NEG}
  partial      (ConditionalProperty pedestrian allowed footpath) ~ (ConditionalProperty pedestrian permitted footpath)   [arg1 allowed->permitted]
  partial      (Inheritance pedestrian permitted) ~NEG ~ (Inheritance pedestrian allowed) ~NEG   [arg1 permitted->allowed]
residue A      —
residue B      —
```

### pairC-0164 · tierC-000327 ↔ tierC-000328 · quality 0.00 · common 0 · aligned 0 near + 4 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not allowed , but may be permitted on a footpath .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(ConditionalProperty bicycle allowed footpath) (Inheritance bicycle permitted) ~NEG}
  B            {(ConditionalProperty bicycle permitted footpath) (Inheritance bicycle allowed) ~NEG}
  partial      (ConditionalProperty bicycle allowed footpath) ~ (ConditionalProperty bicycle permitted footpath)   [arg1 allowed->permitted]
  partial      (Inheritance bicycle permitted) ~NEG ~ (Inheritance bicycle allowed) ~NEG   [arg1 permitted->allowed]
group 2        anchors —
  A            {(ConditionalProperty pedestrian allowed footpath) (Inheritance pedestrian permitted) ~NEG}
  B            {(ConditionalProperty pedestrian permitted footpath) (Inheritance pedestrian allowed) ~NEG}
  partial      (ConditionalProperty pedestrian allowed footpath) ~ (ConditionalProperty pedestrian permitted footpath)   [arg1 allowed->permitted]
  partial      (Inheritance pedestrian permitted) ~NEG ~ (Inheritance pedestrian allowed) ~NEG   [arg1 permitted->allowed]
residue A      —
residue B      —
```

### pairC-0165 · tierC-000329 ↔ tierC-000330 · quality 0.75 · common 9 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively a cappella .
B: There are amateur Barbershop Harmony Society and professional groups that sing a cappella exclusively .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 barbershop_harmony_society) (Agent e1 x0) (Manner e0 a_cappella) (Manner e1 a_cappella) (Member barbershop_harmony_society amateur) (Member e0 sing) (Member e1 sing) (Only a_cappella e0) (Only a_cappella e1)
group 1        anchors x0
  A            {(Inheritance occupational_group group) (Inheritance occupational_group occupational) (Member x0 occupational_group)}
  B            {(Inheritance professional_group group) (Inheritance professional_group professional) (Member x0 professional_group)}
  partial      (Inheritance occupational_group group) ~ (Inheritance professional_group group)   [arg0 occupational_group->professional_group]
  near         (Member x0 occupational_group) ~ (Member x0 professional_group)   [arg1 occupational_group->professional_group]
  A only       (Inheritance occupational_group occupational)
  B only       (Inheritance professional_group professional)
residue A      —
residue B      —
```

### pairC-0166 · tierC-000331 ↔ tierC-000332 · quality 0.70 · common 7 · aligned 0 near + 2 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Regressive assimilations are only conditioned by phonological factors while substitutions take into account semantic information .
B: Regressive assimilations are caused only by phonological factors , while substitutions take semantic information into account .

```
renaming a->b  
common         (Inheritance phonological_factor factor) (Inheritance phonological_factor phonological) (Inheritance regressive_assimilation assimilation) (Inheritance regressive_assimilation regressive) (Inheritance semantic_information information) (Inheritance semantic_information semantic) (TakeIntoAccount substitution semantic_information)
group 1        anchors phonological_factor regressive_assimilation
  A            {(Only phonological_factor (Condition phonological_factor regressive_assimilation))}
  B            {(Only phonological_factor (Cause phonological_factor regressive_assimilation))}
  partial      (Only phonological_factor (Condition phonological_factor regressive_assimilation)) ~ (Only phonological_factor (Cause phonological_factor regressive_assimilation))   [arg1 (Condition phonological_factor regressive_assimilation)->(Cause phonological_factor regressive_assimilation)]
group 2        anchors phonological_factor regressive_assimilation semantic_information substitution
  A            {(While (Condition phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))}
  B            {(While (Cause phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))}
  partial      (While (Condition phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information)) ~ (While (Cause phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))   [arg0 (Condition phonological_factor regressive_assimilation)->(Cause phonological_factor regressive_assimilation)]
residue A      {(Condition phonological_factor regressive_assimilation)}@phonological_factor,regressive_assimilation
residue B      {(Cause phonological_factor regressive_assimilation)}@phonological_factor,regressive_assimilation
```

### pairC-0167 · tierC-000333 ↔ tierC-000334 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: When a solvent is shaken , two immiscible liquids are extracted together .
B: When a solvent is shaken , two nonmixable liquids are extracted together .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Before e0 e1) (Cardinality x0 2) (GroupOf x0 liquid) (Member e0 shake) (Member e1 extract) (Member x1 solvent) (Patient e0 x1) (Theme e1 x0)
group 1        anchors x0
  A            {(Member x0 immiscible)}
  B            {(Member x0 nonmixable)}
  near         (Member x0 immiscible) ~ (Member x0 nonmixable)   [arg1 immiscible->nonmixable]
residue A      —
residue B      —
```

### pairC-0168 · tierC-000335 ↔ tierC-000336 · quality 1.00 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Colin MacDougall is a married to Richardson .
B: Colin MacDougall is married to Richardson .

```
renaming a->b  
common         (Married colin_macdougall richardson) (Symmetric Married)
residue A      —
residue B      —
```

### pairC-0169 · tierC-000337 ↔ tierC-000338 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Henry Cole was followed by Bailey as Caretaker of Breakheart Hill .
B: Henry Cole was succeeded as caretaker of Breakheart Hill by Bailey .

```
renaming a->b  e0->e0
common         (Agent e0 bailey) (Inheritance caretaker_of_breakheart_hill caretaker) (Member bailey caretaker_of_breakheart_hill) (Member henry_cole caretaker_of_breakheart_hill) (Past e0) (Theme e0 henry_cole)
group 1        anchors e0
  A            {(Member e0 follow)}
  B            {(Member e0 succeed)}
  near         (Member e0 follow) ~ (Member e0 succeed)   [arg1 follow->succeed]
residue A      —
residue B      —
```

### pairC-0170 · tierC-000339 ↔ tierC-000340 · quality 0.56 · common 5 · aligned 1 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Its subtropical or tropical moist habitats are natural forests and plantations .
B: Its subtropical or tropical moist habitats are natural lowland forests and plantations .

```
renaming a->b  x0->x0 x1->x1
common         (GroupOf x0 habitat) (Member x0 moist) (Member x0 plantation) (Or (Member x0 subtropical) (Member x0 tropical)) (Possession x0 x1)
group 1        anchors x0
  A            {(Inheritance natural_forest forest) (Inheritance natural_forest natural) (Member x0 natural_forest)}
  B            {(Inheritance natural_lowland_forest forest) (Inheritance natural_lowland_forest lowland) (Inheritance natural_lowland_forest natural) (Member x0 natural_lowland_forest)}
  partial      (Inheritance natural_forest forest) ~ (Inheritance natural_lowland_forest forest)   [arg0 natural_forest->natural_lowland_forest]
  partial      (Inheritance natural_forest natural) ~ (Inheritance natural_lowland_forest natural)   [arg0 natural_forest->natural_lowland_forest]
  near         (Member x0 natural_forest) ~ (Member x0 natural_lowland_forest)   [arg1 natural_forest->natural_lowland_forest]
  B only       (Inheritance natural_lowland_forest lowland)
residue A      —
residue B      —
```

### pairC-0171 · tierC-000341 ↔ tierC-000342 · quality 0.71 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 1

A: David Ross was the announcer and Carl Fenton conducted the orchestra .
B: The announcer was David David , and Carl Fenton conducted the orchestra .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 carl_fenton) (Member e0 conduct) (Member x0 orchestra) (Past e0) (Theme e0 x0)
residue A      {(Inheritance announcer (can announce)) (Past (Member david_ross announcer))}
residue B      {(Past (Member david_david announcer))}
```

### pairC-0172 · tierC-000343 ↔ tierC-000344 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It is located in the hills between the Koonung Creek and the Mullum Mullum Creek .
B: It is located in the hills between Koonung Creek and the Mullum Mullum Creek .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Between x0 koonung_creek mullum_mullum_creek) (Experiencer e0 x1) (GroupOf x0 hill) (Location e0 x0) (Member e0 locate)
residue A      —
residue B      —
```

### pairC-0173 · tierC-000345 ↔ tierC-000346 · quality 0.75 · common 3 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It is slightly smaller than Peru and slightly larger than South Africa .
B: It is somewhat smaller than Peru and slightly larger than South Africa .

```
renaming a->b  x0->x0
common         (Degree x0 large slightly) (More large x0 south_africa) (More small x0 peru)
group 1        anchors small x0
  A            {(Degree x0 small slightly)}
  B            {(Degree x0 small somewhat)}
  near         (Degree x0 small slightly) ~ (Degree x0 small somewhat)   [arg2 slightly->somewhat]
residue A      —
residue B      —
```

### pairC-0174 · tierC-000347 ↔ tierC-000348 · quality 0.70 · common 7 · aligned 0 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Paniqui is from Tarlac City and is from the provincial capital of Manila .
B: Paniqui is from Tarlac City and is from the provincial capital , Manila .

```
renaming a->b  e0->e0 e1->e1
common         (Experiencer e0 paniqui) (Experiencer e1 paniqui) (Inheritance provincial_capital capital) (Inheritance provincial_capital provincial) (Member e0 be) (Member e1 be) (Source e0 tarlac_city)
group 1        anchors e1 provincial_capital
  A            {(Member x0 provincial_capital) (Possession x0 manila) (Source e1 x0)}
  B            {(Member manila provincial_capital) (Source e1 manila)}
  partial      (Member x0 provincial_capital) ~ (Member manila provincial_capital)   [arg0 x0->manila]
  partial      (Source e1 x0) ~ (Source e1 manila)   [arg1 x0->manila]
  A only       (Possession x0 manila)
residue A      —
residue B      —
```

### pairC-0175 · tierC-000349 ↔ tierC-000350 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The sessions were arranged by Nick De Caro and developed by Bruce Botnick .
B: The sessions were arranged by Nick De Caro and engineered by Bruce Botnick .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 nick_de_caro) (Agent e1 bruce_botnick) (GroupOf x0 session) (Member e0 arrange) (Past e0) (Past e1) (Theme e0 x0) (Theme e1 x0)
group 1        anchors e1
  A            {(Member e1 develop)}
  B            {(Member e1 engineer)}
  near         (Member e1 develop) ~ (Member e1 engineer)   [arg1 develop->engineer]
residue A      —
residue B      —
```

### pairC-0176 · tierC-000351 ↔ tierC-000352 · quality 1.00 · common 14 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Chinese dumplings were influenced and brought to Indonesia by Indonesian immigrants .
B: Chinese dumplings were influenced and brought by Indonesian immigrants to Indonesia .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 x0) (Agent e1 x0) (Goal e0 indonesia) (GroupOf x0 indonesian_immigrant) (Inheritance chinese_dumpling chinese) (Inheritance chinese_dumpling dumpling) (Inheritance indonesian_immigrant immigrant) (Inheritance indonesian_immigrant indonesian) (Member e0 bring) (Member e1 influence) (Past e0) (Past e1) (Theme e0 chinese_dumpling) (Theme e1 chinese_dumpling)
residue A      —
residue B      —
```

### pairC-0177 · tierC-000353 ↔ tierC-000354 · quality 1.00 · common 18 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The hurricane killed one person directly and two indirectly in the state .
B: The hurricane directly killed one person and indirectly killed two in the state .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1 x2->x2 x3->x3
common         (Agent e0 x0) (Agent e1 x0) (Cardinality x1 2) (Cardinality x2 1) (GroupOf x1 person) (GroupOf x2 person) (Location e0 x3) (Location e1 x3) (Manner e0 indirectly) (Manner e1 directly) (Member e0 kill) (Member e1 kill) (Member x0 hurricane) (Member x3 state) (Past e0) (Past e1) (Patient e0 x1) (Patient e1 x2)
residue A      —
residue B      —
```

### pairC-0178 · tierC-000355 ↔ tierC-000356 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It endorsed the views of the Free Soil Party and the Republican Party .
B: It supported the views of the Republican Party and of the Free Soil Party .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 view) (Past e0) (Possession x1 free_soil_party) (Possession x1 republican_party) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 endorse)}
  B            {(Member e0 support)}
  near         (Member e0 endorse) ~ (Member e0 support)   [arg1 endorse->support]
residue A      —
residue B      —
```

### pairC-0179 · tierC-000357 ↔ tierC-000358 · quality 0.62 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 3

A: He was the second born son of Gil Aires and wife Leonor Rodrigues .
B: He was the second son of Gil Aires and wife Leonor Rodrigues was born .

```
renaming a->b  x0->x0
common         (Ordinal x0 2 birth) (Past (Member x0 son)) (Possession leonor_rodrigues gil_aires) (Possession x0 gil_aires) (Possession x0 leonor_rodrigues)
residue A      —
residue B      {(Member e0' bear) (Past e0') (Patient e0' leonor_rodrigues)}@leonor_rodrigues
```

### pairC-0180 · tierC-000359 ↔ tierC-000360 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Lex Luthor was also replaced as Scott Wells by Sherman Howard .
B: Lex Lex Luthor was also replaced by Sherman Howard as Scott Wells .

```
renaming a->b  e0->e0
common         (Agent e0 sherman_howard) (Also replace e0) (As e0 scott_wells) (Member e0 replace) (Past e0)
group 1        anchors e0
  A            {(Theme e0 lex_luthor)}
  B            {(Theme e0 lex_lex_luthor)}
  near         (Theme e0 lex_luthor) ~ (Theme e0 lex_lex_luthor)   [arg1 lex_luthor->lex_lex_luthor]
residue A      —
residue B      —
```

### seedA-001 · tierA-000001 ↔ tierA-000002 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot bought two forklifts.
B: The depot purchased two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  near         (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
residue A      —
residue B      —
```

### seedA-001 · tierA-000001 ↔ tierA-000003 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot bought two forklifts.
B: The depot acquired two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  near         (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
residue A      —
residue B      —
```

### seedA-001 · tierA-000001 ↔ tierA-000004 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot bought two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 sell)}
  near         (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
residue A      —
residue B      —
```

### seedA-001 · tierA-000001 ↔ tierA-000005 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The depot bought two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-001 · tierA-000002 ↔ tierA-000003 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot purchased two forklifts.
B: The depot acquired two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  near         (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
residue A      —
residue B      —
```

### seedA-001 · tierA-000002 ↔ tierA-000004 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot purchased two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 sell)}
  near         (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
residue A      —
residue B      —
```

### seedA-001 · tierA-000002 ↔ tierA-000005 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot purchased two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
residue A      —
residue B      —
```

### seedA-001 · tierA-000003 ↔ tierA-000004 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot acquired two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 sell)}
  near         (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
residue A      —
residue B      —
```

### seedA-001 · tierA-000003 ↔ tierA-000005 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot acquired two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
residue A      —
residue B      —
```

### seedA-001 · tierA-000004 ↔ tierA-000005 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two forklifts were sold to the depot.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 forklift) (Member x1 depot) (Past e0) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-002 · tierA-000008 ↔ tierA-000009 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school bought a projector for the hall.
B: The school purchased a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  near         (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
residue A      —
residue B      —
```

### seedA-002 · tierA-000008 ↔ tierA-000010 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school bought a projector for the hall.
B: The school acquired a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  near         (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
residue A      —
residue B      —
```

### seedA-002 · tierA-000008 ↔ tierA-000011 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school bought a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 sell)}
  near         (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
residue A      —
residue B      —
```

### seedA-002 · tierA-000008 ↔ tierA-000012 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The school bought a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-002 · tierA-000009 ↔ tierA-000010 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school purchased a projector for the hall.
B: The school acquired a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  near         (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
residue A      —
residue B      —
```

### seedA-002 · tierA-000009 ↔ tierA-000011 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school purchased a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 sell)}
  near         (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
residue A      —
residue B      —
```

### seedA-002 · tierA-000009 ↔ tierA-000012 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school purchased a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
residue A      —
residue B      —
```

### seedA-002 · tierA-000010 ↔ tierA-000011 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school acquired a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 sell)}
  near         (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
residue A      —
residue B      —
```

### seedA-002 · tierA-000010 ↔ tierA-000012 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The school acquired a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
residue A      —
residue B      —
```

### seedA-002 · tierA-000011 ↔ tierA-000012 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A projector was sold to the school for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Beneficiary e0 x0) (Member x0 hall) (Member x1 projector) (Member x2 school) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors e0 x2
  A            {(Recipient e0 x2)}
  B            {(Agent e0 x2)}
  near         (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-003 · tierA-000015 ↔ tierA-000016 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef bought several crates of lemons.
B: The chef purchased several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  near         (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
residue A      —
residue B      —
```

### seedA-003 · tierA-000015 ↔ tierA-000017 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef bought several crates of lemons.
B: The chef acquired several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  near         (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
residue A      —
residue B      —
```

### seedA-003 · tierA-000015 ↔ tierA-000018 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef bought several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 sell)}
  near         (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
residue A      —
residue B      —
```

### seedA-003 · tierA-000015 ↔ tierA-000019 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The chef bought several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-003 · tierA-000016 ↔ tierA-000017 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef purchased several crates of lemons.
B: The chef acquired several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  near         (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
residue A      —
residue B      —
```

### seedA-003 · tierA-000016 ↔ tierA-000018 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 sell)}
  near         (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
residue A      —
residue B      —
```

### seedA-003 · tierA-000016 ↔ tierA-000019 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
residue A      —
residue B      —
```

### seedA-003 · tierA-000017 ↔ tierA-000018 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 sell)}
  near         (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
residue A      —
residue B      —
```

### seedA-003 · tierA-000017 ↔ tierA-000019 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
residue A      —
residue B      —
```

### seedA-003 · tierA-000018 ↔ tierA-000019 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Several crates of lemons were sold to the chef.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x0 lemon) (Member x0 crate) (Member x1 chef) (Past e0) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000023 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio bought a second kiln.
B: The pottery studio purchased a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  near         (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
group 2        anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 purchase)}
  near         (Ordinal x1 2 buy) ~ (Ordinal x1 2 purchase)   [arg2 buy->purchase]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000024 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio bought a second kiln.
B: The pottery studio acquired a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  near         (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
group 2        anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 acquire)}
  near         (Ordinal x1 2 buy) ~ (Ordinal x1 2 acquire)   [arg2 buy->acquire]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000025 · quality 0.62 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio bought a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 sell)}
  near         (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
group 3        anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 sell)}
  near         (Ordinal x1 2 buy) ~ (Ordinal x1 2 sell)   [arg2 buy->sell]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000026 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The pottery studio bought a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-004 · tierA-000023 ↔ tierA-000024 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio purchased a second kiln.
B: The pottery studio acquired a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  near         (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
group 2        anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 acquire)}
  near         (Ordinal x1 2 purchase) ~ (Ordinal x1 2 acquire)   [arg2 purchase->acquire]
residue A      —
residue B      —
```

### seedA-004 · tierA-000023 ↔ tierA-000025 · quality 0.62 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio purchased a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 sell)}
  near         (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
group 3        anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 sell)}
  near         (Ordinal x1 2 purchase) ~ (Ordinal x1 2 sell)   [arg2 purchase->sell]
residue A      —
residue B      —
```

### seedA-004 · tierA-000023 ↔ tierA-000026 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio purchased a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 2        anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 buy)}
  near         (Ordinal x1 2 purchase) ~ (Ordinal x1 2 buy)   [arg2 purchase->buy]
residue A      —
residue B      —
```

### seedA-004 · tierA-000024 ↔ tierA-000025 · quality 0.62 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio acquired a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 sell)}
  near         (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
group 3        anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 2 sell)}
  near         (Ordinal x1 2 acquire) ~ (Ordinal x1 2 sell)   [arg2 acquire->sell]
residue A      —
residue B      —
```

### seedA-004 · tierA-000024 ↔ tierA-000026 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio acquired a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 2        anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 2 buy)}
  near         (Ordinal x1 2 acquire) ~ (Ordinal x1 2 buy)   [arg2 acquire->buy]
residue A      —
residue B      —
```

### seedA-004 · tierA-000025 ↔ tierA-000026 · quality 0.62 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second kiln was sold to the pottery studio.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors x0
  A            {(Ordinal x0 2 sell)}
  B            {(Ordinal x0 2 buy)}
  near         (Ordinal x0 2 sell) ~ (Ordinal x0 2 buy)   [arg2 sell->buy]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-005 · tierA-000029 ↔ tierA-000030 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic repaired a seized gearbox.
B: The mechanic fixed a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 fix)}
  near         (Member e0 repair) ~ (Member e0 fix)   [arg1 repair->fix]
residue A      —
residue B      —
```

### seedA-005 · tierA-000029 ↔ tierA-000031 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic repaired a seized gearbox.
B: The mechanic mended a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 mend)}
  near         (Member e0 repair) ~ (Member e0 mend)   [arg1 repair->mend]
residue A      —
residue B      —
```

### seedA-005 · tierA-000029 ↔ tierA-000032 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The mechanic repaired a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-005 · tierA-000030 ↔ tierA-000031 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic fixed a seized gearbox.
B: The mechanic mended a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 mend)}
  near         (Member e0 fix) ~ (Member e0 mend)   [arg1 fix->mend]
residue A      —
residue B      —
```

### seedA-005 · tierA-000030 ↔ tierA-000032 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic fixed a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  near         (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
residue A      —
residue B      —
```

### seedA-005 · tierA-000031 ↔ tierA-000032 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic mended a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  near         (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
residue A      —
residue B      —
```

### seedA-006 · tierA-000035 ↔ tierA-000036 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician repaired the yard floodlight.
B: The electrician fixed the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 fix)}
  near         (Member e0 repair) ~ (Member e0 fix)   [arg1 repair->fix]
residue A      —
residue B      —
```

### seedA-006 · tierA-000035 ↔ tierA-000037 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician repaired the yard floodlight.
B: The electrician mended the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 mend)}
  near         (Member e0 repair) ~ (Member e0 mend)   [arg1 repair->mend]
residue A      —
residue B      —
```

### seedA-006 · tierA-000035 ↔ tierA-000038 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The electrician repaired the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-006 · tierA-000036 ↔ tierA-000037 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician fixed the yard floodlight.
B: The electrician mended the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 mend)}
  near         (Member e0 fix) ~ (Member e0 mend)   [arg1 fix->mend]
residue A      —
residue B      —
```

### seedA-006 · tierA-000036 ↔ tierA-000038 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician fixed the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  near         (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
residue A      —
residue B      —
```

### seedA-006 · tierA-000037 ↔ tierA-000038 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician mended the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  near         (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
residue A      —
residue B      —
```

### seedA-007 · tierA-000041 ↔ tierA-000042 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor repairs a torn awning.
B: A tailor fixes a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000041 ↔ tierA-000043 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor repairs a torn awning.
B: A tailor mends a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000042 ↔ tierA-000043 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor fixes a torn awning.
B: A tailor mends a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-008 · tierA-000046 ↔ tierA-000047 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A crew repairs a cracked feed pipe.
B: A crew fixes a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      —
```

### seedA-008 · tierA-000046 ↔ tierA-000048 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A crew repairs a cracked feed pipe.
B: A crew mends a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      —
```

### seedA-008 · tierA-000046 ↔ tierA-000049 · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew repairs a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000048 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A crew fixes a cracked feed pipe.
B: A crew mends a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      —
```

### seedA-008 · tierA-000047 ↔ tierA-000049 · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew fixes a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000049 · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew mends a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-009 · tierA-000052 ↔ tierA-000053 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey begins at dawn.
B: A shoreline survey starts at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  near         (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
residue A      —
residue B      —
```

### seedA-009 · tierA-000052 ↔ tierA-000054 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey begins at dawn.
B: A shoreline survey commences at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  near         (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
residue A      —
residue B      —
```

### seedA-009 · tierA-000053 ↔ tierA-000054 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey starts at dawn.
B: A shoreline survey commences at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  near         (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
residue A      —
residue B      —
```

### seedA-010 · tierA-000057 ↔ tierA-000058 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing begins on Monday morning.
B: A hearing starts on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  near         (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
residue A      —
residue B      —
```

### seedA-010 · tierA-000057 ↔ tierA-000059 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing begins on Monday morning.
B: A hearing commences on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  near         (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
residue A      —
residue B      —
```

### seedA-010 · tierA-000058 ↔ tierA-000059 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing starts on Monday morning.
B: A hearing commences on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  near         (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
residue A      —
residue B      —
```

### seedA-011 · tierA-000062 ↔ tierA-000063 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal starts after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  near         (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
residue A      —
residue B      —
```

### seedA-011 · tierA-000062 ↔ tierA-000064 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal commences after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  near         (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
residue A      —
residue B      —
```

### seedA-011 · tierA-000063 ↔ tierA-000064 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal starts after lunch.
B: The dress rehearsal commences after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  near         (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
residue A      —
residue B      —
```

### seedA-012 · tierA-000067 ↔ tierA-000068 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest begins in September.
B: The apple harvest starts in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  near         (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
residue A      —
residue B      —
```

### seedA-012 · tierA-000067 ↔ tierA-000069 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest begins in September.
B: The apple harvest commences in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  near         (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
residue A      —
residue B      —
```

### seedA-012 · tierA-000068 ↔ tierA-000069 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest starts in September.
B: The apple harvest commences in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  near         (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
residue A      —
residue B      —
```

### seedA-013 · tierA-000072 ↔ tierA-000073 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 5

A: A warden allows visitors on Sundays.
B: A warden permits visitors on Sundays.

```
renaming a->b  
common         —
residue A      —
residue B      {(Agent e0' x0') (Member e0' permit) (Member x0' warden) (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-014 · tierA-000076 ↔ tierA-000077 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A licence allows night deliveries.
B: A licence permits night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member x0 licence) (Theme e0 night_delivery)
group 1        anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 permit)}
  near         (Member e0 allow) ~ (Member e0 permit)   [arg1 allow->permit]
residue A      —
residue B      —
```

### seedA-015 · tierA-000080 ↔ tierA-000081 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A curator allows photography in the hall.
B: A curator permits photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
group 1        anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 permit)}
  near         (Member e0 allow) ~ (Member e0 permit)   [arg1 allow->permit]
residue A      —
residue B      —
```

### seedA-016 · tierA-000084 ↔ tierA-000085 · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recipe requires two eggs.
B: A recipe needs two eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member x0 recipe) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  near         (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
group 2        anchors e0
  A            {(Member e0 require)}
  B            {(Member e0 need)}
  near         (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
residue A      —
residue B      —
```

### seedA-016 · tierA-000084 ↔ tierA-000086 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recipe requires two eggs.
B: Two eggs are required by a recipe.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  near         (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
residue A      —
residue B      —
```

### seedA-016 · tierA-000085 ↔ tierA-000086 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recipe needs two eggs.
B: Two eggs are required by a recipe.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      —
```

### seedA-017 · tierA-000089 ↔ tierA-000090 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A permit requires a countersignature.
B: A permit needs a countersignature.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 require)}
  B            {(Member e0 need)}
  near         (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
residue A      —
residue B      —
```

### seedA-017 · tierA-000089 ↔ tierA-000091 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A permit requires a countersignature.
B: A countersignature is required by a permit.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-017 · tierA-000090 ↔ tierA-000091 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A permit needs a countersignature.
B: A countersignature is required by a permit.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      —
```

### seedA-018 · tierA-000094 ↔ tierA-000095 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A lathe requires monthly servicing.
B: A lathe needs monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
group 1        anchors e0
  A            {(Member e0 require)}
  B            {(Member e0 need)}
  near         (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
residue A      —
residue B      —
```

### seedA-018 · tierA-000094 ↔ tierA-000096 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A lathe requires monthly servicing.
B: Monthly servicing is required by a lathe.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
residue A      —
residue B      —
```

### seedA-018 · tierA-000095 ↔ tierA-000096 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A lathe needs monthly servicing.
B: Monthly servicing is required by a lathe.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
group 1        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      —
```

### seedA-019 · tierA-000099 ↔ tierA-000100 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A rescue team abandons the search.
B: A rescue team gives up the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  near         (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
residue A      —
residue B      —
```

### seedA-019 · tierA-000099 ↔ tierA-000101 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A rescue team abandons the search.
B: The search is abandoned by a rescue team.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member e0 abandon) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-019 · tierA-000100 ↔ tierA-000101 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A rescue team gives up the search.
B: The search is abandoned by a rescue team.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  near         (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
residue A      —
residue B      —
```

### seedA-020 · tierA-000104 ↔ tierA-000105 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A firm abandons its tender.
B: A firm gives up its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  near         (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
residue A      —
residue B      —
```

### seedA-020 · tierA-000104 ↔ tierA-000106 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A firm abandons its tender.
B: Its tender is abandoned by a firm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-020 · tierA-000105 ↔ tierA-000106 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A firm gives up its tender.
B: Its tender is abandoned by a firm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  near         (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
residue A      —
residue B      —
```

### seedA-021 · tierA-000109 ↔ tierA-000110 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two climbers abandon the north route.
B: Two climbers give up the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  near         (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
residue A      —
residue B      —
```

### seedA-021 · tierA-000109 ↔ tierA-000111 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Two climbers abandon the north route.
B: The north route is abandoned by two climbers.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-021 · tierA-000110 ↔ tierA-000111 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two climbers give up the north route.
B: The north route is abandoned by two climbers.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  near         (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
residue A      —
residue B      —
```

### seedA-022 · tierA-000114 ↔ tierA-000115 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A board postpones the vote.
B: A board puts off the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  near         (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
residue A      —
residue B      —
```

### seedA-022 · tierA-000114 ↔ tierA-000116 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A board postpones the vote.
B: The vote is postponed by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 board) (Member x1 vote) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-022 · tierA-000115 ↔ tierA-000116 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A board puts off the vote.
B: The vote is postponed by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  near         (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
residue A      —
residue B      —
```

### seedA-023 · tierA-000119 ↔ tierA-000120 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A ferry postpones its departure.
B: A ferry puts off its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  near         (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
residue A      —
residue B      —
```

### seedA-024 · tierA-000123 ↔ tierA-000124 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A club postpones the tournament.
B: A club puts off the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  near         (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
residue A      —
residue B      —
```

### seedA-024 · tierA-000123 ↔ tierA-000125 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A club postpones the tournament.
B: The tournament is postponed by a club.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-024 · tierA-000124 ↔ tierA-000125 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A club puts off the tournament.
B: The tournament is postponed by a club.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  near         (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
residue A      —
residue B      —
```

### seedA-025 · tierA-000128 ↔ tierA-000129 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An auditor discovers an error in the ledger.
B: An auditor finds out an error in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
group 1        anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  near         (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
residue A      —
residue B      —
```

### seedA-025 · tierA-000128 ↔ tierA-000130 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: An auditor discovers an error in the ledger.
B: An error in the ledger is discovered by an auditor.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
residue A      —
residue B      —
```

### seedA-025 · tierA-000129 ↔ tierA-000130 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An auditor finds out an error in the ledger.
B: An error in the ledger is discovered by an auditor.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
residue A      —
residue B      —
```

### seedA-026 · tierA-000133 ↔ tierA-000134 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A diver discovers a wreck off the point.
B: A diver finds out a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  near         (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
residue A      —
residue B      —
```

### seedA-026 · tierA-000133 ↔ tierA-000135 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A diver discovers a wreck off the point.
B: A wreck off the point is discovered by a diver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-026 · tierA-000134 ↔ tierA-000135 · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A diver finds out a wreck off the point.
B: A wreck off the point is discovered by a diver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
residue A      —
residue B      —
```

### seedA-027 · tierA-000138 ↔ tierA-000139 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An intern discovers the missing file.
B: An intern finds out the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  near         (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
residue A      —
residue B      —
```

### seedA-027 · tierA-000138 ↔ tierA-000140 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: An intern discovers the missing file.
B: The missing file is discovered by an intern.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-027 · tierA-000139 ↔ tierA-000140 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An intern finds out the missing file.
B: The missing file is discovered by an intern.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
residue A      —
residue B      —
```

### seedA-028 · tierA-000143 ↔ tierA-000144 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An airline cancels the evening flight.
B: An airline calls off the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  near         (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
residue A      —
residue B      —
```

### seedA-028 · tierA-000143 ↔ tierA-000145 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An airline cancels the evening flight.
B: The evening flight is canceled by an airline.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member e0 cancel) (Member x0 airline) (Member x1 evening_flight)
group 1        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Patient e0 x1)}
  near         (Theme e0 x1) ~ (Patient e0 x1)   [head Theme->Patient]
residue A      —
residue B      —
```

### seedA-028 · tierA-000144 ↔ tierA-000145 · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An airline calls off the evening flight.
B: The evening flight is canceled by an airline.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  near         (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Patient e0 x1)}
  near         (Theme e0 x1) ~ (Patient e0 x1)   [head Theme->Patient]
residue A      —
residue B      —
```

### seedA-029 · tierA-000148 ↔ tierA-000149 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A council cancels the summer fair.
B: A council calls off the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  near         (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
residue A      —
residue B      —
```

### seedA-029 · tierA-000148 ↔ tierA-000150 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A council cancels the summer fair.
B: The summer fair is canceled by a council.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-029 · tierA-000149 ↔ tierA-000150 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A council calls off the summer fair.
B: The summer fair is canceled by a council.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  near         (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
residue A      —
residue B      —
```

### seedA-030 · tierA-000153 ↔ tierA-000154 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tutor cancels the afternoon session.
B: A tutor calls off the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  near         (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
residue A      —
residue B      —
```

### seedA-030 · tierA-000153 ↔ tierA-000155 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A tutor cancels the afternoon session.
B: The afternoon session is canceled by a tutor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-030 · tierA-000154 ↔ tierA-000155 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tutor calls off the afternoon session.
B: The afternoon session is canceled by a tutor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  near         (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
residue A      —
residue B      —
```

### seedA-031 · tierA-000158 ↔ tierA-000159 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An editor rejects a manuscript.
B: An editor turns down a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  near         (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
residue A      —
residue B      —
```

### seedA-031 · tierA-000158 ↔ tierA-000160 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: An editor rejects a manuscript.
B: A manuscript is rejected by an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-031 · tierA-000159 ↔ tierA-000160 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An editor turns down a manuscript.
B: A manuscript is rejected by an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  near         (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
residue A      —
residue B      —
```

### seedA-032 · tierA-000163 ↔ tierA-000164 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A bank rejects the loan application.
B: A bank turns down the loan application.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  near         (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
residue A      —
residue B      —
```

### seedA-032 · tierA-000163 ↔ tierA-000165 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A bank rejects the loan application.
B: The loan application is rejected by a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-032 · tierA-000164 ↔ tierA-000165 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A bank turns down the loan application.
B: The loan application is rejected by a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  near         (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
residue A      —
residue B      —
```

### seedA-033 · tierA-000168 ↔ tierA-000169 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A panel rejects the proposal.
B: A panel turns down the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  near         (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
residue A      —
residue B      —
```

### seedA-033 · tierA-000168 ↔ tierA-000170 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A panel rejects the proposal.
B: The proposal is rejected by a panel.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-033 · tierA-000169 ↔ tierA-000170 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A panel turns down the proposal.
B: The proposal is rejected by a panel.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  near         (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
residue A      —
residue B      —
```

### seedA-034 · tierA-000173 ↔ tierA-000174 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shepherd walks along the ridge.
B: A shepherd takes a walk along the ridge.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Location e0 x1) (Member e0 walk) (Member x0 shepherd) (Member x1 ridge)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' take) (Theme e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' take) (Theme e0' e0)
residue A      —
residue B      —
```

### seedA-035 · tierA-000177 ↔ tierA-000178 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A nurse walks through the ward.
B: A nurse takes a walk through the ward.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Location e0 x1) (Member e0 walk) (Member x0 nurse) (Member x1 ward)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' take) (Theme e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' take) (Theme e0' e0)
residue A      —
residue B      —
```

### seedA-036 · tierA-000181 ↔ tierA-000182 · quality 0.62 · common 5 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two children walk to the pier.
B: Two children take a walk to the pier.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Cardinality x0 2) (Goal e0 x1) (GroupOf x0 child) (Member e0 walk) (Member x1 pier)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' take) (Patient e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' take) (Patient e0' e0)
residue A      —
residue B      —
```

### seedA-037 · tierA-000185 ↔ tierA-000186 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee makes a decision on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 make)}
  near         (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e1' x1)   [arg0 e0->e1']
  B only       (Member e1' decision) (Patient e0 e1')
residue A      —
residue B      —
```

### seedA-037 · tierA-000185 ↔ tierA-000187 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee reaches a decision on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 reach)}
  near         (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e0 e1')   [arg1 x1->e1']
  B only       (Member e1' decision) (Theme e1' x1)
residue A      —
residue B      —
```

### seedA-037 · tierA-000186 ↔ tierA-000187 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A committee makes a decision on a new roof.
B: A committee reaches a decision on a new roof.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 committee) (Member x1 new) (Member x1 roof) (Theme e1 x1)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 reach)}
  near         (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
group 2        anchors e0 e1
  A            {(Patient e0 e1)}
  B            {(Theme e0 e1)}
  near         (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-038 · tierA-000190 ↔ tierA-000191 · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge decides the case.
B: A judge makes a decision on the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 make)}
  near         (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e1' x1)   [arg0 e0->e1']
  B only       (Member e1' decision) (Patient e0 e1')
residue A      —
residue B      —
```

### seedA-038 · tierA-000190 ↔ tierA-000192 · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge decides the case.
B: A judge reaches a decision on the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 reach)}
  near         (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e0 e1')   [arg1 x1->e1']
  B only       (Member e1' decision) (Theme e1' x1)
residue A      —
residue B      —
```

### seedA-038 · tierA-000190 ↔ tierA-000193 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A judge decides the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-038 · tierA-000191 ↔ tierA-000192 · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A judge makes a decision on the case.
B: A judge reaches a decision on the case.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 judge) (Member x1 case) (Theme e1 x1)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 reach)}
  near         (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
group 2        anchors e0 e1
  A            {(Patient e0 e1)}
  B            {(Theme e0 e1)}
  near         (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-038 · tierA-000191 ↔ tierA-000193 · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge makes a decision on the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 decide)}
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e1 x1) ~ (Theme e0 x1)   [arg0 e1->e0]
  A only       (Member e1 decision) (Patient e0 e1)
residue A      —
residue B      —
```

### seedA-038 · tierA-000192 ↔ tierA-000193 · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge reaches a decision on the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 reach)}
  B            {(Member e0 decide)}
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      —
```

### seedA-039 · tierA-000196 ↔ tierA-000197 · quality 0.33 · common 2 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A family decides to move north.
B: A family makes a decision to move north.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 family)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 make)}
  near         (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
group 2        anchors e0 x0
  A            {(Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Member e1' decision) (Patient e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  partial      (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))   [arg0 e0->e1']
  B only       (Member e1' decision) (Patient e0 e1')
residue A      —
residue B      —
```

### seedA-039 · tierA-000196 ↔ tierA-000198 · quality 0.33 · common 2 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A family decides to move north.
B: A family reaches a decision to move north.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 family)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 reach)}
  near         (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
group 2        anchors e0 x0
  A            {(Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Member e1' decision) (Theme e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  partial      (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e0 e1')   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->e1']
  B only       (Member e1' decision) (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
residue A      —
residue B      —
```

### seedA-039 · tierA-000197 ↔ tierA-000198 · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A family makes a decision to move north.
B: A family reaches a decision to move north.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 family) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 reach)}
  near         (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
group 2        anchors e0 e1
  A            {(Patient e0 e1)}
  B            {(Theme e0 e1)}
  near         (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-040 · tierA-000201 ↔ tierA-000202 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A board decides next year's budget.
B: A board makes a decision on next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 make)}
  near         (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e1' x1)   [arg0 e0->e1']
  B only       (Member e1' decision) (Patient e0 e1')
residue A      —
residue B      —
```

### seedA-040 · tierA-000201 ↔ tierA-000203 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A board decides next year's budget.
B: A board reaches a decision on next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 decide)}
  B            {(Member e0 reach)}
  near         (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  partial      (Theme e0 x1) ~ (Theme e0 e1')   [arg1 x1->e1']
  B only       (Member e1' decision) (Theme e1' x1)
residue A      —
residue B      —
```

### seedA-040 · tierA-000201 ↔ tierA-000204 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A board decides next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-040 · tierA-000202 ↔ tierA-000203 · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A board makes a decision on next year's budget.
B: A board reaches a decision on next year's budget.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e1 x1)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 reach)}
  near         (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
group 2        anchors e0 e1
  A            {(Patient e0 e1)}
  B            {(Theme e0 e1)}
  near         (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-040 · tierA-000202 ↔ tierA-000204 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A board makes a decision on next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 decide)}
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e1 x1) ~ (Theme e0 x1)   [arg0 e1->e0]
  A only       (Member e1 decision) (Patient e0 e1)
residue A      —
residue B      —
```

### seedA-040 · tierA-000203 ↔ tierA-000204 · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A board reaches a decision on next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 reach)}
  B            {(Member e0 decide)}
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      —
```

### seedA-041 · tierA-000207 ↔ tierA-000208 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 2 · 2 renamings tied

A: A clerk answers the query.
B: A clerk gives an answer to the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
group 1        anchors e0
  A            {(Member e0 answer)}
  B            {(Member e0 give)}
  near         (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Recipient e0 x1)}
  near         (Theme e0 x1) ~ (Recipient e0 x1)   [head Theme->Recipient]
residue A      —
residue B      {(Member x2' answer) (Theme e0 x2')}@e0
```

### seedA-041 · tierA-000207 ↔ tierA-000209 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A clerk answers the query.
B: The query is answered by a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-041 · tierA-000208 ↔ tierA-000209 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0 · 2 renamings tied

A: A clerk gives an answer to the query.
B: The query is answered by a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
residue A      {(Member x2 answer) (Theme e0 x2)}@e0
residue B      —
```

### seedA-042 · tierA-000212 ↔ tierA-000213 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 2 · 2 renamings tied

A: A pilot answers the tower.
B: A pilot gives an answer to the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
group 1        anchors e0
  A            {(Member e0 answer)}
  B            {(Member e0 give)}
  near         (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Recipient e0 x1)}
  near         (Theme e0 x1) ~ (Recipient e0 x1)   [head Theme->Recipient]
residue A      —
residue B      {(Member x2' answer) (Theme e0 x2')}@e0
```

### seedA-042 · tierA-000212 ↔ tierA-000214 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A pilot answers the tower.
B: The tower is answered by a pilot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-042 · tierA-000213 ↔ tierA-000214 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0 · 2 renamings tied

A: A pilot gives an answer to the tower.
B: The tower is answered by a pilot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
residue A      {(Member x2 answer) (Theme e0 x2)}@e0
residue B      —
```

### seedA-043 · tierA-000217 ↔ tierA-000218 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 2 · 2 renamings tied

A: A vet answers the caller.
B: A vet gives an answer to the caller.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 vet) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 answer)}
  B            {(Member e0 give)}
  near         (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
group 2        anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 answer)}
  near         (Member x1 caller) ~ (Member x1 answer)   [arg1 caller->answer]
residue A      —
residue B      {(Member x2' caller) (Recipient e0 x2')}@e0
```

### seedA-043 · tierA-000217 ↔ tierA-000219 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A vet answers the caller.
B: The caller is answered by a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 vet) (Member x1 caller) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-043 · tierA-000218 ↔ tierA-000219 · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0 · 2 renamings tied

A: A vet gives an answer to the caller.
B: The caller is answered by a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 vet) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors x1
  A            {(Member x1 answer)}
  B            {(Member x1 caller)}
  near         (Member x1 answer) ~ (Member x1 caller)   [arg1 answer->caller]
residue A      {(Member x2 caller) (Recipient e0 x2)}@e0
residue B      —
```

### seedA-044 · tierA-000222 ↔ tierA-000223 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A storm destroys the greenhouse.
B: A storm causes the destruction of the greenhouse.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' cause) (Theme e0' e0)
residue A      —
residue B      —
```

### seedA-044 · tierA-000222 ↔ tierA-000224 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A storm destroys the greenhouse.
B: The greenhouse is destroyed by a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-044 · tierA-000223 ↔ tierA-000224 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A storm causes the destruction of the greenhouse.
B: The greenhouse is destroyed by a storm.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e1 x1)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}
  B            {(Agent e1 x0)}
  partial      (Agent e0 x0) ~ (Agent e1 x0)   [arg0 e0->e1]
  A only       (Member e0 cause) (Theme e0 e1)
residue A      —
residue B      —
```

### seedA-045 · tierA-000227 ↔ tierA-000228 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A fire destroys the archive.
B: A fire causes the destruction of the archive.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 fire) (Member x1 archive) (Patient e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' cause) (Theme e0' e0)
residue A      —
residue B      —
```

### seedA-045 · tierA-000227 ↔ tierA-000229 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A fire destroys the archive.
B: The archive is destroyed by a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 fire) (Member x1 archive) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-045 · tierA-000228 ↔ tierA-000229 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A fire causes the destruction of the archive.
B: The archive is destroyed by a fire.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 fire) (Member x1 archive) (Patient e1 x1)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}
  B            {(Agent e1 x0)}
  partial      (Agent e0 x0) ~ (Agent e1 x0)   [arg0 e0->e1]
  A only       (Member e0 cause) (Theme e0 e1)
residue A      —
residue B      —
```

### seedA-046 · tierA-000232 ↔ tierA-000233 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A flood destroys the footbridge.
B: A flood causes the destruction of the footbridge.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}
  partial      (Agent e0 x0) ~ (Agent e0' x0)   [arg0 e0->e0']
  B only       (Member e0' cause) (Theme e0' e0)
residue A      —
residue B      —
```

### seedA-046 · tierA-000232 ↔ tierA-000234 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A flood destroys the footbridge.
B: The footbridge is destroyed by a flood.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-046 · tierA-000233 ↔ tierA-000234 · quality 0.57 · common 4 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A flood causes the destruction of the footbridge.
B: The footbridge is destroyed by a flood.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e1 x1)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}
  B            {(Agent e1 x0)}
  partial      (Agent e0 x0) ~ (Agent e1 x0)   [arg0 e0->e1]
  A only       (Member e0 cause) (Theme e0 e1)
residue A      —
residue B      —
```

### seedA-047 · tierA-000237 ↔ tierA-000238 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The freight arrives at noon.
B: The arrival of the freight is at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
residue A      —
residue B      —
```

### seedA-048 · tierA-000241 ↔ tierA-000242 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A delegation arrives on Thursday.
B: The arrival of a delegation is on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
group 1        anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 arrival)}
  near         (Member e0 arrive) ~ (Member e0 arrival)   [arg1 arrive->arrival]
residue A      —
residue B      —
```

### seedA-049 · tierA-000245 ↔ tierA-000246 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The soil samples arrive by post.
B: The soil samples' arrival is by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
group 1        anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 arrival)}
  near         (Member e0 arrive) ~ (Member e0 arrival)   [arg1 arrive->arrival]
residue A      —
residue B      —
```

### seedA-050 · tierA-000249 ↔ tierA-000250 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An old mare dies during the winter.
B: An old mare kicks the bucket during the winter.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-051 · tierA-000253 ↔ tierA-000254 · quality 0.75 · common 3 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The founder dies at ninety.
B: The founder kicks the bucket at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member x0 founder) (Patient e0 x0)
group 1        anchors e0
  A            {(Member e0 die)}
  B            {(Member e0 kick_the_bucket)}
  near         (Member e0 die) ~ (Member e0 kick_the_bucket)   [arg1 die->kick_the_bucket]
residue A      —
residue B      —
```

### seedA-052 · tierA-000257 ↔ tierA-000258 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The last elm dies that autumn.
B: The last elm kicks the bucket that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Patient e0 x0) (Time e0 that_autumn)
group 1        anchors e0
  A            {(Member e0 die)}
  B            {(Member e0 kick_the_bucket)}
  near         (Member e0 die) ~ (Member e0 kick_the_bucket)   [arg1 die->kick_the_bucket]
residue A      —
residue B      —
```

### seedA-053 · tierA-000261 ↔ tierA-000262 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A trainer gives a recruit a whistle.
B: A recruit receives a whistle from a trainer.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 receive)}
  near         (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-053 · tierA-000261 ↔ tierA-000263 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A trainer gives a recruit a whistle.
B: A trainer gives a whistle to a recruit.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-053 · tierA-000262 ↔ tierA-000263 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recruit receives a whistle from a trainer.
B: A trainer gives a whistle to a recruit.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 recruit) (Member x1 trainer) (Member x2 whistle) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-054 · tierA-000266 ↔ tierA-000267 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: Each member receives a card from a library.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000266 ↔ tierA-000268 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: A library gives a card to each member.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000267 ↔ tierA-000268 · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: A library gives a card to each member.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-055 · tierA-000271 ↔ tierA-000272 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A foreman gives a driver the manifest.
B: A driver receives the manifest from a foreman.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Member x0 foreman) (Member x1 manifest) (Member x2 driver) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 receive)}
  near         (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
group 3        anchors e0 x2
  A            {(Recipient e0 x2)}
  B            {(Agent e0 x2)}
  near         (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-055 · tierA-000271 ↔ tierA-000273 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A foreman gives a driver the manifest.
B: A foreman gives the manifest to a driver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x1 manifest) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-055 · tierA-000272 ↔ tierA-000273 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A driver receives the manifest from a foreman.
B: A foreman gives the manifest to a driver.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 driver) (Member x1 foreman) (Member x2 manifest) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-056 · tierA-000276 ↔ tierA-000277 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A school gives the winner a medal.
B: The winner receives a medal from a school.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 school) (Member x1 winner) (Member x2 medal) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 receive)}
  near         (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-056 · tierA-000276 ↔ tierA-000278 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A school gives the winner a medal.
B: A school gives a medal to the winner.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-056 · tierA-000277 ↔ tierA-000278 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The winner receives a medal from a school.
B: A school gives a medal to the winner.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 winner) (Member x1 school) (Member x2 medal) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-057 · tierA-000281 ↔ tierA-000282 · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A potter teaches an apprentice glazing.
B: An apprentice learns glazing from a potter.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 potter) (Member x1 apprentice) (Theme e0 glazing)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 teach)}
  B            {(Member e0 learn)}
  near         (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-057 · tierA-000281 ↔ tierA-000283 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A potter teaches an apprentice glazing.
B: A potter teaches glazing to an apprentice.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
residue A      —
residue B      —
```

### seedA-057 · tierA-000282 ↔ tierA-000283 · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An apprentice learns glazing from a potter.
B: A potter teaches glazing to an apprentice.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-058 · tierA-000286 ↔ tierA-000287 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A coach teaches the squad a drill.
B: The squad learns a drill from a coach.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 coach) (Member x1 drill) (Member x2 squad) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 teach)}
  B            {(Member e0 learn)}
  near         (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
group 3        anchors e0 x2
  A            {(Recipient e0 x2)}
  B            {(Agent e0 x2)}
  near         (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-058 · tierA-000286 ↔ tierA-000288 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A coach teaches the squad a drill.
B: A coach teaches a drill to the squad.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Member x2 squad) (Recipient e0 x2) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-058 · tierA-000287 ↔ tierA-000288 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The squad learns a drill from a coach.
B: A coach teaches a drill to the squad.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 squad) (Member x1 drill) (Member x2 coach) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 3        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Agent e0 x2)}
  near         (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-059 · tierA-000291 ↔ tierA-000292 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An elder teaches the children a song.
B: The children learn a song from an elder.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (GroupOf x1 child) (Member x0 elder) (Member x2 song) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 teach)}
  B            {(Member e0 learn)}
  near         (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-059 · tierA-000291 ↔ tierA-000293 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: An elder teaches the children a song.
B: An elder teaches a song to the children.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-059 · tierA-000292 ↔ tierA-000293 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The children learn a song from an elder.
B: An elder teaches a song to the children.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (GroupOf x0 child) (Member x1 song) (Member x2 elder) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 3        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Agent e0 x2)}
  near         (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-060 · tierA-000296 ↔ tierA-000297 · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A neighbour lends Ravi a ladder.
B: Ravi borrows a ladder from a neighbour.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 lend)}
  B            {(Member e0 borrow)}
  near         (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
group 3        anchors e0
  A            {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)}
  near         (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-060 · tierA-000296 ↔ tierA-000298 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A neighbour lends Ravi a ladder.
B: A neighbour lends a ladder to Ravi.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Recipient e0 ravi) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-060 · tierA-000297 ↔ tierA-000298 · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Ravi borrows a ladder from a neighbour.
B: A neighbour lends a ladder to Ravi.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
group 1        anchors e0
  A            {(Agent e0 ravi)}
  B            {(Member e0 lend)}
  near         (Agent e0 ravi) ~ (Member e0 lend)   [head Agent->Member; arg1 ravi->lend]
group 2        anchors e0
  A            {(Member e0 borrow)}
  B            {(Recipient e0 ravi)}
  near         (Member e0 borrow) ~ (Recipient e0 ravi)   [head Member->Recipient; arg1 borrow->ravi]
group 3        anchors e0 x0
  A            {(Source e0 x0)}
  B            {(Agent e0 x0)}
  near         (Source e0 x0) ~ (Agent e0 x0)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-061 · tierA-000301 ↔ tierA-000302 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot lends the crew a generator.
B: The crew borrows a generator from the depot.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 depot) (Member x1 generator) (Member x2 crew) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 lend)}
  B            {(Member e0 borrow)}
  near         (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
group 3        anchors e0 x2
  A            {(Recipient e0 x2)}
  B            {(Agent e0 x2)}
  near         (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-061 · tierA-000301 ↔ tierA-000303 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The depot lends the crew a generator.
B: The depot lends a generator to the crew.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x0 depot) (Member x1 generator) (Member x2 crew) (Recipient e0 x2) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-061 · tierA-000302 ↔ tierA-000303 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The crew borrows a generator from the depot.
B: The depot lends a generator to the crew.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 crew) (Member x1 generator) (Member x2 depot) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 borrow)}
  B            {(Member e0 lend)}
  near         (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
group 3        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Agent e0 x2)}
  near         (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-062 · tierA-000306 ↔ tierA-000307 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The museum lends the gallery a painting.
B: The gallery borrows a painting from the museum.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
group 2        anchors e0
  A            {(Member e0 lend)}
  B            {(Member e0 borrow)}
  near         (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-062 · tierA-000306 ↔ tierA-000308 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The museum lends the gallery a painting.
B: The museum lends a painting to the gallery.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Member x2 painting) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      —
```

### seedA-062 · tierA-000307 ↔ tierA-000308 · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The gallery borrows a painting from the museum.
B: The museum lends a painting to the gallery.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 gallery) (Member x1 museum) (Member x2 painting) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 borrow)}
  B            {(Member e0 lend)}
  near         (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      —
```

### seedA-063 · tierA-000311 ↔ tierA-000312 · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 3

A: Ana works with Bo on the mural.
B: Ana and Bo work on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (Member e0 work) (Member x0 mural) (Theme e0 x0)
residue A      {(CoAgent e0 bo)}@e0
residue B      {(Agent e1' bo) (Member e1' work) (Theme e1' x0)}@x0
```

### seedA-064 · tierA-000315 ↔ tierA-000316 · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A welder works with a fitter on the frame.
B: A welder and a fitter work on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
group 1        anchors e0 x1 x2
  A            {(CoAgent e0 x1)}
  B            {(Agent e1' x1) (Location e1' x2) (Member e1' work)}
  partial      (CoAgent e0 x1) ~ (Agent e1' x1)   [head CoAgent->Agent; arg0 e0->e1']
  B only       (Location e1' x2) (Member e1' work)
residue A      —
residue B      —
```

### seedA-065 · tierA-000319 ↔ tierA-000320 · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A biologist works with a ranger on the survey.
B: A biologist and a ranger work on the survey.

```
renaming a->b  e0->e1 x0->x1 x1->x0 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
group 1        anchors e0 x1 x2
  A            {(CoAgent e0 x1)}
  B            {(Agent e0' x1) (Location e0' x2) (Member e0' work)}
  partial      (CoAgent e0 x1) ~ (Agent e0' x1)   [head CoAgent->Agent; arg0 e0->e0']
  B only       (Location e0' x2) (Member e0' work)
residue A      —
residue B      —
```

### seedA-066 · tierA-000323 ↔ tierA-000324 · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 3

A: Dara works with Nils on the ledger.
B: Dara and Nils work on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (Location e0 x0) (Member e0 work) (Member x0 ledger)
residue A      {(CoAgent e0 nils)}@e0
residue B      {(Agent e1' nils) (Location e1' x0) (Member e1' work)}@x0
```

### seedA-067 · tierA-000327 ↔ tierA-000328 · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A crate is large in size.
B: A crate is big in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  near         (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
residue A      —
residue B      —
```

### seedA-068 · tierA-000331 ↔ tierA-000332 · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The hatch is large in size.
B: The hatch is big in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  near         (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
residue A      —
residue B      —
```

### seedA-069 · tierA-000335 ↔ tierA-000336 · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The new bench is large.
B: The new bench is big.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  near         (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
residue A      —
residue B      —
```

### seedA-070 · tierA-000339 ↔ tierA-000340 · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The boiler is huge in size.
B: The boiler is very big in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 big)}
  near         (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
residue A      —
residue B      {(Degree x0 big very)}@x0
```

### seedA-071 · tierA-000343 ↔ tierA-000344 · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The skylight is huge in size.
B: The skylight is very big in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 big)}
  near         (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
residue A      —
residue B      {(Degree x0 big very)}@x0
```

### seedA-072 · tierA-000347 ↔ tierA-000348 · quality 0.50 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The spoil mound is huge.
B: The spoil mound is very big.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 big)}
  near         (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
residue A      —
residue B      {(Degree x0 big very)}@x0
```

### seedA-073 · tierA-000351 ↔ tierA-000352 · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The repair is difficult.
B: The repair is hard.

```
renaming a->b  x0->x0
common         (Member x0 repair)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  near         (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
residue A      —
residue B      —
```

### seedA-074 · tierA-000355 ↔ tierA-000356 · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The calibration is difficult.
B: The calibration is hard.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  near         (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
residue A      —
residue B      —
```

### seedA-075 · tierA-000359 ↔ tierA-000360 · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The descent is difficult.
B: The descent is hard.

```
renaming a->b  x0->x0
common         (Member x0 descent)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  near         (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
residue A      —
residue B      —
```

### seedA-076 · tierA-000363 ↔ tierA-000364 · quality 0.50 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The night crew is exhausted.
B: The night crew is very tired.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
group 1        anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 tired)}
  near         (Member x0 exhausted) ~ (Member x0 tired)   [arg1 exhausted->tired]
residue A      —
residue B      {(Degree x0 tired very)}@x0
```

### seedA-077 · tierA-000367 ↔ tierA-000368 · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The courier is exhausted.
B: The courier is very tired.

```
renaming a->b  x0->x0
common         (Member x0 courier)
group 1        anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 tired)}
  near         (Member x0 exhausted) ~ (Member x0 tired)   [arg1 exhausted->tired]
residue A      —
residue B      {(Degree x0 tired very)}@x0
```

### seedA-078 · tierA-000371 ↔ tierA-000372 · quality 0.00 · common 0 · aligned 0 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The divers are all exhausted.
B: The divers are all very tired.

```
renaming a->b  
common         —
group 1        anchors —
  A            {(Inheritance diver exhausted)}
  B            {(Degree diver tired very) (Inheritance diver tired)}
  partial      (Inheritance diver exhausted) ~ (Inheritance diver tired)   [arg1 exhausted->tired]
  B only       (Degree diver tired very)
residue A      —
residue B      —
```

### seedA-079 · tierA-000375 ↔ tierA-000376 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician signs the chart.
B: A doctor signs the chart.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x1 chart) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  near         (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
residue A      —
residue B      —
```

### seedA-079 · tierA-000375 ↔ tierA-000377 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A physician signs the chart.
B: The chart is signed by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x0 physician) (Member x1 chart) (Patient e0 x1)
residue A      —
residue B      —
```

### seedA-079 · tierA-000376 ↔ tierA-000377 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor signs the chart.
B: The chart is signed by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x1 chart) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
residue A      —
residue B      —
```

### seedA-080 · tierA-000380 ↔ tierA-000381 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician examines the samples.
B: A doctor examines the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  near         (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
residue A      —
residue B      —
```

### seedA-080 · tierA-000380 ↔ tierA-000382 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A physician examines the samples.
B: The samples are examined by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Member x0 physician) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-080 · tierA-000381 ↔ tierA-000382 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor examines the samples.
B: The samples are examined by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
residue A      —
residue B      —
```

### seedA-081 · tierA-000385 ↔ tierA-000386 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician orders a second scan.
B: A doctor orders a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  near         (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
residue A      —
residue B      —
```

### seedA-081 · tierA-000385 ↔ tierA-000387 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A physician orders a second scan.
B: A second scan is ordered by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-081 · tierA-000386 ↔ tierA-000387 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor orders a second scan.
B: A second scan is ordered by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
residue A      —
residue B      —
```

### seedA-082 · tierA-000390 ↔ tierA-000391 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An automobile blocks the lane.
B: A car blocks the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  near         (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
residue A      —
residue B      —
```

### seedA-082 · tierA-000390 ↔ tierA-000392 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: An automobile blocks the lane.
B: The lane is blocked by an automobile.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x0 automobile) (Member x1 lane) (Theme e0 x1)
residue A      —
residue B      —
```

### seedA-082 · tierA-000391 ↔ tierA-000392 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A car blocks the lane.
B: The lane is blocked by an automobile.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 car)}
  B            {(Member x0 automobile)}
  near         (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
residue A      —
residue B      —
```

### seedA-083 · tierA-000395 ↔ tierA-000396 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An automobile waits at the gate.
B: A car waits at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  near         (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
residue A      —
residue B      —
```

### seedA-084 · tierA-000399 ↔ tierA-000400 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An automobile crosses the bridge.
B: A car crosses the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 cross) (Member x1 bridge) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  near         (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
residue A      —
residue B      —
```

## Control pairs

### seedA-001 · tierA-000001 ↔ tierA-000006 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot bought two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000001 ↔ tierA-000007 · control: quantity-change · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot bought two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  near         (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-001 · tierA-000002 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot purchased two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 3        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000002 ↔ tierA-000007 · control: quantity-change · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot purchased two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  near         (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
residue A      —
residue B      —
```

### seedA-001 · tierA-000003 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot acquired two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 3        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000003 ↔ tierA-000007 · control: quantity-change · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The depot acquired two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  near         (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
residue A      —
residue B      —
```

### seedA-001 · tierA-000004 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two forklifts were sold to the depot.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 forklift) (Member x1 depot) (Past e0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
group 3        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Agent e0 x0)}
  near         (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000004 ↔ tierA-000007 · control: quantity-change · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two forklifts were sold to the depot.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x0 forklift) (Member x1 depot) (Past e0) (Theme e0 x0)
group 1        anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  near         (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
group 2        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000005 ↔ tierA-000006 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two forklifts were bought by the depot.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-001 · tierA-000005 ↔ tierA-000007 · control: quantity-change · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two forklifts were bought by the depot.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  near         (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-002 · tierA-000008 ↔ tierA-000013 · control: quantity-change · quality 0.78 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The school bought a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)}
  near         (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
residue A      —
residue B      {(GroupOf x2 projector)}@x2
```

### seedA-002 · tierA-000008 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The school bought a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
residue A      {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
residue B      {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000009 ↔ tierA-000013 · control: quantity-change · quality 0.67 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The school purchased a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 2        anchors x2
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)}
  near         (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
residue A      —
residue B      {(GroupOf x2 projector)}@x2
```

### seedA-002 · tierA-000009 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The school purchased a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
residue A      {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 purchase) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
residue B      {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000010 ↔ tierA-000013 · control: quantity-change · quality 0.67 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The school acquired a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 2        anchors x2
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)}
  near         (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
residue A      —
residue B      {(GroupOf x2 projector)}@x2
```

### seedA-002 · tierA-000010 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The school acquired a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
residue A      {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 acquire) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
residue B      {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000011 ↔ tierA-000013 · control: quantity-change · quality 0.56 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A projector was sold to the school for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Beneficiary e0 x0) (Member x0 hall) (Member x2 school) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors x1
  A            {(Member x1 projector)}
  B            {(Cardinality x1 2)}
  near         (Member x1 projector) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 projector->2]
group 3        anchors e0 x2
  A            {(Recipient e0 x2)}
  B            {(Agent e0 x2)}
  near         (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
residue A      —
residue B      {(GroupOf x1 projector)}@x1
```

### seedA-002 · tierA-000011 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: A projector was sold to the school for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x2 x1->x0 x2->x1
common         (Member x0 hall) (Member x2 school)
residue A      {(Beneficiary e0 x0) (Member e0 sell) (Member x1 projector) (Past e0) (Recipient e0 x2) (Theme e0 x1)}@x0,x2
residue B      {(And (Agent x1 x2) (Beneficiary x1 x0) (Member x1 buy) (Member x3' projector) (Past x1) (Theme x1 x3')) ~NEG}@x0,x2
```

### seedA-002 · tierA-000012 ↔ tierA-000013 · control: quantity-change · quality 0.78 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A projector was bought by the school for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)}
  near         (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
residue A      —
residue B      {(GroupOf x2 projector)}@x2
```

### seedA-002 · tierA-000012 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: A projector was bought by the school for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
residue A      {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
residue B      {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-003 · tierA-000015 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The chef bought several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
residue A      {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000015 ↔ tierA-000021 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef bought several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-003 · tierA-000016 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The chef purchased several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
residue A      {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 purchase) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000016 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 3        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-003 · tierA-000017 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The chef acquired several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
residue A      {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 acquire) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000017 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 3        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-003 · tierA-000018 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: Several crates of lemons were sold to the chef.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x0 x1->x1
common         (Member x1 chef)
residue A      {(GroupOf x0 lemon) (Member e0 sell) (Member x0 crate) (Past e0) (Recipient e0 x1) (Theme e0 x0)}@x1
residue B      {(And (Agent x0 x1) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x0 buy) (Member x2' crate) (Past x0) (Theme x0 x2')) ~NEG}@x1
```

### seedA-003 · tierA-000018 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Several crates of lemons were sold to the chef.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 lemon) (Member x0 crate) (Member x1 chef) (Past e0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
group 3        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Agent e0 x0)}
  near         (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-003 · tierA-000019 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: Several crates of lemons were bought by the chef.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
residue A      {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000019 ↔ tierA-000021 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Several crates of lemons were bought by the chef.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000027 · control: participant-swap · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio bought a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000022 ↔ tierA-000028 · control: quantity-change · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio bought a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 3 buy)}
  near         (Ordinal x1 2 buy) ~ (Ordinal x1 3 buy)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-004 · tierA-000023 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio purchased a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 3        anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 buy)}
  near         (Ordinal x1 2 purchase) ~ (Ordinal x1 2 buy)   [arg2 purchase->buy]
group 4        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000023 ↔ tierA-000028 · control: quantity-change · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio purchased a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  near         (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
group 2        anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 3 buy)}
  near         (Ordinal x1 2 purchase) ~ (Ordinal x1 3 buy)   [arg1 2->3; arg2 purchase->buy]
residue A      —
residue B      —
```

### seedA-004 · tierA-000024 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio acquired a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 3        anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 2 buy)}
  near         (Ordinal x1 2 acquire) ~ (Ordinal x1 2 buy)   [arg2 acquire->buy]
group 4        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000024 ↔ tierA-000028 · control: quantity-change · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The pottery studio acquired a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  near         (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
group 2        anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 3 buy)}
  near         (Ordinal x1 2 acquire) ~ (Ordinal x1 3 buy)   [arg1 2->3; arg2 acquire->buy]
residue A      —
residue B      —
```

### seedA-004 · tierA-000025 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second kiln was sold to the pottery studio.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors x0
  A            {(Ordinal x0 2 sell)}
  B            {(Ordinal x0 2 buy)}
  near         (Ordinal x0 2 sell) ~ (Ordinal x0 2 buy)   [arg2 sell->buy]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
group 4        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Agent e0 x0)}
  near         (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000025 ↔ tierA-000028 · control: quantity-change · quality 0.62 · common 5 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second kiln was sold to the pottery studio.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 sell)}
  B            {(Member e0 buy)}
  near         (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
group 2        anchors x0
  A            {(Ordinal x0 2 sell)}
  B            {(Ordinal x0 3 buy)}
  near         (Ordinal x0 2 sell) ~ (Ordinal x0 3 buy)   [arg1 2->3; arg2 sell->buy]
group 3        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000026 ↔ tierA-000027 · control: participant-swap · quality 0.75 · common 6 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second kiln was bought by the pottery studio.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-004 · tierA-000026 ↔ tierA-000028 · control: quantity-change · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second kiln was bought by the pottery studio.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
group 1        anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 3 buy)}
  near         (Ordinal x1 2 buy) ~ (Ordinal x1 3 buy)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-005 · tierA-000029 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The mechanic repaired a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
residue A      {(Agent e0 x0) (Member e0 repair) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000029 ↔ tierA-000034 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic repaired a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-005 · tierA-000030 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The mechanic fixed a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
residue A      {(Agent e0 x0) (Member e0 fix) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000030 ↔ tierA-000034 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic fixed a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  near         (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
group 3        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-005 · tierA-000031 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: The mechanic mended a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
residue A      {(Agent e0 x0) (Member e0 mend) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000031 ↔ tierA-000034 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The mechanic mended a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  near         (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
group 3        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-005 · tierA-000032 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 2 renamings tied

A: A seized gearbox was repaired by the mechanic.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
residue A      {(Agent e0 x0) (Member e0 repair) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000032 ↔ tierA-000034 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A seized gearbox was repaired by the mechanic.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-006 · tierA-000035 ↔ tierA-000039 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The electrician repaired the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Past e0) (Patient e0 x1)
group 1        anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  near         (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
group 2        anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  near         (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
residue A      —
residue B      —
```

### seedA-006 · tierA-000035 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician repaired the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 break)}
  near         (Member e0 repair) ~ (Member e0 break)   [arg1 repair->break]
residue A      —
residue B      —
```

### seedA-006 · tierA-000036 ↔ tierA-000039 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The electrician fixed the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  near         (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
group 2        anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  near         (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
group 3        anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  near         (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
residue A      —
residue B      —
```

### seedA-006 · tierA-000036 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician fixed the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 break)}
  near         (Member e0 fix) ~ (Member e0 break)   [arg1 fix->break]
residue A      —
residue B      —
```

### seedA-006 · tierA-000037 ↔ tierA-000039 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The electrician mended the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  near         (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
group 2        anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  near         (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
group 3        anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  near         (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
residue A      —
residue B      —
```

### seedA-006 · tierA-000037 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The electrician mended the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 break)}
  near         (Member e0 mend) ~ (Member e0 break)   [arg1 mend->break]
residue A      —
residue B      —
```

### seedA-006 · tierA-000038 ↔ tierA-000039 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The yard floodlight was repaired by the electrician.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Past e0) (Patient e0 x1)
group 1        anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  near         (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
group 2        anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  near         (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
residue A      —
residue B      —
```

### seedA-006 · tierA-000038 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The yard floodlight was repaired by the electrician.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 break)}
  near         (Member e0 repair) ~ (Member e0 break)   [arg1 repair->break]
residue A      —
residue B      —
```

### seedA-007 · tierA-000041 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor repairs a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000041 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor repairs a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000042 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor fixes a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000042 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor fixes a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000043 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor mends a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-007 · tierA-000043 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tailor mends a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-008 · tierA-000046 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 4

A: A crew repairs a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000046 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew repairs a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 4

A: A crew fixes a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew fixes a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 4

A: A crew mends a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A crew mends a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
residue A      —
residue B      {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000049 ↔ tierA-000050 · control: negation · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A cracked feed pipe is repaired by a crew.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance feed_pipe pipe) (Member x0 crew) (Member x1 cracked) (Member x1 feed_pipe)
residue A      {(Agent e0 x0) (Member e0 repair) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' repair) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-008 · tierA-000049 ↔ tierA-000051 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A cracked feed pipe is repaired by a crew.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance feed_pipe pipe) (Member e0 repair) (Member x0 crew) (Member x1 cracked) (Member x1 feed_pipe)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Agent e0 x1)}
  near         (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-009 · tierA-000052 ↔ tierA-000055 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A shoreline survey begins at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member e0 begin) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-009 · tierA-000052 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey begins at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  near         (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
residue A      —
residue B      —
```

### seedA-009 · tierA-000053 ↔ tierA-000055 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A shoreline survey starts at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 begin)}
  near         (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-009 · tierA-000053 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey starts at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  near         (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
residue A      —
residue B      —
```

### seedA-009 · tierA-000054 ↔ tierA-000055 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A shoreline survey commences at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 begin)}
  near         (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-009 · tierA-000054 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shoreline survey commences at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
group 1        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  near         (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
residue A      —
residue B      —
```

### seedA-010 · tierA-000057 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing begins on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  near         (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
residue A      —
residue B      —
```

### seedA-010 · tierA-000057 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 0 / 0

A: A hearing begins on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
residue A      {(Member e0 begin) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
residue B      —
```

### seedA-010 · tierA-000058 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing starts on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  near         (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
residue A      —
residue B      —
```

### seedA-010 · tierA-000058 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 0 / 0

A: A hearing starts on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
residue A      {(Member e0 start) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
residue B      —
```

### seedA-010 · tierA-000059 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A hearing commences on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
group 1        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  near         (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
residue A      —
residue B      —
```

### seedA-010 · tierA-000059 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 0 / 0

A: A hearing commences on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
residue A      {(Member e0 commence) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
residue B      —
```

### seedA-011 · tierA-000062 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The dress rehearsal begins after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
residue A      {(Before x0 e0) (Future e0) (Member e0 begin) (Patient e0 x1)}@x0,x1
residue B      {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000062 ↔ tierA-000066 · control: modality-shift · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member e0 begin) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
residue A      —
residue B      —
```

### seedA-011 · tierA-000063 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The dress rehearsal starts after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
residue A      {(Before x0 e0) (Future e0) (Member e0 start) (Patient e0 x1)}@x0,x1
residue B      {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000063 ↔ tierA-000066 · control: modality-shift · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal starts after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
group 2        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 begin)}
  near         (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
residue A      —
residue B      —
```

### seedA-011 · tierA-000064 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The dress rehearsal commences after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
residue A      {(Before x0 e0) (Future e0) (Member e0 commence) (Patient e0 x1)}@x0,x1
residue B      {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000064 ↔ tierA-000066 · control: modality-shift · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The dress rehearsal commences after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
group 2        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 begin)}
  near         (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
residue A      —
residue B      —
```

### seedA-012 · tierA-000067 ↔ tierA-000070 · control: modality-shift · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest begins in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member e0 begin) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
residue A      —
residue B      —
```

### seedA-012 · tierA-000067 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest begins in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  near         (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
residue A      —
residue B      —
```

### seedA-012 · tierA-000068 ↔ tierA-000070 · control: modality-shift · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest starts in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
group 2        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 begin)}
  near         (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
residue A      —
residue B      —
```

### seedA-012 · tierA-000068 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest starts in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  near         (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
residue A      —
residue B      —
```

### seedA-012 · tierA-000069 ↔ tierA-000070 · control: modality-shift · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest commences in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
group 2        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 begin)}
  near         (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
residue A      —
residue B      —
```

### seedA-012 · tierA-000069 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The apple harvest commences in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
group 1        anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  near         (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
residue A      —
residue B      —
```

### seedA-013 · tierA-000072 ↔ tierA-000074 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 5

A: A warden allows visitors on Sundays.
B: A warden forbids visitors on Sundays.

```
renaming a->b  
common         —
residue A      —
residue B      {(Agent e0' x0') (Member e0' forbid) (Member x0' warden) (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-013 · tierA-000072 ↔ tierA-000075 · control: modality-shift · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 6

A: A warden allows visitors on Sundays.
B: A warden might allow visitors on Sundays.

```
renaming a->b  
common         —
residue A      —
residue B      {(Agent e0' x0') (Member e0' allow) (Member x0' warden) (Might e0') (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-013 · tierA-000073 ↔ tierA-000074 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A warden permits visitors on Sundays.
B: A warden forbids visitors on Sundays.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 warden) (Theme e0 visitor) (Time e0 (Weekday sunday))
group 1        anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 forbid)}
  near         (Member e0 permit) ~ (Member e0 forbid)   [arg1 permit->forbid]
residue A      —
residue B      —
```

### seedA-013 · tierA-000073 ↔ tierA-000075 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A warden permits visitors on Sundays.
B: A warden might allow visitors on Sundays.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 warden) (Theme e0 visitor) (Time e0 (Weekday sunday))
group 1        anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 allow)}
  near         (Member e0 permit) ~ (Member e0 allow)   [arg1 permit->allow]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-014 · tierA-000076 ↔ tierA-000078 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A licence allows night deliveries.
B: A licence might allow night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member e0 allow) (Member x0 licence) (Theme e0 night_delivery)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-014 · tierA-000076 ↔ tierA-000079 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A licence allows night deliveries.
B: A licence does not allow night deliveries.

```
renaming a->b  x0->x1
common         (Inheritance night_delivery delivery) (Member x0 licence)
residue A      {(Agent e0 x0) (Member e0 allow) (Theme e0 night_delivery)}@night_delivery,x0
residue B      {(And (Agent x0' x0) (Member x0' allow) (Theme x0' night_delivery)) ~NEG}@night_delivery,x0
```

### seedA-014 · tierA-000077 ↔ tierA-000078 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A licence permits night deliveries.
B: A licence might allow night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member x0 licence) (Theme e0 night_delivery)
group 1        anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 allow)}
  near         (Member e0 permit) ~ (Member e0 allow)   [arg1 permit->allow]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-014 · tierA-000077 ↔ tierA-000079 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A licence permits night deliveries.
B: A licence does not allow night deliveries.

```
renaming a->b  x0->x1
common         (Inheritance night_delivery delivery) (Member x0 licence)
residue A      {(Agent e0 x0) (Member e0 permit) (Theme e0 night_delivery)}@night_delivery,x0
residue B      {(And (Agent x0' x0) (Member x0' allow) (Theme x0' night_delivery)) ~NEG}@night_delivery,x0
```

### seedA-015 · tierA-000080 ↔ tierA-000082 · control: negation · quality 0.33 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: A curator allows photography in the hall.
B: A curator does not allow photography in the hall.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 curator) (Member x1 hall)
residue A      {(Agent e0 x0) (Location e0 x1) (Member e0 allow) (Theme e0 photography)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' allow) (Theme x0' photography)) ~NEG}@x0,x1
```

### seedA-015 · tierA-000080 ↔ tierA-000083 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A curator allows photography in the hall.
B: A curator forbids photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
group 1        anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 forbid)}
  near         (Member e0 allow) ~ (Member e0 forbid)   [arg1 allow->forbid]
residue A      —
residue B      —
```

### seedA-015 · tierA-000081 ↔ tierA-000082 · control: negation · quality 0.33 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: A curator permits photography in the hall.
B: A curator does not allow photography in the hall.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 curator) (Member x1 hall)
residue A      {(Agent e0 x0) (Location e0 x1) (Member e0 permit) (Theme e0 photography)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' allow) (Theme x0' photography)) ~NEG}@x0,x1
```

### seedA-015 · tierA-000081 ↔ tierA-000083 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A curator permits photography in the hall.
B: A curator forbids photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
group 1        anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 forbid)}
  near         (Member e0 permit) ~ (Member e0 forbid)   [arg1 permit->forbid]
residue A      —
residue B      —
```

### seedA-016 · tierA-000084 ↔ tierA-000087 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A recipe requires two eggs.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  near         (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-016 · tierA-000084 ↔ tierA-000088 · control: quantity-change · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recipe requires two eggs.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  near         (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
group 2        anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  near         (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-016 · tierA-000085 ↔ tierA-000087 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A recipe needs two eggs.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
group 1        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-016 · tierA-000085 ↔ tierA-000088 · control: quantity-change · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A recipe needs two eggs.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
group 1        anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  near         (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
group 2        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      —
```

### seedA-016 · tierA-000086 ↔ tierA-000087 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Two eggs are required by a recipe.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member e0 require) (Member x1 recipe) (Theme e0 x0)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-016 · tierA-000086 ↔ tierA-000088 · control: quantity-change · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two eggs are required by a recipe.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 egg) (Holder e0 x1) (Member e0 require) (Member x1 recipe) (Theme e0 x0)
group 1        anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  near         (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
residue A      —
residue B      —
```

### seedA-017 · tierA-000089 ↔ tierA-000092 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A permit requires a countersignature.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Theme e0 x1)
group 1        anchors x1
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)}
  near         (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
residue A      —
residue B      {(GroupOf x1 countersignature)}@x1
```

### seedA-017 · tierA-000089 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A permit requires a countersignature.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
residue A      {(Holder e0 x0) (Member e0 require) (Theme e0 x1)}@x0,x1
residue B      {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-017 · tierA-000090 ↔ tierA-000092 · control: quantity-change · quality 0.50 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A permit needs a countersignature.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member x0 permit) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
group 2        anchors x1
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)}
  near         (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
residue A      —
residue B      {(GroupOf x1 countersignature)}@x1
```

### seedA-017 · tierA-000090 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A permit needs a countersignature.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
residue A      {(Holder e0 x0) (Member e0 need) (Theme e0 x1)}@x0,x1
residue B      {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-017 · tierA-000091 ↔ tierA-000092 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A countersignature is required by a permit.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Theme e0 x1)
group 1        anchors x1
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)}
  near         (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
residue A      —
residue B      {(GroupOf x1 countersignature)}@x1
```

### seedA-017 · tierA-000091 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A countersignature is required by a permit.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
residue A      {(Holder e0 x0) (Member e0 require) (Theme e0 x1)}@x0,x1
residue B      {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-018 · tierA-000094 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A lathe requires monthly servicing.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
residue A      {(Holder e0 x0) (Member e0 require) (Theme e0 monthly_servicing)}@monthly_servicing,x0
residue B      {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000094 ↔ tierA-000098 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A lathe requires monthly servicing.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
group 1        anchors e0 x0
  A            {(Holder e0 x0)}
  B            {(Experiencer e0 x0)}
  near         (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-018 · tierA-000095 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A lathe needs monthly servicing.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
residue A      {(Holder e0 x0) (Member e0 need) (Theme e0 monthly_servicing)}@monthly_servicing,x0
residue B      {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000095 ↔ tierA-000098 · control: modality-shift · quality 0.57 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A lathe needs monthly servicing.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
group 1        anchors e0 x0
  A            {(Holder e0 x0)}
  B            {(Experiencer e0 x0)}
  near         (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
group 2        anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  near         (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-018 · tierA-000096 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: Monthly servicing is required by a lathe.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
residue A      {(Holder e0 x0) (Member e0 require) (Theme e0 monthly_servicing)}@monthly_servicing,x0
residue B      {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000096 ↔ tierA-000098 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Monthly servicing is required by a lathe.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
group 1        anchors e0 x0
  A            {(Holder e0 x0)}
  B            {(Experiencer e0 x0)}
  near         (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-019 · tierA-000099 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A rescue team abandons the search.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  near         (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
residue A      —
residue B      —
```

### seedA-019 · tierA-000099 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A rescue team abandons the search.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
residue A      {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-019 · tierA-000100 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A rescue team gives up the search.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 continue)}
  near         (Member e0 give_up) ~ (Member e0 continue)   [arg1 give_up->continue]
residue A      —
residue B      —
```

### seedA-019 · tierA-000100 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A rescue team gives up the search.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
residue A      {(Agent e0 x0) (Member e0 give_up) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-019 · tierA-000101 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The search is abandoned by a rescue team.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  near         (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
residue A      —
residue B      —
```

### seedA-019 · tierA-000101 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The search is abandoned by a rescue team.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
residue A      {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000104 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A firm abandons its tender.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
residue A      {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000104 ↔ tierA-000108 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A firm abandons its tender.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-020 · tierA-000105 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A firm gives up its tender.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
residue A      {(Agent e0 x0) (Member e0 give_up) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000105 ↔ tierA-000108 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A firm gives up its tender.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  near         (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-020 · tierA-000106 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: Its tender is abandoned by a firm.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
residue A      {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000106 ↔ tierA-000108 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Its tender is abandoned by a firm.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-021 · tierA-000109 ↔ tierA-000112 · control: modality-shift · quality 0.89 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Two climbers abandon the north route.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-021 · tierA-000109 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two climbers abandon the north route.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  near         (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
residue A      —
residue B      —
```

### seedA-021 · tierA-000110 ↔ tierA-000112 · control: modality-shift · quality 0.78 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Two climbers give up the north route.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  near         (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-021 · tierA-000110 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two climbers give up the north route.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 continue)}
  near         (Member e0 give_up) ~ (Member e0 continue)   [arg1 give_up->continue]
residue A      —
residue B      —
```

### seedA-021 · tierA-000111 ↔ tierA-000112 · control: modality-shift · quality 0.89 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The north route is abandoned by two climbers.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-021 · tierA-000111 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The north route is abandoned by two climbers.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  near         (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
residue A      —
residue B      —
```

### seedA-022 · tierA-000114 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A board postpones the vote.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  near         (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
residue A      —
residue B      —
```

### seedA-022 · tierA-000114 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A board postpones the vote.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
residue A      {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-022 · tierA-000115 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A board puts off the vote.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 advance)}
  near         (Member e0 put_off) ~ (Member e0 advance)   [arg1 put_off->advance]
residue A      —
residue B      —
```

### seedA-022 · tierA-000115 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A board puts off the vote.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
residue A      {(Agent e0 x0) (Member e0 put_off) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-022 · tierA-000116 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The vote is postponed by a board.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  near         (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
residue A      —
residue B      —
```

### seedA-022 · tierA-000116 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The vote is postponed by a board.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
residue A      {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000119 ↔ tierA-000121 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A ferry postpones its departure.
B: A ferry does not postpone its departure.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 ferry) (Member x1 departure) (Possession x1 x0)
residue A      {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000119 ↔ tierA-000122 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A ferry postpones its departure.
B: A ferry might postpone its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-023 · tierA-000120 ↔ tierA-000121 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A ferry puts off its departure.
B: A ferry does not postpone its departure.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 ferry) (Member x1 departure) (Possession x1 x0)
residue A      {(Agent e0 x0) (Member e0 put_off) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000120 ↔ tierA-000122 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A ferry puts off its departure.
B: A ferry might postpone its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  near         (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-024 · tierA-000123 ↔ tierA-000126 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A club postpones the tournament.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-024 · tierA-000123 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A club postpones the tournament.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  near         (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
residue A      —
residue B      —
```

### seedA-024 · tierA-000124 ↔ tierA-000126 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A club puts off the tournament.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  near         (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-024 · tierA-000124 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A club puts off the tournament.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 advance)}
  near         (Member e0 put_off) ~ (Member e0 advance)   [arg1 put_off->advance]
residue A      —
residue B      —
```

### seedA-024 · tierA-000125 ↔ tierA-000126 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The tournament is postponed by a club.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-024 · tierA-000125 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The tournament is postponed by a club.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  near         (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
residue A      —
residue B      —
```

### seedA-025 · tierA-000128 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An auditor discovers an error in the ledger.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
residue A      {(Experiencer e0 x0) (Member e0 discover) (Stimulus e0 e1)}@e1,x0
residue B      {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000128 ↔ tierA-000132 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An auditor discovers an error in the ledger.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member x1 ledger) (Stimulus e0 e1)
group 1        anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  near         (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
group 2        anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  near         (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
residue A      —
residue B      —
```

### seedA-025 · tierA-000129 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An auditor finds out an error in the ledger.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
residue A      {(Experiencer e0 x0) (Member e0 find_out) (Stimulus e0 e1)}@e1,x0
residue B      {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000129 ↔ tierA-000132 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An auditor finds out an error in the ledger.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member x1 ledger) (Stimulus e0 e1)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
group 2        anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  near         (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
group 3        anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  near         (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
residue A      —
residue B      —
```

### seedA-025 · tierA-000130 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An error in the ledger is discovered by an auditor.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
residue A      {(Experiencer e0 x0) (Member e0 discover) (Stimulus e0 e1)}@e1,x0
residue B      {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000130 ↔ tierA-000132 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An error in the ledger is discovered by an auditor.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member x1 ledger) (Stimulus e0 e1)
group 1        anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  near         (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
group 2        anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  near         (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
residue A      —
residue B      —
```

### seedA-026 · tierA-000133 ↔ tierA-000136 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A diver discovers a wreck off the point.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x1 point) (Theme e0 x2)
group 1        anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  near         (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
group 2        anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  near         (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
residue A      —
residue B      —
```

### seedA-026 · tierA-000133 ↔ tierA-000137 · control: modality-shift · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A diver discovers a wreck off the point.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-026 · tierA-000134 ↔ tierA-000136 · control: participant-swap · quality 0.57 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A diver finds out a wreck off the point.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x1 point) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
group 2        anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  near         (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
group 3        anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  near         (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
residue A      —
residue B      —
```

### seedA-026 · tierA-000134 ↔ tierA-000137 · control: modality-shift · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A diver finds out a wreck off the point.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-026 · tierA-000135 ↔ tierA-000136 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A wreck off the point is discovered by a diver.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x1 point) (Theme e0 x2)
group 1        anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  near         (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
group 2        anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  near         (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
residue A      —
residue B      —
```

### seedA-026 · tierA-000135 ↔ tierA-000137 · control: modality-shift · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A wreck off the point is discovered by a diver.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-027 · tierA-000138 ↔ tierA-000141 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An intern discovers the missing file.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-027 · tierA-000138 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An intern discovers the missing file.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
residue A      {(Agent e0 x0) (Member e0 discover) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-027 · tierA-000139 ↔ tierA-000141 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An intern finds out the missing file.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  near         (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-027 · tierA-000139 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An intern finds out the missing file.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
residue A      {(Agent e0 x0) (Member e0 find_out) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-027 · tierA-000140 ↔ tierA-000141 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The missing file is discovered by an intern.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-027 · tierA-000140 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The missing file is discovered by an intern.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
residue A      {(Agent e0 x0) (Member e0 discover) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000143 ↔ tierA-000146 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An airline cancels the evening flight.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 confirm)}
  near         (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
residue A      —
residue B      —
```

### seedA-028 · tierA-000143 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An airline cancels the evening flight.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
residue A      {(Agent e0 x0) (Member e0 cancel) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000144 ↔ tierA-000146 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An airline calls off the evening flight.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 confirm)}
  near         (Member e0 call_off) ~ (Member e0 confirm)   [arg1 call_off->confirm]
residue A      —
residue B      —
```

### seedA-028 · tierA-000144 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An airline calls off the evening flight.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
residue A      {(Agent e0 x0) (Member e0 call_off) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000145 ↔ tierA-000146 · control: antonym · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The evening flight is canceled by an airline.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 confirm)}
  near         (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-028 · tierA-000145 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The evening flight is canceled by an airline.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
residue A      {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000148 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A council cancels the summer fair.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
residue A      {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000148 ↔ tierA-000152 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A council cancels the summer fair.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-029 · tierA-000149 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A council calls off the summer fair.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
residue A      {(Agent e0 x0) (Member e0 call_off) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000149 ↔ tierA-000152 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A council calls off the summer fair.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  near         (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-029 · tierA-000150 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The summer fair is canceled by a council.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
residue A      {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000150 ↔ tierA-000152 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The summer fair is canceled by a council.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-030 · tierA-000153 ↔ tierA-000156 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A tutor cancels the afternoon session.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-030 · tierA-000153 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tutor cancels the afternoon session.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 confirm)}
  near         (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-030 · tierA-000154 ↔ tierA-000156 · control: modality-shift · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A tutor calls off the afternoon session.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  near         (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-030 · tierA-000154 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A tutor calls off the afternoon session.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
group 1        anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 confirm)}
  near         (Member e0 call_off) ~ (Member e0 confirm)   [arg1 call_off->confirm]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-030 · tierA-000155 ↔ tierA-000156 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The afternoon session is canceled by a tutor.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-030 · tierA-000155 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The afternoon session is canceled by a tutor.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
group 1        anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 confirm)}
  near         (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-031 · tierA-000158 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An editor rejects a manuscript.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  near         (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
residue A      —
residue B      —
```

### seedA-031 · tierA-000158 ↔ tierA-000162 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: An editor rejects a manuscript.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  near         (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
group 2        anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  near         (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
residue A      —
residue B      —
```

### seedA-031 · tierA-000159 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An editor turns down a manuscript.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 accept)}
  near         (Member e0 turn_down) ~ (Member e0 accept)   [arg1 turn_down->accept]
residue A      —
residue B      —
```

### seedA-031 · tierA-000159 ↔ tierA-000162 · control: participant-swap · quality 0.40 · common 2 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: An editor turns down a manuscript.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  near         (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
group 2        anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  near         (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
group 3        anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  near         (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
residue A      —
residue B      —
```

### seedA-031 · tierA-000160 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A manuscript is rejected by an editor.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  near         (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
residue A      —
residue B      —
```

### seedA-031 · tierA-000160 ↔ tierA-000162 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A manuscript is rejected by an editor.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  near         (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
group 2        anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  near         (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
residue A      —
residue B      —
```

### seedA-032 · tierA-000163 ↔ tierA-000166 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A bank rejects the loan application.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Theme e0 x1)
group 1        anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  near         (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
group 2        anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  near         (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
residue A      —
residue B      —
```

### seedA-032 · tierA-000163 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A bank rejects the loan application.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
residue A      {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-032 · tierA-000164 ↔ tierA-000166 · control: participant-swap · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A bank turns down the loan application.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  near         (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
group 2        anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  near         (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
group 3        anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  near         (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
residue A      —
residue B      —
```

### seedA-032 · tierA-000164 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A bank turns down the loan application.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
residue A      {(Agent e0 x0) (Member e0 turn_down) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-032 · tierA-000165 ↔ tierA-000166 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The loan application is rejected by a bank.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Theme e0 x1)
group 1        anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  near         (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
group 2        anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  near         (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
residue A      —
residue B      —
```

### seedA-032 · tierA-000165 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The loan application is rejected by a bank.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
residue A      {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000168 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A panel rejects the proposal.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
residue A      {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000168 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A panel rejects the proposal.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  near         (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
residue A      —
residue B      —
```

### seedA-033 · tierA-000169 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A panel turns down the proposal.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
residue A      {(Agent e0 x0) (Member e0 turn_down) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000169 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A panel turns down the proposal.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 accept)}
  near         (Member e0 turn_down) ~ (Member e0 accept)   [arg1 turn_down->accept]
residue A      —
residue B      —
```

### seedA-033 · tierA-000170 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The proposal is rejected by a panel.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
residue A      {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000170 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The proposal is rejected by a panel.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  near         (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
residue A      —
residue B      —
```

### seedA-034 · tierA-000173 ↔ tierA-000175 · control: manner-near-miss · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A shepherd walks along the ridge.
B: A shepherd sprints along the ridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 shepherd) (Member x1 ridge)
group 1        anchors e0
  A            {(Member e0 walk)}
  B            {(Member e0 sprint)}
  near         (Member e0 walk) ~ (Member e0 sprint)   [arg1 walk->sprint]
residue A      —
residue B      —
```

### seedA-034 · tierA-000173 ↔ tierA-000176 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A shepherd walks along the ridge.
B: A shepherd does not walk along the ridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 shepherd) (Member x1 ridge)
residue A      {(Agent e0 x0) (Location e0 x1) (Member e0 walk)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-034 · tierA-000174 ↔ tierA-000175 · control: manner-near-miss · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A shepherd takes a walk along the ridge.
B: A shepherd sprints along the ridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 shepherd) (Member x1 ridge)
group 1        anchors e0 x1
  A            {(Location e1 x1) (Member e1 walk) (Theme e0 e1)}
  B            {(Location e0 x1)}
  partial      (Location e1 x1) ~ (Location e0 x1)   [arg0 e1->e0]
  A only       (Member e1 walk) (Theme e0 e1)
group 2        anchors e0
  A            {(Member e0 take)}
  B            {(Member e0 sprint)}
  near         (Member e0 take) ~ (Member e0 sprint)   [arg1 take->sprint]
residue A      —
residue B      —
```

### seedA-034 · tierA-000174 ↔ tierA-000176 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A shepherd takes a walk along the ridge.
B: A shepherd does not walk along the ridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 shepherd) (Member x1 ridge)
residue A      {(Agent e0 x0) (Location e1 x1) (Member e0 take) (Member e1 walk) (Theme e0 e1)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000177 ↔ tierA-000179 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A nurse walks through the ward.
B: A nurse does not walk through the ward.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 nurse) (Member x1 ward)
residue A      {(Agent e0 x0) (Location e0 x1) (Member e0 walk)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000177 ↔ tierA-000180 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A nurse walks through the ward.
B: The ward walks through a nurse.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member e0 walk)
group 1        anchors x0
  A            {(Member x0 nurse)}
  B            {(Member x0 ward)}
  near         (Member x0 nurse) ~ (Member x0 ward)   [arg1 nurse->ward]
group 2        anchors x1
  A            {(Member x1 ward)}
  B            {(Member x1 nurse)}
  near         (Member x1 ward) ~ (Member x1 nurse)   [arg1 ward->nurse]
residue A      —
residue B      —
```

### seedA-035 · tierA-000178 ↔ tierA-000179 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A nurse takes a walk through the ward.
B: A nurse does not walk through the ward.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 nurse) (Member x1 ward)
residue A      {(Agent e0 x0) (Location e1 x1) (Member e0 take) (Member e1 walk) (Theme e0 e1)}@x0,x1
residue B      {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000178 ↔ tierA-000180 · control: participant-swap · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A nurse takes a walk through the ward.
B: The ward walks through a nurse.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 walk) (Member x0 nurse) (Member x1 ward)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 take) (Theme e0 e1)}
  B            {(Location e1 x0)}
  partial      (Agent e0 x0) ~ (Location e1 x0)   [head Agent->Location; arg0 e0->e1]
  A only       (Member e0 take) (Theme e0 e1)
group 2        anchors e1 x1
  A            {(Location e1 x1)}
  B            {(Agent e1 x1)}
  near         (Location e1 x1) ~ (Agent e1 x1)   [head Location->Agent]
residue A      —
residue B      —
```

### seedA-036 · tierA-000181 ↔ tierA-000183 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two children walk to the pier.
B: The pier walks to two children.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member e0 walk) (Member x1 pier)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Goal e0 x0)}
  near         (Agent e0 x0) ~ (Goal e0 x0)   [head Agent->Goal]
group 2        anchors e0 x1
  A            {(Goal e0 x1)}
  B            {(Agent e0 x1)}
  near         (Goal e0 x1) ~ (Agent e0 x1)   [head Goal->Agent]
residue A      —
residue B      —
```

### seedA-036 · tierA-000181 ↔ tierA-000184 · control: manner-near-miss · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two children walk to the pier.
B: Two children stroll to the pier.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (Goal e0 x1) (GroupOf x0 child) (Member x1 pier)
group 1        anchors e0
  A            {(Member e0 walk)}
  B            {(Member e0 stroll)}
  near         (Member e0 walk) ~ (Member e0 stroll)   [arg1 walk->stroll]
residue A      —
residue B      —
```

### seedA-036 · tierA-000182 ↔ tierA-000183 · control: participant-swap · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Two children take a walk to the pier.
B: The pier walks to two children.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member e1 walk) (Member x1 pier)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 take) (Patient e0 e1)}
  B            {(Goal e1 x0)}
  partial      (Agent e0 x0) ~ (Goal e1 x0)   [head Agent->Goal; arg0 e0->e1]
  A only       (Member e0 take) (Patient e0 e1)
group 2        anchors e1 x1
  A            {(Goal e1 x1)}
  B            {(Agent e1 x1)}
  near         (Goal e1 x1) ~ (Agent e1 x1)   [head Goal->Agent]
residue A      —
residue B      —
```

### seedA-036 · tierA-000182 ↔ tierA-000184 · control: manner-near-miss · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: Two children take a walk to the pier.
B: Two children stroll to the pier.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 child) (Member x1 pier)
group 1        anchors e0 x1
  A            {(Goal e1 x1) (Member e1 walk) (Patient e0 e1)}
  B            {(Goal e0 x1)}
  partial      (Goal e1 x1) ~ (Goal e0 x1)   [arg0 e1->e0]
  A only       (Member e1 walk) (Patient e0 e1)
group 2        anchors e0
  A            {(Member e0 take)}
  B            {(Member e0 stroll)}
  near         (Member e0 take) ~ (Member e0 stroll)   [arg1 take->stroll]
residue A      —
residue B      —
```

### seedA-037 · tierA-000185 ↔ tierA-000188 · control: negation · quality 0.17 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
residue A      {(Agent e0 x0) (Member e0 decide) (Member x1 new) (Member x1 roof) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000185 ↔ tierA-000189 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A committee decides on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 committee) (Member x1 new) (Member x1 roof) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-037 · tierA-000186 ↔ tierA-000188 · control: negation · quality 0.12 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 7 atom(s), B 1 / 1 · 2 renamings tied

A: A committee makes a decision on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
residue A      {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Member x1 new) (Member x1 roof) (Patient e0 e1) (Theme e1 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000186 ↔ tierA-000189 · control: modality-shift · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A committee makes a decision on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 decide)}
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e1 x1) ~ (Theme e0 x1)   [arg0 e1->e0]
  A only       (Member e1 decision) (Patient e0 e1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-037 · tierA-000187 ↔ tierA-000188 · control: negation · quality 0.12 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 7 atom(s), B 1 / 1 · 2 renamings tied

A: A committee reaches a decision on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
residue A      {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Member x1 new) (Member x1 roof) (Theme e0 e1) (Theme e1 x1)}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000187 ↔ tierA-000189 · control: modality-shift · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A committee reaches a decision on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
group 1        anchors e0
  A            {(Member e0 reach)}
  B            {(Member e0 decide)}
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-038 · tierA-000190 ↔ tierA-000194 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A judge decides the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-038 · tierA-000190 ↔ tierA-000195 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge decides the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 judge)}
  B            {(Member x0 case)}
  near         (Member x0 judge) ~ (Member x0 case)   [arg1 judge->case]
group 2        anchors x1
  A            {(Member x1 case)}
  B            {(Member x1 judge)}
  near         (Member x1 case) ~ (Member x1 judge)   [arg1 case->judge]
residue A      —
residue B      —
```

### seedA-038 · tierA-000191 ↔ tierA-000194 · control: modality-shift · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A judge makes a decision on the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 decide)}
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e1 x1) ~ (Theme e0 x1)   [arg0 e1->e0]
  A only       (Member e1 decision) (Patient e0 e1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-038 · tierA-000191 ↔ tierA-000195 · control: participant-swap · quality 0.29 · common 2 · aligned 2 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge makes a decision on the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 judge) (Member x1 case)
group 1        anchors x0 x1
  A            {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Agent e0 x1) (Member e0 decide) (Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  partial      (Patient e0 e1) ~ (Agent e0 x1)   [head Patient->Agent; arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      —
```

### seedA-038 · tierA-000192 ↔ tierA-000194 · control: modality-shift · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A judge reaches a decision on the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
group 1        anchors e0
  A            {(Member e0 reach)}
  B            {(Member e0 decide)}
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-038 · tierA-000192 ↔ tierA-000195 · control: participant-swap · quality 0.29 · common 2 · aligned 2 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A judge reaches a decision on the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 judge) (Member x1 case)
group 1        anchors x0 x1
  A            {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Agent e0 x1) (Member e0 decide) (Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  partial      (Theme e0 e1) ~ (Agent e0 x1)   [head Theme->Agent; arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      —
```

### seedA-038 · tierA-000193 ↔ tierA-000194 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The case is decided by a judge.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-038 · tierA-000193 ↔ tierA-000195 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The case is decided by a judge.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 judge)}
  B            {(Member x0 case)}
  near         (Member x0 judge) ~ (Member x0 case)   [arg1 judge->case]
group 2        anchors x1
  A            {(Member x1 case)}
  B            {(Member x1 judge)}
  near         (Member x1 case) ~ (Member x1 judge)   [arg1 case->judge]
residue A      —
residue B      —
```

### seedA-039 · tierA-000196 ↔ tierA-000199 · control: participant-swap · quality 0.25 · common 1 · aligned 1 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A family decides to move north.
B: North decides to move a family.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member e0 decide)
group 1        anchors e0
  A            {(Agent e0 x0) (Member x0 family) (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e0 north)} {(Theme e0 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  partial      (Agent e0 x0) ~ (Agent e0 north)   [arg1 x0->north]
  near         (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e0 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Member x0 family)
residue A      —
residue B      —
```

### seedA-039 · tierA-000196 ↔ tierA-000200 · control: negation · quality 0.25 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1 · 2 renamings tied

A: A family decides to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
residue A      {(Agent e0 x0) (Member e0 decide) (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-039 · tierA-000197 ↔ tierA-000199 · control: participant-swap · quality 0.00 · common 0 · aligned 2 near + 0 partial · leftover 5 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A family makes a decision to move north.
B: North decides to move a family.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         —
group 1        anchors —
  A            {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Member x0 family) (Patient e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e1 north) (Member e1 decide) (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  near         (Member e1 decision) ~ (Member e1 decide)   [arg1 decision->decide]
  near         (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Agent e0 x0) (Member e0 make) (Member x0 family) (Patient e0 e1)
  B only       (Agent e1 north)
residue A      —
residue B      —
```

### seedA-039 · tierA-000197 ↔ tierA-000200 · control: negation · quality 0.17 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1 · 2 renamings tied

A: A family makes a decision to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
residue A      {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-039 · tierA-000198 ↔ tierA-000199 · control: participant-swap · quality 0.00 · common 0 · aligned 2 near + 0 partial · leftover 5 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A family reaches a decision to move north.
B: North decides to move a family.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         —
group 1        anchors —
  A            {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Member x0 family) (Theme e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e1 north) (Member e1 decide) (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  near         (Member e1 decision) ~ (Member e1 decide)   [arg1 decision->decide]
  near         (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Agent e0 x0) (Member e0 reach) (Member x0 family) (Theme e0 e1)
  B only       (Agent e1 north)
residue A      —
residue B      —
```

### seedA-039 · tierA-000198 ↔ tierA-000200 · control: negation · quality 0.17 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1 · 2 renamings tied

A: A family reaches a decision to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
residue A      {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
residue B      {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-040 · tierA-000201 ↔ tierA-000205 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A board decides next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
residue A      {(Agent e0 x0) (Member e0 decide) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000201 ↔ tierA-000206 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A board decides next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-040 · tierA-000202 ↔ tierA-000205 · control: negation · quality 0.38 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A board makes a decision on next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
residue A      {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000202 ↔ tierA-000206 · control: modality-shift · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A board makes a decision on next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 make)}
  B            {(Member e0 decide)}
  near         (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e1 x1) ~ (Theme e0 x1)   [arg0 e1->e0]
  A only       (Member e1 decision) (Patient e0 e1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-040 · tierA-000203 ↔ tierA-000205 · control: negation · quality 0.38 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A board reaches a decision on next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
residue A      {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000203 ↔ tierA-000206 · control: modality-shift · quality 0.50 · common 4 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: A board reaches a decision on next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
group 1        anchors e0
  A            {(Member e0 reach)}
  B            {(Member e0 decide)}
  near         (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
group 2        anchors e0 x1
  A            {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 decision) (Theme e1 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-040 · tierA-000204 ↔ tierA-000205 · control: negation · quality 0.50 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: Next year's budget is decided by a board.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
residue A      {(Agent e0 x0) (Member e0 decide) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000204 ↔ tierA-000206 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Next year's budget is decided by a board.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-041 · tierA-000207 ↔ tierA-000210 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A clerk answers the query.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  near         (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
group 2        anchors x1
  A            {(Member x1 query)}
  B            {(Member x1 clerk)}
  near         (Member x1 query) ~ (Member x1 clerk)   [arg1 query->clerk]
residue A      —
residue B      —
```

### seedA-041 · tierA-000207 ↔ tierA-000211 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A clerk answers the query.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-041 · tierA-000208 ↔ tierA-000210 · control: participant-swap · quality 0.29 · common 2 · aligned 3 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0 · 3 renamings tied

A: A clerk gives an answer to the query.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x2->x1
common         (Agent e0 x0) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  near         (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
group 3        anchors x2
  A            {(Member x2 answer)}
  B            {(Member x2 clerk)}
  near         (Member x2 answer) ~ (Member x2 clerk)   [arg1 answer->clerk]
residue A      {(Member x1 query) (Recipient e0 x1)}@e0
residue B      —
```

### seedA-041 · tierA-000208 ↔ tierA-000211 · control: modality-shift · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 1 · 2 renamings tied

A: A clerk gives an answer to the query.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
residue A      {(Member x2 answer) (Theme e0 x2)}@e0
residue B      {(Might e0)}@e0
```

### seedA-041 · tierA-000209 ↔ tierA-000210 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The query is answered by a clerk.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  near         (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
group 2        anchors x1
  A            {(Member x1 query)}
  B            {(Member x1 clerk)}
  near         (Member x1 query) ~ (Member x1 clerk)   [arg1 query->clerk]
residue A      —
residue B      —
```

### seedA-041 · tierA-000209 ↔ tierA-000211 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The query is answered by a clerk.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-042 · tierA-000212 ↔ tierA-000215 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A pilot answers the tower.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-042 · tierA-000212 ↔ tierA-000216 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A pilot answers the tower.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 pilot) (Member x1 tower)
residue A      {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-042 · tierA-000213 ↔ tierA-000215 · control: modality-shift · quality 0.43 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 1 · 2 renamings tied

A: A pilot gives an answer to the tower.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors e0 x1
  A            {(Recipient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
residue A      {(Member x2 answer) (Theme e0 x2)}@e0
residue B      {(Might e0)}@e0
```

### seedA-042 · tierA-000213 ↔ tierA-000216 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A pilot gives an answer to the tower.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 pilot) (Member x1 tower)
residue A      {(Agent e0 x0) (Member e0 give) (Member x2 answer) (Recipient e0 x1) (Theme e0 x2)}@x0,x1
residue B      {(And (Agent x2 x0) (Member x2 answer) (Theme x2 x1)) ~NEG}@x0,x1
```

### seedA-042 · tierA-000214 ↔ tierA-000215 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The tower is answered by a pilot.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-042 · tierA-000214 ↔ tierA-000216 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The tower is answered by a pilot.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 pilot) (Member x1 tower)
residue A      {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000217 ↔ tierA-000220 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A vet answers the caller.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 vet) (Member x1 caller)
residue A      {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000217 ↔ tierA-000221 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A vet answers the caller.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  near         (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
group 2        anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 vet)}
  near         (Member x1 caller) ~ (Member x1 vet)   [arg1 caller->vet]
residue A      —
residue B      —
```

### seedA-043 · tierA-000218 ↔ tierA-000220 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A vet gives an answer to the caller.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x0 x2->x2
common         (Member x0 vet) (Member x2 caller)
residue A      {(Agent e0 x0) (Member e0 give) (Member x1 answer) (Recipient e0 x2) (Theme e0 x1)}@x0,x2
residue B      {(And (Agent x1 x0) (Member x1 answer) (Theme x1 x2)) ~NEG}@x0,x2
```

### seedA-043 · tierA-000218 ↔ tierA-000221 · control: participant-swap · quality 0.29 · common 2 · aligned 3 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0 · 3 renamings tied

A: A vet gives an answer to the caller.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 answer)}
  near         (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
group 2        anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  near         (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
group 3        anchors x1
  A            {(Member x1 answer)}
  B            {(Member x1 vet)}
  near         (Member x1 answer) ~ (Member x1 vet)   [arg1 answer->vet]
residue A      {(Member x2 caller) (Recipient e0 x2)}@e0
residue B      —
```

### seedA-043 · tierA-000219 ↔ tierA-000220 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The caller is answered by a vet.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 vet) (Member x1 caller)
residue A      {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000219 ↔ tierA-000221 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The caller is answered by a vet.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  near         (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
group 2        anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 vet)}
  near         (Member x1 caller) ~ (Member x1 vet)   [arg1 caller->vet]
residue A      —
residue B      —
```

### seedA-044 · tierA-000222 ↔ tierA-000225 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A storm destroys the greenhouse.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
residue A      {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000222 ↔ tierA-000226 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A storm destroys the greenhouse.
B: The greenhouse destroys a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 storm)}
  B            {(Member x0 greenhouse)}
  near         (Member x0 storm) ~ (Member x0 greenhouse)   [arg1 storm->greenhouse]
group 2        anchors x1
  A            {(Member x1 greenhouse)}
  B            {(Member x1 storm)}
  near         (Member x1 greenhouse) ~ (Member x1 storm)   [arg1 greenhouse->storm]
residue A      —
residue B      —
```

### seedA-044 · tierA-000223 ↔ tierA-000225 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A storm causes the destruction of the greenhouse.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
residue A      {(Agent e0 x0) (Member e0 cause) (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000223 ↔ tierA-000226 · control: participant-swap · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A storm causes the destruction of the greenhouse.
B: The greenhouse destroys a storm.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 destroy) (Member x0 storm) (Member x1 greenhouse)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}
  B            {(Patient e1 x0)}
  partial      (Agent e0 x0) ~ (Patient e1 x0)   [head Agent->Patient; arg0 e0->e1]
  A only       (Member e0 cause) (Theme e0 e1)
group 2        anchors e1 x1
  A            {(Patient e1 x1)}
  B            {(Agent e1 x1)}
  near         (Patient e1 x1) ~ (Agent e1 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-044 · tierA-000224 ↔ tierA-000225 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The greenhouse is destroyed by a storm.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
residue A      {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000224 ↔ tierA-000226 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The greenhouse is destroyed by a storm.
B: The greenhouse destroys a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 storm)}
  B            {(Member x0 greenhouse)}
  near         (Member x0 storm) ~ (Member x0 greenhouse)   [arg1 storm->greenhouse]
group 2        anchors x1
  A            {(Member x1 greenhouse)}
  B            {(Member x1 storm)}
  near         (Member x1 greenhouse) ~ (Member x1 storm)   [arg1 greenhouse->storm]
residue A      —
residue B      —
```

### seedA-045 · tierA-000227 ↔ tierA-000230 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A fire destroys the archive.
B: The archive destroys a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 fire)}
  B            {(Member x0 archive)}
  near         (Member x0 fire) ~ (Member x0 archive)   [arg1 fire->archive]
group 2        anchors x1
  A            {(Member x1 archive)}
  B            {(Member x1 fire)}
  near         (Member x1 archive) ~ (Member x1 fire)   [arg1 archive->fire]
residue A      —
residue B      —
```

### seedA-045 · tierA-000227 ↔ tierA-000231 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A fire destroys the archive.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
group 1        anchors e0
  A            {(Member e0 destroy)}
  B            {(Member e0 save)}
  near         (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-045 · tierA-000228 ↔ tierA-000230 · control: participant-swap · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A fire causes the destruction of the archive.
B: The archive destroys a fire.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 destroy) (Member x0 fire) (Member x1 archive)
group 1        anchors e1 x0
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}
  B            {(Patient e1 x0)}
  partial      (Agent e0 x0) ~ (Patient e1 x0)   [head Agent->Patient; arg0 e0->e1]
  A only       (Member e0 cause) (Theme e0 e1)
group 2        anchors e1 x1
  A            {(Patient e1 x1)}
  B            {(Agent e1 x1)}
  near         (Patient e1 x1) ~ (Agent e1 x1)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-045 · tierA-000228 ↔ tierA-000231 · control: antonym · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A fire causes the destruction of the archive.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
group 1        anchors e0
  A            {(Member e0 cause)}
  B            {(Member e0 save)}
  near         (Member e0 cause) ~ (Member e0 save)   [arg1 cause->save]
group 2        anchors e0 x1
  A            {(Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 destroy) (Patient e1 x1)
residue A      —
residue B      —
```

### seedA-045 · tierA-000229 ↔ tierA-000230 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The archive is destroyed by a fire.
B: The archive destroys a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 fire)}
  B            {(Member x0 archive)}
  near         (Member x0 fire) ~ (Member x0 archive)   [arg1 fire->archive]
group 2        anchors x1
  A            {(Member x1 archive)}
  B            {(Member x1 fire)}
  near         (Member x1 archive) ~ (Member x1 fire)   [arg1 archive->fire]
residue A      —
residue B      —
```

### seedA-045 · tierA-000229 ↔ tierA-000231 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The archive is destroyed by a fire.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
group 1        anchors e0
  A            {(Member e0 destroy)}
  B            {(Member e0 save)}
  near         (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-046 · tierA-000232 ↔ tierA-000235 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A flood destroys the footbridge.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
group 1        anchors e0
  A            {(Member e0 destroy)}
  B            {(Member e0 save)}
  near         (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-046 · tierA-000232 ↔ tierA-000236 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A flood destroys the footbridge.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
residue A      {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-046 · tierA-000233 ↔ tierA-000235 · control: antonym · quality 0.43 · common 3 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A flood causes the destruction of the footbridge.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
group 1        anchors e0
  A            {(Member e0 cause)}
  B            {(Member e0 save)}
  near         (Member e0 cause) ~ (Member e0 save)   [arg1 cause->save]
group 2        anchors e0 x1
  A            {(Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}
  B            {(Theme e0 x1)}
  partial      (Theme e0 e1) ~ (Theme e0 x1)   [arg1 e1->x1]
  A only       (Member e1 destroy) (Patient e1 x1)
residue A      —
residue B      —
```

### seedA-046 · tierA-000233 ↔ tierA-000236 · control: negation · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 5 atom(s), B 1 / 1

A: A flood causes the destruction of the footbridge.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
residue A      {(Agent e0 x0) (Member e0 cause) (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-046 · tierA-000234 ↔ tierA-000235 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The footbridge is destroyed by a flood.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
group 1        anchors e0
  A            {(Member e0 destroy)}
  B            {(Member e0 save)}
  near         (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### seedA-046 · tierA-000234 ↔ tierA-000236 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The footbridge is destroyed by a flood.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
residue A      {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-047 · tierA-000237 ↔ tierA-000239 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The freight arrives at noon.
B: The freight does not arrive at noon.

```
renaming a->b  x0->x1
common         (Member x0 freight)
residue A      {(Agent e0 x0) (Future e0) (Member e0 arrive) (Time e0 (Hour 12))}@x0
residue B      {(And (Agent x0' x0) (Future x0') (Member x0' arrive) (Time x0' (Hour 12))) ~NEG}@x0
```

### seedA-047 · tierA-000237 ↔ tierA-000240 · control: modality-shift · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The freight arrives at noon.
B: The freight might arrive at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
residue A      —
residue B      —
```

### seedA-047 · tierA-000238 ↔ tierA-000239 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The arrival of the freight is at noon.
B: The freight does not arrive at noon.

```
renaming a->b  x0->x1
common         (Member x0 freight)
residue A      {(Agent e0 x0) (Future e0) (Member e0 arrive) (Time e0 (Hour 12))}@x0
residue B      {(And (Agent x0' x0) (Future x0') (Member x0' arrive) (Time x0' (Hour 12))) ~NEG}@x0
```

### seedA-047 · tierA-000238 ↔ tierA-000240 · control: modality-shift · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The arrival of the freight is at noon.
B: The freight might arrive at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
residue A      —
residue B      —
```

### seedA-048 · tierA-000241 ↔ tierA-000243 · control: modality-shift · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A delegation arrives on Thursday.
B: A delegation might arrive on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 delegation) (Time e0 (Weekday thursday))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
residue A      —
residue B      —
```

### seedA-048 · tierA-000241 ↔ tierA-000244 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A delegation arrives on Thursday.
B: A delegation departs on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
group 1        anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 depart)}
  near         (Member e0 arrive) ~ (Member e0 depart)   [arg1 arrive->depart]
residue A      —
residue B      —
```

### seedA-048 · tierA-000242 ↔ tierA-000243 · control: modality-shift · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The arrival of a delegation is on Thursday.
B: A delegation might arrive on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 delegation) (Time e0 (Weekday thursday))
group 1        anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  near         (Future e0) ~ (Might e0)   [head Future->Might]
group 2        anchors e0
  A            {(Member e0 arrival)}
  B            {(Member e0 arrive)}
  near         (Member e0 arrival) ~ (Member e0 arrive)   [arg1 arrival->arrive]
residue A      —
residue B      —
```

### seedA-048 · tierA-000242 ↔ tierA-000244 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The arrival of a delegation is on Thursday.
B: A delegation departs on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
group 1        anchors e0
  A            {(Member e0 arrival)}
  B            {(Member e0 depart)}
  near         (Member e0 arrival) ~ (Member e0 depart)   [arg1 arrival->depart]
residue A      —
residue B      —
```

### seedA-049 · tierA-000245 ↔ tierA-000247 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The soil samples arrive by post.
B: The soil samples depart by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
group 1        anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 depart)}
  near         (Member e0 arrive) ~ (Member e0 depart)   [arg1 arrive->depart]
residue A      —
residue B      —
```

### seedA-049 · tierA-000245 ↔ tierA-000248 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 0 / 0

A: The soil samples arrive by post.
B: The soil samples do not arrive by post.

```
renaming a->b  x0->x0
common         (GroupOf x0 soil_sample) (Inheritance soil_sample sample)
residue A      {(Agent e0 x0) (Instrument e0 post) (Member e0 arrive)}@x0
residue B      —
```

### seedA-049 · tierA-000246 ↔ tierA-000247 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The soil samples' arrival is by post.
B: The soil samples depart by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
group 1        anchors e0
  A            {(Member e0 arrival)}
  B            {(Member e0 depart)}
  near         (Member e0 arrival) ~ (Member e0 depart)   [arg1 arrival->depart]
residue A      —
residue B      —
```

### seedA-049 · tierA-000246 ↔ tierA-000248 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 0 / 0

A: The soil samples' arrival is by post.
B: The soil samples do not arrive by post.

```
renaming a->b  x0->x0
common         (GroupOf x0 soil_sample) (Inheritance soil_sample sample)
residue A      {(Agent e0 x0) (Instrument e0 post) (Member e0 arrival)}@x0
residue B      —
```

### seedA-050 · tierA-000249 ↔ tierA-000251 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An old mare dies during the winter.
B: An old mare survives during the winter.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-050 · tierA-000249 ↔ tierA-000252 · control: modality-shift · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An old mare dies during the winter.
B: An old mare might die during the winter.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-050 · tierA-000250 ↔ tierA-000251 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An old mare kicks the bucket during the winter.
B: An old mare survives during the winter.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-050 · tierA-000250 ↔ tierA-000252 · control: modality-shift · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An old mare kicks the bucket during the winter.
B: An old mare might die during the winter.

```
renaming a->b  
common         —
residue A      —
residue B      —
```

### seedA-051 · tierA-000253 ↔ tierA-000255 · control: modality-shift · quality 0.80 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The founder dies at ninety.
B: The founder might die at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member e0 die) (Member x0 founder) (Patient e0 x0)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-051 · tierA-000253 ↔ tierA-000256 · control: negation · quality 0.25 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 3 atom(s), B 1 / 1

A: The founder dies at ninety.
B: The founder does not die at ninety.

```
renaming a->b  x0->x0
common         (Member x0 founder)
residue A      {(Measure x0 age 90 year)}@x0 {(Member e0 die) (Patient e0 x0)}@x0
residue B      {(And (Measure x0 age 90 year) (Member x1' die) (Patient x1' x0)) ~NEG}@x0
```

### seedA-051 · tierA-000254 ↔ tierA-000255 · control: modality-shift · quality 0.60 · common 3 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The founder kicks the bucket at ninety.
B: The founder might die at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member x0 founder) (Patient e0 x0)
group 1        anchors e0
  A            {(Member e0 kick_the_bucket)}
  B            {(Member e0 die)}
  near         (Member e0 kick_the_bucket) ~ (Member e0 die)   [arg1 kick_the_bucket->die]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-051 · tierA-000254 ↔ tierA-000256 · control: negation · quality 0.25 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 3 atom(s), B 1 / 1

A: The founder kicks the bucket at ninety.
B: The founder does not die at ninety.

```
renaming a->b  x0->x0
common         (Member x0 founder)
residue A      {(Measure x0 age 90 year)}@x0 {(Member e0 kick_the_bucket) (Patient e0 x0)}@x0
residue B      {(And (Measure x0 age 90 year) (Member x1' die) (Patient x1' x0)) ~NEG}@x0
```

### seedA-052 · tierA-000257 ↔ tierA-000259 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The last elm dies that autumn.
B: The last elm does not die that autumn.

```
renaming a->b  x0->x1
common         (Member x0 elm) (Member x0 last)
residue A      {(Member e0 die) (Patient e0 x0) (Time e0 that_autumn)}@x0
residue B      {(And (Member x0' die) (Patient x0' x0) (Time x0' that_autumn)) ~NEG}@x0
```

### seedA-052 · tierA-000257 ↔ tierA-000260 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The last elm dies that autumn.
B: The last elm survives that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Time e0 that_autumn)
group 1        anchors e0
  A            {(Member e0 die)}
  B            {(Member e0 survive)}
  near         (Member e0 die) ~ (Member e0 survive)   [arg1 die->survive]
group 2        anchors e0 x0
  A            {(Patient e0 x0)}
  B            {(Agent e0 x0)}
  near         (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-052 · tierA-000258 ↔ tierA-000259 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The last elm kicks the bucket that autumn.
B: The last elm does not die that autumn.

```
renaming a->b  x0->x1
common         (Member x0 elm) (Member x0 last)
residue A      {(Member e0 kick_the_bucket) (Patient e0 x0) (Time e0 that_autumn)}@x0
residue B      {(And (Member x0' die) (Patient x0' x0) (Time x0' that_autumn)) ~NEG}@x0
```

### seedA-052 · tierA-000258 ↔ tierA-000260 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The last elm kicks the bucket that autumn.
B: The last elm survives that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Time e0 that_autumn)
group 1        anchors e0
  A            {(Member e0 kick_the_bucket)}
  B            {(Member e0 survive)}
  near         (Member e0 kick_the_bucket) ~ (Member e0 survive)   [arg1 kick_the_bucket->survive]
group 2        anchors e0 x0
  A            {(Patient e0 x0)}
  B            {(Agent e0 x0)}
  near         (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
residue A      —
residue B      —
```

### seedA-053 · tierA-000261 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 7 atom(s), B 1 / 1 · 24 renamings tied

A: A trainer gives a recruit a whistle.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)}
residue B      {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000261 ↔ tierA-000265 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A trainer gives a recruit a whistle.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)}
  near         (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
residue A      —
residue B      {(GroupOf x2 whistle)}@x2
```

### seedA-053 · tierA-000262 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 7 atom(s), B 1 / 1 · 24 renamings tied

A: A recruit receives a whistle from a trainer.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
residue A      {(Agent e0 x0) (Member e0 receive) (Member x0 recruit) (Member x1 trainer) (Member x2 whistle) (Source e0 x1) (Theme e0 x2)}
residue B      {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000262 ↔ tierA-000265 · control: quantity-change · quality 0.38 · common 3 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A recruit receives a whistle from a trainer.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 recruit) (Member x1 trainer) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 3        anchors x2
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)}
  near         (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
group 4        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      {(GroupOf x2 whistle)}@x2
```

### seedA-053 · tierA-000263 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 7 atom(s), B 1 / 1 · 24 renamings tied

A: A trainer gives a whistle to a recruit.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)}
residue B      {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000263 ↔ tierA-000265 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A trainer gives a whistle to a recruit.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)}
  near         (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
residue A      —
residue B      {(GroupOf x2 whistle)}@x2
```

### seedA-054 · tierA-000266 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000266 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000267 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000267 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000268 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives a card to each member.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-054 · tierA-000268 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: A library gives a card to each member.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
residue A      —
residue B      —
```

### seedA-055 · tierA-000271 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A foreman gives a driver the manifest.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x1 manifest) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 foreman)}
  B            {(Member x0 driver)}
  near         (Member x0 foreman) ~ (Member x0 driver)   [arg1 foreman->driver]
group 2        anchors x2
  A            {(Member x2 driver)}
  B            {(Member x2 foreman)}
  near         (Member x2 driver) ~ (Member x2 foreman)   [arg1 driver->foreman]
residue A      —
residue B      —
```

### seedA-055 · tierA-000271 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A foreman gives a driver the manifest.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 manifest)
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)}@x1
residue B      {(And (Agent x0 x2) (Member x0 give) (Member x2 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x1)) ~NEG}@x1
```

### seedA-055 · tierA-000272 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A driver receives the manifest from a foreman.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member x0 driver) (Member x1 foreman) (Member x2 manifest) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 2        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Recipient e0 x1)}
  near         (Source e0 x1) ~ (Recipient e0 x1)   [head Source->Recipient]
residue A      —
residue B      —
```

### seedA-055 · tierA-000272 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A driver receives the manifest from a foreman.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 manifest)
residue A      {(Agent e0 x0) (Member e0 receive) (Member x0 driver) (Member x1 foreman) (Source e0 x1) (Theme e0 x2)}@x2
residue B      {(And (Agent x0 x1) (Member x0 give) (Member x1 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x2)) ~NEG}@x2
```

### seedA-055 · tierA-000273 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A foreman gives the manifest to a driver.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x1 manifest) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 foreman)}
  B            {(Member x0 driver)}
  near         (Member x0 foreman) ~ (Member x0 driver)   [arg1 foreman->driver]
group 2        anchors x2
  A            {(Member x2 driver)}
  B            {(Member x2 foreman)}
  near         (Member x2 driver) ~ (Member x2 foreman)   [arg1 driver->foreman]
residue A      —
residue B      —
```

### seedA-055 · tierA-000273 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A foreman gives the manifest to a driver.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 manifest)
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)}@x1
residue B      {(And (Agent x0 x2) (Member x0 give) (Member x2 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x1)) ~NEG}@x1
```

### seedA-056 · tierA-000276 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A school gives the winner a medal.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 winner)
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 school) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)}@x1
residue B      {(And (Agent x0 x2) (Member x0 give) (Member x2 school) (Member x2' medal) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-056 · tierA-000276 ↔ tierA-000280 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A school gives the winner a medal.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)}
  near         (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
residue A      —
residue B      {(GroupOf x2 medal)}@x2
```

### seedA-056 · tierA-000277 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: The winner receives a medal from a school.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (Member x0 winner)
residue A      {(Agent e0 x0) (Member e0 receive) (Member x1 school) (Member x2 medal) (Source e0 x1) (Theme e0 x2)}@x0
residue B      {(And (Agent x1 x2) (Member x1 give) (Member x2 school) (Member x2' medal) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-056 · tierA-000277 ↔ tierA-000280 · control: quantity-change · quality 0.38 · common 3 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The winner receives a medal from a school.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 winner) (Member x1 school) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 receive)}
  B            {(Member e0 give)}
  near         (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
group 3        anchors x2
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)}
  near         (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
group 4        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      {(GroupOf x2 medal)}@x2
```

### seedA-056 · tierA-000278 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A school gives a medal to the winner.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 winner)
residue A      {(Agent e0 x0) (Member e0 give) (Member x0 school) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)}@x1
residue B      {(And (Agent x0 x2) (Member x0 give) (Member x2 school) (Member x2' medal) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-056 · tierA-000278 ↔ tierA-000280 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A school gives a medal to the winner.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)}
  near         (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
residue A      —
residue B      {(GroupOf x2 medal)}@x2
```

### seedA-057 · tierA-000281 ↔ tierA-000284 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A potter teaches an apprentice glazing.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-057 · tierA-000281 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A potter teaches an apprentice glazing.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Recipient e0 x1) (Theme e0 glazing)
group 1        anchors x0
  A            {(Member x0 potter)}
  B            {(Member x0 apprentice)}
  near         (Member x0 potter) ~ (Member x0 apprentice)   [arg1 potter->apprentice]
group 2        anchors x1
  A            {(Member x1 apprentice)}
  B            {(Member x1 potter)}
  near         (Member x1 apprentice) ~ (Member x1 potter)   [arg1 apprentice->potter]
residue A      —
residue B      —
```

### seedA-057 · tierA-000282 ↔ tierA-000284 · control: modality-shift · quality 0.43 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An apprentice learns glazing from a potter.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 3        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-057 · tierA-000282 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An apprentice learns glazing from a potter.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
group 1        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 2        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Recipient e0 x1)}
  near         (Source e0 x1) ~ (Recipient e0 x1)   [head Source->Recipient]
residue A      —
residue B      —
```

### seedA-057 · tierA-000283 ↔ tierA-000284 · control: modality-shift · quality 0.86 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A potter teaches glazing to an apprentice.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-057 · tierA-000283 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A potter teaches glazing to an apprentice.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Recipient e0 x1) (Theme e0 glazing)
group 1        anchors x0
  A            {(Member x0 potter)}
  B            {(Member x0 apprentice)}
  near         (Member x0 potter) ~ (Member x0 apprentice)   [arg1 potter->apprentice]
group 2        anchors x1
  A            {(Member x1 apprentice)}
  B            {(Member x1 potter)}
  near         (Member x1 apprentice) ~ (Member x1 potter)   [arg1 apprentice->potter]
residue A      —
residue B      —
```

### seedA-058 · tierA-000286 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A coach teaches the squad a drill.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 teach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 coach)}
  B            {(Member x0 squad)}
  near         (Member x0 coach) ~ (Member x0 squad)   [arg1 coach->squad]
group 2        anchors x2
  A            {(Member x2 squad)}
  B            {(Member x2 coach)}
  near         (Member x2 squad) ~ (Member x2 coach)   [arg1 squad->coach]
residue A      —
residue B      —
```

### seedA-058 · tierA-000286 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A coach teaches the squad a drill.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 squad)
residue A      {(Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)}@x2
residue B      {(And (Agent x0 x1) (Member x0 teach) (Member x1 coach) (Member x2' drill) (Recipient x0 x2) (Theme x0 x2')) ~NEG}@x2
```

### seedA-058 · tierA-000287 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The squad learns a drill from a coach.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member x0 squad) (Member x1 drill) (Member x2 coach) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 2        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Recipient e0 x2)}
  near         (Source e0 x2) ~ (Recipient e0 x2)   [head Source->Recipient]
residue A      —
residue B      —
```

### seedA-058 · tierA-000287 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: The squad learns a drill from a coach.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (Member x0 squad)
residue A      {(Agent e0 x0) (Member e0 learn) (Member x1 drill) (Member x2 coach) (Source e0 x2) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x2) (Member x1 teach) (Member x2 coach) (Member x2' drill) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-058 · tierA-000288 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A coach teaches a drill to the squad.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 teach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 coach)}
  B            {(Member x0 squad)}
  near         (Member x0 coach) ~ (Member x0 squad)   [arg1 coach->squad]
group 2        anchors x2
  A            {(Member x2 squad)}
  B            {(Member x2 coach)}
  near         (Member x2 squad) ~ (Member x2 coach)   [arg1 squad->coach]
residue A      —
residue B      —
```

### seedA-058 · tierA-000288 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A coach teaches a drill to the squad.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 squad)
residue A      {(Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)}@x2
residue B      {(And (Agent x0 x1) (Member x0 teach) (Member x1 coach) (Member x2' drill) (Recipient x0 x2) (Theme x0 x2')) ~NEG}@x2
```

### seedA-059 · tierA-000291 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: An elder teaches the children a song.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (GroupOf x1 child)
residue A      {(Agent e0 x0) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)}@x1
residue B      {(And (Agent x0 x2) (Member x0 teach) (Member x2 elder) (Member x2' song) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-059 · tierA-000291 ↔ tierA-000295 · control: modality-shift · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An elder teaches the children a song.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-059 · tierA-000292 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: The children learn a song from an elder.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (GroupOf x0 child)
residue A      {(Agent e0 x0) (Member e0 learn) (Member x1 song) (Member x2 elder) (Source e0 x2) (Theme e0 x1)}@x0
residue B      {(And (Agent x1 x2) (Member x1 teach) (Member x2 elder) (Member x2' song) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-059 · tierA-000292 ↔ tierA-000295 · control: modality-shift · quality 0.50 · common 4 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The children learn a song from an elder.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (GroupOf x0 child) (Member x1 song) (Member x2 elder) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 learn)}
  B            {(Member e0 teach)}
  near         (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
group 3        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Agent e0 x2)}
  near         (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-059 · tierA-000293 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: An elder teaches a song to the children.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (GroupOf x1 child)
residue A      {(Agent e0 x0) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)}@x1
residue B      {(And (Agent x0 x2) (Member x0 teach) (Member x2 elder) (Member x2' song) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-059 · tierA-000293 ↔ tierA-000295 · control: modality-shift · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An elder teaches a song to the children.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-060 · tierA-000296 ↔ tierA-000299 · control: quantity-change · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A neighbour lends Ravi a ladder.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Recipient e0 ravi) (Theme e0 x1)
group 1        anchors x1
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)}
  near         (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
residue A      —
residue B      {(GroupOf x1 ladder)}@x1
```

### seedA-060 · tierA-000296 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A neighbour lends Ravi a ladder.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)}
  near         (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-060 · tierA-000297 ↔ tierA-000299 · control: quantity-change · quality 0.29 · common 2 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Ravi borrows a ladder from a neighbour.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Theme e0 x1)
group 1        anchors e0
  A            {(Agent e0 ravi)}
  B            {(Member e0 lend)}
  near         (Agent e0 ravi) ~ (Member e0 lend)   [head Agent->Member; arg1 ravi->lend]
group 2        anchors e0
  A            {(Member e0 borrow)}
  B            {(Recipient e0 ravi)}
  near         (Member e0 borrow) ~ (Recipient e0 ravi)   [head Member->Recipient; arg1 borrow->ravi]
group 3        anchors x1
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)}
  near         (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
group 4        anchors e0 x0
  A            {(Source e0 x0)}
  B            {(Agent e0 x0)}
  near         (Source e0 x0) ~ (Agent e0 x0)   [head Source->Agent]
residue A      —
residue B      {(GroupOf x1 ladder)}@x1
```

### seedA-060 · tierA-000297 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Ravi borrows a ladder from a neighbour.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Agent e0 ravi) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 borrow)}
  B            {(Member e0 lend)}
  near         (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
group 2        anchors e0 x0
  A            {(Source e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Source e0 x0) ~ (Recipient e0 x0)   [head Source->Recipient]
residue A      —
residue B      —
```

### seedA-060 · tierA-000298 ↔ tierA-000299 · control: quantity-change · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A neighbour lends a ladder to Ravi.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Recipient e0 ravi) (Theme e0 x1)
group 1        anchors x1
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)}
  near         (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
residue A      —
residue B      {(GroupOf x1 ladder)}@x1
```

### seedA-060 · tierA-000298 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A neighbour lends a ladder to Ravi.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)}
  near         (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
residue A      —
residue B      —
```

### seedA-061 · tierA-000301 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The depot lends the crew a generator.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x1 generator) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 depot)}
  B            {(Member x0 crew)}
  near         (Member x0 depot) ~ (Member x0 crew)   [arg1 depot->crew]
group 2        anchors x2
  A            {(Member x2 crew)}
  B            {(Member x2 depot)}
  near         (Member x2 crew) ~ (Member x2 depot)   [arg1 crew->depot]
residue A      —
residue B      —
```

### seedA-061 · tierA-000301 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The depot lends the crew a generator.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x1 x1->x3 x2->x2
common         (Member x0 depot) (Member x1 generator) (Member x2 crew)
residue A      {(Agent e0 x0) (Member e0 lend) (Recipient e0 x2) (Theme e0 x1)}@x0,x1,x2
residue B      {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x2) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-061 · tierA-000302 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The crew borrows a generator from the depot.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member x0 crew) (Member x1 generator) (Member x2 depot) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 borrow)}
  B            {(Member e0 lend)}
  near         (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
group 2        anchors e0 x2
  A            {(Source e0 x2)}
  B            {(Recipient e0 x2)}
  near         (Source e0 x2) ~ (Recipient e0 x2)   [head Source->Recipient]
residue A      —
residue B      —
```

### seedA-061 · tierA-000302 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The crew borrows a generator from the depot.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x2 x1->x3 x2->x1
common         (Member x0 crew) (Member x1 generator) (Member x2 depot)
residue A      {(Agent e0 x0) (Member e0 borrow) (Source e0 x2) (Theme e0 x1)}@x0,x1,x2
residue B      {(And (Agent x0' x2) (Member x0' lend) (Recipient x0' x0) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-061 · tierA-000303 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The depot lends a generator to the crew.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x1 generator) (Recipient e0 x2) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 depot)}
  B            {(Member x0 crew)}
  near         (Member x0 depot) ~ (Member x0 crew)   [arg1 depot->crew]
group 2        anchors x2
  A            {(Member x2 crew)}
  B            {(Member x2 depot)}
  near         (Member x2 crew) ~ (Member x2 depot)   [arg1 crew->depot]
residue A      —
residue B      —
```

### seedA-061 · tierA-000303 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The depot lends a generator to the crew.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x1 x1->x3 x2->x2
common         (Member x0 depot) (Member x1 generator) (Member x2 crew)
residue A      {(Agent e0 x0) (Member e0 lend) (Recipient e0 x2) (Theme e0 x1)}@x0,x1,x2
residue B      {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x2) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000306 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The museum lends the gallery a painting.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x1 x1->x2 x2->x3
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting)
residue A      {(Agent e0 x0) (Member e0 lend) (Recipient e0 x1) (Theme e0 x2)}@x0,x1,x2
residue B      {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x1) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000306 ↔ tierA-000310 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The museum lends the gallery a painting.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)}
  near         (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
residue A      —
residue B      {(GroupOf x2 painting)}@x2
```

### seedA-062 · tierA-000307 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The gallery borrows a painting from the museum.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x2 x1->x1 x2->x3
common         (Member x0 gallery) (Member x1 museum) (Member x2 painting)
residue A      {(Agent e0 x0) (Member e0 borrow) (Source e0 x1) (Theme e0 x2)}@x0,x1,x2
residue B      {(And (Agent x0' x1) (Member x0' lend) (Recipient x0' x0) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000307 ↔ tierA-000310 · control: quantity-change · quality 0.38 · common 3 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The gallery borrows a painting from the museum.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 gallery) (Member x1 museum) (Theme e0 x2)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Recipient e0 x0)}
  near         (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
group 2        anchors e0
  A            {(Member e0 borrow)}
  B            {(Member e0 lend)}
  near         (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
group 3        anchors x2
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)}
  near         (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
group 4        anchors e0 x1
  A            {(Source e0 x1)}
  B            {(Agent e0 x1)}
  near         (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
residue A      —
residue B      {(GroupOf x2 painting)}@x2
```

### seedA-062 · tierA-000308 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: The museum lends a painting to the gallery.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x1 x1->x2 x2->x3
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting)
residue A      {(Agent e0 x0) (Member e0 lend) (Recipient e0 x1) (Theme e0 x2)}@x0,x1,x2
residue B      {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x1) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000308 ↔ tierA-000310 · control: quantity-change · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The museum lends a painting to the gallery.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Recipient e0 x1) (Theme e0 x2)
group 1        anchors x2
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)}
  near         (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
residue A      —
residue B      {(GroupOf x2 painting)}@x2
```

### seedA-063 · tierA-000311 ↔ tierA-000313 · control: modality-shift · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Ana works with Bo on the mural.
B: Ana might work with Bo on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (CoAgent e0 bo) (Member e0 work) (Member x0 mural)
group 1        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Location e0 x0)}
  near         (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-063 · tierA-000311 ↔ tierA-000314 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: Ana works with Bo on the mural.
B: Ana does not work with Bo on the mural.

```
renaming a->b  x0->x1
common         (Member x0 mural)
residue A      {(Agent e0 ana) (CoAgent e0 bo) (Member e0 work) (Theme e0 x0)}@x0
residue B      {(And (Agent x0' ana) (CoAgent x0' bo) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-063 · tierA-000312 ↔ tierA-000313 · control: modality-shift · quality 0.43 · common 3 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 2 / 2

A: Ana and Bo work on the mural.
B: Ana might work with Bo on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (Member e0 work) (Member x0 mural)
group 1        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Location e0 x0)}
  near         (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
residue A      {(Agent e1 bo) (Member e1 work) (Theme e1 x0)}@x0
residue B      {(CoAgent e0 bo)}@e0 {(Might e0)}@e0
```

### seedA-063 · tierA-000312 ↔ tierA-000314 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 6 atom(s), B 1 / 1

A: Ana and Bo work on the mural.
B: Ana does not work with Bo on the mural.

```
renaming a->b  x0->x1
common         (Member x0 mural)
residue A      {(Agent e0 ana) (Member e0 work) (Theme e0 x0)}@x0 {(Agent e1 bo) (Member e1 work) (Theme e1 x0)}@x0
residue B      {(And (Agent x0' ana) (CoAgent x0' bo) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-064 · tierA-000315 ↔ tierA-000317 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 6 atom(s), B 1 / 1 · 6 renamings tied

A: A welder works with a fitter on the frame.
B: A welder does not work with a fitter on the frame.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 frame)
residue A      {(Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member e0 work) (Member x0 welder) (Member x1 fitter)}@x2
residue B      {(And (Agent x0 x1) (CoAgent x0 x2') (Location x0 x2) (Member x0 work) (Member x1 welder) (Member x2' fitter)) ~NEG}@x2
```

### seedA-064 · tierA-000315 ↔ tierA-000318 · control: manner-near-miss · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A welder works with a fitter on the frame.
B: A welder competes with a fitter on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
group 1        anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 compete)}
  near         (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
residue A      —
residue B      —
```

### seedA-064 · tierA-000316 ↔ tierA-000317 · control: negation · quality 0.11 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 8 atom(s), B 1 / 1 · 6 renamings tied

A: A welder and a fitter work on the frame.
B: A welder does not work with a fitter on the frame.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 frame)
residue A      {(Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 welder)}@x2 {(Agent e1 x1) (Location e1 x2) (Member e1 work) (Member x1 fitter)}@x2
residue B      {(And (Agent x0 x1) (CoAgent x0 x2') (Location x0 x2) (Member x0 work) (Member x1 welder) (Member x2' fitter)) ~NEG}@x2
```

### seedA-064 · tierA-000316 ↔ tierA-000318 · control: manner-near-miss · quality 0.56 · common 5 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A welder and a fitter work on the frame.
B: A welder competes with a fitter on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
group 1        anchors e0 x1 x2
  A            {(Agent e1 x1) (Location e1 x2) (Member e1 work)}
  B            {(CoAgent e0 x1)}
  partial      (Agent e1 x1) ~ (CoAgent e0 x1)   [head Agent->CoAgent; arg0 e1->e0]
  A only       (Location e1 x2) (Member e1 work)
group 2        anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 compete)}
  near         (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
residue A      —
residue B      —
```

### seedA-065 · tierA-000319 ↔ tierA-000321 · control: manner-near-miss · quality 0.86 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A biologist works with a ranger on the survey.
B: A biologist competes with a ranger on the survey.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
group 1        anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 compete)}
  near         (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
residue A      —
residue B      —
```

### seedA-065 · tierA-000319 ↔ tierA-000322 · control: modality-shift · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A biologist works with a ranger on the survey.
B: A biologist might work with a ranger on the survey.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member e0 work) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-065 · tierA-000320 ↔ tierA-000321 · control: manner-near-miss · quality 0.56 · common 5 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A biologist and a ranger work on the survey.
B: A biologist competes with a ranger on the survey.

```
renaming a->b  e1->e0 x0->x1 x1->x0 x2->x2
common         (Agent e1 x1) (Location e1 x2) (Member x0 ranger) (Member x1 biologist) (Member x2 survey)
group 1        anchors e1 x0 x2
  A            {(Agent e0 x0) (Location e0 x2) (Member e0 work)}
  B            {(CoAgent e1 x0)}
  partial      (Agent e0 x0) ~ (CoAgent e1 x0)   [head Agent->CoAgent; arg0 e0->e1]
  A only       (Location e0 x2) (Member e0 work)
group 2        anchors e1
  A            {(Member e1 work)}
  B            {(Member e1 compete)}
  near         (Member e1 work) ~ (Member e1 compete)   [arg1 work->compete]
residue A      —
residue B      —
```

### seedA-065 · tierA-000320 ↔ tierA-000322 · control: modality-shift · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A biologist and a ranger work on the survey.
B: A biologist might work with a ranger on the survey.

```
renaming a->b  e1->e0 x0->x1 x1->x0 x2->x2
common         (Agent e1 x1) (Location e1 x2) (Member e1 work) (Member x0 ranger) (Member x1 biologist) (Member x2 survey)
group 1        anchors e1 x0 x2
  A            {(Agent e0 x0) (Location e0 x2) (Member e0 work)}
  B            {(CoAgent e1 x0)}
  partial      (Agent e0 x0) ~ (CoAgent e1 x0)   [head Agent->CoAgent; arg0 e0->e1]
  A only       (Location e0 x2) (Member e0 work)
residue A      —
residue B      {(Might e1)}@e1
```

### seedA-066 · tierA-000323 ↔ tierA-000325 · control: modality-shift · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Dara works with Nils on the ledger.
B: Dara might work with Nils on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (CoAgent e0 nils) (Location e0 x0) (Member e0 work) (Member x0 ledger)
residue A      —
residue B      {(Might e0)}@e0
```

### seedA-066 · tierA-000323 ↔ tierA-000326 · control: negation · quality 0.20 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 4 atom(s), B 1 / 1

A: Dara works with Nils on the ledger.
B: Dara does not work with Nils on the ledger.

```
renaming a->b  x0->x1
common         (Member x0 ledger)
residue A      {(Agent e0 dara) (CoAgent e0 nils) (Location e0 x0) (Member e0 work)}@x0
residue B      {(And (Agent x0' dara) (CoAgent x0' nils) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-066 · tierA-000324 ↔ tierA-000325 · control: modality-shift · quality 0.57 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 2 / 2

A: Dara and Nils work on the ledger.
B: Dara might work with Nils on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (Location e0 x0) (Member e0 work) (Member x0 ledger)
residue A      {(Agent e1 nils) (Location e1 x0) (Member e1 work)}@x0
residue B      {(CoAgent e0 nils)}@e0 {(Might e0)}@e0
```

### seedA-066 · tierA-000324 ↔ tierA-000326 · control: negation · quality 0.14 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 6 atom(s), B 1 / 1

A: Dara and Nils work on the ledger.
B: Dara does not work with Nils on the ledger.

```
renaming a->b  x0->x1
common         (Member x0 ledger)
residue A      {(Agent e0 dara) (Location e0 x0) (Member e0 work)}@x0 {(Agent e1 nils) (Location e1 x0) (Member e1 work)}@x0
residue B      {(And (Agent x0' dara) (CoAgent x0' nils) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-067 · tierA-000327 ↔ tierA-000329 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A crate is large in size.
B: A crate is small in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 small)}
  near         (Member x0 large) ~ (Member x0 small)   [arg1 large->small]
residue A      —
residue B      —
```

### seedA-067 · tierA-000327 ↔ tierA-000330 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A crate is large in size.
B: A crate is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 large) ~NEG}
  near         (Member x0 large) ~ (Member x0 large) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-067 · tierA-000328 ↔ tierA-000329 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A crate is big in size.
B: A crate is small in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 small)}
  near         (Member x0 big) ~ (Member x0 small)   [arg1 big->small]
residue A      —
residue B      —
```

### seedA-067 · tierA-000328 ↔ tierA-000330 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A crate is big in size.
B: A crate is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 large) ~NEG}
  near         (Member x0 big) ~ (Member x0 large) ~NEG   [arg1 big->large; polarity]
residue A      —
residue B      —
```

### seedA-068 · tierA-000331 ↔ tierA-000333 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The hatch is large in size.
B: The hatch is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 large) ~NEG}
  near         (Member x0 large) ~ (Member x0 large) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-068 · tierA-000331 ↔ tierA-000334 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The hatch is large in size.
B: The hatch might be large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
residue A      {(Member x0 large)}@x0
residue B      {(Might (Member x0 large))}@x0
```

### seedA-068 · tierA-000332 ↔ tierA-000333 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The hatch is big in size.
B: The hatch is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 large) ~NEG}
  near         (Member x0 big) ~ (Member x0 large) ~NEG   [arg1 big->large; polarity]
residue A      —
residue B      —
```

### seedA-068 · tierA-000332 ↔ tierA-000334 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The hatch is big in size.
B: The hatch might be large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
residue A      {(Member x0 big)}@x0
residue B      {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000335 ↔ tierA-000337 · control: modality-shift · quality 0.67 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The new bench is large.
B: The new bench might be large.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
residue A      {(Member x0 large)}@x0
residue B      {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000335 ↔ tierA-000338 · control: antonym · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The new bench is large.
B: The new bench is small.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
group 1        anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 small)}
  near         (Member x0 large) ~ (Member x0 small)   [arg1 large->small]
residue A      —
residue B      —
```

### seedA-069 · tierA-000336 ↔ tierA-000337 · control: modality-shift · quality 0.67 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The new bench is big.
B: The new bench might be large.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
residue A      {(Member x0 big)}@x0
residue B      {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000336 ↔ tierA-000338 · control: antonym · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The new bench is big.
B: The new bench is small.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 small)}
  near         (Member x0 big) ~ (Member x0 small)   [arg1 big->small]
residue A      —
residue B      —
```

### seedA-070 · tierA-000339 ↔ tierA-000341 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The boiler is huge in size.
B: The boiler is tiny in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 tiny)}
  near         (Member x0 huge) ~ (Member x0 tiny)   [arg1 huge->tiny]
residue A      —
residue B      —
```

### seedA-070 · tierA-000339 ↔ tierA-000342 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The boiler is huge in size.
B: The boiler is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 huge) ~NEG}
  near         (Member x0 huge) ~ (Member x0 huge) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-070 · tierA-000340 ↔ tierA-000341 · control: antonym · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The boiler is very big in size.
B: The boiler is tiny in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 tiny)}
  near         (Member x0 big) ~ (Member x0 tiny)   [arg1 big->tiny]
residue A      {(Degree x0 big very)}@x0
residue B      —
```

### seedA-070 · tierA-000340 ↔ tierA-000342 · control: negation · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The boiler is very big in size.
B: The boiler is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 huge) ~NEG}
  near         (Member x0 big) ~ (Member x0 huge) ~NEG   [arg1 big->huge; polarity]
residue A      {(Degree x0 big very)}@x0
residue B      —
```

### seedA-071 · tierA-000343 ↔ tierA-000345 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The skylight is huge in size.
B: The skylight is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 huge) ~NEG}
  near         (Member x0 huge) ~ (Member x0 huge) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-071 · tierA-000343 ↔ tierA-000346 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The skylight is huge in size.
B: The skylight might be huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
residue A      {(Member x0 huge)}@x0
residue B      {(Might (Member x0 huge))}@x0
```

### seedA-071 · tierA-000344 ↔ tierA-000345 · control: negation · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The skylight is very big in size.
B: The skylight is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 huge) ~NEG}
  near         (Member x0 big) ~ (Member x0 huge) ~NEG   [arg1 big->huge; polarity]
residue A      {(Degree x0 big very)}@x0
residue B      —
```

### seedA-071 · tierA-000344 ↔ tierA-000346 · control: modality-shift · quality 0.33 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 1 / 1

A: The skylight is very big in size.
B: The skylight might be huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
residue A      {(Degree x0 big very)}@x0 {(Member x0 big)}@x0
residue B      {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000347 ↔ tierA-000349 · control: modality-shift · quality 0.67 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The spoil mound is huge.
B: The spoil mound might be huge.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
residue A      {(Member x0 huge)}@x0
residue B      {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000347 ↔ tierA-000350 · control: antonym · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The spoil mound is huge.
B: The spoil mound is tiny.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
group 1        anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 tiny)}
  near         (Member x0 huge) ~ (Member x0 tiny)   [arg1 huge->tiny]
residue A      —
residue B      —
```

### seedA-072 · tierA-000348 ↔ tierA-000349 · control: modality-shift · quality 0.50 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 1 / 1

A: The spoil mound is very big.
B: The spoil mound might be huge.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
residue A      {(Degree x0 big very)}@x0 {(Member x0 big)}@x0
residue B      {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000348 ↔ tierA-000350 · control: antonym · quality 0.50 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The spoil mound is very big.
B: The spoil mound is tiny.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
group 1        anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 tiny)}
  near         (Member x0 big) ~ (Member x0 tiny)   [arg1 big->tiny]
residue A      {(Degree x0 big very)}@x0
residue B      —
```

### seedA-073 · tierA-000351 ↔ tierA-000353 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The repair is difficult.
B: The repair is easy.

```
renaming a->b  x0->x0
common         (Member x0 repair)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 easy)}
  near         (Member x0 difficult) ~ (Member x0 easy)   [arg1 difficult->easy]
residue A      —
residue B      —
```

### seedA-073 · tierA-000351 ↔ tierA-000354 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The repair is difficult.
B: The repair is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 repair)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 difficult) ~NEG}
  near         (Member x0 difficult) ~ (Member x0 difficult) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-073 · tierA-000352 ↔ tierA-000353 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The repair is hard.
B: The repair is easy.

```
renaming a->b  x0->x0
common         (Member x0 repair)
group 1        anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 easy)}
  near         (Member x0 hard) ~ (Member x0 easy)   [arg1 hard->easy]
residue A      —
residue B      —
```

### seedA-073 · tierA-000352 ↔ tierA-000354 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The repair is hard.
B: The repair is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 repair)
group 1        anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 difficult) ~NEG}
  near         (Member x0 hard) ~ (Member x0 difficult) ~NEG   [arg1 hard->difficult; polarity]
residue A      —
residue B      —
```

### seedA-074 · tierA-000355 ↔ tierA-000357 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The calibration is difficult.
B: The calibration is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 difficult) ~NEG}
  near         (Member x0 difficult) ~ (Member x0 difficult) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-074 · tierA-000355 ↔ tierA-000358 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The calibration is difficult.
B: The calibration might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
residue A      {(Member x0 difficult)}@x0
residue B      {(Might (Member x0 difficult))}@x0
```

### seedA-074 · tierA-000356 ↔ tierA-000357 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The calibration is hard.
B: The calibration is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
group 1        anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 difficult) ~NEG}
  near         (Member x0 hard) ~ (Member x0 difficult) ~NEG   [arg1 hard->difficult; polarity]
residue A      —
residue B      —
```

### seedA-074 · tierA-000356 ↔ tierA-000358 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The calibration is hard.
B: The calibration might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
residue A      {(Member x0 hard)}@x0
residue B      {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000359 ↔ tierA-000361 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The descent is difficult.
B: The descent might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 descent)
residue A      {(Member x0 difficult)}@x0
residue B      {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000359 ↔ tierA-000362 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The descent is difficult.
B: The descent is easy.

```
renaming a->b  x0->x0
common         (Member x0 descent)
group 1        anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 easy)}
  near         (Member x0 difficult) ~ (Member x0 easy)   [arg1 difficult->easy]
residue A      —
residue B      —
```

### seedA-075 · tierA-000360 ↔ tierA-000361 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The descent is hard.
B: The descent might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 descent)
residue A      {(Member x0 hard)}@x0
residue B      {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000360 ↔ tierA-000362 · control: antonym · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The descent is hard.
B: The descent is easy.

```
renaming a->b  x0->x0
common         (Member x0 descent)
group 1        anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 easy)}
  near         (Member x0 hard) ~ (Member x0 easy)   [arg1 hard->easy]
residue A      —
residue B      —
```

### seedA-076 · tierA-000363 ↔ tierA-000365 · control: antonym · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The night crew is exhausted.
B: The night crew is energetic.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
group 1        anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 energetic)}
  near         (Member x0 exhausted) ~ (Member x0 energetic)   [arg1 exhausted->energetic]
residue A      —
residue B      —
```

### seedA-076 · tierA-000363 ↔ tierA-000366 · control: negation · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The night crew is exhausted.
B: The night crew is not exhausted.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
group 1        anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 exhausted) ~NEG}
  near         (Member x0 exhausted) ~ (Member x0 exhausted) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-076 · tierA-000364 ↔ tierA-000365 · control: antonym · quality 0.50 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The night crew is very tired.
B: The night crew is energetic.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
group 1        anchors x0
  A            {(Member x0 tired)}
  B            {(Member x0 energetic)}
  near         (Member x0 tired) ~ (Member x0 energetic)   [arg1 tired->energetic]
residue A      {(Degree x0 tired very)}@x0
residue B      —
```

### seedA-076 · tierA-000364 ↔ tierA-000366 · control: negation · quality 0.50 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The night crew is very tired.
B: The night crew is not exhausted.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
group 1        anchors x0
  A            {(Member x0 tired)}
  B            {(Member x0 exhausted) ~NEG}
  near         (Member x0 tired) ~ (Member x0 exhausted) ~NEG   [arg1 tired->exhausted; polarity]
residue A      {(Degree x0 tired very)}@x0
residue B      —
```

### seedA-077 · tierA-000367 ↔ tierA-000369 · control: negation · quality 0.50 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The courier is exhausted.
B: The courier is not exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
group 1        anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 exhausted) ~NEG}
  near         (Member x0 exhausted) ~ (Member x0 exhausted) ~NEG   [polarity]
residue A      —
residue B      —
```

### seedA-077 · tierA-000367 ↔ tierA-000370 · control: modality-shift · quality 0.50 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: The courier is exhausted.
B: The courier might be exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
residue A      {(Member x0 exhausted)}@x0
residue B      {(Might (Member x0 exhausted))}@x0
```

### seedA-077 · tierA-000368 ↔ tierA-000369 · control: negation · quality 0.33 · common 1 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The courier is very tired.
B: The courier is not exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
group 1        anchors x0
  A            {(Member x0 tired)}
  B            {(Member x0 exhausted) ~NEG}
  near         (Member x0 tired) ~ (Member x0 exhausted) ~NEG   [arg1 tired->exhausted; polarity]
residue A      {(Degree x0 tired very)}@x0
residue B      —
```

### seedA-077 · tierA-000368 ↔ tierA-000370 · control: modality-shift · quality 0.33 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 1 / 1

A: The courier is very tired.
B: The courier might be exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
residue A      {(Degree x0 tired very)}@x0 {(Member x0 tired)}@x0
residue B      {(Might (Member x0 exhausted))}@x0
```

### seedA-078 · tierA-000371 ↔ tierA-000373 · control: modality-shift · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The divers are all exhausted.
B: The divers might all be exhausted.

```
renaming a->b  
common         —
residue A      {(Inheritance diver exhausted)}
residue B      —
```

### seedA-078 · tierA-000371 ↔ tierA-000374 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The divers are all exhausted.
B: The divers are all energetic.

```
renaming a->b  
common         —
residue A      {(Inheritance diver exhausted)}
residue B      —
```

### seedA-078 · tierA-000372 ↔ tierA-000373 · control: modality-shift · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0

A: The divers are all very tired.
B: The divers might all be exhausted.

```
renaming a->b  
common         —
residue A      {(Degree diver tired very) (Inheritance diver tired)}
residue B      —
```

### seedA-078 · tierA-000372 ↔ tierA-000374 · control: antonym · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0

A: The divers are all very tired.
B: The divers are all energetic.

```
renaming a->b  
common         —
residue A      {(Degree diver tired very) (Inheritance diver tired)}
residue B      —
```

### seedA-079 · tierA-000375 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: A physician signs the chart.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 chart)}
  near         (Member x0 physician) ~ (Member x0 chart)   [arg1 physician->chart]
group 2        anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  near         (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
residue A      —
residue B      —
```

### seedA-079 · tierA-000375 ↔ tierA-000379 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A physician signs the chart.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 physician) (Member x1 chart)
residue A      {(Agent e0 x0) (Member e0 sign) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-079 · tierA-000376 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor signs the chart.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 chart)}
  near         (Member x0 doctor) ~ (Member x0 chart)   [arg1 doctor->chart]
group 2        anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  near         (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
residue A      —
residue B      —
```

### seedA-079 · tierA-000376 ↔ tierA-000379 · control: negation · quality 0.20 · common 1 · aligned 1 near + 0 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor signs the chart.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 chart)
group 1        anchors x1
  A            {(Agent e0 x0) (Member e0 sign) (Member x0 doctor) (Patient e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG (Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
  A only       (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
  B only       (And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG
residue A      —
residue B      —
```

### seedA-079 · tierA-000377 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: The chart is signed by a physician.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
group 1        anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 chart)}
  near         (Member x0 physician) ~ (Member x0 chart)   [arg1 physician->chart]
group 2        anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  near         (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
residue A      —
residue B      —
```

### seedA-079 · tierA-000377 ↔ tierA-000379 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The chart is signed by a physician.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 physician) (Member x1 chart)
residue A      {(Agent e0 x0) (Member e0 sign) (Patient e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000380 ↔ tierA-000383 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: A physician examines the samples.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample) (Member x0 physician)
residue A      {(Agent e0 x0) (Member e0 examine) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000380 ↔ tierA-000384 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician examines the samples.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member x0 physician) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  near         (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
residue A      —
residue B      —
```

### seedA-080 · tierA-000381 ↔ tierA-000383 · control: negation · quality 0.20 · common 1 · aligned 1 near + 0 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor examines the samples.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample)
group 1        anchors x1
  A            {(Agent e0 x0) (Member e0 examine) (Member x0 doctor) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG (Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
  A only       (Agent e0 x0) (Member e0 examine) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG
residue A      —
residue B      —
```

### seedA-080 · tierA-000381 ↔ tierA-000384 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor examines the samples.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  near         (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
group 2        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
residue A      —
residue B      —
```

### seedA-080 · tierA-000382 ↔ tierA-000383 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The samples are examined by a physician.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample) (Member x0 physician)
residue A      {(Agent e0 x0) (Member e0 examine) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000382 ↔ tierA-000384 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The samples are examined by a physician.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member x0 physician) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  near         (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
residue A      —
residue B      —
```

### seedA-081 · tierA-000385 ↔ tierA-000388 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician orders a second scan.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  near         (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
residue A      —
residue B      —
```

### seedA-081 · tierA-000385 ↔ tierA-000389 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A physician orders a second scan.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-081 · tierA-000386 ↔ tierA-000388 · control: antonym · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor orders a second scan.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  near         (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
group 2        anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
residue A      —
residue B      —
```

### seedA-081 · tierA-000386 ↔ tierA-000389 · control: participant-swap · quality 0.50 · common 3 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A doctor orders a second scan.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan)
group 1        anchors e0
  A            {(Agent e0 x0) (Member x0 doctor)}
  B            {(Member x0 physician) (Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  near         (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-081 · tierA-000387 ↔ tierA-000388 · control: antonym · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second scan is ordered by a physician.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  near         (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
residue A      —
residue B      —
```

### seedA-081 · tierA-000387 ↔ tierA-000389 · control: participant-swap · quality 0.67 · common 4 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A second scan is ordered by a physician.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Theme e0 x0)}
  near         (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Agent e0 x1)}
  near         (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
residue A      —
residue B      —
```

### seedA-082 · tierA-000390 ↔ tierA-000393 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An automobile blocks the lane.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 lane)
residue A      {(Agent e0 x0) (Member e0 block) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-082 · tierA-000390 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An automobile blocks the lane.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)}
  near         (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
residue A      —
residue B      {(GroupOf x0 automobile)}@x0
```

### seedA-082 · tierA-000391 ↔ tierA-000393 · control: negation · quality 0.20 · common 1 · aligned 1 near + 0 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A car blocks the lane.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 lane)
group 1        anchors x1
  A            {(Agent e0 x0) (Member e0 block) (Member x0 car) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG (Member x0 automobile)}
  near         (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
  A only       (Agent e0 x0) (Member e0 block) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG
residue A      —
residue B      —
```

### seedA-082 · tierA-000391 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A car blocks the lane.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 car)}
  B            {(Cardinality x0 2)}
  near         (Member x0 car) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 car->2]
residue A      —
residue B      {(GroupOf x0 automobile)}@x0
```

### seedA-082 · tierA-000392 ↔ tierA-000393 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The lane is blocked by an automobile.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 lane)
residue A      {(Agent e0 x0) (Member e0 block) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-082 · tierA-000392 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The lane is blocked by an automobile.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)}
  near         (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
residue A      —
residue B      {(GroupOf x0 automobile)}@x0
```

### seedA-083 · tierA-000395 ↔ tierA-000397 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: An automobile waits at the gate.
B: Two automobiles wait at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
group 1        anchors x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)}
  near         (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
residue A      —
residue B      {(GroupOf x0 automobile)}@x0
```

### seedA-083 · tierA-000395 ↔ tierA-000398 · control: antonym · quality 0.40 · common 2 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An automobile waits at the gate.
B: An automobile leaves the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 automobile) (Member x1 gate)
group 1        anchors x0 x1
  A            {(Experiencer e0 x0) (Location e0 x1) (Member e0 wait)}
  B            {(Agent e0 x0) (Member e0 leave) (Theme e0 x1)}
  near         (Experiencer e0 x0) ~ (Agent e0 x0)   [head Experiencer->Agent]
  near         (Location e0 x1) ~ (Theme e0 x1)   [head Location->Theme]
  near         (Member e0 wait) ~ (Member e0 leave)   [arg1 wait->leave]
residue A      —
residue B      —
```

### seedA-083 · tierA-000396 ↔ tierA-000397 · control: quantity-change · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: A car waits at the gate.
B: Two automobiles wait at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
group 1        anchors x0
  A            {(Member x0 car)}
  B            {(Cardinality x0 2)}
  near         (Member x0 car) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 car->2]
residue A      —
residue B      {(GroupOf x0 automobile)}@x0
```

### seedA-083 · tierA-000396 ↔ tierA-000398 · control: antonym · quality 0.20 · common 1 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A car waits at the gate.
B: An automobile leaves the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x1 gate)
group 1        anchors x1
  A            {(Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x0 car)}
  B            {(Agent e0 x0) (Member e0 leave) (Member x0 automobile) (Theme e0 x1)}
  near         (Experiencer e0 x0) ~ (Agent e0 x0)   [head Experiencer->Agent]
  near         (Location e0 x1) ~ (Theme e0 x1)   [head Location->Theme]
  near         (Member e0 wait) ~ (Member e0 leave)   [arg1 wait->leave]
  near         (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
residue A      —
residue B      —
```

### seedA-084 · tierA-000399 ↔ tierA-000401 · control: antonym · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: An automobile crosses the bridge.
B: An automobile avoids the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 automobile) (Member x1 bridge) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 cross)}
  B            {(Member e0 avoid)}
  near         (Member e0 cross) ~ (Member e0 avoid)   [arg1 cross->avoid]
residue A      —
residue B      —
```

### seedA-084 · tierA-000399 ↔ tierA-000402 · control: negation · quality 0.40 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: An automobile crosses the bridge.
B: An automobile does not cross the bridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 bridge)
residue A      {(Agent e0 x0) (Member e0 cross) (Theme e0 x1)}@x0,x1
residue B      {(And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-084 · tierA-000400 ↔ tierA-000401 · control: antonym · quality 0.60 · common 3 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A car crosses the bridge.
B: An automobile avoids the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 bridge) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 cross)}
  B            {(Member e0 avoid)}
  near         (Member e0 cross) ~ (Member e0 avoid)   [arg1 cross->avoid]
group 2        anchors x0
  A            {(Member x0 car)}
  B            {(Member x0 automobile)}
  near         (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
residue A      —
residue B      —
```

### seedA-084 · tierA-000400 ↔ tierA-000402 · control: negation · quality 0.20 · common 1 · aligned 1 near + 0 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A car crosses the bridge.
B: An automobile does not cross the bridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 bridge)
group 1        anchors x1
  A            {(Agent e0 x0) (Member e0 cross) (Member x0 car) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG (Member x0 automobile)}
  near         (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
  A only       (Agent e0 x0) (Member e0 cross) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG
residue A      —
residue B      —
```

