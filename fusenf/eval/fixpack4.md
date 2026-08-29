# Fix-pack 4 (batch 3) — validation report (2026-08-28/29)

Scope owner-approved 2026-08-28 (`fixpack4_scope.md`: tiers A–C + all six D leans) from the
tierD adjudication/review, fiction review, and run-50 family harvests (1,728 routed gap
strings). Authored in 4 waves: prompt `bb7c4b71…` (2,627 lines) → interim `9a7bd2f2…`
(2,910 lines, +283); goldens 378 → 422 (+44); new vocabulary AccordingTo, MeasureBy /
MeasureFrom / MeasureTo, Duration, WithinLast, AmongMost, Quarter + reserved slot symbol
`unspecified`.

Validation hash chain: `9a7bd2f2` → **`1f3bcefc`** (teach-to-the-test audit fixes, frozen
for the conformance + blind dispatches) → **`2ed18b93`** (conformance-finding fixes, frozen
for the delta re-test) → FINAL (see Pin below).

## 1 Teach-to-the-test + no-recital audit (FIRST full-pack mechanical sweep)

New tooling: every golden × every prompt line, FP4 additions × all three motivating corpora
(tierD / fiction / run-50), goldens × goldens — flags on shared proper names, 4-gram frames,
≥3 distinctive tokens; judgment on flags stays with the operator. **11 fixes, then clean:**

- FP4-vintage (8): institutional-common illustration used the fiction corpus's own
  institution (**Keepers → Provosts**, later → Directorate, see §5); backward-window
  illustration echoed motivating record tierD-000108's exact "the past two years" (→ "past
  six months"); "(Fuller in-seal grammar…)" collided with tierD's Marce Fuller (→ "A
  richer…"); superseded-bound illustration "survey" ≈ golden "census" (→ appraisal);
  amongmost illustration "mills" = the golden's subject (→ orchards); [scalar-restatement]
  golden had copied the prompt's worked numbers verbatim (golden renumbered: Imports 15/6);
  ewes/Tansy replaced a golden-echoing grouped-plural illustration; steamer replaced the
  ferry illustration that quoted the [asp-already] golden.
- Pre-existing, surfaced by the first full sweep (3): prompt lines quoting goldens verbatim
  — scope-aa (wolf/deer → egret/minnow), scope-ea (teacher/exam → bailiff/docket),
  q-compound-indep (oldest dog/cat → plumpest goose / sleekest gander).
- Residuals: closed construction frames with differing content (standing benign class),
  shared first-name pool, calendar vocabulary.

**Design catch:** the authored AmongMost text claimed "same slots as `Most`" but declared
entity-first. Fixed to scale-first (`(AmongMost <scale> <entity> <class>)`) in prompt,
golden, and registry — consistent with the Most/MoreBy comparative-family convention.

## 2 Vocabulary registry

8 operator entries DECLARED by hand in `specs/vocabulary.json` (arities/arg-types/flags are
human decisions): AccordingTo [2, opaque], MeasureBy/From/To [4], Duration [2], WithinLast
[3], AmongMost [3], Quarter [2]; `unspecified` documented on the Measure-family entries as
the reserved slot symbol. Attest report: **0 unknown heads, 0 arity flags**; Quarter
attested via the new e2e case. `--write` re-pin at the end (§Pin).

## 3 e2e engine harness — 354 → 372/372 PASS

18 new fixture cases: MeasureBy retrieval + no cross-head leak into `Measure` (seeded);
MeasureFrom/To endpoint pair; `unspecified` binds an unconstrained query variable and does
NOT satisfy a constrained-scale query; AccordingTo no-leak + wrapper-queryable + typing
projection; Duration retrieval + never-Manner; WithinLast + never-duration-Measure;
AmongMost (scale-first); Quarter in a Time slot; Still-continuation + flat companion;
sealed per-member rule INERT with a member individuated + GroupOf projection. All green on
first run and after the §5 harmonization edits.

## 4 Goldens conformance run (NEW gate for FP4's size)

64 blind Sonnet parses at frozen `1f3bcefc`: all 44 new FP4 goldens + a 20-case
deterministic old-golden sample (every ~16th non-ctx case). Judged semantically per the
goldens header; mechanical head-presence screen sorted the reading order (2/64 flagged).

- **Old sample: 20/20 conformant, 17 atom-exact** — no regression from FP4 on legacy
  constructs (incl. query forms, threshold dual-branch w/ a superior licensed
  canonical-unit alternative, partitives, coref, attitudes).
- **New cases: 42/44 conformant on the tested construct** (majority exact; A-tier safety
  behaviors — irrealis never asserted, wholly-negative drop, approximator no-flat-half,
  superseded Past-wrap history route, seal no-leak — all held).
- Findings → fixes (§5): [wk-typing] doctrine collision (parser applied the
  institutional-common default to plural "the Harriers" → GroupOf harrier, no Name);
  [solid-compound] genus miss (moonbeam); antecedentless "them" typed `person` per a prompt
  line that itself overreached; systematic Agent-for-inanimate-mover variance traced to a
  genuinely unlegislated unaccusative-subject boundary (goldens/e2e were themselves split:
  old ctx-ground shipment→Agent vs new according-to shipment→Theme vs e2e stall→Patient).
