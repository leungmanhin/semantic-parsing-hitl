# Fix-pack 4 blind batch — PRE-REGISTERED expectations (written before dispatch, 2026-08-28)

Prompt candidate `1f3bcefc66…` (2,910 lines), FROZEN before dispatch (post-audit: the
teach-to-the-test/recital sweep's 11 illustration fixes + the AmongMost slot-order fix are
in). Parser: blind Sonnet per PARSE.md, raw/fixpack4-*__run1.txt. Judged per item: MUST all
present (shape, not symbol names), MUST-NOT all absent. All content words mechanically
verified fresh vs prompt.txt + regression goldens before registration.

1. **fixpack4-000001** "The tribunal shelved an ordinance that would have curbed night barges." (A1 irrealis relative)
   MUST: shelve event (Agent=tribunal witness, Theme=ordinance witness, Past); ordinance + tribunal
   typed. The irrealis relative asserted NEITHER way — no curb atoms at any strength; gap recorded.
   MUST-NOT: an asserted curb event (any tense/strength); `Counterfactual` (no had-clause);
   the relative silently dropped WITHOUT a gap self-report.
2. **fixpack4-000002** "Emeric chose a lighter mallet." (A2 attributive comparative)
   MUST: choose event (Agent=emeric + `Name`, Theme=mallet witness, Past); mallet typed; the
   elided-standard comparative dropped with a gap record.
   MUST-NOT: `(Member <mallet> light)` positive; a `More`/`MoreBy` with an invented standard;
   `Manner`-slotted "lighter".
3. **fixpack4-000003** "According to the gazette, the canal froze." (A3 evidential attribution)
   MUST: `(AccordingTo <P> <gazette>)` with the freeze event (+ its `Past`) sealed inside P;
   gazette + canal typing project top-level; no top-level freeze assertion.
   MUST-NOT: top-level `(Member <e> freeze)`; the gazette as Agent/Experiencer of an invented
   say event; the sealed P duplicated outside the wrapper.
4. **fixpack4-000004** "\"The grain was not sifted,\" the miller conceded." (A3 wholly-negative quote)
   MUST: concede event (Experiencer=miller holder role, Past); miller typed; the wholly negative
   complement dropped whole — Theme-less attitude — with a gap record.
   MUST-NOT: a positive sift event at any strength; a `Theme` carrying any sift residue;
   `Agent` for the attitude holder.
5. **fixpack4-000005** "The berm upgrade, first planned for autumn, is now planned for spring." (A6 superseded value)
   MUST: exactly ONE operative scheduling value (spring) on the upgrade/plan eventuality; the
   autumn value absent or `Past`-wrapped as history.
   MUST-NOT: autumn and spring standing unqualified side by side on one eventuality.
6. **fixpack4-000006** "The voltage climbed from 3 to 9 volts." (B1 scalar endpoints)
   MUST: climb event (Theme=voltage bearer, Past) + `(MeasureFrom <e> <scale> 3 volt)` +
   `(MeasureTo <e> <scale> 9 volt)`; scale = voltage (subject IS the dimension) or `unspecified`.
   MUST-NOT: `(Goal …)` spatial route; a timeless `(Measure <voltage> … 9 volt)` on the bearer;
   endpoints dropped.
7. **fixpack4-000007** "Kelbrook draughtsman Sanna Waldenrath, 51, emigrated." (B2 names cluster)
   MUST: person symbol from the name alone, `(Name <p> "Sanna Waldenrath")`; occupational
   premodifier as ordinary typing `(Member <p> draughtsman)`; org premodifier via opaque
   `(Possession <p> kelbrook)` + `(Name kelbrook "Kelbrook")`; age `(Measure <p> old 51 year)`
   (Past wrap licensed); emigrate event (Agent=p, Past).
   MUST-NOT: "draughtsman", "Kelbrook", or ", 51," inside the `Name` string; a fused
   kelbrook_draughtsman compound; the age dropped.
8. **fixpack4-000008** "Stevedores thronged the quay." (B3 episodic bare plural)
   MUST: `(GroupOf <g> stevedore)` witness + throng event (Agent=g, Past) + quay witness typed.
   MUST-NOT: a generic `(Implication (Member $x stevedore) …)` rule; a bare kind symbol as the
   event's Agent.
9. **fixpack4-000009** "When a grommet tears, the hoist jams." (C3 generic bare-when)
   MUST: a rule (Implication, generic-band TV) whose premise binds through PLAIN variables
   (tear event + grommet typing all `$`-vars); consequent jam event via Skolem-FUNCTION terms
   (`(sk_jam $x)`-style), `During`-linked; hoist witness may sit in the consequent
   (definite, conclusion-only).
   MUST-NOT: any `sk_` constant or function term in the premise; a one-off two-event reading;
   the rule replaced by witness events.
10. **fixpack4-000010** "Salting the walkway corrodes the railings." (D5 gerund subject)
    MUST: whenever-machinery — premise = the salt-event clause with the EVENT as a plain
    variable (never a minted witness for the gerund occurrence); the definite walkway as a
    stated participant (an asserted top-level witness constant in the premise is licensed —
    asserted constants fire; the unfireable census bans only sk-FUNCTION terms and unasserted
    constants there); consequent corrode event as Skolem-function per-occurrence terms,
    `During`-linked; railings witness/group in the consequent.
    MUST-NOT: the gerund reified as a single witness event asserted to have occurred; an
    invented Agent for the salting; a non-rule (flat) reading.
11. **fixpack4-000011** "The viaduct is one of the longest spans in Tarnwick." (D6 one-of-N)
    MUST: `(AmongMost long <viaduct> span)` (scale first) + `(Member <viaduct> span)` +
    viaduct's own typing; the Tarnwick restriction on the ENTITY as its own atom(s)
    (`LocatedIn`/`In` + `Name`).
    MUST-NOT: flattened `(Most long …)` unique-top claim; the superlative dropped; the
    restriction folded into the class symbol.
12. **fixpack4-000012** "The cellar was fumigated in the past four months." (D2 backward window)
    MUST: fumigate event (Theme=cellar, Past) + `(WithinLast <e> 4 month)`.
    MUST-NOT: `(Measure <e> duration 4 month)`; the window as a plain `Time` constant;
    the window dropped.

Notes for the judge (me, post-hoc): licensed alternatives per the goldens file header absorb
symbol naming, atom order, redundant-but-true typing, and explicitly-licensed alternative
routes (e.g. Past-wrapped superseded history in #5, Past-wrapped age in #7). Anything else
non-conformant = a finding against the pack, dispositioned before the re-pin.
