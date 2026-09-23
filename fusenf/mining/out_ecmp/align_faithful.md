# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm, read as a validation instrument

> "Given a set of sentence pairs known to be paraphrases (e.g. via asking an LLM to rate if they are paraphrases or not?), we align their SENF graphs (via tree-edit or soft matching) and record which subtrees and roles consistently map to each other. These alignments validate which structural elements can be unified without semantic loss." — FUSE-NF §4.3.4

**Reading.** The deliverable is a table over structural elements — subtrees and roles — with their behaviour under paraphrase: preserved, substituted by a specific other element, or one-sided; each substitution with its support in distinct paraphrase classes and its support among the control pairs. A substitution that recurs between sentences known to mean the same and never between sentences known to differ is a LICENSED unification: the evidence that two forms can be unified without semantic loss. The instrument emits evidence, never rules; a licensed unification becomes a rewrite only in `build_candidates`.

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| pairs | every equivalence class with ≥ 2 members in `out_ecmp/canonical_iteme.jsonl` from ../corpora/tierA.jsonl: paraphrase pairs = same-polarity members (233), control pairs = same × different polarity (468); control support of a key = classes where it occurs in a control pair but in none of the class's paraphrase pairs — a measurement column, never a filter |
| alignment | the edit script: over every injective skolem renaming within each stream (e / x / f) maximise identical atoms (term + polarity), then near atoms (same arity, same skolems in the same positions, one head or constant differs = a relabel), then the first renaming; greedy assignment above 5040 renamings; eligible atoms = the miner's (28 cap, Implication and surface atoms excluded); everything else is one-sided |
| regions | the atoms outside the common part, grouped per side by shared node symbols the common part does not hold (skolems, or constants standing as a term's first argument); symbols the common part holds are anchors and never merge |
| substitutions | regions linked across the pair by relabels, plus every same-side region hanging on the same anchors as a relabelled region (a co-dependent edit is one substitution); recorded as each FACTOR (one relabel, the two atoms alone) and, when a substitution holds more than one factor or a leftover, as the JOINT key (all atoms of both sides + anchors); a factor's record counts the classes where it is attested ALONE and the joint contexts it occurs in; a factor never attested alone is gated JOINT-ONLY; a joint whose factors are never attested alone is `co_dependent` |
| one-sided | regions with no relabel link (drops): diagnostic by default, keyed by their atoms + anchors, with per-occurrence flags `reattach` (the other side has a one-sided region on the same anchors sharing a head) and `head_on_other_side` |
| roles | binary heads on an aligned event centre (class links excluded), matched by aligned centre + filler; lost when the other side has no atom there |
| elements | every atom pattern (skolems abstracted, constants verbatim, strings/numbers masked) on either side of a paraphrase pair: preserved / substituted(by) / one-sided per class; `stability` = preserved classes / observed classes |
| consistency | support = distinct equivalence classes; PASS at ≥ 3; LICENSED = PASS with zero control support (a factor: attested alone at least once, else JOINT-ONLY) |
| rules | none — evidence only: `(Unifiable A B)` / `(OneSided X)` in the .metta rendering, consumed by `build_candidates` |

## Pair inventory and alignment quality

- 233 paraphrase pairs, 468 control pairs, 402 records; 0 pairs aligned greedily; 106 pairs with a tie between renamings (the first taken); 0 pairs touching a truncated record
- paraphrase pairs with identical canonical graphs: 49 (21%); alignment quality (identical atoms / larger side) median 0.8, quartiles 0.5714 / 0.8571; pairs below 0.5: 24
- paraphrase pairs: 173 substitutions holding 235 factors; 65 atoms left over inside substitutions; 78 one-sided atoms in 32 regions; 215 pairs with no one-sided region

## Element behaviour under paraphrase: 275 atom patterns observed; 207 always preserved, 65 substituted at least once, 32 one-sided at least once

| observed | preserved | substituted | one-sided | stability | element | substituted by (classes) |
|---|---|---|---|---|---|---|
| 57 | 51 | 22 | 10 | 0.895 | `(Agent $e0 $x0)` | `(Recipient $e0 $x0)` 12, `(Source $e0 $x0)` 9, `(Holder $e0 $x0)` 1 |
| 15 | 8 | 14 | 1 | 0.533 | `(Recipient $e0 $x0)` | `(Agent $e0 $x0)` 12, `(Theme $e0 $x0)` 2 |
| 9 | 0 | 4 | 9 | 0.0 | `(Theme $e0 $e1)` | `(Patient $e0 $e1)` 4 |
| 4 | 0 | 12 | 0 | 0.0 | `(Member $e0 acquire)` | `(Member $e0 buy)` 4, `(Member $e0 purchase)` 4, `(Member $e0 sell)` 4 |
| 4 | 4 | 12 | 0 | 1.0 | `(Member $e0 buy)` | `(Member $e0 acquire)` 4, `(Member $e0 purchase)` 4, `(Member $e0 sell)` 4 |
| 4 | 0 | 12 | 0 | 0.0 | `(Member $e0 purchase)` | `(Member $e0 acquire)` 4, `(Member $e0 buy)` 4, `(Member $e0 sell)` 4 |
| 4 | 0 | 12 | 0 | 0.0 | `(Member $e0 sell)` | `(Member $e0 acquire)` 4, `(Member $e0 buy)` 4, `(Member $e0 purchase)` 4 |
| 37 | 37 | 3 | 6 | 1.0 | `(Theme $e0 $x0)` | `(Recipient $e0 $x0)` 2, `(Patient $e0 $x0)` 1 |
| 9 | 0 | 9 | 0 | 0.0 | `(Source $e0 $x0)` | `(Agent $e0 $x0)` 9 |
| 5 | 0 | 4 | 5 | 0.0 | `(Patient $e0 $e1)` | `(Theme $e0 $e1)` 4 |
| 4 | 0 | 8 | 0 | 0.0 | `(Member $e0 begin)` | `(Member $e0 commence)` 4, `(Member $e0 start)` 4 |
| 4 | 0 | 8 | 0 | 0.0 | `(Member $e0 commence)` | `(Member $e0 begin)` 4, `(Member $e0 start)` 4 |
| 4 | 2 | 8 | 0 | 0.5 | `(Member $e0 decide)` | `(Member $e0 make)` 4, `(Member $e0 reach)` 4 |
| 4 | 0 | 8 | 0 | 0.0 | `(Member $e0 make)` | `(Member $e0 decide)` 4, `(Member $e0 reach)` 4 |
| 4 | 0 | 8 | 0 | 0.0 | `(Member $e0 reach)` | `(Member $e0 decide)` 4, `(Member $e0 make)` 4 |
| 4 | 0 | 8 | 0 | 0.0 | `(Member $e0 start)` | `(Member $e0 begin)` 4, `(Member $e0 commence)` 4 |
| 6 | 3 | 6 | 0 | 0.5 | `(Member $e0 give)` | `(Member $e0 answer)` 3, `(Member $e0 receive)` 3 |
| 6 | 0 | 6 | 0 | 0.0 | `(Member $x0 big)` | `(Member $x0 huge)` 3, `(Member $x0 large)` 3 |
| 3 | 2 | 4 | 1 | 0.667 | `(Member $e0 repair)` | `(Member $e0 fix)` 2, `(Member $e0 mend)` 2 |
| 4 | 4 | 0 | 4 | 1.0 | `(Member $e0 decision)` |  |
| 4 | 4 | 0 | 4 | 1.0 | `(Member $e0 work)` |  |
| 3 | 0 | 4 | 0 | 0.0 | `(Member $e0 borrow)` | `(Member $e0 lend)` 3, `(Recipient $e0 ravi)` 1 |
| 3 | 3 | 4 | 0 | 1.0 | `(Member $e0 lend)` | `(Member $e0 borrow)` 3, `(Agent $e0 ravi)` 1 |
| 2 | 0 | 4 | 0 | 0.0 | `(Member $e0 fix)` | `(Member $e0 mend)` 2, `(Member $e0 repair)` 2 |
| 2 | 0 | 4 | 0 | 0.0 | `(Member $e0 mend)` | `(Member $e0 fix)` 2, `(Member $e0 repair)` 2 |
| 9 | 9 | 0 | 3 | 1.0 | `(Location $e0 $x0)` |  |
| 3 | 0 | 0 | 3 | 0.0 | `(Degree $x0 big very)` |  |
| 3 | 3 | 3 | 0 | 1.0 | `(Member $e0 abandon)` | `(Member $e0 give_up)` 3 |
| 3 | 3 | 3 | 0 | 1.0 | `(Member $e0 answer)` | `(Member $e0 give)` 3 |
| 3 | 0 | 3 | 0 | 0.0 | `(Member $e0 call_off)` | `(Member $e0 cancel)` 3 |

## Substitutions — factors: 138 recorded, 30 pass, 16 licensed (pass, zero control support, attested alone), 13 joint-only (pass, zero control support, never attested alone), 1 contested (pass with control support)

| gate | support | control | alone | joint ctx | occurrences A / B | A | B | example pair | A sentence | B sentence |
|---|---|---|---|---|---|---|---|---|---|---|
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 buy)` | `(Member $e0 acquire)` | tierA-000001 tierA-000003 | The depot bought two forklifts. | The depot acquired two forklifts. |
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 commence)` | `(Member $e0 begin)` | tierA-000052 tierA-000054 | A shoreline survey begins at dawn. | A shoreline survey commences at dawn. |
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 purchase)` | `(Member $e0 acquire)` | tierA-000002 tierA-000003 | The depot purchased two forklifts. | The depot acquired two forklifts. |
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 purchase)` | `(Member $e0 buy)` | tierA-000001 tierA-000002 | The depot bought two forklifts. | The depot purchased two forklifts. |
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 start)` | `(Member $e0 begin)` | tierA-000052 tierA-000053 | A shoreline survey begins at dawn. | A shoreline survey starts at dawn. |
| LICENSED | 4 | 0 | 4 | 0 | 4 / 4 | `(Member $e0 start)` | `(Member $e0 commence)` | tierA-000053 tierA-000054 | A shoreline survey starts at dawn. | A shoreline survey commences at dawn. |
| LICENSED | 3 | 0 | 3 | 1 | 3 / 3 | `(Member $e0 cancel)` | `(Member $e0 call_off)` | tierA-000143 tierA-000144 | An airline cancels the evening flight. | An airline calls off the evening flight. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $e0 find_out)` | `(Member $e0 discover)` | tierA-000128 tierA-000129 | An auditor discovers an error in the ledger. | An auditor finds out an error in the ledger. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $e0 give_up)` | `(Member $e0 abandon)` | tierA-000099 tierA-000100 | A rescue team abandons the search. | A rescue team gives up the search. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $e0 put_off)` | `(Member $e0 postpone)` | tierA-000114 tierA-000115 | A board postpones the vote. | A board puts off the vote. |
| LICENSED | 3 | 0 | 3 | 1 | 3 / 3 | `(Member $e0 require)` | `(Member $e0 need)` | tierA-000084 tierA-000085 | A recipe requires two eggs. | A recipe needs two eggs. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $e0 turn_down)` | `(Member $e0 reject)` | tierA-000158 tierA-000159 | An editor rejects a manuscript. | An editor turns down a manuscript. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $x0 car)` | `(Member $x0 automobile)` | tierA-000390 tierA-000391 | An automobile blocks the lane. | A car blocks the lane. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $x0 hard)` | `(Member $x0 difficult)` | tierA-000351 tierA-000352 | The repair is difficult. | The repair is hard. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 6 | `(Member $x0 large)` | `(Member $x0 big)` | tierA-000327 tierA-000328 | A crate is large in size. | A crate is big in size. |
| LICENSED | 3 | 0 | 3 | 0 | 3 / 3 | `(Member $x0 physician)` | `(Member $x0 doctor)` | tierA-000375 tierA-000376 | A physician signs the chart. | A doctor signs the chart. |
| JOINT-ONLY | 9 | 0 | 0 | 4 | 57 / 9 | `(Agent $e0 $x0)` | `(Source $e0 $x0)` | tierA-000261 tierA-000262 | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| JOINT-ONLY | 4 | 0 | 0 | 2 | 4 / 4 | `(Member $e0 make)` | `(Member $e0 decide)` | tierA-000185 tierA-000186 | A committee decides on a new roof. | A committee makes a decision on a new roof. |
| JOINT-ONLY | 4 | 0 | 0 | 2 | 4 / 4 | `(Member $e0 reach)` | `(Member $e0 decide)` | tierA-000185 tierA-000187 | A committee decides on a new roof. | A committee reaches a decision on a new roof. |
| JOINT-ONLY | 4 | 0 | 0 | 1 | 4 / 4 | `(Member $e0 reach)` | `(Member $e0 make)` | tierA-000186 tierA-000187 | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| JOINT-ONLY | 4 | 0 | 0 | 1 | 4 / 4 | `(Member $e0 sell)` | `(Member $e0 acquire)` | tierA-000003 tierA-000004 | The depot acquired two forklifts. | Two forklifts were sold to the depot. |
| JOINT-ONLY | 4 | 0 | 0 | 1 | 4 / 4 | `(Member $e0 sell)` | `(Member $e0 buy)` | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |
| JOINT-ONLY | 4 | 0 | 0 | 1 | 4 / 4 | `(Member $e0 sell)` | `(Member $e0 purchase)` | tierA-000002 tierA-000004 | The depot purchased two forklifts. | Two forklifts were sold to the depot. |
| JOINT-ONLY | 4 | 0 | 0 | 1 | 9 / 5 | `(Theme $e0 $e1)` | `(Patient $e0 $e1)` | tierA-000186 tierA-000187 | A committee makes a decision on a new roof. | A committee reaches a decision on a new roof. |
| JOINT-ONLY | 3 | 0 | 0 | 2 | 6 / 3 | `(Member $e0 give)` | `(Member $e0 answer)` | tierA-000207 tierA-000208 | A clerk answers the query. | A clerk gives an answer to the query. |
| JOINT-ONLY | 3 | 0 | 0 | 2 | 3 / 3 | `(Member $e0 lend)` | `(Member $e0 borrow)` | tierA-000296 tierA-000297 | A neighbour lends Ravi a ladder. | Ravi borrows a ladder from a neighbour. |
| JOINT-ONLY | 3 | 0 | 0 | 1 | 3 / 6 | `(Member $e0 receive)` | `(Member $e0 give)` | tierA-000261 tierA-000262 | A trainer gives a recruit a whistle. | A recruit receives a whistle from a trainer. |
| JOINT-ONLY | 3 | 0 | 0 | 1 | 3 / 3 | `(Member $e0 teach)` | `(Member $e0 learn)` | tierA-000281 tierA-000282 | A potter teaches an apprentice glazing. | An apprentice learns glazing from a potter. |
| JOINT-ONLY | 3 | 0 | 0 | 1 | 3 / 6 | `(Member $x0 huge)` | `(Member $x0 big)` | tierA-000339 tierA-000340 | The boiler is huge in size. | The boiler is very big in size. |
| CONTESTED | 12 | 1 | 0 | 6 | 57 / 15 | `(Agent $e0 $x0)` | `(Recipient $e0 $x0)` | tierA-000001 tierA-000004 | The depot bought two forklifts. | Two forklifts were sold to the depot. |

## Substitutions — joint keys: 91 recorded, 9 pass, 9 licensed, 59 co-dependent (no factor ever attested alone)

| gate | support | control | factors | co-dep | anchors | A | B | example pair |
|---|---|---|---|---|---|---|---|---|
| LICENSED | 4 | 0 | 2 | yes | $e0 $x0 | `(And (Agent $e0 $x0) (Member $e0 acquire))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | tierA-000003 tierA-000004 |
| LICENSED | 4 | 0 | 2 | yes | $e0 $x0 | `(And (Agent $e0 $x0) (Member $e0 buy))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | tierA-000001 tierA-000004 |
| LICENSED | 4 | 0 | 2 | yes | $e0 $x0 | `(And (Agent $e0 $x0) (Member $e0 purchase))` | `(And (Member $e0 sell) (Recipient $e0 $x0))` | tierA-000002 tierA-000004 |
| LICENSED | 4 | 0 | 2 | yes | $e0 $e1 | `(And (Member $e0 reach) (Theme $e0 $e1))` | `(And (Member $e0 make) (Patient $e0 $e1))` | tierA-000186 tierA-000187 |
| LICENSED | 3 | 0 | 3 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0))` | tierA-000261 tierA-000262 |
| LICENSED | 3 | 0 | 3 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0))` | tierA-000281 tierA-000282 |
| LICENSED | 3 | 0 | 1 | yes | $e0 $x0 | `(And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | tierA-000185 tierA-000186 |
| LICENSED | 3 | 0 | 1 | yes | $e0 $x0 | `(And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0))` | `(And (Member $e0 decide) (Theme $e0 $x0))` | tierA-000185 tierA-000187 |
| LICENSED | 3 | 0 | 1 | yes | $x0 | `(Member $x0 huge)` | `(And (Degree $x0 big very) (Member $x0 big))` | tierA-000339 tierA-000340 |
| FAIL | 2 | 0 | 3 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0))` | tierA-000301 tierA-000302 |
| FAIL | 2 | 0 | 2 | yes | $e0 $x0 | `(And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1))` | `(And (Member $e0 answer) (Theme $e0 $x0))` | tierA-000207 tierA-000208 |
| FAIL | 2 | 0 | 1 | yes | $x0 | `(Member $x0 exhausted)` | `(And (Degree $x0 tired very) (Member $x0 tired))` | tierA-000363 tierA-000364 |
| FAIL | 1 | 0 | 3 | yes | $e0 $x0 | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi))` | `(And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0))` | tierA-000296 tierA-000297 |
| FAIL | 1 | 0 | 2 |  | $e0 $x0 | `(And (Agent $e0 $x0) (Member $e0 require))` | `(And (Holder $e0 $x0) (Member $e0 need))` | tierA-000084 tierA-000085 |
| FAIL | 1 | 0 | 2 |  | $e0 $x0 | `(And (Member $e0 cancel) (Patient $e0 $x0))` | `(And (Member $e0 call_off) (Theme $e0 $x0))` | tierA-000144 tierA-000145 |
| FAIL | 1 | 0 | 1 | yes | $e0 | `(And (Member $e0 give) (Member $x0 caller) (Recipient $e0 $x0))` | `(Member $e0 answer)` | tierA-000217 tierA-000218 |
| FAIL | 1 | 0 | 1 | yes | $e0 $x0 | `(And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move))))` | `(And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move))))` | tierA-000196 tierA-000197 |
| FAIL | 1 | 0 | 1 | yes | $e0 $x0 | `(And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move))))` | `(And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move))))` | tierA-000196 tierA-000198 |
| FAIL | 0 | 1 | 1 |  | $e0 $x0 | `(Agent $e0 $x0)` | `(And (Holder $e0 $x0) (Might $e0))` |  |
| FAIL | 0 | 1 | 2 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | `(And (Agent $e0 $x1) (Goal $e0 $x0))` |  |
| FAIL | 0 | 1 | 1 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Goal $e0 $x1))` | `(And (Agent $e1 $x1) (Goal $e0 $x0) (Member $e1 take) (Patient $e1 $e0))` |  |
| FAIL | 0 | 1 | 1 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Location $e0 $x1))` | `(And (Agent $e1 $x1) (Location $e0 $x0) (Member $e1 take) (Theme $e1 $e0))` |  |
| FAIL | 0 | 1 | 1 |  | $x1 | `(And (Agent $e0 $x0) (Member $e0 block) (Member $x0 car) (Theme $e0 $x1))` | `(And (And (Agent $x2 $x0) (Member $x2 block) (Theme $x2 $x1)) ~NEG (Member $x0 automobile))` |  |
| FAIL | 0 | 1 | 4 |  | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 acquire) (Ordinal $x0 <num> acquire) (Theme $e0 $x0))` |  |
| FAIL | 0 | 1 | 4 |  | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1))` | `(And (Member $e0 sell) (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0))` |  |
| FAIL | 0 | 2 | 3 |  | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | `(And (Agent $e0 $x1) (Member $e0 acquire) (Theme $e0 $x0))` |  |
| FAIL | 0 | 2 | 3 | yes | $e0 $x0 $x1 | `(And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1))` | `(And (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0))` |  |
| FAIL | 0 | 1 | 1 |  | $x1 | `(And (Agent $e0 $x0) (Member $e0 cross) (Member $x0 car) (Theme $e0 $x1))` | `(And (And (Agent $x2 $x0) (Member $x2 cross) (Theme $x2 $x1)) ~NEG (Member $x0 automobile))` |  |
| FAIL | 0 | 1 | 1 |  | $x1 | `(And (Agent $e0 $x0) (Member $e0 examine) (Member $x0 doctor) (Theme $e0 $x1))` | `(And (And (Agent $x2 $x0) (Member $x2 examine) (Theme $x2 $x1)) ~NEG (Member $x0 physician))` |  |
| FAIL | 0 | 1 | 4 |  | $x1 | `(And (Agent $e0 $x0) (Member $e0 leave) (Member $x0 automobile) (Theme $e0 $x1))` | `(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x0 car))` |  |

