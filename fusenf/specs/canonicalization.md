# FUSE-NF — Canonicalization spec (`fusenf-canon/1`)

P0 deliverable. Turns a faithful parse into a canonical graph with a stable identity hash, so that
**two parses that mean the same thing by construction hash identically**. Everything downstream —
M1 stability, M2 convergence, star mining, the rewriter — is defined on this output.

## 0. Position relative to the paper

The paper obtains SENF uniqueness from a confluent, terminating rewrite system, but never actually
constructs one: confluence is asserted by analogy to Boolean ENF, and the semantic rewrite rules are
nowhere enumerated. We get uniqueness a different way, and say so plainly:

- **Prompt-side normalization** does the semantic work up front — lemmatization, one symbol per
  entity, fixed role inventory, fixed operator alphabet, declared TV conventions.
- **A deterministic canonicalizer** (this spec) removes the remaining representational freedom that
  is *not* semantic: proof names, skolem indices, atom order, TV jitter.

What is left over — genuinely different phrasings that the prompt deliberately keeps distinct — is
exactly what FUSE-NF mining is supposed to discover. That is the intended division, not a shortfall.

**Canonicalization is meaning-preserving and reversible in principle.** It may not do any of the
following, which belong to consolidation (P4): change a lemma, merge operators, drop atoms except by
a declared projection, or rewrite a truth value (bucketing affects *identity only*; raw STVs are
retained).

## 1. Input and output

Input: one parse record (`schema.md` §3) that has passed the mechanical checks (`schema.md` §5.1).

Output, one record in `fusenf/canonical/<tier>.canon.jsonl`:

```json
{
  "schema": "fusenf-canon/1",
  "id": "tierB-000123", "run": 1,
  "parse_input_sha256": "…", "canon_version": "fusenf-canon/1",
  "atoms": [{"term": "(Member e0 drive)", "stv": [1.0, 0.99], "bucket": ["full", "def"],
             "proof_name": "maria_drove"}],
  "linearization": "…",
  "graph_id":   "sha256:…",
  "shape_id":   "sha256:…",
  "content_id": "sha256:…",
  "renaming":  {"sk_drive_1": "e0", "sk_store_1": "x1"},
  "stars": {"e0": {"kind": "event", "class": "drive", "atoms": [0, 1, 3, 4]}},
  "exact": true,
  "stats": {"atoms": 5, "skolems": 2, "constants": 3, "refine_rounds": 3}
}
```

`exact: false` records that a symmetry tie-break fell back to the bounded heuristic (§4.3).

## 2. The graph a parse denotes

A parse is a **set of labelled hyperedges over symbols**.

- **Atom** — one top-level assertion, stripped of its proof name: a head plus arguments, with an STV.
- **Symbol** — an argument leaf: a constant (kind, named entity, property, lemma), a skolem, a
  variable, a number, or a string literal.
- **Structured term** — a compound argument such as `(Year 2020)`, `(can fly)`,
  `(ParticleFromNormal 1.5 length)`. It is **part of its parent atom**, not an independent atom: it
  has no standing in the KB and cannot be asserted alone.
- **Opaque atom** — an atom whose head is on the prompt's opaque roster (`vocabulary.json`
  `opaque: true`). Its arguments are canonicalized as usual, but §5 treats the whole atom as a single
  node: nothing may be mined out of its interior.
- **Rule atom** — `(Implication (Premises …) (Conclusions …))`. Its variables are bound inside it;
  it is canonicalized as a unit, in its own variable namespace (§4.4).

Three symbol roles matter for canonicalization:

| Role | Examples | Treatment |
|---|---|---|
| **Constant** | `maria`, `bird`, `drive`, `"Maria"`, `2020` | **fixed point** — never renamed |
| **Skolem** | `sk_drive_1`, `sk_store_1`, `(sk_y $x)` | α-renamable |
| **Variable** | `$x`, `$e` inside a rule | α-renamable, rule-local |

Constants are fixed points precisely because the prompt already canonicalizes them: lemmatized, one
symbol per entity, name-derived. That is what makes the remaining problem small.

## 3. Pipeline

