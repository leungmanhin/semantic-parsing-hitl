# Connected patterns of run `first` — 2026-11-05 17:36

§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized view keeps the class symbols, the shape view turns them into class variables. Every row is a CANDIDATE with its evidence, not a finding.

- key dials: `{"polarity": "three", "tense": "evidence", "habitual": "evidence"}`
- parameters: `{"min_atoms": 2, "max_atoms": 5, "min_families": 3, "support_role": "mine", "max_variables": null, "exclude_heads": [], "max_embeddings": 200000, "restating_templates": ["distribution"]}`
- corpus: 4,257 sentences in 1,082 families ({'evaluate': 368, 'mine': 714}); support = families of the `mine` share; the other shares are held out and reported beside it
- time (s): {'lexicalized': 20.0, 'shape': 126.6, 'tests': 127.0, 'renamed_corpus': 166.2, 'total': 442.2}

## How many

| view | atoms | atom sets found | distinct patterns | frequent = candidates | tree | join | inside one instance | with a restated copy | sets of matching sentences |
|---|---|---|---|---|---|---|---|---|---|
| lexicalized | 2 | 54,666 | 7,858 | 1,832 | 1,747 | 85 | 1,135 | 281 | |
| lexicalized | 3 | 92,209 | 23,065 | 3,016 | 2,579 | 437 | 1,173 | 770 | |
| lexicalized | 4 | 132,552 | 40,128 | 3,522 | 2,562 | 960 | 837 | 1,454 | |
| lexicalized | 5 | 140,109 | 43,021 | 3,150 | 1,880 | 1,270 | 438 | 1,810 | |
| lexicalized | all | | | **11,520** | | | | | **3,323** |
| shape | 2 | 101,571 | 6,899 | 2,213 | 2,124 | 89 | 1,240 | 385 | |
| shape | 3 | 250,043 | 43,352 | 6,687 | 6,045 | 642 | 2,679 | 1,370 | |
| shape | 4 | 544,859 | 137,021 | 13,764 | 11,421 | 2,343 | 3,816 | 3,737 | |
| shape | 5 | 980,882 | 282,581 | 21,476 | 15,805 | 5,671 | 3,718 | 8,127 | |
| shape | all | | | **44,140** | | | | | **5,561** |

- *tree*: a pattern a rooted-subtree miner could state. *join*: one thing is an argument of two events, or the arguments close a loop — what the binding-aware view adds.
- *inside one instance*: every match lies within one template instance, so the pattern restates a template (§5.3's template-internal label).
- *with a restated copy*: some match holds atoms of a template whose rule restates other instances' atoms (distribution: the per-member rule beside the group's own event).
- *sets of matching sentences*: many patterns match exactly the same sentences (a part of a larger pattern that never occurs without the rest). Each candidate names the largest pattern of its set; the tables below show that one, with the number of patterns sharing its sentences.
- All of these are labels on the records. Nothing is dropped.

## Held-out recurrence, the generalizer and the two tests

- lexicalized: 7,779 of 11,520 candidates (68%) also occur in a held-out family; the generalization of a candidate's matches equals its pattern for 11,520; the renaming test is passed by 11,520, the broken-link test by 11,520
- shape: 31,805 of 44,140 candidates (72%) also occur in a held-out family; the generalization of a candidate's matches equals its pattern for 42,614 and is tighter — a class every match shares — for 1,526; the renaming test is passed by 44,140, the broken-link test by 44,140
- the whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: lexicalized: the identical table (11,520 patterns); shape: the identical table (44,140 patterns)

## The lexicalized view

One row per set of matching sentences (its largest pattern), by families of the mining share.

### Joins between events: 2–3 atoms

