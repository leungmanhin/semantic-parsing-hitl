# §4.3.4 Paraphrase-Based Alignment — FAITHFUL arm (validation instrument) — per-pair intermediate

One block per pair from `out_ecmp/canonical_iteme.jsonl` over ../corpora/tierA.jsonl: the two sentences, the COMMON subgraph (the atoms the aligner matched identically under its skolem renaming), the SUBSTITUTIONS (regions of differing material linked across the pair by relabels, with their factors and leftovers) and the ONE-SIDED regions. The record is `align_faithful_pairs.jsonl` (same content, one JSON object per pair); the instrument's tables are `align_faithful.jsonl / .md / .metta`.

## How to read a block

- Every atom is written in A's variable names; B's atoms are renamed through the alignment's `renaming a->b` (read it backwards); a variable B has and A has not carries a prime (`x2'`). `~NEG` marks a negative-polarity atom. Only the aligner's eligible atoms appear (Implication and surface atoms excluded).
- `common` = the atoms matched identically: the maximum common subgraph the method found (its `identical` count).
- The atoms outside the common part are grouped into REGIONS per side: two atoms belong together when they share a node symbol that the common part does not hold (a skolem, or a constant standing as a term's first argument, e.g. a compound kind); a symbol the common part does hold is an ANCHOR — where the region hangs — and never merges regions. Regions are written `{atom atom …}`.
- A `substitution` = regions of A and of B linked by relabels, plus every same-side region hanging on the same anchors as a relabelled region: each `factor` is one of the method's near matches (same arity, the same skolems in the same positions, a head or constant substituted), `[…]` listing exactly what differs. `A only` / `B only` = atoms inside the substitution with no relabel partner (the leftover material of a co-dependent edit: make + decision ~ decide, big + very ~ huge). The `joint key` is the record's key for the whole substitution (both forms with anchors as `@`), shown when the substitution holds more than one factor or a leftover; a lone relabel is recorded as its factor only.
- `one-sided A` / `one-sided B` = regions with no relabel link at all, written `{…}@anchors`; `↔` marks a region whose other side holds a one-sided region on the same anchors sharing a head (the same material hung elsewhere: attachment slack rather than a drop).

## Totals — paraphrase pairs

- 233 pairs, 49 with identical parses, 215 with no one-sided region; 173 substitutions holding 235 factors (relabels)
- atoms: 1061 common; 235 relabelled; 65 left over inside substitutions (A only / B only); 78 one-sided in 32 regions, 18 of those regions flagged as re-attachments (↔)

## Totals — control pairs (same-polarity member × different-polarity member; a measurement column)

- 468 pairs, 6 with identical parses, 276 with no one-sided region; 329 substitutions holding 417 factors (relabels)
- atoms: 1497 common; 417 relabelled; 169 left over inside substitutions (A only / B only); 790 one-sided in 341 regions, 0 of those regions flagged as re-attachments (↔)

## Paraphrase pairs

### seedA-001 · tierA-000001 ↔ tierA-000002 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot bought two forklifts.
B: The depot purchased two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  factor       (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000001 ↔ tierA-000003 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot bought two forklifts.
B: The depot acquired two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  factor       (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000001 ↔ tierA-000004 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot bought two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 buy)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000001 ↔ tierA-000005 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The depot bought two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000002 ↔ tierA-000003 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot purchased two forklifts.
B: The depot acquired two forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  factor       (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000002 ↔ tierA-000004 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot purchased two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 purchase)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 purchase)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000002 ↔ tierA-000005 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot purchased two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000003 ↔ tierA-000004 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot acquired two forklifts.
B: Two forklifts were sold to the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 acquire)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 acquire)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000003 ↔ tierA-000005 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot acquired two forklifts.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000004 ↔ tierA-000005 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two forklifts were sold to the depot.
B: Two forklifts were bought by the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 forklift) (Member x1 depot) (Past e0) (Theme e0 x0)
substitution 1 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000009 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school bought a projector for the hall.
B: The school purchased a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  factor       (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000010 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school bought a projector for the hall.
B: The school acquired a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  factor       (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000011 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school bought a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 buy)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000012 · quality 1.00 · common 8 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The school bought a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000009 ↔ tierA-000010 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school purchased a projector for the hall.
B: The school acquired a projector for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  factor       (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000009 ↔ tierA-000011 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school purchased a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 purchase)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 purchase)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000009 ↔ tierA-000012 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school purchased a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000010 ↔ tierA-000011 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school acquired a projector for the hall.
B: A projector was sold to the school for the hall.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 acquire)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 acquire)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000010 ↔ tierA-000012 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The school acquired a projector for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Member x2 projector) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000011 ↔ tierA-000012 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A projector was sold to the school for the hall.
B: A projector was bought by the school for the hall.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Beneficiary e0 x0) (Member x0 hall) (Member x1 projector) (Member x2 school) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000015 ↔ tierA-000016 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef bought several crates of lemons.
B: The chef purchased several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  factor       (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000015 ↔ tierA-000017 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef bought several crates of lemons.
B: The chef acquired several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  factor       (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000015 ↔ tierA-000018 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef bought several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 buy)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000015 ↔ tierA-000019 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The chef bought several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000016 ↔ tierA-000017 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef purchased several crates of lemons.
B: The chef acquired several crates of lemons.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  factor       (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000016 ↔ tierA-000018 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 purchase)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 purchase)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000016 ↔ tierA-000019 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000017 ↔ tierA-000018 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons were sold to the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 acquire)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 acquire)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000017 ↔ tierA-000019 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000018 ↔ tierA-000019 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Several crates of lemons were sold to the chef.
B: Several crates of lemons were bought by the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x0 lemon) (Member x0 crate) (Member x1 chef) (Past e0) (Theme e0 x0)
substitution 1 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000023 · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio bought a second kiln.
B: The pottery studio purchased a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 purchase)}
  factor       (Member e0 buy) ~ (Member e0 purchase)   [arg1 buy->purchase]
substitution 2 anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 purchase)}
  factor       (Ordinal x1 2 buy) ~ (Ordinal x1 2 purchase)   [arg2 buy->purchase]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000024 · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio bought a second kiln.
B: The pottery studio acquired a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 buy)}
  B            {(Member e0 acquire)}
  factor       (Member e0 buy) ~ (Member e0 acquire)   [arg1 buy->acquire]
substitution 2 anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 acquire)}
  factor       (Ordinal x1 2 buy) ~ (Ordinal x1 2 acquire)   [arg2 buy->acquire]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000025 · quality 0.62 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio bought a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 buy)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 buy) ~ (Member e0 sell)   [arg1 buy->sell]
substitution 2 anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 2 sell)}
  factor       (Ordinal x1 2 buy) ~ (Ordinal x1 2 sell)   [arg2 buy->sell]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000026 · quality 1.00 · common 8 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The pottery studio bought a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000023 ↔ tierA-000024 · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio purchased a second kiln.
B: The pottery studio acquired a second kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 acquire)}
  factor       (Member e0 purchase) ~ (Member e0 acquire)   [arg1 purchase->acquire]
substitution 2 anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 acquire)}
  factor       (Ordinal x1 2 purchase) ~ (Ordinal x1 2 acquire)   [arg2 purchase->acquire]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000023 ↔ tierA-000025 · quality 0.62 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio purchased a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 purchase)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 purchase)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 purchase) ~ (Member e0 sell)   [arg1 purchase->sell]
substitution 2 anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 sell)}
  factor       (Ordinal x1 2 purchase) ~ (Ordinal x1 2 sell)   [arg2 purchase->sell]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000023 ↔ tierA-000026 · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio purchased a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
substitution 2 anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 2 buy)}
  factor       (Ordinal x1 2 purchase) ~ (Ordinal x1 2 buy)   [arg2 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000024 ↔ tierA-000025 · quality 0.62 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio acquired a second kiln.
B: A second kiln was sold to the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 acquire)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 acquire)}
  B            {(Member e0 sell)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 acquire) ~ (Member e0 sell)   [arg1 acquire->sell]
substitution 2 anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 2 sell)}
  factor       (Ordinal x1 2 acquire) ~ (Ordinal x1 2 sell)   [arg2 acquire->sell]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000024 ↔ tierA-000026 · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio acquired a second kiln.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
substitution 2 anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 2 buy)}
  factor       (Ordinal x1 2 acquire) ~ (Ordinal x1 2 buy)   [arg2 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000025 ↔ tierA-000026 · quality 0.62 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second kiln was sold to the pottery studio.
B: A second kiln was bought by the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0) (Theme e0 x0)
substitution 1 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
substitution 2 anchors x0
  A            {(Ordinal x0 2 sell)}
  B            {(Ordinal x0 2 buy)}
  factor       (Ordinal x0 2 sell) ~ (Ordinal x0 2 buy)   [arg2 sell->buy]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000029 ↔ tierA-000030 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic repaired a seized gearbox.
B: The mechanic fixed a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 fix)}
  factor       (Member e0 repair) ~ (Member e0 fix)   [arg1 repair->fix]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000029 ↔ tierA-000031 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic repaired a seized gearbox.
B: The mechanic mended a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 mend)}
  factor       (Member e0 repair) ~ (Member e0 mend)   [arg1 repair->mend]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000029 ↔ tierA-000032 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The mechanic repaired a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000030 ↔ tierA-000031 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic fixed a seized gearbox.
B: The mechanic mended a seized gearbox.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 mend)}
  factor       (Member e0 fix) ~ (Member e0 mend)   [arg1 fix->mend]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000030 ↔ tierA-000032 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic fixed a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  factor       (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000031 ↔ tierA-000032 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic mended a seized gearbox.
B: A seized gearbox was repaired by the mechanic.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  factor       (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000035 ↔ tierA-000036 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician repaired the yard floodlight.
B: The electrician fixed the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 fix)}
  factor       (Member e0 repair) ~ (Member e0 fix)   [arg1 repair->fix]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000035 ↔ tierA-000037 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician repaired the yard floodlight.
B: The electrician mended the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 mend)}
  factor       (Member e0 repair) ~ (Member e0 mend)   [arg1 repair->mend]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000035 ↔ tierA-000038 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The electrician repaired the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000036 ↔ tierA-000037 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician fixed the yard floodlight.
B: The electrician mended the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 mend)}
  factor       (Member e0 fix) ~ (Member e0 mend)   [arg1 fix->mend]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000036 ↔ tierA-000038 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician fixed the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  factor       (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000037 ↔ tierA-000038 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician mended the yard floodlight.
B: The yard floodlight was repaired by the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  factor       (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000041 ↔ tierA-000042 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor repairs a torn awning.
B: A tailor fixes a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000041 ↔ tierA-000043 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor repairs a torn awning.
B: A tailor mends a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000042 ↔ tierA-000043 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor fixes a torn awning.
B: A tailor mends a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-008 · tierA-000046 ↔ tierA-000047 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A crew repairs a cracked feed pipe.
B: A crew fixes a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    —
```

### seedA-008 · tierA-000046 ↔ tierA-000048 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A crew repairs a cracked feed pipe.
B: A crew mends a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    —
```

### seedA-008 · tierA-000046 ↔ tierA-000049 · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew repairs a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000048 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A crew fixes a cracked feed pipe.
B: A crew mends a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    —
```

### seedA-008 · tierA-000047 ↔ tierA-000049 · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew fixes a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000049 · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew mends a cracked feed pipe.
B: A cracked feed pipe is repaired by a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' crew) (Member x1' cracked) (Member x1' feed_pipe) (Patient e0' x1')}@feed_pipe
```

### seedA-009 · tierA-000052 ↔ tierA-000053 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey begins at dawn.
B: A shoreline survey starts at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  factor       (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000052 ↔ tierA-000054 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey begins at dawn.
B: A shoreline survey commences at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  factor       (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000053 ↔ tierA-000054 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey starts at dawn.
B: A shoreline survey commences at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  factor       (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000057 ↔ tierA-000058 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing begins on Monday morning.
B: A hearing starts on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  factor       (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000057 ↔ tierA-000059 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing begins on Monday morning.
B: A hearing commences on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  factor       (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000058 ↔ tierA-000059 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing starts on Monday morning.
B: A hearing commences on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  factor       (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
one-sided A    —
one-sided B    —
```

### seedA-011 · tierA-000062 ↔ tierA-000063 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal starts after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  factor       (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
one-sided A    —
one-sided B    —
```

### seedA-011 · tierA-000062 ↔ tierA-000064 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal commences after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  factor       (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
one-sided A    —
one-sided B    —
```

### seedA-011 · tierA-000063 ↔ tierA-000064 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal starts after lunch.
B: The dress rehearsal commences after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Future e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  factor       (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000067 ↔ tierA-000068 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest begins in September.
B: The apple harvest starts in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 start)}
  factor       (Member e0 begin) ~ (Member e0 start)   [arg1 begin->start]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000067 ↔ tierA-000069 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest begins in September.
B: The apple harvest commences in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 commence)}
  factor       (Member e0 begin) ~ (Member e0 commence)   [arg1 begin->commence]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000068 ↔ tierA-000069 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest starts in September.
B: The apple harvest commences in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 commence)}
  factor       (Member e0 start) ~ (Member e0 commence)   [arg1 start->commence]
one-sided A    —
one-sided B    —
```

### seedA-013 · tierA-000072 ↔ tierA-000073 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A warden allows visitors on Sundays.
B: A warden permits visitors on Sundays.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' permit) (Member x0' warden) (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-014 · tierA-000076 ↔ tierA-000077 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A licence allows night deliveries.
B: A licence permits night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member x0 licence) (Theme e0 night_delivery)
substitution 1 anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 permit)}
  factor       (Member e0 allow) ~ (Member e0 permit)   [arg1 allow->permit]
one-sided A    —
one-sided B    —
```

### seedA-015 · tierA-000080 ↔ tierA-000081 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A curator allows photography in the hall.
B: A curator permits photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
substitution 1 anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 permit)}
  factor       (Member e0 allow) ~ (Member e0 permit)   [arg1 allow->permit]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000084 ↔ tierA-000085 · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recipe requires two eggs.
B: A recipe needs two eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member x0 recipe) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 require)) ~ (And (Holder $e0 $x0) (Member $e0 need)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 require)}
  B            {(Holder e0 x0)} {(Member e0 need)}
  factor       (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
  factor       (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000084 ↔ tierA-000086 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recipe requires two eggs.
B: Two eggs are required by a recipe.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
substitution 1 anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  factor       (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000085 ↔ tierA-000086 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recipe needs two eggs.
B: Two eggs are required by a recipe.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
substitution 1 anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000089 ↔ tierA-000090 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A permit requires a countersignature.
B: A permit needs a countersignature.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 require)}
  B            {(Member e0 need)}
  factor       (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000089 ↔ tierA-000091 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A permit requires a countersignature.
B: A countersignature is required by a permit.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000090 ↔ tierA-000091 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A permit needs a countersignature.
B: A countersignature is required by a permit.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Holder e0 x0) (Member x0 permit) (Member x1 countersignature) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
one-sided A    —
one-sided B    —
```

### seedA-018 · tierA-000094 ↔ tierA-000095 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A lathe requires monthly servicing.
B: A lathe needs monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
substitution 1 anchors e0
  A            {(Member e0 require)}
  B            {(Member e0 need)}
  factor       (Member e0 require) ~ (Member e0 need)   [arg1 require->need]
one-sided A    —
one-sided B    —
```

### seedA-018 · tierA-000094 ↔ tierA-000096 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A lathe requires monthly servicing.
B: Monthly servicing is required by a lathe.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
one-sided A    —
one-sided B    —
```

### seedA-018 · tierA-000095 ↔ tierA-000096 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A lathe needs monthly servicing.
B: Monthly servicing is required by a lathe.

```
renaming a->b  e0->e0 x0->x0
common         (Holder e0 x0) (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
substitution 1 anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000099 ↔ tierA-000100 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A rescue team abandons the search.
B: A rescue team gives up the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  factor       (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000099 ↔ tierA-000101 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A rescue team abandons the search.
B: The search is abandoned by a rescue team.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member e0 abandon) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000100 ↔ tierA-000101 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A rescue team gives up the search.
B: The search is abandoned by a rescue team.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  factor       (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
one-sided A    —
one-sided B    —
```

### seedA-020 · tierA-000104 ↔ tierA-000105 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A firm abandons its tender.
B: A firm gives up its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  factor       (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
one-sided A    —
one-sided B    —
```

### seedA-020 · tierA-000104 ↔ tierA-000106 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A firm abandons its tender.
B: Its tender is abandoned by a firm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-020 · tierA-000105 ↔ tierA-000106 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A firm gives up its tender.
B: Its tender is abandoned by a firm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  factor       (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000109 ↔ tierA-000110 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two climbers abandon the north route.
B: Two climbers give up the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 give_up)}
  factor       (Member e0 abandon) ~ (Member e0 give_up)   [arg1 abandon->give_up]
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000109 ↔ tierA-000111 · quality 1.00 · common 8 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: Two climbers abandon the north route.
B: The north route is abandoned by two climbers.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000110 ↔ tierA-000111 · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two climbers give up the north route.
B: The north route is abandoned by two climbers.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)}
  factor       (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000114 ↔ tierA-000115 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A board postpones the vote.
B: A board puts off the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  factor       (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000114 ↔ tierA-000116 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A board postpones the vote.
B: The vote is postponed by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 board) (Member x1 vote) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000115 ↔ tierA-000116 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A board puts off the vote.
B: The vote is postponed by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  factor       (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
one-sided A    —
one-sided B    —
```

### seedA-023 · tierA-000119 ↔ tierA-000120 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A ferry postpones its departure.
B: A ferry puts off its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  factor       (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000123 ↔ tierA-000124 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A club postpones the tournament.
B: A club puts off the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 put_off)}
  factor       (Member e0 postpone) ~ (Member e0 put_off)   [arg1 postpone->put_off]
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000123 ↔ tierA-000125 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A club postpones the tournament.
B: The tournament is postponed by a club.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000124 ↔ tierA-000125 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A club puts off the tournament.
B: The tournament is postponed by a club.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)}
  factor       (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000128 ↔ tierA-000129 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An auditor discovers an error in the ledger.
B: An auditor finds out an error in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
substitution 1 anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  factor       (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000128 ↔ tierA-000130 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: An auditor discovers an error in the ledger.
B: An error in the ledger is discovered by an auditor.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000129 ↔ tierA-000130 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An auditor finds out an error in the ledger.
B: An error in the ledger is discovered by an auditor.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger) (Stimulus e0 e1)
substitution 1 anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000133 ↔ tierA-000134 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A diver discovers a wreck off the point.
B: A diver finds out a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  factor       (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000133 ↔ tierA-000135 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A diver discovers a wreck off the point.
B: A wreck off the point is discovered by a diver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000134 ↔ tierA-000135 · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A diver finds out a wreck off the point.
B: A wreck off the point is discovered by a diver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
one-sided A    —
one-sided B    —
```

### seedA-027 · tierA-000138 ↔ tierA-000139 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An intern discovers the missing file.
B: An intern finds out the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 discover)}
  B            {(Member e0 find_out)}
  factor       (Member e0 discover) ~ (Member e0 find_out)   [arg1 discover->find_out]
one-sided A    —
one-sided B    —
```

### seedA-027 · tierA-000138 ↔ tierA-000140 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: An intern discovers the missing file.
B: The missing file is discovered by an intern.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-027 · tierA-000139 ↔ tierA-000140 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An intern finds out the missing file.
B: The missing file is discovered by an intern.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000143 ↔ tierA-000144 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An airline cancels the evening flight.
B: An airline calls off the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  factor       (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000143 ↔ tierA-000145 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An airline cancels the evening flight.
B: The evening flight is canceled by an airline.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member e0 cancel) (Member x0 airline) (Member x1 evening_flight)
substitution 1 anchors e0 x1
  A            {(Theme e0 x1)}
  B            {(Patient e0 x1)}
  factor       (Theme e0 x1) ~ (Patient e0 x1)   [head Theme->Patient]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000144 ↔ tierA-000145 · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An airline calls off the evening flight.
B: The evening flight is canceled by an airline.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 cancel) (Patient $e0 $x0)) ~ (And (Member $e0 call_off) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 call_off)} {(Theme e0 x1)}
  B            {(Member e0 cancel)} {(Patient e0 x1)}
  factor       (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
  factor       (Theme e0 x1) ~ (Patient e0 x1)   [head Theme->Patient]
one-sided A    —
one-sided B    —
```

### seedA-029 · tierA-000148 ↔ tierA-000149 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A council cancels the summer fair.
B: A council calls off the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  factor       (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
one-sided A    —
one-sided B    —
```

### seedA-029 · tierA-000148 ↔ tierA-000150 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A council cancels the summer fair.
B: The summer fair is canceled by a council.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-029 · tierA-000149 ↔ tierA-000150 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A council calls off the summer fair.
B: The summer fair is canceled by a council.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  factor       (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000153 ↔ tierA-000154 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tutor cancels the afternoon session.
B: A tutor calls off the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 call_off)}
  factor       (Member e0 cancel) ~ (Member e0 call_off)   [arg1 cancel->call_off]
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000153 ↔ tierA-000155 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A tutor cancels the afternoon session.
B: The afternoon session is canceled by a tutor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000154 ↔ tierA-000155 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tutor calls off the afternoon session.
B: The afternoon session is canceled by a tutor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)}
  factor       (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000158 ↔ tierA-000159 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An editor rejects a manuscript.
B: An editor turns down a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  factor       (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000158 ↔ tierA-000160 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: An editor rejects a manuscript.
B: A manuscript is rejected by an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000159 ↔ tierA-000160 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An editor turns down a manuscript.
B: A manuscript is rejected by an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  factor       (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000163 ↔ tierA-000164 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A bank rejects the loan application.
B: A bank turns down the loan application.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  factor       (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000163 ↔ tierA-000165 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A bank rejects the loan application.
B: The loan application is rejected by a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000164 ↔ tierA-000165 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A bank turns down the loan application.
B: The loan application is rejected by a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  factor       (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
one-sided A    —
one-sided B    —
```

### seedA-033 · tierA-000168 ↔ tierA-000169 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A panel rejects the proposal.
B: A panel turns down the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 turn_down)}
  factor       (Member e0 reject) ~ (Member e0 turn_down)   [arg1 reject->turn_down]
one-sided A    —
one-sided B    —
```

### seedA-033 · tierA-000168 ↔ tierA-000170 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A panel rejects the proposal.
B: The proposal is rejected by a panel.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-033 · tierA-000169 ↔ tierA-000170 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A panel turns down the proposal.
B: The proposal is rejected by a panel.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  factor       (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
one-sided A    —
one-sided B    —
```

### seedA-034 · tierA-000173 ↔ tierA-000174 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A shepherd walks along the ridge.
B: A shepherd takes a walk along the ridge.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Location e0 x1) (Member e0 walk) (Member x0 shepherd) (Member x1 ridge)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' take) (Theme e0' e0)}@e0,x0 ↔
```

### seedA-035 · tierA-000177 ↔ tierA-000178 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A nurse walks through the ward.
B: A nurse takes a walk through the ward.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Location e0 x1) (Member e0 walk) (Member x0 nurse) (Member x1 ward)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' take) (Theme e0' e0)}@e0,x0 ↔
```