```
parse record
  │  1. parse & strip proof names (retained positionally)
  │  2. classify symbols: constant / skolem / variable
  │  3. colour refinement over the atom graph            §4.1
  │  4. individualization + branch-and-minimum on ties   §4.3
  │  5. rename skolems by canonical position             §4.2
  │  6. total-order the atoms, linearize                 §4.5
  │  7. bucket the STVs                                  §4.6
  │  8. hash under three projections                     §4.7
  │  9. star decomposition                               §5
  ▼
canonical record
```

## 4. The algorithm

### 4.1 Colour refinement

Standard 1-WL refinement over the hypergraph.

- **Initial colour.** Constant → `H("C", symbol)`. Skolem → `H("S")`. Variable → `H("V")`. All
  skolems therefore start indistinguishable; only structure separates them. (Do **not** seed a
  skolem with its `sk_<verb>_<n>` stem: the stem is parser-chosen and would smuggle input-dependent
  information into the identity.)
- **Round.** For each symbol `v`:

  ```
  sig(v) = multiset over atoms a containing v of
             ( head(a), arity(a), path of v within a,
               tuple over a's other argument paths of termcolour(that argument) )
  colour'(v) = H(colour(v), sorted(sig(v)))
  ```

  where `termcolour` recurses into structured terms using the symbols' **current** colours:

  ```
  termcolour(sym)          = colour(sym)
  termcolour((h a1 … an))  = H(h, n, termcolour(a1), …, termcolour(an))
  ```

  So `(Year 2020)` and `(can fly)` discriminate by their own content, and a skolem nested inside a
  term (a sealed proposition under `Theme`, a skolem inside `(And …)`) both receives colour from its
  enclosing position and contributes colour outward — the recursion is resolved by iteration, like
  every other colour, not by a separate pass. A symbol's **path** (argument index sequence, e.g.
  `[1]` or `[2, 0]`) is used rather than a flat position so that nesting depth is discriminating.
- **Stop** when the partition stops refining, or after `|symbols|` rounds. Bundles run under ~30
  atoms, so this converges in 2–4 rounds.

STVs do **not** participate in refinement — structure alone determines the labelling, so TV jitter
can never change the renaming.

### 4.2 Renaming

Order the refined colour classes by their colour hash. Within a class, skolems are ordered by §4.3.
Rename in that order:

- event skolems (those bearing a `Member` to a verb class, or any status/role atom) → `e0, e1, …`
- other skolems → `x0, x1, …`
- skolem **functions** `(sk_y $x)` → `f0(…)`, keeping the argument structure

Event-vs-entity is a naming nicety for readability; identity does not depend on it (the two streams
are disjoint by construction).

### 4.3 Symmetry and tie-breaking

