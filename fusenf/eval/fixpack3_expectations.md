# Fix-pack 3 blind batch — PRE-REGISTERED expectations (written before dispatch, 2026-08-24)

Prompt candidate `2aa57fa8ae…` (2,602 lines), FROZEN before dispatch. Parser: blind Sonnet
per PARSE.md, raw/fixpack3-*__run1.txt. Judged per item: MUST all present (shape, not symbol
names), MUST-NOT all absent.

1. **fixpack3-000001** "The committee ordered a review of the drainage plan." (S1n)
   MUST: order event (Agent=committee individual, Theme=review witness, Past); `(Of <review> <plan>)`
   entity-attached; drainage_plan fused with genus `(Inheritance drainage_plan plan)`.
   MUST-NOT: `(Possession <review> <plan>)`; a coined head (`ReviewOf`…).
2. **fixpack3-000002** "The cellar was full of crates." (S1a-individuated)
   MUST: reified full state (`Member st full` + `Experiencer st cellar`) + `(Of st <crates-group>)` +
   flat `(Member cellar full)`; Past wraps the copular/state atoms.
   MUST-NOT: complement severed (no Of anywhere); `(Of sk_cellar_1 …)` on the cellar itself;
   an invented `LocatedIn crates cellar` as the sole carrier.
3. **fixpack3-000003** "Otters are wary of traps." (S1a-kind)
   MUST: fused property `wary_of_trap` in `(Inheritance otter wary_of_trap)` at 0.9-strength-band
   generic TV; decomposition genus `(Inheritance wary_of_trap wary)` + `(Of wary_of_trap trap)`.
   MUST-NOT: severed bare `(Of otter trap)` kind-kind atom; Possession.
4. **fixpack3-000004** "The kettle sat on the stove." (S2)
   MUST: position carried by entity-attached `(On <kettle> <stove>)` (tense-wrapped or on a reified
   stative — either shape), both referents typed.
   MUST-NOT: `LocatedIn` for "on"; event `Location` as the carrier with no positional head.
5. **fixpack3-000005** "Water is precious in the desert." (S3)
   MUST: `(ConditionalProperty water precious <desert>)` with the desert typed (witness ok).
   MUST-NOT: bare `(Inheritance water precious)` asserted unrestricted; kind-in-LocatedIn.
6. **fixpack3-000006** "The tunnel is thought to be haunted." (S4)
   MUST: agentless attitude event (think/consider lemma), complement sealed under Theme
   (`(Theme e (Member <tunnel> haunted))`), tunnel typing projected top-level.
   MUST-NOT: top-level `(Member <tunnel> haunted)`; an Experiencer for the unstated holder.
7. **fixpack3-000007** "Badgers seldom raid the orchard." (D1)
   MUST: Implication rule over badger at strength ≈0.1 + `(QuantifierPhrase badger raid "seldom")`
   companion; orchard witness projected (definite).
   MUST-NOT: adverb dropped (no companion + default strength); `(Manner … seldom)`.
8. **fixpack3-000008** "Priya refused to sign the waiver." (D2)
   MUST: refuse event (Agent priya, Past) + `Theme` → sign event reified TOP-LEVEL with
   `(Agent <sign> priya)` (controller copied) + waiver typed; sign event has NO tense atom.
   MUST-NOT: the sign complement sealed as a term argument; tense/occurrence on sign.
9. **fixpack3-000009** "The annex is not a licensed clinic." (E4)
   MUST: ONE strength-0.0 `(And (Member <annex> clinic) (Member <annex> licensed))` bundle;
   `(Member <annex> annex)` typing outside.
   MUST-NOT: positive `(Member <annex> clinic)` at strength 1 beside a negated `licensed` only.
10. **fixpack3-000010** "The mill became a hostel." (E5)
    MUST: become event with mill as Patient (Past); reified result state (`Member st hostel` +
    `Experiencer st mill`) + flat `(Member <mill> hostel)` + `(Result <become> <st>)`.
    MUST-NOT: a fresh hostel ENTITY distinct from the mill (identity severed); spatial `Goal`.
