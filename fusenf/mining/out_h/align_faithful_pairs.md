# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm — per-pair intermediate

One block per pair from `canonical_substrate.jsonl` over ../corpora/tierC.jsonl: the two sentences, the COMMON subgraph (the atoms the aligner matched identically under its skolem renaming), the differing subgraphs ALIGNED across the pair, the atoms left over inside those, and the RESIDUE (subgraphs with no counterpart). The record is `align_faithful_pairs.jsonl` (same content, one JSON object per pair); the method's outputs are `align_faithful.jsonl / .md / .metta`.

## How to read a block (the view's rules, disclosed)

- Every atom is written in A's variable names; B's atoms are renamed through the alignment's `renaming a->b` (read it backwards); a variable B has and A has not carries a prime (`x2'`). `~NEG` marks a negative-polarity atom. Only the aligner's eligible atoms appear (Implication and surface atoms excluded, as in the method).
- `common` = the atoms matched identically: the maximum common subgraph the method found (its `identical` count).
- The atoms outside the common part are grouped into SUBGRAPHS per side: two atoms belong together when they share a node symbol that the common part does not hold (a skolem, or a constant standing as a term's first argument, e.g. a compound kind); a symbol the common part does hold is an ANCHOR — where the subgraph hangs — and never merges subgraphs. Subgraphs are written `{atom atom …}`.
- A `group` = subgraphs of A and of B aligned to each other. Tier `near` = the method's own near match (same arity, the same skolems in the same positions, a head or constant substituted — the atoms counted in `near` and in the unit / role mappings). Tier `partial` = this view's extra pass among the leftovers: same arity and at least one equal argument position, the equal position holding a skolem unless the heads are equal or both are class links (Member / Inheritance / GroupOf / Name: the same lexeme asserted on both sides, e.g. a compound kind split into two Member atoms); taken greedily by (equal positions, equal head, atom order), one partner each, and never fusing two groups the near matches already formed. `[…]` after a match lists exactly what differs (head, argument slot, arity, polarity).
- `A only` / `B only` = atoms inside an aligned group with no partner: the group's two sides render the same content with a different number of atoms (a compound split, a role hung elsewhere).
- `residue A` / `residue B` = subgraphs with no counterpart on the other side at all, written `{…}@anchors`; these are the method's unmatched atoms minus the partial matches and the leftovers above. The method's residue records (`kind residue` in the .jsonl) count every unmatched atom, i.e. partial + leftover + residue here.

## Totals — paraphrase pairs

- 172 pairs, 26 with identical parses, 93 with no residue subgraph at all; 161 aligned groups
- atoms: 1065 common; 115 aligned by the method's near match + 126 by a partial match; 166 left over inside aligned groups (A only / B only); 184 in 142 residue subgraphs (no counterpart on the other side)

## Paraphrase pairs

### pairC-0001 · tierC-000001 ↔ tierC-000002 · quality 0.50 · common 8 · aligned 2 near + 1 partial · leftover 2 · residue A 1 subgraph(s) / 3 atom(s), B 0 / 0

A: Once the indigenous people had become indigenous , they would cease to be French .
B: Once the indigenous peoples had become indigenous , they would cease to be French .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Before e1 e0) (Member e0 cease) (Member e1 become) (Member x0 indigenous) (Past (Member x0 french)) (Past e0) (Past e1) (Patient e1 x0)
group 1        anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Patient e0 x0)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
group 2        anchors e0 x0
  A            {(Experiencer e3 x0) (Member e3 french) (Theme e0 e3)}
  B            {(Theme e0 (Member x0 french))}
  partial      (Theme e0 e3) ~ (Theme e0 (Member x0 french))   [arg1 e3->(Member x0 french)]
  A only       (Experiencer e3 x0) (Member e3 french)
group 3        anchors x0
  A            {(GroupOf x0 person)}
  B            {(GroupOf x0 people)}
  near         (GroupOf x0 person) ~ (GroupOf x0 people)   [arg1 person->people]
residue A      {(Experiencer e2 x0) (Member e2 indigenous) (Result e1 e2)}@e1,x0
residue B      —
```

### pairC-0002 · tierC-000003 ↔ tierC-000004 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The park is located near the foot of Bay Street , just south of Queens Quay .
B: The park is located near the foot of Bay Street , south of Queens Quay .

```
renaming a->b  x0->x0 x1->x1
common         (Member bay_street street) (Member queens_quay quay) (Member x0 park) (Member x1 foot) (Near x0 x1) (PartOf x1 bay_street) (SouthOf x0 queens_quay)
residue A      —
residue B      —
```

### pairC-0003 · tierC-000005 ↔ tierC-000006 · quality 0.20 · common 2 · aligned 4 near + 0 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: The Banach -- Mackey topology and the weak Arens space topology are relatively rarely used .
B: The Banach - Mackey - topology and the weak Arens - space topology are used relatively rarely .

```
renaming a->b  e0->e0 e1->e1
common         (Inheritance banach_mackey_topology topology) (Inheritance weak_arens_space_topology topology)
group 1        anchors weak_arens_space_topology
  A            {(Manner e0 rarely) (Member e0 use) (Member x0 weak_arens_space_topology) (Theme e0 x0)}
  B            {(Member e0 use) ~NEG (Theme e0 weak_arens_space_topology) ~NEG}
  near         (Manner e0 rarely) ~ (Member e0 use) ~NEG   [head Manner->Member; arg1 rarely->use; polarity]
  near         (Member e0 use) ~ (Theme e0 weak_arens_space_topology) ~NEG   [head Member->Theme; arg1 use->weak_arens_space_topology; polarity]
  A only       (Member x0 weak_arens_space_topology) (Theme e0 x0)
group 2        anchors banach_mackey_topology
  A            {(Manner e1 rarely) (Member e1 use) (Member x1 banach_mackey_topology) (Theme e1 x1)}
  B            {(Member e1 use) ~NEG (Theme e1 banach_mackey_topology) ~NEG}
  near         (Manner e1 rarely) ~ (Member e1 use) ~NEG   [head Manner->Member; arg1 rarely->use; polarity]
  near         (Member e1 use) ~ (Theme e1 banach_mackey_topology) ~NEG   [head Member->Theme; arg1 use->banach_mackey_topology; polarity]
  A only       (Member x1 banach_mackey_topology) (Theme e1 x1)
residue A      —
residue B      {(Inheritance weak_arens_space_topology weak)}@weak_arens_space_topology
```

### pairC-0004 · tierC-000007 ↔ tierC-000008 · quality 0.73 · common 8 · aligned 1 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: At the executive level , EEAA represents the central arm of the Ministry .
B: At executive level , EEAA represents the central arm of the ministry .

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Agent e0 eeaa) (At e0 executive_level) (Inheritance executive_level executive) (Inheritance executive_level level) (Member e0 represent) (Member x1 ministry) (PartOf x0 x1) (Theme e0 x0)
group 1        anchors x0
  A            {(Inheritance central_arm arm) (Inheritance central_arm central) (Member x0 central_arm)}
  B            {(Member x0 arm)} {(Member x0 central)}
  partial      (Inheritance central_arm central) ~ (Member x0 central)   [head Inheritance->Member; arg0 central_arm->x0]
  near         (Member x0 central_arm) ~ (Member x0 arm)   [arg1 central_arm->arm]
  A only       (Inheritance central_arm arm)
residue A      —
residue B      —
```

### pairC-0005 · tierC-000009 ↔ tierC-000010 · quality 0.75 · common 12 · aligned 0 near + 1 partial · leftover 3 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The film is a first Syrian nominated film , produced and destined for Oscar .
B: The film is a first Syrian nominated film produced and directed for Oscar .

```
renaming a->b  e0->e1 e1->e2 x0->x0
common         (For e0 oscar) (Inheritance syrian_film film) (Inheritance syrian_film syrian) (Member e0 produce) (Member e1 nominate) (Member x0 film) (Member x0 syrian_film) (Ordinal x0 1 nominate) (Past e0) (Past e1) (Patient e0 x0) (Theme e1 x0)
group 1        anchors x0
  A            {(For x0 oscar)}
  B            {(For e0' oscar) (Member e0' direct) (Past e0') (Patient e0' x0)}
  partial      (For x0 oscar) ~ (For e0' oscar)   [arg0 x0->e0']
  B only       (Member e0' direct) (Past e0') (Patient e0' x0)
residue A      {(Member x0 destined)}@x0
residue B      —
```

### pairC-0006 · tierC-000011 ↔ tierC-000012 · quality 0.67 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 0 / 0

A: Cameron changed his mind when Horner presented him with the song .
B: Cameron changed his mind when Horner presented the song to him .

```
renaming a->b  e0->e0 e1->e1 x1->x0
common         (Agent e0 cameron) (Agent e1 horner) (Member e1 present) (Member x1 song) (Past e0) (Past e1) (Recipient e1 cameron) (Theme e1 x1)
group 1        anchors e0
  A            {(Member e0 change)}
  B            {(Member e0 change_mind)}
  near         (Member e0 change) ~ (Member e0 change_mind)   [arg1 change->change_mind]
residue A      {(Member x0 mind) (PartOf x0 cameron) (Patient e0 x0)}@e0
residue B      —
```

### pairC-0007 · tierC-000013 ↔ tierC-000014 · quality 0.62 · common 8 · aligned 0 near + 2 partial · leftover 2 · residue A 3 subgraph(s) / 3 atom(s), B 1 / 1

A: He was also a highly celebrated warrior in popular culture and traditional Chinese dramas .
B: He was also a highly celebrated warrior in popular culture and the traditional Chinese dramas .

```
renaming a->b  e0->e0 x0->x0
common         (Also warrior e0) (Experiencer e0 x0) (In e0 popular_culture) (Member e0 warrior) (Member x0 person) (Past (Member x0 celebrated)) (Past (Member x0 warrior)) (Past e0)
group 1        anchors e0
  A            {(In e0 traditional_chinese_drama) (Inheritance traditional_chinese_drama drama)}
  B            {(GroupOf x1' chinese_drama) (In e0 x1') (Inheritance chinese_drama chinese) (Inheritance chinese_drama drama)}
  partial      (In e0 traditional_chinese_drama) ~ (In e0 x1')   [arg1 traditional_chinese_drama->x1']
  partial      (Inheritance traditional_chinese_drama drama) ~ (Inheritance chinese_drama drama)   [arg0 traditional_chinese_drama->chinese_drama]
  B only       (GroupOf x1' chinese_drama) (Inheritance chinese_drama chinese)
residue A      {(Degree e0 celebrated highly)}@e0 {(Inheritance popular_culture culture)}@popular_culture {(Member e0 celebrated)}@e0
residue B      {(Past (Degree x0 celebrated highly))}@x0
```

### pairC-0008 · tierC-000015 ↔ tierC-000016 · quality 0.20 · common 1 · aligned 0 near + 3 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Rotunda River is a tributary of the Purul River in Romania .
B: The River Rotunda is a tributary of the Purul River in Romania .

```
renaming a->b  
common         (Member purul_river river)
group 1        anchors purul_river
  A            {(LocatedIn rotunda_river romania) (Member rotunda_river river) (Member rotunda_river tributary) (Possession rotunda_river purul_river)}
  B            {(LocatedIn purul_river romania)} {(Member river_rotunda river) (Member river_rotunda tributary) (PartOf river_rotunda purul_river)}
  partial      (LocatedIn rotunda_river romania) ~ (LocatedIn purul_river romania)   [arg0 rotunda_river->purul_river]
  partial      (Member rotunda_river river) ~ (Member river_rotunda river)   [arg0 rotunda_river->river_rotunda]
  partial      (Member rotunda_river tributary) ~ (Member river_rotunda tributary)   [arg0 rotunda_river->river_rotunda]
  A only       (Possession rotunda_river purul_river)
  B only       (PartOf river_rotunda purul_river)
residue A      —
residue B      —
```

### pairC-0009 · tierC-000017 ↔ tierC-000018 · quality 0.71 · common 10 · aligned 3 near + 0 partial · leftover 1 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potential partner .
B: Her family contacted Corentin Rahier , whom Muriel Zazoui suggested as a potential partner .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1 x2->x2
common         (Agent e1 x0) (As e0 x1) (Member e0 suggest) (Member e1 contact) (Member x0 family) (Member x2 person) (Past e0) (Past e1) (Possession x0 x2) (Theme e1 corentin_rahier)
group 1        anchors e0
  A            {(Agent e0 corentin_rahier)}
  B            {(Agent e0 muriel_zazoui)}
  near         (Agent e0 corentin_rahier) ~ (Agent e0 muriel_zazoui)   [arg1 corentin_rahier->muriel_zazoui]
group 2        anchors x1
  A            {(Member x1 partner)}
  B            {(Inheritance potential_partner partner) (Member x1 potential_partner)}
  near         (Member x1 partner) ~ (Member x1 potential_partner)   [arg1 partner->potential_partner]
  B only       (Inheritance potential_partner partner)
group 3        anchors e0
  A            {(Theme e0 muriel_zazoui)}
  B            {(Theme e0 corentin_rahier)}
  near         (Theme e0 muriel_zazoui) ~ (Theme e0 corentin_rahier)   [arg1 muriel_zazoui->corentin_rahier]
residue A      {(Member x1 potential)}@x1
residue B      —
```

### pairC-0010 · tierC-000019 ↔ tierC-000020 · quality 0.73 · common 8 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: This all leads to a big cat fight during the large homecoming game .
B: All this leads to a big cat fight during the great homecoming game .

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (During x1 x2) (Inheritance homecoming_game game) (Member e0 lead) (Member x0 thing) (Member x1 big) (Member x1 cat_fight) (Member x2 homecoming_game)
group 1        anchors x2
  A            {(Member x2 large)}
  B            {(Member x2 great)}
  near         (Member x2 large) ~ (Member x2 great)   [arg1 large->great]
group 2        anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Goal e0 x1)}
  near         (Theme e0 x1) ~ (Goal e0 x1)   [head Theme->Goal]
residue A      —
residue B      {(Inheritance cat_fight fight)}@cat_fight
```

### pairC-0011 · tierC-000021 ↔ tierC-000022 · quality 0.09 · common 1 · aligned 3 near + 2 partial · leftover 6 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1 · 2 renamings tied

A: The task of philosophy is to clarify the empirical relationships of logical phrases .
B: The task of philosophy is to clarify the empirical relationships of logical propositions .

```
renaming a->b  e0->e0 x0->x0
common         (Member e0 clarify)
group 1        anchors e0
  A            {(Agent e0 x0) (Member x0 task) (Possession x0 philosophy)} {(GroupOf x1 empirical_relationship) (Inheritance empirical_relationship empirical) (Inheritance empirical_relationship relationship) (Inheritance logical_phrase logical) (Inheritance logical_phrase phrase) (Possession x1 logical_phrase) (Theme e0 x1)}
  B            {(GroupOf x0 relationship) (Inheritance logical_proposition logical) (Inheritance logical_proposition proposition) (Patient e0 x0) (Possession x0 logical_proposition)} {(Member e0 task)}
  near         (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  partial      (Inheritance logical_phrase logical) ~ (Inheritance logical_proposition logical)   [arg0 logical_phrase->logical_proposition]
  near         (Member x0 task) ~ (GroupOf x0 relationship)   [head Member->GroupOf; arg1 task->relationship]
  near         (Possession x0 philosophy) ~ (Possession x0 logical_proposition)   [arg1 philosophy->logical_proposition]
  partial      (Theme e0 x1) ~ (Member e0 task)   [head Theme->Member; arg1 x1->task]
  A only       (GroupOf x1 empirical_relationship) (Inheritance empirical_relationship empirical) (Inheritance empirical_relationship relationship) (Inheritance logical_phrase phrase) (Possession x1 logical_phrase)
  B only       (Inheritance logical_proposition proposition)
residue A      —
residue B      {(Possession e0 philosophy)}@e0
```

### pairC-0012 · tierC-000023 ↔ tierC-000024 · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Oates had been the last person to speak to Harvey .
B: Oates had been the last to speak to Harvey .

```
renaming a->b  e0->e0
common         (Agent e0 oates) (Member e0 speak) (Ordinal oates last speak) (Past e0) (Recipient e0 harvey)
residue A      {(Past (Member oates person))}@oates
residue B      —
```

### pairC-0013 · tierC-000025 ↔ tierC-000026 · quality 0.88 · common 23 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Some indigenous Americans and European-American settlers began to create a community around the post .
B: Some Native Americans and European-American settlers began to create a community around the post .

```
renaming a->b  e0->e0 e1->e1 e2->e2 e3->e3 x0->x0 x1->x1 x2->x2 x3->x3
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

### pairC-0014 · tierC-000027 ↔ tierC-000028 · quality 0.20 · common 1 · aligned 0 near + 3 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The River Frasin is a tributary of the Straja River in Romania .
B: The Frasin River is a tributary of the Straja River in Romania .

```
renaming a->b  
common         (Member straja_river river)
group 1        anchors straja_river
  A            {(LocatedIn river_frasin romania) (Member river_frasin river) (Member river_frasin tributary) (PartOf river_frasin straja_river)}
  B            {(LocatedIn straja_river romania)} {(Member frasin_river river) (Member frasin_river tributary) (Possession frasin_river straja_river)}
  partial      (LocatedIn river_frasin romania) ~ (LocatedIn straja_river romania)   [arg0 river_frasin->straja_river]
  partial      (Member river_frasin river) ~ (Member frasin_river river)   [arg0 river_frasin->frasin_river]
  partial      (Member river_frasin tributary) ~ (Member frasin_river tributary)   [arg0 river_frasin->frasin_river]
  A only       (PartOf river_frasin straja_river)
  B only       (Possession frasin_river straja_river)
residue A      —
residue B      —
```

### pairC-0015 · tierC-000029 ↔ tierC-000030 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Blair hopes to stop Drake at the race .
B: Blair next hopes to stop Drake at the race .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 blair) (Member e0 hope) (Member x0 race) (Theme e0 (And (Agent x1 blair) (Location x1 x0) (Member x1 stop) (Theme x1 drake)))
residue A      —
residue B      —
```

### pairC-0016 · tierC-000031 ↔ tierC-000032 · quality 0.75 · common 6 · aligned 0 near + 1 partial · leftover 1 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Methoni is a village and a former municipality in Pieria regional unit , Greece .
B: Methoni is a village and a former municipality in the Pieria regional unit , Greece .

```
renaming a->b  
common         (Inheritance regional_unit regional) (Inheritance regional_unit unit) (LocatedIn methoni pieria) (LocatedIn pieria greece) (Member methoni village) (Member pieria regional_unit)
group 1        anchors methoni
  A            {(Member methoni municipality) ~NEG}
  B            {(Inheritance former_municipality municipality) (Member methoni former_municipality)}
  partial      (Member methoni municipality) ~NEG ~ (Member methoni former_municipality)   [arg1 municipality->former_municipality; polarity]
  B only       (Inheritance former_municipality municipality)
