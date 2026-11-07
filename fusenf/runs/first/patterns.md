# Connected patterns of run `first` — 2026-11-08 00:43

§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized view keeps the class symbols, the shape view turns them into class variables. Every row is a CANDIDATE with its evidence, not a finding.

- key dials: `{"polarity": "three", "tense": "evidence", "habitual": "evidence"}`
- parameters: `{"min_atoms": 2, "max_atoms": 5, "min_families": 3, "support_role": "mine", "max_variables": null, "exclude_heads": [], "max_embeddings": 200000, "derived_rule_templates": ["distribution"]}`
- corpus: 6,345 sentences in 1,334 families ({'evaluate': 583, 'mine': 751}). The 751 families of the `mine` share decide which patterns are candidates and supply their evidence. The other 583 are held out: they are counted beside it and they check the generalization, nothing else.
- time (s): {'lexicalized': 21.5, 'shape': 123.2, 'tests': 117.0, 'renamed_corpus': 179.1, 'total': 443.7}

## How many

| view | connected atoms | atom sets found | distinct patterns | candidates | using a distribution rule | **without a distribution rule** | tree | join | inside one template instance | after merging candidates with identical matches |
|---|---|---|---|---|---|---|---|---|---|---|
| lexicalized | 2 | 77,927 | 9,305 | 2,032 | 324 | **1,708** | 1,653 | 55 | 1,047 | |
| lexicalized | 3 | 126,776 | 27,338 | 3,345 | 868 | **2,477** | 2,243 | 234 | 1,103 | |
| lexicalized | 4 | 180,475 | 48,890 | 3,962 | 1,660 | **2,302** | 1,913 | 389 | 831 | |
| lexicalized | 5 | 191,134 | 52,815 | 3,689 | 2,146 | **1,543** | 1,226 | 317 | 442 | |
| lexicalized | all | 576,312 | 138,348 | **13,028** | 4,998 | **8,030** | 7,035 | 995 | 3,423 | **2,740** |
| shape | 2 | 140,610 | 7,454 | 2,303 | 413 | **1,890** | 1,831 | 59 | 1,049 | |
| shape | 3 | 329,742 | 47,240 | 7,027 | 1,454 | **5,573** | 5,215 | 358 | 2,490 | |
| shape | 4 | 696,327 | 150,099 | 14,648 | 3,934 | **10,714** | 9,589 | 1,125 | 3,875 | |
| shape | 5 | 1,244,578 | 313,890 | 23,232 | 8,566 | **14,666** | 12,430 | 2,236 | 4,024 | |
| shape | all | 2,411,257 | 518,683 | **47,210** | 14,367 | **32,843** | 29,065 | 3,778 | 11,438 | **4,224** |

What each column counts:

- *view*: `lexicalized` patterns keep the class symbols (`dog`, `run`); `shape` patterns turn each class symbol into a class variable (`$c1`), so one shape covers many lexicalized patterns.
- *connected atoms*: the size of a pattern — the number of atoms in it, each tied to another by a shared variable (the same event, thing, time or rule). A row counts the patterns of exactly that size; the `all` row adds the rows up.
- *atom sets found*: the number of occurrences the miner looked at — every connected set of that many atoms inside one sentence, counted once each, over the sentences of every share; a pattern found in 500 sentences contributes 500 here and 1 to the next column. A set is only looked at when its smaller parts are already frequent (a pattern cannot be frequent unless its parts are).
- *distinct patterns*: the different patterns among those atom sets. Two atom sets are the same pattern when they differ only in which events and things they name.
- *candidates*: the distinct patterns found in at least 3 families of the `mine` share (it has 751). Each is one record in `patterns.<view>.jsonl`.
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

