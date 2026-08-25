# Fix-pack 3.1 — 2026-08-25

Owner directive: fix the trivial deferred items now; design-decision items wait for a joint
session. Prompt `2aa57fa8…` (2,602 lines) →
**`bb7c4b71fc26e2a0e112f0b3908b0e57dc4f03866c7b152e73c34556b1148a18`** (2,627 lines). No
vocabulary/seeded changes.

## Edits (2)

1. **Position-route pin** — resolves both the fix-pack-3 blind-batch two-route variance AND a
   pre-existing internal tension ("sits in" mint-no-event vs "the crate sat in the bay" as a
   reified Experiencer stative): a **bare position clause mints no event whatever its verb**
   (copular, existential, or postural *lie/sit/stand/hang/lean/perch/rest*) — the tense-wrapped
   entity-attached position head is the whole predication (`LocatedIn` for containment, the
   surface preposition otherwise). The Experiencer+`Location` reified form now requires a
   standard reification trigger (progressive, manner adverb, time modifier, connective
   endpoint); tense alone is not one. Cross-wired at the intransitive-role postural list; the
   FP3 `[entity-position]` golden's annotation tidied to match (its atoms already conformed).
2. **Copular-focus anchor** — a focus particle on a copular clause is itself a reification
   trigger (unlocked by fix-pack 3's state-reification machinery; a state IS an eventuality, so
   the `(Op <filler> <event>)` contract is unchanged): reify the predicate state, dual-emit the
   flat atom, anchor the focus atom on the state witness; filler = subject symbol or predicate
   lemma by focus position. **Registered as still open**: focus on a bare existential count
   ("there is only one book …") — emit the exact `Cardinality`, leave the particle out.

## Validation

- No-recital clean (one mid-draft echo caught: "was lying on the table" → "across the
  threshold"). Goldens 376 → **378**; e2e 351 → **354/354 PASS**.
- Blind batch **4/4 EXACT** vs pre-registered expectations (`fixpack31_expectations.md`) at the
  frozen hash — including both traps: bare postural stayed eventless, progressive postural
  reified; subject-focus vs predicate-focus fillers both right. C1–C8: 4 clean / 0 findings.
- `vocab_attest --write` pinned `bb7c4b71…`/`b7e25b96…`.

## Consequences

- Batch-3 parsing and the ~158-record re-parse wave should run at `bb7c4b71…` (supersedes
  `2aa57fa8…`, at which nothing but 10 validation sentences was ever parsed).
- Still deferred to the design session: degree-on-comparatives, superlative variants, metaphor,
  contrastive "while", equatives, negation-inside-seal (engine), `To`-collision (owner),
  existential-count focus. Plus the owner's procedural topic: a construct-lifecycle process for
  managing premature-construct risk (staging/migration discipline).