residue A      {(Past (Member methoni municipality))}@methoni
residue B      —
```

### pairC-0017 · tierC-000033 ↔ tierC-000034 · quality 0.38 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 3 subgraph(s) / 5 atom(s), B 2 / 3

A: The leader of the geological party was his old mentor Mike Morton .
B: The geological party leader was his old mentor , Mike Morton .

```
renaming a->b  x1->x0
common         (Member x1 person) (Past (Member mike_morton mentor)) (Past (Member mike_morton old))
residue A      {(Member x0 geological) (Member x0 party) (Past (Possession mike_morton x0))}@mike_morton {(Past (Member mike_morton leader))}@mike_morton {(Past (Possession mike_morton x1))}@mike_morton,x1
residue B      {(Inheritance geological_party_leader leader) (Past (Member mike_morton geological_party_leader))}@mike_morton {(Possession mike_morton x1)}@mike_morton,x1
```

### pairC-0018 · tierC-000035 ↔ tierC-000036 · quality 0.80 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Then Tommy tells him who Tyrone is .
B: Tommy then tells him who Tyrone is .

```
renaming a->b  e0->e0 x0->x0
common         (Member e0 tell) (Member x0 person) (Recipient e0 x0) (Theme e0 (Question who (Member tyrone who)))
group 1        anchors e0
  A            {(Experiencer e0 tommy)}
  B            {(Agent e0 tommy)}
  near         (Experiencer e0 tommy) ~ (Agent e0 tommy)   [head Experiencer->Agent]
residue A      —
residue B      —
```

### pairC-0019 · tierC-000037 ↔ tierC-000038 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Kayalar is a village connected to the Giresun district of the province of Tirebolu .
B: Kayalar is a village connected to the Giresun district of Tirebolu province .

```
renaming a->b  e0->e0
common         (Goal e0 giresun) (LocatedIn giresun tirebolu) (Member e0 connect) (Member giresun district) (Member kayalar village) (Member tirebolu province) (Theme e0 kayalar)
residue A      —
residue B      —
```

### pairC-0020 · tierC-000039 ↔ tierC-000040 · quality 0.11 · common 1 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 8

A: While prostitution is illegal in Canada , most activities related to prostitution are legal .
B: While prostitution in Canada is illegal , most of the activities related to prostitution are legal .

```
renaming a->b  
common         (ConditionalProperty prostitution illegal canada)
residue A      —
residue B      {(Experiencer e0' x0') (GroupOf x0' activity) (GroupOf x1' activity) (Inheritance x1' legal) (Member e0' relate) (ProportionOf x1' x0' most) (SubsetOf x1' x0') (To e0' prostitution)}@prostitution
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

### pairC-0023 · tierC-000045 ↔ tierC-000046 · quality 0.73 · common 11 · aligned 2 near + 0 partial · leftover 3 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The company built a hotel in Eskisehir in Turkey and a paper factory in Kazakhstan .
B: In Eskisehir , the company built a hotel in Turkey and a paper mill in Kazakhstan .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Agent e1 x0) (Location e0 kazakhstan) (Member e0 build) (Member e1 build) (Member x0 company) (Member x1 hotel) (Past e0) (Past e1) (Patient e0 x2) (Patient e1 x1)
group 1        anchors x2
  A            {(Inheritance paper_factory factory) (Member x2 paper_factory)}
  B            {(Inheritance paper_mill mill) (Member x2 paper_mill)}
  near         (Member x2 paper_factory) ~ (Member x2 paper_mill)   [arg1 paper_factory->paper_mill]
  A only       (Inheritance paper_factory factory)
  B only       (Inheritance paper_mill mill)
group 2        anchors e1
  A            {(LocatedIn eskisehir turkey) (Location e1 eskisehir)}
  B            {(Location e1 turkey)}
  near         (Location e1 eskisehir) ~ (Location e1 turkey)   [arg1 eskisehir->turkey]
  A only       (LocatedIn eskisehir turkey)
residue A      —
residue B      {(LocatedIn x0 eskisehir)}@x0
```

### pairC-0024 · tierC-000047 ↔ tierC-000048 · quality 0.82 · common 14 · aligned 2 near + 0 partial · leftover 1 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0 · 2 renamings tied

A: He spent his exile in France and preached Gareccio in Italy where he preached .
B: He spent his exile in France and in Italy preached Gareccio , where he preached .

```
renaming a->b  e0->e0 e1->e2 e2->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x0) (Location e2 france) (Member e0 preach) (Member e1 preach) (Member e2 spend) (Member x0 person) (Member x1 exile) (Past e0) (Past e1) (Past e2) (Possession x1 x0) (Theme e2 x1)
group 1        anchors e0 e1
  A            {(Location e0 italy)} {(Location e1 italy)}
  B            {(LocatedIn gareccio italy) (Location e0 gareccio) (Location e1 gareccio)}
  near         (Location e0 italy) ~ (Location e0 gareccio)   [arg1 italy->gareccio]
  near         (Location e1 italy) ~ (Location e1 gareccio)   [arg1 italy->gareccio]
  B only       (LocatedIn gareccio italy)
residue A      {(Theme e0 gareccio)}@e0
residue B      —
```

### pairC-0026 · tierC-000051 ↔ tierC-000052 · quality 0.00 · common 0 · aligned 0 near + 4 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Olt River is a right tributary of the Madicea River in Romania .
B: The river Olt is a tributary of the river Madicea in Romania .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(Inheritance right_tributary right) (Inheritance right_tributary tributary) (LocatedIn olt_river romania) (Member madicea_river river) (Member olt_river right_tributary) (Member olt_river river) (Possession olt_river madicea_river)}
  B            {(LocatedIn madicea romania) (Member madicea river) (Member olt river) (Member olt tributary) (PartOf olt madicea)}
  partial      (Inheritance right_tributary tributary) ~ (Member olt tributary)   [head Inheritance->Member; arg0 right_tributary->olt]
  partial      (LocatedIn olt_river romania) ~ (LocatedIn madicea romania)   [arg0 olt_river->madicea]
  partial      (Member madicea_river river) ~ (Member madicea river)   [arg0 madicea_river->madicea]
  partial      (Member olt_river river) ~ (Member olt river)   [arg0 olt_river->olt]
  A only       (Inheritance right_tributary right) (Member olt_river right_tributary) (Possession olt_river madicea_river)
  B only       (PartOf olt madicea)
residue A      —
residue B      —
```

### pairC-0027 · tierC-000053 ↔ tierC-000054 · quality 0.40 · common 4 · aligned 0 near + 2 partial · leftover 6 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He serves as President of the New York Stock Exchange , including the NYSE Group .
B: He serves as the president of the NYSE Group , including the New York Stock Exchange .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 serve) (Member nyse_group group) (Member x0 person)
group 1        anchors nyse_group x0
  A            {(Member new_york_stock_exchange exchange) (PartOf nyse_group new_york_stock_exchange) (Possession x0 new_york_stock_exchange)}
  B            {(Inheritance stock_exchange exchange) (Member new_york_stock_exchange stock_exchange) (PartOf new_york_stock_exchange nyse_group)}
  partial      (Member new_york_stock_exchange exchange) ~ (Member new_york_stock_exchange stock_exchange)   [arg1 exchange->stock_exchange]
  A only       (PartOf nyse_group new_york_stock_exchange) (Possession x0 new_york_stock_exchange)
  B only       (Inheritance stock_exchange exchange) (PartOf new_york_stock_exchange nyse_group)
group 2        anchors e0 nyse_group x0
  A            {(Member x0 president)}
  B            {(As e0 x1') (Member x1' president) (Possession x1' nyse_group)}
  partial      (Member x0 president) ~ (Member x1' president)   [arg0 x0->x1']
  B only       (As e0 x1') (Possession x1' nyse_group)
residue A      —
residue B      —
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

### pairC-0029 · tierC-000057 ↔ tierC-000058 · quality 0.60 · common 3 · aligned 0 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Pustnic River or Orociu River is a tributary of the Oraciu River in Romania .
B: The Pustnic River or Orociu River is a tributary of the River Oraciu in Romania .

```
renaming a->b  
common         (LocatedIn pustnic_river romania) (Member pustnic_river river) (Member pustnic_river tributary)
group 1        anchors pustnic_river
  A            {(Member oraciu_river river) (PartOf pustnic_river oraciu_river)}
  B            {(Member river_oraciu river) (PartOf pustnic_river river_oraciu)}
  partial      (Member oraciu_river river) ~ (Member river_oraciu river)   [arg0 oraciu_river->river_oraciu]
  partial      (PartOf pustnic_river oraciu_river) ~ (PartOf pustnic_river river_oraciu)   [arg1 oraciu_river->river_oraciu]
residue A      —
residue B      —
```

### pairC-0030 · tierC-000059 ↔ tierC-000060 · quality 0.67 · common 6 · aligned 0 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Cranoe is a small village and civil community in the district of Harborough Leicestershire , England .
B: Cranoe is a small village and civil parish in the Harborough district of Leicestershire , England .

```
renaming a->b  
common         (LocatedIn cranoe harborough) (LocatedIn harborough leicestershire) (LocatedIn leicestershire england) (Member cranoe small) (Member cranoe village) (Member harborough district)
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

### pairC-0031 · tierC-000061 ↔ tierC-000062 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It was believed that true philosophy could be separated from popular wisdom by this method .
B: It was believed by this method true philosophy could be separated from popular wisdom .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Inheritance popular_wisdom popular) (Inheritance popular_wisdom wisdom) (Inheritance true_philosophy philosophy) (Inheritance true_philosophy true) (Member e0 believe) (Member x0 method) (Past e0)
group 1        anchors e0 popular_wisdom true_philosophy x0
  A            {(Theme e0 (And (Agent x1 x0) (Can x1) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy)))}
  B            {(Theme e0 (And (Can x1) (Instrument x1 x0) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy)))}
  near         (Theme e0 (And (Agent x1 x0) (Can x1) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy))) ~ (Theme e0 (And (Can x1) (Instrument x1 x0) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy)))   [arg1 (And (Agent x1 x0) (Can x1) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy))->(And (Can x1) (Instrument x1 x0) (Member x1 separate) (Source x1 popular_wisdom) (Theme x1 true_philosophy))]
residue A      —
residue B      —
```

### pairC-0032 · tierC-000063 ↔ tierC-000064 · quality 0.71 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Lake Sammamish enters the Issaquah Creek park .
B: Lake Sammamish enters Issaquah Creek in the park .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 lake_sammamish) (Member e0 enter) (Member issaquah_creek creek) (Member lake_sammamish lake) (Member x0 park)
group 1        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Location e0 x0)}
  near         (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
residue A      {(LocatedIn x0 issaquah_creek)}@issaquah_creek,x0
residue B      {(Theme e0 issaquah_creek)}@e0,issaquah_creek
```

### pairC-0035 · tierC-000069 ↔ tierC-000070 · quality 0.62 · common 5 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 2 / 2

A: The reduced speed limit is generally , posted as low as within the two cities .
B: The reduced speed limit is generally as low as within the two cities .

```
renaming a->b  x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 city) (Inheritance speed_limit limit) (Member x1 reduced) (Member x1 speed_limit)
group 1        anchors x0 x1
  A            {(Location e0 x0) (Member e0 post) (Theme e0 x1)}
  B            {(LocatedIn x1 x0)}
  partial      (Location e0 x0) ~ (LocatedIn x1 x0)   [head Location->LocatedIn; arg0 e0->x1]
  A only       (Member e0 post) (Theme e0 x1)
residue A      —
residue B      {(Degree x1 low generally)}@x1 {(Member x1 low)}@x1
```

### pairC-0036 · tierC-000071 ↔ tierC-000072 · quality 0.71 · common 10 · aligned 0 near + 2 partial · leftover 3 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: With the help of Karen , he builds the horn and takes the identity of Herald .
B: With the help of Karen , he built the horn and takes the identity of Herald .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x2 x2->x3
common         (Agent e0 x0) (Agent e1 x0) (Member e0 take) (Member e1 build) (Member x0 person) (Member x1 horn) (Member x2 identity) (Patient e1 x1) (Possession x2 herald) (Theme e0 x2)
group 1        anchors e0 e1
  A            {(Agent e2 karen) (Instrument e0 e2) (Instrument e1 e2) (Member e2 help)}
  B            {(Instrument e1 x1') (Member x1' help) (Of x1' karen)}
  partial      (Instrument e1 e2) ~ (Instrument e1 x1')   [arg1 e2->x1']
  partial      (Member e2 help) ~ (Member x1' help)   [arg0 e2->x1']
  A only       (Agent e2 karen) (Instrument e0 e2)
  B only       (Of x1' karen)
residue A      —
residue B      {(Past e1)}@e1
```

### pairC-0037 · tierC-000073 ↔ tierC-000074 · quality 0.83 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1 · 6 renamings tied

A: For a number of reasons , some recombinant colonies can not contain the desired white plasmid .
B: Some recombinant colonies may not contain the desired white plasmid for a number of reasons .

```
renaming a->b  x0->x0 x1->x1 x2->x2 x3->x3
common         (Inheritance recombinant_colony colony) (Inheritance recombinant_colony recombinant) (Member x3 desired) (Member x3 plasmid) (Member x3 white)
residue A      {(And (Agent x0 x1) (Can x0) (For x0 x2) (GroupOf x1 recombinant_colony) (GroupOf x2 reason) (Member x0 contain) (Theme x0 x3)) ~NEG}@recombinant_colony,x3
residue B      {(And (Agent x0 x1) (CardinalityPhrase x2 "a number of") (For x0 x2) (GroupOf x1 recombinant_colony) (GroupOf x2 reason) (Member x0 contain) (Might x0) (Theme x0 x3)) ~NEG}@recombinant_colony,x3
```

### pairC-0038 · tierC-000075 ↔ tierC-000076 · quality 0.64 · common 7 · aligned 2 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 2 / 2

A: Margaret Fleming married James of Barrochan and was succeeded by Alexander , his eldest son .
B: Margaret Fleming married James of Barrochan and was followed by Alexander , his eldest son .

```
renaming a->b  e0->e1 e1->e0
common         (Agent e0 alexander) (Agent e1 margaret_fleming) (Member e1 marry) (Past (Member alexander son)) (Past e0) (Past e1) (Theme e0 margaret_fleming)
group 1        anchors e1
  A            {(Agent e1 james_of_barrochan)}
  B            {(Theme e1 james_of_barrochan)}
  near         (Agent e1 james_of_barrochan) ~ (Theme e1 james_of_barrochan)   [head Agent->Theme]
group 2        anchors e0
  A            {(Member e0 succeed)}
  B            {(Member e0 follow)}
  near         (Member e0 succeed) ~ (Member e0 follow)   [arg1 succeed->follow]
residue A      {(Most old alexander son)}@alexander {(Possession alexander james_of_barrochan)}@alexander
residue B      {(Past (Most old alexander son))}@alexander {(Past (Possession alexander james_of_barrochan))}@alexander
```

### pairC-0039 · tierC-000077 ↔ tierC-000078 · quality 0.56 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 2 / 2

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
residue A      {(Past (Member james_david_edgar spokesman))}@james_david_edgar {(Past (Member thomas_bain spokesman))}@thomas_bain
residue B      {(Past (Member james_david_edgar speaker))}@james_david_edgar {(Past (Member thomas_bain speaker))}@thomas_bain
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
common         (Inheritance regional_unit regional) (Inheritance regional_unit unit) (LocatedIn elati kozani) (LocatedIn kozani greece) (Member elati village) (Member kozani regional_unit)
residue A      —
residue B      —
```

### pairC-0042 · tierC-000083 ↔ tierC-000084 · quality 1.00 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Those who miss it thus often completely quote the third and fourth lines .
B: Therefore , those who miss it often quote the third and fourth lines completely .

```
renaming a->b  x0->x0 x1->x2 x2->x1
common         (Member x0 thing) (Member x1 line) (Member x2 line) (Ordinal x1 3 line) (Ordinal x2 4 line)
residue A      —
residue B      —
```

### pairC-0043 · tierC-000085 ↔ tierC-000086 · quality 0.33 · common 2 · aligned 0 near + 1 partial · leftover 4 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Thomas Fothergill was an academic English administrator at the University of Oxford .
B: Thomas Fothergill D.D . was an academic English administrator at the University of Oxford .

```
renaming a->b  
common         (Member university_of_oxford university) (Past (LocatedIn thomas_fothergill university_of_oxford))
group 1        anchors thomas_fothergill
  A            {(Inheritance academic_administrator academic) (Inheritance academic_administrator administrator) (Past (Member thomas_fothergill academic_administrator))}
  B            {(Inheritance english_administrator administrator) (Inheritance english_administrator english) (Past (Member thomas_fothergill english_administrator))}
  partial      (Inheritance academic_administrator administrator) ~ (Inheritance english_administrator administrator)   [arg0 academic_administrator->english_administrator]
  A only       (Inheritance academic_administrator academic) (Past (Member thomas_fothergill academic_administrator))
  B only       (Inheritance english_administrator english) (Past (Member thomas_fothergill english_administrator))
