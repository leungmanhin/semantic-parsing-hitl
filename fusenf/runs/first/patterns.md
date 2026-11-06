# Connected patterns of run `first` — 2026-11-07 00:21

§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized view keeps the class symbols, the shape view turns them into class variables. Every row is a CANDIDATE with its evidence, not a finding.

- key dials: `{"polarity": "three", "tense": "evidence", "habitual": "evidence"}`
- parameters: `{"min_atoms": 2, "max_atoms": 5, "min_families": 3, "support_role": "mine", "max_variables": null, "exclude_heads": [], "max_embeddings": 200000, "derived_rule_templates": ["distribution"]}`
- corpus: 4,257 sentences in 1,082 families ({'evaluate': 368, 'mine': 714}). The 714 families of the `mine` share decide which patterns are candidates and supply their evidence. The other 368 are held out: they are counted beside it and they check the generalization, nothing else.
- time (s): {'lexicalized': 16.7, 'shape': 105.9, 'tests': 106.0, 'renamed_corpus': 140.1, 'total': 370.9}

## How many

| view | connected atoms | atom sets found | distinct patterns | candidates | using a distribution rule | **without a distribution rule** | tree | join | inside one template instance | after merging candidates with identical matches |
|---|---|---|---|---|---|---|---|---|---|---|
| lexicalized | 2 | 54,666 | 7,858 | 1,832 | 281 | **1,551** | 1,500 | 51 | 961 | |
| lexicalized | 3 | 92,209 | 23,065 | 3,016 | 770 | **2,246** | 2,027 | 219 | 1,039 | |
| lexicalized | 4 | 132,552 | 40,128 | 3,522 | 1,454 | **2,068** | 1,729 | 339 | 802 | |
| lexicalized | 5 | 140,109 | 43,021 | 3,150 | 1,810 | **1,340** | 1,082 | 258 | 436 | |
| lexicalized | all | 419,536 | 114,072 | **11,520** | 4,315 | **7,205** | 6,338 | 867 | 3,238 | **2,435** |
| shape | 2 | 101,571 | 6,899 | 2,213 | 385 | **1,828** | 1,773 | 55 | 1,014 | |
| shape | 3 | 250,043 | 43,352 | 6,687 | 1,370 | **5,317** | 4,978 | 339 | 2,384 | |
| shape | 4 | 544,859 | 137,021 | 13,764 | 3,737 | **10,027** | 8,990 | 1,037 | 3,629 | |
| shape | 5 | 980,882 | 282,581 | 21,476 | 8,127 | **13,349** | 11,336 | 2,013 | 3,658 | |
| shape | all | 1,877,355 | 469,853 | **44,140** | 13,619 | **30,521** | 27,077 | 3,444 | 10,685 | **3,957** |

What each column counts:

- *view*: `lexicalized` patterns keep the class symbols (`dog`, `run`); `shape` patterns turn each class symbol into a class variable (`$c1`), so one shape covers many lexicalized patterns.
- *connected atoms*: the size of a pattern — the number of atoms in it, each tied to another by a shared variable (the same event, thing, time or rule). A row counts the patterns of exactly that size; the `all` row adds the rows up.
- *atom sets found*: occurrences, not patterns. Every connected set of that many atoms inside one sentence counts once, over the sentences of every share, so a pattern found in 500 sentences counts 500 times. A set is only looked at when its smaller parts are already frequent (a pattern cannot be frequent unless its parts are).
- *distinct patterns*: the different patterns among those atom sets. Two atom sets are the same pattern when they differ only in which events and things they name.
- *candidates*: the distinct patterns found in at least 3 families of the `mine` share (it has 714). Each is one record in `patterns.<view>.jsonl`.
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

- recurrence: 5,012 of the 7,205 candidates without a distribution rule (70%) also occur in a held-out family; of all 11,520 candidates, 7,779 (68%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 51% of 3,424 · 4: 77% of 1,326 · 5: 90% of 984 · 6 to 9: 89% of 857 · 10 or more: 100% of 614
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 7,205 of the 7,205
- the two tests, all 11,520 candidates: the renaming test is passed by 11,520, the broken-link test by 11,520

**shape**

- recurrence: 22,707 of the 30,521 candidates without a distribution rule (74%) also occur in a held-out family; of all 44,140 candidates, 31,805 (72%)
- recurrence by mining families, candidates without a distribution rule: exactly 3: 58% of 13,384 · 4: 76% of 5,518 · 5: 85% of 2,781 · 6 to 9: 90% of 4,852 · 10 or more: 100% of 3,986
- generalizer: the generalization of a candidate's `mine` matches equals its pattern for 28,812 of the 30,521 and is tighter — a class every `mine` match shares — for 1,709; 1,125 of those have held-out matches, and the class holds in every one of them for 660 (59%)
- the two tests, all 44,140 candidates: the renaming test is passed by 44,140, the broken-link test by 44,140

The whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: lexicalized: the identical table (11,520 patterns); shape: the identical table (44,140 patterns)

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
| subtree-L001876 | 32 | 18 | 76 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2)` | $e1 sit · walk · run; $e2 wear · open · look; $x1 man · cat · dog; $x2 grass · sidewalk · sand | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L000073 | 27 | 10 | 42 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1)` | $e1 stand · sit · countersue; $e2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L001917 | 21 | 6 | 46 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man)` | $e1 wear · sit · stand; $e2 wear · walk · hold; $x1 man | The man in a hat suited for cowboys is walking through a market and is putting a |
| subtree-L001942 | 18 | 10 | 30 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1)` | $e1 wear · open · sit; $e2 jump · stick_out · read; $x1 man · cat · dog | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L001955 | 17 | 7 | 33 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1)` | $e1 wear · stand · sit; $e2 wear · tinker · jump; $e3 wear · calculate · build; $x1 woman · man · girl | Three young men are furiously running, jumping and kicking near a vending machin |
| subtree-L001956 | 17 | 7 | 36 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Theme($e1,$x2)` | $e1 carry · ride · throw; $e2 wear · approach · run; $x1 woman · man · dog; $x2 ball · unicycle · cart | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-L001958 | 17 | 8 | 19 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Theme($e2,§1)` | $e1 countersue · live · reverse; $e2 say · argue · rule; $x1 court · santa_clara-based · mother | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L000169 | 15 | 14 | 34 | 1 | `Location($e1,$x1) & Location($e2,$x1)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 grass · table · stop | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| subtree-L002007 | 14 | 3 | 25 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,stand)` | $e1 stand; $e2 play · wear · pull; $x1 man · girl · woman | Adults and children are standing and playing in front of steps near a desert are |
| subtree-L002010 | 14 | 11 | 32 | 1 | `Agent($e1,$x1) & Location($e1,$x2) & Location($e2,$x2)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 man · dog · brown; $x2 grass · table · bottom | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| subtree-L002079 | 12 | 4 | 22 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,play)` | $e1 play; $e2 stand · sing · play; $x1 woman · girl · person | Adults and children are standing and playing in front of steps near a desert are |
| subtree-L002080 | 12 | 6 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman)` | $e1 wear · sit · crouch_down; $e2 wear · hold · play; $x1 woman · seated | A woman is crouching down next to a dog and is smiling at a young girl sitting o |
| subtree-L002082 | 12 | 5 | 12 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2)` | $e1 reverse · cite · seek; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 decision · legislation · injunction | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L000268 | 11 | 4 | 12 | 1 | `Agent($e1,$x1) & Also($x1,$e1)` | $e1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L002104 | 11 | 1 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,sit)` | $e1 sit; $e2 wear · hold · read; $x1 man · woman · girl | Two blokes are sitting around a table and holding beers in their hands |
| subtree-L000304 | 10 | 6 | 13 | 1 | `Bearer($e1,$x1) & Patient($e2,$x1)` | $e1 involve · wife · mother; $e2 die · reach · marry; $x1 settlement · wife · mother | Her 20-year-old sister, Allyson, was severely burned and remained hospitalized i |
| subtree-L000318 | 10 | 2 | 10 | 1 | `Patient($e1,$x1) & Theme($e2,$x1)` | $e1 make · describe · encounter; $e2 provide · earn · come; $x1 evidence · fire · briton | The mother of a Briton held by Colombian guerrillasspoke of her relief yesterday |
| subtree-L002164 | 10 | 5 | 16 | 1 | `Patient($e1,$x1) & Patient($e2,$x1) & Time($e1,$t1)` | $e1 improve · find · quote; $e2 slide_down · tuck · add; $t1 month · day · week; $x1 rate · report · gold | Spot gold was quoted at $367.90/368.60 an ounce at 1000 GMT, having marched up t |
| subtree-L000371 | 9 | 3 | 10 | 1 | `Theme($e1,$x1) & Theme($e2,$x1)` | $e1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-L002220 | 9 | 3 | 15 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Goal($e1,$x2)` | $e1 jump · throw · put; $e2 wear · approach · walk; $x1 car · boy · kid; $x2 pool · air · pocket | The man in a hat suited for cowboys is walking through a market and is putting a |

### Joins between events: 4–5 atoms

The same, larger.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L004867 | 42 | 20 | 80 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L004876 | 26 | 12 | 60 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Patient($e2,$x3)` | $e1 sit · walk · run; $e2 wear · open · hold; $x1 man · girl · woman; $x2 grass · sand · beach; $x3 drawer · hat · shirt | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L004878 | 25 | 7 | 75 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2)` | $e1 wear; $e2 wear · hold · sit; $x1 woman · man · boy; $x2 shirt · hat · jacket | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L004917 | 17 | 1 | 25 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say · claim · hear; $x1 adviser · director · daughter; $x2 federal · briton · union | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L004927 | 16 | 6 | 31 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2)` | $e1 wear · calculate · pound; $e2 wear · sit · stand; $e3 wear · build · ride; $x1 woman · man · girl; $x2 shirt · jacket · route | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L004928 | 16 | 6 | 35 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,man) & Patient($e1,$x2)` | $e1 wear · hold · drink; $e2 sit · wear · stand; $x1 man; $x2 sign · shirt · suit | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-L004929 | 16 | 12 | 27 | 1 | `Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)` | $e1 raise · flap · hug; $x1 woman · girl · duck; $x3 dividend · case · forecast | In addition, Goldman raised its quarterly dividend to 25 cents a share, up from  |
| subtree-L008402 | 16 | 1 | 23 | 4 | `Bearer($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e1,$x2) & Theme($e2,§1)` | $e1 president · director · attorney; $e2 say; $x1 adviser · director · daughter; $x2 federal · union · store | Jim Guest, president of Consumers Union, said they stand by their reporting. |
| subtree-L004971 | 14 | 9 | 23 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3)` | $e1 wear · open · outline; $e2 jump · sit · stick_out; $x1 cat · man · state; $x3 drawer · case · plan | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L004972 | 14 | 6 | 21 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Possession($x3,$x2)` | $e1 open · sit · wear; $e2 jump · read · specify; $x1 cat · man · state; $x3 case · government · pocket | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L008440 | 14 | 6 | 26 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Agent($e3,$x1) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear · pound · develop; $e2 wear · build · destroy; $e3 sit · pose · stand; $x1 woman · man · girl; $x2 shirt · jacket · southern; $x3 northern · thing | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L004987 | 13 | 6 | 21 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Patient($e1,$x3) & Patient($e2,$x3)` | $e1 wear · issue · pound; $e2 wear · add · pound; $x1 man · rain · justice; $x2 woman · colleague · rain; $x3 statement · southern · fund | A coalition of campaign groups, including the militant national students body, i |
| subtree-L008443 | 13 | 5 | 34 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,wear) & Patient($e1,$x2) & Patient($e2,$x3)` | $e1 wear; $e2 wear · hold · stick_out; $x1 woman · man · girl; $x2 shirt · jacket · suit; $x3 boy · cap · beer | A man is wearing clothes that are covered with paint and is sitting outside in a |
| subtree-L005034 | 11 | 10 | 28 | 1 | `Agent($e1,$x1) & Agent($e2,$x2) & Location($e1,$x3) & Location($e2,$x3)` | $e1 sit · run · stand; $e2 sit · run · stand; $x1 man · dog · brown; $x2 dog · woman · boy; $x3 grass · table · bottom | A man in a white shirt and sunglasses and a man in a black shirt and sunglasses  |
| subtree-L008476 | 11 | 6 | 17 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x4,$x2)` | $e1 open · wear · read; $e2 jump · outline · specify; $x1 cat · state · woman; $x3 drawer · plan · law; $x4 case · government · dividend | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L005058 | 10 | 6 | 26 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,woman) & Patient($e1,$x2)` | $e1 wear · play · sing; $e2 wear · hold · sit; $x1 woman · seated; $x2 jacket · instrument · boa | The woman is sitting on a bench and is wearing a gray jacket and black pants |
| subtree-L005061 | 10 | 4 | 12 | 2 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e2,say) & Theme($e2,§1)` | $e1 countersue · live · suggest; $e2 say; $x1 state | When you crossed the line, you violated the constitutional right," said Charles  |
| subtree-L005062 | 10 | 5 | 10 | 1 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Patient($e1,$x2) & Theme($e2,§1)` | $e1 reverse · cite · seek; $e2 say · argue · rule; $x1 court · santa_clara-based · state; $x2 decision · legislation · injunction | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L008484 | 10 | 7 | 15 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Patient($e2,$x4)` | $e1 wear · outline · specify; $e2 stick_out · read · specify; $x1 state · airline · woman; $x3 case · plan · suit; $x4 cap · law · letter | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-L008485 | 10 | 5 | 26 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e2,wear) & Patient($e2,$x3)` | $e1 sit · walk · stand; $e2 wear; $x1 man · woman · boy; $x2 bench · platform · sand; $x3 hat · shirt · jacket | A man is standing in the middle of a gym and is wearing a jersey |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L001915 | 21 | 8 | 28 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000144 | 16 | 7 | 16 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,man)` | $x1 man | The man in a cowboy hat is not walking through a market and is not putting a han |
| subtree-L004925 | 16 | 8 | 20 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L004970 | 14 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Coref($x2,$x3) & Experiencer($e1,$x3) & Theme($e1,§1)` | $e1 say · decide · announce; $e2 organise; $x1 committee · contract · maximum; $x3 judge · state | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L000205 | 13 | 4 | 13 | 1 | `Not ▸ Agent($e1,$x1) & Member($x1,woman)` | $x1 woman | The woman is not handling a frog |
| subtree-L002035 | 13 | 6 | 15 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x2,$x1) & Theme($e1,§1)` | $e1 say · decide · continue; $x1 state | With Smithfields leadership, Farmland Foods will succeed and continue to sustain |
| subtree-L004983 | 13 | 3 | 18 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002075 | 12 | 6 | 13 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1) & Time($e1,$t1)` | $e1 say · announce · admit; $e2 make; $t1 day · week; $x1 office · company · board | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-L002077 | 12 | 5 | 19 | 2 | `Theme:$e1 ▸ Patient($e2,$x1) & Possession($x1,$x2) & Theme($e1,§1)` | $e1 say · decide · insist; $x1 home · job · committee; $x2 mosque · justice | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-L005021 | 12 | 5 | 16 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Theme($e1,§1)` | $e1 say · announce · admit; $e2 organise; $x2 judge · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L008474 | 11 | 3 | 14 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Patient($e2,$x2) & Coref($x1,$x3) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x2 right · maximum · sentence; $x3 judge | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-L002137 | 10 | 6 | 13 | 2 | `Theme:$e1 ▸ Experiencer($e2,$x1) & Coref($x1,$x2) & Theme($e1,§1)` | $e1 say · tell; $x2 witness · leadership | Klitschko said: "I'm excited to box in Los Angeles first and then against Lennox |

### With a rule of the sentence

Atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000087 | 24 | 7 | 59 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1)` | $e1 jump · stand · sit; $x1 girl · boy · man | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000129 | 18 | 7 | 49 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1)` | $e1 play · run · sit; $x1 dog · bird · person | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L000135 | 17 | 10 | 54 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1)` | $e1 run · play · carry; $x1 dog · car · cat | A white dog is running through a snowy trail |
| subtree-L008433 | 14 | 9 | 45 | 13 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member white))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member white))) & Member($x1,dog)` | $e1 run · play · carry; $x1 dog | A white dog is running through a snowy trail |
| subtree-L008442 | 13 | 5 | 36 | 13 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member black))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member black))) & Member($x1,dog)` | $e1 play · run · carry; $x1 dog | The black dog is walking along a tree trunk bridge over water |
| subtree-L000228 | 12 | 6 | 27 | 1 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & Agent($e1,$x1)` | $e1 run · lie · play; $x1 dog · cat · duck | A brown dog is running through a snowy trail |
| subtree-L002065 | 12 | 4 | 22 | 1 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 jump · ride · walk; $x1 girl · boy · child; $x2 air · sidewalk · edge | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L008473 | 11 | 6 | 25 | 13 | `rule consequent:$r1 ▸ Member($x1,brown) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow dog (Member brown))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow dog (Member brown))) & Member($x1,dog)` | $e1 run · lie · play; $x1 dog | A brown dog is running through a snowy trail |
| subtree-L000288 | 10 | 3 | 15 | 1 | `rule consequent:$r1 ▸ Member($x1,small) [graded] & Agent($e1,$x1)` | $e1 slide · run · open; $x1 dog · boy · cat | A small cat is opening a plastic drawer with its paws and jumping inside |
| subtree-L002120 | 10 | 6 | 34 | 1 | `rule consequent:$r1 ▸ Member($x1,black) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 play · run · sit; $x1 dog · bird · child; $x2 grass · field · sand | A young black child is waiting on the edge of a body of water near some buckets |
| subtree-L002121 | 10 | 8 | 27 | 1 | `rule consequent:$r1 ▸ Member($x1,white) [graded] & Agent($e1,$x1) & Location($e1,$x2)` | $e1 run · jump_up · play; $x1 dog · animal · cat; $x2 grass · field · snow | A brown and white dog is biting a dirty tennis ball in a dirt field |
| subtree-L008480 | 10 | 1 | 17 | 13 | `rule consequent:$r1 ▸ Member($x1,young) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow boy (Member young))) [graded] & Agent($e1,$x1) & Member($x1,(Narrow boy (Member young))) & Member($x1,boy)` | $e1 ride · jump · wear; $x1 boy | The young boy is riding a dirt bike through the mud |

### The most widespread overall

Any structure, any label.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000001 | 278 | 141 | 766 | 1 | `Agent($e1,$x1) & Patient($e1,$x2)` | $e1 wear · play · cut; $x1 man · woman · person; $x2 ball · trick · shirt | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000002 | 174 | 88 | 268 | 1 | `Experiencer($e1,$x1) & Theme($e1,§1)` | $e1 say · believe · agree; $x1 spokesman · president · report | "In return we expect North Korea to give up nuclear weapons." |
| subtree-L000003 | 173 | 77 | 574 | 1 | `Agent($e1,$x1) & Location($e1,$x2)` | $e1 sit · stand · play; $x1 man · dog · woman; $x2 grass · field · water | Three women are sitting in a village |
| subtree-L001833 | 137 | 64 | 202 | 3 | `Experiencer($e1,$x1) & Member($e1,say) & Theme($e1,§1)` | $e1 say; $x1 spokesman · president · company | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-L000007 | 109 | 38 | 258 | 1 | `Agent($e1,$x1) & Agent($e2,$x1)` | $e1 wear · stand · sit; $e2 wear · play · jump; $x1 man · woman · dog | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000009 | 103 | 37 | 372 | 1 | `Agent($e1,$x1) & Member($x1,man)` | $e1 stand · sit · wear; $x1 man · naked | A man in a hat is walking through a store |
| subtree-L000012 | 88 | 50 | 137 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme($e1,§1)` | $e1 say · decline · tell; $e2 make · provide · organise; $x1 deal · representative · office | "In return we expect North Korea to give up nuclear weapons." |
| subtree-L001835 | 86 | 31 | 191 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Patient($e1,$x2)` | $e1 wear · hold · play; $e2 sit · wear · walk; $x1 man · woman · girl; $x2 shirt · jacket · hat | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-L000013 | 82 | 46 | 127 | 1 | `Coref($x1,$x2) & Possession($x3,$x1)` | $x1 isp; $x2 boy · man · pregnant; $x3 apartment · dividend · death | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-L000015 | 80 | 46 | 146 | 1 | `Location($e1,$x1) & Patient($e1,$x2)` | $e1 perform · stir · hold; $x1 field · bowl · water; $x2 trick · ball · bicycle | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |

### Candidates using a distribution rule

The candidates left out of the tables above (the *using a distribution rule* column). Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-L000006 | 111 | 48 | 349 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | Three women are sitting in a village |
| subtree-L000008 | 106 | 44 | 345 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e1,$x2)` | $e1 play · sit · stand | Three women are sitting in a village |
| subtree-L001834 | 105 | 43 | 341 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2) & Agent($e2,$x2)` | $e2 play · sit · stand | Three women are sitting in a village |
| subtree-L000010 | 94 | 43 | 166 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Patient($e1,$x2)` | $x1 man · woman · person; $x2 case · region · race | The parents of a Briton being held hostage by Colombian rebels spoke yesterday o |
| subtree-L000011 | 89 | 35 | 137 | 1 | `rule consequent:$r1 ▸ Patient($e1,$x1) & rule premise:$r1 ▸ PartOf($x1,$x2)` |  | DNA tests will be performed to confirm his identity. |

## The shape view

One row per group, by mining families. Every table but the last holds only candidates without a distribution rule.

### Joins between events: 2–3 atoms

Something in two events, or a loop among the arguments; no rule, no sealed clause; the match spans several template instances.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002981 | 15 | 14 | 34 | 2 | `Location($e1,$x1) & Location($e2,$x1) & Member($e1,$c1)` | $c1 sit · run · stand; $x1 grass · table · stop | Muhammad and fellow sniper suspect Lee Boyd Malvo, who goes on trial Nov. 10, we |
| subtree-S003247 | 11 | 4 | 12 | 2 | `Agent($e1,$x1) & Also($x1,$e1) & Member($e1,$c1)` | $c1 raise · hire · require; $x1 measure · spokesman · department | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S003612 | 9 | 3 | 10 | 2 | `Member($e1,$c1) & Theme($e1,$x1) & Theme($e2,$x1)` | $c1 president · father · chairman; $e2 mother · president · come; $x1 evidence · fire · support | Let me just say this: the evidence that we have of weapons of mass destruction w |
| subtree-S006403 | 4 | 1 | 5 | 2 | `Experiencer($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1)` | $c1 look · worried · say; $e2 look · worried · add | Three men are lying on a hill and looking at the mountains and sky |
| subtree-S008511 | 3 | 1 | 3 | 2 | `Also($x1,$e1) & Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · new · think | The WWF also thinks a further 13,000 animals are being caught every year around  |

### Joins between events: 4–5 atoms

The same, larger.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S008951 | 63 | 23 | 172 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 wear · stand · sit; $c2 man · woman · dog; $e2 wear · walk · hold | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022692 | 59 | 19 | 162 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c2) & Member($x1,$c3)` | $c1 wear · stand · sit; $c2 wear · walk · play; $c3 man · woman · dog | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022696 | 57 | 25 | 126 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · open; $c2 shirt · jacket · hat; $e2 wear · sit · walk; $x1 man · woman · girl | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S022756 | 51 | 19 | 129 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 wear · hold · play; $c2 man · woman · girl; $e2 wear · sit · walk; $x2 shirt · jacket · hat | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022874 | 42 | 20 | 80 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 wear · hold · use; $e2 wear · hold · play; $x1 woman · man · girl; $x2 jacket · shirt · suit; $x3 coat · glass · price | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S022879 | 41 | 17 | 104 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 man · woman · girl; $c2 shirt · jacket · hat; $e1 wear · hold · open; $e2 wear · sit · walk | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S009229 | 32 | 18 | 76 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1)` | $c1 sit · walk · run; $e2 wear · open · look; $x1 man · cat · dog; $x2 grass · sidewalk · sand | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S022982 | 31 | 16 | 75 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($e2,$c2)` | $c1 sit · walk · run; $c2 wear · open · look; $x1 man · cat · dog; $x2 grass · sidewalk · sand | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S009265 | 29 | 7 | 63 | 2 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2)` | $c1 person · woman · child; $c2 wear · play · stand; $e2 play · read · jump | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S009295 | 27 | 10 | 42 | 4 | `Agent($e1,$x1) & Experiencer($e2,$x1) & Member($e1,$c1) & Member($e2,$c2)` | $c1 stand · sit · countersue; $c2 look · say · argue; $x1 man · classroom · woman | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S023013 | 27 | 15 | 53 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 jacket · shirt · suit; $e1 wear · hold · lower; $e2 wear · hold · specify; $x1 woman · man · girl; $x3 coat · glass · guitar | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S023037 | 26 | 12 | 60 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Patient($e2,$x3)` | $c1 sit · walk · run; $e2 wear · open · hold; $x1 man · girl · woman; $x2 grass · sand · beach; $x3 drawer · hat · shirt | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S023041 | 26 | 4 | 60 | 15 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x2,$c1) & Member($x2,(Narrow $c1 (Member $c2))) & Patient($e1,$x2)` | $c1 shirt · jacket · suit; $c2 pink · blue · red; $e1 wear · hold · hold_up; $e2 wear · sit · hold; $x1 woman · girl · man | Goldman also raised its quarterly dividend to 25 cents from 12 cents, citing the |
| subtree-S023082 | 25 | 6 | 54 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x1,$c1) & Member($e1,$c2) & Member($e2,$c3)` | $c1 person · woman · child; $c2 wear · stand · sit; $c3 read · jump · dance | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S023083 | 25 | 12 | 63 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · walk · run; $c2 man · cat · dog; $e2 wear · open · look; $x2 grass · sidewalk · sand | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S009389 | 24 | 12 | 45 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c1)` | $c1 wear · play · pound; $x1 woman · man · girl | "Germany is on the right path," he added, specifying his government's announced  |
| subtree-S023113 | 24 | 7 | 40 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & GroupOf($x2,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 pant · bead · home; $e1 wear · destroy · specify; $e2 wear · pound · fill; $x1 woman · man · girl; $x3 shirt · jacket · southern | Revelations of the expenditures shocked some employees at Delta, an airline that |
| subtree-S023114 | 24 | 13 | 56 | 3 | `Agent($e1,$x1) & Agent($e2,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | $c1 sit · walk · run; $c2 grass · sidewalk · sand; $e2 wear · look · hold_up; $x1 man · dog · girl | A man is standing in the middle of a gym and is wearing a jersey |
| subtree-S023170 | 22 | 10 | 41 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($e1,$c1) & Member($e2,$c1) & Patient($e2,$x2)` | $c1 wear · play · pound; $x1 woman · man · girl; $x2 shirt · suit · jacket | "Germany is on the right path," he added, specifying his government's announced  |
| subtree-S023171 | 22 | 11 | 47 | 1 | `Agent($e1,$x1) & Agent($e2,$x1) & Member($x1,$c1) & Patient($e1,$x2) & Patient($e2,$x3)` | $c1 woman · man · girl; $e1 wear · hold · conduct; $e2 wear · hold · pound; $x2 jacket · shirt · suit; $x3 coat · glass · guitar | Revelations of the expenditures shocked some employees at Delta, an airline that |

### Across a sealed clause

Something inside a reported or negated clause tied to something outside it.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002359 | 52 | 24 | 60 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Member($x1,$c2)` | $c1 sit · run · walk; $c2 man · woman · boy | The cat isn't playing with a watermelon |
| subtree-S022878 | 41 | 15 | 57 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 target · impose · jaywalk; $c2 say · aim · consider; $c3 spokesman · president · prosecutor | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S022964 | 32 | 18 | 39 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Experiencer($e1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 impose · have · reach; $c2 say · believe · decide; $e2 organise; $x1 isp; $x2 judge · santa_clara-based · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-S002564 | 26 | 8 | 28 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & GroupOf($x1,$c2)` | $c1 play · wear · fight; $c2 man · child · boy | The men are not fist fighting in a ring |
| subtree-S009406 | 23 | 15 | 25 | 2 | `Not ▸ Agent($e1,$x1) & Not ▸ Member($e1,$c1) & Not ▸ Patient($e1,$x2) & Member($x1,$c2)` | $c1 wear · play · crack; $c2 woman · man · person; $x2 patient · dog · oil | The man is not chopping a tree trunk with an axe |
| subtree-S009418 | 23 | 15 | 37 | 6 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($x1,$c2) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 deal · representative · office; $e1 say · decline · aim | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023150 | 23 | 15 | 36 | 2 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Member($x1,$c3) & Theme($e1,§1)` | $c1 comment · make_sense · provide; $c2 say · decline · aim; $c3 deal · representative · office | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S023209 | 21 | 8 | 28 | 8 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Coref($x1,$x2) & Member($e1,$c2) & Theme($e1,§1)` | $c1 allow · impose · reach; $c2 say · tell · announce; $e2 organise; $x1 system; $x2 judge · storm · chairman | Police said they will conduct DNA tests to confirm the man's identity. |
| subtree-S023370 | 19 | 5 | 29 | 7 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($x2,$c2) & Theme($e1,§1)` | $c1 jaywalk · impose · talk; $c2 president · spokesman · judge; $e1 say · consider · argue; $x1 state · victim · damage | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S023623 | 17 | 2 | 22 | 7 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Mod $x2))) & Theme($e1,§1)` | $c1 help · pleased · target; $c2 president · spokesman · report; $e1 say · aim · state | Farmland Foods President George Richter said, "With Smithfield's support and lea |
| subtree-S009843 | 16 | 8 | 19 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Member($e1,$c2) & Theme($e1,§1) & Time($e1,$t1)` | $c1 impose · take_over · think; $c2 say · announce · try; $e2 make; $t1 day · year · week | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S023792 | 15 | 8 | 22 | 1 | `Theme:$e1 ▸ Agent($e2,$x1) & Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x2) & Member($e1,$c2) & Member($x1,$c3)` | $c1 make_sense · provide · start; $c2 say · announce · expect; $c3 deal · office · damage; $x2 president · spokesman · document | He said the situation undermines efforts to win international co-operation in th |

### With a rule of the sentence

Atoms on a side of a rule — a generic statement ("There is no …"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — together with atoms outside the rule.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S022670 | 103 | 51 | 267 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · brown; $c2 dog · girl · man; $e1 run · sit · jump | A fur scarf is being held by an Asian woman |
| subtree-S022689 | 60 | 35 | 117 | 27 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1))) & Patient($e1,$x1)` | $c1 blue · white · pink; $c2 shirt · jacket · dog; $e1 wear · use · raise | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S022725 | 52 | 26 | 104 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 blue · white · pink; $c2 shirt · jacket · hat; $e1 wear · raise · cut; $x2 man · woman · girl | Goldman decided to increase its quarterly dividend to 25 cents a share from 12 c |
| subtree-S022822 | 45 | 19 | 93 | 14 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 green · brown · sandy; $c2 room · field · grass; $e1 sit · play · stand | A dog is running on a snowy path |
| subtree-S022829 | 44 | 19 | 91 | 13 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Location($e1,$x1) & Member($e1,$c3) & Member($x1,$c2)` | $c1 green · brown · sandy; $c2 room · field · grass; $c3 sit · play · stand | A dog is running on a snowy path |
| subtree-S022840 | 43 | 23 | 64 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Member($x1,$c2) & Patient($e1,$x2)` | $c1 young · little · small; $c2 dog · man · woman; $e1 wear · hold · chase; $x2 ball · shirt · dog | A fur scarf is being held by an Asian woman |
| subtree-S022854 | 42 | 25 | 110 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x1) & Location($e1,$x2) & Member($x1,$c2)` | $c1 black · young · large; $c2 dog · girl · man; $e1 sit · jump · run; $x2 grass · air · field | A grey dog is bouncing a tennis ball on its head in a grass field |
| subtree-S022857 | 42 | 16 | 89 | 22 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Agent($e1,$x2) & Location($e1,$x1) & Member($x1,$c2)` | $c1 green · brown · sandy; $c2 room · field · grass; $e1 sit · play · stand; $x2 man · dog · boy | A dog is running on a snowy path |
| subtree-S022877 | 41 | 15 | 88 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x2) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x1)` | $c1 blue · white · pink; $c2 wear · cut · hold; $c3 man · woman · girl; $x1 shirt · jacket · hat | The new WPAN standard uses the 2.4-GHz unlicensed frequency band and specifies r |
| subtree-S022940 | 36 | 18 | 54 | 2 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & Agent($e1,$x1) & Member($e1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | $c1 young · little · small; $c2 wear · hold · chase; $c3 ball · shirt · dog; $x1 dog · man · girl | A fur scarf is being held by an Asian woman |
| subtree-S002472 | 33 | 7 | 34 | 2 | `rule consequent:$r1 ▸ Location($e1,$x1) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x1,$c2)` | $c1 run · stand · ride; $c2 grass · water · road | There is no dog chasing a ball in the grass |
| subtree-S009236 | 31 | 7 | 32 | 2 | `rule consequent:$r1 ▸ Agent($e1,$x1) [denied] & rule consequent:$r1 ▸ Location($e1,$x2) [denied] & rule consequent:$r1 ▸ Member($e1,$c1) [denied] & Member($x2,$c2)` | $c1 run · ride · stand; $c2 grass · water · road | There is no dog chasing a ball in the grass |

### The most widespread overall

Any structure, any label.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000001 | 458 | 218 | 1890 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | $c1 stand · play · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| subtree-S000002 | 372 | 192 | 960 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | $c1 wear · play · cut; $x1 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S002214 | 296 | 130 | 1336 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S008901 | 289 | 139 | 796 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | $c1 young · black · white; $c2 dog · girl · man | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S002219 | 278 | 141 | 766 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · trick · shirt | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S002220 | 252 | 141 | 603 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | $c1 wear · hold · cut; $c2 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S000012 | 219 | 101 | 356 | 1 | `Experiencer($e1,$x1) & Member($e1,$c1)` | $c1 say · look · full; $x1 woman · spokesman · president | "In return we expect North Korea to give up nuclear weapons." |
| subtree-S000013 | 215 | 98 | 652 | 1 | `Location($e1,$x1) & Member($e1,$c1)` | $c1 sit · stand · play; $x1 grass · field · water | Three women are sitting in a village |
| subtree-S000016 | 201 | 102 | 329 | 1 | `Member($e1,$c1) & Theme($e1,§1)` | $c1 say · tell · decline | "In return we expect North Korea to give up nuclear weapons." |
| subtree-S008902 | 196 | 111 | 493 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | $c1 wear · hold · cut; $c2 ball · trick · shirt; $x1 man · woman · person | A fur scarf is being held by an Asian woman |

### The shapes with the most lexicalizations

By the number of different class tuples that filled the shape.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002214 | 296 | 130 | 1336 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **570 lexicalizations** — $c1 stand · run · sit; $c2 man · woman · dog | Another soldier drowned after diving into an aqueduct in northern Iraq, the Cent |
| subtree-S000001 | 458 | 218 | 1890 | 1 | `Agent($e1,$x1) & Member($e1,$c1)` | **408 lexicalizations** — $c1 stand · play · sit; $x1 man · woman · dog | The value of the deal has increased since BP first announced it in February. |
| subtree-S008901 | 289 | 139 | 796 | 11 | `rule consequent:$r1 ▸ Member($x1,$c1) [graded] & rule premise:$r1 ▸ Member($x1,(Narrow $c2 (Member $c1))) [graded] & Member($x1,$c2) & Member($x1,(Narrow $c2 (Member $c1)))` | **402 lexicalizations** — $c1 young · black · white; $c2 dog · girl · man | In exchange, North Korea would be required to end its nuclear weapons program. |
| subtree-S002220 | 252 | 141 | 603 | 2 | `Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x1)` | **370 lexicalizations** — $c1 wear · hold · cut; $c2 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S002223 | 179 | 78 | 569 | 1 | `Location($e1,$x1) & Member($e1,$c1) & Member($x1,$c2)` | **309 lexicalizations** — $c1 sit · stand · play; $c2 grass · field · water | Three women are sitting in a village |
| subtree-S000002 | 372 | 192 | 960 | 1 | `Member($e1,$c1) & Patient($e1,$x1)` | **299 lexicalizations** — $c1 wear · play · cut; $x1 ball · man · trick | The value of the deal has increased since BP first announced it in February. |
| subtree-S008902 | 196 | 111 | 493 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x2,$c2) & Patient($e1,$x2)` | **295 lexicalizations** — $c1 wear · hold · cut; $c2 ball · trick · shirt; $x1 man · woman · person | A fur scarf is being held by an Asian woman |
| subtree-S008903 | 173 | 82 | 564 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Patient($e1,$x2)` | **276 lexicalizations** — $c1 wear · cut · play; $c2 man · woman · person; $x2 ball · trick · shirt | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S008904 | 152 | 66 | 516 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x2,$c2)` | **272 lexicalizations** — $c1 sit · stand · play; $c2 grass · field · water; $x1 man · dog · woman | Three women are sitting in a village |
| subtree-S022665 | 136 | 75 | 400 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3) & Patient($e1,$x2)` | **268 lexicalizations** — $c1 wear · hold · cut; $c2 man · woman · person; $c3 ball · trick · shirt | A fur scarf is being held by an Asian woman |
| subtree-S002219 | 278 | 141 | 766 | 2 | `Agent($e1,$x1) & Member($e1,$c1) & Patient($e1,$x2)` | **244 lexicalizations** — $c1 wear · play · cut; $x1 man · woman · person; $x2 ball · trick · shirt | Pat Anderson, the lawyer representing the Schindlers, declined to comment on the |
| subtree-S022666 | 111 | 50 | 371 | 2 | `Agent($e1,$x1) & Location($e1,$x2) & Member($e1,$c1) & Member($x1,$c2) & Member($x2,$c3)` | **244 lexicalizations** — $c1 sit · stand · run; $c2 man · dog · woman; $c3 grass · beach · water | A ball is being chased by a dog on the grass |

