# §4.3.1 faithful view — reading (analyst notes, 2026-09-07)

Companion to the generated `patterns2_faithful.md` / `.metta` / `.jsonl` (H substrate) and the same three files in
`../out_ecmp/` (item-E substrate). The generated files are the record; this file is the reading. Nothing here is an
addition to the method. The view is cut from the 2026-09-02 `frequent_patterns2` inventory (k = 4, support ≥ 3)
without re-mining.

**What "faithful" means here.** The paper's sentence has three operative terms and the view applies each
literally: *rooted subtree* = atoms read as edges from their centre to their other arguments, one root, every other
node under exactly one parent (a participant or constant shared by two parents is a join, not a subtree; 275 such
patterns are counted and excluded); *count how many sentences contain each pattern* = document support; *fixed size
threshold / minimum support* = the run's k = 4 atoms and 3 records. Constants stay verbatim, because a subtree of a
graph keeps its leaves; the constant-lifted shape stratum (6,037 patterns) is our addition and belongs to Part 2.

**Closure is computed within the faithful units.** A unit is closed when no larger faithful unit with exactly the
same supporting records contains it, i.e. its atoms embed into the larger unit's under a renaming of variables; the
subsumed ones are the same evidence in fewer atoms (`subsumed_by` names the covering unit). Two different units on
the same records are both closed — for instance the two four-atom aspectual frames on the same nine records, one
with the Agent on the outer (begin) event and one with it on the inner (ongoing) event. Closure is relative to the
size bound: every unit of size k is closed by construction, because nothing larger was enumerated, so the flag is
informative for sizes below k only. The miner's own `dominated` flag ranges over the whole inventory, lifted patterns and joins included, and
would have marked 575 faithful units subsumed only because an addition shares their records — the constant-free
role frames above all, since adding a lifted `(Member $e0 $v0)` to any event frame never changes its support. A
flag computed over an inventory that mixes arms has to be recomputed per arm.

**Owner decisions (2026-09-08).** Lifted patterns and joins stay in the additions arm; "rooted subtree" is read as
directed, one parent per node (the undirected reading would admit 221 of the 275 joins as trees rooted at the shared
node; 54 contain a genuine cycle under either reading). Proposals are the closed units of size ≥ 2 (JSONL flag `proposal`); a subsumed unit is
rendered for reading only and names its cover. Each proposal is rendered as the pack rule it would become,
`(Implication <unit> (Mn<Name> <vars>))` (2026-09-10). Single-atom units are subtrees by the letter and are rendered
in their section (closed or subsumed) like every other unit, but they are not proposals (a one-atom pack is a rename)
and carry no rule. Meta-nodes carry
batch-1 style readable names built along the tree, root tokens joined with `_` and the tokens inside a nested spec
with `-` (`MnHolder_Have_Theme`, `MnAgentOfPerson_Past_Patient`, `MnBeforeEvOfAgent_Past` with Past on the root event
versus `MnBeforeEvOfAgent-Past` with Past inside the Before filler); the pattern id is appended only when two units
would still share a name (2 units on H, none on item-E: a root that is an event versus an entity). The example-sentence column stays in the report.

## What the method delivers on the H substrate (2,302 records)

- **1,454 units, 1,140 closed, 728 proposals (closed, size ≥ 2); 72 of those at support ≥ 10.** All 137 size-4 units are
  closed by construction. The closed size-≥ 2 units split into constant-free frames (skolem variables and operators
  only) and units with a content constant.
- **The most common units are verb-free participant frames.** Agent + Past (232), Patient + Past (195), Theme +
  Past (154), Agent + Theme (114), Agent + Patient (74), Location + Past (62), Agent + Past + Theme (60), Agent +
  Ongoing (58). These are the paper's "go to with two participants" with the verb left open: exactly the shapes
  batch 1 packed as MnEvAgThPast and kin, minus the verb clause. Under the faithful reading they are the meta-node
  proposals with real support; a verb-specific unit is a specialisation of one of them.
