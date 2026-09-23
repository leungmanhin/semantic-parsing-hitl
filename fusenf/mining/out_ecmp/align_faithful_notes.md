# §4.3.4 faithful arm as a validation instrument — reading (analyst notes, 2026-09-23)

Companion to the generated `align_faithful.md` (Tier A: 84 designed classes, 233 paraphrase pairs, 468 control pairs), the
record `align_faithful.jsonl` (every substitution factor and joint key, role mapping, one-sided region and element with its
support in distinct classes, its control support, its gate and examples), the per-pair intermediate `align_faithful_pairs.jsonl`
/ `.md` (the two sentences, the renaming, the common subgraph, the substitutions with their factors and leftovers, the
one-sided regions) and the MeTTa rendering `align_faithful.metta` (evidence statements `(Unifiable A B)` / `(OneSided X)`,
licensed first; never loaded, never a rule). The generated files are the record; this file is the reading.

**What changed on 2026-09-23.** The 2026-09-19 build keyed its record on the §4.3.1 unit inventory and ran on the Tier C PAWS
pairs as well; the owner re-read the paper text and chose the validation-instrument reading: the deliverable is a table over
structural elements with their behaviour under paraphrase, the record's granularity comes from the alignment itself, the §4.3.1
inventory is not consulted, the substrate is Tier A only, and the instrument emits evidence rather than rules (a licensed
unification becomes a rewrite only in `build_candidates`). The old files are in the git history; `out_h/align_faithful.*` are
gone because H is no longer a substrate for this method.

**What the paper pins down and what we chose.** Pairs known to be paraphrases, an alignment by tree-edit or soft matching,
and a record of which subtrees and roles consistently map are the paper's. Ours, disclosed in every header: the pair source
(Tier A same-polarity variants as paraphrase pairs; the different-polarity variants as control pairs, a measurement column);
the alignment (the edit script: exact maximum-common-subgraph over every within-stream skolem renaming, identical atoms
first, then one-substitution relabels, the first renaming on a tie; greedy above 5,040 renamings, never needed); the regions
(differing atoms grouped by shared node symbols the common part does not hold; symbols the common part holds are anchors);
the substitutions (regions linked by relabels, plus every same-side region hanging on the same anchors as a relabelled
region, so that a co-dependent edit is one substitution), recorded as each FACTOR and as the JOINT key; the one-sided
regions (diagnostic); the roles; the element table; the floor (3 distinct classes); and the gates: LICENSED = pass with
zero control support and, for a factor, attested alone at least once; JOINT-ONLY = a factor never attested alone; CONTESTED
= pass with control support. Byte-identical re-runs; every pair's atoms account exactly (common + relabelled + leftover +
one-sided on each side).

## What the instrument delivers on Tier A

**Alignment.** 49 of the 233 paraphrase pairs (21 %) have identical canonical graphs (alt:dative 10 / 10, alt:voice 33 / 36);
quality median 0.80, quartiles 0.57 / 0.86, 24 pairs below 0.5; 106 pairs tie between renamings, none needed the greedy
fallback. The paraphrase pairs hold 1,061 common atoms, 235 relabels in 173 substitutions, 65 leftover atoms inside those,
and 78 one-sided atoms in 32 regions, 18 of them flagged as re-attachments; 215 pairs have no one-sided region at all.

**Element behaviour.** 275 atom patterns occur in the paraphrase pairs; 207 are always preserved. The wobbling ones are the
designed alternations: `(Agent $e0 $x0)` is substituted by Recipient in 12 classes and by Source in 9 (the converses), the
lexical families substitute each other 3–4 times each, and `(Theme $e0 $e1)` / `(Patient $e0 $e1)` swap in the light-verb
classes — the parser's Theme / Patient wobble again.