residue A      {(Past (Member thomas_fothergill english))}@thomas_fothergill
residue B      {(Past (Member thomas_fothergill academic))}@thomas_fothergill
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
renaming a->b  e0->e0 e1->e1
common         (Agent e0 mie_sonozaki) (Agent e1 kari_wahlgren) (In e0 japanese) (In e1 english) (Past e0) (Past e1) (Theme e0 ashe) (Theme e1 ashe)
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

### pairC-0048 · tierC-000095 ↔ tierC-000096 · quality 0.77 · common 10 · aligned 1 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The region was then followed by the Muslim house of Arakkal , ruled by Tipu Sultan .
B: The region was followed by the Muslim house of Arakkal , ruled by Tipu Sultan .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 tipu_sultan) (Member e0 follow) (Member e1 rule) (Member x1 region) (Past e0) (Past e1) (Possession x0 arakkal) (Theme e0 x1) (Theme e1 x0)
group 1        anchors x0
  A            {(Member x0 house)} {(Member x0 muslim)}
  B            {(Inheritance muslim_house house) (Inheritance muslim_house muslim) (Member x0 muslim_house)}
  near         (Member x0 house) ~ (Member x0 muslim_house)   [arg1 house->muslim_house]
  partial      (Member x0 muslim) ~ (Inheritance muslim_house muslim)   [head Member->Inheritance; arg0 x0->muslim_house]
  B only       (Inheritance muslim_house house)
residue A      —
residue B      —
```

### pairC-0049 · tierC-000097 ↔ tierC-000098 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It is widespread in Europe but is never as common as L. sponsa .
B: It is widespread in Europe , but it is never as common as L. sponsa .

```
renaming a->b  e0->e0 x0->x0
common         (But e0 (SameDegree common x0 l_sponsa)) (Experiencer e0 x0) (Location e0 europe) (Member e0 widespread) (Member x0 thing) (Member x0 widespread) (SameDegree common x0 l_sponsa) ~NEG
residue A      —
residue B      —
```

### pairC-0050 · tierC-000099 ↔ tierC-000100 · quality 0.60 · common 6 · aligned 3 near + 0 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: He dissolved William Ewer as Governor and was replaced by Peter Gaussen .
B: He replaced William Ewer as Governor and was succeeded by Peter Gaussen .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 x0) (Agent e1 peter_gaussen) (Member x0 person) (Past e0) (Past e1) (Theme e1 x0)
group 1        anchors e0
  A            {(Member e0 dissolve)}
  B            {(Member e0 replace)}
  near         (Member e0 dissolve) ~ (Member e0 replace)   [arg1 dissolve->replace]
group 2        anchors e1
  A            {(Member e1 replace)}
  B            {(Member e1 succeed)}
  near         (Member e1 replace) ~ (Member e1 succeed)   [arg1 replace->succeed]
group 3        anchors e0
  A            {(Member william_ewer governor) (Patient e0 william_ewer)}
  B            {(As e0 governor)}
  near         (Patient e0 william_ewer) ~ (As e0 governor)   [head Patient->As; arg1 william_ewer->governor]
  A only       (Member william_ewer governor)
residue A      —
residue B      {(Theme e0 william_ewer)}@e0
```

### pairC-0051 · tierC-000101 ↔ tierC-000102 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: In physics equipotential ellipsoids appear as confocal surfaces .
B: Equipotential ellipsoids appear in the physics as confocal surfaces .

```
renaming a->b  
common         (Inheritance confocal_surface confocal) (Inheritance confocal_surface surface) (Inheritance equipotential_ellipsoid ellipsoid) (Inheritance equipotential_ellipsoid equipotential)
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

### pairC-0053 · tierC-000105 ↔ tierC-000106 · quality 0.57 · common 4 · aligned 1 near + 1 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: East Coast Railway is one of the three divisions of Khurda Road .
B: The East Coast Railway is one of three departments of Khurda Road .

```
renaming a->b  x0->x0
common         (Cardinality x0 3) (Member east_coast_railway railway) (PartOf east_coast_railway x0) (PartOf x0 khurda_road)
group 1        anchors x0
  A            {(GroupOf x0 division)}
  B            {(GroupOf x0 department)}
  near         (GroupOf x0 division) ~ (GroupOf x0 department)   [arg1 division->department]
group 2        anchors east_coast_railway
  A            {(Member east_coast_railway division)}
  B            {(Member east_coast_railway department)}
  partial      (Member east_coast_railway division) ~ (Member east_coast_railway department)   [arg1 division->department]
residue A      {(Member khurda_road road)}@khurda_road
residue B      —
```

### pairC-0054 · tierC-000107 ↔ tierC-000108 · quality 0.50 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 5

A: Ralph encouraged Maurice in mathematics and chess play .
B: Ralph encouraged Maurice in mathematics and chess .

```
renaming a->b  e0->e1
common         (Agent e0 ralph) (In e0 mathematics) (Member e0 encourage) (Past e0) (Theme e0 maurice)
residue A      {(In e0 chess_play) (Inheritance chess_play play)}@e0
residue B      {(Agent e0' ralph) (In e0' chess) (Member e0' encourage) (Past e0') (Theme e0' maurice)}
```

### pairC-0055 · tierC-000109 ↔ tierC-000110 · quality 0.91 · common 10 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It was not long after Wyman joined the group that Watts took over the drums .
B: It was not long after Wyman joined the group when Watts took over the drums .

```
renaming a->b  e0->e0 e1->e1 x0->x1 x1->x0
common         (Agent e0 wyman) (Agent e1 watts) (Before e0 e1) (Member e0 join) (Member e1 take_over) (Member x0 group) (Past e0) (Past e1) (Theme e0 x0) (Theme e1 x1)
group 1        anchors x1
  A            {(Member x1 drum)}
  B            {(GroupOf x1 drum)}
  near         (Member x1 drum) ~ (GroupOf x1 drum)   [head Member->GroupOf]
residue A      —
residue B      —
```

### pairC-0056 · tierC-000111 ↔ tierC-000112 · quality 0.73 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 2 / 2

A: In Japan it was first given on and the name was discovered .
B: In Japan it was first given up and the name was discovered .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Location e0 japan) (Member e1 discover) (Member x0 name) (Member x1 thing) (Past e0) (Past e1) (Theme e0 x1) (Theme e1 x0)
group 1        anchors e0
  A            {(Member e0 give)}
  B            {(Member e0 give_up)}
  near         (Member e0 give) ~ (Member e0 give_up)   [arg1 give->give_up]
residue A      {(Ordinal x1 1 give)}@x1
residue B      {(Location e1 japan)}@e1 {(Manner e0 first)}@e0
```

### pairC-0057 · tierC-000113 ↔ tierC-000114 · quality 0.75 · common 12 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam inherited .
B: Like many aspects of Islamic ivory , this reflects the Byzantine traditions that inherited Islam .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x2 x2->x1
common         (Agent e1 x0) (GroupOf x1 aspect) (GroupOf x2 byzantine_tradition) (Inheritance byzantine_tradition byzantine) (Inheritance byzantine_tradition tradition) (Inheritance islamic_ivory islamic) (Inheritance islamic_ivory ivory) (Like e1 x1) (Member e0 inherit) (Member e1 reflect) (Past e0) (Theme e1 x2)
group 1        anchors e0
  A            {(Agent e0 islam)}
  B            {(Theme e0 islam)}
  near         (Agent e0 islam) ~ (Theme e0 islam)   [head Agent->Theme]
group 2        anchors x0
  A            {(Member x0 thing)}
  B            {(Member x0 ivory)}
  near         (Member x0 thing) ~ (Member x0 ivory)   [arg1 thing->ivory]
group 3        anchors islamic_ivory x1
  A            {(Possession x1 islamic_ivory)}
  B            {(PartOf x1 islamic_ivory)}
  near         (Possession x1 islamic_ivory) ~ (PartOf x1 islamic_ivory)   [head Possession->PartOf]
group 4        anchors e0 x2
  A            {(Theme e0 x2)}
  B            {(Agent e0 x2)}
  near         (Theme e0 x2) ~ (Agent e0 x2)   [head Theme->Agent]
residue A      —
residue B      —
```

### pairC-0058 · tierC-000115 ↔ tierC-000116 · quality 0.69 · common 9 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 3 / 3

A: The listed buildings of Derwent Isle are a large house and a former chapel .
B: The listed buildings on Derwent Isle are a large house and a former chapel .

```
renaming a->b  x0->x0 x1->x2 x2->x1
common         (GroupOf x0 listed_building) (Inheritance listed_building building) (Inheritance listed_building listed) (LocatedIn x0 derwent_isle) (Member derwent_isle isle) (Member x2 house) (Member x2 large) (PartOf x1 x0) (PartOf x2 x0)
group 1        anchors x1
  A            {(Member x1 chapel) ~NEG}
  B            {(Member x1 chapel)}
  near         (Member x1 chapel) ~NEG ~ (Member x1 chapel)   [polarity]
residue A      {(Past (Member x1 chapel))}@x1
residue B      {(Member x1 former)}@x1 {(Member x1 listed_building)}@listed_building,x1 {(Member x2 listed_building)}@listed_building,x2
```

### pairC-0059 · tierC-000117 ↔ tierC-000118 · quality 0.60 · common 6 · aligned 1 near + 1 partial · leftover 1 · residue A 2 subgraph(s) / 2 atom(s), B 0 / 0

A: The Bhadala are entirely Muslim , and follow the traditions of the other neighbouring Sunni communities .
B: The Bhadala are exclusively Muslim and follow the traditions of the other neighbouring Sunni communities .

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (GroupOf x0 bhadala) (GroupOf x2 tradition) (Member e0 follow) (Possession x2 x1) (Theme e0 x2)
group 1        anchors x1
  A            {(GroupOf x1 community)} {(Member x1 sunni)}
  B            {(GroupOf x1 sunni_community) (Inheritance sunni_community community) (Inheritance sunni_community sunni)}
  near         (GroupOf x1 community) ~ (GroupOf x1 sunni_community)   [arg1 community->sunni_community]
  partial      (Member x1 sunni) ~ (Inheritance sunni_community sunni)   [head Member->Inheritance; arg0 x1->sunni_community]
  B only       (Inheritance sunni_community community)
residue A      {(Member x1 neighbouring)}@x1 {(Member x1 other)}@x1
residue B      —
```

### pairC-0060 · tierC-000119 ↔ tierC-000120 · quality 0.90 · common 9 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: It was designed by architect Henry L. Taylor and built by O. R. Woodcock .
B: It was designed by architect Henry L. Taylor and was built by O. R. Woodcock .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 o_r_woodcock) (Agent e1 henry_l_taylor) (Member e0 build) (Member e1 design) (Member x0 thing) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x0)
residue A      {(Past (Member henry_l_taylor architect))}@henry_l_taylor
residue B      {(Member henry_l_taylor architect)}@henry_l_taylor
```

### pairC-0061 · tierC-000121 ↔ tierC-000122 · quality 0.86 · common 12 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: He remained in Japan for three years before moving with his family back to Germany .
B: He stayed in Japan for three years before moving back with his family to Germany .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Before e1 e0) (CoAgent e0 x1) (Goal e0 germany) (Location e1 japan) (Measure e1 duration 3 year) (Member e0 move_back) (Member x0 person) (Member x1 family) (Past e0) (Past e1) (Possession x1 x0)
group 1        anchors e1 x0
  A            {(Experiencer e1 x0)}
  B            {(Agent e1 x0)}
  near         (Experiencer e1 x0) ~ (Agent e1 x0)   [head Experiencer->Agent]
group 2        anchors e1
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
renaming a->b  e0->e0 e1->e1 e2->e2 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x0) (Member e0 stab) (Member e2 curse) (Member x0 father) (Member x1 person) (Member x2 thing) (Past e0) (Past e2) (Patient e0 appius_claudius_crassus) (Possession x0 x1) (Theme e1 x2) (Theme e2 x1) (To e0 e1) (To e2 e1)
group 1        anchors e1
  A            {(Member e1 prevent)}
  B            {(Member e1 avoid)}
  near         (Member e1 prevent) ~ (Member e1 avoid)   [arg1 prevent->avoid]
residue A      —
residue B      —
```

### pairC-0063 · tierC-000125 ↔ tierC-000126 · quality 0.62 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 1

A: The bridge starts in Sweden and the tunnel in Denmark .
B: The bridge starts in Sweden and the tunnel is in Denmark .

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Experiencer e1 x1) (Location e1 sweden) (Member e1 start) (Member x0 tunnel) (Member x1 bridge)
residue A      {(Experiencer e0 x0) (Location e0 denmark) (Member e0 start)}@x0
residue B      {(LocatedIn x0 denmark)}@x0
```

### pairC-0064 · tierC-000127 ↔ tierC-000128 · quality 0.86 · common 24 · aligned 4 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: She and her sisters also performed in cafes and sang music to accompany silent films .
B: She and her sisters also appeared in cafes and sang music to accompany silent films .

```
renaming a->b  e0->e3 e1->e0 e2->e2 e3->e5 e4->e1 e5->e4 x0->x1 x1->x0
common         (Agent e0 x0) (Agent e1 x1) (Agent e2 x1) (Agent e3 x0) (Agent e4 x0) (Agent e5 x1) (GroupOf x0 sister) (Inheritance silent_film film) (Inheritance silent_film silent) (Location e2 cafe) (Location e3 cafe) (Member e0 sing) (Member e1 sing) (Member e4 accompany) (Member e5 accompany) (Member x1 person) (Past e0) (Past e1) (Past e2) (Past e3) (Possession x0 x1) (Theme e0 music) (Theme e1 music) (Theme e4 silent_film)
group 1        anchors e2 e3
  A            {(Also perform e2) (Also perform e3) (Member e2 perform) (Member e3 perform)}
  B            {(Also appear e2) (Also appear e3) (Member e2 appear) (Member e3 appear)}
  near         (Also perform e2) ~ (Also appear e2)   [arg0 perform->appear]
  near         (Also perform e3) ~ (Also appear e3)   [arg0 perform->appear]
  near         (Member e2 perform) ~ (Member e2 appear)   [arg1 perform->appear]
  near         (Member e3 perform) ~ (Member e3 appear)   [arg1 perform->appear]
residue A      —
residue B      —
```

### pairC-0065 · tierC-000129 ↔ tierC-000130 · quality 0.29 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 3 subgraph(s) / 4 atom(s), B 1 / 5

A: His parents were Sergeant Major Astrid Ingeborg Tuominen and the librarian Rudolf Mikael Friberg .
B: His parents were sergeant major Astrid Ingeborg Tuominen and librarian Rudolf Mikael Friberg .

```
renaming a->b  x0->x1
common         (Member x0 person) (Past (Member rudolf_mikael_friberg librarian))
residue A      {(Past (Member astrid_ingeborg_tuominen parent)) (Past (Possession astrid_ingeborg_tuominen x0))}@x0 {(Past (Member rudolf_mikael_friberg parent))}@rudolf_mikael_friberg {(Past (Possession rudolf_mikael_friberg x0))}@rudolf_mikael_friberg,x0
residue B      {(GroupOf x0' parent) (Past (Member astrid_ingeborg_tuominen sergeant_major)) (Past (PartOf astrid_ingeborg_tuominen x0')) (Past (PartOf rudolf_mikael_friberg x0')) (Possession x0' x0)}@rudolf_mikael_friberg,x0
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

### pairC-0067 · tierC-000133 ↔ tierC-000134 · quality 0.56 · common 5 · aligned 2 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Janmashtmi Festival is organised in the village and a mela is also celebrated .
B: Janmashtmi festival is organised in the village and a Mela is also celebrated .

```
renaming a->b  e0->e0 e1->e1 x0->x1 x1->x0
common         (Location e1 x1) (Member e0 celebrate) (Member e1 organise) (Member x0 mela) (Member x1 village)
group 1        anchors celebrate e0 x0
  A            {(Also x0 e0)}
  B            {(Also celebrate e0)}
  partial      (Also x0 e0) ~ (Also celebrate e0)   [arg0 x0->celebrate]
group 2        anchors e1
  A            {(Member janmashtmi_festival festival) (Patient e1 janmashtmi_festival)}
  B            {(Member janmashtmi festival) (Patient e1 janmashtmi)}
  partial      (Member janmashtmi_festival festival) ~ (Member janmashtmi festival)   [arg0 janmashtmi_festival->janmashtmi]
  near         (Patient e1 janmashtmi_festival) ~ (Patient e1 janmashtmi)   [arg1 janmashtmi_festival->janmashtmi]
group 3        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Patient e0 x0)}
  near         (Theme e0 x0) ~ (Patient e0 x0)   [head Theme->Patient]
residue A      —
residue B      —
```