## Roles: 13 non-identity mappings recorded (3 pass, 2 licensed), 6 role-lost records

| support | control | majority head (occ) | minority head (occ) | example pair |
|---|---|---|---|---|
| 13 | 0 | Agent (247) | Recipient (36) | tierA-000001 tierA-000004 |
| 9 | 0 | Agent (247) | Source (9) | tierA-000261 tierA-000262 |
| 5 | 3 | Theme (200) | Patient (65) | tierA-000143 tierA-000145 |
| 2 | 3 | Theme (200) | Recipient (36) | tierA-000207 tierA-000208 |
| 1 | 0 | Agent (247) | Holder (11) | tierA-000084 tierA-000085 |
| 0 | 1 | Agent (247) | Experiencer (8) |  |
| 0 | 1 | Agent (247) | Goal (4) |  |
| 0 | 1 | Agent (247) | Location (36) |  |
| 0 | 5 | Agent (247) | Patient (65) |  |
| 0 | 5 | Agent (247) | Theme (200) |  |
| 0 | 1 | Holder (11) | Experiencer (8) |  |
| 0 | 5 | Recipient (36) | Source (9) |  |
| 0 | 2 | Theme (200) | Location (36) |  |

| support | control | role lost (no atom on the aligned centre + filler) |
|---|---|---|
| 6 | 2 | Agent |
| 4 | 0 | CoAgent |
| 4 | 2 | Theme |
| 0 | 1 | Goal |
| 0 | 2 | Location |
| 0 | 2 | Patient |