**Substitutions.** 138 factors recorded, 30 pass the floor. 16 are LICENSED — the synonym swaps attested alone: buy ~
purchase ~ acquire, begin ~ commence ~ start, cancel ~ call_off, discover ~ find_out, abandon ~ give_up, postpone ~ put_off,
need ~ require, reject ~ turn_down, car ~ automobile, hard ~ difficult, big ~ large, doctor ~ physician. 13 are JOINT-ONLY —
factors that never occur as the whole difference: sell against buy / purchase / acquire, give ~ receive, lend ~ borrow,
teach ~ learn, make / reach ~ decide, give ~ answer, huge ~ big, Agent ~ Source, Theme ~ Patient on an event filler. One is
CONTESTED: Agent ~ Recipient passes with 12 classes but also appears in a control class. The 9 LICENSED joint keys are
exactly the designed co-dependent edits, and every one is `co_dependent` (no factor of theirs is ever attested alone):
`(And (Agent $e0 $x0) (Member $e0 buy))` ~ `(And (Member $e0 sell) (Recipient $e0 $x0))` and its purchase / acquire twins
(the converse = verb swap + role swap, the trap noted on 2026-08-19, now structural in the record), give ~ receive and
teach ~ learn with their Agent / Recipient / Source swaps, make a decision ~ decide and reach a decision ~ decide (the
light-verb frame, its `decision` event as leftover material), huge ~ very big (the degree phrase as leftover). lend ~ borrow
and exhausted ~ very tired sit at support 2 because one class of each parses a named participant as a constant
(`(Recipient $e0 ravi)`), which splits the key — a granularity effect worth knowing when reading support counts.

**Roles.** Agent ~ Recipient (13 classes, control 0) and Agent ~ Source (9, control 0) are LICENSED; Theme ~ Patient (5
classes) is CONTESTED by 3 control classes. Role-lost: Agent 6, CoAgent 4, Theme 4 — the CoAgent losses are the
"with a fitter" classes, where the other side distributes the conjunction over two events.

**One-sided regions.** 155 recorded, 2 pass, and both are re-attachments rather than drops: `(Agent $e0 $x0)` (6 classes;
all 9 occurrences re-attached, head present on the other side) and the frame `(And (Agent $e0 $x0) (Member $e0 cause)
(Theme $e0 $e1))` (3 classes; 6 / 6 re-attached). These are the periphrastic classes — "causes the destruction of",
"takes a walk" — where the parser keeps the core verb (`destroy`, `walk`) and wraps it in a light event, so the two sides
differ by a whole event with no atom-level relabel between them. `(Might $e0)` shows the control column working: 21 control
classes, no paraphrase class. The `(Degree diver tired very)` / `(Inheritance diver exhausted)` pair shows the constant-subject
case (a named entity parsed as a constant, so no skolem to align on).

**Scorecard.** 28 of the 31 target rules are recovered (17 by a LICENSED record, 5 by a JOINT-ONLY one, 6 below the floor).
The misses are the three zero-relabel alternations: CoAgent ~ GroupOf (two-event distribution on one side), destroy ~
destruction and walk ~ take a walk (the light-event wrappers above). An edit script whose only cross-side link is the
single-atom relabel cannot connect those; they surface as mutually re-attached one-sided regions, which is the honest place
for them until a region-level soft match is added — an addition, measured against this file.

## Reading

1. The instrument separates synonym swaps from co-dependent edits without any inventory: a factor attested alone is a
   licensed unification on its own; a factor never attested alone is licensed only inside its joint, and the joint keys
   are the converses and light-verb frames the design planted.
2. The control column earns its place: the participant-swap controls contest Theme ~ Patient and touch Agent ~ Recipient,
   the modality controls appear only as one-sided `(Might $e0)`, and no licensed key has control support.
3. Drops that pass are re-attachments, not prunes: the two passing one-sided keys are the light-event wrappers. Nothing in
   this run argues for a prune candidate; the drop table stays diagnostic, as decided.
4. The residual gap is structural: alternations with no shared atom skeleton (nominalisation, light verb without the core
   verb relabelled, conjunction distribution) need a cross-side link above the atom, which is the soft-matching half of the
   paper's "tree-edit or soft matching" and the natural next addition.
5. Key granularity: constants as participants split keys (lend ~ borrow at 2 + 1). Whether to abstract named constants
   into variables for the keys is a parameter to decide with the candidate builder, not silently here.
