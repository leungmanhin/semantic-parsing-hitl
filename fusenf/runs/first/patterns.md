# Connected patterns of run `first` — 2026-11-07 08:42

§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized view keeps the class symbols, the shape view turns them into class variables. Every row is a CANDIDATE with its evidence, not a finding.

- key dials: `{"polarity": "three", "tense": "evidence", "habitual": "evidence"}`
- parameters: `{"min_atoms": 2, "max_atoms": 5, "min_families": 3, "support_role": "mine", "max_variables": null, "exclude_heads": [], "max_embeddings": 200000, "derived_rule_templates": ["distribution"]}`
- corpus: 6,340 sentences in 1,334 families ({'evaluate': 583, 'mine': 751}). The 751 families of the `mine` share decide which patterns are candidates and supply their evidence. The other 583 are held out: they are counted beside it and they check the generalization, nothing else.
- time (s): {'lexicalized': 20.7, 'shape': 119.8, 'tests': 113.0, 'renamed_corpus': 166.7, 'total': 422.9}

## How many

| view | connected atoms | atom sets found | distinct patterns | candidates | using a distribution rule | **without a distribution rule** | tree | join | inside one template instance | after merging candidates with identical matches |
|---|---|---|---|---|---|---|---|---|---|---|
| lexicalized | 2 | 77,371 | 9,261 | 2,009 | 305 | **1,704** | 1,650 | 54 | 1,045 | |
| lexicalized | 3 | 125,398 | 27,113 | 3,316 | 832 | **2,484** | 2,249 | 235 | 1,103 | |
| lexicalized | 4 | 177,625 | 48,406 | 3,893 | 1,589 | **2,304** | 1,916 | 388 | 831 | |
| lexicalized | 5 | 185,427 | 51,772 | 3,554 | 2,012 | **1,542** | 1,226 | 316 | 442 | |
| lexicalized | all | 565,821 | 136,552 | **12,772** | 4,738 | **8,034** | 7,041 | 993 | 3,421 | **2,751** |
| shape | 2 | 139,756 | 7,402 | 2,287 | 396 | **1,891** | 1,833 | 58 | 1,051 | |
| shape | 3 | 326,994 | 46,932 | 6,995 | 1,418 | **5,577** | 5,220 | 357 | 2,492 | |
| shape | 4 | 689,387 | 149,206 | 14,593 | 3,869 | **10,724** | 9,603 | 1,121 | 3,881 | |
| shape | 5 | 1,228,919 | 311,706 | 23,113 | 8,428 | **14,685** | 12,458 | 2,227 | 4,033 | |
| shape | all | 2,385,056 | 515,246 | **46,988** | 14,111 | **32,877** | 29,114 | 3,763 | 11,457 | **4,212** |

What each column counts:

- *view*: `lexicalized` patterns keep the class symbols (`dog`, `run`); `shape` patterns turn each class symbol into a class variable (`$c1`), so one shape covers many lexicalized patterns.
- *connected atoms*: the size of a pattern — the number of atoms in it, each tied to another by a shared variable (the same event, thing, time or rule). A row counts the patterns of exactly that size; the `all` row adds the rows up.
- *atom sets found*: occurrences, not patterns. Every connected set of that many atoms inside one sentence counts once, over the sentences of every share, so a pattern found in 500 sentences counts 500 times. A set is only looked at when its smaller parts are already frequent (a pattern cannot be frequent unless its parts are).
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

- recurrence: 6,289 of the 8,034 candidates without a distribution rule (78%) also occur in a held-out family; of all 12,772 candidates, 9,959 (78%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 61% of 3,686 · 4: 86% of 1,331 · 5: 95% of 1,193 · 6 to 9: 96% of 1,123 · 10 or more: 100% of 701
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 8,034 of the 8,034
- the two tests, all 12,772 candidates: the renaming test is passed by 12,772, the broken-link test by 12,772

**shape**

- recurrence: 27,076 of the 32,877 candidates without a distribution rule (82%) also occur in a held-out family; of all 46,988 candidates, 38,151 (81%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 69% of 14,463 · 4: 86% of 6,009 · 5: 92% of 2,909 · 6 to 9: 95% of 5,164 · 10 or more: 100% of 4,332
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 31,059 of the 32,877 and is tighter — a class every `mine` match shares — for 1,818; 1,277 of those have held-out matches, and the class holds in every one of them for 688 (54%)
- the two tests, all 46,988 candidates: the renaming test is passed by 46,988, the broken-link test by 46,988

The whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: lexicalized: the identical table (12,772 patterns); shape: the identical table (46,988 patterns)

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

Something in two events, or a loop among the arguments; no rule, no sealed clause; the match spans several template instances.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L002050 | 39 | 41 | 92 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2)` | $e1 sit · run · walk; $e2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-L000081 | 27 | 14 | 42 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1)` | $e1 stand · sit · countersue; $e2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L002078 | 25 | 22 | 58 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man)` | $e1 wear · sit · stand; $e2 wear · sit · walk; $x1 man | The man in a hat suited for cowboys is walking through a market and is putting a |
| subtree-L002104 | 21 | 18 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1)` | $e1 wear · open · sit; $e2 jump · wear · stick_out; $x1 man · cat · woman | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L002110 | 20 | 16 | 38 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1)` | $e1 wear · stand · sit; $e2 wear · sit · tinker; $e3 wear · calculate · build; $x1 man · woman · girl | Three young men are furiously running, jumping and kicking near a vending machin |
| subtree-L002131 | 18 | 19 | 39 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Theme($e1,$x2)` | $e1 carry · ride · throw; $e2 wear · approach · run; $x1 woman · man · dog; $x2 ball · unicycle · car | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-L000163 | 17 | 26 | 38 | 1 | `Location($e1,$x1) & Location($e2,$x1)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| subtree-L002151 | 17 | 8 | 19 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Theme($e2,§1)` | $e1 countersue · live · reverse; $e2 say · argue · rule; $x1 court · santa_clara-based · mother | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L002186 | 16 | 18 | 39 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman)` | $e1 wear · sit · dance; $e2 wear · hold · play; $x1 woman · seated | A woman is crouching down next to a dog and is smiling at a young girl sitting o |
| subtree-L002187 | 16 | 23 | 36 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Location($e2,$x2)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| subtree-L002223 | 14 | 7 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-L002224 | 14 | 13 | 25 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,stand)` | $e1 stand; $e2 play · wear · pull; $x1 man · girl · woman | Adults and children are standing and playing in front of steps near a desert are |
| subtree-L002257 | 13 | 12 | 24 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,play)` | $e1 play; $e2 stand · sing · play; $x1 woman · girl · boy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-L002285 | 12 | 5 | 12 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2)` | $e1 reverse · cite · seek; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 decision · legislation · injunction | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L000292 | 11 | 4 | 12 | 1 | `Agent($e1,$x1) & Also($x1,$e1)` | $e1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L000336 | 10 | 6 | 13 | 1 | `Bearer($e1,$x1) & Patient($e2,$x1)` | $e1 involve · wife · mother; $e2 die · reach · marry; $x1 settlement · wife · mother | Her 20-year-old sister, Allyson, was severely burned and remained hospitalized i |
| subtree-L000347 | 10 | 4 | 10 | 1 | `Patient($e1,$x1) & Theme($e2,$x1)` | $e1 make · describe · encounter; $e2 provide · earn · come; $x1 evidence · fire · briton | The mother of a Briton held by Colombian guerrillasspoke of her relief yesterday |
| subtree-L000348 | 10 | 3 | 11 | 1 | `Theme($e1,$x1) & Theme($e2,$x1)` | $e1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-L002384 | 10 | 5 | 16 | 1 | `Patient($e1,$x1) & Patient($e2,$x1) & Time($e1,$t1)` | $e1 improve · find · quote; $e2 slide_down · tuck · add; $t1 month · day · week; $x1 rate · report · gold | Spot gold was quoted at $367.90/368.60 an ounce at 1000 GMT, having marched up t |
| subtree-L002424 | 9 | 7 | 15 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Goal($e1,$x2)` | $e1 jump · throw · put; $e2 wear · approach · walk; $x1 car · boy · kid; $x2 pool · air · pocket | The man in a hat suited for cowboys is walking through a market and is putting a |

### Joins between events: 4–5 atoms

The same, larger.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L005339 | 48 | 42 | 92 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L005349 | 32 | 28 | 75 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Patient($e2,$x3)` | $e1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-L005350 | 32 | 35 | 92 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · sit · hold; $x1 man · woman · boy; $x2 shirt · jacket · hat | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L005374 | 20 | 16 | 46 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man) & Patient($e1,$x2)` | $e1 wear · hold · hold_up; $e2 sit · wear · stand; $x1 man; $x2 sign · shirt · suit | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L005378 | 19 | 14 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2)` | $e1 wear · calculate · pound; $e2 wear · sit · stand; $e3 wear · build · laugh; $x1 man · woman · girl; $x2 shirt · jacket · route | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L005390 | 18 | 17 | 32 | 1 | `Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)` | $e1 stick_out · raise · flap; $x1 girl · woman · boy; $x3 tongue · dividend · case | In addition, Goldman raised its quarterly dividend to 25 cents a share, up from  |
| subtree-L005403 | 17 | 1 | 25 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say · claim · hear; $x1 adviser · director · daughter; $x2 federal · briton · union | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L005436 | 16 | 12 | 26 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3)` | $e1 wear · open · outline; $e2 jump · sit · wear; $x1 cat · boy · man; $x3 drawer · case · plan | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L005437 | 16 | 11 | 24 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Possession($x3,$x2)` | $e1 wear · open · sit; $e2 jump · read · specify; $x1 cat · man · boy; $x3 case · government · pocket | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L009266 | 16 | 14 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · pound · develop; $e2 wear · build · destroy; $e3 wear · sit · pose; $x1 woman · man · girl; $x2 shirt · jacket · southern; $x3 sweatshirt · northern · hat | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L009267 | 16 | 19 | 41 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear; $e2 wear · hold · perform; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 boy · sweatshirt · trick | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L009268 | 16 | 1 | 23 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say; $x1 adviser · director · daughter; $x2 federal · union · store | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L009283 | 15 | 12 | 37 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e2,wear) & Patient($e2,$x3)` | $e1 sit · walk · stand; $e2 wear; $x1 man · boy · woman; $x2 table · grass · bench; $x3 hat · shirt · jacket | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L005466 | 14 | 9 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x3) & Patient($e2,$x3)` | $e1 wear · issue · pound; $e2 wear · add · pound; $x1 man · rain · justice; $x2 woman · colleague · dog; $x3 statement · southern · fund | A coalition of campaign groups, including the militant national students body, i |
| subtree-L005510 | 12 | 3 | 27 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit) & Patient($e2,$x2)` | $e1 sit; $e2 wear · hold · read; $x1 man · person · woman; $x2 hat · jacket · toy | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-L005511 | 12 | 17 | 29 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman) & Patient($e1,$x2)` | $e1 wear · play · beat; $e2 wear · hold · sit; $x1 woman · seated; $x2 jacket · instrument · boa | The woman is sitting on a bench and is wearing a gray jacket and black pants |
| subtree-L005512 | 12 | 19 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Location($e1,$x3) & Location($e2,$x3)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 dog · man · brown; $x2 dog · woman · boy; $x3 grass · beach · table | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| subtree-L009322 | 12 | 7 | 18 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x4,$x2)` | $e1 wear · open · read; $e2 jump · outline · specify; $x1 cat · boy · state; $x3 drawer · plan · law; $x4 case · government · dividend | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L005531 | 11 | 9 | 20 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,man)` | $e1 sit · stand · perform; $e2 wear · rub · sing; $x1 man; $x2 table · rail · street | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L009335 | 11 | 8 | 23 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · sit · stand; $e3 wear · laugh · ride; $x1 man · woman · girl; $x2 shirt · jacket · necklace | A man is wearing clothes that are covered with paint and is sitting outside in a |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L002102 | 21 | 8 | 28 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000127 | 20 | 18 | 21 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,man)` | $x1 man | The man is not eating a banana by a tree |
| subtree-L005434 | 16 | 8 | 20 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000191 | 15 | 13 | 15 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,woman)` | $x1 woman | The woman is not handling a frog |
| subtree-L005465 | 14 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Coref($x2,$x3) & Experiencer($e1,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $e2 organise; $x1 committee · contract · maximum; $x3 judge · state | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002254 | 13 | 7 | 15 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x2,$x1) & Theme($e1,§1)` | $e1 say · decide · continue; $x1 state | With Smithfields leadership, Farmland Foods will succeed and continue to sustain |
| subtree-L005495 | 13 | 3 | 18 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002281 | 12 | 6 | 13 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · admit; $e2 make; $t1 day · week; $x1 office · company · board | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-L002283 | 12 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Possession($x1,$x2) & Theme($e1,§1)` | $e1 say · decide · insist; $x1 home · job · committee; $x2 mosque · justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L005509 | 12 | 5 | 16 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L009333 | 11 | 3 | 14 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002364 | 10 | 6 | 13 | 2 | `Theme:$e1 ▸ Experiencer($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell; $x2 witness · leadership | Klitschko said: "I'm excited to box in Los Angeles first and then against Lennox |

### With a rule of the sentence

Atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000077 | 28 | 26 | 65 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1)` | $e1 jump · stand · sit; $x1 girl · boy · man | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000119 | 21 | 24 | 55 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1)` | $e1 run · play · stand; $x1 dog · bird · man | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000120 | 21 | 19 | 61 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1)` | $e1 run · play · jump; $x1 dog · car · cat | A white dog is running through a snowy trail |
| subtree-L000150 | 17 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1)` | $e1 run · lie · play; $x1 dog · cat · duck | A brown dog is running through a snowy trail |
| subtree-L009260 | 16 | 14 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member brown))) & Member($x1,dog)` | $e1 run · lie · play; $x1 dog | A brown dog is running through a snowy trail |
| subtree-L009261 | 16 | 16 | 50 | 13 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member white))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member white))) & Member($x1,dog)` | $e1 run · play · jump; $x1 dog | A white dog is running through a snowy trail |
| subtree-L002216 | 14 | 11 | 26 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 jump · play · ride; $x1 girl · boy · child; $x2 edge · air · sidewalk | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L009291 | 14 | 17 | 37 | 13 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member black))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member black))) & Member($x1,dog)` | $e1 play · run · carry; $x1 dog | The black dog is walking along a tree trunk bridge over water |
| subtree-L000257 | 12 | 14 | 19 | 1 | `rule consequent:$r1 ▸ Member($x1,small) [graded] & Agent($e1,$x1)` | $e1 stand · sit · slide; $x1 dog · boy · group | A small group of people are standing and two are sitting on the sofa |
| subtree-L002273 | 12 | 14 | 39 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · play · stand; $x1 dog · bird · child; $x2 grass · field · sand | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L002274 | 12 | 10 | 23 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · lie · play; $x1 dog · duck; $x2 beach · grass · air | A brown and white dog is biting a dirty tennis ball in a dirt field |
| subtree-L002275 | 12 | 11 | 31 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · jump_up · jump; $x1 dog · animal · bird; $x2 grass · field · air | A brown and white dog is biting a dirty tennis ball in a dirt field |

### The most widespread overall

Any structure, any label.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000001 | 307 | 287 | 898 | 1 | `Agent($e1,$x1) & Patient($e1,$x2)` | $e1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| subtree-L000002 | 195 | 190 | 671 | 1 | `Agent($e1,$x1) & Location($e1,$x2)` | $e1 sit · stand · play; $x1 man · dog · woman; $x2 grass · beach · field | Three women are sitting in a village |
| subtree-L000003 | 174 | 88 | 268 | 1 | `Experiencer($e1,$x1) & Theme($e1,§1)` | $e1 say · believe · agree; $x1 spokesman · president · report | "In return we expect North Korea to give up nuclear weapons." |
| subtree-L002010 | 137 | 64 | 202 | 3 | `Experiencer($e1,$x1) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x1 spokesman · president · company | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-L000007 | 121 | 102 | 296 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · sit · stand; $e2 wear · play · jump; $x1 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000008 | 118 | 107 | 438 | 1 | `Agent($e1,$x1) & Member($x1,man)` | $e1 stand · sit · wear; $x1 man · naked | A man is eating a banana |
| subtree-L002012 | 97 | 78 | 222 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2)` | $e1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · boy; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000012 | 89 | 81 | 172 | 1 | `Location($e1,$x1) & Patient($e1,$x2)` | $e1 perform · play · do; $x1 bowl · field · water; $x2 trick · ball · bicycle | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-L000013 | 88 | 51 | 137 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1)` | $e1 say · decline · tell; $e2 make · provide · organise; $x1 deal · representative · office | "In return we expect North Korea to give up nuclear weapons." |
| subtree-L000014 | 85 | 60 | 134 | 1 | `Coref($x1,$x2) & Possession($x3,$x1)` | $x1 isp; $x2 boy · man · pregnant; $x3 apartment · dividend · death | In exchange, North Korea would be required to end its nuclear weapons program. |

### Candidates using a distribution rule

The candidates left out of the tables above (the *using a distribution rule* column). Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000006 | 121 | 103 | 377 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| subtree-L000009 | 116 | 100 | 373 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| subtree-L002011 | 115 | 98 | 369 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| subtree-L000010 | 100 | 80 | 183 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 man · woman · person; $x2 case · region · race | The parents of a Briton being held hostage by Colombian rebels spoke yesterday o |
| subtree-L000011 | 93 | 61 | 150 | 1 | `rule consequent:$r1 ▸ Patient($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | DNA tests will be performed to confirm his identity. |

## The shape view

One row per group, by mining families. Every table but the last holds only candidates without a distribution rule.

### Joins between events: 2–3 atoms

Something in two events, or a loop among the arguments; no rule, no sealed clause; the match spans several template instances.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S003014 | 17 | 26 | 38 | 2 | `Location($e1,$x1) & Location($e2,$x1) & Member($e1,$c1)` | $c1 sit · run · stand; $x1 grass · beach · table | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| subtree-S003408 | 11 | 4 | 12 | 2 | `Agent($e1,$x1) & Also($x1,$e1) & Member($e1,$c1)` | $c1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S003594 | 10 | 3 | 11 | 2 | `Member($e1,$c1) & Theme($e1,$x1) & Theme($e2,$x1)` | $c1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-S006645 | 4 | 2 | 5 | 2 | `Experiencer($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1)` | $c1 look · worried · say; $e2 look · worried · add | Three men are lying on a hill and looking at the mountains and sky |
| subtree-S008889 | 3 | 1 | 3 | 2 | `Also($x1,$e1) & Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · new · think | The WWF also thinks a further 13,000 animals are being caught every year around  |

### Joins between events: 4–5 atoms

The same, larger.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S009322 | 75 | 75 | 209 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · stand; $c2 man · woman · boy; $e2 wear · play · walk | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023900 | 70 | 66 | 196 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Member($x1,$c3)` | $c1 wear · sit · stand; $c2 wear · play · walk; $c3 man · woman · boy | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023901 | 68 | 61 | 156 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · open; $c2 shirt · jacket · sign; $e2 wear · sit · walk; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S023929 | 62 | 58 | 160 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 wear · hold · play; $c2 man · woman · boy; $e2 sit · wear · walk; $x2 shirt · jacket · sign | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S024003 | 52 | 50 | 134 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 man · woman · boy; $c2 shirt · jacket · sign; $e1 wear · hold · open; $e2 wear · sit · walk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024101 | 48 | 42 | 92 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S009590 | 39 | 41 | 92 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1)` | $c1 sit · run · walk; $e2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024165 | 38 | 39 | 91 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($e2,$c2)` | $c1 sit · run · walk; $c2 wear · open · look; $x1 man · woman · cat; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024193 | 33 | 35 | 64 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 jacket · shirt · suit; $e1 wear · hold · use; $e2 wear · hold · specify; $x1 woman · man · girl; $x3 coat · glass · sweatshirt | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S024207 | 32 | 32 | 79 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · run · walk; $c2 man · woman · cat; $e2 wear · open · look; $x2 grass · table · sidewalk | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024208 | 32 | 28 | 75 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Patient($e2,$x3)` | $c1 sit · run · walk; $e2 wear · open · hold; $x1 man · woman · girl; $x2 grass · table · sand; $x3 hat · shirt · drawer | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024213 | 32 | 26 | 73 | 15 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Member($x2,(Narrow $c1 (Member $c2))) & Patient($e1,$x2)` | $c1 shirt · jacket · suit; $c2 red · pink · blue; $e1 wear · hold · hold_up; $e2 wear · sit · hold; $x1 man · woman · boy | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S024228 | 31 | 36 | 72 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | $c1 sit · run · walk; $c2 grass · table · sidewalk; $e2 wear · look · play; $x1 man · woman · dog | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S009679 | 30 | 22 | 64 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2)` | $c1 woman · person · child; $c2 wear · play · stand; $e2 play · read · jump | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S024283 | 28 | 30 | 59 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 woman · man · girl; $e1 wear · hold · conduct; $e2 wear · hold · perform; $x2 jacket · shirt · suit; $x3 coat · glass · sweatshirt | Revelations of the expenditures shocked some employees at Delta, an airline that |
| subtree-S009728 | 27 | 26 | 51 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c1)` | $c1 wear · play · pound; $x1 woman · man · girl | "Germany is on the right path," he added, specifying his government's announced  |
| subtree-S009729 | 27 | 14 | 42 | 4 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 stand · sit · countersue; $c2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S024299 | 27 | 29 | 65 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($x1,$c1) & Member($x2,$c2)` | $c1 man · woman · dog; $c2 grass · table · sidewalk; $e1 sit · run · walk; $e2 wear · look · play | A boy is comfortably sitting in a room and playing a piano by a lamp |
| subtree-S024327 | 26 | 21 | 55 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Member($e2,$c3)` | $c1 woman · person · child; $c2 wear · stand · sit; $c3 read · jump · sing | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S024328 | 26 | 13 | 45 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 pant · bead · skate; $e1 wear · destroy · specify; $e2 wear · use · perform; $x1 woman · man · girl; $x3 shirt · jacket · southern | Revelations of the expenditures shocked some employees at Delta, an airline that |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002412 | 59 | 72 | 69 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · sit · run; $c2 man · woman · person | The man is not eating a banana by a tree |
| subtree-S024154 | 41 | 15 | 57 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 target · impose · jaywalk; $c2 say · aim · consider; $c3 spokesman · president · prosecutor | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S024206 | 32 | 18 | 39 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 impose · have · reach; $c2 say · believe · decide; $e2 organise; $x1 isp; $x2 judge · santa_clara-based · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-S002638 | 28 | 25 | 30 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & GroupOf($x1,$c2)` | $c1 play · wear · fight; $c2 man · child · dog | The men are not fist fighting in a ring |
| subtree-S009726 | 27 | 39 | 30 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Not ▸ Patient($e1,$x2) & Member($x1,$c2)` | $c1 wear · play · crack; $c2 woman · man · person; $x2 tape · patient · dog | The man is not eating a banana by a tree |
| subtree-S009871 | 23 | 16 | 37 | 6 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($x1,$c2) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 deal · representative · office; $e1 say · decline · aim | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S024469 | 23 | 16 | 36 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 say · decline · aim; $c3 deal · representative · office | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S024514 | 21 | 8 | 28 | 8 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 allow · impose · reach; $c2 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-S024774 | 19 | 5 | 29 | 7 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($x2,$c2) & Theme($e1,§1)` | $c1 jaywalk · impose · talk; $c2 president · spokesman · judge; $e1 say · consider · argue; $x1 state · victim · damage | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S024950 | 17 | 2 | 22 | 7 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Mod $x2))) & Theme($e1,§1)` | $c1 help · pleased · target; $c2 president · spokesman · report; $e1 say · aim · state | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S003028 | 16 | 12 | 16 | 2 | `Not ▸ Location($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 play · stand · sit; $c2 beach · water · surf | The man in a cowboy hat is not walking through a market and is not putting a han |
| subtree-S010275 | 16 | 8 | 19 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Theme($e1,§1) & Time($e1,$t1)` | $c1 impose · take_over · think; $c2 say · announce · try; $e2 make; $t1 day · year · week | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |

### With a rule of the sentence

Atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S023880 | 122 | 131 | 330 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl; $e1 run · sit · jump | A fur scarf is being held by an Asian woman |
| subtree-S023897 | 70 | 77 | 140 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1))) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · dog; $e1 wear · use · raise | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S023921 | 62 | 66 | 127 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 shirt · jacket · hat; $e1 wear · raise · cut; $x2 man · woman · boy | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S023976 | 53 | 57 | 90 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 young · little · big; $c2 man · dog · girl; $e1 wear · chase · hold; $x2 ball · sign · shirt | A fur scarf is being held by an Asian woman |
| subtree-S023994 | 52 | 60 | 137 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,$c2)` | $c1 black · young · brown; $c2 dog · girl · boy; $e1 sit · jump · run; $x2 grass · air · field | A grey dog is bouncing a tennis ball on its head in a grass field |
| subtree-S024023 | 51 | 53 | 111 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x2) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x1)` | $c1 red · blue · white; $c2 wear · cut · hold; $c3 man · woman · boy; $x1 shirt · jacket · hat | The new WPAN standard uses the 2.4-GHz unlicensed frequency band and specifies r |
| subtree-S024039 | 50 | 42 | 104 | 14 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play | A dog is running on a snowy path |
| subtree-S024068 | 49 | 42 | 102 | 13 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($e1,$c3) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $c3 sit · stand · play | A dog is running on a snowy path |
| subtree-S024116 | 47 | 37 | 100 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Location($e1,$x1) & Member($x1,$c2)` | $c1 green · sandy · snowy; $c2 grass · room · field; $e1 sit · stand · play; $x2 man · dog · bird | A dog is running on a snowy path |
| subtree-S024135 | 45 | 45 | 79 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x1) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | $c1 little · young · big; $c2 wear · chase · hold; $c3 ball · sign · shirt; $x1 man · dog · boy | A fur scarf is being held by an Asian woman |
| subtree-S002539 | 37 | 23 | 38 | 2 | `rule consequent:$r1 ▸ Location($e1,$x1) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x1,$c2)` | $c1 run · sit · stand; $c2 grass · water · road | There is no dog chasing a ball in the grass |
| subtree-S009608 | 35 | 23 | 36 | 2 | `rule consequent:$r1 ▸ Agent($e1,$x1) [denied] & rule consequent:$r1 ▸ Location($e1,$x2) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x2,$c2)` | $c1 run · sit · ride; $c2 grass · water · road | There is no dog chasing a ball in the grass |

### The most widespread overall

Any structure, any label.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000001 | 495 | 432 | 2149 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| subtree-S000002 | 401 | 349 | 1093 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| subtree-S002288 | 331 | 319 | 1566 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S009283 | 315 | 268 | 915 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · man · girl | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S002293 | 307 | 287 | 898 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| subtree-S002294 | 276 | 275 | 712 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| subtree-S000012 | 237 | 213 | 750 | 1 | `Location($e1,$x1) & Member($e1,$c1)` | $c1 sit · stand · play; $x1 grass · beach · field | Three women are sitting in a village |
| subtree-S000014 | 224 | 124 | 364 | 1 | `Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · look · full; $x1 woman · spokesman · president | "In return we expect North Korea to give up nuclear weapons." |
| subtree-S009284 | 220 | 235 | 600 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |
| subtree-S000016 | 208 | 164 | 426 | 1 | `Member($x1,$c1) & Member($x1,(Narrow $c1 (Mod $c2)))` | $c1 ball · pool · bike; $c2 dirt · tennis · soccer | The address made no mention of the role of terrorist organisation Jemaah Islamiy |

### The shapes with the most lexicalizations

By the number of different class tuples that filled the shape.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002288 | 331 | 319 | 1566 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **626 lexicalizations** — $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S009283 | 315 | 268 | 915 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | **436 lexicalizations** — $c1 young · black · brown; $c2 dog · man · girl | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S000001 | 495 | 432 | 2149 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | **432 lexicalizations** — $c1 play · stand · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| subtree-S002294 | 276 | 275 | 712 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | **416 lexicalizations** — $c1 wear · play · cut; $c2 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| subtree-S002298 | 200 | 186 | 661 | 1 | `Location($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **346 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field | Three women are sitting in a village |
| subtree-S009284 | 220 | 235 | 600 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | **340 lexicalizations** — $c1 wear · play · hold; $c2 ball · trick · shirt; $x1 man · woman · person | A man is eating a banana |
| subtree-S023876 | 160 | 192 | 507 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | **326 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $c3 ball · trick · shirt | A man is eating a banana |
| subtree-S000002 | 401 | 349 | 1093 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | **314 lexicalizations** — $c1 wear · play · cut; $x1 ball · man · shirt | The value of the deal has increased since BP first announced it in February. |
| subtree-S009285 | 201 | 219 | 692 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | **313 lexicalizations** — $c1 wear · play · cut; $c2 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |
| subtree-S009286 | 173 | 173 | 608 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | **309 lexicalizations** — $c1 sit · stand · play; $c2 grass · beach · field; $x1 man · dog · boy | Three women are sitting in a village |
| subtree-S023877 | 131 | 137 | 448 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3)` | **292 lexicalizations** — $c1 sit · stand · run; $c2 man · dog · boy; $c3 grass · beach · water | A ball is being chased by a dog on the grass |
| subtree-S002293 | 307 | 287 | 898 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | **261 lexicalizations** — $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · shirt · trick | A man is eating a banana |

### Shapes whose matches all share a class

The generalizer keeps a class that every `mine` match has; the pattern shown is that generalization (the record's `generalization`), with the outcome of the held-out check.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002531 | 40 | 31 | 48 | 3 | `Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c1)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S009592 | 39 | 31 | 47 | 2 | `Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S024795 | 19 | 16 | 22 | 4 | `Member($e1,$c1) & Member($t1,day) & Patient($e1,$x1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S024966 | 17 | 8 | 19 | 4 | `Experiencer($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — fails held-out: day not in every one of 9 matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| subtree-S025363 | 13 | 16 | 14 | 4 | `Agent($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S025514 | 12 | 4 | 15 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Agent($e1,$x1) & Member($e1,tell) & Recipient($e1,$x2) & Theme($e1,§1)` | keeps tell — holds in all 5 held-out matches | "I go to their website and start complaining to them, would you please, please,  |
| subtree-S025516 | 12 | 5 | 13 | 3 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 5 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S025839 | 11 | 7 | 12 | 4 | `Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 9 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| subtree-S011182 | 10 | 7 | 13 | 4 | `Experiencer($e1,$x1) & Member($e1,full) & Member($x1,$c1) & Of($e1,$c2)` | keeps full — holds in all 12 held-out matches | A dog is running alongside a fence on a track full of dirt |
| subtree-S026117 | 10 | 7 | 11 | 4 | `Location($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 8 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S026969 | 8 | 3 | 9 | 4 | `Theme:$e1 ▸ Agent($e2,$x1) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 3 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S028075 | 7 | 2 | 8 | 3 | `Coref($x1,$x2) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 2 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |

### Candidates using a distribution rule

The candidates left out of the tables above (the *using a distribution rule* column). Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000013 | 224 | 171 | 604 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child | Three women are sitting in a village |
| subtree-S000015 | 215 | 163 | 554 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · sit · stand | Three women are sitting in a village |
| subtree-S002296 | 214 | 163 | 552 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | $c1 play · sit · stand; $c2 person · man · child | Three women are sitting in a village |
| subtree-S000021 | 180 | 143 | 496 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Member($e1,$c1)` | $c1 play · sit · stand; $x1 man · woman · person | Three women are sitting in a village |
| subtree-S000028 | 133 | 97 | 234 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule consequent:$r1 ▸ Patient($e1,$x1)` | $c1 wear · play · eat; $x1 case · region · race | DNA tests will be performed to confirm his identity. |