One thing in two events, or a loop among the arguments; no rule, no sealed clause; the match spans several template instances.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L001876 | 32 | 18 | 110 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2)` | $e1 sit · run · stand; $e2 wear · open · hold; $x1 man · woman · dog; $x2 grass · street · sidewalk | A little boy is running on the ground and playing with a little girl |
| subtree-L000073 | 27 | 10 | 55 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1)` | $e1 stand · sit · roll; $e2 look · say · argue; $x1 dog · man · classroom | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-L001917 | 21 | 6 | 62 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man)` | $e1 wear · sit · stand; $e2 wear · walk · hold; $x1 man | A man dressed in black and white is holding up the tennis racket and is waiting  |
| subtree-L001942 | 18 | 10 | 49 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1)` | $e1 wear · sit · post; $e2 wear · put · jump; $x1 man · woman · cat | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L001955 | 17 | 7 | 43 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1)` | $e1 wear · stand · sit; $e2 wear · tinker · jump; $e3 wear · ride · calculate; $x1 woman · man · girl | Three young men are furiously running, jumping and kicking near a vending machin |
| subtree-L001956 | 17 | 7 | 51 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Theme($e1,$x2)` | $e1 ride · carry · throw; $e2 wear · approach · run; $x1 man · woman · dog; $x2 bike · bicycle · ball | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-L001958 | 17 | 8 | 28 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Theme($e2,§1)` | $e1 rally · cut · countersue; $e2 say · argue · rule; $x1 court · santa_clara-based · voice | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-L000169 | 15 | 14 | 61 | 1 | `Location($e1,$x1) & Location($e2,$x1)` | $e1 play · sit · stand; $e2 play · sit · stand; $x1 grass · street · table | A brown dog and a gray dog are playing in the snow |
| subtree-L002007 | 14 | 3 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,stand)` | $e1 stand; $e2 play · wear · hold; $x1 man · girl · woman | Adults and children are standing and playing in front of steps near a desert are |
| subtree-L002010 | 14 | 11 | 55 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Location($e2,$x2)` | $e1 play · sit · stand; $e2 play · sit · stand; $x1 dog · man · woman; $x2 grass · street · table | A brown dog and a gray dog are playing in the snow |
| subtree-L002079 | 12 | 4 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,play)` | $e1 play; $e2 stand · run · wear; $x1 woman · girl · boy | A little boy is running on the ground and playing with a little girl |
| subtree-L002080 | 12 | 6 | 42 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman)` | $e1 wear · sit · crouch_down; $e2 wear · hold · play; $x1 woman · seated | A woman is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-L002082 | 12 | 5 | 18 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2)` | $e1 cut · reverse · reject; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 rating · decision · legislation | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-L000268 | 11 | 4 | 16 | 1 | `Agent($e1,$x1) & Also($x1,$e1)` | $e1 require · raise · hire; $x1 measure · bill · news | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-L002104 | 11 | 1 | 25 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit)` | $e1 sit; $e2 wear · hold · rest; $x1 man · woman · girl | Two blokes are sitting around a table and holding beers in their hands |
| subtree-L000304 | 10 | 6 | 22 | 1 | `Bearer($e1,$x1) & Patient($e2,$x1)` | $e1 wife · leader · opponent; $e2 seek · replace · die; $x1 wife · settlement · mother | Her 20-year-old sister, Allyson, was severely burned and remained hospitalized i |
| subtree-L000318 | 10 | 2 | 13 | 1 | `Patient($e1,$x1) & Theme($e2,$x1)` | $e1 make · turn · describe; $e2 son · cover · provide; $x1 road · evidence · fire | The mother of a Briton held by Colombian guerrillasspoke of her relief yesterday |
| subtree-L002164 | 10 | 5 | 21 | 1 | `Patient($e1,$x1) & Patient($e2,$x1) & Time($e1,$t1)` | $e1 improve · rise · find; $e2 close · slide_down · rise; $t1 month · day · year; $x1 rate · report · gold | Spot gold was quoted at $367.90/368.60 an ounce at 1000 GMT, having marched up t |
| subtree-L000371 | 9 | 3 | 17 | 1 | `Theme($e1,$x1) & Theme($e2,$x1)` | $e1 ride · chairman · president; $e2 ride · ceo · mother; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-L002220 | 9 | 3 | 18 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Goal($e1,$x2)` | $e1 jump · throw · put; $e2 wear · approach · play; $x1 car · kid · boy; $x2 pool · air · pocket | The man in a hat suited for cowboys is walking through a market and is putting a |

### Joins between events: 4–5 atoms

