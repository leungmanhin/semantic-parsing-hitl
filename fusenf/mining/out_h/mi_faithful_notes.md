# §4.3.3 faithful arm — reading (analyst notes, 2026-09-09)

Companion to the generated `mi_faithful.md` / `.metta` / `.jsonl` / `_families.jsonl` (H substrate, the faithful arm)
and `mi_additions_nmi.*` (the normalised-MI addition), with the same files in `../out_ecmp/` (item-E substrate). The
generated files are the record; this file is the reading. Features are the faithful §4.3.1 units, so the method is
chained faithful-to-faithful; the prior is off, conditional MI and cross-set grouping are not used (additions).

**What the sentence fixes and what it leaves open.** The paper fixes the instrument — a binary subtree × sentence
matrix and pairwise mutual information, used raw — and names two conditions, "very high MI" and "moderate individual
support", with the consequence "almost always co-occur". The faithful gate applies both clauses on raw MI. Their
values are the choices the paper leaves open, and both are anchored in corpus-relative terms rather than fixed numbers:

- *Why a ceiling on support.* Raw MI is bounded by the entropy of the rarer feature, so it can only be "very high" for
  common features, and common features reach it through loose association: `(Agent $e0 $x0)` with `Agent + Past` is
  the highest raw MI on the substrate (0.31 bits) at Jaccard 0.60. Under a ceiling, a feature can only score high by
  being near its own maximum, i.e. by near-perfect co-occurrence; that is the paper's reasoning in one line. The low
  end excludes itself, since a rare pair can never score high. The ceiling is the 97th percentile of unit support
  (27 records on H, 1.2 % of the substrate): "moderate" = not among the most common units.
- *Why 0.03 bits.* The threshold is the MI of a perfect co-occurrence over 7 records (H(7/2302) = 0.0298 bits), the
  evidence-sufficiency anchor the paper leaves implicit; it is about six times the level still significant after
  correcting for the million pairs tested. The calibration table (ceiling × threshold, with the median Jaccard of
  the passes) shows the paper's claim holds only under a ceiling near 1 % and, read alone, would also accept a
  lower threshold (0.015 bits) where perfectly co-occurring support-3-to-5 pairs — paraphrase families — dominate;
  the record-count anchor is what keeps them out.

**Where NMI went.** Normalised MI (MI / max entropy) reads tightness directly and is support-free, so it is our
reading of "very high", not the paper's; it is the additions arm (`--gate nmi`), with no ceiling. Jaccard stays in
both arms as the paper's consequence, not a gate.

## What the faithful gate delivers on the H substrate (1,454 units × 2,302 records)

- **1,056,331 pairs; 3,300 recorded at the floor (a perfect pair over 3 records); 104 pass.** 77 are contained
  (§4.3.1 subsumption restated), 10 are same-records pairs in 5 families, 17 are overlapping. Median Jaccard of the
  passes 0.83 (0.91 among the non-contained): the paper's claim holds for the typical pass.
- **Families.** One paraphrase family (the footpath sentences: 8 records, 3 distinct) and four distinct-sentence
  families of 7 to 9 records: "began V-ing" (both rooted halves of the aspectual frame, 9 records, 8 distinct),
  the purpose infinitive `(Agent $e0 $x0) (To $e0 $e1)` with its reverse reading, and `become` + Result with its
  Experiencer half. The support-3-to-5 families of the NMI run are gone, as the anchor intends.
- **Overlapping passes (17, 8 of them at Jaccard ≥ 0.8).** The have-frame halves `Holder + have` ~
  `Holder + Theme` (27 / 26 / 26), the resultative halves with their tense (17 / 16 / 16), the Before halves, the
  aspectual halves with the Agent on either event (begin, start), `build + Patient` ~ `build + Past`. The looser ones
  (Jaccard 0.42 to 0.61) pair an eventive-Theme frame with its reversed-nesting twin: raw MI rewards them for being
  moderately common, which is the ceiling's residual weakness.
- **Over the ceiling (25 non-contained pairs at or above the threshold).** The best candidate on the substrate sits
  here: `Experiencer + Result` ~ `Patient + Result`, 28 / 27 / 27, Jaccard 0.96, one record above the ceiling. The
  paper's clause excludes it; the NMI addition recovers it. Below it, the have ~ Holder cross pairs (support 43 / 27)
  and then the generic frames (Past ~ Agent, 703 / 385, Jaccard 0.29) — which is the clause working as intended.
- **64 near misses under the ceiling**, at supports 5 to 21, listed in the report and the JSONL.

## What it delivers on the item-E substrate (1,652 units × 762 records)

Ceiling 12 records, threshold 0.075 bits (a perfect pair over 7 of 762): 106 pass, 20 same-records pairs in 9
families (8 paraphrase, 1 distinct), 2 overlapping (the decide and lend frames seen from Agent and Theme), 490 near
misses, 39 over the ceiling. A designed paraphrase corpus of this size leaves the clause little room; the ceiling and
the anchor nearly coincide.

## The NMI addition on H

2,448 pass at NMI ≥ 0.8: 770 contained, 1,667 same-records pairs in 57 families (24 paraphrase, 33 distinct), 11
overlapping; 1,820 near misses, almost all support-3 pairs one record apart. Against the faithful gate it adds the
rare perfect pairs (the support-3-to-5 families, including the small distinct ones such as "left the door open") and
the tight pairs just above the ceiling (the resultative), at the cost of admitting the paraphrase artefact in bulk.

## Reading

1. As written, §4.3.3 on this substrate is mostly a mirror: it re-finds §4.3.1's subsumption (77 of 104 passes).
   Its genuine yield is specific: the rooted halves of constructions the directed-tree reading of §4.3.1 had to split
   — the have frame, the aspectual complement, the resultative, the Before and purpose links — reassembled by
   co-occurrence. "Consolidation into a single feature" for such a pair is the aligned conjunction, a join pattern or
   a frame with its tense, so §4.3.3 hands the candidate stage the shapes §4.3.1 excluded, with the paper's own
   justification.
2. The paper's two clauses are a proxy for tightness under raw MI, and a coarse one: the resultative pair, the
   strongest candidate, falls one record outside the ceiling. That is the delta the NMI addition measures.
3. Near-duplicate records must be neutralised before an MI candidate is trusted; the family label carries the real
   support (`n_distinct_sentences`). Counting support by corpus equivalence class would remove the artefact at the
   source; the owner chose not to go there for now, so the candidate stage skips the paraphrase families.
