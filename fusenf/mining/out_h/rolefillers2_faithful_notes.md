# §4.3.2 faithful arm — reading (analyst notes, 2026-09-05; pooled floor + rendering update 2026-09-07)

Companion to the generated `rolefillers2_faithful.md` (H substrate) and
`../out_ecmp/rolefillers2_faithful.md` (item-E substrate with the Tier A harness), the MeTTa rendering
`rolefillers2_faithful.metta` (the adopted word @ 0.85 block, every record one pair with its PASS / FAIL verdict — pooled: every head
pair; slots: every pair with ≥ 2 shared clusters, so the near misses are visible, e.g. leave.Patient ~ leave.Result
0.311 and welcome.Agent ~ welcome.Theme 0.333 at 0.85; the other nine mode × cut blocks in
`rolefillers2_faithful_dial/`; record format agreed 2026-09-07), the per-cut records `rolefiller2_slotdist_faithful_*.jsonl` /
`rolefiller2_signals_faithful_*.jsonl`, and the cosine-gated reference run (`rolefillers2_faithful_cosine.*`,
`rolefiller2_signals_faithful_cosine_*`). The generated files are the record; this file is the reading.
Nothing here is an addition to the method.

**Gate (owner decision 2026-09-05).** "Indistinguishable distributions" is read as Jensen-Shannon
divergence ≤ 0.3 between the two slots' raw filler distributions over clusters (with ≥ 2 shared
clusters), JSD ≤ 0.4 shown as a sensitivity column, cosine ≥ 0.5 kept as the reference gate. JSD is the
more literal reading of the doc's wording and is strictly more conservative here: on both substrates it
drops cosine pairs and never adds one.

**Pooled floor (owner decision 2026-09-07).** A head enters the pooled role level at n ≥ 14 embedded fillers
(the 2026-09-04/05 runs used 20, an unrecorded round number; any floor from 18 to 29 selects the same 17
heads on H). At 14 every legislated role that the substrate attests is audited: 22 heads on H (adds CoAgent 16,
Beneficiary 14, Before 17, As 15, Like 14), 13 on item-E. The slot level does not depend on this floor; the
signal, slotdist and cluster records are byte-identical to the 2026-09-05 files on both substrates.

