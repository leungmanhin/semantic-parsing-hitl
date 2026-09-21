# §4.3.4 faithful arm — reading (analyst notes, 2026-09-19)

Companion to the generated `align_faithful.md` (H substrate: the 172 Tier C PAWS pairs) and `../out_ecmp/align_faithful.md`
(item-E: the 84 Tier A classes plus the 180 Tier C pairs there, with the Tier A target-rule key and the control pairs), the
record `align_faithful.jsonl` (every mapping — unit / role / residue — with its support in distinct classes, its control
support, examples and verdict, plus one `profile` record per unit), the per-pair intermediate `align_faithful_pairs.jsonl`
(per pair: the two sentences, the skolem renaming, the common subgraph, the differing subgraphs aligned across the pair,
the residue; quality, ambiguity — readable twin `align_faithful_pairs.md`, one block per pair) and the MeTTa rendering `align_faithful.metta`
(unit mappings first, then role mappings, then residue; PASS first inside each; every unit mapping rendered as two
implications into one provisional meta-node, a role mapping as the minority head rewriting to the majority, a residue with
a matched context as the context rewriting to itself without the atom). The generated files are the record; this file is
the reading. Nothing here is an addition to the method; batch 1's anti-unification, diff factoring, promotability and
control-based pruning stay in the additions arm.

**What the paper pins down and what we chose.** Pairs known to be paraphrases, an alignment of their graphs by tree-edit
or soft matching, and the record of which subtrees and roles consistently map to each other are the paper's. Ours,
disclosed in every header: the pair source (the labelled pairs the corpora already hold — Tier C's PAWS a/b pairs, Tier A's
same-polarity variants; Tier A's different-polarity variants as control pairs, a measurement column), the alignment (exact
maximum-common-subgraph over every within-stream skolem renaming, identical atoms first, then one-substitution near matches,
the first renaming on a tie; a greedy assignment above 5,040 renamings, never needed), the subtree vocabulary (the §4.3.1
faithful units instantiated on each side), the role vocabulary (binary heads on an aligned event centre, class links
excluded), the residue definition (an atom matched on neither side, keyed by its canonical form and the smallest unit
instance around it whose other atoms matched), and the consistency floor (support counted in distinct equivalence classes,
never pairs — a Tier A class yields several — at the inherited minimum of 3). Control support of a mapping counts the
classes where it occurs in a control pair but in none of the class's paraphrase pairs, because every control is paired with
every same-polarity member and a class's own lexical swap therefore reappears in its control pairs. Byte-identical re-runs.

## What the method delivers on the H substrate (172 PAWS pairs)

**The parser has already done most of the paraphrase's work.** 26 pairs (15 %) have identical canonical graphs (voice
and order are normalised at parse time; the batch-1 alt:voice / alt:dative targets predicted this), and the rest differ
by translator variance rather than by paraphrase structure: alignment quality (identical atoms over the larger side) has
median 0.71 with quartiles 0.55 / 0.88, and 35 pairs sit below 0.5. Eleven pairs tie between renamings (the first taken);
no pair needed the greedy fallback.

**Unit mappings.** 124 non-identity mappings recorded, 118 of them in a single class; 117 are shape-parallel, which is by
construction: the aligner's near match is exactly one substitution. Three pass the floor and all three are the parser's
role wobble, the same family §4.3.2, the #23 flip audit and §4.3.5 find from other sides:

| support | A | B |
|---|---|---|
| 5 | `(Patient $e0 $x0)` | `(Theme $e0 $x0)` |
| 4 | `(Agent $e0 $x0)` | `(Patient $e0 $x0)` |
| 3 | `(And (Past $e0) (Patient $e0 $x0))` | `(And (Past $e0) (Theme $e0 $x0))` |