## One-sided regions (drops, diagnostic): 155 recorded, 2 pass; 18 of 373 occurrences flagged as re-attachments

| support | control | occurrences | reattach | head on other side | atoms | anchors | example pair |
|---|---|---|---|---|---|---|---|
| 6 | 0 | 9 | 9 | 9 | `(Agent $e0 $x0)` | $e0 $x0 | tierA-000173 tierA-000174 |
| 3 | 0 | 6 | 6 | 0 | `(And (Agent $e0 $x0) (Member $e0 cause) (Theme $e0 $e1))` | $e1 $x0 | tierA-000222 tierA-000223 |
| 2 | 0 | 3 | 0 | 0 | `(CoAgent $e0 $x0)` | $e0 $x0 | tierA-000315 tierA-000316 |
| 2 | 0 | 2 | 2 | 0 | `(And (Agent $e0 $x0) (Member $e0 take) (Theme $e0 $e1))` | $e1 $x0 | tierA-000173 tierA-000174 |
| 2 | 0 | 5 | 0 | 5 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 work))` | $x0 $x1 | tierA-000315 tierA-000316 |
| 1 | 0 | 1 | 0 | 0 | `(CoAgent $e0 bo)` | $e0 | tierA-000311 tierA-000312 |
| 1 | 0 | 2 | 0 | 0 | `(CoAgent $e0 nils)` | $e0 | tierA-000323 tierA-000324 |
| 1 | 0 | 1 | 1 | 0 | `(And (Agent $e0 $x0) (Member $e0 take) (Patient $e0 $e1))` | $e1 $x0 | tierA-000181 tierA-000182 |
| 1 | 0 | 2 | 0 | 1 | `(And (Agent $e0 bo) (Member $e0 work) (Theme $e0 $x0))` | $x0 | tierA-000311 tierA-000312 |
| 1 | 0 | 3 | 0 | 2 | `(And (Agent $e0 nils) (Location $e0 $x0) (Member $e0 work))` | $x0 | tierA-000323 tierA-000324 |
| 1 | 0 | 3 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 repair) (Member $x0 crew) (Member $x1 cracked) (Member $x1 feed_pipe) (Patient $e0 $x1))` | feed_pipe | tierA-000046 tierA-000049 |
| 1 | 0 | 1 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 permit) (Member $x0 warden) (Theme $e0 visitor) (Time $e0 (Weekday sunday)))` | — | tierA-000072 tierA-000073 |
| 1 | 0 | 3 | 0 | 0 | `(And (Degree diver tired very) (Inheritance diver tired))` | — | tierA-000371 tierA-000372 |
| 1 | 0 | 3 | 0 | 1 | `(Inheritance diver exhausted)` | — | tierA-000371 tierA-000372 |
| 0 | 1 | 2 | 0 | 0 | `(And (Experiencer $e1 $x0) (Member $e1 discover) (Stimulus $e1 $e0))` | $e0 $x0 |  |
| 0 | 1 | 1 | 0 | 0 | `(And (Experiencer $e1 $x0) (Member $e1 find_out) (Stimulus $e1 $e0))` | $e0 $x0 |  |
| 0 | 1 | 3 | 0 | 0 | `(And (Experiencer $x1 $x0) (Member $x1 discover) (Stimulus $x1 $e0)) ~NEG` | $e0 $x0 |  |
| 0 | 21 | 36 | 0 | 0 | `(Might $e0)` | $e0 |  |
| 0 | 2 | 2 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 borrow) (Source $e0 $x1) (Theme $e0 $x2))` | $x0 $x1 $x2 |  |
| 0 | 2 | 4 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1) (Theme $e0 $x2))` | $x0 $x1 $x2 |  |
| 0 | 2 | 6 | 0 | 0 | `(And (Agent $x3 $x0) (Member $x3 lend) (Recipient $x3 $x1) (Theme $x3 $x2)) ~NEG` | $x0 $x1 $x2 |  |
| 0 | 1 | 1 | 0 | 0 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 acquire) (Member $x2 projector) (Past $e0) (Theme $e0 $x2))` | $x0 $x1 |  |
| 0 | 1 | 2 | 0 | 0 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 buy) (Member $x2 projector) (Past $e0) (Theme $e0 $x2))` | $x0 $x1 |  |
| 0 | 1 | 1 | 0 | 0 | `(And (Agent $e0 $x0) (Beneficiary $e0 $x1) (Member $e0 purchase) (Member $x2 projector) (Past $e0) (Theme $e0 $x2))` | $x0 $x1 |  |
| 0 | 1 | 1 | 0 | 0 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 allow) (Theme $e0 photography))` | $x0 $x1 |  |
| 0 | 1 | 1 | 0 | 0 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 permit) (Theme $e0 photography))` | $x0 $x1 |  |
| 0 | 2 | 2 | 0 | 0 | `(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 walk))` | $x0 $x1 |  |
| 0 | 2 | 2 | 0 | 0 | `(And (Agent $e0 $x0) (Location $e1 $x1) (Member $e0 take) (Member $e1 walk) (Theme $e0 $e1))` | $x0 $x1 |  |
| 0 | 2 | 4 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 abandon) (Theme $e0 $x1))` | $x0 $x1 |  |
| 0 | 2 | 4 | 0 | 0 | `(And (Agent $e0 $x0) (Member $e0 answer) (Theme $e0 $x1))` | $x0 $x1 |  |