### seedA-036 · tierA-000181 ↔ tierA-000182 · quality 0.62 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Two children walk to the pier.
B: Two children take a walk to the pier.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Cardinality x0 2) (Goal e0 x1) (GroupOf x0 child) (Member e0 walk) (Member x1 pier)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' take) (Patient e0' e0)}@e0,x0 ↔
```

### seedA-037 · tierA-000185 ↔ tierA-000186 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee makes a decision on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 make)} {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Patient e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-037 · tierA-000185 ↔ tierA-000187 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee reaches a decision on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 reach)} {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Theme e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-037 · tierA-000186 ↔ tierA-000187 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A committee makes a decision on a new roof.
B: A committee reaches a decision on a new roof.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 committee) (Member x1 new) (Member x1 roof) (Theme e1 x1)
substitution 1 anchors e0 e1   joint key: (And (Member $e0 reach) (Theme $e0 $e1)) ~ (And (Member $e0 make) (Patient $e0 $e1)) @$e0,$e1
  A            {(Member e0 make)} {(Patient e0 e1)}
  B            {(Member e0 reach)} {(Theme e0 e1)}
  factor       (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
  factor       (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000190 ↔ tierA-000191 · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge decides the case.
B: A judge makes a decision on the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 make)} {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Patient e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000190 ↔ tierA-000192 · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge decides the case.
B: A judge reaches a decision on the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 reach)} {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Theme e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000190 ↔ tierA-000193 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A judge decides the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000191 ↔ tierA-000192 · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A judge makes a decision on the case.
B: A judge reaches a decision on the case.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 judge) (Member x1 case) (Theme e1 x1)
substitution 1 anchors e0 e1   joint key: (And (Member $e0 reach) (Theme $e0 $e1)) ~ (And (Member $e0 make) (Patient $e0 $e1)) @$e0,$e1
  A            {(Member e0 make)} {(Patient e0 e1)}
  B            {(Member e0 reach)} {(Theme e0 e1)}
  factor       (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
  factor       (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000191 ↔ tierA-000193 · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge makes a decision on the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 make)} {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Theme e0 x1)}
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000192 ↔ tierA-000193 · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge reaches a decision on the case.
B: The case is decided by a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 reach)} {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Theme e0 x1)}
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000196 ↔ tierA-000197 · quality 0.33 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A family decides to move north.
B: A family makes a decision to move north.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 family)
substitution 1 anchors e0 x0   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) ~ (And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Member e0 make)} {(Member e1' decision) (Patient e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  factor       (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
  A only       (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
  B only       (Member e1' decision) (Patient e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000196 ↔ tierA-000198 · quality 0.33 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A family decides to move north.
B: A family reaches a decision to move north.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 family)
substitution 1 anchors e0 x0   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) ~ (And (Member $e0 decide) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Member e0 reach)} {(Member e1' decision) (Theme e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  factor       (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
  A only       (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
  B only       (Member e1' decision) (Theme e0 e1') (Theme e1' (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000197 ↔ tierA-000198 · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A family makes a decision to move north.
B: A family reaches a decision to move north.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 family) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))
substitution 1 anchors e0 e1   joint key: (And (Member $e0 reach) (Theme $e0 $e1)) ~ (And (Member $e0 make) (Patient $e0 $e1)) @$e0,$e1
  A            {(Member e0 make)} {(Patient e0 e1)}
  B            {(Member e0 reach)} {(Theme e0 e1)}
  factor       (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
  factor       (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000201 ↔ tierA-000202 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board decides next year's budget.
B: A board makes a decision on next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 make)} {(Member e1' decision) (Patient e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 make)   [arg1 decide->make]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Patient e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000201 ↔ tierA-000203 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board decides next year's budget.
B: A board reaches a decision on next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 decide)} {(Theme e0 x1)}
  B            {(Member e0 reach)} {(Member e1' decision) (Theme e0 e1') (Theme e1' x1)}
  factor       (Member e0 decide) ~ (Member e0 reach)   [arg1 decide->reach]
  A only       (Theme e0 x1)
  B only       (Member e1' decision) (Theme e0 e1') (Theme e1' x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000201 ↔ tierA-000204 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A board decides next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000202 ↔ tierA-000203 · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A board makes a decision on next year's budget.
B: A board reaches a decision on next year's budget.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Agent e0 x0) (Member e1 decision) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e1 x1)
substitution 1 anchors e0 e1   joint key: (And (Member $e0 reach) (Theme $e0 $e1)) ~ (And (Member $e0 make) (Patient $e0 $e1)) @$e0,$e1
  A            {(Member e0 make)} {(Patient e0 e1)}
  B            {(Member e0 reach)} {(Theme e0 e1)}
  factor       (Member e0 make) ~ (Member e0 reach)   [arg1 make->reach]
  factor       (Patient e0 e1) ~ (Theme e0 e1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000202 ↔ tierA-000204 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board makes a decision on next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 make)} {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Theme e0 x1)}
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000203 ↔ tierA-000204 · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board reaches a decision on next year's budget.
B: Next year's budget is decided by a board.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 reach)} {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Theme e0 x1)}
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000207 ↔ tierA-000208 · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A clerk answers the query.
B: A clerk gives an answer to the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 answer)} {(Theme e0 x1)}
  B            {(Member e0 give)} {(Member x2' answer) (Theme e0 x2')} {(Recipient e0 x1)}
  factor       (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
  factor       (Theme e0 x1) ~ (Recipient e0 x1)   [head Theme->Recipient]
  B only       (Member x2' answer) (Theme e0 x2')
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000207 ↔ tierA-000209 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A clerk answers the query.
B: The query is answered by a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000208 ↔ tierA-000209 · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A clerk gives an answer to the query.
B: The query is answered by a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 give)} {(Member x2 answer) (Theme e0 x2)} {(Recipient e0 x1)}
  B            {(Member e0 answer)} {(Theme e0 x1)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  A only       (Member x2 answer) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-042 · tierA-000212 ↔ tierA-000213 · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A pilot answers the tower.
B: A pilot gives an answer to the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 answer)} {(Theme e0 x1)}
  B            {(Member e0 give)} {(Member x2' answer) (Theme e0 x2')} {(Recipient e0 x1)}
  factor       (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
  factor       (Theme e0 x1) ~ (Recipient e0 x1)   [head Theme->Recipient]
  B only       (Member x2' answer) (Theme e0 x2')
one-sided A    —
one-sided B    —
```

### seedA-042 · tierA-000212 ↔ tierA-000214 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A pilot answers the tower.
B: The tower is answered by a pilot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-042 · tierA-000213 ↔ tierA-000214 · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A pilot gives an answer to the tower.
B: The tower is answered by a pilot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 give)} {(Member x2 answer) (Theme e0 x2)} {(Recipient e0 x1)}
  B            {(Member e0 answer)} {(Theme e0 x1)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  A only       (Member x2 answer) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-043 · tierA-000217 ↔ tierA-000218 · quality 0.43 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A vet answers the caller.
B: A vet gives an answer to the caller.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 vet) (Theme e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 give) (Member $x0 caller) (Recipient $e0 $x0)) ~ (Member $e0 answer) @$e0
  A            {(Member e0 answer)}
  B            {(Member e0 give)} {(Member x2' caller) (Recipient e0 x2')}
  factor       (Member e0 answer) ~ (Member e0 give)   [arg1 answer->give]
  B only       (Member x2' caller) (Recipient e0 x2')
substitution 2 anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 answer)}
  factor       (Member x1 caller) ~ (Member x1 answer)   [arg1 caller->answer]
one-sided A    —
one-sided B    —
```

### seedA-043 · tierA-000217 ↔ tierA-000219 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A vet answers the caller.
B: The caller is answered by a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 vet) (Member x1 caller) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-043 · tierA-000218 ↔ tierA-000219 · quality 0.43 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A vet gives an answer to the caller.
B: The caller is answered by a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 vet) (Theme e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 give) (Member $x0 caller) (Recipient $e0 $x0)) ~ (Member $e0 answer) @$e0
  A            {(Member e0 give)} {(Member x2 caller) (Recipient e0 x2)}
  B            {(Member e0 answer)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  A only       (Member x2 caller) (Recipient e0 x2)
substitution 2 anchors x1
  A            {(Member x1 answer)}
  B            {(Member x1 caller)}
  factor       (Member x1 answer) ~ (Member x1 caller)   [arg1 answer->caller]
one-sided A    —
one-sided B    —
```

### seedA-044 · tierA-000222 ↔ tierA-000223 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A storm destroys the greenhouse.
B: A storm causes the destruction of the greenhouse.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e0 x1)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}@e0,x0 ↔
```

### seedA-044 · tierA-000222 ↔ tierA-000224 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A storm destroys the greenhouse.
B: The greenhouse is destroyed by a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-044 · tierA-000223 ↔ tierA-000224 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A storm causes the destruction of the greenhouse.
B: The greenhouse is destroyed by a storm.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 storm) (Member x1 greenhouse) (Patient e1 x1)
one-sided A    {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}@e1,x0 ↔
one-sided B    {(Agent e1 x0)}@e1,x0 ↔
```

### seedA-045 · tierA-000227 ↔ tierA-000228 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A fire destroys the archive.
B: A fire causes the destruction of the archive.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 fire) (Member x1 archive) (Patient e0 x1)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}@e0,x0 ↔
```

### seedA-045 · tierA-000227 ↔ tierA-000229 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A fire destroys the archive.
B: The archive is destroyed by a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 fire) (Member x1 archive) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000228 ↔ tierA-000229 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A fire causes the destruction of the archive.
B: The archive is destroyed by a fire.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 fire) (Member x1 archive) (Patient e1 x1)
one-sided A    {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}@e1,x0 ↔
one-sided B    {(Agent e1 x0)}@e1,x0 ↔
```

### seedA-046 · tierA-000232 ↔ tierA-000233 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A flood destroys the footbridge.
B: A flood causes the destruction of the footbridge.

```
renaming a->b  e0->e1 x0->x0 x1->x1
common         (Member e0 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e0 x1)
one-sided A    {(Agent e0 x0)}@e0,x0 ↔
one-sided B    {(Agent e0' x0) (Member e0' cause) (Theme e0' e0)}@e0,x0 ↔
```

### seedA-046 · tierA-000232 ↔ tierA-000234 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A flood destroys the footbridge.
B: The footbridge is destroyed by a flood.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-046 · tierA-000233 ↔ tierA-000234 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A flood causes the destruction of the footbridge.
B: The footbridge is destroyed by a flood.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         (Member e1 destroy) (Member x0 flood) (Member x1 footbridge) (Patient e1 x1)
one-sided A    {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)}@e1,x0 ↔
one-sided B    {(Agent e1 x0)}@e1,x0 ↔
```

### seedA-047 · tierA-000237 ↔ tierA-000238 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The freight arrives at noon.
B: The arrival of the freight is at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
one-sided A    —
one-sided B    —
```

### seedA-048 · tierA-000241 ↔ tierA-000242 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A delegation arrives on Thursday.
B: The arrival of a delegation is on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
substitution 1 anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 arrival)}
  factor       (Member e0 arrive) ~ (Member e0 arrival)   [arg1 arrive->arrival]
one-sided A    —
one-sided B    —
```

### seedA-049 · tierA-000245 ↔ tierA-000246 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The soil samples arrive by post.
B: The soil samples' arrival is by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
substitution 1 anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 arrival)}
  factor       (Member e0 arrive) ~ (Member e0 arrival)   [arg1 arrive->arrival]
one-sided A    —
one-sided B    —
```

### seedA-050 · tierA-000249 ↔ tierA-000250 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An old mare dies during the winter.
B: An old mare kicks the bucket during the winter.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-051 · tierA-000253 ↔ tierA-000254 · quality 0.75 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The founder dies at ninety.
B: The founder kicks the bucket at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member x0 founder) (Patient e0 x0)
substitution 1 anchors e0
  A            {(Member e0 die)}
  B            {(Member e0 kick_the_bucket)}
  factor       (Member e0 die) ~ (Member e0 kick_the_bucket)   [arg1 die->kick_the_bucket]
one-sided A    —
one-sided B    —
```

### seedA-052 · tierA-000257 ↔ tierA-000258 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The last elm dies that autumn.
B: The last elm kicks the bucket that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Patient e0 x0) (Time e0 that_autumn)
substitution 1 anchors e0
  A            {(Member e0 die)}
  B            {(Member e0 kick_the_bucket)}
  factor       (Member e0 die) ~ (Member e0 kick_the_bucket)   [arg1 die->kick_the_bucket]
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000261 ↔ tierA-000262 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A trainer gives a recruit a whistle.
B: A recruit receives a whistle from a trainer.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 give)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 receive)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000261 ↔ tierA-000263 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A trainer gives a recruit a whistle.
B: A trainer gives a whistle to a recruit.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000262 ↔ tierA-000263 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recruit receives a whistle from a trainer.
B: A trainer gives a whistle to a recruit.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 recruit) (Member x1 trainer) (Member x2 whistle) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 receive)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 give)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000266 ↔ tierA-000267 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: Each member receives a card from a library.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000266 ↔ tierA-000268 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: A library gives a card to each member.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000267 ↔ tierA-000268 · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: A library gives a card to each member.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000271 ↔ tierA-000272 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A foreman gives a driver the manifest.
B: A driver receives the manifest from a foreman.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Member x0 foreman) (Member x1 manifest) (Member x2 driver) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 give)} {(Recipient e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 receive)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
  factor       (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000271 ↔ tierA-000273 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A foreman gives a driver the manifest.
B: A foreman gives the manifest to a driver.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x1 manifest) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000272 ↔ tierA-000273 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A driver receives the manifest from a foreman.
B: A foreman gives the manifest to a driver.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 driver) (Member x1 foreman) (Member x2 manifest) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 receive)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 give)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-056 · tierA-000276 ↔ tierA-000277 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A school gives the winner a medal.
B: The winner receives a medal from a school.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 school) (Member x1 winner) (Member x2 medal) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 give)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 receive)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 give) ~ (Member e0 receive)   [arg1 give->receive]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-056 · tierA-000276 ↔ tierA-000278 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A school gives the winner a medal.
B: A school gives a medal to the winner.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-056 · tierA-000277 ↔ tierA-000278 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The winner receives a medal from a school.
B: A school gives a medal to the winner.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 winner) (Member x1 school) (Member x2 medal) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 receive)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 give)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000281 ↔ tierA-000282 · quality 0.50 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A potter teaches an apprentice glazing.
B: An apprentice learns glazing from a potter.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 potter) (Member x1 apprentice) (Theme e0 glazing)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 teach)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 learn)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000281 ↔ tierA-000283 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A potter teaches an apprentice glazing.
B: A potter teaches glazing to an apprentice.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000282 ↔ tierA-000283 · quality 0.50 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An apprentice learns glazing from a potter.
B: A potter teaches glazing to an apprentice.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 learn)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 teach)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000286 ↔ tierA-000287 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A coach teaches the squad a drill.
B: The squad learns a drill from a coach.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 coach) (Member x1 drill) (Member x2 squad) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 teach)} {(Recipient e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 learn)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
  factor       (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000286 ↔ tierA-000288 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A coach teaches the squad a drill.
B: A coach teaches a drill to the squad.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Member x2 squad) (Recipient e0 x2) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000287 ↔ tierA-000288 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The squad learns a drill from a coach.
B: A coach teaches a drill to the squad.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 squad) (Member x1 drill) (Member x2 coach) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 learn)} {(Source e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 teach)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-059 · tierA-000291 ↔ tierA-000292 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An elder teaches the children a song.
B: The children learn a song from an elder.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (GroupOf x1 child) (Member x0 elder) (Member x2 song) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 teach)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 learn)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 teach) ~ (Member e0 learn)   [arg1 teach->learn]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-059 · tierA-000291 ↔ tierA-000293 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: An elder teaches the children a song.
B: An elder teaches a song to the children.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-059 · tierA-000292 ↔ tierA-000293 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The children learn a song from an elder.
B: An elder teaches a song to the children.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (GroupOf x0 child) (Member x1 song) (Member x2 elder) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 learn)} {(Source e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 teach)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000296 ↔ tierA-000297 · quality 0.50 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A neighbour lends Ravi a ladder.
B: Ravi borrows a ladder from a neighbour.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) ~ (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Member e0 lend)} {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)} {(Member e0 borrow)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
  factor       (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000296 ↔ tierA-000298 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A neighbour lends Ravi a ladder.
B: A neighbour lends a ladder to Ravi.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Recipient e0 ravi) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000297 ↔ tierA-000298 · quality 0.50 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Ravi borrows a ladder from a neighbour.
B: A neighbour lends a ladder to Ravi.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) ~ (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0
  A            {(Agent e0 ravi)} {(Member e0 borrow)} {(Source e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 lend)} {(Recipient e0 ravi)}
  factor       (Agent e0 ravi) ~ (Member e0 lend)   [head Agent->Member; arg1 ravi->lend]
  factor       (Member e0 borrow) ~ (Recipient e0 ravi)   [head Member->Recipient; arg1 borrow->ravi]
  factor       (Source e0 x0) ~ (Agent e0 x0)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000301 ↔ tierA-000302 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot lends the crew a generator.
B: The crew borrows a generator from the depot.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 depot) (Member x1 generator) (Member x2 crew) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 lend)} {(Recipient e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 borrow)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
  factor       (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000301 ↔ tierA-000303 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The depot lends the crew a generator.
B: The depot lends a generator to the crew.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x0 depot) (Member x1 generator) (Member x2 crew) (Recipient e0 x2) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000302 ↔ tierA-000303 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The crew borrows a generator from the depot.
B: The depot lends a generator to the crew.

```
renaming a->b  e0->e0 x0->x2 x1->x1 x2->x0
common         (Member x0 crew) (Member x1 generator) (Member x2 depot) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 borrow)} {(Source e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 lend)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
  factor       (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-062 · tierA-000306 ↔ tierA-000307 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The museum lends the gallery a painting.
B: The gallery borrows a painting from the museum.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 lend)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 borrow)} {(Source e0 x0)}
  factor       (Agent e0 x0) ~ (Source e0 x0)   [head Agent->Source]
  factor       (Member e0 lend) ~ (Member e0 borrow)   [arg1 lend->borrow]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-062 · tierA-000306 ↔ tierA-000308 · quality 1.00 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: The museum lends the gallery a painting.
B: The museum lends a painting to the gallery.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Member x2 painting) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    —
```

### seedA-062 · tierA-000307 ↔ tierA-000308 · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The gallery borrows a painting from the museum.
B: The museum lends a painting to the gallery.

```
renaming a->b  e0->e0 x0->x1 x1->x0 x2->x2
common         (Member x0 gallery) (Member x1 museum) (Member x2 painting) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 borrow)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 lend)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
one-sided A    —
one-sided B    —
```

### seedA-063 · tierA-000311 ↔ tierA-000312 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Ana works with Bo on the mural.
B: Ana and Bo work on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (Member e0 work) (Member x0 mural) (Theme e0 x0)
one-sided A    {(CoAgent e0 bo)}@e0
one-sided B    {(Agent e1' bo) (Member e1' work) (Theme e1' x0)}@x0
```

### seedA-064 · tierA-000315 ↔ tierA-000316 · quality 0.67 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A welder works with a fitter on the frame.
B: A welder and a fitter work on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
one-sided A    {(CoAgent e0 x1)}@e0,x1
one-sided B    {(Agent e1' x1) (Location e1' x2) (Member e1' work)}@x1,x2
```

### seedA-065 · tierA-000319 ↔ tierA-000320 · quality 0.67 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A biologist works with a ranger on the survey.
B: A biologist and a ranger work on the survey.

```
renaming a->b  e0->e1 x0->x1 x1->x0 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
one-sided A    {(CoAgent e0 x1)}@e0,x1
one-sided B    {(Agent e0' x1) (Location e0' x2) (Member e0' work)}@x1,x2
```

### seedA-066 · tierA-000323 ↔ tierA-000324 · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Dara works with Nils on the ledger.
B: Dara and Nils work on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (Location e0 x0) (Member e0 work) (Member x0 ledger)
one-sided A    {(CoAgent e0 nils)}@e0
one-sided B    {(Agent e1' nils) (Location e1' x0) (Member e1' work)}@x0
```

### seedA-067 · tierA-000327 ↔ tierA-000328 · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A crate is large in size.
B: A crate is big in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  factor       (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
one-sided A    —
one-sided B    —
```

### seedA-068 · tierA-000331 ↔ tierA-000332 · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The hatch is large in size.
B: The hatch is big in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  factor       (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
one-sided A    —
one-sided B    —
```

### seedA-069 · tierA-000335 ↔ tierA-000336 · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The new bench is large.
B: The new bench is big.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 big)}
  factor       (Member x0 large) ~ (Member x0 big)   [arg1 large->big]
one-sided A    —
one-sided B    —
```

### seedA-070 · tierA-000339 ↔ tierA-000340 · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The boiler is huge in size.
B: The boiler is very big in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
substitution 1 anchors x0   joint key: (Member $x0 huge) ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Member x0 huge)}
  B            {(Degree x0 big very)} {(Member x0 big)}
  factor       (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
  B only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-071 · tierA-000343 ↔ tierA-000344 · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The skylight is huge in size.
B: The skylight is very big in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
substitution 1 anchors x0   joint key: (Member $x0 huge) ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Member x0 huge)}
  B            {(Degree x0 big very)} {(Member x0 big)}
  factor       (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
  B only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-072 · tierA-000347 ↔ tierA-000348 · quality 0.50 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The spoil mound is huge.
B: The spoil mound is very big.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
substitution 1 anchors x0   joint key: (Member $x0 huge) ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Member x0 huge)}
  B            {(Degree x0 big very)} {(Member x0 big)}
  factor       (Member x0 huge) ~ (Member x0 big)   [arg1 huge->big]
  B only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-073 · tierA-000351 ↔ tierA-000352 · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The repair is difficult.
B: The repair is hard.

```
renaming a->b  x0->x0
common         (Member x0 repair)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  factor       (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
one-sided A    —
one-sided B    —
```

### seedA-074 · tierA-000355 ↔ tierA-000356 · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The calibration is difficult.
B: The calibration is hard.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  factor       (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
one-sided A    —
one-sided B    —
```

### seedA-075 · tierA-000359 ↔ tierA-000360 · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The descent is difficult.
B: The descent is hard.

```
renaming a->b  x0->x0
common         (Member x0 descent)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 hard)}
  factor       (Member x0 difficult) ~ (Member x0 hard)   [arg1 difficult->hard]
one-sided A    —
one-sided B    —
```

### seedA-076 · tierA-000363 ↔ tierA-000364 · quality 0.50 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The night crew is exhausted.
B: The night crew is very tired.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
substitution 1 anchors x0   joint key: (Member $x0 exhausted) ~ (And (Degree $x0 tired very) (Member $x0 tired)) @$x0
  A            {(Member x0 exhausted)}
  B            {(Degree x0 tired very)} {(Member x0 tired)}
  factor       (Member x0 exhausted) ~ (Member x0 tired)   [arg1 exhausted->tired]
  B only       (Degree x0 tired very)
one-sided A    —
one-sided B    —
```

### seedA-077 · tierA-000367 ↔ tierA-000368 · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The courier is exhausted.
B: The courier is very tired.

```
renaming a->b  x0->x0
common         (Member x0 courier)
substitution 1 anchors x0   joint key: (Member $x0 exhausted) ~ (And (Degree $x0 tired very) (Member $x0 tired)) @$x0
  A            {(Member x0 exhausted)}
  B            {(Degree x0 tired very)} {(Member x0 tired)}
  factor       (Member x0 exhausted) ~ (Member x0 tired)   [arg1 exhausted->tired]
  B only       (Degree x0 tired very)
one-sided A    —
one-sided B    —
```

### seedA-078 · tierA-000371 ↔ tierA-000372 · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The divers are all exhausted.
B: The divers are all very tired.

```
renaming a->b  
common         —
one-sided A    {(Inheritance diver exhausted)}
one-sided B    {(Degree diver tired very) (Inheritance diver tired)}
```

### seedA-079 · tierA-000375 ↔ tierA-000376 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician signs the chart.
B: A doctor signs the chart.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x1 chart) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  factor       (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000375 ↔ tierA-000377 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A physician signs the chart.
B: The chart is signed by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x0 physician) (Member x1 chart) (Patient e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000376 ↔ tierA-000377 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor signs the chart.
B: The chart is signed by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Member x1 chart) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000380 ↔ tierA-000381 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician examines the samples.
B: A doctor examines the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  factor       (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000380 ↔ tierA-000382 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A physician examines the samples.
B: The samples are examined by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Member x0 physician) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000381 ↔ tierA-000382 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor examines the samples.
B: The samples are examined by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member e0 examine) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000385 ↔ tierA-000386 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician orders a second scan.
B: A doctor orders a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 doctor)}
  factor       (Member x0 physician) ~ (Member x0 doctor)   [arg1 physician->doctor]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000385 ↔ tierA-000387 · quality 1.00 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A physician orders a second scan.
B: A second scan is ordered by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000386 ↔ tierA-000387 · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor orders a second scan.
B: A second scan is ordered by a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000390 ↔ tierA-000391 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An automobile blocks the lane.
B: A car blocks the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  factor       (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000390 ↔ tierA-000392 · quality 1.00 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: An automobile blocks the lane.
B: The lane is blocked by an automobile.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x0 automobile) (Member x1 lane) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000391 ↔ tierA-000392 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A car blocks the lane.
B: The lane is blocked by an automobile.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 car)}
  B            {(Member x0 automobile)}
  factor       (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
one-sided A    —
one-sided B    —
```

### seedA-083 · tierA-000395 ↔ tierA-000396 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An automobile waits at the gate.
B: A car waits at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
substitution 1 anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  factor       (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
one-sided A    —
one-sided B    —
```

### seedA-084 · tierA-000399 ↔ tierA-000400 · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An automobile crosses the bridge.
B: A car crosses the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 cross) (Member x1 bridge) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 automobile)}
  B            {(Member x0 car)}
  factor       (Member x0 automobile) ~ (Member x0 car)   [arg1 automobile->car]
one-sided A    —
one-sided B    —
```

## Control pairs

### seedA-001 · tierA-000001 ↔ tierA-000006 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot bought two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000001 ↔ tierA-000007 · control: quantity-change · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot bought two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  factor       (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000002 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot purchased two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 buy) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 purchase)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000002 ↔ tierA-000007 · control: quantity-change · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot purchased two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  factor       (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
substitution 2 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000003 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot acquired two forklifts.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member x0 depot) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 acquire) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 acquire)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000003 ↔ tierA-000007 · control: quantity-change · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The depot acquired two forklifts.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  factor       (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
substitution 2 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000004 ↔ tierA-000006 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two forklifts were sold to the depot.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 forklift) (Member x1 depot) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) ~ (And (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Member e0 sell)} {(Recipient e0 x1)} {(Theme e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 buy)} {(Theme e0 x1)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  factor       (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000004 ↔ tierA-000007 · control: quantity-change · quality 0.57 · common 4 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two forklifts were sold to the depot.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x0 forklift) (Member x1 depot) (Past e0) (Theme e0 x0)
substitution 1 anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  factor       (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
substitution 2 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000005 ↔ tierA-000006 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two forklifts were bought by the depot.
B: Two forklifts bought the depot.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-001 · tierA-000005 ↔ tierA-000007 · control: quantity-change · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two forklifts were bought by the depot.
B: The depot bought three forklifts.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 forklift) (Member e0 buy) (Member x0 depot) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  factor       (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000013 · control: quantity-change · quality 0.78 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The school bought a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 projector) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 projector)) @$x0
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)} {(GroupOf x2 projector)}
  factor       (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
  B only       (GroupOf x2 projector)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000008 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The school bought a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
one-sided B    {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000009 ↔ tierA-000013 · control: quantity-change · quality 0.67 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The school purchased a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
substitution 2 anchors x2   joint key: (Member $x0 projector) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 projector)) @$x0
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)} {(GroupOf x2 projector)}
  factor       (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
  B only       (GroupOf x2 projector)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000009 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The school purchased a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 purchase) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
one-sided B    {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000010 ↔ tierA-000013 · control: quantity-change · quality 0.67 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The school acquired a projector for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
substitution 2 anchors x2   joint key: (Member $x0 projector) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 projector)) @$x0
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)} {(GroupOf x2 projector)}
  factor       (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
  B only       (GroupOf x2 projector)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000010 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The school acquired a projector for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 acquire) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
one-sided B    {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-002 · tierA-000011 ↔ tierA-000013 · control: quantity-change · quality 0.56 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A projector was sold to the school for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (Beneficiary e0 x0) (Member x0 hall) (Member x2 school) (Past e0) (Theme e0 x1)
substitution 1 anchors e0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x2) ~ (Agent e0 x2)   [head Recipient->Agent]
substitution 2 anchors x1   joint key: (Member $x0 projector) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 projector)) @$x0
  A            {(Member x1 projector)}
  B            {(Cardinality x1 2)} {(GroupOf x1 projector)}
  factor       (Member x1 projector) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 projector->2]
  B only       (GroupOf x1 projector)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000011 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A projector was sold to the school for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x2 x1->x0 x2->x1
common         (Member x0 hall) (Member x2 school)
one-sided A    {(Beneficiary e0 x0) (Member e0 sell) (Member x1 projector) (Past e0) (Recipient e0 x2) (Theme e0 x1)}@x0,x2
one-sided B    {(And (Agent x1 x2) (Beneficiary x1 x0) (Member x1 buy) (Member x3' projector) (Past x1) (Theme x1 x3')) ~NEG}@x0,x2
```

### seedA-002 · tierA-000012 ↔ tierA-000013 · control: quantity-change · quality 0.78 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A projector was bought by the school for the hall.
B: The school bought two projectors for the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x0 school) (Member x1 hall) (Past e0) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 projector) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 projector)) @$x0
  A            {(Member x2 projector)}
  B            {(Cardinality x2 2)} {(GroupOf x2 projector)}
  factor       (Member x2 projector) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 projector->2]
  B only       (GroupOf x2 projector)
one-sided A    —
one-sided B    —
```

### seedA-002 · tierA-000012 ↔ tierA-000014 · control: negation · quality 0.25 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A projector was bought by the school for the hall.
B: The school did not buy a projector for the hall.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 school) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Beneficiary e0 x1) (Member e0 buy) (Member x2 projector) (Past e0) (Theme e0 x2)}@x0,x1
one-sided B    {(And (Agent x2 x0) (Beneficiary x2 x1) (Member x2 buy) (Member x3' projector) (Past x2) (Theme x2 x3')) ~NEG}@x0,x1
```

### seedA-003 · tierA-000015 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The chef bought several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
one-sided A    {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000015 ↔ tierA-000021 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef bought several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000016 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The chef purchased several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
one-sided A    {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 purchase) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000016 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef purchased several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 purchase) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 buy) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 purchase)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000017 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The chef acquired several crates of lemons.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
one-sided A    {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 acquire) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000017 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The chef acquired several crates of lemons.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member x0 chef) (Member x1 crate) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 acquire) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 acquire)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000018 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: Several crates of lemons were sold to the chef.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x0 x1->x1
common         (Member x1 chef)
one-sided A    {(GroupOf x0 lemon) (Member e0 sell) (Member x0 crate) (Past e0) (Recipient e0 x1) (Theme e0 x0)}@x1
one-sided B    {(And (Agent x0 x1) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x0 buy) (Member x2' crate) (Past x0) (Theme x0 x2')) ~NEG}@x1
```

### seedA-003 · tierA-000018 ↔ tierA-000021 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Several crates of lemons were sold to the chef.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 lemon) (Member x0 crate) (Member x1 chef) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Theme $e0 $x1)) ~ (And (Member $e0 sell) (Recipient $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Member e0 sell)} {(Recipient e0 x1)} {(Theme e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 buy)} {(Theme e0 x1)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  factor       (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-003 · tierA-000019 ↔ tierA-000020 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: Several crates of lemons were bought by the chef.
B: The chef did not buy several crates of lemons.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 chef)
one-sided A    {(Agent e0 x0) (GroupOf x1 lemon) (Member e0 buy) (Member x1 crate) (Past e0) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (CardinalityPhrase x2' "several") (GroupOf x2' lemon) (Member x1 buy) (Member x2' crate) (Past x1) (Theme x1 x2')) ~NEG}@x0
```

### seedA-003 · tierA-000019 ↔ tierA-000021 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Several crates of lemons were bought by the chef.
B: Several crates of lemons bought the chef.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 lemon) (Member e0 buy) (Member x0 chef) (Member x1 crate) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000027 · control: participant-swap · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio bought a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000022 ↔ tierA-000028 · control: quantity-change · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio bought a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 3 buy)}
  factor       (Ordinal x1 2 buy) ~ (Ordinal x1 3 buy)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000023 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · 1 substitution(s) / 4 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio purchased a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 purchase) (Ordinal $x1 <num> purchase) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 buy) (Ordinal $x1 <num> buy) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 purchase)} {(Ordinal x1 2 purchase)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Ordinal x1 2 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
  factor       (Ordinal x1 2 purchase) ~ (Ordinal x1 2 buy)   [arg2 purchase->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000023 ↔ tierA-000028 · control: quantity-change · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio purchased a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 purchase)}
  B            {(Member e0 buy)}
  factor       (Member e0 purchase) ~ (Member e0 buy)   [arg1 purchase->buy]
substitution 2 anchors x1
  A            {(Ordinal x1 2 purchase)}
  B            {(Ordinal x1 3 buy)}
  factor       (Ordinal x1 2 purchase) ~ (Ordinal x1 3 buy)   [arg1 2->3; arg2 purchase->buy]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000024 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · 1 substitution(s) / 4 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio acquired a second kiln.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 acquire) (Ordinal $x0 <num> acquire) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 acquire)} {(Ordinal x1 2 acquire)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)} {(Ordinal x1 2 buy)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
  factor       (Ordinal x1 2 acquire) ~ (Ordinal x1 2 buy)   [arg2 acquire->buy]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000024 ↔ tierA-000028 · control: quantity-change · quality 0.75 · common 6 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The pottery studio acquired a second kiln.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 acquire)}
  B            {(Member e0 buy)}
  factor       (Member e0 acquire) ~ (Member e0 buy)   [arg1 acquire->buy]
substitution 2 anchors x1
  A            {(Ordinal x1 2 acquire)}
  B            {(Ordinal x1 3 buy)}
  factor       (Ordinal x1 2 acquire) ~ (Ordinal x1 3 buy)   [arg1 2->3; arg2 acquire->buy]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000025 ↔ tierA-000027 · control: participant-swap · quality 0.50 · common 4 · 1 substitution(s) / 4 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second kiln was sold to the pottery studio.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy) (Ordinal $x0 <num> buy) (Theme $e0 $x1)) ~ (And (Member $e0 sell) (Ordinal $x0 <num> sell) (Recipient $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Member e0 sell)} {(Ordinal x0 2 sell)} {(Recipient e0 x1)} {(Theme e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 buy)} {(Ordinal x0 2 buy)} {(Theme e0 x1)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Ordinal x0 2 sell) ~ (Ordinal x0 2 buy)   [arg2 sell->buy]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  factor       (Theme e0 x0) ~ (Agent e0 x0)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000025 ↔ tierA-000028 · control: quantity-change · quality 0.62 · common 5 · 2 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second kiln was sold to the pottery studio.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member x0 kiln) (Member x1 pottery_studio) (Past e0) (Theme e0 x0)
substitution 1 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 buy)) ~ (And (Member $e0 sell) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 sell)} {(Recipient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 buy)}
  factor       (Member e0 sell) ~ (Member e0 buy)   [arg1 sell->buy]
  factor       (Recipient e0 x1) ~ (Agent e0 x1)   [head Recipient->Agent]
substitution 2 anchors x0
  A            {(Ordinal x0 2 sell)}
  B            {(Ordinal x0 3 buy)}
  factor       (Ordinal x0 2 sell) ~ (Ordinal x0 3 buy)   [arg1 2->3; arg2 sell->buy]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000026 ↔ tierA-000027 · control: participant-swap · quality 0.75 · common 6 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second kiln was bought by the pottery studio.
B: A second kiln bought the pottery studio.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Ordinal x1 2 buy) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-004 · tierA-000026 ↔ tierA-000028 · control: quantity-change · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second kiln was bought by the pottery studio.
B: The pottery studio bought a third kiln.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance pottery_studio studio) (Member e0 buy) (Member x0 pottery_studio) (Member x1 kiln) (Past e0) (Theme e0 x1)
substitution 1 anchors x1
  A            {(Ordinal x1 2 buy)}
  B            {(Ordinal x1 3 buy)}
  factor       (Ordinal x1 2 buy) ~ (Ordinal x1 3 buy)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000029 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The mechanic repaired a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
one-sided A    {(Agent e0 x0) (Member e0 repair) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000029 ↔ tierA-000034 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic repaired a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Patient $e0 $x1)) ~ (And (Agent $e0 $x1) (Patient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Patient e0 x1)}
  B            {(Agent e0 x1)} {(Patient e0 x0)}
  factor       (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  factor       (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000030 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The mechanic fixed a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
one-sided A    {(Agent e0 x0) (Member e0 fix) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000030 ↔ tierA-000034 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic fixed a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 fix) (Patient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 fix)} {(Patient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 repair)} {(Patient e0 x0)}
  factor       (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  factor       (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
  factor       (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000031 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: The mechanic mended a seized gearbox.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
one-sided A    {(Agent e0 x0) (Member e0 mend) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000031 ↔ tierA-000034 · control: participant-swap · quality 0.57 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The mechanic mended a seized gearbox.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 repair) (Patient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 mend) (Patient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 mend)} {(Patient e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 repair)} {(Patient e0 x0)}
  factor       (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  factor       (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
  factor       (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-005 · tierA-000032 ↔ tierA-000033 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A seized gearbox was repaired by the mechanic.
B: The mechanic did not repair a seized gearbox.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 mechanic)
one-sided A    {(Agent e0 x0) (Member e0 repair) (Member x1 gearbox) (Member x1 seized) (Past e0) (Patient e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 repair) (Member x2' gearbox) (Member x2' seized) (Past x1) (Patient x1 x2')) ~NEG}@x0
```

### seedA-005 · tierA-000032 ↔ tierA-000034 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A seized gearbox was repaired by the mechanic.
B: A seized gearbox repaired the mechanic.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 repair) (Member x0 mechanic) (Member x1 gearbox) (Member x1 seized) (Past e0)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Patient $e0 $x1)) ~ (And (Agent $e0 $x1) (Patient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Patient e0 x1)}
  B            {(Agent e0 x1)} {(Patient e0 x0)}
  factor       (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  factor       (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000035 ↔ tierA-000039 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The electrician repaired the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Past e0) (Patient e0 x1)
substitution 1 anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  factor       (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
substitution 2 anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  factor       (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000035 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician repaired the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 break)}
  factor       (Member e0 repair) ~ (Member e0 break)   [arg1 repair->break]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000036 ↔ tierA-000039 · control: participant-swap · quality 0.57 · common 4 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The electrician fixed the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 repair)}
  factor       (Member e0 fix) ~ (Member e0 repair)   [arg1 fix->repair]
substitution 2 anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  factor       (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
substitution 3 anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  factor       (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000036 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician fixed the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 fix)}
  B            {(Member e0 break)}
  factor       (Member e0 fix) ~ (Member e0 break)   [arg1 fix->break]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000037 ↔ tierA-000039 · control: participant-swap · quality 0.57 · common 4 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The electrician mended the yard floodlight.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 repair)}
  factor       (Member e0 mend) ~ (Member e0 repair)   [arg1 mend->repair]
substitution 2 anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  factor       (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
substitution 3 anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  factor       (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000037 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The electrician mended the yard floodlight.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 mend)}
  B            {(Member e0 break)}
  factor       (Member e0 mend) ~ (Member e0 break)   [arg1 mend->break]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000038 ↔ tierA-000039 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The yard floodlight was repaired by the electrician.
B: The yard floodlight repaired the electrician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member e0 repair) (Past e0) (Patient e0 x1)
substitution 1 anchors x0 yard_floodlight
  A            {(Member x0 electrician)}
  B            {(Member x0 yard_floodlight)}
  factor       (Member x0 electrician) ~ (Member x0 yard_floodlight)   [arg1 electrician->yard_floodlight]
substitution 2 anchors x1 yard_floodlight
  A            {(Member x1 yard_floodlight)}
  B            {(Member x1 electrician)}
  factor       (Member x1 yard_floodlight) ~ (Member x1 electrician)   [arg1 yard_floodlight->electrician]
one-sided A    —
one-sided B    —
```

### seedA-006 · tierA-000038 ↔ tierA-000040 · control: antonym · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The yard floodlight was repaired by the electrician.
B: The electrician broke the yard floodlight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance yard_floodlight floodlight) (Member x0 electrician) (Member x1 yard_floodlight) (Past e0) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Member e0 repair)}
  B            {(Member e0 break)}
  factor       (Member e0 repair) ~ (Member e0 break)   [arg1 repair->break]
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000041 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor repairs a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000041 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor repairs a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000042 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor fixes a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000042 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor fixes a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000043 ↔ tierA-000044 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor mends a torn awning.
B: A tailor damages a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-007 · tierA-000043 ↔ tierA-000045 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tailor mends a torn awning.
B: A tailor does not repair a torn awning.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-008 · tierA-000046 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew repairs a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000046 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew repairs a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew fixes a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000047 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew fixes a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000050 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew mends a cracked feed pipe.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(And (Agent x0' x1') (Member x0' repair) (Patient x0' x2')) ~NEG (Member x1' crew) (Member x2' cracked) (Member x2' feed_pipe)}@feed_pipe
```

### seedA-008 · tierA-000048 ↔ tierA-000051 · control: participant-swap · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A crew mends a cracked feed pipe.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  
common         (Inheritance feed_pipe pipe)
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' repair) (Member x0' cracked) (Member x0' feed_pipe) (Member x1' crew) (Patient e0' x1')}@feed_pipe
```

### seedA-008 · tierA-000049 ↔ tierA-000050 · control: negation · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A cracked feed pipe is repaired by a crew.
B: A crew does not repair a cracked feed pipe.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance feed_pipe pipe) (Member x0 crew) (Member x1 cracked) (Member x1 feed_pipe)
one-sided A    {(Agent e0 x0) (Member e0 repair) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' repair) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-008 · tierA-000049 ↔ tierA-000051 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A cracked feed pipe is repaired by a crew.
B: A cracked feed pipe repairs a crew.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Inheritance feed_pipe pipe) (Member e0 repair) (Member x0 crew) (Member x1 cracked) (Member x1 feed_pipe)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Patient $e0 $x1)) ~ (And (Agent $e0 $x1) (Patient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Patient e0 x1)}
  B            {(Agent e0 x1)} {(Patient e0 x0)}
  factor       (Agent e0 x0) ~ (Patient e0 x0)   [head Agent->Patient]
  factor       (Patient e0 x1) ~ (Agent e0 x1)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000052 ↔ tierA-000055 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A shoreline survey begins at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member e0 begin) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-009 · tierA-000052 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey begins at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  factor       (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000053 ↔ tierA-000055 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A shoreline survey starts at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0   joint key: (Member $e0 start) ~ (And (Member $e0 begin) (Might $e0)) @$e0
  A            {(Member e0 start)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000053 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey starts at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  factor       (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000054 ↔ tierA-000055 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A shoreline survey commences at dawn.
B: A shoreline survey might begin at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0   joint key: (Member $e0 commence) ~ (And (Member $e0 begin) (Might $e0)) @$e0
  A            {(Member e0 commence)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-009 · tierA-000054 ↔ tierA-000056 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shoreline survey commences at dawn.
B: A shoreline survey ends at dawn.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance shoreline_survey survey) (Member x0 shoreline_survey) (Patient e0 x0) (Time e0 dawn)
substitution 1 anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  factor       (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000057 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing begins on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  factor       (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000057 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: A hearing begins on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
one-sided A    {(Member e0 begin) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
one-sided B    —
```

### seedA-010 · tierA-000058 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing starts on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  factor       (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000058 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: A hearing starts on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
one-sided A    {(Member e0 start) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
one-sided B    —
```

### seedA-010 · tierA-000059 ↔ tierA-000060 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A hearing commences on Monday morning.
B: A hearing ends on Monday morning.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)
substitution 1 anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  factor       (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
one-sided A    —
one-sided B    —
```

### seedA-010 · tierA-000059 ↔ tierA-000061 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: A hearing commences on Monday morning.
B: A hearing does not begin on Monday morning.

```
renaming a->b  
common         —
one-sided A    {(Member e0 commence) (Member x0 hearing) (Patient e0 x0) (Time e0 (Weekday monday)) (Time e0 morning)}
one-sided B    —
```

### seedA-011 · tierA-000062 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The dress rehearsal begins after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
one-sided A    {(Before x0 e0) (Future e0) (Member e0 begin) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000062 ↔ tierA-000066 · control: modality-shift · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal begins after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member e0 begin) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
one-sided A    —
one-sided B    —
```

### seedA-011 · tierA-000063 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The dress rehearsal starts after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
one-sided A    {(Before x0 e0) (Future e0) (Member e0 start) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000063 ↔ tierA-000066 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal starts after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 begin) (Might $e0)) ~ (And (Future $e0) (Member $e0 start)) @$e0
  A            {(Future e0)} {(Member e0 start)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
  factor       (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
one-sided A    —
one-sided B    —
```

### seedA-011 · tierA-000064 ↔ tierA-000065 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The dress rehearsal commences after lunch.
B: The dress rehearsal does not begin after lunch.

```
renaming a->b  x0->x0 x1->x2
common         (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal)
one-sided A    {(Before x0 e0) (Future e0) (Member e0 commence) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Before x0 x1') (Future x1') (Member x1' begin) (Patient x1' x1)) ~NEG}@x0,x1
```

### seedA-011 · tierA-000064 ↔ tierA-000066 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The dress rehearsal commences after lunch.
B: The dress rehearsal might begin after lunch.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Before x0 e0) (Inheritance dress_rehearsal rehearsal) (Member x0 lunch) (Member x1 dress_rehearsal) (Patient e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 begin) (Might $e0)) ~ (And (Future $e0) (Member $e0 commence)) @$e0
  A            {(Future e0)} {(Member e0 commence)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
  factor       (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000067 ↔ tierA-000070 · control: modality-shift · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest begins in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member e0 begin) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000067 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest begins in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 begin)}
  B            {(Member e0 end)}
  factor       (Member e0 begin) ~ (Member e0 end)   [arg1 begin->end]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000068 ↔ tierA-000070 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest starts in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0   joint key: (And (Member $e0 begin) (Might $e0)) ~ (And (Future $e0) (Member $e0 start)) @$e0
  A            {(Future e0)} {(Member e0 start)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
  factor       (Member e0 start) ~ (Member e0 begin)   [arg1 start->begin]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000068 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest starts in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 start)}
  B            {(Member e0 end)}
  factor       (Member e0 start) ~ (Member e0 end)   [arg1 start->end]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000069 ↔ tierA-000070 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest commences in September.
B: The apple harvest might begin in September.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0   joint key: (And (Member $e0 begin) (Might $e0)) ~ (And (Future $e0) (Member $e0 commence)) @$e0
  A            {(Future e0)} {(Member e0 commence)}
  B            {(Member e0 begin)} {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
  factor       (Member e0 commence) ~ (Member e0 begin)   [arg1 commence->begin]
one-sided A    —
one-sided B    —
```

### seedA-012 · tierA-000069 ↔ tierA-000071 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The apple harvest commences in September.
B: The apple harvest ends in September.

```
renaming a->b  e0->e0 x0->x0
common         (Future e0) (Inheritance apple_harvest harvest) (Member x0 apple_harvest) (Patient e0 x0) (Time e0 (Month september))
substitution 1 anchors e0
  A            {(Member e0 commence)}
  B            {(Member e0 end)}
  factor       (Member e0 commence) ~ (Member e0 end)   [arg1 commence->end]
one-sided A    —
one-sided B    —
```

### seedA-013 · tierA-000072 ↔ tierA-000074 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A warden allows visitors on Sundays.
B: A warden forbids visitors on Sundays.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' forbid) (Member x0' warden) (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-013 · tierA-000072 ↔ tierA-000075 · control: modality-shift · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A warden allows visitors on Sundays.
B: A warden might allow visitors on Sundays.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    {(Agent e0' x0') (Member e0' allow) (Member x0' warden) (Might e0') (Theme e0' visitor) (Time e0' (Weekday sunday))}
```

### seedA-013 · tierA-000073 ↔ tierA-000074 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A warden permits visitors on Sundays.
B: A warden forbids visitors on Sundays.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 warden) (Theme e0 visitor) (Time e0 (Weekday sunday))
substitution 1 anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 forbid)}
  factor       (Member e0 permit) ~ (Member e0 forbid)   [arg1 permit->forbid]
one-sided A    —
one-sided B    —
```

### seedA-013 · tierA-000073 ↔ tierA-000075 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A warden permits visitors on Sundays.
B: A warden might allow visitors on Sundays.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 warden) (Theme e0 visitor) (Time e0 (Weekday sunday))
substitution 1 anchors e0   joint key: (Member $e0 permit) ~ (And (Member $e0 allow) (Might $e0)) @$e0
  A            {(Member e0 permit)}
  B            {(Member e0 allow)} {(Might e0)}
  factor       (Member e0 permit) ~ (Member e0 allow)   [arg1 permit->allow]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-014 · tierA-000076 ↔ tierA-000078 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A licence allows night deliveries.
B: A licence might allow night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member e0 allow) (Member x0 licence) (Theme e0 night_delivery)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-014 · tierA-000076 ↔ tierA-000079 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A licence allows night deliveries.
B: A licence does not allow night deliveries.

```
renaming a->b  x0->x1
common         (Inheritance night_delivery delivery) (Member x0 licence)
one-sided A    {(Agent e0 x0) (Member e0 allow) (Theme e0 night_delivery)}@night_delivery,x0
one-sided B    {(And (Agent x0' x0) (Member x0' allow) (Theme x0' night_delivery)) ~NEG}@night_delivery,x0
```

### seedA-014 · tierA-000077 ↔ tierA-000078 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A licence permits night deliveries.
B: A licence might allow night deliveries.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Inheritance night_delivery delivery) (Member x0 licence) (Theme e0 night_delivery)
substitution 1 anchors e0   joint key: (Member $e0 permit) ~ (And (Member $e0 allow) (Might $e0)) @$e0
  A            {(Member e0 permit)}
  B            {(Member e0 allow)} {(Might e0)}
  factor       (Member e0 permit) ~ (Member e0 allow)   [arg1 permit->allow]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-014 · tierA-000077 ↔ tierA-000079 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A licence permits night deliveries.
B: A licence does not allow night deliveries.

```
renaming a->b  x0->x1
common         (Inheritance night_delivery delivery) (Member x0 licence)
one-sided A    {(Agent e0 x0) (Member e0 permit) (Theme e0 night_delivery)}@night_delivery,x0
one-sided B    {(And (Agent x0' x0) (Member x0' allow) (Theme x0' night_delivery)) ~NEG}@night_delivery,x0
```

### seedA-015 · tierA-000080 ↔ tierA-000082 · control: negation · quality 0.33 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A curator allows photography in the hall.
B: A curator does not allow photography in the hall.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 curator) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Location e0 x1) (Member e0 allow) (Theme e0 photography)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' allow) (Theme x0' photography)) ~NEG}@x0,x1
```

### seedA-015 · tierA-000080 ↔ tierA-000083 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A curator allows photography in the hall.
B: A curator forbids photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
substitution 1 anchors e0
  A            {(Member e0 allow)}
  B            {(Member e0 forbid)}
  factor       (Member e0 allow) ~ (Member e0 forbid)   [arg1 allow->forbid]
one-sided A    —
one-sided B    —
```

### seedA-015 · tierA-000081 ↔ tierA-000082 · control: negation · quality 0.33 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A curator permits photography in the hall.
B: A curator does not allow photography in the hall.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 curator) (Member x1 hall)
one-sided A    {(Agent e0 x0) (Location e0 x1) (Member e0 permit) (Theme e0 photography)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' allow) (Theme x0' photography)) ~NEG}@x0,x1
```

### seedA-015 · tierA-000081 ↔ tierA-000083 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A curator permits photography in the hall.
B: A curator forbids photography in the hall.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 curator) (Member x1 hall) (Theme e0 photography)
substitution 1 anchors e0
  A            {(Member e0 permit)}
  B            {(Member e0 forbid)}
  factor       (Member e0 permit) ~ (Member e0 forbid)   [arg1 permit->forbid]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000084 ↔ tierA-000087 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A recipe requires two eggs.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x1 2) (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (Agent $e0 $x0) ~ (And (Holder $e0 $x0) (Might $e0)) @$e0,$x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)} {(Might e0)}
  factor       (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000084 ↔ tierA-000088 · control: quantity-change · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recipe requires two eggs.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (GroupOf x1 egg) (Member e0 require) (Member x0 recipe) (Theme e0 x1)
substitution 1 anchors e0 x0
  A            {(Agent e0 x0)}
  B            {(Holder e0 x0)}
  factor       (Agent e0 x0) ~ (Holder e0 x0)   [head Agent->Holder]
substitution 2 anchors x1
  A            {(Cardinality x1 2)}
  B            {(Cardinality x1 3)}
  factor       (Cardinality x1 2) ~ (Cardinality x1 3)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000085 ↔ tierA-000087 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A recipe needs two eggs.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
substitution 1 anchors e0   joint key: (And (Member $e0 require) (Might $e0)) ~ (Member $e0 need) @$e0
  A            {(Member e0 need)}
  B            {(Member e0 require)} {(Might e0)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000085 ↔ tierA-000088 · control: quantity-change · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A recipe needs two eggs.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 egg) (Holder e0 x1) (Member x1 recipe) (Theme e0 x0)
substitution 1 anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  factor       (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
substitution 2 anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
one-sided A    —
one-sided B    —
```

### seedA-016 · tierA-000086 ↔ tierA-000087 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: Two eggs are required by a recipe.
B: A recipe might require two eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Cardinality x0 2) (GroupOf x0 egg) (Holder e0 x1) (Member e0 require) (Member x1 recipe) (Theme e0 x0)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-016 · tierA-000086 ↔ tierA-000088 · control: quantity-change · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two eggs are required by a recipe.
B: A recipe requires three eggs.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (GroupOf x0 egg) (Holder e0 x1) (Member e0 require) (Member x1 recipe) (Theme e0 x0)
substitution 1 anchors x0
  A            {(Cardinality x0 2)}
  B            {(Cardinality x0 3)}
  factor       (Cardinality x0 2) ~ (Cardinality x0 3)   [arg1 2->3]
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000089 ↔ tierA-000092 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A permit requires a countersignature.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Theme e0 x1)
substitution 1 anchors x1   joint key: (Member $x0 countersignature) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 countersignature)) @$x0
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)} {(GroupOf x1 countersignature)}
  factor       (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
  B only       (GroupOf x1 countersignature)
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000089 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A permit requires a countersignature.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
one-sided A    {(Holder e0 x0) (Member e0 require) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-017 · tierA-000090 ↔ tierA-000092 · control: quantity-change · quality 0.50 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A permit needs a countersignature.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member x0 permit) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 need)}
  B            {(Member e0 require)}
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
substitution 2 anchors x1   joint key: (Member $x0 countersignature) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 countersignature)) @$x0
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)} {(GroupOf x1 countersignature)}
  factor       (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
  B only       (GroupOf x1 countersignature)
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000090 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A permit needs a countersignature.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
one-sided A    {(Holder e0 x0) (Member e0 need) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-017 · tierA-000091 ↔ tierA-000092 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A countersignature is required by a permit.
B: A permit requires two countersignatures.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Holder e0 x0) (Member e0 require) (Member x0 permit) (Theme e0 x1)
substitution 1 anchors x1   joint key: (Member $x0 countersignature) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 countersignature)) @$x0
  A            {(Member x1 countersignature)}
  B            {(Cardinality x1 2)} {(GroupOf x1 countersignature)}
  factor       (Member x1 countersignature) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 countersignature->2]
  B only       (GroupOf x1 countersignature)
one-sided A    —
one-sided B    —
```

### seedA-017 · tierA-000091 ↔ tierA-000093 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A countersignature is required by a permit.
B: A permit does not require a countersignature.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 permit) (Member x1 countersignature)
one-sided A    {(Holder e0 x0) (Member e0 require) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Holder x0' x0) (Member x0' require) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-018 · tierA-000094 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A lathe requires monthly servicing.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
one-sided A    {(Holder e0 x0) (Member e0 require) (Theme e0 monthly_servicing)}@monthly_servicing,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000094 ↔ tierA-000098 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A lathe requires monthly servicing.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
substitution 1 anchors e0 x0   joint key: (Holder $e0 $x0) ~ (And (Experiencer $e0 $x0) (Might $e0)) @$e0,$x0
  A            {(Holder e0 x0)}
  B            {(Experiencer e0 x0)} {(Might e0)}
  factor       (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-018 · tierA-000095 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A lathe needs monthly servicing.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
one-sided A    {(Holder e0 x0) (Member e0 need) (Theme e0 monthly_servicing)}@monthly_servicing,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000095 ↔ tierA-000098 · control: modality-shift · quality 0.57 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A lathe needs monthly servicing.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe) (Theme e0 monthly_servicing)
substitution 1 anchors e0 x0   joint key: (And (Holder $e0 $x0) (Member $e0 need)) ~ (And (Experiencer $e0 $x0) (Member $e0 require) (Might $e0)) @$e0,$x0
  A            {(Holder e0 x0)} {(Member e0 need)}
  B            {(Experiencer e0 x0)} {(Member e0 require)} {(Might e0)}
  factor       (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
  factor       (Member e0 need) ~ (Member e0 require)   [arg1 need->require]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-018 · tierA-000096 ↔ tierA-000097 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Monthly servicing is required by a lathe.
B: A lathe does not require monthly servicing.

```
renaming a->b  x0->x1
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member x0 lathe)
one-sided A    {(Holder e0 x0) (Member e0 require) (Theme e0 monthly_servicing)}@monthly_servicing,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' require) (Theme x0' monthly_servicing)) ~NEG}@monthly_servicing,x0
```

### seedA-018 · tierA-000096 ↔ tierA-000098 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: Monthly servicing is required by a lathe.
B: A lathe might require monthly servicing.

```
renaming a->b  e0->e0 x0->x0
common         (Inheritance monthly_servicing monthly) (Inheritance monthly_servicing servicing) (Member e0 require) (Member x0 lathe) (Theme e0 monthly_servicing)
substitution 1 anchors e0 x0   joint key: (Holder $e0 $x0) ~ (And (Experiencer $e0 $x0) (Might $e0)) @$e0,$x0
  A            {(Holder e0 x0)}
  B            {(Experiencer e0 x0)} {(Might e0)}
  factor       (Holder e0 x0) ~ (Experiencer e0 x0)   [head Holder->Experiencer]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000099 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A rescue team abandons the search.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  factor       (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000099 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A rescue team abandons the search.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
one-sided A    {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-019 · tierA-000100 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A rescue team gives up the search.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 continue)}
  factor       (Member e0 give_up) ~ (Member e0 continue)   [arg1 give_up->continue]
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000100 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A rescue team gives up the search.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
one-sided A    {(Agent e0 x0) (Member e0 give_up) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-019 · tierA-000101 ↔ tierA-000102 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The search is abandoned by a rescue team.
B: A rescue team continues the search.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  factor       (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
one-sided A    —
one-sided B    —
```

### seedA-019 · tierA-000101 ↔ tierA-000103 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The search is abandoned by a rescue team.
B: A rescue team does not abandon the search.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance rescue_team team) (Member x0 rescue_team) (Member x1 search)
one-sided A    {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000104 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A firm abandons its tender.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
one-sided A    {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000104 ↔ tierA-000108 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A firm abandons its tender.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-020 · tierA-000105 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A firm gives up its tender.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
one-sided A    {(Agent e0 x0) (Member e0 give_up) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000105 ↔ tierA-000108 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A firm gives up its tender.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
substitution 1 anchors e0   joint key: (Member $e0 give_up) ~ (And (Member $e0 abandon) (Might $e0)) @$e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)} {(Might e0)}
  factor       (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-020 · tierA-000106 ↔ tierA-000107 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Its tender is abandoned by a firm.
B: A firm does not abandon its tender.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 firm) (Member x1 tender) (Possession x1 x0)
one-sided A    {(Agent e0 x0) (Member e0 abandon) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' abandon) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-020 · tierA-000106 ↔ tierA-000108 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: Its tender is abandoned by a firm.
B: A firm might abandon its tender.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 abandon) (Member x0 firm) (Member x1 tender) (Possession x1 x0) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-021 · tierA-000109 ↔ tierA-000112 · control: modality-shift · quality 0.89 · common 8 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: Two climbers abandon the north route.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-021 · tierA-000109 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two climbers abandon the north route.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  factor       (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000110 ↔ tierA-000112 · control: modality-shift · quality 0.78 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: Two climbers give up the north route.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0   joint key: (Member $e0 give_up) ~ (And (Member $e0 abandon) (Might $e0)) @$e0
  A            {(Member e0 give_up)}
  B            {(Member e0 abandon)} {(Might e0)}
  factor       (Member e0 give_up) ~ (Member e0 abandon)   [arg1 give_up->abandon]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000110 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two climbers give up the north route.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 give_up)}
  B            {(Member e0 continue)}
  factor       (Member e0 give_up) ~ (Member e0 continue)   [arg1 give_up->continue]
one-sided A    —
one-sided B    —
```

### seedA-021 · tierA-000111 ↔ tierA-000112 · control: modality-shift · quality 0.89 · common 8 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The north route is abandoned by two climbers.
B: Two climbers might abandon the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member e0 abandon) (Member x1 north_route) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-021 · tierA-000111 ↔ tierA-000113 · control: antonym · quality 0.88 · common 7 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The north route is abandoned by two climbers.
B: Two climbers continue the north route.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 climber) (Inheritance north_route north) (Inheritance north_route route) (Member x1 north_route) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 abandon)}
  B            {(Member e0 continue)}
  factor       (Member e0 abandon) ~ (Member e0 continue)   [arg1 abandon->continue]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000114 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A board postpones the vote.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  factor       (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000114 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A board postpones the vote.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
one-sided A    {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-022 · tierA-000115 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A board puts off the vote.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 advance)}
  factor       (Member e0 put_off) ~ (Member e0 advance)   [arg1 put_off->advance]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000115 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A board puts off the vote.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
one-sided A    {(Agent e0 x0) (Member e0 put_off) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-022 · tierA-000116 ↔ tierA-000117 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The vote is postponed by a board.
B: A board advances the vote.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 vote) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  factor       (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
one-sided A    —
one-sided B    —
```

### seedA-022 · tierA-000116 ↔ tierA-000118 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The vote is postponed by a board.
B: A board does not postpone the vote.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 vote)
one-sided A    {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000119 ↔ tierA-000121 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A ferry postpones its departure.
B: A ferry does not postpone its departure.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 ferry) (Member x1 departure) (Possession x1 x0)
one-sided A    {(Agent e0 x0) (Member e0 postpone) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000119 ↔ tierA-000122 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A ferry postpones its departure.
B: A ferry might postpone its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-023 · tierA-000120 ↔ tierA-000121 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A ferry puts off its departure.
B: A ferry does not postpone its departure.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 ferry) (Member x1 departure) (Possession x1 x0)
one-sided A    {(Agent e0 x0) (Member e0 put_off) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' postpone) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-023 · tierA-000120 ↔ tierA-000122 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A ferry puts off its departure.
B: A ferry might postpone its departure.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 ferry) (Member x1 departure) (Possession x1 x0) (Theme e0 x1)
substitution 1 anchors e0   joint key: (Member $e0 put_off) ~ (And (Member $e0 postpone) (Might $e0)) @$e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)} {(Might e0)}
  factor       (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000123 ↔ tierA-000126 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A club postpones the tournament.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-024 · tierA-000123 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A club postpones the tournament.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  factor       (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000124 ↔ tierA-000126 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A club puts off the tournament.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0   joint key: (Member $e0 put_off) ~ (And (Member $e0 postpone) (Might $e0)) @$e0
  A            {(Member e0 put_off)}
  B            {(Member e0 postpone)} {(Might e0)}
  factor       (Member e0 put_off) ~ (Member e0 postpone)   [arg1 put_off->postpone]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000124 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A club puts off the tournament.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 put_off)}
  B            {(Member e0 advance)}
  factor       (Member e0 put_off) ~ (Member e0 advance)   [arg1 put_off->advance]
one-sided A    —
one-sided B    —
```

### seedA-024 · tierA-000125 ↔ tierA-000126 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The tournament is postponed by a club.
B: A club might postpone the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 postpone) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-024 · tierA-000125 ↔ tierA-000127 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The tournament is postponed by a club.
B: A club advances the tournament.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 club) (Member x1 tournament) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 postpone)}
  B            {(Member e0 advance)}
  factor       (Member e0 postpone) ~ (Member e0 advance)   [arg1 postpone->advance]
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000128 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An auditor discovers an error in the ledger.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
one-sided A    {(Experiencer e0 x0) (Member e0 discover) (Stimulus e0 e1)}@e1,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000128 ↔ tierA-000132 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An auditor discovers an error in the ledger.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member x1 ledger) (Stimulus e0 e1)
substitution 1 anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  factor       (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
substitution 2 anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  factor       (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000129 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An auditor finds out an error in the ledger.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
one-sided A    {(Experiencer e0 x0) (Member e0 find_out) (Stimulus e0 e1)}@e1,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000129 ↔ tierA-000132 · control: participant-swap · quality 0.57 · common 4 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An auditor finds out an error in the ledger.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member x1 ledger) (Stimulus e0 e1)
substitution 1 anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
substitution 2 anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  factor       (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
substitution 3 anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  factor       (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
one-sided A    —
one-sided B    —
```

### seedA-025 · tierA-000130 ↔ tierA-000131 · control: negation · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An error in the ledger is discovered by an auditor.
B: An auditor does not discover an error in the ledger.

```
renaming a->b  e1->e0 x0->x1 x1->x2
common         (Location e1 x1) (Member e1 error) (Member x0 auditor) (Member x1 ledger)
one-sided A    {(Experiencer e0 x0) (Member e0 discover) (Stimulus e0 e1)}@e1,x0
one-sided B    {(And (Experiencer x0' x0) (Member x0' discover) (Stimulus x0' e1)) ~NEG}@e1,x0
```

### seedA-025 · tierA-000130 ↔ tierA-000132 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An error in the ledger is discovered by an auditor.
B: An error discovers an auditor in the ledger.

```
renaming a->b  e0->e0 e1->e1 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e1 x1) (Member e0 discover) (Member x1 ledger) (Stimulus e0 e1)
substitution 1 anchors e1
  A            {(Member e1 error)}
  B            {(Member e1 auditor)}
  factor       (Member e1 error) ~ (Member e1 auditor)   [arg1 error->auditor]
substitution 2 anchors x0
  A            {(Member x0 auditor)}
  B            {(Member x0 error)}
  factor       (Member x0 auditor) ~ (Member x0 error)   [arg1 auditor->error]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000133 ↔ tierA-000136 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A diver discovers a wreck off the point.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x1 point) (Theme e0 x2)
substitution 1 anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  factor       (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
substitution 2 anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  factor       (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000133 ↔ tierA-000137 · control: modality-shift · quality 0.88 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A diver discovers a wreck off the point.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-026 · tierA-000134 ↔ tierA-000136 · control: participant-swap · quality 0.57 · common 4 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A diver finds out a wreck off the point.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x1 point) (Theme e0 x2)
substitution 1 anchors e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
substitution 2 anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  factor       (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
substitution 3 anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  factor       (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000134 ↔ tierA-000137 · control: modality-shift · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A diver finds out a wreck off the point.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
substitution 1 anchors e0   joint key: (Member $e0 find_out) ~ (And (Member $e0 discover) (Might $e0)) @$e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)} {(Might e0)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000135 ↔ tierA-000136 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A wreck off the point is discovered by a diver.
B: A wreck discovers a diver off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x1 point) (Theme e0 x2)
substitution 1 anchors x0
  A            {(Member x0 diver)}
  B            {(Member x0 wreck)}
  factor       (Member x0 diver) ~ (Member x0 wreck)   [arg1 diver->wreck]
substitution 2 anchors x2
  A            {(Member x2 wreck)}
  B            {(Member x2 diver)}
  factor       (Member x2 wreck) ~ (Member x2 diver)   [arg1 wreck->diver]
one-sided A    —
one-sided B    —
```

### seedA-026 · tierA-000135 ↔ tierA-000137 · control: modality-shift · quality 0.88 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A wreck off the point is discovered by a diver.
B: A diver might discover a wreck off the point.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x1) (Member e0 discover) (Member x0 diver) (Member x1 point) (Member x2 wreck) (Theme e0 x2)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-027 · tierA-000138 ↔ tierA-000141 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: An intern discovers the missing file.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-027 · tierA-000138 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An intern discovers the missing file.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
one-sided A    {(Agent e0 x0) (Member e0 discover) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-027 · tierA-000139 ↔ tierA-000141 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: An intern finds out the missing file.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
substitution 1 anchors e0   joint key: (Member $e0 find_out) ~ (And (Member $e0 discover) (Might $e0)) @$e0
  A            {(Member e0 find_out)}
  B            {(Member e0 discover)} {(Might e0)}
  factor       (Member e0 find_out) ~ (Member e0 discover)   [arg1 find_out->discover]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-027 · tierA-000139 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An intern finds out the missing file.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
one-sided A    {(Agent e0 x0) (Member e0 find_out) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-027 · tierA-000140 ↔ tierA-000141 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The missing file is discovered by an intern.
B: An intern might discover the missing file.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 discover) (Member x0 intern) (Member x1 file) (Member x1 missing) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-027 · tierA-000140 ↔ tierA-000142 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The missing file is discovered by an intern.
B: An intern does not discover the missing file.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 intern) (Member x1 file) (Member x1 missing)
one-sided A    {(Agent e0 x0) (Member e0 discover) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' discover) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000143 ↔ tierA-000146 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An airline cancels the evening flight.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cancel)}
  B            {(Member e0 confirm)}
  factor       (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000143 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An airline cancels the evening flight.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
one-sided A    {(Agent e0 x0) (Member e0 cancel) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000144 ↔ tierA-000146 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An airline calls off the evening flight.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 call_off)}
  B            {(Member e0 confirm)}
  factor       (Member e0 call_off) ~ (Member e0 confirm)   [arg1 call_off->confirm]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000144 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An airline calls off the evening flight.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
one-sided A    {(Agent e0 x0) (Member e0 call_off) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-028 · tierA-000145 ↔ tierA-000146 · control: antonym · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The evening flight is canceled by an airline.
B: An airline confirms the evening flight.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 confirm) (Theme $e0 $x0)) ~ (And (Member $e0 cancel) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 cancel)} {(Patient e0 x1)}
  B            {(Member e0 confirm)} {(Theme e0 x1)}
  factor       (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-028 · tierA-000145 ↔ tierA-000147 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The evening flight is canceled by an airline.
B: An airline does not cancel the evening flight.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance evening_flight flight) (Member x0 airline) (Member x1 evening_flight)
one-sided A    {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000148 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A council cancels the summer fair.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
one-sided A    {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000148 ↔ tierA-000152 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A council cancels the summer fair.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-029 · tierA-000149 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A council calls off the summer fair.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
one-sided A    {(Agent e0 x0) (Member e0 call_off) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000149 ↔ tierA-000152 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A council calls off the summer fair.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 cancel) (Might $e0)) ~ (Member $e0 call_off) @$e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)} {(Might e0)}
  factor       (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-029 · tierA-000150 ↔ tierA-000151 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The summer fair is canceled by a council.
B: A council does not cancel the summer fair.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance summer_fair fair) (Member x0 council) (Member x1 summer_fair)
one-sided A    {(Agent e0 x0) (Member e0 cancel) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cancel) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-029 · tierA-000150 ↔ tierA-000152 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The summer fair is canceled by a council.
B: A council might cancel the summer fair.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance summer_fair fair) (Member e0 cancel) (Member x0 council) (Member x1 summer_fair) (Patient e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-030 · tierA-000153 ↔ tierA-000156 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A tutor cancels the afternoon session.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-030 · tierA-000153 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tutor cancels the afternoon session.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 confirm) (Theme $e0 $x0)) ~ (And (Member $e0 cancel) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 cancel)} {(Patient e0 x1)}
  B            {(Member e0 confirm)} {(Theme e0 x1)}
  factor       (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000154 ↔ tierA-000156 · control: modality-shift · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A tutor calls off the afternoon session.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 cancel) (Might $e0)) ~ (Member $e0 call_off) @$e0
  A            {(Member e0 call_off)}
  B            {(Member e0 cancel)} {(Might e0)}
  factor       (Member e0 call_off) ~ (Member e0 cancel)   [arg1 call_off->cancel]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000154 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A tutor calls off the afternoon session.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 confirm) (Theme $e0 $x0)) ~ (And (Member $e0 call_off) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 call_off)} {(Patient e0 x1)}
  B            {(Member e0 confirm)} {(Theme e0 x1)}
  factor       (Member e0 call_off) ~ (Member e0 confirm)   [arg1 call_off->confirm]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-030 · tierA-000155 ↔ tierA-000156 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The afternoon session is canceled by a tutor.