- **The lexicalised units are light-verb frames and typed participants.** have + Theme (40), Agent that is a
  person (30), have + Holder (27), have + Holder + Theme (26), Agent-person + Past (20), Agent that is a thing (19),
  Theme that is a thing (18), the possessive-pronoun construction `(Member $x0 person) (Possession $x1 $x0)` (17),
  make + Patient (15), start + Past (14); then the aspectual frame `(Member $e0 begin) (Ongoing $e1) (Past $e0)
  (Theme $e0 $e1)` and its start twin (9 each), counted plural groups (Cardinality + GroupOf), locative entity
  units (LocatedIn + Member city / table / garden). Constants verbatim on 2.3k varied sentences leaves most
  lexicalised units at support 3 to 5.
- **Genus links.** `(Inheritance living_room room) (Member $x0 living_room)` at support 3 is the constants-verbatim
  face of the 212-support lifted pattern flagged on 2026-09-02: the compound-decomposition doctrine re-asserts the
  genus in every record, but each genus pair recurs rarely, so under the faithful reading it is many small units.
- **Excluded joins.** The top ones are two events sharing an Agent (54: coordinated predicates, "came and cut"),
  an Experiencer and a Patient sharing a participant (31: the resultative "leaves the lights on"), and two events
  sharing a Patient (29). These are the miner's cross-star capability, an addition; they are listed in the .md only.

**k = 5 probe (2026-09-08, scratch run, not adopted).** Re-mining H at k = 5 took 51 s and 379 MB and returned 11,706
patterns whose k ≤ 4 part is identical to the production inventory (same patterns, same supports). The fifth atom adds
81 faithful units, none above support 5: each is a size-4 unit plus a `(Past $e0)` or one more Member link (the
aspectual begin / start frame with its Agent and tense, a build-in-Kazakhstan frame, a win-an-Emmy frame). They
cover 91 of the 137 size-4 units, so most size-4 units do extend, but only at support 3 to 5; the closed count moves
from 1,140 to 1,130 and the top of the list does not move. The k-bounded closure caveat is therefore confined to
support-3-to-5 units, and k = 4 is saturating for this substrate at support ≥ 3. The 3,940 size-5 patterns the run adds are almost all lifted (the addition side)
and would enlarge the feature space §4.3.3 / §4.3.5 consume, which is the reason not to switch the shared inventory.

**k = 6 and k = 7 probes (2026-09-08, scratch, not adopted).** k = 6: 2 min 26 s, 597 MB, 16,629 patterns, 54 faithful
size-6 units (max support 4). k = 7: 8 min 24 s, 936 MB, 22,947 patterns, 34 faithful size-7 units (max support 4).
The size-6 and size-7 units are the shared structure of PAWS paraphrase families whose members all sit in the
substrate (the tierC-000159 family: a party's views, three to four near-identical records), not recurring semantic
units of the language; the tail would continue until k reaches the common subgraph of those families. Cost grows
about 3× per level. Nothing above size 4 has support above 5 on this substrate.

## What the method delivers on the item-E substrate (762 records)

1,652 units, 773 closed, 614 proposals (closed, size ≥ 2), 35 of those at support ≥ 10. The designed paraphrase corpus
repeats its fillers, so it has more units per record than H and most of them are subsumed. No Tier A key exists
for §4.3.1.

## Reading

1. As written, §4.3.1 on this substrate proposes the participant frames of the event vocabulary as meta-nodes
   first (verb-free), verb-specific frames for the most frequent verbs second, and a few constructions
   (possessive pronoun, counted groups, aspectual complement). Whether a frame is worth packing is a marginal-MDL
   question for the candidate stage, not a support question.
2. Batch 1's subtree-collapse packs carried the verb as a lifted variable inside the pack; the faithful frames
   leave the verb outside. The additions section should report the lifted stratum as the delta: what lifting the
   verb and the classes into the unit buys beyond the verb-free frame.
3. The closed / subsumed split is a reading aid, not a parameter of the method; computing it per arm, with a real
   containment test, is what makes the faithful list honest.