- recurrence: 6,289 of the 8,030 candidates without a distribution rule (78%) also occur in a held-out family; of all 13,028 candidates, 10,260 (79%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 61% of 3,686 · 4: 85% of 1,336 · 5: 95% of 1,192 · 6 to 9: 97% of 1,114 · 10 or more: 100% of 702
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 8,030 of the 8,030
- the two tests, all 13,028 candidates: the renaming test is passed by 13,028, the broken-link test by 13,028

**shape**

- recurrence: 27,000 of the 32,843 candidates without a distribution rule (82%) also occur in a held-out family; of all 47,210 candidates, 38,294 (81%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 69% of 14,384 · 4: 86% of 6,058 · 5: 91% of 2,900 · 6 to 9: 95% of 5,208 · 10 or more: 100% of 4,293
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 31,015 of the 32,843 and is tighter — a class every `mine` match shares — for 1,828; 1,289 of those have held-out matches, and the class holds in every one of them for 688 (53%)
- the two tests, all 47,210 candidates: the renaming test is passed by 47,210, the broken-link test by 47,210

The whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: lexicalized: the identical table (13,028 patterns); shape: the identical table (47,210 patterns)

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
| freq-pattern-L002072 | 39 | 41 | 92 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2)` | $e1 sit · run · walk; $e2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L000084 | 27 | 14 | 42 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1)` | $e1 stand · sit · countersue; $e2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L002102 | 25 | 22 | 58 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man)` | $e1 wear · sit · stand; $e2 wear · sit · walk; $x1 man | The man in a hat suited for cowboys is walking through a market and is putting a |
| freq-pattern-L002127 | 21 | 18 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1)` | $e1 wear · open · sit; $e2 jump · wear · stick_out; $x1 man · cat · woman | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L002135 | 20 | 16 | 38 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1)` | $e1 wear · stand · sit; $e2 wear · sit · tinker; $e3 wear · calculate · build; $x1 man · woman · girl | Three young men are furiously running, jumping and kicking near a vending machin |
| freq-pattern-L002156 | 18 | 19 | 39 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Theme($e1,$x2)` | $e1 carry · ride · throw; $e2 wear · approach · run; $x1 woman · man · dog; $x2 ball · unicycle · car | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-L000165 | 17 | 26 | 38 | 1 | `Location($e1,$x1) & Location($e2,$x1)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| freq-pattern-L002178 | 17 | 8 | 19 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Theme($e2,§1)` | $e1 countersue · live · reverse; $e2 say · argue · rule; $x1 court · santa_clara-based · mother | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L002210 | 16 | 18 | 39 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman)` | $e1 wear · sit · dance; $e2 wear · hold · play; $x1 woman · seated | A woman is crouching down next to a dog and is smiling at a young girl sitting o |
| freq-pattern-L002211 | 16 | 23 | 36 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Location($e2,$x2)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| freq-pattern-L002252 | 14 | 7 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L002253 | 14 | 13 | 25 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,stand)` | $e1 stand; $e2 play · wear · pull; $x1 man · girl · woman | Adults and children are standing and playing in front of steps near a desert are |
| freq-pattern-L002282 | 13 | 12 | 24 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,play)` | $e1 play; $e2 stand · sing · play; $x1 woman · girl · boy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L002317 | 12 | 5 | 12 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2)` | $e1 reverse · cite · seek; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 decision · legislation · injunction | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L000294 | 11 | 4 | 12 | 1 | `Agent($e1,$x1) & Also($x1,$e1)` | $e1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L000340 | 10 | 6 | 13 | 1 | `Bearer($e1,$x1) & Patient($e2,$x1)` | $e1 involve · wife · mother; $e2 die · reach · marry; $x1 settlement · wife · mother | Her 20-year-old sister, Allyson, was severely burned and remained hospitalized i |
| freq-pattern-L000351 | 10 | 4 | 10 | 1 | `Patient($e1,$x1) & Theme($e2,$x1)` | $e1 make · describe · encounter; $e2 provide · earn · come; $x1 evidence · fire · briton | The mother of a Briton held by Colombian guerrillasspoke of her relief yesterday |
| freq-pattern-L000352 | 10 | 3 | 11 | 1 | `Theme($e1,$x1) & Theme($e2,$x1)` | $e1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| freq-pattern-L002418 | 10 | 5 | 16 | 1 | `Patient($e1,$x1) & Patient($e2,$x1) & Time($e1,$t1)` | $e1 improve · find · quote; $e2 slide_down · tuck · add; $t1 month · day · week; $x1 rate · report · gold | Spot gold was quoted at $367.90/368.60 an ounce at 1000 GMT, having marched up t |
| freq-pattern-L002452 | 9 | 7 | 15 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Goal($e1,$x2)` | $e1 jump · throw · put; $e2 wear · approach · walk; $x1 car · boy · kid; $x2 pool · air · pocket | The man in a hat suited for cowboys is walking through a market and is putting a |

### Joins between events: 4–5 atoms

The same question, the longer joins.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L005395 | 48 | 42 | 92 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005401 | 32 | 28 | 75 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Patient($e2,$x3)` | $e1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L005402 | 32 | 35 | 93 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · sit · hold; $x1 man · woman · boy; $x2 shirt · jacket · hat | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005428 | 20 | 16 | 46 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man) & Patient($e1,$x2)` | $e1 wear · hold · hold_up; $e2 sit · wear · stand; $x1 man; $x2 sign · shirt · suit | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005432 | 19 | 14 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2)` | $e1 wear · calculate · pound; $e2 wear · sit · stand; $e3 wear · build · laugh; $x1 man · woman · girl; $x2 shirt · jacket · route | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L005447 | 18 | 17 | 34 | 1 | `Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)` | $e1 stick_out · raise · flap; $x1 girl · woman · boy; $x3 tongue · dividend · case | In addition, Goldman raised its quarterly dividend to 25 cents a share, up from  |
| freq-pattern-L005463 | 17 | 1 | 25 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say · claim · hear; $x1 adviser · director · daughter; $x2 federal · briton · union | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| freq-pattern-L005489 | 16 | 12 | 26 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3)` | $e1 wear · open · outline; $e2 jump · sit · wear; $x1 cat · boy · man; $x3 drawer · case · plan | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005490 | 16 | 11 | 24 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Possession($x3,$x2)` | $e1 wear · open · sit; $e2 jump · read · specify; $x1 cat · man · boy; $x3 case · government · pocket | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L009388 | 16 | 14 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · pound · develop; $e2 wear · build · destroy; $e3 wear · sit · pose; $x1 woman · man · girl; $x2 shirt · jacket · southern; $x3 sweatshirt · northern · hat | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L009389 | 16 | 19 | 41 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear; $e2 wear · hold · perform; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 boy · sweatshirt · trick | A man is wearing clothes that are covered with paint and is sitting outside in a |
| freq-pattern-L009390 | 16 | 1 | 23 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say; $x1 adviser · director · daughter; $x2 federal · union · store | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| freq-pattern-L009416 | 15 | 12 | 37 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e2,wear) & Patient($e2,$x3)` | $e1 sit · walk · stand; $e2 wear; $x1 man · boy · woman; $x2 table · grass · bench; $x3 hat · shirt · jacket | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L005528 | 14 | 8 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x3) & Patient($e2,$x3)` | $e1 wear · issue · pound; $e2 wear · add · pound; $x1 man · rain · justice; $x2 woman · colleague · dog; $x3 statement · southern · fund | A coalition of campaign groups, including the militant national students body, i |
| freq-pattern-L005569 | 12 | 3 | 27 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit) & Patient($e2,$x2)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman; $x2 hat · jacket · toy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-L005570 | 12 | 17 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman) & Patient($e1,$x2)` | $e1 wear · play · beat; $e2 wear · hold · sit; $x1 woman · seated; $x2 jacket · instrument · boa | The woman is sitting on a bench and is wearing a gray jacket and black pants |
| freq-pattern-L005571 | 12 | 19 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Location($e1,$x3) & Location($e2,$x3)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 dog · woman · boy; $x3 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| freq-pattern-L009446 | 12 | 7 | 18 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x4,$x2)` | $e1 wear · open · read; $e2 jump · outline · specify; $x1 cat · boy · state; $x3 drawer · plan · law; $x4 case · government · dividend | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-L005597 | 11 | 9 | 20 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,man)` | $e1 sit · stand · perform; $e2 wear · rub · sing; $x1 man; $x2 table · rail · street | A man is standing in the middle of a gym and is wearing a jersey |
| freq-pattern-L009464 | 11 | 8 | 23 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · sit · stand; $e3 wear · laugh · ride; $x1 man · woman · girl; $x2 shirt · jacket · necklace | A man is wearing clothes that are covered with paint and is sitting outside in a |

### Across a sealed clause

The scope question: something inside a reported or negated clause tied to something outside it. A tree miner cannot state this either, and a scope error in the parses or the emitter would show here first.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L002125 | 21 | 8 | 28 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L000127 | 20 | 18 | 21 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,man)` | $x1 man | The man is not eating a banana by a tree |
| freq-pattern-L005487 | 16 | 8 | 20 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L000193 | 15 | 13 | 15 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,woman)` | $x1 woman | The woman is not handling a frog |
| freq-pattern-L005527 | 14 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Coref($x2,$x3) & Experiencer($e1,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $e2 organise; $x1 committee · contract · maximum; $x3 judge · state | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L002279 | 13 | 7 | 15 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x2,$x1) & Theme($e1,§1)` | $e1 say · decide · continue; $x1 state | With Smithfields leadership, Farmland Foods will succeed and continue to sustain |
| freq-pattern-L005548 | 13 | 3 | 18 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L002313 | 12 | 6 | 13 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · admit; $e2 make; $t1 day · week; $x1 office · company · board | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-L002315 | 12 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Possession($x1,$x2) & Theme($e1,§1)` | $e1 say · decide · insist; $x1 home · job · committee; $x2 mosque · justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-L005568 | 12 | 5 | 16 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L009462 | 11 | 3 | 14 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-L002396 | 10 | 6 | 13 | 2 | `Theme:$e1 ▸ Experiencer($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell; $x2 witness · leadership | Klitschko said: "I'm excited to box in Los Angeles first and then against Lennox |

### With a rule of the sentence

How the sentence's own rules relate to the atoms around them: atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule. A rule mis-scoped by the lifter or the emitter would show here.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000079 | 28 | 26 | 65 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1)` | $e1 jump · stand · sit; $x1 girl · boy · man | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L000120 | 21 | 24 | 55 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1)` | $e1 run · play · stand; $x1 dog · bird · man | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L000121 | 21 | 19 | 61 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1)` | $e1 run · play · jump; $x1 dog · car · cat | A white dog is running through a snowy trail |
| freq-pattern-L000152 | 17 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1)` | $e1 run · lie · play; $x1 dog · cat · duck | A brown dog is running through a snowy trail |
| freq-pattern-L009384 | 16 | 14 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member brown))) & Member($x1,dog)` | $e1 run · lie · play; $x1 dog | A brown dog is running through a snowy trail |
| freq-pattern-L009385 | 16 | 16 | 50 | 13 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member white))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member white))) & Member($x1,dog)` | $e1 run · play · jump; $x1 dog | A white dog is running through a snowy trail |
| freq-pattern-L002243 | 14 | 11 | 26 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 jump · play · ride; $x1 girl · boy · child; $x2 edge · air · sidewalk | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L009420 | 14 | 17 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member black))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member black))) & Member($x1,dog)` | $e1 play · run · carry; $x1 dog | The black dog is walking along a tree trunk bridge over water |
| freq-pattern-L002303 | 12 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · play · stand; $x1 dog · bird · child; $x2 grass · field · sand | A young black child is waiting on the edge of a body of water near some buckets |
| freq-pattern-L002304 | 12 | 10 | 23 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · lie · play; $x1 dog · duck; $x2 beach · grass · air | A brown and white dog is biting a dirty tennis ball in a dirt field |
| freq-pattern-L002305 | 12 | 11 | 31 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · jump_up · jump; $x1 dog · animal · bird; $x2 grass · field · air | A brown and white dog is biting a dirty tennis ball in a dirt field |
| freq-pattern-L009457 | 11 | 10 | 22 | 12 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,(Narrow dog (Member brown)))` | $e1 run · lie · play; $x1 dog; $x2 beach · grass · air | A brown and white dog is biting a dirty tennis ball in a dirt field |

### The most widespread overall

The plain top by support, any structure, any label: what dominates the corpus — mostly a template's own output, which is why the tables above exclude it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000001 | 303 | 283 | 892 | 1 | `Agent($e1,$x1) & Patient($e1,$x2)` | $e1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-L000002 | 197 | 190 | 672 | 1 | `Agent($e1,$x1) & Location($e1,$x2)` | $e1 sit · stand · play; $x1 man · dog · person; $x2 grass · beach · field | Three women are sitting in a village |
| freq-pattern-L000003 | 174 | 88 | 268 | 1 | `Experiencer($e1,$x1) & Theme($e1,§1)` | $e1 say · believe · agree; $x1 spokesman · president · report | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-L002033 | 137 | 64 | 202 | 3 | `Experiencer($e1,$x1) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x1 spokesman · president · company | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| freq-pattern-L000007 | 121 | 102 | 298 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · sit · stand; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L000009 | 118 | 107 | 439 | 1 | `Agent($e1,$x1) & Member($x1,man)` | $e1 stand · sit · wear; $x1 man · naked · busy | A man is eating a banana |
| freq-pattern-L002035 | 97 | 77 | 224 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2)` | $e1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · boy; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-L000012 | 88 | 51 | 137 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1)` | $e1 say · decline · tell; $e2 make · provide · organise; $x1 deal · representative · office | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-L000014 | 85 | 60 | 136 | 1 | `Coref($x1,$x2) & Possession($x3,$x1)` | $x1 isp; $x2 boy · man · pregnant; $x3 tongue · apartment · dividend | In exchange, North Korea would be required to end its nuclear weapons program. |
| freq-pattern-L000015 | 85 | 79 | 168 | 1 | `Location($e1,$x1) & Patient($e1,$x2)` | $e1 perform · play · do; $x1 bowl · field · water; $x2 trick · ball · handstand | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |

### Candidates using a distribution rule

The artifact set, last: the candidates the *using a distribution rule* label took out of the tables above. Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-L000006 | 124 | 103 | 396 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| freq-pattern-L000008 | 118 | 100 | 393 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| freq-pattern-L002034 | 118 | 98 | 388 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| freq-pattern-L000010 | 103 | 78 | 190 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 man · woman · person; $x2 case · region · race | The parents of a Briton being held hostage by Colombian rebels spoke yesterday o |
| freq-pattern-L000011 | 94 | 62 | 151 | 1 | `rule consequent:$r1 ▸ Patient($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | DNA tests will be performed to confirm his identity. |

## The shape view

One row per group, by mining families. Every table but the last holds only candidates without a distribution rule.

### Joins between events: 2–3 atoms

What the binding-aware view adds that a rooted-subtree miner could not state: one thing in two events, or a loop among the arguments — kept clean: no rule, no sealed clause, and the match spans several template instances, so the pattern is not one template's own output.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S003027 | 17 | 26 | 38 | 2 | `Location($e1,$x1) & Location($e2,$x1) & Member($e1,$c1)` | $c1 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| freq-pattern-S003436 | 11 | 4 | 12 | 2 | `Agent($e1,$x1) & Also($x1,$e1) & Member($e1,$c1)` | $c1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S003598 | 10 | 3 | 11 | 2 | `Member($e1,$c1) & Theme($e1,$x1) & Theme($e2,$x1)` | $c1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| freq-pattern-S006683 | 4 | 2 | 5 | 2 | `Experiencer($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1)` | $c1 look · worried · say; $e2 look · worried · add | Three men are lying on a hill and looking at the mountains and sky |
| freq-pattern-S002290 | 3 | 1 | 3 | 1 | `PartOf($x1,$x2) & Possession($x1,$x2)` | $x1 tongue; $x2 board | A girl in a brown dress is being surrounded by children and is closing her eyes |
| freq-pattern-S008940 | 3 | 1 | 3 | 2 | `Also($x1,$e1) & Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · new · think | The WWF also thinks a further 13,000 animals are being caught every year around  |

### Joins between events: 4–5 atoms

The same question, the longer joins.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S009374 | 74 | 74 | 208 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · stand; $c2 man · woman · boy; $e2 wear · play · walk | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S024003 | 69 | 65 | 195 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Member($x1,$c3)` | $c1 wear · sit · stand; $c2 wear · play · walk; $c3 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S024004 | 68 | 60 | 156 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · open; $c2 shirt · jacket · sign; $e2 wear · sit · walk; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S024034 | 61 | 56 | 159 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 wear · hold · play; $c2 man · woman · boy; $e2 sit · wear · walk; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S024142 | 52 | 49 | 134 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 man · woman · boy; $c2 shirt · jacket · sign; $e1 wear · hold · open; $e2 wear · sit · walk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024231 | 48 | 42 | 92 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S009636 | 39 | 41 | 92 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1)` | $c1 sit · run · walk; $e2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024266 | 38 | 39 | 91 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($e2,$c2)` | $c1 sit · run · walk; $c2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024296 | 33 | 35 | 64 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 jacket · shirt · suit; $e1 wear · hold · use; $e2 wear · hold · specify; $x1 woman · man · girl; $x3 coat · glass · sweatshirt | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S024308 | 32 | 28 | 75 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Patient($e2,$x3)` | $c1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024312 | 32 | 26 | 73 | 15 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Member($x2,(Narrow $c1 (Member $c2))) & Patient($e1,$x2)` | $c1 shirt · jacket · suit; $c2 red · pink · blue; $e1 wear · hold · hold_up; $e2 wear · sit · hold; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| freq-pattern-S009698 | 31 | 22 | 67 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2)` | $c1 woman · person · child; $c2 wear · play · stand; $e2 play · read · jump | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-S024328 | 31 | 32 | 78 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · run · walk; $c2 man · woman · cat; $e2 wear · open · look; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024329 | 31 | 36 | 72 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | $c1 sit · run · walk; $c2 grass · table · sidewalk; $e2 wear · look · play; $x1 man · woman · dog | A boy is comfortably sitting in a room and playing a piano by a lamp |
| freq-pattern-S024402 | 28 | 30 | 59 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 woman · man · girl; $e1 wear · hold · conduct; $e2 wear · hold · perform; $x2 jacket · shirt · suit; $x3 coat · glass · sweatshirt | Revelations of the expenditures shocked some employees at Delta, an airline that |
| freq-pattern-S009793 | 27 | 26 | 51 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c1)` | $c1 wear · play · pound; $x1 woman · man · girl | "Germany is on the right path," he added, specifying his government's announced  |
| freq-pattern-S009794 | 27 | 14 | 42 | 4 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 stand · sit · countersue; $c2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-S024417 | 27 | 21 | 58 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Member($e2,$c3)` | $c1 woman · person · child; $c2 wear · stand · play; $c3 point · read · jump | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-S024430 | 26 | 14 | 45 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 pant · bead · skate; $e1 wear · destroy · specify; $e2 wear · use · perform; $x1 woman · man · girl; $x3 shirt · jacket · southern | Revelations of the expenditures shocked some employees at Delta, an airline that |
| freq-pattern-S024431 | 26 | 29 | 64 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,$c1) & Member($x2,$c2)` | $c1 man · woman · dog; $c2 grass · table · sidewalk; $e1 sit · run · walk; $e2 wear · look · hold_up | A boy is comfortably sitting in a room and playing a piano by a lamp |

### Across a sealed clause

The scope question: something inside a reported or negated clause tied to something outside it. A tree miner cannot state this either, and a scope error in the parses or the emitter would show here first.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002433 | 59 | 72 | 69 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · run; $c2 man · woman · person | The man is not eating a banana by a tree |
| freq-pattern-S024257 | 41 | 15 | 57 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 target · impose · jaywalk; $c2 say · aim · consider; $c3 spokesman · president · prosecutor | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| freq-pattern-S024307 | 32 | 18 | 39 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 impose · have · reach; $c2 say · believe · decide; $e2 organise; $x1 isp; $x2 judge · santa_clara-based · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-S002607 | 31 | 25 | 33 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & GroupOf($x1,$c2)` | $c1 play · wear · fight; $c2 man · child · boy | The men are not fist fighting in a ring |
| freq-pattern-S009791 | 27 | 39 | 30 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Not ▸ Patient($e1,$x2) & Member($x1,$c2)` | $c1 wear · play · crack; $c2 woman · man · person; $x2 tape · patient · dog | The man is not eating a banana by a tree |
| freq-pattern-S009919 | 23 | 16 | 37 | 6 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($x1,$c2) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 deal · representative · office; $e1 say · decline · aim | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S024573 | 23 | 16 | 36 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 say · decline · aim; $c3 deal · representative · office | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| freq-pattern-S024615 | 21 | 8 | 28 | 8 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 allow · impose · reach; $c2 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| freq-pattern-S024891 | 19 | 5 | 29 | 7 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($x2,$c2) & Theme($e1,§1)` | $c1 jaywalk · impose · talk; $c2 president · spokesman · judge; $e1 say · consider · argue; $x1 state · victim · damage | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| freq-pattern-S025082 | 17 | 2 | 22 | 7 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Mod $x2))) & Theme($e1,§1)` | $c1 help · pleased · target; $c2 president · spokesman · report; $e1 say · aim · state | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| freq-pattern-S003040 | 16 | 12 | 16 | 2 | `Not ▸ Location($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 play · stand · sit; $c2 beach · water · surf | The man in a cowboy hat is not walking through a market and is not putting a han |
| freq-pattern-S010328 | 16 | 8 | 19 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Theme($e1,§1) & Time($e1,$t1)` | $c1 impose · take_over · think; $c2 say · announce · try; $e2 make; $t1 day · year · week | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |

### With a rule of the sentence

How the sentence's own rules relate to the atoms around them: atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule. A rule mis-scoped by the lifter or the emitter would show here.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S023983 | 123 | 131 | 328 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl; $e1 run · sit · jump | A fur scarf is being held by an Asian woman |
| freq-pattern-S024000 | 70 | 76 | 139 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1))) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · dog; $e1 wear · use · raise | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-S024025 | 62 | 65 | 126 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · hat; $e1 wear · raise · cut; $x2 man · woman · boy | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| freq-pattern-S024087 | 53 | 60 | 136 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,$c2)` | $c1 black · young · brown; $c2 dog · girl · man; $e1 sit · jump · run; $x2 grass · air · field | A grey dog is bouncing a tennis ball on its head in a grass field |
| freq-pattern-S024090 | 53 | 57 | 90 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 young · little · big; $c2 man · dog · boy; $e1 wear · chase · hold; $x2 ball · sign · shirt | A fur scarf is being held by an Asian woman |
| freq-pattern-S024146 | 51 | 53 | 110 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x2) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 wear · cut · hold; $c3 man · woman · boy; $x1 shirt · jacket · hat | The new WPAN standard uses the 2.4-GHz unlicensed frequency band and specifies r |
| freq-pattern-S024161 | 50 | 42 | 104 | 14 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play | A dog is running on a snowy path |
| freq-pattern-S024189 | 49 | 42 | 102 | 13 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($e1,$c3) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $c3 sit · stand · play | A dog is running on a snowy path |
| freq-pattern-S024233 | 47 | 37 | 100 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Location($e1,$x1) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play; $x2 man · dog · bird | A dog is running on a snowy path |
| freq-pattern-S024242 | 45 | 45 | 79 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x1) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | $c1 young · little · big; $c2 wear · chase · hold; $c3 ball · sign · shirt; $x1 man · dog · boy | A fur scarf is being held by an Asian woman |
| freq-pattern-S002556 | 37 | 24 | 38 | 2 | `rule consequent:$r1 ▸ Location($e1,$x1) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x1,$c2)` | $c1 run · sit · stand; $c2 grass · water · road | There is no dog chasing a ball in the grass |
| freq-pattern-S009656 | 35 | 24 | 36 | 2 | `rule consequent:$r1 ▸ Agent($e1,$x1) [denied] & rule consequent:$r1 ▸ Location($e1,$x2) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x2,$c2)` | $c1 run · sit · ride; $c2 grass · water · road | There is no dog chasing a ball in the grass |

### The most widespread overall

The plain top by support, any structure, any label: what dominates the corpus — mostly a template's own output, which is why the tables above exclude it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S000001 | 495 | 432 | 2154 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S000002 | 396 | 345 | 1086 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S002304 | 326 | 317 | 1550 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| freq-pattern-S009331 | 315 | 269 | 910 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl | In exchange, North Korea would be required to end its nuclear weapons program. |
| freq-pattern-S002309 | 303 | 283 | 892 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-S002310 | 271 | 269 | 703 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S000012 | 238 | 212 | 749 | 1 | `Location($e1,$x1) & Member($e1,$c1)` | $c1 sit · stand · play; $x1 grass · beach · field | Three women are sitting in a village |
| freq-pattern-S000014 | 225 | 124 | 365 | 1 | `Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · look · full; $x1 woman · spokesman · president | "In return we expect North Korea to give up nuclear weapons." |
| freq-pattern-S009332 | 216 | 229 | 592 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |
| freq-pattern-S000016 | 208 | 164 | 427 | 1 | `Member($x1,$c1) & Member($x1,(Narrow $c1 (Mod $c2)))` | $c1 ball · pool · bike; $c2 dirt · tennis · soccer | The address made no mention of the role of terrorist organisation Jemaah Islamiy |

### The shapes with the most lexicalizations

The two levels (decision 4): the shapes that abstract over the most lexical variety, by the number of different class tuples that filled them. A shape filled by hundreds of tuples is a structural regularity of the corpus, not of a few words.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002304 | 326 | 317 | 1550 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **619 lexicalizations** — $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| freq-pattern-S009331 | 315 | 269 | 910 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | **434 lexicalizations** — $c1 young · black · brown; $c2 dog · man · girl | In exchange, North Korea would be required to end its nuclear weapons program. |
| freq-pattern-S000001 | 495 | 432 | 2154 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | **429 lexicalizations** — $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S002310 | 271 | 269 | 703 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | **410 lexicalizations** — $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S002313 | 201 | 186 | 660 | 1 | `Location($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **347 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field | Three women are sitting in a village |
| freq-pattern-S009332 | 216 | 229 | 592 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | **335 lexicalizations** — $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |
| freq-pattern-S023979 | 157 | 186 | 500 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | **321 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $c3 ball · trick · shirt | A man is eating a banana |
| freq-pattern-S000002 | 396 | 345 | 1086 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | **313 lexicalizations** — $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| freq-pattern-S009334 | 175 | 173 | 609 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | **312 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field; $x1 man · dog · boy | Three women are sitting in a village |
| freq-pattern-S009333 | 194 | 214 | 680 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | **307 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| freq-pattern-S023980 | 127 | 137 | 437 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3)` | **283 lexicalizations** — $c1 sit · stand · run; $c2 man · dog · boy; $c3 grass · beach · water | A ball is being chased by a dog on the grass |
| freq-pattern-S002309 | 303 | 283 | 892 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | **260 lexicalizations** — $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |

### Shapes whose matches all share a class

The generalizer's own contribution: where it says more than the pattern — a class that every `mine` match has. The pattern shown is that generalization (the record's `generalization`), with the outcome of the held-out check.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S002547 | 40 | 31 | 48 | 3 | `Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c1)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S009638 | 39 | 31 | 47 | 2 | `Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S024911 | 19 | 16 | 22 | 4 | `Member($e1,$c1) & Member($t1,day) & Patient($e1,$x1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S025100 | 17 | 8 | 19 | 4 | `Experiencer($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — fails held-out: day not in every one of 9 matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| freq-pattern-S025487 | 13 | 16 | 14 | 4 | `Agent($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| freq-pattern-S025665 | 12 | 4 | 15 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Agent($e1,$x1) & Member($e1,tell) & Recipient($e1,$x2) & Theme($e1,§1)` | keeps tell — holds in all 5 held-out matches | "I go to their website and start complaining to them, would you please, please,  |
| freq-pattern-S025667 | 12 | 5 | 13 | 3 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 5 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-S026009 | 11 | 7 | 12 | 4 | `Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 9 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| freq-pattern-S011222 | 10 | 7 | 13 | 4 | `Experiencer($e1,$x1) & Member($e1,full) & Member($x1,$c1) & Of($e1,$c2)` | keeps full — holds in all 12 held-out matches | A dog is running alongside a fence on a track full of dirt |
| freq-pattern-S026232 | 10 | 7 | 11 | 4 | `Location($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 8 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| freq-pattern-S027268 | 8 | 3 | 9 | 4 | `Theme:$e1 ▸ Agent($e2,$x1) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 3 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| freq-pattern-S028349 | 7 | 2 | 8 | 3 | `Coref($x1,$x2) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 2 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |

### Candidates using a distribution rule

The artifact set, last: the candidates the *using a distribution rule* label took out of the tables above. Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| freq-pattern-S000013 | 226 | 172 | 628 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child | Three women are sitting in a village |
| freq-pattern-S000015 | 218 | 164 | 574 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · sit · stand | Three women are sitting in a village |
| freq-pattern-S002311 | 217 | 164 | 572 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | $c1 play · sit · stand; $c2 person · man · child | Three women are sitting in a village |
| freq-pattern-S000021 | 183 | 143 | 515 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Member($e1,$c1)` | $c1 play · sit · stand; $x1 man · woman · person | Three women are sitting in a village |
| freq-pattern-S000028 | 136 | 97 | 241 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule consequent:$r1 ▸ Patient($e1,$x1)` | $c1 wear · play · eat; $x1 case · region · race | DNA tests will be performed to confirm his identity. |