### pairC-0068 · tierC-000135 ↔ tierC-000136 · quality 0.75 · common 9 · aligned 2 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: This view is usual in northern India and parts of southern India .
B: This view is common in northern India and parts of southern India .

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x3 x3->x1
common         (Experiencer e0 x0) (LocatedIn x1 x2) (LocatedIn x2 india) (LocatedIn x3 india) (Location e0 x1) (Location e0 x3) (Member x0 view) (Member x2 southern) (Member x3 northern)
group 1        anchors e0
  A            {(Member e0 usual)}
  B            {(Member e0 common)}
  near         (Member e0 usual) ~ (Member e0 common)   [arg1 usual->common]
group 2        anchors x0
  A            {(Member x0 usual)}
  B            {(Member x0 common)}
  near         (Member x0 usual) ~ (Member x0 common)   [arg1 usual->common]
residue A      {(GroupOf x1 part)}@x1
residue B      {(ProportionOf x1 x2 some)}@x1,x2
```

### pairC-0069 · tierC-000137 ↔ tierC-000138 · quality 0.62 · common 8 · aligned 2 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It is addressed by Claude Lelouch and stars Jeremy Irons and French singer Patricia Kaas .
B: It is directed by Claude Lelouch and stars Jeremy Irons and French singer Patricia Kaas .

```
renaming a->b  e0->e1 e1->e0 e2->e2 x0->x0
common         (Agent e0 x0) (Agent e1 claude_lelouch) (Agent e2 x0) (Member e0 star) (Member e2 star) (Member x0 thing) (Theme e0 jeremy_irons) (Theme e2 patricia_kaas)
group 1        anchors patricia_kaas
  A            {(Inheritance french_singer french) (Inheritance french_singer singer) (Member patricia_kaas french_singer)}
  B            {(Member patricia_kaas french)} {(Member patricia_kaas singer)}
  partial      (Inheritance french_singer singer) ~ (Member patricia_kaas singer)   [head Inheritance->Member; arg0 french_singer->patricia_kaas]
  partial      (Member patricia_kaas french_singer) ~ (Member patricia_kaas french)   [arg1 french_singer->french]
  A only       (Inheritance french_singer french)
group 2        anchors e1
  A            {(Member e1 address)}
  B            {(Member e1 direct)}
  near         (Member e1 address) ~ (Member e1 direct)   [arg1 address->direct]
group 3        anchors e1 x0
  A            {(Theme e1 x0)}
  B            {(Patient e1 x0)}
  near         (Theme e1 x0) ~ (Patient e1 x0)   [head Theme->Patient]
residue A      —
residue B      —
```

### pairC-0070 · tierC-000139 ↔ tierC-000140 · quality 0.36 · common 5 · aligned 0 near + 3 partial · leftover 8 · residue A 0 subgraph(s) / 0 atom(s), B 2 / 2

A: His nephews include actor Ranbir Kapoor and Armaan Jain and businessman Nikhil Nanda .
B: His nephews include actors Ranbir Kapoor and Armaan Jain , and businessman Nikhil Nanda .

```
renaming a->b  x0->x0 x1->x1
common         (GroupOf x0 nephew) (Member nikhil_nanda businessman) (Member ranbir_kapoor actor) (Member x1 person) (Possession x0 x1)
group 1        anchors x0
  A            {(Agent e0 x0) (Member e0 include) (Theme e0 armaan_jain)}
  B            {(Member armaan_jain actor) (Member armaan_jain nephew) (PartOf armaan_jain x0)}
  partial      (Agent e0 x0) ~ (PartOf armaan_jain x0)   [head Agent->PartOf; arg0 e0->armaan_jain]
  A only       (Member e0 include) (Theme e0 armaan_jain)
  B only       (Member armaan_jain actor) (Member armaan_jain nephew)
group 2        anchors nikhil_nanda x0
  A            {(Agent e1 x0) (Member e1 include) (Theme e1 nikhil_nanda)}
  B            {(PartOf nikhil_nanda x0)}
  partial      (Agent e1 x0) ~ (PartOf nikhil_nanda x0)   [head Agent->PartOf; arg0 e1->nikhil_nanda]
  A only       (Member e1 include) (Theme e1 nikhil_nanda)
group 3        anchors ranbir_kapoor x0
  A            {(Agent e2 x0) (Member e2 include) (Theme e2 ranbir_kapoor)}
  B            {(PartOf ranbir_kapoor x0)}
  partial      (Agent e2 x0) ~ (PartOf ranbir_kapoor x0)   [head Agent->PartOf; arg0 e2->ranbir_kapoor]
  A only       (Member e2 include) (Theme e2 ranbir_kapoor)
residue A      —
residue B      {(Member nikhil_nanda nephew)}@nikhil_nanda {(Member ranbir_kapoor nephew)}@ranbir_kapoor
```

### pairC-0071 · tierC-000141 ↔ tierC-000142 · quality 0.71 · common 5 · aligned 0 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Chittoor district , is a district in Andhra Pradesh region of the Indian state of Rayalaseema .
B: Chittoor District , is a district of Andhra Pradesh region of the Indian state of Rayalaseema .

```
renaming a->b  
common         (Inheritance indian_state indian) (Inheritance indian_state state) (LocatedIn andhra_pradesh rayalaseema) (Member andhra_pradesh region) (Member rayalaseema indian_state)
group 1        anchors andhra_pradesh
  A            {(LocatedIn chittoor andhra_pradesh) (Member chittoor district)}
  B            {(LocatedIn chittoor_district andhra_pradesh) (Member chittoor_district district)}
  partial      (LocatedIn chittoor andhra_pradesh) ~ (LocatedIn chittoor_district andhra_pradesh)   [arg0 chittoor->chittoor_district]
  partial      (Member chittoor district) ~ (Member chittoor_district district)   [arg0 chittoor->chittoor_district]
residue A      —
residue B      —
```

### pairC-0072 · tierC-000143 ↔ tierC-000144 · quality 0.14 · common 1 · aligned 0 near + 3 partial · leftover 5 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The autonomous region Xinjiang Uyghur is a river in the Yarkand River in Western China .
B: The Xinjiang Uyghur Autonomous Region is a river in the Yarkand River of western China .

```
renaming a->b  
common         (Member yarkand_river river)
group 1        anchors yarkand_river
  A            {(Inheritance autonomous_region autonomous) (Inheritance autonomous_region region) (LocatedIn xinjiang_uyghur yarkand_river) (Member xinjiang_uyghur autonomous_region) (Member xinjiang_uyghur river)}
  B            {(LocatedIn xinjiang_uyghur_autonomous_region yarkand_river) (Member xinjiang_uyghur_autonomous_region river)}
  partial      (LocatedIn xinjiang_uyghur yarkand_river) ~ (LocatedIn xinjiang_uyghur_autonomous_region yarkand_river)   [arg0 xinjiang_uyghur->xinjiang_uyghur_autonomous_region]
  partial      (Member xinjiang_uyghur river) ~ (Member xinjiang_uyghur_autonomous_region river)   [arg0 xinjiang_uyghur->xinjiang_uyghur_autonomous_region]
  A only       (Inheritance autonomous_region autonomous) (Inheritance autonomous_region region) (Member xinjiang_uyghur autonomous_region)