**Rules in the .metta (2026-09-10).** Every pair record ends in the rule the merge would become. The paper says the
two slots "fulfil the same semantic role", so the rule relabels the minority slot's head to the majority slot's head
on the minority slot's own class: `(Implication (And (Member $e0 sleep) (Agent $e0 $x1)) (And (Member $e0 sleep)
(Patient $e0 $x1)))` for die.Patient ~ sleep.Agent, the criterion's blind spot written out as a rule. A pooled pair
gives the role-vocabulary collapse, `(Implication (Experiencer $e $x) (Agent $e $x))`. The majority side is the larger
n (tie: the alphabetically first name). A pair whose slots already share the head (accompany.Agent ~ appear.Agent)
has no rule, since that merge is done by the prompt's closed role vocabulary, and the record says so. Rendered for
PASS and FAIL alike; naming and direction provisional; the two slot queries moved into comments.

## What the method delivers on the H substrate (2,302 natural-text records)

**Role level — the doc's "Agent2 ~ Agent" reading.** Pooling every argument slot by head and comparing
the heads' cluster distributions (cluster cosine 0.85, word texts), no pair is indistinguishable:

| cosine | JSD | pair | what is shared |
|---|---|---|---|
| 0.61 | 0.65 | Agent ~ Experiencer | persons, things, a name cluster |
| 0.51 | 0.75 | Patient ~ Theme | things, persons, film |
| 0.50 | 0.76 | Agent ~ Patient | persons, things, production-people names |
| 0.16 | 0.86 | Goal ~ Location | house, here, two Turkish towns |

Every pair involving a preposition-named oblique sits near zero. The five heads the lower floor admits change
nothing: Beneficiary ~ Recipient at JSD 0.86 with two shared clusters is their closest pair, Agent ~ Beneficiary
0.89, Agent ~ CoAgent 0.94 (six small shared clusters: families, a name cluster, cats), so the two legislated
roles the old floor left out are as well separated as the rest. Under the cosine reference gate the same three
pairs as before pass at the role level (Agent ~ Experiencer 0.61, Patient ~ Theme 0.51, Agent ~ Patient 0.50). Read literally, §4.3.2 proposes no
role merge on this substrate; the residual similarity between the person-filled roles is a type overlap
the method cannot resolve, because filler distribution carries no information about the predicate. On
the designed Tier A corpus the roles are even better separated (top pair Agent ~ Recipient 0.29).

**Slot level under the default gate (JSD ≤ 0.3).** Event-center signals across the dial, word texts:
3 / 3 / 2 / 2 / 2 at cluster cosine 0.80 / 0.85 / 0.90 / 0.95 / 1.00 (subtree texts 3 / 3 / 2 / 1 / 1);
at JSD ≤ 0.4 the counts are 12 / 11 / 7 / 6 / 6. The three pairs at 0.85:

- die.Patient ~ sleep.Agent (JSD 0.006): both slots hold {person, people} and {family}. By the doc's
  criterion these two slots "fulfil the same semantic role"; by the parser's doctrine one is the
  undergoer of dying and the other the agent of sleeping. The clearest case of the criterion
  under-determining role identity.
- accompany.Agent ~ appear.Agent (0.23): {sister, sisters} and {person, people}, from the same
  Wikipedia sentences.
- design.Agent ~ produce.Agent (0.25): two clusters of film-credit names.

**Slot level under the cosine reference gate (cosine ≥ 0.5)**, for comparison: 28 / 18 / 14 / 13 / 12
event-center signals (word). The eighteen at 0.85 add, beyond the three above: replace.Agent ~
write.Agent (film-credit names), sing.Agent with accompany / appear (sister, person), begin.Agent ~
create.Agent (one PAWS paraphrase pair whose two sentences both sit in the substrate), direct.Patient ~
produce.Patient (film — the one pair a reader would accept as domain evidence), welcome.Agent ~
welcome.Theme, leave.Patient ~ leave.Result and become.Patient ~ become.Result (predicative-adjective
Member links put state labels into the object's bag that the Result slot also holds — a representation
effect), and four more cross-both pairs driven by {person, people}.

**Un-embeddable fillers.** 178 occurrences (untyped skolems, numbers, strings, structured terms) are
outside the distributions by construction; 8,806 label units enter (word texts).

## What the method delivers on the item-E substrate (Tier A harness)

Under JSD ≤ 0.3, 18 of the 26 designed lemma pairs are recovered at every cut (cosine reference 19,
exact-label count baseline 20); the additional misses are answer ~ give and take ~ walk. One lexical
control pair is linked under every gate — begin ~ end, through shared Time fillers: begin.Time and
end.Time are literally indistinguishable distributions, which is exactly where indistinguishable fillers
do not mean the same thing. Three participant-swap classes yield a cross-role pair (seven under the
cosine reference), which the swapped sentences make true by design. The remaining misses are
structural: fix / mend below the n ≥ 3 floor, a nominalization (arrival), an idiom (kick_the_bucket),
find_out twice.

## Reading

1. As written, §4.3.2 is a role-merge detector. On this substrate it finds nothing to merge at the role
   level; at the slot level, under the literal gate, it returns three pairs, one of which (die ~ sleep)
   shows the criterion's blind spot and two of which are name and person clusters that follow the
   source sub-corpus.
2. The cosine reference gate admits six times as many pairs, almost all from corpus composition (name
   clusters, near-duplicate paraphrase pairs, person-type overlap) plus one representation effect.
3. Word and subtree texts behave alike; the difference is confined to the ~750 multi-label and plural
   fillers.
4. The dial's anchor (1.00) reproduces the count-based behaviour, which is what makes the additions
   measurable in Part 2.