The same, larger.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L004876 | 26 | 12 | 84 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Patient($e2,$x3)` | $e1 sit · ride · walk; $e2 wear · open · hold; $x1 man · woman · dog; $x2 grass · street · sand; $x3 drawer · hat · shirt | A man is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-L004878 | 25 | 7 | 98 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · ride · hold; $x1 woman · man · boy; $x2 shirt · hat · jacket | A man is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-L004917 | 17 | 1 | 26 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say · claim · hear; $x1 adviser · director · daughter; $x2 federal · briton · union | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L004927 | 16 | 6 | 40 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2)` | $e1 wear · calculate · pound; $e2 wear · sit · stand; $e3 wear · ride · build; $x1 woman · man · girl; $x2 shirt · jacket · route | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L004928 | 16 | 6 | 48 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man) & Patient($e1,$x2)` | $e1 wear · hold · rest; $e2 sit · wear · stand; $x1 man; $x2 sign · shirt · hand | A man dressed in black and white is holding up the tennis racket and is waiting  |
| subtree-L004929 | 16 | 12 | 45 | 1 | `Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)` | $e1 raise · flap · hug; $x1 girl · woman · man; $x3 forecast · rating · dividend | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-L008402 | 16 | 1 | 24 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say; $x1 adviser · director · daughter; $x2 federal · union · store | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L004971 | 14 | 9 | 40 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3)` | $e1 wear · open · rest; $e2 sit · wear · jump; $x1 man · woman · cat; $x3 wife · drawer · hand | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L004972 | 14 | 6 | 30 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Possession($x3,$x2)` | $e1 sit · open · wear; $e2 jump · add · read; $x1 man · cat · powerhouse; $x3 toolbar · case · government | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L008440 | 14 | 6 | 34 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · pound · develop; $e2 wear · build · protest; $e3 ride · sit · pose; $x1 woman · man · girl; $x2 shirt · jacket · southern; $x3 acceptance · intelligence · northern | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L004987 | 13 | 6 | 30 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x3) & Patient($e2,$x3)` | $e1 play · wear · issue; $e2 play · wear · add; $x1 man · rain · justice; $x2 woman · government · colleague; $x3 statement · southern · lead | Australia,Chile, Colombia, El Salvador, Honduras, Mexico, New Zealand, Peru and  |
| subtree-L008443 | 13 | 5 | 47 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear; $e2 wear · hold · fire; $x1 woman · man · girl; $x2 shirt · jacket · suit; $x3 boy · net · gun | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L005034 | 11 | 10 | 49 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Location($e1,$x3) & Location($e2,$x3)` | $e1 play · sit · stand; $e2 play · sit · stand; $x1 dog · man · woman; $x2 dog · woman · boy; $x3 grass · street · table | A brown dog and a gray dog are playing in the snow |
| subtree-L008476 | 11 | 6 | 26 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x4,$x2)` | $e1 open · wear · release; $e2 jump · sit · add; $x1 cat · powerhouse · boy; $x3 drawer · beta · plan; $x4 toolbar · case · government | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L005058 | 10 | 6 | 37 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman) & Patient($e1,$x2)` | $e1 wear · play · sing; $e2 wear · hold · ride; $x1 woman · seated; $x2 jacket · instrument · boa | A woman is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-L005061 | 10 | 4 | 17 | 2 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e2,§1)` | $e1 cut · countersue · live; $e2 say; $x1 state | When you crossed the line, you violated the constitutional right," said Charles  |
| subtree-L005062 | 10 | 5 | 16 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2) & Theme($e2,§1)` | $e1 cut · reverse · reject; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 rating · decision · legislation | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-L008484 | 10 | 7 | 27 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Patient($e2,$x4)` | $e1 wear · release · outline; $e2 wear · stick_out · add; $x1 woman · powerhouse · man; $x3 mask · beta · case; $x4 net · cap · law | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L008485 | 10 | 5 | 39 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e2,wear) & Patient($e2,$x3)` | $e1 ride · sit · walk; $e2 wear; $x1 woman · man · boy; $x2 street · bench · range; $x3 hat · shirt · jacket | A man is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-L005130 | 9 | 1 | 21 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit) & Patient($e2,$x2)` | $e1 sit; $e2 wear · hold · rest; $x1 man · woman · girl; $x2 jacket · toy · hand | Two blokes are sitting around a table and holding beers in their hands |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L001915 | 21 | 8 | 38 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000144 | 16 | 7 | 25 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,man)` | $x1 man | The man is not doing a wheelie on a mountain bike |
| subtree-L004925 | 16 | 8 | 30 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L004970 | 14 | 5 | 26 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Coref($x2,$x3) & Experiencer($e1,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $e2 organise; $x1 incident · committee · contract; $x3 judge · state | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000205 | 13 | 4 | 17 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,woman)` | $x1 woman | The woman is not slicing herbs |
| subtree-L002035 | 13 | 6 | 24 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x2,$x1) & Theme($e1,§1)` | $e1 say · decide · add; $x1 state · mother | The settling companies would also assign their possible claims against the under |
| subtree-L004983 | 13 | 3 | 22 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002075 | 12 | 6 | 20 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · decline; $e2 make; $t1 day · week; $x1 spokesman · office · company | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-L002077 | 12 | 5 | 25 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Possession($x1,$x2) & Theme($e1,§1)` | $e1 say · decide · help; $x1 home · job · committee; $x2 mosque · justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L005021 | 12 | 5 | 23 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L008474 | 11 | 3 | 18 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002137 | 10 | 6 | 19 | 2 | `Theme:$e1 ▸ Experiencer($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell; $x1 client; $x2 witness · leadership | "I´m very proud of the citizens of this state," Gov. John Baldacci said after vo |

### With a sentence's own rule

Atoms on a side of a rule (a generic, a frequency, an adjective's implication) with atoms outside it; no restated copy.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000087 | 24 | 7 | 76 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1)` | $e1 jump · stand · sit; $x1 girl · boy · man | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000129 | 18 | 7 | 73 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1)` | $e1 run · play · stand; $x1 dog · man · bird | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000135 | 17 | 10 | 87 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1)` | $e1 run · jump · play; $x1 dog · car · cat | A white dog is running through a snowy trail |
| subtree-L008433 | 14 | 9 | 74 | 13 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member white))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member white))) & Member($x1,dog)` | $e1 run · jump · play; $x1 dog | A white dog is running through a snowy trail |
| subtree-L008442 | 13 | 5 | 54 | 13 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member black))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member black))) & Member($x1,dog)` | $e1 run · play · carry; $x1 dog | The black dog is walking along a tree trunk bridge over water |
| subtree-L000228 | 12 | 6 | 49 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1)` | $e1 run · jump · play; $x1 dog · cat · animal | A brown dog is running through a snowy trail |
| subtree-L002065 | 12 | 4 | 30 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 jump · ride · play; $x1 girl · child · boy; $x2 air · sidewalk · edge | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L008473 | 11 | 6 | 44 | 13 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member brown))) & Member($x1,dog)` | $e1 run · jump · play; $x1 dog | A brown dog is running through a snowy trail |
| subtree-L000288 | 10 | 3 | 22 | 1 | `rule consequent:$r1 ▸ Member($x1,small) [graded] & Agent($e1,$x1)` | $e1 run · play · ride; $x1 dog · boy · girl | A small cat is opening a plastic drawer with its paws and jumping inside |
| subtree-L002120 | 10 | 6 | 50 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · play · sit; $x1 dog · man · bird; $x2 grass · field · sand | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L002121 | 10 | 8 | 50 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · jump · play; $x1 dog · animal · cat; $x2 grass · field · sidewalk | A brown and white dog is biting a dirty tennis ball in a dirt field |
| subtree-L008480 | 10 | 1 | 20 | 13 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow boy (Member young))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow boy (Member young))) & Member($x1,boy)` | $e1 ride · jump · wear; $x1 boy | The young boy is riding a dirt bike through the mud |

### Restated copies

What the label marks: a distribution's per-member rule beside the group's own event. These lead every unfiltered ranking.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000006 | 111 | 48 | 471 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| subtree-L000008 | 106 | 44 | 463 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| subtree-L001834 | 105 | 43 | 457 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| subtree-L000010 | 94 | 43 | 240 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 woman · man · girl; $x2 case · region · race | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-L000011 | 89 | 35 | 196 | 1 | `rule consequent:$r1 ▸ Patient($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $x2 raw · outside | Rusch has also allowed five or more earned runs in each of his last three starts |

### The most widespread overall

Any structure, any label.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000001 | 278 | 141 | 1164 | 1 | `Agent($e1,$x1) & Patient($e1,$x2)` | $e1 wear · play · hold; $x1 man · woman · person; $x2 ball · trick · dog | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-L000002 | 174 | 88 | 395 | 1 | `Experiencer($e1,$x1) & Theme($e1,§1)` | $e1 say · plan · believe; $x1 spokesman · president · report | Im very proud of the citizens of this state, said Gov. John Baldacci, a casino f |
| subtree-L000003 | 173 | 77 | 804 | 1 | `Agent($e1,$x1) & Location($e1,$x2)` | $e1 sit · play · stand; $x1 dog · man · woman; $x2 grass · water · field | Three women are sitting in a village |
| subtree-L001833 | 137 | 64 | 295 | 3 | `Experiencer($e1,$x1) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x1 spokesman · president · prosecutor | Im very proud of the citizens of this state, said Gov. John Baldacci, a casino f |
| subtree-L000006 | 111 | 48 | 471 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| subtree-L000007 | 109 | 38 | 334 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · stand · sit; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000008 | 106 | 44 | 463 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| subtree-L001834 | 105 | 43 | 457 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| subtree-L000009 | 103 | 37 | 521 | 1 | `Agent($e1,$x1) & Member($x1,man)` | $e1 stand · sit · wear; $x1 man · naked | The man is doing a wheelie on a mountain bike |
| subtree-L000010 | 94 | 43 | 240 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 woman · man · girl; $x2 case · region · race | Rusch has also allowed five or more earned runs in each of his last three starts |

## The shape view

One row per set of matching sentences (its largest pattern), by families of the mining share.

### Joins between events: 2–3 atoms

One thing in two events, or a loop among the arguments; no rule, no sealed clause; the match spans several template instances.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002981 | 15 | 14 | 61 | 2 | `Location($e1,$x1) & Location($e2,$x1) & Member($e1,$c1)` | $c1 play · sit · stand; $x1 grass · street · table | A brown dog and a gray dog are playing in the snow |
| subtree-S003247 | 11 | 4 | 16 | 2 | `Agent($e1,$x1) & Also($x1,$e1) & Member($e1,$c1)` | $c1 require · raise · hire; $x1 measure · bill · news | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S003612 | 9 | 3 | 17 | 2 | `Member($e1,$c1) & Theme($e1,$x1) & Theme($e2,$x1)` | $c1 ride · chairman · president; $e2 ride · ceo · mother; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-S006403 | 4 | 1 | 6 | 2 | `Experiencer($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1)` | $c1 look · charged · worried; $x1 department | The new department is charged with patrolling borders, analyzing U.S. intelligen |
| subtree-S008376 | 3 | 2 | 10 | 3 | `Agent($e1,$x1) & At($e2,$x1) & Member($e1,$c1)` | $c1 sit · stare · wear; $e2 kick · smile · stare; $x1 girl · black · dog | A karate practitioner is kicking at another man who is wearing protective gloves |
| subtree-S008511 | 3 | 1 | 4 | 2 | `Also($x1,$e1) & Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · new · think | The WWF also thinks a further 13,000 animals are being caught every year around  |

### Joins between events: 4–5 atoms

The same, larger.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S008951 | 63 | 23 | 227 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · stand · sit; $c2 man · woman · boy; $e2 wear · play · walk | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022692 | 59 | 19 | 208 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Member($x1,$c3)` | $c1 wear · stand · sit; $c2 wear · play · ride; $c3 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022696 | 57 | 25 | 172 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · open; $c2 shirt · jacket · hat; $e2 wear · sit · stand; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S022756 | 51 | 19 | 172 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 wear · hold · play; $c2 man · woman · boy; $e2 wear · sit · walk; $x2 shirt · jacket · hat | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022879 | 41 | 17 | 139 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 man · woman · boy; $c2 shirt · jacket · hat; $e1 wear · hold · open; $e2 wear · sit · walk | A player dressed in black and white is holding up the tennis racket and is waiti |
| subtree-S009229 | 32 | 18 | 110 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1)` | $c1 sit · run · stand; $e2 wear · open · hold; $x1 man · woman · dog; $x2 grass · street · sidewalk | A little boy is running on the ground and playing with a little girl |
| subtree-S022982 | 31 | 16 | 105 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($e2,$c2)` | $c1 sit · run · stand; $c2 wear · open · hold; $x1 man · woman · dog; $x2 grass · street · sidewalk | A little boy is running on the ground and playing with a little girl |
| subtree-S009265 | 29 | 7 | 73 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2)` | $c1 person · woman · child; $c2 wear · play · stand; $e2 play · read · jump | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S009295 | 27 | 10 | 55 | 4 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 stand · sit · roll; $c2 look · say · argue; $x1 dog · man · classroom | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-S023013 | 27 | 15 | 79 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 jacket · shirt · suit; $e1 wear · hold · use; $e2 wear · hold · specify; $x1 woman · man · girl; $x3 coat · net · glass | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S023037 | 26 | 12 | 84 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Patient($e2,$x3)` | $c1 sit · ride · walk; $e2 wear · open · hold; $x1 man · woman · dog; $x2 grass · street · sand; $x3 drawer · hat · shirt | A man is wearing a beret and is riding the bicycle on a recreation trail |
| subtree-S023041 | 26 | 4 | 67 | 15 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Member($x2,(Narrow $c1 (Member $c2))) & Patient($e1,$x2)` | $c1 shirt · jacket · suit; $c2 pink · blue · black; $e1 wear · hold · hold_up; $e2 wear · sit · hold; $x1 woman · man · girl | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S023082 | 25 | 6 | 63 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Member($e2,$c3)` | $c1 person · woman · boy; $c2 wear · stand · sit; $c3 read · jump · dance | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S023083 | 25 | 12 | 89 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · run · stand; $c2 man · woman · dog; $e2 wear · open · look; $x2 grass · street · sidewalk | A little boy is running on the ground and playing with a little girl |
| subtree-S023113 | 24 | 7 | 48 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 pant · bead · home; $e1 wear · target · destroy; $e2 wear · pound · allow; $x1 woman · man · girl; $x3 shirt · jacket · southern | Revelations of the expenditures shocked some employees at Delta, an airline that |
| subtree-S023114 | 24 | 13 | 83 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | $c1 sit · stand · run; $c2 grass · street · sidewalk; $e2 wear · look · play; $x1 man · woman · dog | A little boy is running on the ground and playing with a little girl |
| subtree-S023171 | 22 | 11 | 69 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 woman · man · girl; $e1 wear · hold · use; $e2 wear · hold · fire; $x2 jacket · shirt · suit; $x3 coat · net · gun | Revelations of the expenditures shocked some employees at Delta, an airline that |
| subtree-S023284 | 20 | 5 | 48 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Patient($e1,$x2)` | $c1 person · child · boy; $c2 wear · play · hold; $e2 sit · stand · tug; $x2 southern · case · road | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S023286 | 20 | 9 | 70 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,$c1) & Member($x2,$c2)` | $c1 man · woman · dog; $c2 grass · street · sidewalk; $e1 sit · run · stand; $e2 wear · look · play | A little boy is running on the ground and playing with a little girl |
| subtree-S023287 | 20 | 7 | 67 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,$c1) & Patient($e2,$x3)` | $c1 man · woman · dog; $e1 sit · ride · walk; $e2 wear · open · hold; $x2 grass · street · sand; $x3 drawer · hat · shirt | A man is wearing a beret and is riding the bicycle on a recreation trail |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002359 | 52 | 24 | 90 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · play · walk; $c2 man · woman · dog | The cat isn't playing with a watermelon |
| subtree-S022878 | 41 | 15 | 74 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 target · impose · have; $c2 say · aim · plan; $c3 spokesman · president · prosecutor; $e2 develop · arrest | Im very proud of the citizens of this state, said Gov. John Baldacci, a casino f |
| subtree-S022964 | 32 | 18 | 62 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 have · impose · begin; $c2 say · believe · announce; $e2 organise; $x1 isp; $x2 judge · lawyer · santa_clara-based | "I´m very proud of the citizens of this state," Gov. John Baldacci said after vo |
| subtree-S002564 | 26 | 8 | 36 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & GroupOf($x1,$c2)` | $c1 play · wear · walk; $c2 child · man · person | The kids are not chasing each other in the sand |
| subtree-S009406 | 23 | 15 | 44 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Not ▸ Patient($e1,$x2) & Member($x1,$c2)` | $c1 wear · perform · play; $c2 man · woman · lady; $x2 patient · ankle · sauce | The panda is not eating bamboo |
| subtree-S009418 | 23 | 15 | 54 | 6 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($x1,$c2) & Theme($e1,§1)` | $c1 comment · make_sense · help; $c2 deal · report · spokesman; $e1 say · decline · aim | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023150 | 23 | 15 | 53 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 comment · make_sense · help; $c2 say · decline · aim; $c3 deal · report · spokesman | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023209 | 21 | 8 | 38 | 8 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 allow · impose · come; $c2 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-S023370 | 19 | 5 | 35 | 7 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($x2,$c2) & Theme($e1,§1)` | $c1 jaywalk · impose · talk; $c2 spokesman · president · judge; $e1 say · consider · argue; $e2 arrest · develop; $x1 state · victim · damage | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S023623 | 17 | 2 | 24 | 7 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Mod $x2))) & Theme($e1,§1)` | $c1 help · pleased · believe; $c2 president · spokesman · report; $e1 say · aim · state | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S009843 | 16 | 8 | 28 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Theme($e1,§1) & Time($e1,$t1)` | $c1 impose · comment · take_over; $c2 say · announce · tell; $e2 make; $t1 day · year · week | "I really liked him and I still do," Cohen Alon told the Herald yesterday. |
| subtree-S023792 | 15 | 8 | 31 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($e1,$c2) & Member($x1,$c3)` | $c1 make_sense · provide · start; $c2 say · add · announce; $c3 deal · office · damage; $x2 president · spokesman · document | He said the situation undermines efforts to win international co-operation in th |

### With a sentence's own rule

Atoms on a side of a rule (a generic, a frequency, an adjective's implication) with atoms outside it; no restated copy.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S022670 | 103 | 51 | 416 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · boy; $e1 run · jump · sit | The royal household was bracing itself for any more revelations in A Royal Duty, |
| subtree-S022689 | 60 | 35 | 164 | 23 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1))) & Patient($e1,$x1)` | $c1 white · blue · black; $c2 shirt · jacket · dog; $e1 wear · use · raise | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S022725 | 52 | 26 | 141 | 18 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 white · blue · black; $c2 shirt · jacket · dog; $e1 wear · raise · cut; $x2 man · woman · boy | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S022822 | 45 | 19 | 130 | 14 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 green · snowy · brown; $c2 room · water · field; $e1 sit · stand · play | A dog is running on a snowy path |
| subtree-S022829 | 44 | 19 | 128 | 13 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($e1,$c3) & Member($x1,$c2)` | $c1 green · snowy · brown; $c2 room · water · field; $c3 sit · stand · play | A dog is running on a snowy path |
| subtree-S022840 | 43 | 23 | 112 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 young · little · yellow; $c2 dog · man · boy; $e1 wear · hold · play; $x2 ball · dog · shirt | The royal household was bracing itself for any more revelations in A Royal Duty, |
| subtree-S022854 | 42 | 25 | 175 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,$c2)` | $c1 black · young · brown; $c2 dog · man · girl; $e1 run · sit · play; $x2 grass · water · sidewalk | A little boy is running on the ground and playing with a little girl |
| subtree-S022857 | 42 | 16 | 121 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Location($e1,$x1) & Member($x1,$c2)` | $c1 green · snowy · brown; $c2 water · room · field; $e1 sit · stand · play; $x2 dog · man · woman | A dog is running on a snowy path |
| subtree-S022877 | 41 | 15 | 110 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x2) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x1)` | $c1 white · blue · black; $c2 wear · cut · hold; $c3 man · woman · boy; $x1 shirt · jacket · dog | The new WPAN standard uses the 2.4-GHz unlicensed frequency band and specifies r |
| subtree-S022940 | 36 | 18 | 83 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x1) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | $c1 young · little · brown; $c2 wear · hold · chase; $c3 ball · dog · shirt; $x1 dog · man · girl | A fur scarf is being held by an Asian woman |
| subtree-S002472 | 33 | 7 | 42 | 2 | `rule consequent:$r1 ▸ Location($e1,$x1) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x1,$c2)` | $c1 run · play · stand; $c2 grass · water · beach | There is no little boy running on the ground and playing with a little girl |
| subtree-S009236 | 31 | 7 | 40 | 2 | `rule consequent:$r1 ▸ Agent($e1,$x1) [denied] & rule consequent:$r1 ▸ Location($e1,$x2) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x2,$c2)` | $c1 run · play · stand; $c2 grass · water · beach | There is no little boy running on the ground and playing with a little girl |