B: A tutor might cancel the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member e0 cancel) (Member x0 tutor) (Member x1 afternoon_session) (Patient e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-030 · tierA-000155 ↔ tierA-000157 · control: antonym · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The afternoon session is canceled by a tutor.
B: A tutor confirms the afternoon session.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance afternoon_session session) (Member x0 tutor) (Member x1 afternoon_session)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 confirm) (Theme $e0 $x0)) ~ (And (Member $e0 cancel) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 cancel)} {(Patient e0 x1)}
  B            {(Member e0 confirm)} {(Theme e0 x1)}
  factor       (Member e0 cancel) ~ (Member e0 confirm)   [arg1 cancel->confirm]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000158 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An editor rejects a manuscript.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  factor       (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000158 ↔ tierA-000162 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: An editor rejects a manuscript.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  factor       (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
substitution 2 anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  factor       (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000159 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An editor turns down a manuscript.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 accept)}
  factor       (Member e0 turn_down) ~ (Member e0 accept)   [arg1 turn_down->accept]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000159 ↔ tierA-000162 · control: participant-swap · quality 0.40 · common 2 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: An editor turns down a manuscript.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  factor       (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
substitution 2 anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  factor       (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
substitution 3 anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  factor       (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000160 ↔ tierA-000161 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A manuscript is rejected by an editor.
B: An editor accepts a manuscript.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 editor) (Member x1 manuscript) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  factor       (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
one-sided A    —
one-sided B    —
```

### seedA-031 · tierA-000160 ↔ tierA-000162 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A manuscript is rejected by an editor.
B: A manuscript rejects an editor.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 reject) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 editor)}
  B            {(Member x0 manuscript)}
  factor       (Member x0 editor) ~ (Member x0 manuscript)   [arg1 editor->manuscript]
substitution 2 anchors x1
  A            {(Member x1 manuscript)}
  B            {(Member x1 editor)}
  factor       (Member x1 manuscript) ~ (Member x1 editor)   [arg1 manuscript->editor]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000163 ↔ tierA-000166 · control: participant-swap · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A bank rejects the loan application.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Theme e0 x1)
substitution 1 anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  factor       (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
substitution 2 anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  factor       (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000163 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A bank rejects the loan application.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
one-sided A    {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-032 · tierA-000164 ↔ tierA-000166 · control: participant-swap · quality 0.50 · common 3 · 3 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A bank turns down the loan application.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 reject)}
  factor       (Member e0 turn_down) ~ (Member e0 reject)   [arg1 turn_down->reject]
substitution 2 anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  factor       (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
substitution 3 anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  factor       (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000164 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A bank turns down the loan application.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
one-sided A    {(Agent e0 x0) (Member e0 turn_down) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-032 · tierA-000165 ↔ tierA-000166 · control: participant-swap · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The loan application is rejected by a bank.
B: The loan application rejects a bank.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Inheritance loan_application application) (Member e0 reject) (Theme e0 x1)
substitution 1 anchors loan_application x0
  A            {(Member x0 bank)}
  B            {(Member x0 loan_application)}
  factor       (Member x0 bank) ~ (Member x0 loan_application)   [arg1 bank->loan_application]
substitution 2 anchors loan_application x1
  A            {(Member x1 loan_application)}
  B            {(Member x1 bank)}
  factor       (Member x1 loan_application) ~ (Member x1 bank)   [arg1 loan_application->bank]
one-sided A    —
one-sided B    —
```

### seedA-032 · tierA-000165 ↔ tierA-000167 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The loan application is rejected by a bank.
B: A bank does not reject the loan application.

```
renaming a->b  x0->x1 x1->x2
common         (Inheritance loan_application application) (Member x0 bank) (Member x1 loan_application)
one-sided A    {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000168 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A panel rejects the proposal.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
one-sided A    {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000168 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A panel rejects the proposal.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  factor       (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
one-sided A    —
one-sided B    —
```

### seedA-033 · tierA-000169 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A panel turns down the proposal.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
one-sided A    {(Agent e0 x0) (Member e0 turn_down) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000169 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A panel turns down the proposal.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 turn_down)}
  B            {(Member e0 accept)}
  factor       (Member e0 turn_down) ~ (Member e0 accept)   [arg1 turn_down->accept]
one-sided A    —
one-sided B    —
```

### seedA-033 · tierA-000170 ↔ tierA-000171 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The proposal is rejected by a panel.
B: A panel does not reject the proposal.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 panel) (Member x1 proposal)
one-sided A    {(Agent e0 x0) (Member e0 reject) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' reject) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-033 · tierA-000170 ↔ tierA-000172 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The proposal is rejected by a panel.
B: A panel accepts the proposal.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 panel) (Member x1 proposal) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 reject)}
  B            {(Member e0 accept)}
  factor       (Member e0 reject) ~ (Member e0 accept)   [arg1 reject->accept]
one-sided A    —
one-sided B    —
```

### seedA-034 · tierA-000173 ↔ tierA-000175 · control: manner-near-miss · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A shepherd walks along the ridge.
B: A shepherd sprints along the ridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member x0 shepherd) (Member x1 ridge)
substitution 1 anchors e0
  A            {(Member e0 walk)}
  B            {(Member e0 sprint)}
  factor       (Member e0 walk) ~ (Member e0 sprint)   [arg1 walk->sprint]
one-sided A    —
one-sided B    —
```

### seedA-034 · tierA-000173 ↔ tierA-000176 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A shepherd walks along the ridge.
B: A shepherd does not walk along the ridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 shepherd) (Member x1 ridge)
one-sided A    {(Agent e0 x0) (Location e0 x1) (Member e0 walk)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-034 · tierA-000174 ↔ tierA-000175 · control: manner-near-miss · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A shepherd takes a walk along the ridge.
B: A shepherd sprints along the ridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 shepherd) (Member x1 ridge)
substitution 1 anchors e0 x1   joint key: (And (Location $e1 $x0) (Member $e0 take) (Member $e1 walk) (Theme $e0 $e1)) ~ (And (Location $e0 $x0) (Member $e0 sprint)) @$e0,$x0
  A            {(Location e1 x1) (Member e1 walk) (Theme e0 e1)} {(Member e0 take)}
  B            {(Location e0 x1)} {(Member e0 sprint)}
  factor       (Member e0 take) ~ (Member e0 sprint)   [arg1 take->sprint]
  A only       (Location e1 x1) (Member e1 walk) (Theme e0 e1)
  B only       (Location e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-034 · tierA-000174 ↔ tierA-000176 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A shepherd takes a walk along the ridge.
B: A shepherd does not walk along the ridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 shepherd) (Member x1 ridge)
one-sided A    {(Agent e0 x0) (Location e1 x1) (Member e0 take) (Member e1 walk) (Theme e0 e1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000177 ↔ tierA-000179 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A nurse walks through the ward.
B: A nurse does not walk through the ward.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 nurse) (Member x1 ward)
one-sided A    {(Agent e0 x0) (Location e0 x1) (Member e0 walk)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000177 ↔ tierA-000180 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A nurse walks through the ward.
B: The ward walks through a nurse.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Location e0 x1) (Member e0 walk)
substitution 1 anchors x0
  A            {(Member x0 nurse)}
  B            {(Member x0 ward)}
  factor       (Member x0 nurse) ~ (Member x0 ward)   [arg1 nurse->ward]
substitution 2 anchors x1
  A            {(Member x1 ward)}
  B            {(Member x1 nurse)}
  factor       (Member x1 ward) ~ (Member x1 nurse)   [arg1 ward->nurse]
one-sided A    —
one-sided B    —
```

### seedA-035 · tierA-000178 ↔ tierA-000179 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A nurse takes a walk through the ward.
B: A nurse does not walk through the ward.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 nurse) (Member x1 ward)
one-sided A    {(Agent e0 x0) (Location e1 x1) (Member e0 take) (Member e1 walk) (Theme e0 e1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Location x0' x1) (Member x0' walk)) ~NEG}@x0,x1
```

### seedA-035 · tierA-000178 ↔ tierA-000180 · control: participant-swap · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A nurse takes a walk through the ward.
B: The ward walks through a nurse.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 walk) (Member x0 nurse) (Member x1 ward)
substitution 1 anchors e1 x0 x1   joint key: (And (Agent $e0 $x0) (Location $e0 $x1)) ~ (And (Agent $e1 $x1) (Location $e0 $x0) (Member $e1 take) (Theme $e1 $e0)) @$e0,$x0,$x1
  A            {(Agent e0 x0) (Member e0 take) (Theme e0 e1)} {(Location e1 x1)}
  B            {(Agent e1 x1)} {(Location e1 x0)}
  factor       (Location e1 x1) ~ (Agent e1 x1)   [head Location->Agent]
  A only       (Agent e0 x0) (Member e0 take) (Theme e0 e1)
  B only       (Location e1 x0)
one-sided A    —
one-sided B    —
```

### seedA-036 · tierA-000181 ↔ tierA-000183 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two children walk to the pier.
B: The pier walks to two children.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member e0 walk) (Member x1 pier)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Goal $e0 $x1)) ~ (And (Agent $e0 $x1) (Goal $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Goal e0 x1)}
  B            {(Agent e0 x1)} {(Goal e0 x0)}
  factor       (Agent e0 x0) ~ (Goal e0 x0)   [head Agent->Goal]
  factor       (Goal e0 x1) ~ (Agent e0 x1)   [head Goal->Agent]
one-sided A    —
one-sided B    —
```

### seedA-036 · tierA-000181 ↔ tierA-000184 · control: manner-near-miss · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Two children walk to the pier.
B: Two children stroll to the pier.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (Goal e0 x1) (GroupOf x0 child) (Member x1 pier)
substitution 1 anchors e0
  A            {(Member e0 walk)}
  B            {(Member e0 stroll)}
  factor       (Member e0 walk) ~ (Member e0 stroll)   [arg1 walk->stroll]
one-sided A    —
one-sided B    —
```

### seedA-036 · tierA-000182 ↔ tierA-000183 · control: participant-swap · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: Two children take a walk to the pier.
B: The pier walks to two children.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Cardinality x0 2) (GroupOf x0 child) (Member e1 walk) (Member x1 pier)
substitution 1 anchors e1 x0 x1   joint key: (And (Agent $e0 $x0) (Goal $e0 $x1)) ~ (And (Agent $e1 $x1) (Goal $e0 $x0) (Member $e1 take) (Patient $e1 $e0)) @$e0,$x0,$x1
  A            {(Agent e0 x0) (Member e0 take) (Patient e0 e1)} {(Goal e1 x1)}
  B            {(Agent e1 x1)} {(Goal e1 x0)}
  factor       (Goal e1 x1) ~ (Agent e1 x1)   [head Goal->Agent]
  A only       (Agent e0 x0) (Member e0 take) (Patient e0 e1)
  B only       (Goal e1 x0)
one-sided A    —
one-sided B    —
```

### seedA-036 · tierA-000182 ↔ tierA-000184 · control: manner-near-miss · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: Two children take a walk to the pier.
B: Two children stroll to the pier.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Cardinality x0 2) (GroupOf x0 child) (Member x1 pier)
substitution 1 anchors e0 x1   joint key: (And (Goal $e1 $x0) (Member $e0 take) (Member $e1 walk) (Patient $e0 $e1)) ~ (And (Goal $e0 $x0) (Member $e0 stroll)) @$e0,$x0
  A            {(Goal e1 x1) (Member e1 walk) (Patient e0 e1)} {(Member e0 take)}
  B            {(Goal e0 x1)} {(Member e0 stroll)}
  factor       (Member e0 take) ~ (Member e0 stroll)   [arg1 take->stroll]
  A only       (Goal e1 x1) (Member e1 walk) (Patient e0 e1)
  B only       (Goal e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-037 · tierA-000185 ↔ tierA-000188 · control: negation · quality 0.17 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A committee decides on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
one-sided A    {(Agent e0 x0) (Member e0 decide) (Member x1 new) (Member x1 roof) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000185 ↔ tierA-000189 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A committee decides on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 committee) (Member x1 new) (Member x1 roof) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-037 · tierA-000186 ↔ tierA-000188 · control: negation · quality 0.12 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A committee makes a decision on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
one-sided A    {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Member x1 new) (Member x1 roof) (Patient e0 e1) (Theme e1 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000186 ↔ tierA-000189 · control: modality-shift · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A committee makes a decision on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 make)} {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-037 · tierA-000187 ↔ tierA-000188 · control: negation · quality 0.12 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A committee reaches a decision on a new roof.
B: A committee does not decide on a new roof.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 committee)
one-sided A    {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Member x1 new) (Member x1 roof) (Theme e0 e1) (Theme e1 x1)}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Member x2' new) (Member x2' roof) (Theme x1 x2')) ~NEG}@x0
```

### seedA-037 · tierA-000187 ↔ tierA-000189 · control: modality-shift · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A committee reaches a decision on a new roof.
B: A committee might decide on a new roof.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 committee) (Member x1 new) (Member x1 roof)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 reach)} {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000190 ↔ tierA-000194 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A judge decides the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-038 · tierA-000190 ↔ tierA-000195 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge decides the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 judge)}
  B            {(Member x0 case)}
  factor       (Member x0 judge) ~ (Member x0 case)   [arg1 judge->case]
substitution 2 anchors x1
  A            {(Member x1 case)}
  B            {(Member x1 judge)}
  factor       (Member x1 case) ~ (Member x1 judge)   [arg1 case->judge]
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000191 ↔ tierA-000194 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge makes a decision on the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 make)} {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000191 ↔ tierA-000195 · control: participant-swap · quality 0.29 · common 2 · 1 substitution(s) / 2 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge makes a decision on the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 judge) (Member x1 case)
substitution 1 anchors x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 decide) (Theme $e0 $x0)) @$x0,$x1
  A            {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Agent e0 x1) (Member e0 decide) (Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Agent e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000192 ↔ tierA-000194 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge reaches a decision on the case.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 judge) (Member x1 case)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 reach)} {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000192 ↔ tierA-000195 · control: participant-swap · quality 0.29 · common 2 · 1 substitution(s) / 2 factor(s) · leftover 4 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A judge reaches a decision on the case.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 judge) (Member x1 case)
substitution 1 anchors x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 decide) (Theme $e0 $x0)) @$x0,$x1
  A            {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Agent e0 x1) (Member e0 decide) (Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Agent e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-038 · tierA-000193 ↔ tierA-000194 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The case is decided by a judge.
B: A judge might decide the case.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 judge) (Member x1 case) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-038 · tierA-000193 ↔ tierA-000195 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The case is decided by a judge.
B: The case decides a judge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 judge)}
  B            {(Member x0 case)}
  factor       (Member x0 judge) ~ (Member x0 case)   [arg1 judge->case]
substitution 2 anchors x1
  A            {(Member x1 case)}
  B            {(Member x1 judge)}
  factor       (Member x1 case) ~ (Member x1 judge)   [arg1 case->judge]
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000196 ↔ tierA-000199 · control: participant-swap · quality 0.25 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 3 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A family decides to move north.
B: North decides to move a family.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member e0 decide)
substitution 1 anchors e0   joint key: (And (Agent $e0 $x0) (Member $x0 family) (Theme $e0 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) ~ (And (Agent $e0 north) (Theme $e0 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1)))) @$e0
  A            {(Agent e0 x0) (Member x0 family) (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e0 north)} {(Theme e0 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  factor       (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e0 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Agent e0 x0) (Member x0 family)
  B only       (Agent e0 north)
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000196 ↔ tierA-000200 · control: negation · quality 0.25 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A family decides to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
one-sided A    {(Agent e0 x0) (Member e0 decide) (Theme e0 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-039 · tierA-000197 ↔ tierA-000199 · control: participant-swap · quality 0.00 · common 0 · 1 substitution(s) / 2 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A family makes a decision to move north.
B: North decides to move a family.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         —
substitution 1 anchors —   joint key: (And (Agent $e0 $x0) (Member $e0 make) (Member $e1 decision) (Member $x0 family) (Patient $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) ~ (And (Agent $e1 north) (Member $e1 decide) (Theme $e1 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1))))
  A            {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Member x0 family) (Patient e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e1 north) (Member e1 decide) (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  factor       (Member e1 decision) ~ (Member e1 decide)   [arg1 decision->decide]
  factor       (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Agent e0 x0) (Member e0 make) (Member x0 family) (Patient e0 e1)
  B only       (Agent e1 north)
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000197 ↔ tierA-000200 · control: negation · quality 0.17 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A family makes a decision to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
one-sided A    {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-039 · tierA-000198 ↔ tierA-000199 · control: participant-swap · quality 0.00 · common 0 · 1 substitution(s) / 2 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A family reaches a decision to move north.
B: North decides to move a family.

```
renaming a->b  e1->e0 x0->x0 x1->x1
common         —
substitution 1 anchors —   joint key: (And (Agent $e0 $x0) (Member $e0 reach) (Member $e1 decision) (Member $x0 family) (Theme $e0 $e1) (Theme $e1 (And (Agent $x1 $x0) (Goal $x1 north) (Member $x1 move)))) ~ (And (Agent $e1 north) (Member $e1 decide) (Theme $e1 (And (Agent $x0 north) (Member $x0 move) (Member $x1 family) (Theme $x0 $x1))))
  A            {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Member x0 family) (Theme e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}
  B            {(Agent e1 north) (Member e1 decide) (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))}
  factor       (Member e1 decision) ~ (Member e1 decide)   [arg1 decision->decide]
  factor       (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))) ~ (Theme e1 (And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1)))   [arg1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move))->(And (Agent x0 north) (Member x0 move) (Member x1 family) (Theme x0 x1))]
  A only       (Agent e0 x0) (Member e0 reach) (Member x0 family) (Theme e0 e1)
  B only       (Agent e1 north)
one-sided A    —
one-sided B    —
```

### seedA-039 · tierA-000198 ↔ tierA-000200 · control: negation · quality 0.17 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 2 renamings tied

A: A family reaches a decision to move north.
B: A family does not decide to move north.

```
renaming a->b  x0->x1 x1->x0
common         (Member x0 family)
one-sided A    {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 (And (Agent x1 x0) (Goal x1 north) (Member x1 move)))}@x0
one-sided B    {(And (Agent x1 x0) (Member x1 decide) (Theme x1 (And (Agent x2' x0) (Goal x2' north) (Member x2' move)))) ~NEG}@x0
```

### seedA-040 · tierA-000201 ↔ tierA-000205 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A board decides next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
one-sided A    {(Agent e0 x0) (Member e0 decide) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000201 ↔ tierA-000206 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A board decides next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-040 · tierA-000202 ↔ tierA-000205 · control: negation · quality 0.38 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A board makes a decision on next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
one-sided A    {(Agent e0 x0) (Member e0 make) (Member e1 decision) (Patient e0 e1) (Theme e1 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000202 ↔ tierA-000206 · control: modality-shift · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board makes a decision on next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 make) (Member $e1 decision) (Patient $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 make)} {(Member e1 decision) (Patient e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 make) ~ (Member e0 decide)   [arg1 make->decide]
  A only       (Member e1 decision) (Patient e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000203 ↔ tierA-000205 · control: negation · quality 0.38 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A board reaches a decision on next year's budget.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
one-sided A    {(Agent e0 x0) (Member e0 reach) (Member e1 decision) (Theme e0 e1) (Theme e1 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000203 ↔ tierA-000206 · control: modality-shift · quality 0.50 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A board reaches a decision on next year's budget.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 board) (Member x1 budget) (Possession x1 next_year)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 reach) (Member $e1 decision) (Theme $e0 $e1) (Theme $e1 $x0)) ~ (And (Member $e0 decide) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 reach)} {(Member e1 decision) (Theme e0 e1) (Theme e1 x1)}
  B            {(Member e0 decide)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 reach) ~ (Member e0 decide)   [arg1 reach->decide]
  A only       (Member e1 decision) (Theme e0 e1) (Theme e1 x1)
  B only       (Might e0) (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-040 · tierA-000204 ↔ tierA-000205 · control: negation · quality 0.50 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Next year's budget is decided by a board.
B: A board does not decide next year's budget.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 board) (Member x1 budget) (Possession x1 next_year)
one-sided A    {(Agent e0 x0) (Member e0 decide) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' decide) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-040 · tierA-000204 ↔ tierA-000206 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: Next year's budget is decided by a board.
B: A board might decide next year's budget.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 decide) (Member x0 board) (Member x1 budget) (Possession x1 next_year) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-041 · tierA-000207 ↔ tierA-000210 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A clerk answers the query.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  factor       (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
substitution 2 anchors x1
  A            {(Member x1 query)}
  B            {(Member x1 clerk)}
  factor       (Member x1 query) ~ (Member x1 clerk)   [arg1 query->clerk]
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000207 ↔ tierA-000211 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A clerk answers the query.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-041 · tierA-000208 ↔ tierA-000210 · control: participant-swap · quality 0.29 · common 2 · 3 substitution(s) / 3 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 3 renamings tied

A: A clerk gives an answer to the query.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x2->x1
common         (Agent e0 x0) (Theme e0 x2)
substitution 1 anchors e0   joint key: (And (Member $e0 give) (Member $x0 query) (Recipient $e0 $x0)) ~ (Member $e0 answer) @$e0
  A            {(Member e0 give)} {(Member x1 query) (Recipient e0 x1)}
  B            {(Member e0 answer)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  A only       (Member x1 query) (Recipient e0 x1)
substitution 2 anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  factor       (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
substitution 3 anchors x2
  A            {(Member x2 answer)}
  B            {(Member x2 clerk)}
  factor       (Member x2 answer) ~ (Member x2 clerk)   [arg1 answer->clerk]
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000208 ↔ tierA-000211 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 3 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A clerk gives an answer to the query.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 clerk) (Member x1 query)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 give)} {(Member x2 answer) (Theme e0 x2)} {(Recipient e0 x1)}
  B            {(Member e0 answer)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  A only       (Member x2 answer) (Theme e0 x2)
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000209 ↔ tierA-000210 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The query is answered by a clerk.
B: The query answers a clerk.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 clerk)}
  B            {(Member x0 query)}
  factor       (Member x0 clerk) ~ (Member x0 query)   [arg1 clerk->query]
substitution 2 anchors x1
  A            {(Member x1 query)}
  B            {(Member x1 clerk)}
  factor       (Member x1 query) ~ (Member x1 clerk)   [arg1 query->clerk]
one-sided A    —
one-sided B    —
```

### seedA-041 · tierA-000209 ↔ tierA-000211 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The query is answered by a clerk.
B: A clerk might answer the query.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 clerk) (Member x1 query) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-042 · tierA-000212 ↔ tierA-000215 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A pilot answers the tower.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-042 · tierA-000212 ↔ tierA-000216 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A pilot answers the tower.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 pilot) (Member x1 tower)
one-sided A    {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-042 · tierA-000213 ↔ tierA-000215 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 3 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A pilot gives an answer to the tower.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 pilot) (Member x1 tower)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 give) (Member $x1 answer) (Recipient $e0 $x0) (Theme $e0 $x1)) ~ (And (Member $e0 answer) (Might $e0) (Theme $e0 $x0)) @$e0,$x0
  A            {(Member e0 give)} {(Member x2 answer) (Theme e0 x2)} {(Recipient e0 x1)}
  B            {(Member e0 answer)} {(Might e0)} {(Theme e0 x1)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  factor       (Recipient e0 x1) ~ (Theme e0 x1)   [head Recipient->Theme]
  A only       (Member x2 answer) (Theme e0 x2)
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-042 · tierA-000213 ↔ tierA-000216 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A pilot gives an answer to the tower.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2 x2->x0
common         (Member x0 pilot) (Member x1 tower)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x2 answer) (Recipient e0 x1) (Theme e0 x2)}@x0,x1
one-sided B    {(And (Agent x2 x0) (Member x2 answer) (Theme x2 x1)) ~NEG}@x0,x1
```

### seedA-042 · tierA-000214 ↔ tierA-000215 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The tower is answered by a pilot.
B: A pilot might answer the tower.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Member x0 pilot) (Member x1 tower) (Theme e0 x1)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-042 · tierA-000214 ↔ tierA-000216 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The tower is answered by a pilot.
B: A pilot does not answer the tower.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 pilot) (Member x1 tower)
one-sided A    {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000217 ↔ tierA-000220 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A vet answers the caller.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 vet) (Member x1 caller)
one-sided A    {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000217 ↔ tierA-000221 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A vet answers the caller.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  factor       (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
substitution 2 anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 vet)}
  factor       (Member x1 caller) ~ (Member x1 vet)   [arg1 caller->vet]
one-sided A    —
one-sided B    —
```

### seedA-043 · tierA-000218 ↔ tierA-000220 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A vet gives an answer to the caller.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x0 x2->x2
common         (Member x0 vet) (Member x2 caller)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x1 answer) (Recipient e0 x2) (Theme e0 x1)}@x0,x2
one-sided B    {(And (Agent x1 x0) (Member x1 answer) (Theme x1 x2)) ~NEG}@x0,x2
```

### seedA-043 · tierA-000218 ↔ tierA-000221 · control: participant-swap · quality 0.29 · common 2 · 3 substitution(s) / 3 factor(s) · leftover 2 · one-sided A 0 region(s), B 0 · 3 renamings tied

A: A vet gives an answer to the caller.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Theme e0 x1)
substitution 1 anchors e0   joint key: (And (Member $e0 give) (Member $x0 caller) (Recipient $e0 $x0)) ~ (Member $e0 answer) @$e0
  A            {(Member e0 give)} {(Member x2 caller) (Recipient e0 x2)}
  B            {(Member e0 answer)}
  factor       (Member e0 give) ~ (Member e0 answer)   [arg1 give->answer]
  A only       (Member x2 caller) (Recipient e0 x2)
substitution 2 anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  factor       (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
substitution 3 anchors x1
  A            {(Member x1 answer)}
  B            {(Member x1 vet)}
  factor       (Member x1 answer) ~ (Member x1 vet)   [arg1 answer->vet]
one-sided A    —
one-sided B    —
```

### seedA-043 · tierA-000219 ↔ tierA-000220 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The caller is answered by a vet.
B: A vet does not answer the caller.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 vet) (Member x1 caller)
one-sided A    {(Agent e0 x0) (Member e0 answer) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' answer) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-043 · tierA-000219 ↔ tierA-000221 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The caller is answered by a vet.
B: The caller answers a vet.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 answer) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 vet)}
  B            {(Member x0 caller)}
  factor       (Member x0 vet) ~ (Member x0 caller)   [arg1 vet->caller]
substitution 2 anchors x1
  A            {(Member x1 caller)}
  B            {(Member x1 vet)}
  factor       (Member x1 caller) ~ (Member x1 vet)   [arg1 caller->vet]
one-sided A    —
one-sided B    —
```

### seedA-044 · tierA-000222 ↔ tierA-000225 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A storm destroys the greenhouse.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
one-sided A    {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000222 ↔ tierA-000226 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A storm destroys the greenhouse.
B: The greenhouse destroys a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 storm)}
  B            {(Member x0 greenhouse)}
  factor       (Member x0 storm) ~ (Member x0 greenhouse)   [arg1 storm->greenhouse]
substitution 2 anchors x1
  A            {(Member x1 greenhouse)}
  B            {(Member x1 storm)}
  factor       (Member x1 greenhouse) ~ (Member x1 storm)   [arg1 greenhouse->storm]
one-sided A    —
one-sided B    —
```

### seedA-044 · tierA-000223 ↔ tierA-000225 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A storm causes the destruction of the greenhouse.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
one-sided A    {(Agent e0 x0) (Member e0 cause) (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000223 ↔ tierA-000226 · control: participant-swap · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A storm causes the destruction of the greenhouse.
B: The greenhouse destroys a storm.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 destroy) (Member x0 storm) (Member x1 greenhouse)
substitution 1 anchors e1 x0 x1   joint key: (And (Agent $e0 $x0) (Patient $e0 $x1)) ~ (And (Agent $e1 $x1) (Member $e1 cause) (Patient $e0 $x0) (Theme $e1 $e0)) @$e0,$x0,$x1
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)} {(Patient e1 x1)}
  B            {(Agent e1 x1)} {(Patient e1 x0)}
  factor       (Patient e1 x1) ~ (Agent e1 x1)   [head Patient->Agent]
  A only       (Agent e0 x0) (Member e0 cause) (Theme e0 e1)
  B only       (Patient e1 x0)
one-sided A    —
one-sided B    —
```

### seedA-044 · tierA-000224 ↔ tierA-000225 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The greenhouse is destroyed by a storm.
B: A storm does not destroy the greenhouse.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 storm) (Member x1 greenhouse)
one-sided A    {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-044 · tierA-000224 ↔ tierA-000226 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The greenhouse is destroyed by a storm.
B: The greenhouse destroys a storm.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 storm)}
  B            {(Member x0 greenhouse)}
  factor       (Member x0 storm) ~ (Member x0 greenhouse)   [arg1 storm->greenhouse]
substitution 2 anchors x1
  A            {(Member x1 greenhouse)}
  B            {(Member x1 storm)}
  factor       (Member x1 greenhouse) ~ (Member x1 storm)   [arg1 greenhouse->storm]
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000227 ↔ tierA-000230 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A fire destroys the archive.
B: The archive destroys a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 fire)}
  B            {(Member x0 archive)}
  factor       (Member x0 fire) ~ (Member x0 archive)   [arg1 fire->archive]
substitution 2 anchors x1
  A            {(Member x1 archive)}
  B            {(Member x1 fire)}
  factor       (Member x1 archive) ~ (Member x1 fire)   [arg1 archive->fire]
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000227 ↔ tierA-000231 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A fire destroys the archive.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 destroy) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 destroy)} {(Patient e0 x1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000228 ↔ tierA-000230 · control: participant-swap · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A fire causes the destruction of the archive.
B: The archive destroys a fire.

```
renaming a->b  e1->e0 x0->x1 x1->x0
common         (Member e1 destroy) (Member x0 fire) (Member x1 archive)
substitution 1 anchors e1 x0 x1   joint key: (And (Agent $e0 $x0) (Patient $e0 $x1)) ~ (And (Agent $e1 $x1) (Member $e1 cause) (Patient $e0 $x0) (Theme $e1 $e0)) @$e0,$x0,$x1
  A            {(Agent e0 x0) (Member e0 cause) (Theme e0 e1)} {(Patient e1 x1)}
  B            {(Agent e1 x1)} {(Patient e1 x0)}
  factor       (Patient e1 x1) ~ (Agent e1 x1)   [head Patient->Agent]
  A only       (Agent e0 x0) (Member e0 cause) (Theme e0 e1)
  B only       (Patient e1 x0)
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000228 ↔ tierA-000231 · control: antonym · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A fire causes the destruction of the archive.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1)) @$e0,$x0
  A            {(Member e0 cause)} {(Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 cause) ~ (Member e0 save)   [arg1 cause->save]
  A only       (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000229 ↔ tierA-000230 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The archive is destroyed by a fire.
B: The archive destroys a fire.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 destroy) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 fire)}
  B            {(Member x0 archive)}
  factor       (Member x0 fire) ~ (Member x0 archive)   [arg1 fire->archive]
substitution 2 anchors x1
  A            {(Member x1 archive)}
  B            {(Member x1 fire)}
  factor       (Member x1 archive) ~ (Member x1 fire)   [arg1 archive->fire]
one-sided A    —
one-sided B    —
```

### seedA-045 · tierA-000229 ↔ tierA-000231 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The archive is destroyed by a fire.
B: A fire saves the archive.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 fire) (Member x1 archive)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 destroy) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 destroy)} {(Patient e0 x1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-046 · tierA-000232 ↔ tierA-000235 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A flood destroys the footbridge.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 destroy) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 destroy)} {(Patient e0 x1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-046 · tierA-000232 ↔ tierA-000236 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A flood destroys the footbridge.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
one-sided A    {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-046 · tierA-000233 ↔ tierA-000235 · control: antonym · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A flood causes the destruction of the footbridge.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 cause) (Member $e1 destroy) (Patient $e1 $x0) (Theme $e0 $e1)) @$e0,$x0
  A            {(Member e0 cause)} {(Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 cause) ~ (Member e0 save)   [arg1 cause->save]
  A only       (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)
  B only       (Theme e0 x1)
one-sided A    —
one-sided B    —
```

### seedA-046 · tierA-000233 ↔ tierA-000236 · control: negation · quality 0.29 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A flood causes the destruction of the footbridge.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
one-sided A    {(Agent e0 x0) (Member e0 cause) (Member e1 destroy) (Patient e1 x1) (Theme e0 e1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-046 · tierA-000234 ↔ tierA-000235 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The footbridge is destroyed by a flood.
B: A flood saves the footbridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 flood) (Member x1 footbridge)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 save) (Theme $e0 $x0)) ~ (And (Member $e0 destroy) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 destroy)} {(Patient e0 x1)}
  B            {(Member e0 save)} {(Theme e0 x1)}
  factor       (Member e0 destroy) ~ (Member e0 save)   [arg1 destroy->save]
  factor       (Patient e0 x1) ~ (Theme e0 x1)   [head Patient->Theme]
one-sided A    —
one-sided B    —
```

### seedA-046 · tierA-000234 ↔ tierA-000236 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The footbridge is destroyed by a flood.
B: A flood does not destroy the footbridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 flood) (Member x1 footbridge)
one-sided A    {(Agent e0 x0) (Member e0 destroy) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' destroy) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-047 · tierA-000237 ↔ tierA-000239 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The freight arrives at noon.
B: The freight does not arrive at noon.

```
renaming a->b  x0->x1
common         (Member x0 freight)
one-sided A    {(Agent e0 x0) (Future e0) (Member e0 arrive) (Time e0 (Hour 12))}@x0
one-sided B    {(And (Agent x0' x0) (Future x0') (Member x0' arrive) (Time x0' (Hour 12))) ~NEG}@x0
```

### seedA-047 · tierA-000237 ↔ tierA-000240 · control: modality-shift · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The freight arrives at noon.
B: The freight might arrive at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
substitution 1 anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
one-sided A    —
one-sided B    —
```

### seedA-047 · tierA-000238 ↔ tierA-000239 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The arrival of the freight is at noon.
B: The freight does not arrive at noon.

```
renaming a->b  x0->x1
common         (Member x0 freight)
one-sided A    {(Agent e0 x0) (Future e0) (Member e0 arrive) (Time e0 (Hour 12))}@x0
one-sided B    {(And (Agent x0' x0) (Future x0') (Member x0' arrive) (Time x0' (Hour 12))) ~NEG}@x0
```

### seedA-047 · tierA-000238 ↔ tierA-000240 · control: modality-shift · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The arrival of the freight is at noon.
B: The freight might arrive at noon.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 freight) (Time e0 (Hour 12))
substitution 1 anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
one-sided A    —
one-sided B    —
```

### seedA-048 · tierA-000241 ↔ tierA-000243 · control: modality-shift · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A delegation arrives on Thursday.
B: A delegation might arrive on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member e0 arrive) (Member x0 delegation) (Time e0 (Weekday thursday))
substitution 1 anchors e0
  A            {(Future e0)}
  B            {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
one-sided A    —
one-sided B    —
```

### seedA-048 · tierA-000241 ↔ tierA-000244 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A delegation arrives on Thursday.
B: A delegation departs on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
substitution 1 anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 depart)}
  factor       (Member e0 arrive) ~ (Member e0 depart)   [arg1 arrive->depart]
one-sided A    —
one-sided B    —
```

### seedA-048 · tierA-000242 ↔ tierA-000243 · control: modality-shift · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The arrival of a delegation is on Thursday.
B: A delegation might arrive on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Member x0 delegation) (Time e0 (Weekday thursday))
substitution 1 anchors e0   joint key: (And (Member $e0 arrive) (Might $e0)) ~ (And (Future $e0) (Member $e0 arrival)) @$e0
  A            {(Future e0)} {(Member e0 arrival)}
  B            {(Member e0 arrive)} {(Might e0)}
  factor       (Future e0) ~ (Might e0)   [head Future->Might]
  factor       (Member e0 arrival) ~ (Member e0 arrive)   [arg1 arrival->arrive]
one-sided A    —
one-sided B    —
```

### seedA-048 · tierA-000242 ↔ tierA-000244 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The arrival of a delegation is on Thursday.
B: A delegation departs on Thursday.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (Future e0) (Member x0 delegation) (Time e0 (Weekday thursday))
substitution 1 anchors e0
  A            {(Member e0 arrival)}
  B            {(Member e0 depart)}
  factor       (Member e0 arrival) ~ (Member e0 depart)   [arg1 arrival->depart]
one-sided A    —
one-sided B    —
```

### seedA-049 · tierA-000245 ↔ tierA-000247 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The soil samples arrive by post.
B: The soil samples depart by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
substitution 1 anchors e0
  A            {(Member e0 arrive)}
  B            {(Member e0 depart)}
  factor       (Member e0 arrive) ~ (Member e0 depart)   [arg1 arrive->depart]
one-sided A    —
one-sided B    —
```

### seedA-049 · tierA-000245 ↔ tierA-000248 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The soil samples arrive by post.
B: The soil samples do not arrive by post.

```
renaming a->b  x0->x0
common         (GroupOf x0 soil_sample) (Inheritance soil_sample sample)
one-sided A    {(Agent e0 x0) (Instrument e0 post) (Member e0 arrive)}@x0
one-sided B    —
```

### seedA-049 · tierA-000246 ↔ tierA-000247 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The soil samples' arrival is by post.
B: The soil samples depart by post.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 x0) (GroupOf x0 soil_sample) (Inheritance soil_sample sample) (Instrument e0 post)
substitution 1 anchors e0
  A            {(Member e0 arrival)}
  B            {(Member e0 depart)}
  factor       (Member e0 arrival) ~ (Member e0 depart)   [arg1 arrival->depart]
one-sided A    —
one-sided B    —
```

### seedA-049 · tierA-000246 ↔ tierA-000248 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The soil samples' arrival is by post.
B: The soil samples do not arrive by post.

```
renaming a->b  x0->x0
common         (GroupOf x0 soil_sample) (Inheritance soil_sample sample)
one-sided A    {(Agent e0 x0) (Instrument e0 post) (Member e0 arrival)}@x0
one-sided B    —
```

### seedA-050 · tierA-000249 ↔ tierA-000251 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An old mare dies during the winter.
B: An old mare survives during the winter.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-050 · tierA-000249 ↔ tierA-000252 · control: modality-shift · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An old mare dies during the winter.
B: An old mare might die during the winter.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-050 · tierA-000250 ↔ tierA-000251 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An old mare kicks the bucket during the winter.
B: An old mare survives during the winter.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-050 · tierA-000250 ↔ tierA-000252 · control: modality-shift · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An old mare kicks the bucket during the winter.
B: An old mare might die during the winter.

```
renaming a->b  
common         —
one-sided A    —
one-sided B    —
```

### seedA-051 · tierA-000253 ↔ tierA-000255 · control: modality-shift · quality 0.80 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: The founder dies at ninety.
B: The founder might die at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member e0 die) (Member x0 founder) (Patient e0 x0)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-051 · tierA-000253 ↔ tierA-000256 · control: negation · quality 0.25 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: The founder dies at ninety.
B: The founder does not die at ninety.