### Shapes whose matches all share a class

The generalizer keeps a class that every `mine` match has; the pattern shown is that generalization (the record's `generalization`), with the outcome of the held-out check.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S002446 | 40 | 31 | 48 | 3 | `Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c1)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S009193 | 39 | 31 | 47 | 2 | `Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 38 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S023378 | 19 | 16 | 22 | 4 | `Member($e1,$c1) & Member($t1,day) & Patient($e1,$x1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S023646 | 17 | 8 | 19 | 4 | `Experiencer($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — fails held-out: day not in every one of 9 matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| subtree-S024015 | 13 | 16 | 14 | 4 | `Agent($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 18 held-out matches | On Thursday, authorities evacuated residents who live in the canyon and closed o |
| subtree-S024151 | 12 | 4 | 15 | 4 | `Theme:$e1 ▸ Member($e2,$c1) & Agent($e1,$x1) & Member($e1,tell) & Recipient($e1,$x2) & Theme($e1,§1)` | keeps tell — holds in all 5 held-out matches | "I go to their website and start complaining to them, would you please, please,  |
| subtree-S024153 | 12 | 5 | 13 | 3 | `Theme:$e1 ▸ Member($e2,$c1) & Experiencer($e1,$x1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 5 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S024300 | 11 | 7 | 12 | 4 | `Member($e1,$c1) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 9 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |
| subtree-S024662 | 10 | 7 | 11 | 4 | `Location($e1,$x1) & Member($e1,$c1) & Member($t1,day) & Time($e1,$t1) & Weekday($t1,$c2)` | keeps day — holds in all 8 held-out matches | Also Tuesday, a soldier drowned in an aqueduct in northern Iraq. |
| subtree-S011360 | 8 | 2 | 11 | 4 | `Experiencer($e1,$x1) & Member($e1,full) & Member($x1,$c1) & Of($e1,$c2)` | keeps full — holds in all 7 held-out matches | A dog is running alongside a fence on a track full of dirt |
| subtree-S025457 | 8 | 3 | 9 | 4 | `Theme:$e1 ▸ Agent($e2,$x1) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 3 held-out matches | Coca-Cola announced Friday morning that the U.S. Attorney's office in Atlanta ha |
| subtree-S026463 | 7 | 2 | 8 | 3 | `Coref($x1,$x2) & Experiencer($e1,$x2) & Member($t1,day) & Theme($e1,§1) & Time($e1,$t1)` | keeps day — holds in all 2 held-out matches | "Our policies are well known and I'm not aware of any changes," Secretary of Sta |

### Candidates using a distribution rule

The candidates left out of the tables above (the *using a distribution rule* column). Unfiltered, these would lead every ranking.

| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |
|---|---|---|---|---|---|---|---|
| subtree-S000014 | 210 | 100 | 558 | 1 | `rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c1)` | $c1 person · man · child | Three women are sitting in a village |
| subtree-S000015 | 201 | 93 | 510 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2)` | $c1 play · sit · stand | Three women are sitting in a village |
| subtree-S002221 | 200 | 93 | 508 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule premise:$r1 ▸ PartOf($x1,$x2) & GroupOf($x2,$c2)` | $c1 play · sit · stand; $c2 person · man · child | Three women are sitting in a village |
| subtree-S000022 | 167 | 73 | 455 | 1 | `rule consequent:$r1 ▸ Agent($e1,$x1) & rule consequent:$r1 ▸ Member($e1,$c1)` | $c1 play · sit · stand; $x1 man · woman · person | Three women are sitting in a village |
| subtree-S000027 | 127 | 58 | 217 | 1 | `rule consequent:$r1 ▸ Member($e1,$c1) & rule consequent:$r1 ▸ Patient($e1,$x1)` | $c1 wear · play · eat; $x1 case · region · race | DNA tests will be performed to confirm his identity. |