### Restated copies

What the label marks: a distribution's per-member rule beside the group's own event. These lead every unfiltered ranking.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000014 | 210 | 100 | 781 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S000015 | 201 | 93 | 714 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · stand · sit; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S002221 | 200 | 93 | 712 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | $c1 play · stand · sit; $c2 person · man · child; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S000022 | 167 | 73 | 622 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Member($e1,$c1)` | $c1 play · sit · stand; $x1 woman · man · person | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S000027 | 127 | 58 | 315 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule consequent:$r1 ▸ Patient($e1,$x1)` | $c1 wear · play · eat; $x1 case · region · race | Rusch has also allowed five or more earned runs in each of his last three starts |

### The most widespread overall

Any structure, any label.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000001 | 458 | 218 | 2694 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | $c1 stand · play · run; $x1 man · dog · woman | The value of the deal has increased since BP first announced it in February. |
| subtree-S000002 | 372 | 192 | 1449 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | $c1 wear · play · hold; $x1 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S002214 | 296 | 130 | 1928 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 stand · run · jump; $c2 man · dog · woman | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S008901 | 289 | 139 | 1157 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 black · young · white; $c2 dog · man · boy | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S002219 | 278 | 141 | 1164 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · play · hold; $x1 man · woman · person; $x2 ball · trick · dog | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S002220 | 252 | 141 | 938 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 wear · hold · cut; $c2 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S000012 | 219 | 101 | 513 | 1 | `Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · look · full; $x1 spokesman · dog · president | Im very proud of the citizens of this state, said Gov. John Baldacci, a casino f |
| subtree-S000013 | 215 | 98 | 917 | 1 | `Location($e1,$x1) & Member($e1,$c1)` | $c1 sit · play · stand; $x1 grass · water · field | Three women are sitting in a village |
| subtree-S000014 | 210 | 100 | 781 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S000015 | 201 | 93 | 714 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · stand · sit; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |

### The shapes with the most lexicalizations

By the number of different class tuples that filled the shape.

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002214 | 296 | 130 | 1928 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **773 lexicalizations** — $c1 stand · run · jump; $c2 man · dog · woman | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S002220 | 252 | 141 | 938 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | **586 lexicalizations** — $c1 wear · hold · cut; $c2 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S008901 | 289 | 139 | 1157 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | **559 lexicalizations** — $c1 black · young · white; $c2 dog · man · boy | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S000001 | 458 | 218 | 2694 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | **535 lexicalizations** — $c1 stand · play · run; $x1 man · dog · woman | The value of the deal has increased since BP first announced it in February. |
| subtree-S008902 | 196 | 111 | 778 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | **476 lexicalizations** — $c1 wear · hold · cut; $c2 ball · trick · dog; $x1 man · woman · person | The Department of Foreign Affairs yesterday updated its travel warning on Indone |
| subtree-S002223 | 179 | 78 | 787 | 1 | `Location($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **421 lexicalizations** — $c1 sit · stand · play; $c2 grass · water · field | Three women are sitting in a village |
| subtree-S022665 | 136 | 75 | 624 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | **421 lexicalizations** — $c1 wear · hold · cut; $c2 man · woman · person; $c3 ball · trick · dog | A fur scarf is being held by an Asian woman |
| subtree-S000002 | 372 | 192 | 1449 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | **414 lexicalizations** — $c1 wear · play · hold; $x1 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S002221 | 200 | 93 | 712 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | **406 lexicalizations** — $c1 play · stand · sit; $c2 person · man · child; $x2 raw · young · outside | Rusch has also allowed five or more earned runs in each of his last three starts |
| subtree-S008903 | 173 | 82 | 858 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | **400 lexicalizations** — $c1 wear · hold · play; $c2 man · woman · person; $x2 ball · trick · dog | The royal household was bracing itself for any more revelations in A Royal Duty, |
| subtree-S008904 | 152 | 66 | 715 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | **368 lexicalizations** — $c1 sit · stand · play; $c2 grass · water · field; $x1 dog · man · woman | Three women are sitting in a village |
| subtree-S002219 | 278 | 141 | 1164 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | **344 lexicalizations** — $c1 wear · play · hold; $x1 man · woman · person; $x2 ball · trick · dog | Rusch has also allowed five or more earned runs in each of his last three starts |

### Shapes whose matches all share a class

The generalizer keeps the class every match has; the pattern shown is that generalization (the record's `generalization`).

| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000142 | 40 | 34 | 89 | 1 | `Member($t1,day) & Weekday($t1,$c1)` | keeps day | "I´m very proud of the citizens of this state," Gov. John Baldacci said after vo |
| subtree-S002446 | 40 | 31 | 86 | 2 | `Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c1)` | keeps day | "I´m very proud of the citizens of this state," Gov. John Baldacci said after vo |
| subtree-S009193 | 39 | 31 | 85 | 2 | `Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day | "I´m very proud of the citizens of this state," Gov. John Baldacci said after vo |
| subtree-S023378 | 19 | 16 | 40 | 4 | `Member($e1,$c1) & Member($t1,day) & Patient($e1,$x1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S024015 | 13 | 16 | 32 | 4 | `Agent($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day | U.S. Agriculture Secretary Ann Veneman kicks off the three-day Ministerial Confe |
| subtree-S024151 | 12 | 4 | 20 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Agent($e1,$x1) & Member($e1,tell) & Recipient($e1,$x2) & Theme($e1,§1)` | keeps tell | "I go to their website and start complaining to them, would you please, please,  |
| subtree-S024153 | 12 | 5 | 18 | 3 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S024300 | 11 | 7 | 21 | 4 | `Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| subtree-S024662 | 10 | 7 | 19 | 4 | `Location($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S011360 | 8 | 2 | 18 | 4 | `Experiencer($e1,$x1) & Member($e1,full) & Member($x1,$c1) & Of($e1,$c2)` | keeps full | A dog is running alongside a fence on a track full of dirt |
| subtree-S025451 | 8 | 3 | 12 | 4 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S025457 | 8 | 3 | 12 | 4 | `Theme:$e1 ▸ Agent($e2,$x1) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |

