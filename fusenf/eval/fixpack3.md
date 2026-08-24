# Fix-pack 3 (batch 3) — 2026-08-24

Scope owner-approved from the batch-2 gap harvest (681 gap claims ranked; report
`review_sweep_b2afk.md` + `adjudicator_pilot.md`). Prompt `f6448eac…` (2,447 lines) →
**`2aa57fa8aeb3d4ed1127e52666459787523d74ef726d131c9a3c2eb37cd850f1`** (2,602 lines). No
vocabulary/seeded changes; the new entity heads (`On`, `NextTo`, `Of`, …) ride the existing
open preposition-oblique licence.

## Edits

**New sections (4):**
- **S1 Complements of nouns and adjectives** — nominalization of-phrases are the noun's OBJECT
  → entity-attached surface-preposition oblique (verb-paraphrase test; relational nouns keep the
  genitive); adjective PP-complements anchor on a **reified state** (registered as the fourth
  dual-emit reification trigger) or, kind-generic with bare-kind complement, fuse
  (`wary_of_trap`) with compound-style decomposition. Genitive exclusion list + Core-patterns
  dual-emit line wired.
- **S2 Entity-position prepositions** — `LocatedIn` = containment (in/at/inside/within) ONLY;
  every other position preposition stays entity-attached surface-form, multiword prepositions
  CamelCase-join (`NextTo`, `AcrossTheLaneFrom`).
- **S3 Restricted kind claims** — a locative/domain PP restricting a kind-level property goes in
  the `ConditionalProperty` condition slot (causeway pattern generalized); never strip the
  restriction, never kind-in-`LocatedIn`. `KindProperty`-with-restrictor distribution guard
  registered as engine-side (no emission change).
- **S4 Impersonal reported attitudes** — "is considered/said/thought to be P" = agentless
  non-factive attitude, complement sealed under `Theme`, subject projects; generality hedge →
  confidence 0.9. Negated-conjunct-in-seal = registered limitation (no positive-form fallback).

**Designed rules (2):** **D1** frequency adverbs on generics set rule strength
(always 1.0 / usually·often 0.8 / sometimes 0.5 / rarely·seldom 0.1) + `QuantifierPhrase`
companion; episodic frequency comparisons stay unencoded (never `Manner`). **D2** control
infinitives never seal — non-finite complement reified top-level via `Theme`, controller's role
copied, no tense (sealing is finite-clause-only).

**Emphasis fixes (5):** TV dial reaches every kind-level head (comparatives included);
plural properties never on the group symbol; prepositional-verb objects are the oblique, never
`Patient`/`Theme`; negated multi-atom predicate nominals deny the whole bundle; change-of-kind
= State-result on the subject's own symbol (no fresh entity, no `Goal`).

## Validation

- **No-recital sweep clean both ways** (all new example sentences fresh vs regression + all
  corpora); mid-draft teach-to-the-test audit replaced 8 example phrases that echoed motivating
  corpus records (factorial-function, cracked-down, easy-task, Fyodor, milk-vs-water, desk,
  next-to-the-table, across-the-street).
- **Goldens 368 → 376** (one per S1n/S1a/S2/S3/S4/D1/D2/E5).
- **e2e 338 → 351/351 PASS** (13 new engine cases, incl. the S4 negative check — the sealed
  opinion is NOT served as fact — and the D1 rule deriving a member event at 0.1).
- **Blind batch 10/10 conformant** at the frozen hash vs pre-registered expectations
  (`fixpack3_expectations.md`, written before dispatch): 8 exact; 2 conformant via licensed
  alternatives where the pre-registration was over-narrow (bare-kind complement NP;
  postural-stative event route for item 4). C1–C8: 10 clean / 0 findings. Constructs
  generalized to fresh vocabulary — no recital.
- `vocab_attest --write` pinned `2aa57fa8aeb3…`/`b7e25b96…` (0 unknown / arity / deprecated).

## Residuals (registered, not acted on)

1. **Postural verb + non-containment preposition has TWO licensed routes** (entity `(On …)` vs
   reified stative event + `Location`) — blind item 4 exposed it; variance risk, wire candidate
   for the next pack (pin one route or declare the event route canonical when a verb is present).
2. Negation-inside-seal (blocks S4's negated conjuncts) — needs a transport head; owner/engine.
3. `To`-oblique vs seeded purpose-connective collision — owner vocabulary decision.
4. Deferred design items per the scope decision: focus-particles-without-event,
   degree-on-comparatives, metaphor, while/as-well-as, expressives, equatives.

## Consequences

- `fixpack3.jsonl` / `fixpack3.parses.jsonl` are validation artifacts — exclude from mining
  substrates like the earlier probe/fixpack corpora.
- The 170 review-defect triage rows: re-parse/repair decisions should now assume THIS hash —
  defects in the pack's construct families are expected to vanish on re-parse.
- Batch-3 parsing (when scheduled) runs at `2aa57fa8…`; freeze-before-dispatch as always.