- Logged, no action: Theme↔Patient wobble on affected objects beyond the new boundary
  (legacy, both directions, M1's business); one B8 tense-wrap miss on premodifier typing in
  a 5-construct pile-up (the rule passed its direct test); one bare-kind-object
  witness-minting judgment call; presupposed-referent typing additions (licensed).

## 5 Conformance-finding fixes (hash → `2ed18b93`)

1. **Plural-label boundary legislated** (names section): the capitalized-common-noun
   default is singular-collective only ("the Assembly", "the Directorate"); a capitalized
   PLURAL kind-word label referring as a name ("the Wrens") is `Name`-only — one symbol, no
   `GroupOf`, no per-member kind (a type atom is never invented).
2. **Unaccusative-subject boundary legislated** (thematic roles): internal change of state
   (stall, weaken, falter, buckle, sag, fade, freeze) → `Patient`; un-powered relocation —
   cargo, documents, institutions (arrive, move, depart, drift, dip) → `Theme`;
   `Agent` only for a self-powered mover (animates; vessels/vehicles under their own
   power); scalar-change subjects `Theme` via *Scalar change*; carries into seals and
   passives. Harmonized the two deviating legacy artifacts: [disj-wide] golden
   (stall/fail → Patient), [ctx-ground] golden + CTXSHIP e2e fixture (shipment arrive →
   Theme). Ferry/train vehicle-Agent artifacts stand under the self-powered clause.
3. **Antecedentless plural pronoun**: the old "plural they → `GroupOf person`" line was
   itself an invented-kind overreach — now salient kind, else `thing`; `person` only on
   discourse evidence. ([covarying-contrast] golden was already right.)
4. **Solid-compound emphasis**: "always emit the genus" + second worked example
   (rainshadow → shadow).
5. Golden-note sharpening: [when-specific] "NO Implication" → "NO when-conditional
   Implication (the plural's distributive PartOf rule stays licensed)" — the conformance
   parse's added distributive rule was licensed by the plural doctrine, not a when-rule.

Delta re-test at `2ed18b93` (fc-14, 5 fresh-id re-parses of the affected sentences):
**PENDING — see §7.**

## 6 Pre-registered blind batch — 12/12 conformant

12 fresh sentences (`fixpack4-000001..12`, corpus `corpora/fixpack4.jsonl`), expectations
written before dispatch (`fixpack4_expectations.md`), every content word mechanically
verified fresh, frozen at `1f3bcefc`. Results: 9 exact vs pre-registration; 2 conformant
via licensed alternatives where the pre-registration was over-narrow (a role slot each —
same pattern as FP3's two); 1 minor logged variance (occupational typing under a past host
left untensed in the 5-construct names pile-up). Zero pack-level defects. Highlights: the
irrealis relative left unencoded with the matrix intact; the wholly-negative quote dropped
Theme-less; subject-is-dimension scale on the voltage endpoints; premise-binding and
gerund rules emitted with plain-variable premises + Skolem-function conclusions (the
fiction unfireable-rule family is dead at the source); the superseded value took the
licensed Past-wrapped-history route. The conformance run's one gerund-TV wobble (0.9
strength) did not recur (1.0 here) — one-off drift, no fix.

**C1–C8 on the blind batch: 12 clean / 0 findings (all codes zero)** — assembled to
`parses/fixpack4.parses.jsonl` at `1f3bcefc` (C7 chainer smoke loads every parse, the
AccordingTo wrapper and sealed free-variable rule included).

## 7 Delta re-test + pin

Delta batch fc-14 (5 fresh-id re-parses of the affected sentences, blind, frozen
`2ed18b93`): **4/5 flipped to atom-exact golden matches** — Name-only Harriers (no
`GroupOf`, no invented kind), moonbeam genus emitted, shipment→`Theme` inside the
AccordingTo seal, office→`Theme` inside the announce seal. Item 5 (covarying-contrast):
the targeted fix landed (`thing` witnesses, fresh per clause, `person` gone); the parser
took the habitual-generic RULE route this run (licensed for habitual present — the golden's
episodic route stays canonical) and exposed a corner residual, registered below.

**FINAL HASH — prompt.txt `2ed18b934e28afac75b1d6c7c47b7b7413ed778c4c2916441274fb42933d9d1e`
(2,925 lines), seeded unchanged `b7e25b96…`, goldens 422, e2e 372/372.**
`vocab_attest --write` re-pinned clean: 0 unknown / 0 arity flags / 0 deprecated
(the one transient arity flag was a phantom — two e2e fixture strings split across Python
source lines confused the attest's raw-text paren scanner; joined to single lines).
Declared-but-unattested unchanged (Despite, EvenThough, FoldAll, Probably — pre-existing).

## Residuals (registered, not acted on)

1. **Covarying pronoun inside the rule route**: when a contrastive habitual ("some Ns V
   them; others W them") takes the generic Implication route, the covarying object should
   be a per-firing Skolem FUNCTION (`(sk_thing $x)`), not a shared constant — the run-2
   delta parse used a constant, which misstates covariation. The golden's episodic route
   avoids it. Wire candidate for the next pack: one line in the covarying pin.
2. **Route variance episodic vs habitual-generic** on bare-plural present ("Some mills
   bleach them") — both routes doctrinally licensed; M1 will quantify.
3. **Theme↔Patient wobble on affected OBJECTS** (beyond the new unaccusative-subject
   boundary): legacy variance in both directions (lease-sign, hatch-open, hearing-delay);
   the object-role verb lists in *Thematic roles* remain the doctrine; M1's business, wire
   candidate if it shows up in measurement.
4. **B8 tense-wrap on premodifier typing** under a past host: one blind-batch miss in a
   5-construct pile-up; the rule passed its direct conformance test.
5. **Presupposed-referent typing projection from dropped complements** (votes/grain typed
   top-level after a wholly-negative drop): parser-consistent, judged licensed; not yet a
   written rule. Candidate one-liner for the next names/seal pass.

## Rider queue (unchanged, now unblocked)

Fiction run-2 (consumer KB v2) → 189+54 repair re-reviews → substrate refresh →
canonicalize → H mining run → graded gauntlet → M1/M2/M3/M5 → BATCH2_REPORT.