## Tier A scorecard (key = the corpora's target_rule labels)

- lexical / converse targets recovered by a substitution record mentioning both lemmas: **28/31** (by gate: LICENSED 17, JOINT-ONLY 5, CONTESTED 0, FAIL 6; FAIL = below the floor)

| target | classes | recovered by |
|---|---|---|
| CoAgent~GroupOf | 4 | **MISS** |
| abandon<-give_up | 3 | `(Member $e0 give_up)` ~ `(Member $e0 abandon)` (factor, support 3, control 0) |
| allow<-permit | 3 | `(Member $e0 permit)` ~ `(Member $e0 allow)` (factor, support 2, control 1) |
| answer<-give_an_answer | 3 | `(Member $e0 give)` ~ `(Member $e0 answer)` (factor, support 3, control 0, provenance) |
| arrive<-arrival | 3 | `(Member $e0 arrive)` ~ `(Member $e0 arrival)` (factor, support 2, control 0) |
| automobile<-car | 3 | `(Member $x0 car)` ~ `(Member $x0 automobile)` (factor, support 3, control 0) |
| begin<-commence | 4 | `(Member $e0 commence)` ~ `(Member $e0 begin)` (factor, support 4, control 0) |
| begin<-start | 4 | `(Member $e0 start)` ~ `(Member $e0 begin)` (factor, support 4, control 0) |
| buy<-acquire | 4 | `(Member $e0 buy)` ~ `(Member $e0 acquire)` (factor, support 4, control 0) |
| buy<-purchase | 4 | `(Member $e0 purchase)` ~ `(Member $e0 buy)` (factor, support 4, control 0) |
| buy~sell | 4 | `(Member $e0 sell)` ~ `(Member $e0 buy)` (factor, support 4, control 0) |
| cancel<-call_off | 3 | `(Member $e0 cancel)` ~ `(Member $e0 call_off)` (factor, support 3, control 0) |
| decide<-decision | 4 | `(And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0))` ~ `(And (Member $e0 decide) (Theme $e0 $x0))` (joint, support 3, control 0) |
| decide<-make_a_decision | 4 | `(And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0))` ~ `(And (Member $e0 decide) (Theme $e0 $x0))` (joint, support 3, control 0) |
| destroy<-destruction | 3 | **MISS** |
| die<-kick_the_bucket | 3 | `(Member $e0 kick_the_bucket)` ~ `(Member $e0 die)` (factor, support 2, control 0) |
| difficult<-hard | 3 | `(Member $x0 hard)` ~ `(Member $x0 difficult)` (factor, support 3, control 0) |
| discover<-find_out | 3 | `(Member $e0 find_out)` ~ `(Member $e0 discover)` (factor, support 3, control 0) |
| exhausted<-very_tired | 3 | `(Member $x0 exhausted)` ~ `(And (Degree $x0 tired very) (Member $x0 tired))` (joint, support 2, control 0) |
| give~receive | 4 | `(Member $e0 receive)` ~ `(Member $e0 give)` (factor, support 3, control 0) |
| huge<-very_big | 3 | `(Member $x0 huge)` ~ `(And (Degree $x0 big very) (Member $x0 big))` (joint, support 3, control 0) |
| large<-big | 3 | `(Member $x0 large)` ~ `(Member $x0 big)` (factor, support 3, control 0) |
| lend~borrow | 3 | `(Member $e0 lend)` ~ `(Member $e0 borrow)` (factor, support 3, control 0) |
| physician<-doctor | 3 | `(Member $x0 physician)` ~ `(Member $x0 doctor)` (factor, support 3, control 0) |
| postpone<-put_off | 3 | `(Member $e0 put_off)` ~ `(Member $e0 postpone)` (factor, support 3, control 0) |
| reject<-turn_down | 3 | `(Member $e0 turn_down)` ~ `(Member $e0 reject)` (factor, support 3, control 0) |
| repair<-fix | 4 | `(Member $e0 repair)` ~ `(Member $e0 fix)` (factor, support 2, control 0) |
| repair<-mend | 4 | `(Member $e0 repair)` ~ `(Member $e0 mend)` (factor, support 2, control 0) |
| require<-need | 3 | `(Member $e0 require)` ~ `(Member $e0 need)` (factor, support 3, control 0) |
| teach~learn | 3 | `(Member $e0 teach)` ~ `(Member $e0 learn)` (factor, support 3, control 0) |
| walk<-take_a_walk | 3 | **MISS** |

| alt target (expects identical parses) | pairs | identical |
|---|---|---|
| alt:dative | 10 | 10 |
| alt:voice | 36 | 33 |