```
renaming a->b  x0->x0
common         (Member x0 founder)
one-sided A    {(Measure x0 age 90 year)}@x0 {(Member e0 die) (Patient e0 x0)}@x0
one-sided B    {(And (Measure x0 age 90 year) (Member x1' die) (Patient x1' x0)) ~NEG}@x0
```

### seedA-051 · tierA-000254 ↔ tierA-000255 · control: modality-shift · quality 0.60 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The founder kicks the bucket at ninety.
B: The founder might die at ninety.

```
renaming a->b  e0->e0 x0->x0
common         (Measure x0 age 90 year) (Member x0 founder) (Patient e0 x0)
substitution 1 anchors e0   joint key: (Member $e0 kick_the_bucket) ~ (And (Member $e0 die) (Might $e0)) @$e0
  A            {(Member e0 kick_the_bucket)}
  B            {(Member e0 die)} {(Might e0)}
  factor       (Member e0 kick_the_bucket) ~ (Member e0 die)   [arg1 kick_the_bucket->die]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-051 · tierA-000254 ↔ tierA-000256 · control: negation · quality 0.25 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: The founder kicks the bucket at ninety.
B: The founder does not die at ninety.

```
renaming a->b  x0->x0
common         (Member x0 founder)
one-sided A    {(Measure x0 age 90 year)}@x0 {(Member e0 kick_the_bucket) (Patient e0 x0)}@x0
one-sided B    {(And (Measure x0 age 90 year) (Member x1' die) (Patient x1' x0)) ~NEG}@x0
```

### seedA-052 · tierA-000257 ↔ tierA-000259 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The last elm dies that autumn.
B: The last elm does not die that autumn.

```
renaming a->b  x0->x1
common         (Member x0 elm) (Member x0 last)
one-sided A    {(Member e0 die) (Patient e0 x0) (Time e0 that_autumn)}@x0
one-sided B    {(And (Member x0' die) (Patient x0' x0) (Time x0' that_autumn)) ~NEG}@x0
```

### seedA-052 · tierA-000257 ↔ tierA-000260 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The last elm dies that autumn.
B: The last elm survives that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Time e0 that_autumn)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 survive)) ~ (And (Member $e0 die) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 die)} {(Patient e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 survive)}
  factor       (Member e0 die) ~ (Member e0 survive)   [arg1 die->survive]
  factor       (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-052 · tierA-000258 ↔ tierA-000259 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The last elm kicks the bucket that autumn.
B: The last elm does not die that autumn.

```
renaming a->b  x0->x1
common         (Member x0 elm) (Member x0 last)
one-sided A    {(Member e0 kick_the_bucket) (Patient e0 x0) (Time e0 that_autumn)}@x0
one-sided B    {(And (Member x0' die) (Patient x0' x0) (Time x0' that_autumn)) ~NEG}@x0
```

### seedA-052 · tierA-000258 ↔ tierA-000260 · control: antonym · quality 0.60 · common 3 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The last elm kicks the bucket that autumn.
B: The last elm survives that autumn.

```
renaming a->b  e0->e0 x0->x0
common         (Member x0 elm) (Member x0 last) (Time e0 that_autumn)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 survive)) ~ (And (Member $e0 kick_the_bucket) (Patient $e0 $x0)) @$e0,$x0
  A            {(Member e0 kick_the_bucket)} {(Patient e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 survive)}
  factor       (Member e0 kick_the_bucket) ~ (Member e0 survive)   [arg1 kick_the_bucket->survive]
  factor       (Patient e0 x0) ~ (Agent e0 x0)   [head Patient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000261 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 24 renamings tied

A: A trainer gives a recruit a whistle.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)}
one-sided B    {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000261 ↔ tierA-000265 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A trainer gives a recruit a whistle.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 whistle) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 whistle)) @$x0
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)} {(GroupOf x2 whistle)}
  factor       (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
  B only       (GroupOf x2 whistle)
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000262 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 24 renamings tied

A: A recruit receives a whistle from a trainer.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
one-sided A    {(Agent e0 x0) (Member e0 receive) (Member x0 recruit) (Member x1 trainer) (Member x2 whistle) (Source e0 x1) (Theme e0 x2)}
one-sided B    {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000262 ↔ tierA-000265 · control: quantity-change · quality 0.38 · common 3 · 2 substitution(s) / 4 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A recruit receives a whistle from a trainer.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 recruit) (Member x1 trainer) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 receive)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 give)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
substitution 2 anchors x2   joint key: (Member $x0 whistle) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 whistle)) @$x0
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)} {(GroupOf x2 whistle)}
  factor       (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
  B only       (GroupOf x2 whistle)
one-sided A    —
one-sided B    —
```

### seedA-053 · tierA-000263 ↔ tierA-000264 · control: negation · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 24 renamings tied

A: A trainer gives a whistle to a recruit.
B: A trainer does not give a recruit a whistle.

```
renaming a->b  x0->x0 x1->x1 x2->x2
common         —
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Member x2 whistle) (Recipient e0 x1) (Theme e0 x2)}
one-sided B    {(And (Agent x0 x1) (Member x0 give) (Member x1 trainer) (Member x2 whistle) (Member x3' recruit) (Recipient x0 x3') (Theme x0 x2)) ~NEG}
```

### seedA-053 · tierA-000263 ↔ tierA-000265 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A trainer gives a whistle to a recruit.
B: A trainer gives a recruit two whistles.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 trainer) (Member x1 recruit) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 whistle) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 whistle)) @$x0
  A            {(Member x2 whistle)}
  B            {(Cardinality x2 2)} {(GroupOf x2 whistle)}
  factor       (Member x2 whistle) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 whistle->2]
  B only       (GroupOf x2 whistle)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000266 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000266 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives each member a card.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000267 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000267 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: Each member receives a card from a library.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000268 ↔ tierA-000269 · control: quantity-change · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives a card to each member.
B: A library gives each member two cards.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-054 · tierA-000268 ↔ tierA-000270 · control: participant-swap · quality 1.00 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · IDENTICAL PARSES

A: A library gives a card to each member.
B: Each member gives a library a card.

```
renaming a->b  x0->x0
common         (Member x0 library)
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000271 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A foreman gives a driver the manifest.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x1 manifest) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 foreman)}
  B            {(Member x0 driver)}
  factor       (Member x0 foreman) ~ (Member x0 driver)   [arg1 foreman->driver]
substitution 2 anchors x2
  A            {(Member x2 driver)}
  B            {(Member x2 foreman)}
  factor       (Member x2 driver) ~ (Member x2 foreman)   [arg1 driver->foreman]
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000271 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A foreman gives a driver the manifest.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 manifest)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 give) (Member x2 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x1)) ~NEG}@x1
```

### seedA-055 · tierA-000272 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A driver receives the manifest from a foreman.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member x0 driver) (Member x1 foreman) (Member x2 manifest) (Theme e0 x2)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 receive) (Source $e0 $x0)) ~ (And (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Member e0 receive)} {(Source e0 x1)}
  B            {(Member e0 give)} {(Recipient e0 x1)}
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Recipient e0 x1)   [head Source->Recipient]
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000272 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A driver receives the manifest from a foreman.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 manifest)
one-sided A    {(Agent e0 x0) (Member e0 receive) (Member x0 driver) (Member x1 foreman) (Source e0 x1) (Theme e0 x2)}@x2
one-sided B    {(And (Agent x0 x1) (Member x0 give) (Member x1 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x2)) ~NEG}@x2
```

### seedA-055 · tierA-000273 ↔ tierA-000274 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A foreman gives the manifest to a driver.
B: A driver gives a foreman the manifest.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x1 manifest) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 foreman)}
  B            {(Member x0 driver)}
  factor       (Member x0 foreman) ~ (Member x0 driver)   [arg1 foreman->driver]
substitution 2 anchors x2
  A            {(Member x2 driver)}
  B            {(Member x2 foreman)}
  factor       (Member x2 driver) ~ (Member x2 foreman)   [arg1 driver->foreman]
one-sided A    —
one-sided B    —
```

### seedA-055 · tierA-000273 ↔ tierA-000275 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A foreman gives the manifest to a driver.
B: A foreman does not give a driver the manifest.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 manifest)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 foreman) (Member x2 driver) (Recipient e0 x2) (Theme e0 x1)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 give) (Member x2 foreman) (Member x2' driver) (Recipient x0 x2') (Theme x0 x1)) ~NEG}@x1
```

### seedA-056 · tierA-000276 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A school gives the winner a medal.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 winner)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 school) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 give) (Member x2 school) (Member x2' medal) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-056 · tierA-000276 ↔ tierA-000280 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A school gives the winner a medal.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 medal) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 medal)) @$x0
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)} {(GroupOf x2 medal)}
  factor       (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
  B only       (GroupOf x2 medal)
one-sided A    —
one-sided B    —
```

### seedA-056 · tierA-000277 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: The winner receives a medal from a school.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (Member x0 winner)
one-sided A    {(Agent e0 x0) (Member e0 receive) (Member x1 school) (Member x2 medal) (Source e0 x1) (Theme e0 x2)}@x0
one-sided B    {(And (Agent x1 x2) (Member x1 give) (Member x2 school) (Member x2' medal) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-056 · tierA-000277 ↔ tierA-000280 · control: quantity-change · quality 0.38 · common 3 · 2 substitution(s) / 4 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The winner receives a medal from a school.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 winner) (Member x1 school) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 receive) (Source $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 give) (Recipient $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 receive)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 give)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 receive) ~ (Member e0 give)   [arg1 receive->give]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
substitution 2 anchors x2   joint key: (Member $x0 medal) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 medal)) @$x0
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)} {(GroupOf x2 medal)}
  factor       (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
  B only       (GroupOf x2 medal)
one-sided A    —
one-sided B    —
```

### seedA-056 · tierA-000278 ↔ tierA-000279 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A school gives a medal to the winner.
B: A school does not give the winner a medal.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (Member x1 winner)
one-sided A    {(Agent e0 x0) (Member e0 give) (Member x0 school) (Member x2 medal) (Recipient e0 x1) (Theme e0 x2)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 give) (Member x2 school) (Member x2' medal) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-056 · tierA-000278 ↔ tierA-000280 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A school gives a medal to the winner.
B: A school gives the winner two medals.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 give) (Member x0 school) (Member x1 winner) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 medal) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 medal)) @$x0
  A            {(Member x2 medal)}
  B            {(Cardinality x2 2)} {(GroupOf x2 medal)}
  factor       (Member x2 medal) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 medal->2]
  B only       (GroupOf x2 medal)
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000281 ↔ tierA-000284 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A potter teaches an apprentice glazing.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-057 · tierA-000281 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A potter teaches an apprentice glazing.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Recipient e0 x1) (Theme e0 glazing)
substitution 1 anchors x0
  A            {(Member x0 potter)}
  B            {(Member x0 apprentice)}
  factor       (Member x0 potter) ~ (Member x0 apprentice)   [arg1 potter->apprentice]
substitution 2 anchors x1
  A            {(Member x1 apprentice)}
  B            {(Member x1 potter)}
  factor       (Member x1 apprentice) ~ (Member x1 potter)   [arg1 apprentice->potter]
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000282 ↔ tierA-000284 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: An apprentice learns glazing from a potter.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Might $e0) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 learn)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 teach)} {(Might e0)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000282 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An apprentice learns glazing from a potter.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 apprentice) (Member x1 potter) (Theme e0 glazing)
substitution 1 anchors e0 x1   joint key: (And (Member $e0 teach) (Recipient $e0 $x0)) ~ (And (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0
  A            {(Member e0 learn)} {(Source e0 x1)}
  B            {(Member e0 teach)} {(Recipient e0 x1)}
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x1) ~ (Recipient e0 x1)   [head Source->Recipient]
one-sided A    —
one-sided B    —
```

### seedA-057 · tierA-000283 ↔ tierA-000284 · control: modality-shift · quality 0.86 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A potter teaches glazing to an apprentice.
B: A potter might teach an apprentice glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Member x0 potter) (Member x1 apprentice) (Recipient e0 x1) (Theme e0 glazing)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-057 · tierA-000283 ↔ tierA-000285 · control: participant-swap · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A potter teaches glazing to an apprentice.
B: An apprentice teaches a potter glazing.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 teach) (Recipient e0 x1) (Theme e0 glazing)
substitution 1 anchors x0
  A            {(Member x0 potter)}
  B            {(Member x0 apprentice)}
  factor       (Member x0 potter) ~ (Member x0 apprentice)   [arg1 potter->apprentice]
substitution 2 anchors x1
  A            {(Member x1 apprentice)}
  B            {(Member x1 potter)}
  factor       (Member x1 apprentice) ~ (Member x1 potter)   [arg1 apprentice->potter]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000286 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A coach teaches the squad a drill.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 teach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 coach)}
  B            {(Member x0 squad)}
  factor       (Member x0 coach) ~ (Member x0 squad)   [arg1 coach->squad]
substitution 2 anchors x2
  A            {(Member x2 squad)}
  B            {(Member x2 coach)}
  factor       (Member x2 squad) ~ (Member x2 coach)   [arg1 squad->coach]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000286 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A coach teaches the squad a drill.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 squad)
one-sided A    {(Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)}@x2
one-sided B    {(And (Agent x0 x1) (Member x0 teach) (Member x1 coach) (Member x2' drill) (Recipient x0 x2) (Theme x0 x2')) ~NEG}@x2
```

### seedA-058 · tierA-000287 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The squad learns a drill from a coach.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member x0 squad) (Member x1 drill) (Member x2 coach) (Theme e0 x1)
substitution 1 anchors e0 x2   joint key: (And (Member $e0 teach) (Recipient $e0 $x0)) ~ (And (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0
  A            {(Member e0 learn)} {(Source e0 x2)}
  B            {(Member e0 teach)} {(Recipient e0 x2)}
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x2) ~ (Recipient e0 x2)   [head Source->Recipient]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000287 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: The squad learns a drill from a coach.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (Member x0 squad)
one-sided A    {(Agent e0 x0) (Member e0 learn) (Member x1 drill) (Member x2 coach) (Source e0 x2) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x2) (Member x1 teach) (Member x2 coach) (Member x2' drill) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-058 · tierA-000288 ↔ tierA-000289 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A coach teaches a drill to the squad.
B: The squad teaches a coach a drill.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 teach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 coach)}
  B            {(Member x0 squad)}
  factor       (Member x0 coach) ~ (Member x0 squad)   [arg1 coach->squad]
substitution 2 anchors x2
  A            {(Member x2 squad)}
  B            {(Member x2 coach)}
  factor       (Member x2 squad) ~ (Member x2 coach)   [arg1 squad->coach]
one-sided A    —
one-sided B    —
```

### seedA-058 · tierA-000288 ↔ tierA-000290 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A coach teaches a drill to the squad.
B: A coach does not teach the squad a drill.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 squad)
one-sided A    {(Agent e0 x0) (Member e0 teach) (Member x0 coach) (Member x1 drill) (Recipient e0 x2) (Theme e0 x1)}@x2
one-sided B    {(And (Agent x0 x1) (Member x0 teach) (Member x1 coach) (Member x2' drill) (Recipient x0 x2) (Theme x0 x2')) ~NEG}@x2
```

### seedA-059 · tierA-000291 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: An elder teaches the children a song.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (GroupOf x1 child)
one-sided A    {(Agent e0 x0) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 teach) (Member x2 elder) (Member x2' song) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-059 · tierA-000291 ↔ tierA-000295 · control: modality-shift · quality 0.88 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: An elder teaches the children a song.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-059 · tierA-000292 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: The children learn a song from an elder.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x3 x1->x0 x2->x1
common         (GroupOf x0 child)
one-sided A    {(Agent e0 x0) (Member e0 learn) (Member x1 song) (Member x2 elder) (Source e0 x2) (Theme e0 x1)}@x0
one-sided B    {(And (Agent x1 x2) (Member x1 teach) (Member x2 elder) (Member x2' song) (Recipient x1 x0) (Theme x1 x2')) ~NEG}@x0
```

### seedA-059 · tierA-000292 ↔ tierA-000295 · control: modality-shift · quality 0.50 · common 4 · 1 substitution(s) / 3 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The children learn a song from an elder.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x1 x1->x2 x2->x0
common         (GroupOf x0 child) (Member x1 song) (Member x2 elder) (Theme e0 x1)
substitution 1 anchors e0 x0 x2   joint key: (And (Agent $e0 $x0) (Member $e0 teach) (Might $e0) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 learn) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 learn)} {(Source e0 x2)}
  B            {(Agent e0 x2)} {(Member e0 teach)} {(Might e0)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 learn) ~ (Member e0 teach)   [arg1 learn->teach]
  factor       (Source e0 x2) ~ (Agent e0 x2)   [head Source->Agent]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-059 · tierA-000293 ↔ tierA-000294 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: An elder teaches a song to the children.
B: An elder does not teach the children a song.

```
renaming a->b  x0->x0 x1->x3 x2->x1
common         (GroupOf x1 child)
one-sided A    {(Agent e0 x0) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)}@x1
one-sided B    {(And (Agent x0 x2) (Member x0 teach) (Member x2 elder) (Member x2' song) (Recipient x0 x1) (Theme x0 x2')) ~NEG}@x1
```

### seedA-059 · tierA-000293 ↔ tierA-000295 · control: modality-shift · quality 0.88 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: An elder teaches a song to the children.
B: An elder might teach the children a song.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (GroupOf x1 child) (Member e0 teach) (Member x0 elder) (Member x2 song) (Recipient e0 x1) (Theme e0 x2)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-060 · tierA-000296 ↔ tierA-000299 · control: quantity-change · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A neighbour lends Ravi a ladder.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Recipient e0 ravi) (Theme e0 x1)
substitution 1 anchors x1   joint key: (Member $x0 ladder) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 ladder)) @$x0
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)} {(GroupOf x1 ladder)}
  factor       (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
  B only       (GroupOf x1 ladder)
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000296 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A neighbour lends Ravi a ladder.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Recipient $e0 ravi)) ~ (And (Agent $e0 ravi) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000297 ↔ tierA-000299 · control: quantity-change · quality 0.29 · common 2 · 2 substitution(s) / 4 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: Ravi borrows a ladder from a neighbour.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 neighbour) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 ravi)) ~ (And (Agent $e0 ravi) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0
  A            {(Agent e0 ravi)} {(Member e0 borrow)} {(Source e0 x0)}
  B            {(Agent e0 x0)} {(Member e0 lend)} {(Recipient e0 ravi)}
  factor       (Agent e0 ravi) ~ (Member e0 lend)   [head Agent->Member; arg1 ravi->lend]
  factor       (Member e0 borrow) ~ (Recipient e0 ravi)   [head Member->Recipient; arg1 borrow->ravi]
  factor       (Source e0 x0) ~ (Agent e0 x0)   [head Source->Agent]
substitution 2 anchors x1   joint key: (Member $x0 ladder) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 ladder)) @$x0
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)} {(GroupOf x1 ladder)}
  factor       (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
  B only       (GroupOf x1 ladder)
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000297 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: Ravi borrows a ladder from a neighbour.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Agent e0 ravi) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Member $e0 lend) (Recipient $e0 $x0)) ~ (And (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0
  A            {(Member e0 borrow)} {(Source e0 x0)}
  B            {(Member e0 lend)} {(Recipient e0 x0)}
  factor       (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
  factor       (Source e0 x0) ~ (Recipient e0 x0)   [head Source->Recipient]
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000298 ↔ tierA-000299 · control: quantity-change · quality 0.71 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A neighbour lends a ladder to Ravi.
B: A neighbour lends Ravi two ladders.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 neighbour) (Recipient e0 ravi) (Theme e0 x1)
substitution 1 anchors x1   joint key: (Member $x0 ladder) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 ladder)) @$x0
  A            {(Member x1 ladder)}
  B            {(Cardinality x1 2)} {(GroupOf x1 ladder)}
  factor       (Member x1 ladder) ~ (Cardinality x1 2)   [head Member->Cardinality; arg1 ladder->2]
  B only       (GroupOf x1 ladder)
one-sided A    —
one-sided B    —
```

### seedA-060 · tierA-000298 ↔ tierA-000300 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A neighbour lends a ladder to Ravi.
B: Ravi lends a neighbour a ladder.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 lend) (Member x0 neighbour) (Member x1 ladder) (Theme e0 x1)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 $x0) (Recipient $e0 ravi)) ~ (And (Agent $e0 ravi) (Recipient $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0)} {(Recipient e0 ravi)}
  B            {(Agent e0 ravi)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Recipient e0 ravi) ~ (Agent e0 ravi)   [head Recipient->Agent]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000301 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The depot lends the crew a generator.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x1 generator) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 depot)}
  B            {(Member x0 crew)}
  factor       (Member x0 depot) ~ (Member x0 crew)   [arg1 depot->crew]
substitution 2 anchors x2
  A            {(Member x2 crew)}
  B            {(Member x2 depot)}
  factor       (Member x2 crew) ~ (Member x2 depot)   [arg1 crew->depot]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000301 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The depot lends the crew a generator.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x1 x1->x3 x2->x2
common         (Member x0 depot) (Member x1 generator) (Member x2 crew)
one-sided A    {(Agent e0 x0) (Member e0 lend) (Recipient e0 x2) (Theme e0 x1)}@x0,x1,x2
one-sided B    {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x2) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-061 · tierA-000302 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The crew borrows a generator from the depot.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member x0 crew) (Member x1 generator) (Member x2 depot) (Theme e0 x1)
substitution 1 anchors e0 x2   joint key: (And (Member $e0 lend) (Recipient $e0 $x0)) ~ (And (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0
  A            {(Member e0 borrow)} {(Source e0 x2)}
  B            {(Member e0 lend)} {(Recipient e0 x2)}
  factor       (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
  factor       (Source e0 x2) ~ (Recipient e0 x2)   [head Source->Recipient]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000302 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The crew borrows a generator from the depot.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x2 x1->x3 x2->x1
common         (Member x0 crew) (Member x1 generator) (Member x2 depot)
one-sided A    {(Agent e0 x0) (Member e0 borrow) (Source e0 x2) (Theme e0 x1)}@x0,x1,x2
one-sided B    {(And (Agent x0' x2) (Member x0' lend) (Recipient x0' x0) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-061 · tierA-000303 ↔ tierA-000304 · control: participant-swap · quality 0.71 · common 5 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The depot lends a generator to the crew.
B: The crew lends the depot a generator.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Member e0 lend) (Member x1 generator) (Recipient e0 x2) (Theme e0 x1)
substitution 1 anchors x0
  A            {(Member x0 depot)}
  B            {(Member x0 crew)}
  factor       (Member x0 depot) ~ (Member x0 crew)   [arg1 depot->crew]
substitution 2 anchors x2
  A            {(Member x2 crew)}
  B            {(Member x2 depot)}
  factor       (Member x2 crew) ~ (Member x2 depot)   [arg1 crew->depot]
one-sided A    —
one-sided B    —
```

### seedA-061 · tierA-000303 ↔ tierA-000305 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The depot lends a generator to the crew.
B: The depot does not lend the crew a generator.

```
renaming a->b  x0->x1 x1->x3 x2->x2
common         (Member x0 depot) (Member x1 generator) (Member x2 crew)
one-sided A    {(Agent e0 x0) (Member e0 lend) (Recipient e0 x2) (Theme e0 x1)}@x0,x1,x2
one-sided B    {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x2) (Theme x0' x1)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000306 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The museum lends the gallery a painting.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x1 x1->x2 x2->x3
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting)
one-sided A    {(Agent e0 x0) (Member e0 lend) (Recipient e0 x1) (Theme e0 x2)}@x0,x1,x2
one-sided B    {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x1) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000306 ↔ tierA-000310 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The museum lends the gallery a painting.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 painting) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 painting)) @$x0
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)} {(GroupOf x2 painting)}
  factor       (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
  B only       (GroupOf x2 painting)
one-sided A    —
one-sided B    —
```

### seedA-062 · tierA-000307 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The gallery borrows a painting from the museum.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x2 x1->x1 x2->x3
common         (Member x0 gallery) (Member x1 museum) (Member x2 painting)
one-sided A    {(Agent e0 x0) (Member e0 borrow) (Source e0 x1) (Theme e0 x2)}@x0,x1,x2
one-sided B    {(And (Agent x0' x1) (Member x0' lend) (Recipient x0' x0) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000307 ↔ tierA-000310 · control: quantity-change · quality 0.38 · common 3 · 2 substitution(s) / 4 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The gallery borrows a painting from the museum.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x2 x1->x0 x2->x1
common         (Member x0 gallery) (Member x1 museum) (Theme e0 x2)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 lend) (Recipient $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $e0 borrow) (Source $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Member e0 borrow)} {(Source e0 x1)}
  B            {(Agent e0 x1)} {(Member e0 lend)} {(Recipient e0 x0)}
  factor       (Agent e0 x0) ~ (Recipient e0 x0)   [head Agent->Recipient]
  factor       (Member e0 borrow) ~ (Member e0 lend)   [arg1 borrow->lend]
  factor       (Source e0 x1) ~ (Agent e0 x1)   [head Source->Agent]
substitution 2 anchors x2   joint key: (Member $x0 painting) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 painting)) @$x0
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)} {(GroupOf x2 painting)}
  factor       (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
  B only       (GroupOf x2 painting)
one-sided A    —
one-sided B    —
```

### seedA-062 · tierA-000308 ↔ tierA-000309 · control: negation · quality 0.43 · common 3 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The museum lends a painting to the gallery.
B: The museum does not lend the gallery a painting.

```
renaming a->b  x0->x1 x1->x2 x2->x3
common         (Member x0 museum) (Member x1 gallery) (Member x2 painting)
one-sided A    {(Agent e0 x0) (Member e0 lend) (Recipient e0 x1) (Theme e0 x2)}@x0,x1,x2
one-sided B    {(And (Agent x0' x0) (Member x0' lend) (Recipient x0' x1) (Theme x0' x2)) ~NEG}@x0,x1,x2
```

### seedA-062 · tierA-000308 ↔ tierA-000310 · control: quantity-change · quality 0.75 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The museum lends a painting to the gallery.
B: The museum lends the gallery two paintings.

```
renaming a->b  e0->e0 x0->x0 x1->x2 x2->x1
common         (Agent e0 x0) (Member e0 lend) (Member x0 museum) (Member x1 gallery) (Recipient e0 x1) (Theme e0 x2)
substitution 1 anchors x2   joint key: (Member $x0 painting) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 painting)) @$x0
  A            {(Member x2 painting)}
  B            {(Cardinality x2 2)} {(GroupOf x2 painting)}
  factor       (Member x2 painting) ~ (Cardinality x2 2)   [head Member->Cardinality; arg1 painting->2]
  B only       (GroupOf x2 painting)
one-sided A    —
one-sided B    —
```

### seedA-063 · tierA-000311 ↔ tierA-000313 · control: modality-shift · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: Ana works with Bo on the mural.
B: Ana might work with Bo on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (CoAgent e0 bo) (Member e0 work) (Member x0 mural)
substitution 1 anchors e0 x0   joint key: (Theme $e0 $x0) ~ (And (Location $e0 $x0) (Might $e0)) @$e0,$x0
  A            {(Theme e0 x0)}
  B            {(Location e0 x0)} {(Might e0)}
  factor       (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
  B only       (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-063 · tierA-000311 ↔ tierA-000314 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Ana works with Bo on the mural.
B: Ana does not work with Bo on the mural.

```
renaming a->b  x0->x1
common         (Member x0 mural)
one-sided A    {(Agent e0 ana) (CoAgent e0 bo) (Member e0 work) (Theme e0 x0)}@x0
one-sided B    {(And (Agent x0' ana) (CoAgent x0' bo) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-063 · tierA-000312 ↔ tierA-000313 · control: modality-shift · quality 0.43 · common 3 · 1 substitution(s) / 1 factor(s) · leftover 5 · one-sided A 0 region(s), B 0

A: Ana and Bo work on the mural.
B: Ana might work with Bo on the mural.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 ana) (Member e0 work) (Member x0 mural)
substitution 1 anchors e0 x0   joint key: (And (Agent $e0 bo) (Member $e0 work) (Theme $e0 $x0) (Theme $e1 $x0)) ~ (And (CoAgent $e1 bo) (Location $e1 $x0) (Might $e1)) @$e1,$x0
  A            {(Agent e1 bo) (Member e1 work) (Theme e1 x0)} {(Theme e0 x0)}
  B            {(CoAgent e0 bo)} {(Location e0 x0)} {(Might e0)}
  factor       (Theme e0 x0) ~ (Location e0 x0)   [head Theme->Location]
  A only       (Agent e1 bo) (Member e1 work) (Theme e1 x0)
  B only       (CoAgent e0 bo) (Might e0)
one-sided A    —
one-sided B    —
```

### seedA-063 · tierA-000312 ↔ tierA-000314 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: Ana and Bo work on the mural.
B: Ana does not work with Bo on the mural.

```
renaming a->b  x0->x1
common         (Member x0 mural)
one-sided A    {(Agent e0 ana) (Member e0 work) (Theme e0 x0)}@x0 {(Agent e1 bo) (Member e1 work) (Theme e1 x0)}@x0
one-sided B    {(And (Agent x0' ana) (CoAgent x0' bo) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-064 · tierA-000315 ↔ tierA-000317 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1 · 6 renamings tied

A: A welder works with a fitter on the frame.
B: A welder does not work with a fitter on the frame.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 frame)
one-sided A    {(Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member e0 work) (Member x0 welder) (Member x1 fitter)}@x2
one-sided B    {(And (Agent x0 x1) (CoAgent x0 x2') (Location x0 x2) (Member x0 work) (Member x1 welder) (Member x2' fitter)) ~NEG}@x2
```

### seedA-064 · tierA-000315 ↔ tierA-000318 · control: manner-near-miss · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A welder works with a fitter on the frame.
B: A welder competes with a fitter on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
substitution 1 anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 compete)}
  factor       (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
one-sided A    —
one-sided B    —
```

### seedA-064 · tierA-000316 ↔ tierA-000317 · control: negation · quality 0.11 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1 · 6 renamings tied

A: A welder and a fitter work on the frame.
B: A welder does not work with a fitter on the frame.

```
renaming a->b  x0->x0 x1->x1 x2->x3
common         (Member x2 frame)
one-sided A    {(Agent e0 x0) (Location e0 x2) (Member e0 work) (Member x0 welder)}@x2 {(Agent e1 x1) (Location e1 x2) (Member e1 work) (Member x1 fitter)}@x2
one-sided B    {(And (Agent x0 x1) (CoAgent x0 x2') (Location x0 x2) (Member x0 work) (Member x1 welder) (Member x2' fitter)) ~NEG}@x2
```

### seedA-064 · tierA-000316 ↔ tierA-000318 · control: manner-near-miss · quality 0.56 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 1 region(s), B 0

A: A welder and a fitter work on the frame.
B: A welder competes with a fitter on the frame.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (Location e0 x2) (Member x0 welder) (Member x1 fitter) (Member x2 frame)
substitution 1 anchors e0 x1   joint key: (Member $e0 work) ~ (And (CoAgent $e0 $x0) (Member $e0 compete)) @$e0,$x0
  A            {(Member e0 work)}
  B            {(CoAgent e0 x1)} {(Member e0 compete)}
  factor       (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
  B only       (CoAgent e0 x1)
one-sided A    {(Agent e1 x1) (Location e1 x2) (Member e1 work)}@x1,x2
one-sided B    —
```

### seedA-065 · tierA-000319 ↔ tierA-000321 · control: manner-near-miss · quality 0.86 · common 6 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A biologist works with a ranger on the survey.
B: A biologist competes with a ranger on the survey.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
substitution 1 anchors e0
  A            {(Member e0 work)}
  B            {(Member e0 compete)}
  factor       (Member e0 work) ~ (Member e0 compete)   [arg1 work->compete]
one-sided A    —
one-sided B    —
```

### seedA-065 · tierA-000319 ↔ tierA-000322 · control: modality-shift · quality 0.88 · common 7 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: A biologist works with a ranger on the survey.
B: A biologist might work with a ranger on the survey.

```
renaming a->b  e0->e0 x0->x0 x1->x1 x2->x2
common         (Agent e0 x0) (CoAgent e0 x1) (Location e0 x2) (Member e0 work) (Member x0 biologist) (Member x1 ranger) (Member x2 survey)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-065 · tierA-000320 ↔ tierA-000321 · control: manner-near-miss · quality 0.56 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 1 region(s), B 0

A: A biologist and a ranger work on the survey.
B: A biologist competes with a ranger on the survey.

```
renaming a->b  e1->e0 x0->x1 x1->x0 x2->x2
common         (Agent e1 x1) (Location e1 x2) (Member x0 ranger) (Member x1 biologist) (Member x2 survey)
substitution 1 anchors e1 x0   joint key: (Member $e0 work) ~ (And (CoAgent $e0 $x0) (Member $e0 compete)) @$e0,$x0
  A            {(Member e1 work)}
  B            {(CoAgent e1 x0)} {(Member e1 compete)}
  factor       (Member e1 work) ~ (Member e1 compete)   [arg1 work->compete]
  B only       (CoAgent e1 x0)
one-sided A    {(Agent e0 x0) (Location e0 x2) (Member e0 work)}@x0,x2
one-sided B    —
```

### seedA-065 · tierA-000320 ↔ tierA-000322 · control: modality-shift · quality 0.67 · common 6 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 2

A: A biologist and a ranger work on the survey.
B: A biologist might work with a ranger on the survey.

```
renaming a->b  e1->e0 x0->x1 x1->x0 x2->x2
common         (Agent e1 x1) (Location e1 x2) (Member e1 work) (Member x0 ranger) (Member x1 biologist) (Member x2 survey)
one-sided A    {(Agent e0 x0) (Location e0 x2) (Member e0 work)}@x0,x2
one-sided B    {(CoAgent e1 x0)}@e1,x0 {(Might e1)}@e1
```

### seedA-066 · tierA-000323 ↔ tierA-000325 · control: modality-shift · quality 0.83 · common 5 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 0 region(s), B 1

A: Dara works with Nils on the ledger.
B: Dara might work with Nils on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (CoAgent e0 nils) (Location e0 x0) (Member e0 work) (Member x0 ledger)
one-sided A    —
one-sided B    {(Might e0)}@e0
```

### seedA-066 · tierA-000323 ↔ tierA-000326 · control: negation · quality 0.20 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: Dara works with Nils on the ledger.
B: Dara does not work with Nils on the ledger.

```
renaming a->b  x0->x1
common         (Member x0 ledger)
one-sided A    {(Agent e0 dara) (CoAgent e0 nils) (Location e0 x0) (Member e0 work)}@x0
one-sided B    {(And (Agent x0' dara) (CoAgent x0' nils) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-066 · tierA-000324 ↔ tierA-000325 · control: modality-shift · quality 0.57 · common 4 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 2

A: Dara and Nils work on the ledger.
B: Dara might work with Nils on the ledger.

```
renaming a->b  e0->e0 x0->x0
common         (Agent e0 dara) (Location e0 x0) (Member e0 work) (Member x0 ledger)
one-sided A    {(Agent e1 nils) (Location e1 x0) (Member e1 work)}@x0
one-sided B    {(CoAgent e0 nils)}@e0 {(Might e0)}@e0
```

### seedA-066 · tierA-000324 ↔ tierA-000326 · control: negation · quality 0.14 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: Dara and Nils work on the ledger.
B: Dara does not work with Nils on the ledger.

```
renaming a->b  x0->x1
common         (Member x0 ledger)
one-sided A    {(Agent e0 dara) (Location e0 x0) (Member e0 work)}@x0 {(Agent e1 nils) (Location e1 x0) (Member e1 work)}@x0
one-sided B    {(And (Agent x0' dara) (CoAgent x0' nils) (Location x0' x0) (Member x0' work)) ~NEG}@x0
```

### seedA-067 · tierA-000327 ↔ tierA-000329 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A crate is large in size.
B: A crate is small in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 small)}
  factor       (Member x0 large) ~ (Member x0 small)   [arg1 large->small]
one-sided A    —
one-sided B    —
```

### seedA-067 · tierA-000327 ↔ tierA-000330 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A crate is large in size.
B: A crate is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 large) ~NEG}
  factor       (Member x0 large) ~ (Member x0 large) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-067 · tierA-000328 ↔ tierA-000329 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A crate is big in size.
B: A crate is small in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
substitution 1 anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 small)}
  factor       (Member x0 big) ~ (Member x0 small)   [arg1 big->small]
one-sided A    —
one-sided B    —
```

### seedA-067 · tierA-000328 ↔ tierA-000330 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A crate is big in size.
B: A crate is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 crate)
substitution 1 anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 large) ~NEG}
  factor       (Member x0 big) ~ (Member x0 large) ~NEG   [arg1 big->large; polarity]
one-sided A    —
one-sided B    —
```

### seedA-068 · tierA-000331 ↔ tierA-000333 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The hatch is large in size.
B: The hatch is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 large) ~NEG}
  factor       (Member x0 large) ~ (Member x0 large) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-068 · tierA-000331 ↔ tierA-000334 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The hatch is large in size.
B: The hatch might be large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
one-sided A    {(Member x0 large)}@x0
one-sided B    {(Might (Member x0 large))}@x0
```

### seedA-068 · tierA-000332 ↔ tierA-000333 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The hatch is big in size.
B: The hatch is not large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
substitution 1 anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 large) ~NEG}
  factor       (Member x0 big) ~ (Member x0 large) ~NEG   [arg1 big->large; polarity]
one-sided A    —
one-sided B    —
```

### seedA-068 · tierA-000332 ↔ tierA-000334 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The hatch is big in size.
B: The hatch might be large in size.

```
renaming a->b  x0->x0
common         (Member x0 hatch)
one-sided A    {(Member x0 big)}@x0
one-sided B    {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000335 ↔ tierA-000337 · control: modality-shift · quality 0.67 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The new bench is large.
B: The new bench might be large.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
one-sided A    {(Member x0 large)}@x0
one-sided B    {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000335 ↔ tierA-000338 · control: antonym · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The new bench is large.
B: The new bench is small.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
substitution 1 anchors x0
  A            {(Member x0 large)}
  B            {(Member x0 small)}
  factor       (Member x0 large) ~ (Member x0 small)   [arg1 large->small]
one-sided A    —
one-sided B    —
```

### seedA-069 · tierA-000336 ↔ tierA-000337 · control: modality-shift · quality 0.67 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The new bench is big.
B: The new bench might be large.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
one-sided A    {(Member x0 big)}@x0
one-sided B    {(Might (Member x0 large))}@x0
```

### seedA-069 · tierA-000336 ↔ tierA-000338 · control: antonym · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The new bench is big.
B: The new bench is small.

```
renaming a->b  x0->x0
common         (Member x0 bench) (Member x0 new)
substitution 1 anchors x0
  A            {(Member x0 big)}
  B            {(Member x0 small)}
  factor       (Member x0 big) ~ (Member x0 small)   [arg1 big->small]
one-sided A    —
one-sided B    —
```

### seedA-070 · tierA-000339 ↔ tierA-000341 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The boiler is huge in size.
B: The boiler is tiny in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
substitution 1 anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 tiny)}
  factor       (Member x0 huge) ~ (Member x0 tiny)   [arg1 huge->tiny]