At support 2, below the floor, sit the first genuine lexical mappings — follow ~ succeed ("was succeeded by" / "was
followed by", twice) and Theme ~ Goal — which is the honest size of the lexical yield: 172 pairs of near-identical
Wikipedia sentences do not repeat a lexical alternation three times.

**Role mappings.** Four pass: Theme ~ Patient (6 classes), Agent ~ Patient (4), Agent ~ Theme (4), Agent ~ Experiencer
(3: remained / stayed). Role-lost records (a role atom whose aligned centre and filler have no atom on the other side)
are led by Theme 13, Agent 12, Location 8 — the same slack the residue shows.

**Residue.** 556 records, five pass, all lone atoms without a matched context unit: `(Past $e0)` in 6 classes (the head is
present elsewhere on the other side in 5 of its 7 occurrences), `(Agent $e0 $x0)` 4, `(LocatedIn $x0 $x1)` 3, `(Theme
$e0 $x0)` 3 twice. Among the residue with support ≥ 2, 27 of 43 occurrences have their head somewhere on the other side:
attachment slack — the two translations hung the same atom on different centres — not a dispensable modifier. The one
context-bearing residue at the floor, `(Theme $e0 $x0)` inside `(And (Agent $e0 $x0) (Theme $e0 $x1))`, reads as the
transitive / intransitive alternation, a lossy unification the paper's "without semantic loss" would not license; it goes
to the gauntlet as such. Parser drift is therefore visible in the residue exactly as the owner suspected, and the two
fields (head on the other side, context) are what separate it from the modifier-pruning case.

**Validation in the owner's sense.** 772 units occur in the paraphrase pairs; 496 always map to themselves, 276 are at
least once mapped elsewhere or lost, and the ones that wobble most are the frequent role atoms (Theme: self 28, other 8,
lost 7). That per-unit profile is the paper's "validates which structural elements can be unified": stable units are
validated as they are, wobbling units are where the consolidation decisions live.

## What the method delivers on the item-E substrate (Tier A harness)

The designed corpus shows the method working as intended. 413 paraphrase and 468 control pairs; 113 paraphrase pairs
(27 %) identical, median quality 0.83. Unit mappings: 1,298 recorded, 124 pass — 78 lexical swaps in one slot (buy ~
purchase, begin ~ commence, physician ~ doctor, …, one class per seed so support 3–4), 16 role swaps, 30 not
shape-parallel — and only 2 of the 124 have control support. Tier A recall **27 of 31**: the misses are CoAgent ~
GroupOf (structural; batch 1's sole miss too), destroy ~ destruction, exhausted ~ very_tired and walk ~ take_a_walk,
where one side is a structure (a nominalisation, a degree phrase, a light-verb frame) rather than a unit-sized swap;
answer ~ give_an_answer, decide ~ make_a_decision and huge ~ very_big are recovered by batch 1's provenance rule (a
mapping supported by two of the target's own classes). alt:dative 10 / 10 and alt:voice 33 / 36 pairs parse identically.
Role mappings: Agent ~ Recipient (13 classes, control 0: the buy ~ sell converse), Agent ~ Source (10, control 0: the
teach ~ learn / give ~ receive converses and a Tier C by-phrase), Theme ~ Patient (6, control 3), Agent ~ Theme (3
paraphrase classes against 5 control classes: the participant swap — a mapping that occurs both ways is exactly what the
control column is for). Residue passes include the two designed pruning cases: `(Member $e0 decision)` (4 classes, the
light-verb noun left over when "made a decision" aligns with "decided") and `(Degree $x0 big very)` (3 classes, "very big"
against "huge"), beside the attachment slack of the Tier C pairs.

## The per-pair view (added 2026-09-21, owner's ask: sentences / common subgraph / differing subgraphs maximally aligned / residue)

`align_faithful_pairs.md` (and the same content in `align_faithful_pairs.jsonl`) lays every alignment out for reading:
the two sentences, the COMMON subgraph (the method's identical atoms, in A's variable names), the differing subgraphs
grouped per side (atoms sharing a node symbol the common part does not hold; a shared symbol the common part does hold
is the subgraph's anchor) and ALIGNED across the pair in two tiers — `near` is the method's own one-substitution match,
`partial` is a reading-only pass among the leftovers (same arity, at least one equal argument position holding a skolem
unless the heads are equal or both are class links) — then the atoms left over inside an aligned group (A only / B only)
and the RESIDUE proper: subgraphs with no counterpart at all. The method's outputs are untouched by the view (byte-identical).

What it shows on H (172 pairs): 1,065 common atoms; 115 atoms aligned by the near match and 126 more by a partial match;
166 left over inside aligned groups; 184 atoms in 142 residue subgraphs; 93 pairs have no residue subgraph at all. The
partial matches are the attachment slack made explicit: 70 differ only in the centre (the same role and filler hung on
a different event), 29 only in the filler, 21 in head plus first argument — the compound split, where one side names a
compound kind (`(Inheritance central_arm central)`) and the other asserts the parts on the entity (`(Member x0 central)`).
Pairs whose entities differ as constants (`olt_river` / `olt`, `madicea_river` / `madicea`) have quality 0 because constants
lie outside the skolem renaming — a property of the method, visible here, that the view still aligns partially. On item-E
(413 paraphrase pairs): 2,346 common, 326 near + 106 partial, 118 left over, 104 atoms in 58 residue subgraphs, 367 pairs
residue-free; the 468 control pairs carry 854 residue atoms in 405 subgraphs — a negated or otherwise altered clause
appears as one residue subgraph per side (e.g. the whole `(And …) ~NEG` clause against its positive counterpart).

## Reading

1. On H, §4.3.4 as written mostly confirms the parser: 15 % identical graphs, and its consistent non-identity mappings
   are the Theme / Patient / Agent wobble the other methods also see. Genuine lexical paraphrase mappings appear at
   support 2 and stop there; the substrate is too small for lexical consistency, not the method.
2. The bulk question is settled for this substrate: at unit granularity the candidate list is short (3 unit, 4 role,
   5 residue passes on H; 124 / 4 / 12 on item-E), so diff factoring is not needed to keep it readable.
3. The residue is contaminated by translator variance in an observable way — attachment slack dominates it — and the
   fields make the modifier-pruning case separable: on item-E the designed "very" and light-verb-noun residues surface
   with the context that renders them as rules.
4. The paper's control question is answered by the column, not by a filter: converse mappings carry zero control
   support, the participant-swap mapping carries five, and the design's lexical swaps stay clean once control support
   is counted per class rather than per pair.
5. Cross-method corroboration, the owner's extension: Theme ~ Patient passes here (unit and role), in §4.3.2's slot
   pairs, in §4.3.5's shape-parallel ties and in the #23 flip audit; the four sources agree on the family, and the
   gauntlet decides its doctrine.
