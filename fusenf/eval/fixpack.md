# Fix-pack B2 — validation report (2026-08-22)

The pre-campaign prompt fix-pack from `BATCH2_PLAN.md` (amendment 2026-08-21): one coverage
gap ([G] perception reports, surfaced by probe48-000004's un-doctrined `Stimulus`-to-event
parse) + three emphasis-only fixes for the provenance audit's top recurring error themes
(scheduled-occurrence Patient ×9, futurate-without-anchor ×8, antecedent-less pronoun
typing ×8).

**Instrument: `prompt.txt` 102bba250c11… → `f6448eac9f88…` (2,447 lines); seeded unchanged
b7e25b963478…; vocabulary re-pinned via `vocab_attest --write` (0 unknown heads, 0 arity
flags, 0 deprecated — the fix-pack adds NO vocabulary). THIS IS THE FINAL BATCH-2 PARSE HASH.**

## The edits

1. **NEW `### Perception reports (see / hear / watch someone do …)`** (after Propositional
   attitudes): perception verb + eventive complement (bare infinitive / participle) →
   BOTH events reified; complement **asserted at top level at normal TVs** (veridical —
   nothing sealed); linked by `(Stimulus <perception-event> <complement-event>)` **whatever
   the matrix verb's aspect** (an event is never a `Theme` acted on; subject role still by
   the progressive test — see/hear/feel → `Experiencer`, watch/observe/notice → `Agent`);
   complement carries **no tense of its own** (matrix time is its time); **participial**
   complement adds `(Ongoing …)` (registered as the 4th explicit `Ongoing` marker), bare
   infinitive adds nothing; **negation** wraps the whole bundle (perception + complement +
   link) in one strength-0.0 conjunction, definites still project; *seem/appear* excluded
   (epistemic route). Three-way routing stated: that-clause → factive attitude; entity
   object → plain roles; eventive complement → this section.
2. **Scheduled-occurrence emphasis** (role chooser): "**Never read *postpone / delay /
   reschedule* as displacement-in-time**" contrast — occurrence object → `Patient` every
   time; the *moved/swapped* → `Theme` line is for things.
3. **Futurate emphasis** (Time): the permit example annotated "(TODAY supplied, before the
   date)" + a NEGATIVE worked example ("The harvest begins in September", no TODAY → Month
   atom and **no tense atom**).
4. **Pronoun emphasis** (witnesses): "Both halves are **mandatory every time**" — symbol
   minted from the CLASS (never `sk_it_1`), class atom always emitted.
5. **Integration wires**: attitude router bullet (eventive complement → perception report);
   `Ongoing` marker list three → four; role glossary `Theme` line ("Entity objects only …")
   and `Stimulus` line ("… or the perceived **event** of a perception report").

## Validation

- **No-recital**: both directions clean (new prompt example sentences absent from
  regression; the new golden is lexically disjoint from all prompt examples).
- **Goldens**: +1 → 368 (`[perc-report] The warden watched the intern seal the crate.` —
  exercises the `Agent`-subject branch + bare infinitive + veridical assert).
- **e2e**: +2 perception cases (veridical complement query; two-event `Stimulus` rebuild) —
  **338/338 PASS** (engine env, STEPS=400; storage-only And queries, outside the known
  conj-bug family).
- **Blind batch** (7 fresh sentences, 2 blind Sonnet agents at the final hash; expectations
  pre-registered before any output was read; assemble+validate C1–C8 all clean):

| id | probe | verdict |
|---|---|---|
| fixpack-000001 | perception, bare infinitive | ✓ exact (both events, Stimulus, no tense on complement) |
| fixpack-000002 | perception, participial | ✓ exact (`Ongoing` on complement, no Past leak) |
| fixpack-000003 | futurate trap (no TODAY) | ✓ exact (Time (Hour 12), **no tense atom**; seminar → Patient) |
| fixpack-000004 | antecedent-less "It" | ✓ exact (`sk_thing_1` typed; transitive subject Agent) |
| fixpack-000005 | CONTROL: entity object | ✓ exact (single event, entity Stimulus — no section leakage) |
| fixpack-000006 | postpone → Patient | ✓ exact (Patient, not Theme) |
| fixpack-000007 | negated perception | ✓ exact (one 0.0-strength bundle incl. Stimulus link; both definites project outside) |

**7/7 — including all MUST-NOTs (no sealing, no leakage, no guessed Future, no `sk_it_*`).**

## Ops note (discipline incident, resolved)

The first dispatch of the blind batch raced two late glossary wires: both agents had read
the pre-wire text (confirmed by transcript grep for the new glossary marker). Their outputs
were discarded unrecorded and both batches re-dispatched at the final text — the pinned
hash is exactly the text the blind batch validated. Standing rule reaffirmed: **freeze
`prompt.txt` before dispatching any parse agent; every in-flight batch dies with a prompt
edit.**

## Consequences

- Tier B 2,000 + Tier C 360 re-parse (the AFK parse program) run at `f6448eac9f88…`.
- The run-30 audit-queue wave is NOT redone at this hash (purpose served; plan amendment).
- `fusenf/parses/fixpack.parses.jsonl` + `canonical/fixpack.canon.jsonl` retained as the
  fix-pack's validation artifacts (source `fixpack-validation`; excluded from mining
  substrates like probe48).
