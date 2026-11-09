# Connected patterns of run `first` — 2026-11-09 04:15

§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized view keeps the class symbols, the shape view turns them into class variables. Every row is a CANDIDATE with its evidence, not a finding.

- key dials: `{"polarity": "three", "tense": "evidence", "habitual": "evidence"}`
- parameters: `{"min_atoms": 2, "max_atoms": 5, "min_families": 3, "support_role": "mine", "max_variables": null, "exclude_heads": [], "max_embeddings": 200000, "derived_rule_templates": ["distribution"]}`
- corpus: 6,363 sentences in 1,341 families ({'evaluate': 585, 'mine': 756}). The 756 families of the `mine` share decide which patterns are candidates and supply their evidence. The other 585 are held out: they are counted beside it and they check the generalization, nothing else.
- time (s): {'lexicalized': 22.3, 'shape': 130.6, 'tests': 125.2, 'renamed_corpus': 184.1, 'total': 465.0}

## How many

| view | connected atoms | atom sets found | distinct patterns | candidates | using a distribution rule | **without a distribution rule** | tree | join | inside one template instance | after merging candidates with identical matches |
|---|---|---|---|---|---|---|---|---|---|---|
| lexicalized | 2 | 79,493 | 9,688 | 2,082 | 354 | **1,728** | 1,676 | 52 | 1,057 | |
| lexicalized | 3 | 130,550 | 29,142 | 3,398 | 922 | **2,476** | 2,246 | 230 | 1,123 | |
| lexicalized | 4 | 186,661 | 52,024 | 4,017 | 1,744 | **2,273** | 1,897 | 376 | 865 | |
| lexicalized | 5 | 196,745 | 55,697 | 3,743 | 2,220 | **1,523** | 1,211 | 312 | 461 | |
| lexicalized | all | 593,449 | 146,551 | **13,240** | 5,240 | **8,000** | 7,030 | 970 | 3,506 | **2,795** |
| shape | 2 | 143,757 | 8,054 | 2,439 | 451 | **1,988** | 1,932 | 56 | 1,089 | |
| shape | 3 | 340,405 | 51,691 | 7,374 | 1,599 | **5,775** | 5,437 | 338 | 2,576 | |
| shape | 4 | 724,567 | 164,321 | 15,206 | 4,311 | **10,895** | 9,866 | 1,029 | 4,033 | |
| shape | 5 | 1,304,311 | 344,892 | 24,052 | 9,364 | **14,688** | 12,685 | 2,003 | 4,190 | |
| shape | all | 2,513,040 | 568,958 | **49,071** | 15,725 | **33,346** | 29,920 | 3,426 | 11,888 | **4,322** |

What each column counts:

- *view*: `lexicalized` patterns keep the class symbols (`dog`, `run`); `shape` patterns turn each class symbol into a class variable (`$c1`), so one shape covers many lexicalized patterns.
- *connected atoms*: the size of a pattern — the number of atoms in it, each tied to another by a shared variable (the same event, thing, time or rule). A row counts the patterns of exactly that size; the `all` row adds the rows up.
- *atom sets found*: the number of occurrences the miner looked at — every connected set of that many atoms inside one sentence, counted once each, over the sentences of every share; a pattern found in 500 sentences contributes 500 here and 1 to the next column. A set is only looked at when its smaller parts are already frequent (a pattern cannot be frequent unless its parts are).
- *distinct patterns*: the different patterns among those atom sets. Two atom sets are the same pattern when they differ only in which events and things they name.
- *candidates*: the distinct patterns found in at least 3 families of the `mine` share (it has 756). Each is one record in `patterns.<view>.jsonl`.
- *using a distribution rule*: the candidates in which at least one atom comes from the rule that the `distribution` template adds for a group. That rule says of each member what the sentence's other statements already say of the group (the example below), so such a candidate shows how we write a plural down, not something the text adds. These are labelled, never dropped, and each view lists them in a table of their own.
- *without a distribution rule*: the other candidates. Read these first: the four columns to its right are about these candidates, and so is every table of a view but its last.
- *tree*: a pattern in which every atom hangs from one event or thing, each thing sits under one event only, and the arguments close no loop — what a rooted-subtree miner could state. Example: `Agent($e1,$x1) & Patient($e1,$x2)`.
- *join*: every other pattern. Something is an argument of two different events (`Agent($e1,$x1) & Experiencer($e2,$x1)`), or the arguments close a loop (`Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)`, as in "a woman is arranging her hair"). This is what the binding-aware view adds to the tree view.
- *inside one template instance*: in every match, all the atoms were emitted by a single template instance of the parse (one `activity` instance emits an event's class, its agent and its patient). Such a pattern repeats a template's own output and recurs because the template does (§5.3's template-internal label).
- *after merging candidates with identical matches*: candidates that match exactly the same sentences of the `mine` share cannot be told apart by where they occur — typically a part of a larger pattern that never occurs without the rest. Merged, each such group counts once. The tables below show one row per group, its largest pattern, with the number of candidates merged into it.
- Every one of these is a label on the records. Nothing is dropped.

The distribution rule, on "Three women are sitting in a village":

```
(: l1_location (Location sk_sit_1 sk_village_1) (STV 1.0 0.99))       ; said of the group's sitting
(: r1_implication
   (Implication (PartOf $x sk_group_1)                               ; the distribution rule: for each member $x …
                (And (Member (sk_sit $x) sit) (Agent (sk_sit $x) $x) (Ongoing (sk_sit $x))
                     (Location (sk_sit $x) sk_village_1)))            ; … the same again
   (STV 1.0 0.9))
```

A pattern such as `rule consequent:$r1 ▸ Location($e1,$x1) & Location($e2,$x1)` uses it: `$e1` is a member's sitting inside the rule, `$e2` the group's sitting outside it, and both are in the same place — two events joined by a place only because the second statement repeats the first.

## Held-out recurrence, the generalizer and the two tests

A candidate *recurs* when it also matches a sentence of a held-out family. One family is enough, so the share is to be read with the support beside it. The *generalizer* computes the tightest pattern that a candidate's `mine` matches share; the held-out matches then check it.

**lexicalized**

- recurrence: 6,180 of the 8,000 candidates without a distribution rule (77%) also occur in a held-out family; of all 13,240 candidates, 10,359 (78%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 59% of 3,587 · 4: 83% of 1,398 · 5: 96% of 1,135 · 6 to 9: 94% of 1,144 · 10 or more: 99% of 736
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 8,000 of the 8,000
- the two tests, all 13,240 candidates: the renaming test is passed by 13,240, the broken-link test by 13,240

**shape**

- recurrence: 26,570 of the 33,346 candidates without a distribution rule (80%) also occur in a held-out family; of all 49,071 candidates, 39,034 (80%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 67% of 14,581 · 4: 79% of 6,060 · 5: 89% of 3,057 · 6 to 9: 94% of 5,056 · 10 or more: 99% of 4,592
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 31,885 of the 33,346 and is tighter — a class every `mine` match shares — for 1,461; 1,034 of those have held-out matches, and the class holds in every one of them for 667 (65%)
- the two tests, all 49,071 candidates: the renaming test is passed by 49,071, the broken-link test by 49,071

The whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: lexicalized: the identical table (13,240 patterns); shape: the identical table (49,071 patterns)

## Reading the tables

Each row is one group of candidates with identical matches, shown as its largest pattern.

- *mining families*: the support — the families of the `mine` share in which the pattern occurs. *mining sentences*: the sentences of that share in which it occurs.
- *held-out families*: the families of the other shares in which it occurs.
- *candidates merged into this row*: how many candidates match exactly these mining sentences (1 = only this one).
- *pattern*: `$e` is an event, `$x` a thing, `$t` a time, `$c` a class (shape view), `$r` a rule of the sentence; the same variable twice is the same event or thing, two variables are two. `Theme:$e1 ▸ …` marks an atom inside the clause that is the theme of `$e1` (a reported clause), `Not ▸ …` one under a negation, `rule premise:$r1 ▸ …` and `rule consequent:$r1 ▸ …` the two sides of a rule. `§1` stands for a clause in that argument place. `[graded]` and `[denied]` give the band of the statement's strength (no tag: asserted).
- *what the variables stood for*: the commonest classes of each variable's fillers in the `mine` matches; fillers with no class of their own (names, pronouns) are left out here and listed on the record.
- *an example*: one of the sample matches kept on the record (a `mine` sentence chosen by a hash, not the most typical).

## The lexicalized view

One row per group, by mining families. Every table but the last holds only candidates without a distribution rule.

### Joins between events: 2–3 atoms

What the binding-aware view adds that a rooted-subtree miner could not state: one thing in two events, or a loop among the arguments — kept clean: no rule, no sealed clause, and the match spans several template instances, so the pattern is not one template's own output.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000009 | 116 | 102 | 292 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · sit · stand; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L002085 | 93 | 76 | 219 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2)` | $e1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · boy; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L002126 | 37 | 39 | 90 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2)` | $e1 sit · run · walk; $e2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L000068 | 34 | 25 | 53 | 1 | `Patient($e1,$x1) & Patient($e2,$x1)` | $e1 wear · improve · rise; $e2 wear · add · pound; $x1 rate · statement · southern | Spot gold was quoted at $358.65/359.15 an ounce at 0500 GMT, having darted as hi |
| freq-pattern-L000074 | 32 | 17 | 49 | 1 | `Agent($e1,$x1) & Patient($e2,$x1)` | $e1 wear · stand · sit; $e2 dress · hold · surround; $x1 man · woman · euro | A woman dressed in elegant clothing is inside a crowd of people and is looking d |
| freq-pattern-L000087 | 28 | 14 | 44 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1)` | $e1 stand · sit · countersue; $e2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L002153 | 25 | 22 | 58 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man)` | $e1 wear · sit · stand; $e2 wear · sit · walk; $x1 man | The man in a hat suited for cowboys is walking through a market and is putting a |
| freq-pattern-L002188 | 20 | 16 | 38 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1)` | $e1 wear · stand · sit; $e2 wear · sit · tinker; $e3 wear · calculate · build; $x1 man · woman · girl | Three young men are furiously running, jumping and kicking near a vending machin |
| freq-pattern-L002189 | 20 | 17 | 32 | 1 | `Agent($e1,$x1) & Patient($e1,$x2) & Patient($e2,$x2)` | $e1 wear · issue · pound; $e2 wear · add · pound; $x1 man · guinea_pig · rain; $x2 statement · southern · wife | A coalition of campaign groups, including the militant national students body, i |
| freq-pattern-L002195 | 19 | 18 | 33 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1)` | $e1 wear · open · sit; $e2 jump · wear · stick_out; $x1 man · cat · woman | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L002209 | 18 | 8 | 21 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Theme($e2,§1)` | $e1 countersue · live · reverse; $e2 say · argue · rule; $x1 court · mother | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L002232 | 17 | 20 | 37 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Theme($e1,$x2)` | $e1 carry · ride · throw; $e2 wear · approach · run; $x1 woman · man · dog; $x2 ball · unicycle · car | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-L002269 | 16 | 18 | 39 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman)` | $e1 wear · sit · dance; $e2 wear · hold · play; $x1 woman · seated | A woman is crouching down next to a dog and is smiling at a young girl sitting o |
| freq-pattern-L000217 | 15 | 26 | 36 | 1 | `Location($e1,$x1) & Location($e2,$x1)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| freq-pattern-L002292 | 15 | 6 | 24 | 1 | `Agent($e1,$x1) & Patient($e1,$x2) & Patient($e2,$x1)` | $e1 wear · close · sue; $e2 dress · surround · splash; $x1 man · woman · camera; $x2 shirt · mask · birthday | Children are surrounding a girl in a brown dress who is closing her eyes |
| freq-pattern-L002309 | 14 | 7 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L002310 | 14 | 13 | 25 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,stand)` | $e1 stand; $e2 play · wear · pull; $x1 man · girl · woman | Adults and children are standing and playing in front of steps near a desert are |
| freq-pattern-L002313 | 14 | 23 | 34 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Location($e2,$x2)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| freq-pattern-L002347 | 13 | 12 | 24 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,play)` | $e1 play; $e2 stand · sing · play; $x1 woman · girl · boy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L002348 | 13 | 6 | 18 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x2)` | $e1 surround · sue · operate; $e2 close · wear · sue; $x1 man · fountain · priest; $x2 woman · camera · girl | Authorities evacuated residents and closed off the road leading to Waterman Cany |

### Joins between events: 4–5 atoms

The same question, the longer joins.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L005499 | 45 | 40 | 89 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005505 | 32 | 35 | 93 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · sit · hold; $x1 man · woman · boy; $x2 shirt · jacket · hat | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005506 | 30 | 26 | 73 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Patient($e2,$x3)` | $e1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L005533 | 20 | 16 | 46 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man) & Patient($e1,$x2)` | $e1 wear · hold · hold_up; $e2 sit · wear · stand; $x1 man; $x2 sign · shirt · suit | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005536 | 19 | 14 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2)` | $e1 wear · calculate · pound; $e2 wear · sit · stand; $e3 wear · build · laugh; $x1 man · woman · girl; $x2 shirt · jacket · route | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L005569 | 17 | 16 | 32 | 1 | `Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)` | $e1 stick_out · raise · flap; $x1 girl · woman · boy; $x3 tongue · dividend · forecast | In addition, Goldman raised its quarterly dividend to 25 cents a share, up from  |
| freq-pattern-L005597 | 16 | 0 | 20 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say · make_clear · hear; $x1 daughter · mother · secretary; $x2 federal · unit · briton | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| freq-pattern-L009543 | 16 | 14 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · pound · develop; $e2 wear · build · destroy; $e3 wear · sit · pose; $x1 woman · man · girl; $x2 shirt · jacket · southern; $x3 sweatshirt · northern · hat | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L009544 | 16 | 19 | 41 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear; $e2 wear · hold · perform; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 boy · sweatshirt · trick | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L009562 | 15 | 12 | 37 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e2,wear) & Patient($e2,$x3)` | $e1 sit · walk · stand; $e2 wear; $x1 man · boy · woman; $x2 table · grass · bench; $x3 hat · shirt · jacket | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005630 | 14 | 12 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3)` | $e1 wear · open · specify; $e2 jump · sit · wear; $x1 cat · boy · man; $x3 drawer · plan · suit | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005631 | 14 | 11 | 21 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Possession($x3,$x2)` | $e1 wear · open · sit; $e2 jump · specify · hold; $x1 cat · man · boy; $x3 government · pocket · hand | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005632 | 14 | 9 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x3) & Patient($e2,$x3)` | $e1 wear · issue · pound; $e2 wear · add · pound; $x1 man · rain · growth; $x2 woman · colleague · dog; $x3 statement · southern · fund | A coalition of campaign groups, including the militant national students body, i |
| freq-pattern-L009575 | 14 | 0 | 18 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say; $x1 daughter · secretary · sheriff; $x2 federal · union · store | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| freq-pattern-L005673 | 12 | 3 | 27 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit) & Patient($e2,$x2)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman; $x2 hat · jacket · toy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L005674 | 12 | 17 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman) & Patient($e1,$x2)` | $e1 wear · play · beat; $e2 wear · hold · sit; $x1 woman · seated; $x2 jacket · instrument · boa | The woman is sitting on a bench and is wearing a gray jacket and black pants |
| freq-pattern-L005716 | 11 | 9 | 20 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,man)` | $e1 sit · stand · perform; $e2 wear · rub · sing; $x1 man; $x2 table · rail · street | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005718 | 11 | 19 | 30 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Location($e1,$x3) & Location($e2,$x3)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 dog · woman · boy; $x3 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| freq-pattern-L005719 | 11 | 5 | 14 | 2 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e2,§1)` | $e1 countersue · live · allude; $e2 say | When you crossed the line, you violated the constitutional right," said Charles  |
| freq-pattern-L005720 | 11 | 4 | 11 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2) & Theme($e2,§1)` | $e1 reverse · cite · seek; $e2 say · argue · rule; $x1 court; $x2 decision · injunction · defense | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |

### Across a sealed clause

The scope question: something inside a reported or negated clause tied to something outside it. A tree miner cannot state this either, and a scope error in the parses or the emitter would show here first.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000132 | 20 | 18 | 21 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,man)` | $x1 man | The man is not eating a banana by a tree |
| freq-pattern-L002187 | 20 | 9 | 27 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell · announce; $e2 help · talk; $x2 unstable | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L005594 | 16 | 8 | 21 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 unstable | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L000206 | 15 | 13 | 15 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,woman)` | $x1 woman | The woman is not handling a frog |
| freq-pattern-L002285 | 15 | 7 | 16 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x2,$x1) & Theme($e1,§1)` | $e1 say · decide · according_to; $x1 state | With Smithfields leadership, Farmland Foods will succeed and continue to sustain |
| freq-pattern-L002344 | 13 | 7 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Possession($x1,$x2) & Theme($e1,§1)` | $e1 say · decide · announce; $x1 home · job · contract; $x2 mosque · son · chief_justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L005658 | 13 | 4 | 18 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Theme($e1,§1)` | $e1 say · announce · help; $x2 report · right · maximum; $x3 unstable | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L005660 | 13 | 6 | 16 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 help · talk | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L002373 | 12 | 7 | 13 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · admit; $e2 make; $t1 day · week; $x1 office · company · board | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-L002376 | 12 | 6 | 12 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · admit; $e2 make; $t1 day; $x1 sentence · disease · form | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-L005672 | 12 | 5 | 15 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Coref($x2,$x3) & Experiencer($e1,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $e2 kill; $x1 contract · maximum · sentence | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L005711 | 11 | 7 | 17 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Possession($x2,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $x1 court; $x2 home · job · contract; $x3 mosque · chief_justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |

### With a rule of the sentence

How the sentence's own rules relate to the atoms around them: atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule. A rule mis-scoped by the lifter or the emitter would show here.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000085 | 28 | 26 | 65 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1)` | $e1 jump · stand · sit; $x1 girl · boy · man | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L000124 | 21 | 24 | 55 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1)` | $e1 run · play · stand; $x1 dog · bird · man | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L000125 | 21 | 19 | 61 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1)` | $e1 run · play · jump; $x1 dog · car · cat | A white dog is running through a snowy trail |
| freq-pattern-L000156 | 17 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1)` | $e1 run · lie · play; $x1 dog · cat · duck | A brown dog is running through a snowy trail |
| freq-pattern-L009540 | 16 | 14 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member brown))) & Member($x1,dog)` | $e1 run · lie · play; $x1 dog | A brown dog is running through a snowy trail |
| freq-pattern-L009541 | 16 | 16 | 50 | 13 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member white))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member white))) & Member($x1,dog)` | $e1 run · play · jump; $x1 dog | A white dog is running through a snowy trail |
| freq-pattern-L002302 | 14 | 11 | 26 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 jump · play · ride; $x1 girl · boy · child; $x2 edge · air · sidewalk | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L009569 | 14 | 17 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member black))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member black))) & Member($x1,dog)` | $e1 play · run · carry; $x1 dog | The black dog is walking along a tree trunk bridge over water |
| freq-pattern-L002367 | 12 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · play · stand; $x1 dog · bird · child; $x2 grass · field · sand | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L002368 | 12 | 10 | 23 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · lie · play; $x1 dog · duck; $x2 beach · grass · air | A brown and white dog is biting a dirty tennis ball in a dirt field |
| freq-pattern-L002369 | 12 | 11 | 31 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · jump_up · jump; $x1 dog · animal · bird; $x2 grass · field · air | A brown and white dog is biting a dirty tennis ball in a dirt field |
| freq-pattern-L009619 | 11 | 10 | 22 | 12 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,(Narrow dog (Member brown)))` | $e1 run · lie · play; $x1 dog; $x2 beach · grass · air | A brown and white dog is biting a dirty tennis ball in a dirt field |

### The most widespread overall

The plain top by support, any structure, any label: what dominates the corpus — mostly a template's own output, which is why the tables above exclude it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000001 | 306 | 283 | 895 | 1 | `Agent($e1,$x1) & Patient($e1,$x2)` | $e1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-L000002 | 196 | 192 | 668 | 1 | `Agent($e1,$x1) & Location($e1,$x2)` | $e1 sit · stand · play; $x1 man · dog · person; $x2 grass · beach · field | Three women are sitting in a village |
| freq-pattern-L000003 | 187 | 98 | 283 | 1 | `Experiencer($e1,$x1) & Theme($e1,§1)` | $e1 say · according_to · agree; $x1 spokesman · report · company | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-L002083 | 143 | 68 | 208 | 3 | `Experiencer($e1,$x1) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x1 spokesman · company · president | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| freq-pattern-L000007 | 118 | 107 | 439 | 1 | `Agent($e1,$x1) & Member($x1,man)` | $e1 stand · sit · wear; $x1 man · naked · busy | A man is eating a banana |
| freq-pattern-L000009 | 116 | 102 | 292 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · sit · stand; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L002085 | 93 | 76 | 219 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2)` | $e1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · boy; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L000012 | 92 | 55 | 139 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1)` | $e1 say · decline · according_to; $e2 make · provide · help; $x1 representative · office · damage | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-L000013 | 91 | 87 | 234 | 1 | `Agent($e1,$x1) & Theme($e1,$x2)` | $e1 ride · carry · put; $x1 man · woman · person; $x2 bike · horse · ball | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-L000015 | 85 | 63 | 137 | 1 | `Coref($x1,$x2) & Possession($x3,$x1)` | $x1 isp; $x2 boy · man · pregnant; $x3 tongue · apartment · dividend | In exchange, North Korea would be required to end its nuclear weapons program. |