group 2        anchors yarkand_river
  A            {(LocatedIn yarkand_river western_china)}
  B            {(LocatedIn x0' china) (LocatedIn yarkand_river x0') (Member x0' western)}
  partial      (LocatedIn yarkand_river western_china) ~ (LocatedIn yarkand_river x0')   [arg1 western_china->x0']
  B only       (LocatedIn x0' china) (Member x0' western)
residue A      —
residue B      —
```

### pairC-0074 · tierC-000147 ↔ tierC-000148 · quality 0.47 · common 7 · aligned 1 near + 1 partial · leftover 7 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: In modern times it is mainly a recreational sport and sporting activity .
B: In modern times , it is mainly a recreational sport and competitive activity .

```
renaming a->b  e0->e0 x0->x0
common         (Experiencer e0 x0) (Inheritance recreational_sport recreational) (Inheritance recreational_sport sport) (Member e0 recreational_sport) (Member x0 recreational_sport) (Member x0 thing) (Time e0 modern_times)
group 1        anchors e0 x0
  A            {(Inheritance sporting_activity activity) (Inheritance sporting_activity sporting) (Member e0 sporting_activity) (Member x0 sporting_activity)}
  B            {(Degree x0 competitive_activity mainly) (Experiencer e1' x0) (Inheritance competitive_activity activity) (Inheritance competitive_activity competitive) (Member e1' competitive_activity) (Member x0 competitive_activity) (Time e1' modern_times)}
  partial      (Inheritance sporting_activity activity) ~ (Inheritance competitive_activity activity)   [arg0 sporting_activity->competitive_activity]
  near         (Member x0 sporting_activity) ~ (Member x0 competitive_activity)   [arg1 sporting_activity->competitive_activity]
  A only       (Inheritance sporting_activity sporting) (Member e0 sporting_activity)
  B only       (Degree x0 competitive_activity mainly) (Experiencer e1' x0) (Inheritance competitive_activity competitive) (Member e1' competitive_activity) (Time e1' modern_times)
residue A      —
residue B      {(Degree x0 recreational_sport mainly)}@recreational_sport,x0
```

### pairC-0075 · tierC-000149 ↔ tierC-000150 · quality 0.83 · common 10 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 0 / 0

A: This can occur due to autosomal dominant diseases such as hereditary hemorrhagic telangiectasia .
B: Can occur due to autosomal dominant diseases , such as hereditary hemorrhagic telangiectasia .

```
renaming a->b  e0->e0
common         (Can e0) (DueTo e0 autosomal_dominant_disease) (Inheritance autosomal_dominant_disease autosomal) (Inheritance autosomal_dominant_disease disease) (Inheritance autosomal_dominant_disease dominant) (Inheritance hereditary_hemorrhagic_telangiectasia autosomal_dominant_disease) (Inheritance hereditary_hemorrhagic_telangiectasia hemorrhagic) (Inheritance hereditary_hemorrhagic_telangiectasia hereditary) (Inheritance hereditary_hemorrhagic_telangiectasia telangiectasia) (Member e0 occur)
residue A      {(Agent e0 x0) (Member x0 thing)}@e0
residue B      —
```

### pairC-0076 · tierC-000151 ↔ tierC-000152 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Bruno Simma was in the case of LaGrand assistant to Paulus .
B: Bruno Simma was an assistant to Paulus in the LaGrand case .

```
renaming a->b  e0->e0
common         (Experiencer e0 bruno_simma) (Inheritance assistant (can assist)) (Member e0 assistant) (Member lagrand case) (Past (Member bruno_simma assistant)) (Past e0) (Recipient e0 paulus)
group 1        anchors e0 lagrand
  A            {(In e0 lagrand)}
  B            {(During e0 lagrand)}
  near         (In e0 lagrand) ~ (During e0 lagrand)   [head In->During]
residue A      —
residue B      —
```

### pairC-0077 · tierC-000153 ↔ tierC-000154 · quality 0.64 · common 7 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: In fluid mechanics , a homentropic flow has uniform and constant entropy .
B: In fluid mechanics , a homentropic current has uniform and constant entropy .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (In e0 fluid_mechanics) (Member e0 have) (Member x1 constant) (Member x1 entropy) (Member x1 uniform) (Theme e0 x1)
group 1        anchors x0
  A            {(Inheritance homentropic_flow flow) (Inheritance homentropic_flow homentropic) (Member x0 homentropic_flow)}
  B            {(Inheritance homentropic_current current) (Inheritance homentropic_current homentropic) (Member x0 homentropic_current)}
  partial      (Inheritance homentropic_flow homentropic) ~ (Inheritance homentropic_current homentropic)   [arg0 homentropic_flow->homentropic_current]
  near         (Member x0 homentropic_flow) ~ (Member x0 homentropic_current)   [arg1 homentropic_flow->homentropic_current]
  A only       (Inheritance homentropic_flow flow)
  B only       (Inheritance homentropic_current current)
residue A      —
residue B      {(Inheritance fluid_mechanics mechanics)}@fluid_mechanics
```

### pairC-0078 · tierC-000155 ↔ tierC-000156 · quality 0.14 · common 1 · aligned 0 near + 4 partial · leftover 3 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Eschenz is a municipality in Frauenfeld District in the canton of Thurgau in Switzerland .
B: Eschenz is a municipality in the district of Frauenfeld in the Canton Thurgau , Switzerland .

```
renaming a->b  
common         (Member eschenz municipality)
group 1        anchors eschenz
  A            {(LocatedIn eschenz frauenfeld_district) (LocatedIn frauenfeld_district thurgau) (LocatedIn thurgau switzerland) (Member frauenfeld_district district) (Member thurgau canton)}
  B            {(LocatedIn canton_thurgau switzerland) (LocatedIn eschenz x0') (LocatedIn x0' canton_thurgau) (Member canton_thurgau canton) (Member x0' district) (Possession x0' frauenfeld)}
  partial      (LocatedIn eschenz frauenfeld_district) ~ (LocatedIn eschenz x0')   [arg1 frauenfeld_district->x0']
  partial      (LocatedIn thurgau switzerland) ~ (LocatedIn canton_thurgau switzerland)   [arg0 thurgau->canton_thurgau]
  partial      (Member frauenfeld_district district) ~ (Member x0' district)   [arg0 frauenfeld_district->x0']
  partial      (Member thurgau canton) ~ (Member canton_thurgau canton)   [arg0 thurgau->canton_thurgau]
  A only       (LocatedIn frauenfeld_district thurgau)
  B only       (LocatedIn x0' canton_thurgau) (Possession x0' frauenfeld)
residue A      —
residue B      —
```

### pairC-0080 · tierC-000159 ↔ tierC-000160 · quality 0.92 · common 11 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It endorsed the views of the Free Soil Party and the Republican Party .
B: It supported the views of the Free Soil Party and the Republican Party .

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 view) (GroupOf x2 view) (Member free_soil_party party) (Member republican_party party) (Member x0 thing) (Past e0) (Possession x1 republican_party) (Possession x2 free_soil_party) (Theme e0 x1) (Theme e0 x2)
group 1        anchors e0
  A            {(Member e0 endorse)}
  B            {(Member e0 support)}
  near         (Member e0 endorse) ~ (Member e0 support)   [arg1 endorse->support]
residue A      —
residue B      —
```

### pairC-0081 · tierC-000161 ↔ tierC-000162 · quality 0.79 · common 11 · aligned 1 near + 0 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Incumbent George Allen ran for a third term , but lost to Democrat Robb .
B: Incumbent Republican George Allen ran for a third term , but lost to Democrat Chuck Robb .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 george_allen) (Agent e1 george_allen) (But e1 e0) (For e1 x0) (Member e0 lose) (Member e1 run) (Member x0 term) (Ordinal x0 3 term) (Past (Member george_allen incumbent)) (Past e0) (Past e1)
group 1        anchors e0
  A            {(Past (Member robb democrat)) (To e0 robb)}
  B            {(Past (Member chuck_robb democrat)) (To e0 chuck_robb)}
  near         (To e0 robb) ~ (To e0 chuck_robb)   [arg1 robb->chuck_robb]
  A only       (Past (Member robb democrat))
  B only       (Past (Member chuck_robb democrat))
residue A      —
residue B      {(Past (Member george_allen republican))}@george_allen
```

### pairC-0082 · tierC-000163 ↔ tierC-000164 · quality 0.56 · common 5 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 2 / 2

A: Technetium forms the simple complex . The potassium salt is isostructural with .
B: The simple complex forms the technetium , whose potassium salt is isostructural .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Inheritance potassium_salt salt) (Member e0 form) (Member x0 complex) (Member x0 simple) (Member x1 potassium_salt)
group 1        anchors e0
  A            {(Agent e0 technetium)}
  B            {(Patient e0 technetium)}
  near         (Agent e0 technetium) ~ (Patient e0 technetium)   [head Agent->Patient]
group 2        anchors e0 x0
  A            {(Patient e0 x0)}
  B            {(Agent e0 x0)}
  near         (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
residue A      —
residue B      {(Member x1 isostructural)}@x1 {(Possession x1 technetium)}@x1
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

### pairC-0084 · tierC-000167 ↔ tierC-000168 · quality 0.50 · common 4 · aligned 0 near + 3 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Chongqing is a district in Wanzhou district , China and the location of a former prefecture .
B: Chongqing is a district in Wanzhou District , China and the site of a former prefecture .

```
renaming a->b  x0->x0
common         (LocatedIn x0 chongqing) (Member chongqing district) (Member x0 former) (Member x0 prefecture)
group 1        anchors chongqing
  A            {(LocatedIn chongqing wanzhou) (LocatedIn wanzhou china) (Member wanzhou district)}
  B            {(LocatedIn chongqing wanzhou_district) (LocatedIn wanzhou_district china) (Member wanzhou_district district)}
  partial      (LocatedIn chongqing wanzhou) ~ (LocatedIn chongqing wanzhou_district)   [arg1 wanzhou->wanzhou_district]
  partial      (LocatedIn wanzhou china) ~ (LocatedIn wanzhou_district china)   [arg0 wanzhou->wanzhou_district]
  partial      (Member wanzhou district) ~ (Member wanzhou_district district)   [arg0 wanzhou->wanzhou_district]
residue A      —
residue B      {(Member chongqing site)}@chongqing
```

### pairC-0085 · tierC-000169 ↔ tierC-000170 · quality 0.33 · common 1 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Tuen Mun is a bay outside Castle Peak Bay .
B: Tuen Mun is a bay outside Peak Bay Castle .

```
renaming a->b  
common         (Member tuen_mun bay)
group 1        anchors tuen_mun
  A            {(Member castle_peak_bay bay) (Outside tuen_mun castle_peak_bay)}
  B            {(Member peak_bay_castle castle) (Outside tuen_mun peak_bay_castle)}
  partial      (Outside tuen_mun castle_peak_bay) ~ (Outside tuen_mun peak_bay_castle)   [arg1 castle_peak_bay->peak_bay_castle]
  A only       (Member castle_peak_bay bay)
  B only       (Member peak_bay_castle castle)
residue A      —
residue B      —
```

### pairC-0086 · tierC-000171 ↔ tierC-000172 · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Others during the expedition were Frederick William Beechy , science officer and Edward Sabine .
B: Others on the expedition were Frederick William Beechy , science officer and Edward Sabine .

```
renaming a->b  x0->x0
common         (Inheritance science_officer officer) (Past (Member frederick_william_beechy science_officer)) (Past (PartOf edward_sabine x0)) (Past (PartOf frederick_william_beechy x0))
group 1        anchors x0
  A            {(GroupOf x0 person)}
  B            {(Member x0 expedition)}
  near         (GroupOf x0 person) ~ (Member x0 expedition)   [head GroupOf->Member; arg1 person->expedition]
residue A      {(Member x1 expedition)}
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

### pairC-0089 · tierC-000177 ↔ tierC-000178 · quality 0.73 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 2 / 4

A: The story attracted widespread attention from mainstream media and social media .
B: The story attracted widespread attention from the social media and the mainstream media .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance mainstream_media mainstream) (Inheritance mainstream_media media) (Inheritance social_media media) (Inheritance social_media social) (Member e0 attract) (Member x0 story) (Member x1 attention) (Member x1 widespread) (Past e0) (Theme e0 x1)
residue A      {(Source e0 mainstream_media)}@e0,mainstream_media {(Source e0 social_media)}@e0,social_media
residue B      {(From x1 x2') (Member x2' social_media)}@social_media,x1 {(From x1 x3') (Member x3' mainstream_media)}@mainstream_media,x1
```

### pairC-0090 · tierC-000179 ↔ tierC-000180 · quality 0.38 · common 5 · aligned 1 near + 2 partial · leftover 9 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0 · 2 renamings tied

A: Sambora and lead singer Jon Bon Jovi formed the main songwriting unit for the band .
B: Sambora and lead singer Jon Bon Jovi formed the main - songwriting - unit of the band .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 sambora) (Inheritance lead_singer singer) (Member e0 form) (Member x0 band) (Past e0)
group 1        anchors e0 lead_singer x0
  A            {(Agent e0 jon_bon_jovi) (Past (Member jon_bon_jovi lead_singer))} {(Beneficiary e0 x0)} {(Inheritance songwriting_unit unit) (Member x1 main) (Member x1 songwriting_unit) (Patient e0 x1)}
  B            {(Agent e1' jon_bon_jovi) (Inheritance main_songwriting_unit unit) (Member e1' form) (Member jon_bon_jovi lead_singer) (PartOf main_songwriting_unit x0) (Past e1') (Patient e0 main_songwriting_unit) (Patient e1' main_songwriting_unit)}
  near         (Agent e0 jon_bon_jovi) ~ (Patient e0 main_songwriting_unit)   [head Agent->Patient; arg1 jon_bon_jovi->main_songwriting_unit]
  partial      (Beneficiary e0 x0) ~ (PartOf main_songwriting_unit x0)   [head Beneficiary->PartOf; arg0 e0->main_songwriting_unit]
  partial      (Inheritance songwriting_unit unit) ~ (Inheritance main_songwriting_unit unit)   [arg0 songwriting_unit->main_songwriting_unit]
  A only       (Member x1 main) (Member x1 songwriting_unit) (Past (Member jon_bon_jovi lead_singer)) (Patient e0 x1)
  B only       (Agent e1' jon_bon_jovi) (Member e1' form) (Member jon_bon_jovi lead_singer) (Past e1') (Patient e1' main_songwriting_unit)
residue A      {(Inheritance lead_singer lead)}@lead_singer
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

### pairC-0093 · tierC-000185 ↔ tierC-000186 · quality 0.12 · common 2 · aligned 4 near + 3 partial · leftover 9 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 6 renamings tied

A: Springfield station is served by City network Ipswich & Rosewood and Indooroopilly line services .
B: Station Springfield Station is served by City Network Ipswich , Rosewood and Indooroopilly Line Services .

```
renaming a->b  e0->e0 e1->e1
common         (Member e0 serve) (Member e1 serve)
group 1        anchors e0 e1
  A            {(Agent e0 indooroopilly) (Member indooroopilly line)} {(Agent e1 ipswich_rosewood) (Inheritance city_network network) (Member ipswich_rosewood city_network)} {(Member springfield station) (Theme e0 springfield) (Theme e1 springfield)}
  B            {(Agent e0 ipswich_line) (Agent e1 rosewood_line) (Agent e2' indooroopilly_line) (Member city_network network) (Member e2' serve) (Member indooroopilly_line line) (Member ipswich_line line) (Member rosewood_line line) (Member springfield_station station) (PartOf indooroopilly_line city_network) (PartOf ipswich_line city_network) (PartOf rosewood_line city_network) (Theme e0 springfield_station) (Theme e1 springfield_station) (Theme e2' springfield_station)}
  near         (Agent e0 indooroopilly) ~ (Agent e0 ipswich_line)   [arg1 indooroopilly->ipswich_line]
  near         (Agent e1 ipswich_rosewood) ~ (Agent e1 rosewood_line)   [arg1 ipswich_rosewood->rosewood_line]
  partial      (Inheritance city_network network) ~ (Member city_network network)   [head Inheritance->Member]
  partial      (Member indooroopilly line) ~ (Member indooroopilly_line line)   [arg0 indooroopilly->indooroopilly_line]
  partial      (Member springfield station) ~ (Member springfield_station station)   [arg0 springfield->springfield_station]
  near         (Theme e0 springfield) ~ (Theme e0 springfield_station)   [arg1 springfield->springfield_station]
  near         (Theme e1 springfield) ~ (Theme e1 springfield_station)   [arg1 springfield->springfield_station]
  A only       (Member ipswich_rosewood city_network)
  B only       (Agent e2' indooroopilly_line) (Member e2' serve) (Member ipswich_line line) (Member rosewood_line line) (PartOf indooroopilly_line city_network) (PartOf ipswich_line city_network) (PartOf rosewood_line city_network) (Theme e2' springfield_station)
residue A      —
residue B      —
```

### pairC-0094 · tierC-000187 ↔ tierC-000188 · quality 0.55 · common 6 · aligned 0 near + 1 partial · leftover 0 · residue A 3 subgraph(s) / 3 atom(s), B 4 / 4

A: Local intradermal injection of botulinum toxin is helpful and chronic painful in focal neuropathies .
B: Local intradermal injection of botulinum toxin in focal neuropathies is helpful and chronically painful .

```
renaming a->b  
common         (Inheritance botulinum_toxin toxin) (Inheritance focal_neuropathy focal) (Inheritance focal_neuropathy neuropathy) (Inheritance intradermal_injection injection) (Inheritance intradermal_injection intradermal) (Inheritance intradermal_injection local)
group 1        anchors focal_neuropathy intradermal_injection
  A            {(Inheritance focal_neuropathy painful)}
  B            {(Inheritance intradermal_injection painful)}
  partial      (Inheritance focal_neuropathy painful) ~ (Inheritance intradermal_injection painful)   [arg0 focal_neuropathy->intradermal_injection]
residue A      {(ConditionalProperty intradermal_injection helpful focal_neuropathy)}@focal_neuropathy,intradermal_injection {(Inheritance focal_neuropathy chronic)}@focal_neuropathy {(Patient intradermal_injection botulinum_toxin)}@botulinum_toxin,intradermal_injection
residue B      {(Degree intradermal_injection painful chronically)}@intradermal_injection {(In intradermal_injection focal_neuropathy)}@focal_neuropathy,intradermal_injection {(Inheritance intradermal_injection helpful)}@intradermal_injection {(Theme intradermal_injection botulinum_toxin)}@botulinum_toxin,intradermal_injection
```

### pairC-0095 · tierC-000189 ↔ tierC-000190 · quality 0.00 · common 0 · aligned 0 near + 2 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Des Moines is included in the Warren County -- West Des Moines , IA Metropolitan Statistical Area .
B: Des Moines are included in the Warren County -- West Des Moines , Metropolitan Statistical Area IA .

```
renaming a->b  
common         —
group 1        anchors —
  A            {(LocatedIn des_moines warren_county_west_des_moines_ia_metropolitan_statistical_area) (Member warren_county_west_des_moines_ia_metropolitan_statistical_area metropolitan_statistical_area)}
  B            {(LocatedIn des_moines warren_county_west_des_moines_msa_ia) (Member warren_county_west_des_moines_msa_ia metropolitan_statistical_area)}
  partial      (LocatedIn des_moines warren_county_west_des_moines_ia_metropolitan_statistical_area) ~ (LocatedIn des_moines warren_county_west_des_moines_msa_ia)   [arg1 warren_county_west_des_moines_ia_metropolitan_statistical_area->warren_county_west_des_moines_msa_ia]
  partial      (Member warren_county_west_des_moines_ia_metropolitan_statistical_area metropolitan_statistical_area) ~ (Member warren_county_west_des_moines_msa_ia metropolitan_statistical_area)   [arg0 warren_county_west_des_moines_ia_metropolitan_statistical_area->warren_county_west_des_moines_msa_ia]
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
  A            {(LocatedIn x0 huancavelica) (Member huancavelica peruvian) (Member huancavelica province)}
  B            {(LocatedIn peru huancavelica) (LocatedIn x0 peru) (Member peru province)}
  near         (LocatedIn x0 huancavelica) ~ (LocatedIn x0 peru)   [arg1 huancavelica->peru]
  partial      (Member huancavelica province) ~ (Member peru province)   [arg0 huancavelica->peru]
  A only       (Member huancavelica peruvian)
  B only       (LocatedIn peru huancavelica)
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

### pairC-0098 · tierC-000195 ↔ tierC-000196 · quality 0.67 · common 2 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 3 renamings tied

A: Morrow can either mean the next day in particular , or the future in general .
B: Morrow can mean either the next day in particular or the future in general .

```
renaming a->b  x0->x0
common         (Inheritance next_day day) (Inheritance next_day next)
group 1        anchors next_day
  A            {(And (Agent x0 morrow) (Can x0) (Member x0 mean) (Or (Theme x0 next_day) (Theme x0 future)))}
  B            {(And (Agent x0 morrow) (Can x0) (Member x0 mean) (Or (And (Member x1' next_day) (Theme x0 x1')) (And (Member x2' future) (Theme x0 x2'))))}
  partial      (And (Agent x0 morrow) (Can x0) (Member x0 mean) (Or (Theme x0 next_day) (Theme x0 future))) ~ (And (Agent x0 morrow) (Can x0) (Member x0 mean) (Or (And (Member x1' next_day) (Theme x0 x1')) (And (Member x2' future) (Theme x0 x2'))))   [arg3 (Or (Theme x0 next_day) (Theme x0 future))->(Or (And (Member x1' next_day) (Theme x0 x1')) (And (Member x2' future) (Theme x0 x2')))]
residue A      —
residue B      —
```

### pairC-0099 · tierC-000197 ↔ tierC-000198 · quality 0.88 · common 15 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Company sells ice cream , then expands to bake ice cream cones Headquarters moves to Baltimore .
B: Company sells ice cream , then expands to bake ice cones headquarters moves to Baltimore .

```
renaming a->b  e0->e0 e1->e2 e2->e3 e3->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Agent e1 x0) (Agent e2 x0) (Agent e3 x1) (Before e0 e1) (Goal e3 baltimore) (Member e0 sell) (Member e1 expand) (Member e2 bake) (Member e3 move) (Member x0 company) (Member x1 headquarters) (PartOf x1 x0) (Theme e0 ice_cream) (To e1 e2)
group 1        anchors e2
  A            {(Inheritance ice_cream_cone cone) (Patient e2 ice_cream_cone)}
  B            {(Inheritance ice_cone cone) (Patient e2 ice_cone)}
  partial      (Inheritance ice_cream_cone cone) ~ (Inheritance ice_cone cone)   [arg0 ice_cream_cone->ice_cone]
  near         (Patient e2 ice_cream_cone) ~ (Patient e2 ice_cone)   [arg1 ice_cream_cone->ice_cone]
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

### pairC-0101 · tierC-000201 ↔ tierC-000202 · quality 1.00 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: In the early morning and late afternoon , it seems most active .
B: It seems to be most active in the early morning and late afternoon .

```
renaming a->b  e0->e0 x0->x0
common         (Degree x0 active most) (Experiencer e0 x0) (Member e0 active) (Member x0 thing) (Probably (Member x0 active)) (Probably e0) (Time e0 early_morning) (Time e0 late_afternoon)
residue A      —
residue B      —
```

### pairC-0102 · tierC-000203 ↔ tierC-000204 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Barako from Batangas was shipped from Manila to San Francisco .
B: Barako from Batangas was shipped to San Francisco from Manila .

```
renaming a->b  e0->e0
common         (From barako batangas) (Goal e0 san_francisco) (Member e0 ship) (Past e0) (Source e0 manila) (Theme e0 barako)
residue A      —
residue B      —
```

### pairC-0103 · tierC-000205 ↔ tierC-000206 · quality 0.50 · common 5 · aligned 0 near + 4 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: These predictive functions are referred to as pedo-transfer functions in a non-spatial context .
B: These predictive functions , in a non-spatial context are referred to as pedotransfer functions .

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x0 predictive_function) (Inheritance predictive_function function) (Inheritance predictive_function predictive) (Member x1 context) (Member x1 non_spatial)
group 1        anchors x0 x1
  A            {(As e0 pedo_transfer_function) (In e0 x1) (Inheritance pedo_transfer_function function) (Member e0 refer) (Theme e0 x0)}
  B            {(As x0' pedotransfer_function) (In x0' x1) (Inheritance pedotransfer_function function) (Member x0' refer) (To x0' x0)}
  partial      (In e0 x1) ~ (In x0' x1)   [arg0 e0->x0']
  partial      (Inheritance pedo_transfer_function function) ~ (Inheritance pedotransfer_function function)   [arg0 pedo_transfer_function->pedotransfer_function]
  partial      (Member e0 refer) ~ (Member x0' refer)   [arg0 e0->x0']
  partial      (Theme e0 x0) ~ (To x0' x0)   [head Theme->To; arg0 e0->x0']
  A only       (As e0 pedo_transfer_function)
  B only       (As x0' pedotransfer_function)
residue A      —
residue B      —
```

### pairC-0104 · tierC-000207 ↔ tierC-000208 · quality 0.71 · common 5 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 2 / 2

A: A synthetic instrument is a kind of virtual instrument that is defined purely by software .
B: A synthetic instrument is a kind of virtual instrument that is purely software defined .

```
renaming a->b  
common         (Inheritance synthetic_instrument instrument) (Inheritance synthetic_instrument synthetic) (Inheritance synthetic_instrument virtual_instrument) (Inheritance virtual_instrument instrument) (Inheritance virtual_instrument virtual)
residue A      —
residue B      {(Degree synthetic_instrument software_defined purely)}@synthetic_instrument {(Inheritance synthetic_instrument software_defined)}@synthetic_instrument
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

### pairC-0106 · tierC-000211 ↔ tierC-000212 · quality 1.00 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Alema Nature Reserve is a nature reserve situated in northern Estonia , in Harju County .
B: Alema Nature Reserve is a nature reserve in northern Estonia , in Harju County .

```
renaming a->b  x0->x0
common         (Inheritance nature_reserve reserve) (LocatedIn alema_nature_reserve harju_county) (LocatedIn alema_nature_reserve x0) (LocatedIn x0 estonia) (Member alema_nature_reserve nature_reserve) (Member harju_county county) (Member x0 northern)
residue A      —
residue B      —
```

### pairC-0107 · tierC-000213 ↔ tierC-000214 · quality 0.50 · common 5 · aligned 1 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: This room is built with a barometer and a presented-in scale .
B: This room is built with a barometer and a presented scale .

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Instrument e0 x1) (Member e0 build) (Member x1 barometer) (Member x2 room) (Patient e0 x2)
group 1        anchors e0 x2
  A            {(Inheritance presented_in_scale scale) (Instrument e0 x0) (Member x0 presented_in_scale)}
  B            {(Instrument e1' x0) (Member e1' build) (Member x0 presented) (Member x0 scale) (Patient e1' x2)}
  partial      (Inheritance presented_in_scale scale) ~ (Member x0 scale)   [head Inheritance->Member; arg0 presented_in_scale->x0]
  partial      (Instrument e0 x0) ~ (Instrument e1' x0)   [arg0 e0->e1']
  near         (Member x0 presented_in_scale) ~ (Member x0 presented)   [arg1 presented_in_scale->presented]
  B only       (Member e1' build) (Patient e1' x2)
residue A      —
residue B      —
```

### pairC-0108 · tierC-000215 ↔ tierC-000216 · quality 1.00 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The Ellerslie Rugby Park is in Richford .
B: The Ellerslie Rugby Park is located in Richford .

```
renaming a->b  
common         (LocatedIn ellerslie_rugby_park richford) (Member ellerslie_rugby_park park)
residue A      —
residue B      —
```

### pairC-0109 · tierC-000217 ↔ tierC-000218 · quality 0.30 · common 3 · aligned 0 near + 4 partial · leftover 3 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Lessos - Kenya border section is jointly funded by the government of Uganda and JICA .
B: The Lessos-Kenya border section is funded jointly by the Government of Uganda and JICA .

```
renaming a->b  e0->e0
common         (Agent e0 jica) (Inheritance border_section section) (Member e0 fund)
group 1        anchors e0
  A            {(Agent e0 x0) (Member x0 government) (PartOf x0 uganda)}
  B            {(Agent e0 government_of_uganda) (Member government_of_uganda government)}
  partial      (Agent e0 x0) ~ (Agent e0 government_of_uganda)   [arg1 x0->government_of_uganda]
  partial      (Member x0 government) ~ (Member government_of_uganda government)   [arg0 x0->government_of_uganda]
  A only       (PartOf x0 uganda)
group 2        anchors border_section e0
  A            {(LocatedIn x1 kenya) (LocatedIn x1 lessos) (Member x1 border_section) (Theme e0 x1)}
  B            {(Member lessos_kenya border_section) (Theme e0 lessos_kenya)}
  partial      (Member x1 border_section) ~ (Member lessos_kenya border_section)   [arg0 x1->lessos_kenya]
  partial      (Theme e0 x1) ~ (Theme e0 lessos_kenya)   [arg1 x1->lessos_kenya]
  A only       (LocatedIn x1 kenya) (LocatedIn x1 lessos)
residue A      —
residue B      —
```

### pairC-0110 · tierC-000219 ↔ tierC-000220 · quality 0.25 · common 1 · aligned 0 near + 3 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Saladas - Department is a department of the Corrientes - province in Argentina .
B: Saladas Department is a department of Corrientes Province in Argentina .

```
renaming a->b  
common         (Member saladas_department department)
group 1        anchors saladas_department
  A            {(LocatedIn corrientes argentina) (LocatedIn saladas_department corrientes) (Member corrientes province)}
  B            {(LocatedIn corrientes_province argentina) (LocatedIn saladas_department corrientes_province) (Member corrientes_province province)}
  partial      (LocatedIn corrientes argentina) ~ (LocatedIn corrientes_province argentina)   [arg0 corrientes->corrientes_province]
  partial      (LocatedIn saladas_department corrientes) ~ (LocatedIn saladas_department corrientes_province)   [arg1 corrientes->corrientes_province]
  partial      (Member corrientes province) ~ (Member corrientes_province province)   [arg0 corrientes->corrientes_province]
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

### pairC-0112 · tierC-000223 ↔ tierC-000224 · quality 0.43 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 3 atom(s), B 1 / 4

A: Many people were mostly numerically important in the region from New Jersey north to Virginia .
B: Indentured people were numerically important mostly in the region from New Jersey north to Virginia .

```
renaming a->b  x0->x0
common         (From x0 new_jersey) (Member x0 region) (To x0 virginia)
residue A      {(Degree person important mostly) (Degree person important numerically) (Past (Inheritance person important))}
residue B      {(Inheritance indentured_person indentured) (Inheritance indentured_person person) (LocatedIn indentured_person x0) (Past (KindProperty indentured_person numerically_important))}@x0
```

### pairC-0113 · tierC-000225 ↔ tierC-000226 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: The New Mexico State Legislature is the upper house of the New Mexico Senate .
B: The New Mexico State Legislature is the upper house of New Mexico Senate .

```
renaming a->b  
common         (Inheritance upper_house house) (Inheritance upper_house upper) (Member new_mexico_senate senate) (Member new_mexico_state_legislature legislature) (Member new_mexico_state_legislature upper_house) (PartOf new_mexico_state_legislature new_mexico_senate)
residue A      —
residue B      —
```

### pairC-0114 · tierC-000227 ↔ tierC-000228 · quality 0.82 · common 9 · aligned 1 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It also adds to the personality of the character Holly Golightly , played by Audrey Heppurn .
B: It also adds to the personality of the character Holly Golightly , played by Audrey Hepburn .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 add) (Member e1 play) (Member holly_golightly character) (Member x0 thing) (Member x1 personality) (Possession x1 holly_golightly) (Theme e1 holly_golightly) (To e0 x1)
group 1        anchors e1
  A            {(Agent e1 audrey_heppurn)}
  B            {(Agent e1 audrey_hepburn)}
  near         (Agent e1 audrey_heppurn) ~ (Agent e1 audrey_hepburn)   [arg1 audrey_heppurn->audrey_hepburn]
group 2        anchors add e0 x0
  A            {(Also add e0)}
  B            {(Also x0 e0)}
  partial      (Also add e0) ~ (Also x0 e0)   [arg0 add->x0]
residue A      —
residue B      —
```

### pairC-0115 · tierC-000229 ↔ tierC-000230 · quality 0.75 · common 6 · aligned 1 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Another series was played between the Boston Red Sox and the Cincinnati Reds in Havana .
B: In Havana , another series between Cincinnati Reds and Boston Red Sox was played .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 boston_red_sox) (Agent e0 cincinnati_reds) (Location e0 havana) (Member e0 play) (Member x0 series) (Past e0)
group 1        anchors e0 x0
  A            {(Patient e0 x0)}
  B            {(Theme e0 x0)}
  near         (Patient e0 x0) ~ (Theme e0 x0)   [head Patient->Theme]
residue A      {(Again e0)}@e0
residue B      —
```

### pairC-0116 · tierC-000231 ↔ tierC-000232 · quality 0.75 · common 9 · aligned 0 near + 1 partial · leftover 2 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: When it was printed commercially , illustrations were added by J. Augustus Knapp .
B: When it was printed commercially , illustrations by J. Augustus Knapp were added .

```
renaming a->b  e0->e2 e1->e1 x0->x0 x1->x1
common         (GroupOf x0 illustration) (Manner e1 commercially) (Member e0 add) (Member e1 print) (Member x1 thing) (Past e0) (Past e1) (Patient e1 x1) (Theme e0 x0)
group 1        anchors e0 x0
  A            {(Agent e0 j_augustus_knapp)}
  B            {(Agent e0' j_augustus_knapp) (Member e0' illustrate) (Patient e0' x0)}
  partial      (Agent e0 j_augustus_knapp) ~ (Agent e0' j_augustus_knapp)   [arg0 e0->e0']
  B only       (Member e0' illustrate) (Patient e0' x0)
residue A      {(During e0 e1)}@e0,e1
residue B      —
```

### pairC-0117 · tierC-000233 ↔ tierC-000234 · quality 0.33 · common 2 · aligned 1 near + 1 partial · leftover 1 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The mental world is usually considered subjective and not objective .
B: The mental world is usually considered to be subjective and not objective .

```
renaming a->b  e0->e0 x1->x0
common         (Member e0 consider) (Theme e0 (Member x1 subjective))
group 1        anchors x1
  A            {(Inheritance mental_world mental) (Inheritance mental_world world) (Member x1 mental_world)}
  B            {(Member x1 mental)} {(Member x1 world)}
  partial      (Inheritance mental_world world) ~ (Member x1 world)   [head Inheritance->Member; arg0 mental_world->x1]
  near         (Member x1 mental_world) ~ (Member x1 mental)   [arg1 mental_world->mental]
  A only       (Inheritance mental_world mental)
residue A      {(And (Member x0 consider) (Theme x0 (Member x1 objective))) ~NEG}@x1
residue B      —
```

### pairC-0118 · tierC-000235 ↔ tierC-000236 · quality 0.93 · common 14 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: As an official Soviet artist , his work was well received and widely exhibited .
B: As an official Soviet artist , his work was well received and exhibited widely .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Inheritance official_soviet_artist artist) (Inheritance official_soviet_artist official) (Inheritance official_soviet_artist soviet) (Manner e0 widely) (Manner e1 well) (Member e0 exhibit) (Member e1 receive) (Member x0 work) (Past (Member x1 official_soviet_artist)) (Past e0) (Past e1) (Possession x0 x1) (Theme e0 x0) (Theme e1 x0)
residue A      {(Member x1 person)}@x1
residue B      —
```

### pairC-0119 · tierC-000237 ↔ tierC-000238 · quality 0.40 · common 4 · aligned 1 near + 2 partial · leftover 2 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: He is the and can become the Inomaru to borrow .
B: As , he is the and can become the Inomaru to borrow .

```
renaming a->b  e0->e0 e2->e1 x0->x0
common         (Can e0) (Member e0 become) (Member e2 borrow) (Member x0 person)
group 1        anchors e0 e2 x0
  A            {(Experiencer e1 x0) (Member e1 inomaru) (Result e0 e1) (Theme e2 e1)}
  B            {(Agent e2 x0)} {(Theme e0 inomaru)}
  partial      (Experiencer e1 x0) ~ (Agent e2 x0)   [head Experiencer->Agent; arg0 e1->e2]
  partial      (Result e0 e1) ~ (Theme e0 inomaru)   [head Result->Theme; arg1 e1->inomaru]
  A only       (Member e1 inomaru) (Theme e2 e1)
group 2        anchors e0 x0
  A            {(Patient e0 x0)}
  B            {(Agent e0 x0)}
  near         (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
residue A      {(Member x0 inomaru)}@x0
residue B      {(To e0 e2)}@e0,e2
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

### pairC-0122 · tierC-000243 ↔ tierC-000244 · quality 0.75 · common 12 · aligned 2 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Kerr broke into the first team that season , but Couper found himself on the bench .
B: Kerr broke this season into the first team , but Couper found himself on the bench .

```
renaming a->b  e0->e1 e1->e0 x0->x1 x2->x0
common         (Agent e0 kerr) (Agent e1 couper) (But e0 e1) (Inheritance first_team first) (Inheritance first_team team) (Location e1 x0) (Member e1 find) (Member x0 bench) (Member x2 first_team) (Past e0) (Past e1) (Theme e1 couper)
group 1        anchors e0
  A            {(Member e0 break_into)}
  B            {(Member e0 break)}
  near         (Member e0 break_into) ~ (Member e0 break)   [arg1 break_into->break]
group 2        anchors e0
  A            {(Member x1 season) (Time e0 x1)}
  B            {(Time e0 this_season)}
  partial      (Time e0 x1) ~ (Time e0 this_season)   [arg1 x1->this_season]
  A only       (Member x1 season)
group 3        anchors e0 x2
  A            {(Theme e0 x2)}
  B            {(Goal e0 x2)}
  near         (Theme e0 x2) ~ (Goal e0 x2)   [head Theme->Goal]
residue A      —
residue B      —
```

### pairC-0123 · tierC-000245 ↔ tierC-000246 · quality 0.12 · common 1 · aligned 2 near + 3 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: The Lessos -- Uganda border section is jointly funded by the government of Kenya and JICA .
B: The Lessos Border Section -- Uganda is financed jointly by the Government of Kenya and JICA .

```
renaming a->b  e0->e0
common         (Agent e0 jica)
group 1        anchors e0
  A            {(Agent e0 x0) (Member x0 government) (PartOf x0 kenya)}
  B            {(Agent e0 government_of_kenya) (Member government_of_kenya government)}
  partial      (Agent e0 x0) ~ (Agent e0 government_of_kenya)   [arg1 x0->government_of_kenya]
  partial      (Member x0 government) ~ (Member government_of_kenya government)   [arg0 x0->government_of_kenya]
  A only       (PartOf x0 kenya)
group 2        anchors e0
  A            {(Inheritance border_section section) (Member lessos_uganda border_section) (Theme e0 lessos_uganda)}
  B            {(Member lessos_border_section_uganda section) (Theme e0 lessos_border_section_uganda)}
  partial      (Inheritance border_section section) ~ (Member lessos_border_section_uganda section)   [head Inheritance->Member; arg0 border_section->lessos_border_section_uganda]
  near         (Theme e0 lessos_uganda) ~ (Theme e0 lessos_border_section_uganda)   [arg1 lessos_uganda->lessos_border_section_uganda]
  A only       (Member lessos_uganda border_section)
group 3        anchors e0
  A            {(Member e0 fund)}
  B            {(Member e0 finance)}
  near         (Member e0 fund) ~ (Member e0 finance)   [arg1 fund->finance]
residue A      —
residue B      {(Manner e0 jointly)}@e0
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

### pairC-0125 · tierC-000249 ↔ tierC-000250 · quality 0.80 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Peoria is part of the Peoria County , IL Metropolitan Statistical Area .
B: Peoria is part of Peoria County , IL Metropolitan Statistical Area .

```
renaming a->b  
common         (Inheritance metropolitan_statistical_area area) (Inheritance metropolitan_statistical_area metropolitan) (LocatedIn peoria peoria_county_il_metropolitan_statistical_area) (Member peoria_county_il_metropolitan_statistical_area metropolitan_statistical_area)
residue A      {(Inheritance metropolitan_statistical_area statistical)}@metropolitan_statistical_area
residue B      —
```

### pairC-0126 · tierC-000251 ↔ tierC-000252 · quality 0.60 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 2 atom(s), B 1 / 2

A: Michele Emmer was the father of mathematician , writer and director Luciano Emmer .
B: The father of a mathematician , writer and director Luciano Emmer was Michele Michele Emmer .

```
renaming a->b  
common         (Past (Member luciano_emmer director)) (Past (Member luciano_emmer mathematician)) (Past (Member luciano_emmer writer))
residue A      {(Past (Member michele_emmer father)) (Past (Possession michele_emmer luciano_emmer))}@luciano_emmer
residue B      {(Past (Member michele_michele_emmer father)) (Past (Possession michele_michele_emmer luciano_emmer))}@luciano_emmer
```

### pairC-0127 · tierC-000253 ↔ tierC-000254 · quality 0.69 · common 9 · aligned 0 near + 1 partial · leftover 3 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: He studied at Davis Studio in Sydney and at Julian Ashton Art School in Melbourne .
B: He studied at Davis Studio , Sydney and at the Julian Ashton Art School in Melbourne .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (LocatedIn davis_studio sydney) (LocatedIn julian_ashton_art_school melbourne) (Location e0 davis_studio) (Member davis_studio studio) (Member e0 study) (Member julian_ashton_art_school school) (Member x0 person) (Past e0)
group 1        anchors e0 julian_ashton_art_school x0
  A            {(Agent e1 x0) (Location e1 julian_ashton_art_school) (Member e1 study) (Past e1)}
  B            {(Location e0 julian_ashton_art_school)}
  partial      (Location e1 julian_ashton_art_school) ~ (Location e0 julian_ashton_art_school)   [arg0 e1->e0]
  A only       (Agent e1 x0) (Member e1 study) (Past e1)
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

### pairC-0129 · tierC-000257 ↔ tierC-000258 · quality 0.46 · common 6 · aligned 3 near + 1 partial · leftover 4 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: His religion was directly influenced by the international balance of political powers .
B: His religion was influenced directly from the international balance of political powers .

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Manner e0 directly) (Member e0 influence) (Member x1 religion) (Member x2 person) (Past e0) (Possession x1 x2)
group 1        anchors e0
  A            {(Agent e0 x0) (Inheritance international_balance_of_political_power balance) (Inheritance international_balance_of_political_power international) (Member x0 international_balance_of_political_power)}
  B            {(Inheritance political_power political) (Inheritance political_power power) (Member x0 balance) (Member x0 international) (Possession x0 political_power) (Source e0 x0)}
  near         (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  partial      (Inheritance international_balance_of_political_power international) ~ (Member x0 international)   [head Inheritance->Member; arg0 international_balance_of_political_power->x0]
  near         (Member x0 international_balance_of_political_power) ~ (Member x0 balance)   [arg1 international_balance_of_political_power->balance]
  A only       (Inheritance international_balance_of_political_power balance)
  B only       (Inheritance political_power political) (Inheritance political_power power) (Possession x0 political_power)
group 2        anchors e0 x1
  A            {(Patient e0 x1)}
  B            {(Theme e0 x1)}
  near         (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
residue A      —
residue B      —
```

### pairC-0130 · tierC-000259 ↔ tierC-000260 · quality 0.83 · common 5 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Brian Packham also appeared as Peter in Coronation Street .
B: Brian Packham has also appeared in Coronation Street as Peter .

```
renaming a->b  e0->e0
common         (Agent e0 brian_packham) (Also appear e0) (As e0 peter) (Member e0 appear) (Past e0)
group 1        anchors e0
  A            {(In e0 coronation_street)}
  B            {(Location e0 coronation_street)}
  near         (In e0 coronation_street) ~ (Location e0 coronation_street)   [head In->Location]
residue A      —
residue B      —
```

### pairC-0131 · tierC-000261 ↔ tierC-000262 · quality 0.88 · common 7 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: These algorithmically equivalent sequences can be defined in three random ways .
B: These algorithmically equivalent sequences can be defined in three accidental ways .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Can e0) (Cardinality x0 3) (GroupOf x0 way) (GroupOf x1 sequence) (In e0 x0) (Member e0 define) (Theme e0 x1)
residue A      {(Member x0 random)}@x0
residue B      —
```

### pairC-0132 · tierC-000263 ↔ tierC-000264 · quality 0.50 · common 4 · aligned 0 near + 3 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Albania is a town and municipality in the Santander Department in northeastern Colombia .
B: Albania is a town and municipality in the department of Santander in northeastern Colombia .

```
renaming a->b  x0->x0
common         (LocatedIn x0 colombia) (Member albania municipality) (Member albania town) (Member x0 northeastern)
group 1        anchors albania x0
  A            {(LocatedIn albania santander_department) (LocatedIn santander_department x0) (Member santander_department department)}
  B            {(LocatedIn albania x1') (LocatedIn x1' x0) (Member x1' department) (Possession x1' santander)}
  partial      (LocatedIn albania santander_department) ~ (LocatedIn albania x1')   [arg1 santander_department->x1']
  partial      (LocatedIn santander_department x0) ~ (LocatedIn x1' x0)   [arg0 santander_department->x1']
  partial      (Member santander_department department) ~ (Member x1' department)   [arg0 santander_department->x1']
  B only       (Possession x1' santander)
residue A      —
residue B      —
```

### pairC-0133 · tierC-000265 ↔ tierC-000266 · quality 0.40 · common 2 · aligned 2 near + 0 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: They are purple , dense black-hard rocks with a considerable pyrite content .
B: They are purple , dense black-hard rocks with considerable content of pyrite .

```
renaming a->b  x0->x0 x1->x1
common         (Degree x0 quantity considerable) (GroupOf x1 rock)
group 1        anchors x0
  A            {(Inheritance pyrite_content content) (Member x0 pyrite_content)}
  B            {(Member x0 pyrite)}
  near         (Member x0 pyrite_content) ~ (Member x0 pyrite)   [arg1 pyrite_content->pyrite]
  A only       (Inheritance pyrite_content content)
group 2        anchors x0 x1
  A            {(Possession x0 x1)}
  B            {(PartOf x0 x1)}
  near         (Possession x0 x1) ~ (PartOf x0 x1)   [head Possession->PartOf]
residue A      —
residue B      —
```

### pairC-0134 · tierC-000267 ↔ tierC-000268 · quality 0.73 · common 8 · aligned 0 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The MSM model can be specified in both discrete and continuous time .
B: The MSM model can be specified in both discrete time and continuous time .

```
renaming a->b  e0->e0
common         (Can e0) (In e0 continuous_time) (In e0 discrete_time) (Inheritance continuous_time continuous) (Inheritance continuous_time time) (Inheritance discrete_time discrete) (Inheritance discrete_time time) (Member e0 specify)
group 1        anchors e0
  A            {(Inheritance msm_model model) (Member x0 msm_model) (Patient e0 x0)}
  B            {(Member msm model) (Patient e0 msm)}
  partial      (Inheritance msm_model model) ~ (Member msm model)   [head Inheritance->Member; arg0 msm_model->msm]
  partial      (Patient e0 x0) ~ (Patient e0 msm)   [arg1 x0->msm]
  A only       (Member x0 msm_model)
residue A      —
residue B      —
```

### pairC-0135 · tierC-000269 ↔ tierC-000270 · quality 0.89 · common 8 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Bobby is kidnapped and Frankie is lured to the same isolated cottage by Roger .
B: Bobby is kidnapped and Frankie is lured by Roger into the same isolated cottage .

```
renaming a->b  e0->e0 e1->e1 x0->x0
common         (Agent e0 roger) (Goal e0 x0) (Member e0 lure) (Member e1 kidnap) (Member x0 cottage) (Member x0 isolated) (Theme e0 frankie) (Theme e1 bobby)
residue A      {(Agent e1 roger)}@e1
residue B      —
```

### pairC-0136 · tierC-000271 ↔ tierC-000272 · quality 0.67 · common 8 · aligned 2 near + 1 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It also has a representation at regional and local level .
B: It has also representation at local and regional level .

```
renaming a->b  e0->e0 x0->x0
common         (Also have e0) (Holder e0 x0) (Inheritance local_level level) (Inheritance local_level local) (Inheritance regional_level level) (Inheritance regional_level regional) (Member e0 have) (Member x0 thing)
group 1        anchors e0 local_level
  A            {(Location e0 local_level)}
  B            {(At e0 local_level)}
  near         (Location e0 local_level) ~ (At e0 local_level)   [head Location->At]
group 2        anchors e0 regional_level
  A            {(Location e0 regional_level)}
  B            {(At e0 regional_level)}
  near         (Location e0 regional_level) ~ (At e0 regional_level)   [head Location->At]
group 3        anchors e0
  A            {(Member x1 representation) (Theme e0 x1)}
  B            {(Theme e0 representation)}
  partial      (Theme e0 x1) ~ (Theme e0 representation)   [arg1 x1->representation]
  A only       (Member x1 representation)
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
  B            {(Member pascu river) (Member valea_voenilor river) (Member valea_voenilor tributary) (Possession valea_voenilor pascu)}
  partial      (Member pascu_river river) ~ (Member pascu river)   [arg0 pascu_river->pascu]
  partial      (Member valea_voenilor_river river) ~ (Member valea_voenilor river)   [arg0 valea_voenilor_river->valea_voenilor]
  partial      (Member valea_voenilor_river tributary) ~ (Member valea_voenilor tributary)   [arg0 valea_voenilor_river->valea_voenilor]
  A only       (PartOf valea_voenilor_river pascu_river)
  B only       (Possession valea_voenilor pascu)
residue A      —
residue B      —
```

### pairC-0138 · tierC-000275 ↔ tierC-000276 · quality 0.50 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 0 / 0

A: Murfreesboro is a part of the TN Metropolitan Statistical Area -- Davidson - Hickman County -- Franklin , Nashville .
B: Murfreesboro is part of the TN Metropolitan Statistical Area -- Davidson -- Hickman County -- Franklin , Nashville .

```
renaming a->b  
common         (LocatedIn murfreesboro tn_metropolitan_statistical_area_davidson_hickman_county_franklin_nashville) (Member tn_metropolitan_statistical_area_davidson_hickman_county_franklin_nashville metropolitan_statistical_area)
residue A      {(Inheritance metropolitan_statistical_area area)}@metropolitan_statistical_area {(Inheritance metropolitan_statistical_area metropolitan)}@metropolitan_statistical_area
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

### pairC-0140 · tierC-000279 ↔ tierC-000280 · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: It is found in southern North Africa and western Europe .
B: It is being found in southern North Africa and Western Europe .

```
renaming a->b  e0->e0 x0->x0 x2->x1
common         (LocatedIn x0 north_africa) (Location e0 x0) (Member e0 find) (Member x0 southern) (Member x2 thing) (Theme e0 x2)
group 1        anchors e0
  A            {(LocatedIn x1 europe) (Location e0 x1) (Member x1 western)}
  B            {(Location e0 western_europe)}
  partial      (Location e0 x1) ~ (Location e0 western_europe)   [arg1 x1->western_europe]
  A only       (LocatedIn x1 europe) (Member x1 western)
residue A      —
residue B      {(Ongoing e0)}@e0
```

### pairC-0141 · tierC-000281 ↔ tierC-000282 · quality 0.33 · common 1 · aligned 0 near + 1 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: None of the Polish-Russian treaties concerning Kiev has ever been ratified .
B: None of the Polish-Russian treaties concerning Kiev have ever been ratified .

```
renaming a->b  
common         (Inheritance polish_russian_treaty treaty)
group 1        anchors polish_russian_treaty
  A            {(Inheritance polish_russian_treaty polish)}
  B            {(Inheritance polish_russian_treaty polish_russian)}
  partial      (Inheritance polish_russian_treaty polish) ~ (Inheritance polish_russian_treaty polish_russian)   [arg1 polish->polish_russian]
residue A      {(Inheritance polish_russian_treaty russian)}@polish_russian_treaty
residue B      —
```

### pairC-0142 · tierC-000283 ↔ tierC-000284 · quality 0.82 · common 9 · aligned 2 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: A mass ceremony was held that night , and prayers were prayed until dawn .
B: A mass ceremony was conducted that night , and prayers were held until dawn .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (End e0 dawn) (GroupOf x0 prayer) (Member x1 ceremony) (Member x1 mass) (Past e0) (Past e1) (Patient e0 x0) (Patient e1 x1) (Time e1 night)
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

### pairC-0143 · tierC-000285 ↔ tierC-000286 · quality 0.80 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Since these laws were opened , many nanobreweries have changed .
B: Many nanobreweries have changed since these laws were opened .

```
renaming a->b  e0->e0 x0->x0
common         (GroupOf x0 law) (Member e0 open) (Past e0) (Patient e0 x0)
residue A      —
residue B      {(Inheritance nanobrewery brewery)}
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

### pairC-0145 · tierC-000289 ↔ tierC-000290 · quality 0.78 · common 7 · aligned 0 near + 1 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Dora Smith is a widow of two own children : Will and Ma Smith .
B: Dora Smith is a widow with two children of her own : Will and Ma Smith .

```
renaming a->b  x0->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member dora_smith widow) (Member ma_smith child) (Member will child) (PartOf ma_smith x0) (PartOf will x0)
group 1        anchors dora_smith ma_smith x0
  A            {(Possession ma_smith dora_smith)}
  B            {(Possession x0 dora_smith)}
  partial      (Possession ma_smith dora_smith) ~ (Possession x0 dora_smith)   [arg0 ma_smith->x0]
residue A      {(Possession will dora_smith)}@dora_smith,will
residue B      —
```

### pairC-0146 · tierC-000291 ↔ tierC-000292 · quality 0.75 · common 12 · aligned 1 near + 0 partial · leftover 2 · residue A 2 subgraph(s) / 2 atom(s), B 1 / 1

A: In Turkey , the company built a hotel in Eskisehir and a paper mill in Kazakhstan .
B: The company built a hotel in Eskisehir and a paper factory in Kazakhstan in Turkey .

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Agent e1 x0) (Location e0 eskisehir) (Location e1 kazakhstan) (Member e0 build) (Member e1 build) (Member x0 company) (Member x2 hotel) (Past e0) (Past e1) (Patient e0 x2) (Patient e1 x1)
group 1        anchors x1
  A            {(Inheritance paper_mill mill) (Member x1 paper_mill)}
  B            {(Inheritance paper_factory factory) (Member x1 paper_factory)}
  near         (Member x1 paper_mill) ~ (Member x1 paper_factory)   [arg1 paper_mill->paper_factory]
  A only       (Inheritance paper_mill mill)
  B only       (Inheritance paper_factory factory)
residue A      {(Location e0 turkey)}@e0 {(Location e1 turkey)}@e1
residue B      {(LocatedIn kazakhstan turkey)}@kazakhstan
```

### pairC-0147 · tierC-000293 ↔ tierC-000294 · quality 0.92 · common 11 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Cowper drew a pencil portrait of John Higgins , and also painted landscapes .
B: Cowper drew a pencil portrait of John Higgins and painted landscapes .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 cowper) (Agent e1 cowper) (Inheritance pencil_portrait portrait) (Member e0 paint) (Member e1 draw) (Member x0 pencil_portrait) (Of x0 john_higgins) (Past e0) (Past e1) (Patient e0 landscape) (Patient e1 x0)
residue A      {(Also paint e0)}@e0,paint
residue B      —
```

### pairC-0148 · tierC-000295 ↔ tierC-000296 · quality 0.67 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Shreveport is a part of the DeSoto Parish -- Bossier City , LA Metropolitan Statistical Area .
B: Shreveport is part of the DeSoto Parish -- Bossier City , LA Metropolitan Statistical Area .

```
renaming a->b  
common         (LocatedIn shreveport desoto_parish_bossier_city_la_metropolitan_statistical_area) (Member desoto_parish_bossier_city_la_metropolitan_statistical_area metropolitan_statistical_area)
residue A      —
residue B      {(Inheritance metropolitan_statistical_area area)}@metropolitan_statistical_area
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

