# §4.3.3 faithful arm — reading (analyst notes, 2026-09-09)

Companion to the generated `mi_faithful.md` / `.metta` / `.jsonl` (H substrate, the faithful arm) and
`mi_additions_nmi.*` (the normalised-MI addition), with the same files in `../out_ecmp/` (item-E substrate). The
generated files are the record; this file is the reading. Features are the faithful §4.3.1 units, so the method is
chained faithful-to-faithful; the prior is off, conditional MI and grouping across pairs are not used (additions).

**What the sentence fixes and what it leaves open.** The paper fixes the instrument — a binary subtree × sentence
matrix and pairwise mutual information, used raw — and names two conditions, "very high MI" and "moderate individual
support", with the consequence "almost always co-occur". The faithful gate applies both clauses on raw MI, with the
two values anchored in corpus-relative terms:

- *Why a ceiling on support.* Raw MI is bounded by the entropy of the rarer feature, so it can only be "very high" for
  common features, and common features reach it through loose association: `(Agent $e0 $x0)` with `Agent + Past` is
  the highest raw MI on the substrate (0.31 bits) at Jaccard 0.60. Under a ceiling a feature can only score high by
  being near its own maximum, i.e. by near-perfect co-occurrence — the paper's "but … so" in one line. The low end
  excludes itself, since a rare pair can never score high. Ceiling = the 97th percentile of unit support (27 records
  on H, 1.2 % of the substrate): "moderate" = not among the most common units.
- *Why 0.03 bits.* The threshold is the MI of a perfect co-occurrence over 7 records (H(7/2302) = 0.0298 bits), the
  evidence-sufficiency anchor the paper leaves implicit, about six times the level still significant after correcting
  for the million pairs tested. The calibration table (ceiling × threshold, median Jaccard of the passes) shows the
  paper's claim holds only under a ceiling near 1 % and, read alone, would also accept 0.015 bits, where perfectly
  co-occurring support-3-to-5 pairs from near-duplicate records dominate; the record-count anchor keeps them out.
- *Why not normalised MI.* NMI (MI / max entropy) reads tightness directly and needs no support clause; the sentence's
  "but" (a tension between high MI and moderate support) and "so" (co-occurrence inferred, not restated) presuppose
  raw MI. NMI is our reading and is the additions arm (`--gate nmi`). Pointwise MI with a floor would be the
  second-best reading of the sentence and behaves like the NMI run. Jaccard stays as the paper's consequence, not a gate.

**What a record is.** Every passing pair is one record: the two units, their record counts (with the number of
distinct sentences behind the shared records, which exposes near-duplicates), MI and Jaccard, the variable alignment
between the two units found by matching both in every shared record (and in how many records it holds), and the pack
rule the pair would become, `(Implication (And <aligned conjunction>) (Mn<Name> <vars>))`. Two notes replace the
earlier kinds and families: "B is part of A" (one unit's atoms embed in the other's, so the pair restates §4.3.1
subsumption and the rule is A's own pack) and "no shared skolem" (the units co-occur in the same sentences without
touching, so the rule is a co-occurrence conjunction). Several pairs can produce the same merged feature; they share
one rule name. The .metta tags every pass `[genuine]` or `[part-of]` on its header line and lists the genuine passes
first, so `grep '\[genuine\]'` locates the rules new to this method.

## What the faithful gate delivers on the H substrate (1,454 units × 2,302 records)

- **1,056,331 pairs; 3,300 recorded at the floor (a perfect pair over 3 records); 104 pass**, of which 77 are
  part-of pairs and 27 genuine. They yield 73 distinct rules (24 from the genuine pairs). The alignment holds
  in every shared record for 100 of the 104 passes; 6 passes share no skolem (the constant-only footpath units).
  Median Jaccard of the passes 0.83: the paper's claim holds for the typical pass.
- **The genuine rules.** The have frame `(Holder)(have)(Theme)` from its two halves (27 / 26 / 26); the aspectual
  frames from their two readings — the same participant as Agent of the outer and the inner event, a join,
  `(Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e1) (Theme $e0 $e1)` for begin / start + V-ing (10 / 10) — and with their
  tense; the resultative with its tense (17 / 16 / 16); the Before halves; the purpose infinitive; `build + Patient`
  with `build + Past`; `become` + Result with its Experiencer half. The looser genuine passes (Jaccard 0.42 to 0.61)
  pair an eventive-Theme frame with its reversed-nesting twin, and their alignment holds in only 12 of 14 or 14 of 16
  shared records: the record says so, and the gauntlet should read it.
- **Over the ceiling (113 pairs at or above the threshold, support > 27).** The strongest candidate on the substrate
  sits here: `Experiencer + Result` ~ `Patient + Result`, 28 / 27 / 27, Jaccard 0.96, one record above the ceiling.
  The paper's clause excludes it; the NMI addition recovers it and merges it into the join the miner already held as
  p200308, `(Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0)`. Below it, the have ~ Holder cross pairs
  (43 / 27) and the generic frames (Past ~ Agent, 703 / 385, Jaccard 0.29), which is the clause working as intended.
- **208 near misses under the ceiling** (a perfect pair over 5 records or more, below the gate), listed in the report
  and the JSONL. 79 passes have at least one duplicate among their shared records; the count of distinct sentences
  on each record is the guard the candidate stage should read.

## What it delivers on the item-E substrate (1,652 units × 762 records)

Ceiling 12 records, threshold 0.075 bits (a perfect pair over 7 of 762): 106 pass (84 part-of), 860 near misses,
105 over the ceiling. A designed paraphrase corpus of this size leaves the clause little room; the ceiling and the
anchor nearly coincide, and most shared-record sets are paraphrase pairs.

## The NMI addition on H

2,448 pass at NMI ≥ 0.8 (770 part-of); 318 passes share no skolem; 2,120 near misses, almost all support-3 pairs one
record apart. Against the faithful gate it adds the rare perfect pairs (the support-3-to-5 sets, most of them
near-duplicate records, some genuine such as "left the door open") and the tight pairs just above the ceiling (the
resultative), at the cost of admitting the paraphrase artefact in bulk.

## Reading

1. As written, §4.3.3 on this substrate is mostly a mirror: 77 of the 104 passes restate §4.3.1's subsumption. Its
   genuine yield is specific: the rooted halves of constructions the directed-tree reading of §4.3.1 had to split —
   the have frame, the aspectual complement with subject control, the resultative, the Before and purpose links —
   reassembled by co-occurrence and now written out as the join or the frame-with-tense they are.
2. The paper's two clauses are a proxy for tightness under raw MI, and a coarse one: the resultative pair, the
   strongest candidate, falls one record outside the ceiling. That is the delta the NMI addition measures.
3. No genuine disconnected pair was found: every pass whose units share no skolem (6 on H, 299 under the NMI
   addition, 4 on item-E) comes from a near-duplicate family, the footpath sentences above all. A discourse-level
   regularity, every sentence about X also mentioning Y, would need a document-level corpus; on independent single
   sentences the reach beyond §4.3.1 that materialised is the join kind, not the disconnected kind.
4. Against §4.3.1: same rule species, 77 of 104 passes restate its subsumption, and the two should be consumed in
   sequence (units, then glue, the merged features replacing the halves they cover) rather than as two lists.
5. Near-duplicate records must be neutralised before an MI candidate is trusted; each record carries the count of
   distinct sentences behind its shared records. Counting support by corpus equivalence class would remove the
   artefact at the source; the owner chose not to go there for now.