### Candidates using a distribution rule

The artifact set, last: the candidates the *using a distribution rule* label took out of the tables above. Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000006 | 125 | 108 | 397 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| freq-pattern-L000008 | 117 | 103 | 391 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| freq-pattern-L002084 | 117 | 102 | 387 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| freq-pattern-L000010 | 104 | 82 | 196 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 man · woman · person; $x2 southern · letter · home | Two British women lost a desperate court battle on Wednesday to have babies usin |
| freq-pattern-L000011 | 102 | 66 | 160 | 1 | `rule consequent:$r1 ▸ Patient($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | DNA tests will be performed to confirm his identity. |

## The shape view

One row per group, by mining families. Every table but the last holds only candidates without a distribution rule.

### Joins between events: 2–3 atoms

What the binding-aware view adds that a rooted-subtree miner could not state: one thing in two events, or a loop among the arguments — kept clean: no rule, no sealed clause, and the match spans several template instances, so the pattern is not one template's own output.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002476 | 116 | 102 | 292 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1)` | $c1 wear · sit · stand; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S002722 | 34 | 25 | 53 | 2 | `Member($e1,$c1) & Patient($e1,$x1) & Patient($e2,$x1)` | $c1 wear · improve · rise; $e2 wear · add · pound; $x1 rate · statement · southern | Spot gold was quoted at $358.65/359.15 an ounce at 0500 GMT, having darted as hi |
| freq-pattern-S002759 | 32 | 17 | 49 | 3 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e2,$x1)` | $c1 wear · stand · sit; $e2 dress · hold · surround; $x1 man · woman · euro | A woman dressed in elegant clothing is inside a crowd of people and is looking d |
| freq-pattern-S003297 | 15 | 26 | 36 | 2 | `Location($e1,$x1) & Location($e2,$x1) & Member($e1,$c1)` | $c1 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| freq-pattern-S003643 | 11 | 5 | 12 | 2 | `Agent($e1,$x1) & Also($x1,$e1) & Member($e1,$c1)` | $c1 raise · hire · require; $x1 measure · settlement · spokesman | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S003822 | 10 | 2 | 11 | 2 | `Member($e1,$c1) & Theme($e1,$x1) & Theme($e2,$x1)` | $c1 father · chairman · come; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| freq-pattern-S007006 | 4 | 2 | 5 | 2 | `Experiencer($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1)` | $c1 look · worried · say; $e2 look · worried · add | Three men are lying on a hill and looking at the mountains and sky |

### Joins between events: 4–5 atoms

The same question, the longer joins.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S009839 | 103 | 89 | 264 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 wear · sit · stand; $c2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S009841 | 93 | 76 | 219 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · boy; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025035 | 83 | 66 | 196 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Patient($e2,$x2)` | $c1 sit · walk · stand; $c2 wear · hold · play; $x1 man · woman · boy; $x2 shirt · sign · hat | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S009870 | 71 | 75 | 206 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · stand; $c2 man · woman · boy; $e2 wear · play · walk | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025048 | 67 | 65 | 194 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Member($x1,$c3)` | $c1 wear · sit · stand; $c2 wear · play · walk; $c3 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025065 | 62 | 58 | 150 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · open; $c2 shirt · jacket · sign; $e2 wear · sit · walk; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S025105 | 60 | 56 | 159 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 wear · hold · play; $c2 man · woman · boy; $e2 sit · wear · walk; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025186 | 50 | 49 | 133 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 man · woman · boy; $c2 shirt · jacket · sign; $e1 wear · hold · open; $e2 wear · sit · walk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S025286 | 45 | 40 | 89 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S025334 | 37 | 37 | 90 | 4 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($e2,$c2)` | $c1 sit · run · walk; $c2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S025340 | 33 | 18 | 64 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x2,$c1) & Member($e1,$c2) & Patient($e1,$x2)` | $c1 pant · ear · bead; $c2 wear · specify · destroy; $e2 wear · sit · use; $x1 woman · man · girl; $x2 black · pink · white | Pat Anderson, the attorney representing the parents, Bob and Mary Schindler, dec |
| freq-pattern-S010191 | 31 | 22 | 64 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2)` | $c1 woman · person · child; $c2 wear · play · stand; $e2 play · jump · sing | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-S010194 | 31 | 16 | 47 | 1 | `Agent($e1,$x1) & Member($e1,$c1) & Member($e2,$c2) & Patient($e2,$x1)` | $c1 wear · stand · sit; $c2 dress · hold · surround; $x1 man · woman · euro | A woman dressed in elegant clothing is inside a crowd of people and is looking d |
| freq-pattern-S025362 | 31 | 35 | 72 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | $c1 sit · run · walk; $c2 grass · table · sidewalk; $e2 wear · look · play; $x1 man · woman · dog | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S025376 | 30 | 31 | 77 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · run · walk; $c2 man · woman · cat; $e2 wear · open · look; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S025377 | 30 | 26 | 73 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Patient($e2,$x3)` | $c1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S025382 | 30 | 26 | 72 | 15 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Member($x2,(Narrow $c1 (Member $c2))) & Patient($e1,$x2)` | $c1 shirt · jacket · suit; $c2 red · pink · blue; $e1 wear · hold · hold_up; $e2 wear · sit · hold; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S025383 | 30 | 33 | 61 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 jacket · shirt · suit; $e1 wear · hold · use; $e2 wear · hold · specify; $x1 woman · man · girl; $x3 coat · glass · sweatshirt | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S010264 | 28 | 14 | 44 | 4 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 stand · sit · countersue; $c2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-S025458 | 27 | 21 | 56 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Member($e2,$c3)` | $c1 woman · person · child; $c2 wear · stand · play; $c3 point · jump · sing | On Thursday, authorities evacuated residents who live in the canyon and closed o |

### Across a sealed clause

The scope question: something inside a reported or negated clause tied to something outside it. A tree miner cannot state this either, and a scope error in the parses or the emitter would show here first.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002574 | 59 | 73 | 69 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · run; $c2 man · woman · person | The man is not eating a banana by a tree |
| freq-pattern-S025333 | 37 | 18 | 49 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 target · jaywalk · talk; $c2 say · according_to · aim; $c3 spokesman · president · company | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| freq-pattern-S025337 | 34 | 19 | 42 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 have · impose · excited; $c2 say · believe · decide; $e2 help · talk; $x1 isp; $x2 leadership | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-S002779 | 30 | 25 | 32 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & GroupOf($x1,$c2)` | $c1 play · wear · fight; $c2 man · child · boy | The men are not fist fighting in a ring |
| freq-pattern-S010283 | 27 | 39 | 30 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Not ▸ Patient($e1,$x2) & Member($x1,$c2)` | $c1 wear · play · crack; $c2 woman · man · person; $x2 tape · patient · dog | The man is not eating a banana by a tree |
| freq-pattern-S010382 | 24 | 17 | 36 | 6 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($x1,$c2) & Theme($e1,§1)` | $c1 comment · start · provide; $c2 representative · office · damage; $e1 say · decline · aim; $e2 listen | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025571 | 24 | 17 | 35 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 comment · start · provide; $c2 say · decline · aim; $c3 representative · office · damage; $e2 listen | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S025787 | 20 | 9 | 27 | 8 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 allow · impose · reach; $c2 say · tell · announce; $e2 help · talk; $x2 unstable | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-S026009 | 18 | 6 | 25 | 7 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($x2,$c2) & Theme($e1,§1)` | $c1 jaywalk · talk · target; $c2 spokesman · president · tipster; $e1 say · according_to · consider; $x1 state · victim · damage | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| freq-pattern-S003160 | 17 | 16 | 20 | 4 | `To:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & To($e1,§1)` | $c1 rebuild · president · bring; $c2 use · plead_guilty · talk | DNA tests will be performed to confirm his identity. |
| freq-pattern-S010787 | 17 | 11 | 20 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Theme($e1,§1) & Time($e1,$t1)` | $c1 impose · take_over · think; $c2 say · try · announce; $e2 make; $t1 day · year · week | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-S003203 | 16 | 12 | 16 | 2 | `Not ▸ Location($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 play · stand · sit; $c2 beach · water · surf | The man in a cowboy hat is not walking through a market and is not putting a han |

### With a rule of the sentence

How the sentence's own rules relate to the atoms around them: atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule. A rule mis-scoped by the lifter or the emitter would show here.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S025024 | 125 | 132 | 328 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl; $e1 run · sit · jump | A fur scarf is being held by an Asian woman |
| freq-pattern-S025041 | 72 | 77 | 141 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1))) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · dog; $e1 wear · use · raise | Two British women lost a desperate court battle on Wednesday to have babies usin |
| freq-pattern-S025057 | 62 | 65 | 125 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · hat; $e1 wear · raise · cut; $x2 man · woman · boy | Two British women lost a desperate court battle on Wednesday to have babies usin |
| freq-pattern-S025137 | 53 | 58 | 89 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 young · little · big; $c2 man · dog · boy; $e1 wear · chase · hold; $x2 ball · sign · shirt | A fur scarf is being held by an Asian woman |
| freq-pattern-S025152 | 52 | 60 | 135 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,$c2)` | $c1 black · young · brown; $c2 dog · girl · man; $e1 sit · jump · run; $x2 grass · air · field | A grey dog is bouncing a tennis ball on its head in a grass field |
| freq-pattern-S025184 | 50 | 42 | 104 | 14 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play | A dog is running on a snowy path |
| freq-pattern-S025185 | 50 | 53 | 109 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x2) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 wear · cut · hold; $c3 man · woman · boy; $x1 shirt · jacket · hat | The new WPAN standard uses the 2.4-GHz unlicensed frequency band and specifies r |
| freq-pattern-S025191 | 49 | 42 | 102 | 13 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($e1,$c3) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $c3 sit · stand · play | A dog is running on a snowy path |
| freq-pattern-S025274 | 46 | 37 | 99 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Location($e1,$x1) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play; $x2 man · dog · bird | A dog is running on a snowy path |
| freq-pattern-S025288 | 44 | 46 | 77 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x1) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | $c1 young · little · big; $c2 wear · chase · hold; $c3 ball · sign · shirt; $x1 man · dog · boy | A fur scarf is being held by an Asian woman |
| freq-pattern-S002702 | 37 | 24 | 38 | 2 | `rule consequent:$r1 ▸ Location($e1,$x1) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x1,$c2)` | $c1 run · sit · stand; $c2 grass · water · road | There is no dog chasing a ball in the grass |
| freq-pattern-S010150 | 35 | 24 | 36 | 2 | `rule consequent:$r1 ▸ Agent($e1,$x1) [denied] & rule consequent:$r1 ▸ Location($e1,$x2) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x2,$c2)` | $c1 run · sit · ride; $c2 grass · water · road | There is no dog chasing a ball in the grass |