### pairC-0150 · tierC-000299 ↔ tierC-000300 · quality 0.38 · common 3 · aligned 0 near + 0 partial · leftover 0 · residue A 2 subgraph(s) / 5 atom(s), B 4 / 4

A: The Vanga Kingdom was the first powerful seafaring nation in South Asia , especially of Bengal .
B: The Vanga Kingdom was the first powerful seafaring nation of South Asia , especially Bengal .

```
renaming a->b  
common         (Member vanga_kingdom kingdom) (Past (LocatedIn vanga_kingdom south_asia)) (Past (Member vanga_kingdom powerful))
residue A      {(Inheritance seafaring_nation nation) (Inheritance seafaring_nation seafaring) (Past (Member vanga_kingdom seafaring_nation)) (Past (Ordinal vanga_kingdom 1 seafaring_nation))}@vanga_kingdom {(Past (Possession vanga_kingdom bengal))}@vanga_kingdom
residue B      {(Past (LocatedIn vanga_kingdom bengal))}@vanga_kingdom {(Past (Member vanga_kingdom nation))}@vanga_kingdom {(Past (Member vanga_kingdom seafaring))}@vanga_kingdom {(Past (Ordinal vanga_kingdom 1 nation))}@vanga_kingdom
```

### pairC-0151 · tierC-000301 ↔ tierC-000302 · quality 0.89 · common 8 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: James Woods won an Emmy for his portrayal of Wilson .
B: James Woods won an Emmy for his portrayal of the Wilson .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 james_woods) (Agent e1 james_woods) (For e1 e0) (Member e1 win) (Member x0 emmy) (Past e1) (Theme e0 wilson) (Theme e1 x0)
group 1        anchors e0
  A            {(Member e0 portray)}
  B            {(Member e0 portrayal)}
  near         (Member e0 portray) ~ (Member e0 portrayal)   [arg1 portray->portrayal]