one-sided A    —
one-sided B    —
```

### seedA-070 · tierA-000339 ↔ tierA-000342 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The boiler is huge in size.
B: The boiler is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
substitution 1 anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 huge) ~NEG}
  factor       (Member x0 huge) ~ (Member x0 huge) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-070 · tierA-000340 ↔ tierA-000341 · control: antonym · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The boiler is very big in size.
B: The boiler is tiny in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
substitution 1 anchors x0   joint key: (Member $x0 tiny) ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Degree x0 big very)} {(Member x0 big)}
  B            {(Member x0 tiny)}
  factor       (Member x0 big) ~ (Member x0 tiny)   [arg1 big->tiny]
  A only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-070 · tierA-000340 ↔ tierA-000342 · control: negation · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The boiler is very big in size.
B: The boiler is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 boiler)
substitution 1 anchors x0   joint key: (Member $x0 huge) ~NEG ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Degree x0 big very)} {(Member x0 big)}
  B            {(Member x0 huge) ~NEG}
  factor       (Member x0 big) ~ (Member x0 huge) ~NEG   [arg1 big->huge; polarity]
  A only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-071 · tierA-000343 ↔ tierA-000345 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The skylight is huge in size.
B: The skylight is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
substitution 1 anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 huge) ~NEG}
  factor       (Member x0 huge) ~ (Member x0 huge) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-071 · tierA-000343 ↔ tierA-000346 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The skylight is huge in size.
B: The skylight might be huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
one-sided A    {(Member x0 huge)}@x0
one-sided B    {(Might (Member x0 huge))}@x0
```

### seedA-071 · tierA-000344 ↔ tierA-000345 · control: negation · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The skylight is very big in size.
B: The skylight is not huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
substitution 1 anchors x0   joint key: (Member $x0 huge) ~NEG ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Degree x0 big very)} {(Member x0 big)}
  B            {(Member x0 huge) ~NEG}
  factor       (Member x0 big) ~ (Member x0 huge) ~NEG   [arg1 big->huge; polarity]
  A only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-071 · tierA-000344 ↔ tierA-000346 · control: modality-shift · quality 0.33 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: The skylight is very big in size.
B: The skylight might be huge in size.

```
renaming a->b  x0->x0
common         (Member x0 skylight)
one-sided A    {(Degree x0 big very)}@x0 {(Member x0 big)}@x0
one-sided B    {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000347 ↔ tierA-000349 · control: modality-shift · quality 0.67 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The spoil mound is huge.
B: The spoil mound might be huge.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
one-sided A    {(Member x0 huge)}@x0
one-sided B    {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000347 ↔ tierA-000350 · control: antonym · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The spoil mound is huge.
B: The spoil mound is tiny.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
substitution 1 anchors x0
  A            {(Member x0 huge)}
  B            {(Member x0 tiny)}
  factor       (Member x0 huge) ~ (Member x0 tiny)   [arg1 huge->tiny]
one-sided A    —
one-sided B    —
```

### seedA-072 · tierA-000348 ↔ tierA-000349 · control: modality-shift · quality 0.50 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: The spoil mound is very big.
B: The spoil mound might be huge.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
one-sided A    {(Degree x0 big very)}@x0 {(Member x0 big)}@x0
one-sided B    {(Might (Member x0 huge))}@x0
```

### seedA-072 · tierA-000348 ↔ tierA-000350 · control: antonym · quality 0.50 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The spoil mound is very big.
B: The spoil mound is tiny.

```
renaming a->b  x0->x0
common         (Inheritance spoil_mound mound) (Member x0 spoil_mound)
substitution 1 anchors x0   joint key: (Member $x0 tiny) ~ (And (Degree $x0 big very) (Member $x0 big)) @$x0
  A            {(Degree x0 big very)} {(Member x0 big)}
  B            {(Member x0 tiny)}
  factor       (Member x0 big) ~ (Member x0 tiny)   [arg1 big->tiny]
  A only       (Degree x0 big very)
one-sided A    —
one-sided B    —
```

### seedA-073 · tierA-000351 ↔ tierA-000353 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The repair is difficult.
B: The repair is easy.

```
renaming a->b  x0->x0
common         (Member x0 repair)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 easy)}
  factor       (Member x0 difficult) ~ (Member x0 easy)   [arg1 difficult->easy]
one-sided A    —
one-sided B    —
```

### seedA-073 · tierA-000351 ↔ tierA-000354 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The repair is difficult.
B: The repair is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 repair)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 difficult) ~NEG}
  factor       (Member x0 difficult) ~ (Member x0 difficult) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-073 · tierA-000352 ↔ tierA-000353 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The repair is hard.
B: The repair is easy.

```
renaming a->b  x0->x0
common         (Member x0 repair)
substitution 1 anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 easy)}
  factor       (Member x0 hard) ~ (Member x0 easy)   [arg1 hard->easy]
one-sided A    —
one-sided B    —
```

### seedA-073 · tierA-000352 ↔ tierA-000354 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The repair is hard.
B: The repair is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 repair)
substitution 1 anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 difficult) ~NEG}
  factor       (Member x0 hard) ~ (Member x0 difficult) ~NEG   [arg1 hard->difficult; polarity]
one-sided A    —
one-sided B    —
```

### seedA-074 · tierA-000355 ↔ tierA-000357 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The calibration is difficult.
B: The calibration is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 difficult) ~NEG}
  factor       (Member x0 difficult) ~ (Member x0 difficult) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-074 · tierA-000355 ↔ tierA-000358 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The calibration is difficult.
B: The calibration might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
one-sided A    {(Member x0 difficult)}@x0
one-sided B    {(Might (Member x0 difficult))}@x0
```

### seedA-074 · tierA-000356 ↔ tierA-000357 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The calibration is hard.
B: The calibration is not difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
substitution 1 anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 difficult) ~NEG}
  factor       (Member x0 hard) ~ (Member x0 difficult) ~NEG   [arg1 hard->difficult; polarity]
one-sided A    —
one-sided B    —
```

### seedA-074 · tierA-000356 ↔ tierA-000358 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The calibration is hard.
B: The calibration might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 calibration)
one-sided A    {(Member x0 hard)}@x0
one-sided B    {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000359 ↔ tierA-000361 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The descent is difficult.
B: The descent might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 descent)
one-sided A    {(Member x0 difficult)}@x0
one-sided B    {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000359 ↔ tierA-000362 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The descent is difficult.
B: The descent is easy.

```
renaming a->b  x0->x0
common         (Member x0 descent)
substitution 1 anchors x0
  A            {(Member x0 difficult)}
  B            {(Member x0 easy)}
  factor       (Member x0 difficult) ~ (Member x0 easy)   [arg1 difficult->easy]
one-sided A    —
one-sided B    —
```

### seedA-075 · tierA-000360 ↔ tierA-000361 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The descent is hard.
B: The descent might be difficult.

```
renaming a->b  x0->x0
common         (Member x0 descent)
one-sided A    {(Member x0 hard)}@x0
one-sided B    {(Might (Member x0 difficult))}@x0
```

### seedA-075 · tierA-000360 ↔ tierA-000362 · control: antonym · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The descent is hard.
B: The descent is easy.

```
renaming a->b  x0->x0
common         (Member x0 descent)
substitution 1 anchors x0
  A            {(Member x0 hard)}
  B            {(Member x0 easy)}
  factor       (Member x0 hard) ~ (Member x0 easy)   [arg1 hard->easy]
one-sided A    —
one-sided B    —
```

### seedA-076 · tierA-000363 ↔ tierA-000365 · control: antonym · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The night crew is exhausted.
B: The night crew is energetic.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
substitution 1 anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 energetic)}
  factor       (Member x0 exhausted) ~ (Member x0 energetic)   [arg1 exhausted->energetic]
one-sided A    —
one-sided B    —
```

### seedA-076 · tierA-000363 ↔ tierA-000366 · control: negation · quality 0.67 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The night crew is exhausted.
B: The night crew is not exhausted.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
substitution 1 anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 exhausted) ~NEG}
  factor       (Member x0 exhausted) ~ (Member x0 exhausted) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-076 · tierA-000364 ↔ tierA-000365 · control: antonym · quality 0.50 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The night crew is very tired.
B: The night crew is energetic.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
substitution 1 anchors x0   joint key: (Member $x0 energetic) ~ (And (Degree $x0 tired very) (Member $x0 tired)) @$x0
  A            {(Degree x0 tired very)} {(Member x0 tired)}
  B            {(Member x0 energetic)}
  factor       (Member x0 tired) ~ (Member x0 energetic)   [arg1 tired->energetic]
  A only       (Degree x0 tired very)
one-sided A    —
one-sided B    —
```

### seedA-076 · tierA-000364 ↔ tierA-000366 · control: negation · quality 0.50 · common 2 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The night crew is very tired.
B: The night crew is not exhausted.

```
renaming a->b  x0->x0
common         (Inheritance night_crew crew) (Member x0 night_crew)
substitution 1 anchors x0   joint key: (Member $x0 exhausted) ~NEG ~ (And (Degree $x0 tired very) (Member $x0 tired)) @$x0
  A            {(Degree x0 tired very)} {(Member x0 tired)}
  B            {(Member x0 exhausted) ~NEG}
  factor       (Member x0 tired) ~ (Member x0 exhausted) ~NEG   [arg1 tired->exhausted; polarity]
  A only       (Degree x0 tired very)
one-sided A    —
one-sided B    —
```

### seedA-077 · tierA-000367 ↔ tierA-000369 · control: negation · quality 0.50 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The courier is exhausted.
B: The courier is not exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
substitution 1 anchors x0
  A            {(Member x0 exhausted)}
  B            {(Member x0 exhausted) ~NEG}
  factor       (Member x0 exhausted) ~ (Member x0 exhausted) ~NEG   [polarity]
one-sided A    —
one-sided B    —
```

### seedA-077 · tierA-000367 ↔ tierA-000370 · control: modality-shift · quality 0.50 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The courier is exhausted.
B: The courier might be exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
one-sided A    {(Member x0 exhausted)}@x0
one-sided B    {(Might (Member x0 exhausted))}@x0
```

### seedA-077 · tierA-000368 ↔ tierA-000369 · control: negation · quality 0.33 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The courier is very tired.
B: The courier is not exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
substitution 1 anchors x0   joint key: (Member $x0 exhausted) ~NEG ~ (And (Degree $x0 tired very) (Member $x0 tired)) @$x0
  A            {(Degree x0 tired very)} {(Member x0 tired)}
  B            {(Member x0 exhausted) ~NEG}
  factor       (Member x0 tired) ~ (Member x0 exhausted) ~NEG   [arg1 tired->exhausted; polarity]
  A only       (Degree x0 tired very)
one-sided A    —
one-sided B    —
```

### seedA-077 · tierA-000368 ↔ tierA-000370 · control: modality-shift · quality 0.33 · common 1 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 2 region(s), B 1

A: The courier is very tired.
B: The courier might be exhausted.

```
renaming a->b  x0->x0
common         (Member x0 courier)
one-sided A    {(Degree x0 tired very)}@x0 {(Member x0 tired)}@x0
one-sided B    {(Might (Member x0 exhausted))}@x0
```

### seedA-078 · tierA-000371 ↔ tierA-000373 · control: modality-shift · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The divers are all exhausted.
B: The divers might all be exhausted.

```
renaming a->b  
common         —
one-sided A    {(Inheritance diver exhausted)}
one-sided B    —
```

### seedA-078 · tierA-000371 ↔ tierA-000374 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The divers are all exhausted.
B: The divers are all energetic.

```
renaming a->b  
common         —
one-sided A    {(Inheritance diver exhausted)}
one-sided B    —
```

### seedA-078 · tierA-000372 ↔ tierA-000373 · control: modality-shift · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The divers are all very tired.
B: The divers might all be exhausted.

```
renaming a->b  
common         —
one-sided A    {(Degree diver tired very) (Inheritance diver tired)}
one-sided B    —
```

### seedA-078 · tierA-000372 ↔ tierA-000374 · control: antonym · quality 0.00 · common 0 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 0

A: The divers are all very tired.
B: The divers are all energetic.

```
renaming a->b  
common         —
one-sided A    {(Degree diver tired very) (Inheritance diver tired)}
one-sided B    —
```

### seedA-079 · tierA-000375 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: A physician signs the chart.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 chart)}
  factor       (Member x0 physician) ~ (Member x0 chart)   [arg1 physician->chart]
substitution 2 anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  factor       (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000375 ↔ tierA-000379 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A physician signs the chart.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 physician) (Member x1 chart)
one-sided A    {(Agent e0 x0) (Member e0 sign) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-079 · tierA-000376 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor signs the chart.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 chart)}
  factor       (Member x0 doctor) ~ (Member x0 chart)   [arg1 doctor->chart]
substitution 2 anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  factor       (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000376 ↔ tierA-000379 · control: negation · quality 0.20 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A doctor signs the chart.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 chart)
substitution 1 anchors x1   joint key: (And (Agent $e0 $x0) (Member $e0 sign) (Member $x0 doctor) (Patient $e0 $x1)) ~ (And (And (Agent $x2 $x0) (Member $x2 sign) (Patient $x2 $x1)) ~NEG (Member $x0 physician)) @$x1
  A            {(Agent e0 x0) (Member e0 sign) (Member x0 doctor) (Patient e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG (Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
  A only       (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
  B only       (And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000377 ↔ tierA-000378 · control: participant-swap · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0 · 2 renamings tied

A: The chart is signed by a physician.
B: The chart signs a physician.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 sign) (Patient e0 x1)
substitution 1 anchors x0
  A            {(Member x0 physician)}
  B            {(Member x0 chart)}
  factor       (Member x0 physician) ~ (Member x0 chart)   [arg1 physician->chart]
substitution 2 anchors x1
  A            {(Member x1 chart)}
  B            {(Member x1 physician)}
  factor       (Member x1 chart) ~ (Member x1 physician)   [arg1 chart->physician]
one-sided A    —
one-sided B    —
```

### seedA-079 · tierA-000377 ↔ tierA-000379 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The chart is signed by a physician.
B: A physician does not sign the chart.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 physician) (Member x1 chart)
one-sided A    {(Agent e0 x0) (Member e0 sign) (Patient e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' sign) (Patient x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000380 ↔ tierA-000383 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: A physician examines the samples.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample) (Member x0 physician)
one-sided A    {(Agent e0 x0) (Member e0 examine) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000380 ↔ tierA-000384 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician examines the samples.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member x0 physician) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  factor       (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000381 ↔ tierA-000383 · control: negation · quality 0.20 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A doctor examines the samples.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample)
substitution 1 anchors x1   joint key: (And (Agent $e0 $x0) (Member $e0 examine) (Member $x0 doctor) (Theme $e0 $x1)) ~ (And (And (Agent $x2 $x0) (Member $x2 examine) (Theme $x2 $x1)) ~NEG (Member $x0 physician)) @$x1
  A            {(Agent e0 x0) (Member e0 examine) (Member x0 doctor) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG (Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
  A only       (Agent e0 x0) (Member e0 examine) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000381 ↔ tierA-000384 · control: antonym · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor examines the samples.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  factor       (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
substitution 2 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
one-sided A    —
one-sided B    —
```

### seedA-080 · tierA-000382 ↔ tierA-000383 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The samples are examined by a physician.
B: A physician does not examine the samples.

```
renaming a->b  x0->x1 x1->x2
common         (GroupOf x1 sample) (Member x0 physician)
one-sided A    {(Agent e0 x0) (Member e0 examine) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' examine) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-080 · tierA-000382 ↔ tierA-000384 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: The samples are examined by a physician.
B: A physician ignores the samples.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (GroupOf x1 sample) (Member x0 physician) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 examine)}
  B            {(Member e0 ignore)}
  factor       (Member e0 examine) ~ (Member e0 ignore)   [arg1 examine->ignore]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000385 ↔ tierA-000388 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician orders a second scan.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  factor       (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000385 ↔ tierA-000389 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A physician orders a second scan.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000386 ↔ tierA-000388 · control: antonym · quality 0.67 · common 4 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor orders a second scan.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  factor       (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
substitution 2 anchors x0
  A            {(Member x0 doctor)}
  B            {(Member x0 physician)}
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000386 ↔ tierA-000389 · control: participant-swap · quality 0.50 · common 3 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A doctor orders a second scan.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x1 scan) (Ordinal x1 2 scan)
substitution 1 anchors e0 x1   joint key: (And (Agent $e0 $x0) (Member $x1 physician) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Member $x1 doctor) (Theme $e0 $x0)) @$e0,$x0
  A            {(Agent e0 x0) (Member x0 doctor)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Member x0 physician) (Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Member x0 doctor) ~ (Member x0 physician)   [arg1 doctor->physician]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000387 ↔ tierA-000388 · control: antonym · quality 0.83 · common 5 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second scan is ordered by a physician.
B: A physician cancels a second scan.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 order)}
  B            {(Member e0 cancel)}
  factor       (Member e0 order) ~ (Member e0 cancel)   [arg1 order->cancel]
one-sided A    —
one-sided B    —
```

### seedA-081 · tierA-000387 ↔ tierA-000389 · control: participant-swap · quality 0.67 · common 4 · 1 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A second scan is ordered by a physician.
B: A second scan orders a physician.

```
renaming a->b  e0->e0 x0->x1 x1->x0
common         (Member e0 order) (Member x0 physician) (Member x1 scan) (Ordinal x1 2 scan)
substitution 1 anchors e0 x0 x1   joint key: (And (Agent $e0 $x0) (Theme $e0 $x1)) ~ (And (Agent $e0 $x1) (Theme $e0 $x0)) @$e0,$x0,$x1
  A            {(Agent e0 x0)} {(Theme e0 x1)}
  B            {(Agent e0 x1)} {(Theme e0 x0)}
  factor       (Agent e0 x0) ~ (Theme e0 x0)   [head Agent->Theme]
  factor       (Theme e0 x1) ~ (Agent e0 x1)   [head Theme->Agent]
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000390 ↔ tierA-000393 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An automobile blocks the lane.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 lane)
one-sided A    {(Agent e0 x0) (Member e0 block) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-082 · tierA-000390 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: An automobile blocks the lane.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
substitution 1 anchors x0   joint key: (Member $x0 automobile) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)) @$x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)} {(GroupOf x0 automobile)}
  factor       (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
  B only       (GroupOf x0 automobile)
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000391 ↔ tierA-000393 · control: negation · quality 0.20 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A car blocks the lane.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 lane)
substitution 1 anchors x1   joint key: (And (Agent $e0 $x0) (Member $e0 block) (Member $x0 car) (Theme $e0 $x1)) ~ (And (And (Agent $x2 $x0) (Member $x2 block) (Theme $x2 $x1)) ~NEG (Member $x0 automobile)) @$x1
  A            {(Agent e0 x0) (Member e0 block) (Member x0 car) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG (Member x0 automobile)}
  factor       (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
  A only       (Agent e0 x0) (Member e0 block) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000391 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A car blocks the lane.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
substitution 1 anchors x0   joint key: (Member $x0 car) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)) @$x0
  A            {(Member x0 car)}
  B            {(Cardinality x0 2)} {(GroupOf x0 automobile)}
  factor       (Member x0 car) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 car->2]
  B only       (GroupOf x0 automobile)
one-sided A    —
one-sided B    —
```

### seedA-082 · tierA-000392 ↔ tierA-000393 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: The lane is blocked by an automobile.
B: An automobile does not block the lane.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 lane)
one-sided A    {(Agent e0 x0) (Member e0 block) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' block) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-082 · tierA-000392 ↔ tierA-000394 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: The lane is blocked by an automobile.
B: Two automobiles block the lane.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member e0 block) (Member x1 lane) (Theme e0 x1)
substitution 1 anchors x0   joint key: (Member $x0 automobile) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)) @$x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)} {(GroupOf x0 automobile)}
  factor       (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
  B only       (GroupOf x0 automobile)
one-sided A    —
one-sided B    —
```

### seedA-083 · tierA-000395 ↔ tierA-000397 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: An automobile waits at the gate.
B: Two automobiles wait at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
substitution 1 anchors x0   joint key: (Member $x0 automobile) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)) @$x0
  A            {(Member x0 automobile)}
  B            {(Cardinality x0 2)} {(GroupOf x0 automobile)}
  factor       (Member x0 automobile) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 automobile->2]
  B only       (GroupOf x0 automobile)
one-sided A    —
one-sided B    —
```

### seedA-083 · tierA-000395 ↔ tierA-000398 · control: antonym · quality 0.40 · common 2 · 1 substitution(s) / 3 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An automobile waits at the gate.
B: An automobile leaves the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x0 automobile) (Member x1 gate)
substitution 1 anchors x0 x1   joint key: (And (Agent $e0 $x0) (Member $e0 leave) (Theme $e0 $x1)) ~ (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait)) @$x0,$x1
  A            {(Experiencer e0 x0) (Location e0 x1) (Member e0 wait)}
  B            {(Agent e0 x0) (Member e0 leave) (Theme e0 x1)}
  factor       (Experiencer e0 x0) ~ (Agent e0 x0)   [head Experiencer->Agent]
  factor       (Location e0 x1) ~ (Theme e0 x1)   [head Location->Theme]
  factor       (Member e0 wait) ~ (Member e0 leave)   [arg1 wait->leave]
one-sided A    —
one-sided B    —
```

### seedA-083 · tierA-000396 ↔ tierA-000397 · control: quantity-change · quality 0.67 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 1 · one-sided A 0 region(s), B 0

A: A car waits at the gate.
B: Two automobiles wait at the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x1 gate)
substitution 1 anchors x0   joint key: (Member $x0 car) ~ (And (Cardinality $x0 <num>) (GroupOf $x0 automobile)) @$x0
  A            {(Member x0 car)}
  B            {(Cardinality x0 2)} {(GroupOf x0 automobile)}
  factor       (Member x0 car) ~ (Cardinality x0 2)   [head Member->Cardinality; arg1 car->2]
  B only       (GroupOf x0 automobile)
one-sided A    —
one-sided B    —
```

### seedA-083 · tierA-000396 ↔ tierA-000398 · control: antonym · quality 0.20 · common 1 · 1 substitution(s) / 4 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A car waits at the gate.
B: An automobile leaves the gate.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Member x1 gate)
substitution 1 anchors x1   joint key: (And (Agent $e0 $x0) (Member $e0 leave) (Member $x0 automobile) (Theme $e0 $x1)) ~ (And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 wait) (Member $x0 car)) @$x1
  A            {(Experiencer e0 x0) (Location e0 x1) (Member e0 wait) (Member x0 car)}
  B            {(Agent e0 x0) (Member e0 leave) (Member x0 automobile) (Theme e0 x1)}
  factor       (Experiencer e0 x0) ~ (Agent e0 x0)   [head Experiencer->Agent]
  factor       (Location e0 x1) ~ (Theme e0 x1)   [head Location->Theme]
  factor       (Member e0 wait) ~ (Member e0 leave)   [arg1 wait->leave]
  factor       (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
one-sided A    —
one-sided B    —
```

### seedA-084 · tierA-000399 ↔ tierA-000401 · control: antonym · quality 0.80 · common 4 · 1 substitution(s) / 1 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: An automobile crosses the bridge.
B: An automobile avoids the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x0 automobile) (Member x1 bridge) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cross)}
  B            {(Member e0 avoid)}
  factor       (Member e0 cross) ~ (Member e0 avoid)   [arg1 cross->avoid]
one-sided A    —
one-sided B    —
```

### seedA-084 · tierA-000399 ↔ tierA-000402 · control: negation · quality 0.40 · common 2 · 0 substitution(s) / 0 factor(s) · leftover 0 · one-sided A 1 region(s), B 1

A: An automobile crosses the bridge.
B: An automobile does not cross the bridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x0 automobile) (Member x1 bridge)
one-sided A    {(Agent e0 x0) (Member e0 cross) (Theme e0 x1)}@x0,x1
one-sided B    {(And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG}@x0,x1
```

### seedA-084 · tierA-000400 ↔ tierA-000401 · control: antonym · quality 0.60 · common 3 · 2 substitution(s) / 2 factor(s) · leftover 0 · one-sided A 0 region(s), B 0

A: A car crosses the bridge.
B: An automobile avoids the bridge.

```
renaming a->b  e0->e0 x0->x0 x1->x1
common         (Agent e0 x0) (Member x1 bridge) (Theme e0 x1)
substitution 1 anchors e0
  A            {(Member e0 cross)}
  B            {(Member e0 avoid)}
  factor       (Member e0 cross) ~ (Member e0 avoid)   [arg1 cross->avoid]
substitution 2 anchors x0
  A            {(Member x0 car)}
  B            {(Member x0 automobile)}
  factor       (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
one-sided A    —
one-sided B    —
```

### seedA-084 · tierA-000400 ↔ tierA-000402 · control: negation · quality 0.20 · common 1 · 1 substitution(s) / 1 factor(s) · leftover 4 · one-sided A 0 region(s), B 0

A: A car crosses the bridge.
B: An automobile does not cross the bridge.

```
renaming a->b  x0->x1 x1->x2
common         (Member x1 bridge)
substitution 1 anchors x1   joint key: (And (Agent $e0 $x0) (Member $e0 cross) (Member $x0 car) (Theme $e0 $x1)) ~ (And (And (Agent $x2 $x0) (Member $x2 cross) (Theme $x2 $x1)) ~NEG (Member $x0 automobile)) @$x1
  A            {(Agent e0 x0) (Member e0 cross) (Member x0 car) (Theme e0 x1)}
  B            {(And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG (Member x0 automobile)}
  factor       (Member x0 car) ~ (Member x0 automobile)   [arg1 car->automobile]
  A only       (Agent e0 x0) (Member e0 cross) (Theme e0 x1)
  B only       (And (Agent x0' x0) (Member x0' cross) (Theme x0' x1)) ~NEG
one-sided A    —
one-sided B    —
```