### The most widespread overall

The plain top by support, any structure, any label: what dominates the corpus — mostly a template's own output, which is why the tables above exclude it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S000001 | 501 | 440 | 2160 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S000002 | 402 | 349 | 1099 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S009814 | 329 | 266 | 926 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl | The address made no mention of the role of terrorist organisation Jemaah Islamiy |
| freq-pattern-S002444 | 328 | 317 | 1549 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 stand · run · sit; $c2 man · woman · dog | A man is eating a banana |
| freq-pattern-S002445 | 306 | 283 | 895 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-S002446 | 274 | 273 | 710 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S000013 | 241 | 212 | 751 | 1 | `Location($e1,$x1) & Member($e1,$c1)` | $c1 sit · stand · play; $x1 grass · beach · field | Three women are sitting in a village |
| freq-pattern-S000014 | 238 | 135 | 379 | 1 | `Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · look · full; $x1 woman · spokesman · dog | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-S000016 | 221 | 119 | 351 | 1 | `Member($e1,$c1) & Theme($e1,§1)` | $c1 say · tell · according_to | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-S009815 | 212 | 230 | 587 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |

### The shapes with the most lexicalizations

The two levels (decision 4): the shapes that abstract over the most lexical variety, by the number of different class tuples that filled them. A shape filled by hundreds of tuples is a structural regularity of the corpus, not of a few words.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002444 | 328 | 317 | 1549 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **621 lexicalizations** — $c1 stand · run · sit; $c2 man · woman · dog | A man is eating a banana |
| freq-pattern-S009814 | 329 | 266 | 926 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | **449 lexicalizations** — $c1 young · black · brown; $c2 dog · man · girl | The address made no mention of the role of terrorist organisation Jemaah Islamiy |
| freq-pattern-S000001 | 501 | 440 | 2160 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | **432 lexicalizations** — $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S002446 | 274 | 273 | 710 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | **417 lexicalizations** — $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S002449 | 205 | 186 | 664 | 1 | `Location($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **352 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field | Three women are sitting in a village |
| freq-pattern-S009815 | 212 | 230 | 587 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | **330 lexicalizations** — $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |
| freq-pattern-S000002 | 402 | 349 | 1099 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | **319 lexicalizations** — $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S025020 | 154 | 185 | 497 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | **317 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $c3 ball · trick · shirt | A man is eating a banana |
| freq-pattern-S009817 | 175 | 173 | 609 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | **312 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field; $x1 man · dog · boy | Three women are sitting in a village |
| freq-pattern-S009816 | 191 | 213 | 677 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | **304 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-S025021 | 126 | 137 | 435 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3)` | **282 lexicalizations** — $c1 sit · stand · run; $c2 man · dog · boy; $c3 grass · beach · water | A ball is being chased by a dog on the grass |
| freq-pattern-S002445 | 306 | 283 | 895 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | **260 lexicalizations** — $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |

### Shapes whose matches all share a class

The generalizer's own contribution: where it says more than the pattern — a class that every `mine` match has. The pattern shown is that generalization (the record's `generalization`), with the outcome of the held-out check.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S000159 | 39 | 32 | 49 | 1 | `Member($t1,day) & Weekday($t1,$c1)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S010131 | 39 | 30 | 48 | 4 | `Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 36 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S025949 | 19 | 13 | 21 | 4 | `Member($e1,$c1) & Member($t1,day) & Patient($e1,$x1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 15 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S026136 | 17 | 10 | 18 | 4 | `Experiencer($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — fails held-out: day not in every one of 11 matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| freq-pattern-S026730 | 12 | 9 | 15 | 4 | `Theme:$e1 ▸ Member($x1,$c1) & Experiencer($e1,$x2) & Member($e1,say) & Member($x2,$c2) & Theme($e1,§1)` | keeps say — fails held-out: say not in every one of 10 matches | "These are defining moments for players and organizations," Anaheim coach Mike B |
| freq-pattern-S026755 | 12 | 14 | 13 | 4 | `Agent($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 16 held-out matches | Two British women lost a desperate court battle on Wednesday to have babies usin |
| freq-pattern-S026767 | 12 | 9 | 13 | 4 | `Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 11 held-out matches | One, Capt. Doug McDonald, remained hospitalized in critical condition on Thursda |
| freq-pattern-S027100 | 11 | 4 | 14 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Agent($e1,$x1) & Member($e1,tell) & Recipient($e1,$x2) & Theme($e1,§1)` | keeps tell — holds in all 5 held-out matches | "I go to their website and start complaining to them, would you please, please,  |
| freq-pattern-S027105 | 11 | 7 | 11 | 3 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 7 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-S011858 | 10 | 7 | 13 | 4 | `Experiencer($e1,$x1) & Member($e1,full) & Member($x1,$c1) & Of($e1,$c2)` | keeps full — holds in all 12 held-out matches | A dog is running alongside a fence on a track full of dirt |
| freq-pattern-S027401 | 10 | 5 | 10 | 7 | `Theme:$e1 ▸ Member($e2,$c1) & Theme:$e1 ▸ Patient($e2,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 5 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-S027801 | 9 | 5 | 9 | 4 | `Theme:$e1 ▸ Patient($e2,$x1) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 5 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |

### Candidates using a distribution rule

The artifact set, last: the candidates the *using a distribution rule* label took out of the tables above. Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S000012 | 245 | 186 | 651 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child; $x2 person | Three women are sitting in a village |
| freq-pattern-S000015 | 236 | 180 | 594 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · sit · stand; $x2 person | Three women are sitting in a village |
| freq-pattern-S002447 | 235 | 179 | 592 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | $c1 play · sit · stand; $c2 person · man · child; $x2 person | Three women are sitting in a village |
| freq-pattern-S000022 | 185 | 152 | 517 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Member($e1,$c1)` | $c1 play · sit · stand; $x1 man · woman · person | Three women are sitting in a village |
| freq-pattern-S000027 | 143 | 101 | 251 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule consequent:$r1 ▸ Patient($e1,$x1)` | $c1 wear · play · eat; $x1 southern · letter · home | DNA tests will be performed to confirm his identity. |