residue A      —
residue B      —
```

### pairC-0152 · tierC-000303 ↔ tierC-000304 · quality 0.67 · common 6 · aligned 0 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Mr. Jones had been selected for Mr. Morel for a job in Seychelles .
B: Mr. Jones had been selected for a job in Seychelles working for Mr. Morel .

```
renaming a->b  e0->e1 x0->x0
common         (For e0 x0) (LocatedIn x0 seychelles) (Member e0 select) (Member x0 job) (Past e0) (Theme e0 jones)
group 1        anchors e0
  A            {(Beneficiary e0 morel)}
  B            {(Agent e0' jones) (Beneficiary e0' morel) (Member e0' work)}
  partial      (Beneficiary e0 morel) ~ (Beneficiary e0' morel)   [arg0 e0->e0']
  B only       (Agent e0' jones) (Member e0' work)
residue A      —
residue B      —
```

### pairC-0153 · tierC-000305 ↔ tierC-000306 · quality 0.40 · common 2 · aligned 0 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The Lemnia River is a tributary of the Lutoasa River in Romania .
B: The river Lemnia is a tributary of the Lutoasa River in Romania .

```
renaming a->b  
common         (LocatedIn lutoasa_river romania) (Member lutoasa_river river)
group 1        anchors lutoasa_river
  A            {(Member lemnia_river river) (Member lemnia_river tributary) (Possession lemnia_river lutoasa_river)}
  B            {(Member lemnia river) (Member lemnia tributary) (PartOf lemnia lutoasa_river)}
  partial      (Member lemnia_river river) ~ (Member lemnia river)   [arg0 lemnia_river->lemnia]
  partial      (Member lemnia_river tributary) ~ (Member lemnia tributary)   [arg0 lemnia_river->lemnia]
  A only       (Possession lemnia_river lutoasa_river)
  B only       (PartOf lemnia lutoasa_river)
residue A      —
residue B      —
```

### pairC-0154 · tierC-000307 ↔ tierC-000308 · quality 0.67 · common 2 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 1 / 1

A: Wine Country is located in the Cloverdale , as part of the Alexander Valley AVA .
B: Wine Country is located in the Cloverdale , being part of the Alexander Valley AVA .

```
renaming a->b  
common         (LocatedIn cloverdale alexander_valley_ava) (LocatedIn wine_country cloverdale)
residue A      {(Member alexander_valley_ava ava)}@alexander_valley_ava
residue B      {(Member wine_country country)}@wine_country
```

### pairC-0155 · tierC-000309 ↔ tierC-000310 · quality 0.67 · common 4 · aligned 0 near + 1 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Veymandoo Kandu is the channel between Laamu Atoll and Thaa Atoll of the Maldives .
B: Veymandoo Kandu is the channel between the Thaa Atoll and Laamu Atoll of the Maldives .

```
renaming a->b  
common         (LocatedIn thaa_atoll maldives) (Member laamu_atoll atoll) (Member thaa_atoll atoll) (Member veymandoo_kandu channel)
group 1        anchors laamu_atoll thaa_atoll veymandoo_kandu
  A            {(Between veymandoo_kandu laamu_atoll thaa_atoll)}
  B            {(Between veymandoo_kandu thaa_atoll laamu_atoll)}
  partial      (Between veymandoo_kandu laamu_atoll thaa_atoll) ~ (Between veymandoo_kandu thaa_atoll laamu_atoll)   [arg1 laamu_atoll->thaa_atoll; arg2 thaa_atoll->laamu_atoll]
residue A      —
residue B      {(LocatedIn laamu_atoll maldives)}@laamu_atoll
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

### pairC-0157 · tierC-000313 ↔ tierC-000314 · quality 0.62 · common 8 · aligned 1 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: It is found only in Yunnan and its tributaries in Lake Dianchi , China .
B: It is only found in Yunnan and its tributaries in the Dianchi - Lake , China .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 tributary) (Location e0 x0) (Location e0 yunnan) (Member e0 find) (Member x1 thing) (Only x0 e0) (Only yunnan e0) (Theme e0 x1)
group 1        anchors e0 x0 yunnan
  A            {(LocatedIn lake_dianchi china) (Location e0 lake_dianchi) (Member lake_dianchi lake) (Only lake_dianchi e0)} {(Possession x0 yunnan)}
  B            {(LocatedIn dianchi_lake china) (LocatedIn x0 dianchi_lake) (Member dianchi_lake lake)}
  partial      (LocatedIn lake_dianchi china) ~ (LocatedIn dianchi_lake china)   [arg0 lake_dianchi->dianchi_lake]
  partial      (Member lake_dianchi lake) ~ (Member dianchi_lake lake)   [arg0 lake_dianchi->dianchi_lake]
  near         (Possession x0 yunnan) ~ (LocatedIn x0 dianchi_lake)   [head Possession->LocatedIn; arg1 yunnan->dianchi_lake]
  A only       (Location e0 lake_dianchi) (Only lake_dianchi e0)
residue A      —
residue B      {(PartOf x0 yunnan)}@x0,yunnan
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

### pairC-0159 · tierC-000317 ↔ tierC-000318 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not permitted , but may be allowed on a footpath .

```
renaming a->b  
common         (ConditionalProperty bicycle permitted footpath) (ConditionalProperty pedestrian permitted footpath) (Inheritance bicycle permitted) ~NEG (Inheritance pedestrian permitted) ~NEG
residue A      —
residue B      —
```

### pairC-0160 · tierC-000319 ↔ tierC-000320 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not permitted , but may be allowed on a footpath .

```
renaming a->b  
common         (ConditionalProperty bicycle permitted footpath) (ConditionalProperty pedestrian permitted footpath) (Inheritance bicycle permitted) ~NEG (Inheritance pedestrian permitted) ~NEG
residue A      —
residue B      —
```

### pairC-0161 · tierC-000321 ↔ tierC-000322 · quality 0.33 · common 4 · aligned 0 near + 4 partial · leftover 6 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: For shopping , there is a Russian market and a similar Russian market in Pakistani blocks .
B: For shopping there is Russian Market and a similar Russian Market in Pakistani blocks .

```
renaming a->b  x2->x0
common         (GroupOf x2 pakistani_block) (Inheritance pakistani_block block) (Inheritance pakistani_block pakistani) (Symmetric Similar)
group 1        anchors x2
  A            {(For x0 shopping) (For x1 shopping) (Inheritance russian_market market) (Inheritance russian_market russian) (LocatedIn x0 x2) (Member x0 russian_market) (Member x1 russian_market) (Similar x0 x1)}
  B            {(For russian_market_1 shopping) (For russian_market_2 shopping) (LocatedIn russian_market_2 x2) (Member russian_market_1 market) (Member russian_market_2 market) (Similar russian_market_2 russian_market_1)}
  partial      (For x0 shopping) ~ (For russian_market_1 shopping)   [arg0 x0->russian_market_1]
  partial      (For x1 shopping) ~ (For russian_market_2 shopping)   [arg0 x1->russian_market_2]
  partial      (Inheritance russian_market market) ~ (Member russian_market_1 market)   [head Inheritance->Member; arg0 russian_market->russian_market_1]
  partial      (LocatedIn x0 x2) ~ (LocatedIn russian_market_2 x2)   [arg0 x0->russian_market_2]
  A only       (Inheritance russian_market russian) (Member x0 russian_market) (Member x1 russian_market) (Similar x0 x1)
  B only       (Member russian_market_2 market) (Similar russian_market_2 russian_market_1)
residue A      —
residue B      —
```

### pairC-0162 · tierC-000323 ↔ tierC-000324 · quality 0.80 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: Adolph III was the son of Count Henry VI and his wife Elisabeth of Berg .
B: Adolph III was a son of Count Henry VI and his wife Elisabeth of Berg .

```
renaming a->b  
common         (Past (Member adolph_iii son)) (Past (Member elisabeth_of_berg wife)) (Past (Possession adolph_iii elisabeth_of_berg)) (Past (Possession adolph_iii henry_vi))
residue A      {(Past (Possession elisabeth_of_berg henry_vi))}@elisabeth_of_berg
residue B      —
```

### pairC-0163 · tierC-000325 ↔ tierC-000326 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not allowed , but may be permitted on a footpath .

```
renaming a->b  
common         (ConditionalProperty bicycle permitted footpath) (ConditionalProperty pedestrian permitted footpath) (Inheritance bicycle permitted) ~NEG (Inheritance pedestrian permitted) ~NEG
residue A      —
residue B      —
```

### pairC-0164 · tierC-000327 ↔ tierC-000328 · quality 1.00 · common 4 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: Pedestrians and bicycles are not permitted , but can be allowed on a footpath .
B: Pedestrians and bicycles are not allowed , but may be permitted on a footpath .

```
renaming a->b  
common         (ConditionalProperty bicycle permitted footpath) (ConditionalProperty pedestrian permitted footpath) (Inheritance bicycle permitted) ~NEG (Inheritance pedestrian permitted) ~NEG
residue A      —
residue B      —
```

### pairC-0165 · tierC-000329 ↔ tierC-000330 · quality 0.38 · common 3 · aligned 0 near + 3 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: There are Amateur Barbershop Harmony Society and occupational groups that sing exclusively a cappella .
B: There are amateur Barbershop Harmony Society and professional groups that sing a cappella exclusively .

```
renaming a->b  e0->e0
common         (Manner e0 a_cappella) (Member e0 sing) (Only a_cappella e0)
group 1        anchors e0
  A            {(Agent e0 amateur_barbershop_harmony_society) (Member amateur_barbershop_harmony_society society)} {(Inheritance occupational_group group)}
  B            {(Agent e0 x0') (GroupOf x0' group) (Member x0' professional)} {(Member barbershop_harmony_society amateur) (Member barbershop_harmony_society society)}
  partial      (Agent e0 amateur_barbershop_harmony_society) ~ (Agent e0 x0')   [arg1 amateur_barbershop_harmony_society->x0']
  partial      (Inheritance occupational_group group) ~ (GroupOf x0' group)   [head Inheritance->GroupOf; arg0 occupational_group->x0']
  partial      (Member amateur_barbershop_harmony_society society) ~ (Member barbershop_harmony_society society)   [arg0 amateur_barbershop_harmony_society->barbershop_harmony_society]
  B only       (Member barbershop_harmony_society amateur) (Member x0' professional)
residue A      —
residue B      —
```

### pairC-0166 · tierC-000331 ↔ tierC-000332 · quality 0.70 · common 7 · aligned 0 near + 1 partial · leftover 0 · residue A 2 subgraph(s) / 2 atom(s), B 1 / 1

A: Regressive assimilations are only conditioned by phonological factors while substitutions take into account semantic information .
B: Regressive assimilations are caused only by phonological factors , while substitutions take semantic information into account .

```
renaming a->b  
common         (Inheritance phonological_factor factor) (Inheritance phonological_factor phonological) (Inheritance regressive_assimilation assimilation) (Inheritance regressive_assimilation regressive) (Inheritance semantic_information information) (Inheritance semantic_information semantic) (TakeIntoAccount substitution semantic_information)
group 1        anchors phonological_factor regressive_assimilation
  A            {(Only phonological_factor (Condition phonological_factor regressive_assimilation))}
  B            {(Only phonological_factor (Cause phonological_factor regressive_assimilation))}
  partial      (Only phonological_factor (Condition phonological_factor regressive_assimilation)) ~ (Only phonological_factor (Cause phonological_factor regressive_assimilation))   [arg1 (Condition phonological_factor regressive_assimilation)->(Cause phonological_factor regressive_assimilation)]
residue A      {(Condition phonological_factor regressive_assimilation)}@phonological_factor,regressive_assimilation {(While (Condition phonological_factor regressive_assimilation) (TakeIntoAccount substitution semantic_information))}@phonological_factor,regressive_assimilation,semantic_information,substitution
residue B      {(Cause phonological_factor regressive_assimilation)}@phonological_factor,regressive_assimilation
```

### pairC-0167 · tierC-000333 ↔ tierC-000334 · quality 0.00 · common 0 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: When a solvent is shaken , two immiscible liquids are extracted together .
B: When a solvent is shaken , two nonmixable liquids are extracted together .

```
renaming a->b  
common         —
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

### pairC-0169 · tierC-000337 ↔ tierC-000338 · quality 0.88 · common 7 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Henry Cole was followed by Bailey as Caretaker of Breakheart Hill .
B: Henry Cole was succeeded as caretaker of Breakheart Hill by Bailey .

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 bailey) (As e0 x0) (Member breakheart_hill hill) (Member x0 caretaker) (Past e0) (Possession x0 breakheart_hill) (Theme e0 henry_cole)
group 1        anchors e0
  A            {(Member e0 follow)}
  B            {(Member e0 succeed)}
  near         (Member e0 follow) ~ (Member e0 succeed)   [arg1 follow->succeed]
residue A      —
residue B      —
```

### pairC-0170 · tierC-000339 ↔ tierC-000340 · quality 0.30 · common 3 · aligned 0 near + 2 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 3 / 3

A: Its subtropical or tropical moist habitats are natural forests and plantations .
B: Its subtropical or tropical moist habitats are natural lowland forests and plantations .

```
renaming a->b  x0->x0 x1->x1
common         (GroupOf x0 habitat) (Member x1 thing) (Possession x0 x1)
group 1        anchors x0
  A            {(Inheritance natural_forest forest) (Inheritance natural_forest natural)}
  B            {(Inheritance natural_lowland_forest forest) (Inheritance natural_lowland_forest lowland) (Inheritance natural_lowland_forest natural) (Member x0 natural_lowland_forest)}
  partial      (Inheritance natural_forest forest) ~ (Inheritance natural_lowland_forest forest)   [arg0 natural_forest->natural_lowland_forest]
  partial      (Inheritance natural_forest natural) ~ (Inheritance natural_lowland_forest natural)   [arg0 natural_forest->natural_lowland_forest]
  B only       (Inheritance natural_lowland_forest lowland) (Member x0 natural_lowland_forest)
residue A      —
residue B      {(Member x0 moist)}@x0 {(Member x0 plantation)}@x0 {(Or (Member x0 subtropical) (Member x0 tropical))}@x0
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

### pairC-0172 · tierC-000343 ↔ tierC-000344 · quality 1.00 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · IDENTICAL PARSES

A: It is located in the hills between the Koonung Creek and the Mullum Mullum Creek .
B: It is located in the hills between Koonung Creek and the Mullum Mullum Creek .

```
renaming a->b  x0->x0 x1->x1
common         (Between x0 koonung_creek mullum_mullum_creek) (GroupOf x0 hill) (LocatedIn x1 x0) (Member koonung_creek creek) (Member mullum_mullum_creek creek) (Member x1 thing)
residue A      —
residue B      —
```

### pairC-0173 · tierC-000345 ↔ tierC-000346 · quality 0.67 · common 2 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: It is slightly smaller than Peru and slightly larger than South Africa .
B: It is somewhat smaller than Peru and slightly larger than South Africa .

```
renaming a->b  x0->x0
common         (More large x0 south_africa) (More small x0 peru)
group 1        anchors x0
  A            {(Member x0 thing)}
  B            {(Member x0 country)}
  near         (Member x0 thing) ~ (Member x0 country)   [arg1 thing->country]
residue A      —
residue B      —
```

### pairC-0174 · tierC-000347 ↔ tierC-000348 · quality 0.57 · common 4 · aligned 0 near + 2 partial · leftover 1 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Paniqui is from Tarlac City and is from the provincial capital of Manila .
B: Paniqui is from Tarlac City and is from the provincial capital , Manila .

```
renaming a->b  
common         (From paniqui tarlac_city) (Inheritance provincial_capital capital) (Inheritance provincial_capital provincial) (Member tarlac_city city)
group 1        anchors paniqui provincial_capital
  A            {(From paniqui x0) (Member x0 provincial_capital) (PartOf x0 manila)}
  B            {(From paniqui manila) (Member manila provincial_capital)}
  partial      (From paniqui x0) ~ (From paniqui manila)   [arg1 x0->manila]
  partial      (Member x0 provincial_capital) ~ (Member manila provincial_capital)   [arg0 x0->manila]
  A only       (PartOf x0 manila)
residue A      —
residue B      —
```

### pairC-0175 · tierC-000349 ↔ tierC-000350 · quality 0.67 · common 6 · aligned 3 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: The sessions were arranged by Nick De Caro and developed by Bruce Botnick .
B: The sessions were arranged by Nick De Caro and engineered by Bruce Botnick .

```
renaming a->b  e0->e1 e1->e0 x0->x0
common         (Agent e0 nick_de_caro) (Agent e1 bruce_botnick) (GroupOf x0 session) (Member e0 arrange) (Past e0) (Past e1)
group 1        anchors e1
  A            {(Member e1 develop)}
  B            {(Member e1 engineer)}
  near         (Member e1 develop) ~ (Member e1 engineer)   [arg1 develop->engineer]
group 2        anchors e0 x0
  A            {(Theme e0 x0)}
  B            {(Patient e0 x0)}
  near         (Theme e0 x0) ~ (Patient e0 x0)   [head Theme->Patient]
group 3        anchors e1 x0
  A            {(Theme e1 x0)}
  B            {(Patient e1 x0)}
  near         (Theme e1 x0) ~ (Patient e1 x0)   [head Theme->Patient]
residue A      —
residue B      —
```

### pairC-0176 · tierC-000351 ↔ tierC-000352 · quality 0.15 · common 2 · aligned 0 near + 2 partial · leftover 9 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0

A: Chinese dumplings were influenced and brought to Indonesia by Indonesian immigrants .
B: Chinese dumplings were influenced and brought by Indonesian immigrants to Indonesia .

```
renaming a->b  
common         (Inheritance chinese_dumpling chinese) (Inheritance chinese_dumpling dumpling)
group 1        anchors chinese_dumpling
  A            {(Agent e0 x0) (Agent e1 x0) (Goal e1 indonesia) (GroupOf x0 immigrant) (Member e0 influence) (Member e1 bring) (Member x0 indonesian) (Past e0) (Past e1) (Patient e0 chinese_dumpling) (Theme e1 chinese_dumpling)}
  B            {(Inheritance indonesian_immigrant immigrant) (Inheritance indonesian_immigrant indonesian)}
  partial      (GroupOf x0 immigrant) ~ (Inheritance indonesian_immigrant immigrant)   [head GroupOf->Inheritance; arg0 x0->indonesian_immigrant]
  partial      (Member x0 indonesian) ~ (Inheritance indonesian_immigrant indonesian)   [head Member->Inheritance; arg0 x0->indonesian_immigrant]
  A only       (Agent e0 x0) (Agent e1 x0) (Goal e1 indonesia) (Member e0 influence) (Member e1 bring) (Past e0) (Past e1) (Patient e0 chinese_dumpling) (Theme e1 chinese_dumpling)
residue A      —
residue B      —
```

### pairC-0177 · tierC-000353 ↔ tierC-000354 · quality 0.94 · common 16 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 0 / 0

A: The hurricane killed one person directly and two indirectly in the state .
B: The hurricane directly killed one person and indirectly killed two in the state .

```
renaming a->b  e0->e1 e1->e0 x0->x0 x1->x1 x2->x2 x3->x3
common         (Agent e0 x0) (Agent e1 x0) (Cardinality x1 2) (GroupOf x1 person) (Location e1 x2) (Manner e0 directly) (Manner e1 indirectly) (Member e0 kill) (Member e1 kill) (Member x0 hurricane) (Member x2 state) (Member x3 person) (Past e0) (Past e1) (Patient e0 x3) (Patient e1 x1)
residue A      {(Location e0 x2)}@e0,x2
residue B      —
```

### pairC-0178 · tierC-000355 ↔ tierC-000356 · quality 0.67 · common 8 · aligned 1 near + 1 partial · leftover 2 · residue A 0 subgraph(s) / 0 atom(s), B 0 / 0 · 2 renamings tied

A: It endorsed the views of the Free Soil Party and the Republican Party .
B: It supported the views of the Republican Party and of the Free Soil Party .

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 view) (Member free_soil_party party) (Member republican_party party) (Member x0 thing) (Past e0) (Possession x1 republican_party) (Theme e0 x1)
group 1        anchors e0
  A            {(Member e0 endorse)}
  B            {(Member e0 support)}
  near         (Member e0 endorse) ~ (Member e0 support)   [arg1 endorse->support]
group 2        anchors e0 free_soil_party x1
  A            {(Possession x1 free_soil_party)}
  B            {(GroupOf x2' view) (Possession x2' free_soil_party) (Theme e0 x2')}
  partial      (Possession x1 free_soil_party) ~ (Possession x2' free_soil_party)   [arg0 x1->x2']
  B only       (GroupOf x2' view) (Theme e0 x2')
residue A      —
residue B      —
```

### pairC-0179 · tierC-000357 ↔ tierC-000358 · quality 0.60 · common 6 · aligned 0 near + 0 partial · leftover 0 · residue A 1 subgraph(s) / 1 atom(s), B 2 / 4

A: He was the second born son of Gil Aires and wife Leonor Rodrigues .
B: He was the second son of Gil Aires and wife Leonor Rodrigues was born .

```
renaming a->b  x0->x0
common         (Member x0 person) (Past (Member leonor_rodrigues wife)) (Past (Member x0 son)) (Past (Possession leonor_rodrigues gil_aires)) (Past (Possession x0 gil_aires)) (Past (Possession x0 leonor_rodrigues))
residue A      {(Past (Ordinal x0 2 bear))}@x0
residue B      {(Member e0' bear) (Past e0') (Patient e0' x0)}@x0 {(Past (Ordinal x0 2 son))}@x0
```

### pairC-0180 · tierC-000359 ↔ tierC-000360 · quality 0.67 · common 4 · aligned 1 near + 0 partial · leftover 0 · residue A 0 subgraph(s) / 0 atom(s), B 1 / 1

A: Lex Luthor was also replaced as Scott Wells by Sherman Howard .
B: Lex Lex Luthor was also replaced by Sherman Howard as Scott Wells .

```
renaming a->b  e0->e0
common         (Agent e0 sherman_howard) (Also replace e0) (Member e0 replace) (Past e0)
group 1        anchors e0
  A            {(Theme e0 lex_luthor)}
  B            {(Theme e0 lex_lex_luthor)}
  near         (Theme e0 lex_luthor) ~ (Theme e0 lex_lex_luthor)   [arg1 lex_luthor->lex_lex_luthor]
residue A      —
residue B      {(As e0 scott_wells)}@e0
```