If a refined class holds more than one skolem, the graph has a genuine automorphism (e.g. *"Two dogs
barked"* — two structurally identical witnesses). Refinement alone cannot order them, and any
input-order tiebreak would destroy isomorphism-invariance.

- **≤ K members (K = 6, configurable):** individualization–refinement with
  **branch-and-keep-minimum** — for each candidate, fix it, re-refine, recurse, linearize; keep the
  lexicographically smallest linearization. Deterministic and exact.
- **> K members:** fall back to ordering by (colour, first emission index) and set `exact: false`.
  Records with `exact: false` are excluded from M1's identity numerator and reported separately;
  at our bundle sizes this should be empty, and if it is not, that is a finding.

### 4.4 Rules

`Implication` atoms are canonicalized in a **rule-local variable namespace**: variables are renamed
`$v0, $v1, …` by the same refinement run over the rule's own premise/conclusion graph, independent
of the enclosing record. A rule's canonical form is therefore comparable across records, which is
what lets mining count rule shapes.

### 4.5 Total order and linearization

Term order is byte-wise lexicographic on the recursively linearized string, which is total and
deterministic once §4.2 has run:

```
term(sym)          = sym
term((h a1 … an))  = "(" h " " term(a1) … " " term(an) ")"
```

Atoms sort by `term`, ties broken by bucketed STV. Linearization is the sorted atom terms joined by
`\n`, each optionally suffixed with its projection-dependent TV field.

### 4.5a Start simple — the algorithm is not the contract

§7's invariance tests are the contract; §4.1–4.5 describe one implementation that satisfies them.
**Build the simple version first:** sort the atoms with skolems held as a single wildcard token, then
rename skolems by order of first occurrence in that sorted list, then re-sort. On bundles of under
~30 atoms with mostly-distinct participants this already satisfies every test in §7 except the
symmetry case, and it is perhaps thirty lines of code.

Escalate to full colour refinement (§4.1) and individualization (§4.3) **only when a §7 test fails**
— which in practice means only when structurally identical witnesses actually appear ("two dogs
barked"). Track how often that happens; if it is rare, the simple version is the whole story.

### 4.6 STV bucketing — deferred until M1 shows jitter

**Not implemented initially.** The empirical check below shows bucketing is currently a **no-op** —
all seven attested truth values already land in distinct buckets, so it changes no hash today. It is
machinery for parser *jitter* (a re-parse writing `0.88` for `0.9`), and M1's `tv-only` variance
bucket is what will show whether that jitter is real. Until then `graph_id` uses exact truth values;
turn bucketing on if and when M1 reports `tv-only` disagreements. The bands stay specified here so
the answer is ready, not so it ships first.

Buckets are cut around the prompt's canonical values with margin, so every documented TV lands in
its own band:

| Strength band | Range | Canonical inhabitants |
|---|---|---|
| `zero` | `[0, 0.1)` | negation / denial / prohibition `0.0` |
| `low` | `[0.1, 0.5)` | striking minority `0.2`–`0.3`, "few" `0.1` |
| `mid` | `[0.5, 0.8)` | deontic "should" `0.7` |
| `high` | `[0.8, 0.97)` | empirical generic `0.9` |
| `full` | `[0.97, 1.0]` | default / universal `1.0` |

| Confidence band | Range | Canonical inhabitants |
|---|---|---|
| `weak` | `[0, 0.5)` | — |
| `emp` | `[0.5, 0.95)` | empirical `0.9` |
| `def` | `[0.95, 1.0]` | definitional / structural `0.99` |

Identity uses the bucket; the raw pair is retained in `atoms[].stv`. Rationale: a re-parse that
writes `0.88` instead of `0.9` is noise, but a re-parse that writes `0.0` instead of `1.0` is a
different claim — and the negative controls (added negation, antonym swap) all cross a band boundary,
so bucketing cannot launder a control into a paraphrase.

**Empirical check** against the 1,248 truth values in the 317 regression goldens — the whole attested
distribution is:

| STV | count | bucket |
|---|---|---|
| `1.0 0.99` | 1168 | `full` / `def` |
| `0.0 0.99` | 26 | `zero` / `def` |
| `0.9 0.9` | 25 | `high` / `emp` |
| `1.0 0.9` | 24 | `full` / `emp` |
| `0.3 0.9` | 2 | `low` / `emp` |
| `0.0 0.9` | 2 | `zero` / `emp` |
| `0.1 0.9` | 1 | `low` / `emp` |

Seven attested values → six buckets, with exactly one deliberate collision (striking `0.3` with
"few" `0.1`, both small-proportion readings, and distinguished anyway by their `QuantifierPhrase`
companion atom). No band boundary falls between two attested values, so bucketing is currently a
no-op on clean parses and only absorbs jitter — which is exactly what it is for. Note also that 94%
of golden TVs are the default `1.0 0.99`: truth values carry little discriminative weight, so parse
identity is overwhelmingly structural. The `mid` band (deontic "should" `0.7`) is declared by the
prompt but unattested in the goldens; it stays defined so the first such parse does not land in a
neighbour's band.

### 4.7 Hashes and projections

One hash function, three declared projections:

| Hash | Projection | Answers |
|---|---|---|
| `graph_id` | all atoms, bucketed TVs | are these the same parse? (**the** identity; M1, M2) |
| `shape_id` | all atoms, TVs dropped | same structure, different confidence? (M1 diagnostics) |
| `content_id` | `surface-record` atoms dropped (`Name`, `QuantifierPhrase`, `CardinalityPhrase`), bucketed TVs | same content, different surface record? |

`content_id` exists because paraphrase pairs routinely differ *only* in the surface-record atoms
("all" vs "every"). Reporting M2 under both `graph_id` and `content_id` separates "the parse
converged" from "the parse converged apart from the recorded surface word" — and whether that
difference should consolidate is itself a batch-1 question, not something to prejudge by dropping
the atoms.

## 5. Star decomposition (the mining primitive)

For each skolem or constant `v`, its **star** is `v` plus every atom mentioning `v`, with all *other*
symbols in those atoms replaced by their **type placeholder** (`kind:bird`, `sk`, `str`, `num`) —
so stars are comparable across records while keeping the head/role structure intact.

- **Event star** — an event symbol: `(Member e drive)` + roles + status + time + connective endpoints.
  The unit of "what kind of event, with which participants filling which roles, in what state".
- **Entity star** — an entity symbol: everything predicated of it.
- **Opaque atoms are one node.** An atom whose head is opaque contributes to a star as an unanalyzed
  labelled edge; mining may match it whole but may never propose a rewrite of its interior.

  Opacity here is **structural only**, and must not be read as inferential inertness — as
  `prompt.txt`'s Core-patterns bullet now states explicitly ("opacity is structural, not
  inferential"). Eleven heads on the opaque roster do have seeded rules firing from them: the ten
  surface connectives (`Because`, `Since`, `So`, `AsAResult`, `Therefore`, `Consequently`, `Thus`,
  `To`, `InOrderTo`, `SoAsTo` → `ReasonFor`/`PurposeOf`) and `Symmetric` (`sym_rel`).
  `vocabulary.json` therefore carries two independent flags, `opaque` (do not decompose) and
  `bridged` (a seeded rule fires from this head). The distinction is load-bearing for batch 1: a
  **bridging rule fires from a head by definition**, so treating structural opacity as "no rule may
  fire from this" would forbid the entire bridging category on precisely the heads where bridging is
  most natural — and the hand-written `ReasonFor`/`PurposeOf` bridge is our own precedent for it.
- **Rule stars** — an `Implication` contributes a single star keyed by its canonical form.
- **Cross-star edges** — a symbol appearing in two stars links them; the cross-star edge set is what
  sub-star enumeration (`PLAN.md` §6 wave 1, the paper's §4.3.1) walks.

Sub-stars up to size *k* (start `k = 4`) are enumerated over connected atom subsets of a star; this
is the candidate vocabulary that later methods treat as features.

## 6. Graph distance (used by M1 and M2)

Both metrics need "how different are two canonical graphs" when the hashes differ.

**Soft-Jaccard under best skolem alignment.** Constants must match exactly; skolems may be matched by
any injective map. Score = `|shared atoms| / |union atoms|` under the best map found.

Search procedure (deterministic):

1. Candidate pairs are restricted to skolems with **compatible refined colours** — an exact map, when
   one exists, is always colour-compatible, so this prunes without loss.
2. Build a similarity matrix (agreement count if the pair is matched, other arguments held at their
   current assignment) and solve the assignment problem exactly (Hungarian).
3. One local-improvement pass: swap any pair whose exchange raises total agreement; iterate to a
   local optimum, capped at 50 swaps.

Step 2's objective is only pairwise-decomposable in approximation — atoms have arity ≥ 2, so a match
is not scored independently of the rest. This procedure is therefore a **lower bound** on true
overlap, not the exact optimum. That is acceptable and stated deliberately: it is deterministic, and
M1/M2 apply the identical procedure on both sides of every comparison, so the bias does not favour
either arm. When two graphs are truly isomorphic the hashes already agree and no search is run.

## 7. Test suite (P1 exit criteria)

`canonicalize.py` ships with unit tests that must all pass before any corpus is canonicalized:

1. **Order invariance** — shuffling `statements` leaves all three hashes unchanged.
2. **α-invariance** — renaming `sk_drive_1 → sk_drive_7` (consistently) leaves them unchanged.
3. **Proof-name invariance** — renaming proof names leaves them unchanged.
4. **TV jitter** — `0.9 → 0.88` leaves `graph_id` unchanged; `0.9 → 0.0` changes it.
5. **Symmetry** — two structurally identical witnesses canonicalize deterministically, and the two
   possible emission orders agree.
6. **Discrimination** — a hand-built set of near-miss pairs (participant swap, added negation,
   antonym, role swap Agent↔Patient) must hash *differently* under `graph_id`. This is the check
   that canonicalization is not silently over-merging.
7. **Idempotence** — canonicalizing a canonical record is a fixed point.
8. **Projection sanity** — `content_id` equality with `graph_id` inequality occurs exactly on pairs
   differing only in surface-record atoms.
