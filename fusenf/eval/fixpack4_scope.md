# Fix-pack 4 — scope proposal (2026-08-28, for owner approval)

Inputs: the tierD adjudication harvest (896 gap strings: 601 reviewer-confirmed + 295
adjudicator-new, all 221 verdicts), the tierD review q2 harvest (656 strings, 250
records), the fiction review harvest (176 strings, 138 records), the run-50/reyield
family ledgers (banked), and the five owner rulings of 2026-08-28
(`rules/owner_decisions.jsonl`). Mechanical family routing:
`scratchpad/fp4_gap_routing.json` (1,728 strings, keyword-clustered; counts are
RELATIVE MASS — the same gap is often filed at review and again at adjudication, and a
string can route to two families).

Standing constraints honored: the fragment/`InFragment` redesign is OUT (its own pack
after FP4; interim rulings only); engine-gated items OUT; teach-to-the-test — no pack
example may echo a motivating tierD/fiction/run-50 record; #49 caution — design-heavy
items are explicit decision points, not silent inclusions.

---

## Tier A — safety class (false or meaning-inverting content). All INCLUDE.

| # | item | evidence | treatment |
|---|---|---|---|
| A1 | **"would" doctrine / irrealis** — future-in-the-past & refusal readings; irrealis relatives ("a bill that would have legalized…") NEVER asserted; sequence-of-tense in embedded reports | 81 strings; inversions tierD-000083/183/010; ruling 3 | NEW section (sequence of tense + irrealis), supersedes the two scoped "would→Future" examples |
| A2 | **comparatives/approximators do not entail the positive** — "broader"≠broad, "almost X"≠X, minimizers ("little changed") | 44 + adverb-slot subset; repeated confirms | emphasis pin + drop-don't-assert rule; minimizer→strength-band note |
| A3 | **the four seal interim rulings written into doctrine**: wholly-negative complements drop whole + gap-record (Theme-less attitude licensed; never assert the positive); `(AccordingTo <sealed-P> <source>)` evidential construct; sealed distribution rules w/ fresh-variable discipline; dual-emit group precedence | rulings 1/2/4/5; 124 seal-projection strings | one "Sealing — interim rules" subsection consolidating all four + the projection table (B5) |
| A4 | **restriction/hedge widening pin** — never silently widen a restricted claim | 18 + run-50 family | emphasis |
| A5 | **world-knowledge typing ban, codified** — a kind atom is licensed when readable off the words, a defect when it needs the world ("Devil Rays→team", "Tampa→city") | 2 routed strings but ~15 adjudication confirms | emphasis pin adopting the ajtd-04 principle verbatim |
| A6 | **superseded/retracted values** — a corrected deadline/figure never stands at full strength beside its replacement | tierD-000250 + delta family | small rule (Past-wrap or drop the superseded bound) |

## Tier B — the newswire core (high-mass routing & structure). All INCLUDE unless marked.

| # | item | evidence | treatment |
|---|---|---|---|
| B1 | **Measure overhaul** — (i) scale lexicon + when a coined scale is licensed (dimension noun stated) vs banned; (iii) endpoint-of-change ("rose TO 6.1%") relation; (iv) rate units (`cent_per_share` convention generalized); (vi) unitless figures (licensed bare-magnitude form or explicit drop) | 227 + 190 + ~10 endpoint strings in unrouted; 000147 loses all 3 figures; 000197/198/217 | (i)(iii)(iv)(vi) in-pack; **(ii) delta-carrier = decision point D1**; (v) percent/ProportionOf boundary clarified |
| B2 | **Names & premodifiers rewrite** — proper-noun premodifier routing (settle the 3-route split: default `Possession`-opaque per repeated adjudication upholds, fusion only when the referent IS the named entity); false-title appositives ("Defense attorney Rork"); party-tags/ages out of Name strings; numeral-initial names; tickers = dropped secondary identifiers (one-Name rule); name-only kinds ("the Quartet"); capitalized institutional common nouns (Keepers/Council/Watch: common-noun default, Name only with a distinguishing string) | 69+222+56+17 across four families; fiction 3-route variance | one coherent Names-section rewrite (largest text item, mostly rules not new machinery) |
| B3 | **Plural/group completion** — ruling-5 precedence line; optional Skolem-function per-member STATES (completes the dual-emit residue); episodic bare-plural subjects (a real rule: specific-reference plurals get witnesses, not generics); bare-plural objects/obliques; covarying pronouns route | 231 + 78; ruling 5 | precedence line + 2 designed rules; **Skolem-state completion = D6-lite, recommend include** |
| B4 | **Attribution & attitude roles** — AccordingTo construct (ruled); direct quotation = sealed non-factive that-clause (interim doctrine line ratifying the graceful route); impersonal-reported verb list +expect; ONE doctrine line for speech/attitude holder role (Experiencer for attitude-with-complement; ends the 3-way Agent/Experiencer tension); "reported" factivity note | 121 + 94 | section edits + verb-list additions |
| B5 | **Seal-projection interim table** — what stands at top level beside a seal: Member/Name typing (today) + definitional decomposition atoms + a definite's presupposed possessor/`Of` restrictors; QuantifierPhrase companion = sealed sibling; everything else stays in | 124 strings; ajtd-10/26/34 opposite-direction repairs | interim table, full answer deferred to the fragment pack |
| B6 | **`During` pin + oblique boundary** — "During renders only 'during'" (single most-violated line); named-role vs preposition-named boundary notes (via→Instrument; result-infinitive ≠ purpose `To`, breaking the seeded `PurposeOf` bridge misfires) | 42 + 83 + 38 | emphasis pin + 2 boundary notes |
| B7 | **Adverb slots** — degree/duration/sequence/scope adverbs: licensed slots where cheap (duration adverbs), explicit drop-don't-misslot elsewhere | 128 | pin + small lexicon; **new heads = decision point D4** |
| B8 | **Tense wrappers** — appositive/copular typing takes the host wrapper; titular-premodifier exception; reduced-relative tense; no tense on non-finites (pin) | 81 | emphasis cluster |

## Tier C — cheap lexicon & pins. All INCLUDE.

C1 time lexicon: week/year/decade/quarter + fiscal periods + day-parts (dawn/overnight) (62). C2 **stay/remain persistence + "keep X ADJ" maintenance predicate** — one small "continuation" construct covers both (50+22; fiction + ruling-5 companion gap). C3 **premise-binding pin + bare-"when" routing** — the fiction headliners (29-record unfireable-rule census; 24 when-strings): premises bind through plain variables, Skolems are conclusion-only; "when P, Q" routed between whenever/if. C4 QuantifierPhrase companion sweep (127; incl. neither/none list). C5 `Ongoing` four-marker pin (8 + run-50). C6 modal sense-map: add "could"; deontic-adjective routing note (run-50). C7 anaphora pins: definite re-mention reuses the witness; demonstrative-without-antecedent → `thing`; cataphora note (110). C8 kind-relation strength channel (fiction; 19): QuantifierPhrase-for-kind-relations. C9 compound notes: solid-spelling fusion; relational-adjective exposure test; non-compositional compounds ("heart attack") genus exception (17+). C10 unrouted smalls: coordinated modifiers sharing a head; framing PP over copular clauses; event-noun maker genitive ("his remarks"); perfect infinitives under control; focus particle on amounts; discourse-initial "But".

## Tier D — decision points (include in FP4, or defer per #49)

| # | question | my lean |
|---|---|---|
| D1 | **Delta/differential Measure carrier** — new construct (e.g. a change-measure form) vs explicit drop-rule. Without it, financial deltas stay unrepresentable (000147) | design it in-pack: newswire + the consumer both need it; it is the single highest-value new construct |
| D2 | backward-window adverbials ("in the past two years") | small construct, include |
| D3 | full verbatim-quotation design (string-preserving) | DEFER to the fragment pack; interim = sealed that-clause (B4) |
| D4 | new adverb heads (e.g. `Duration`) vs drop-rules only | include `Duration` only; drop-rules elsewhere |
| D5 | gerund/nominalized-clause subjects ("Lighting a lantern produces…") | include (fiction/consumer needs it; occurrence-quantification extension) |
| D6 | one-of-N & superlative carriers (82; blocked reyield partials 000436/001144) | include — membership-in-top-set design |

## Tier E — explicitly OUT

Fragment/`InFragment` redesign (own pack; #10 extended). Engine-gated: open-world
negation #10, #16 range queries, And-prover item X, projection/unsealing. FP3's
deferred-design queue stays deferred where unattested here (metaphor, equatives,
existential-count focus). Corpus-filter improvements (tickers etc. are parse-side
drops, not filters).

## Sizing & validation

This is materially bigger than FP3 (which was 4 sections + 2 rules + 5 pins): roughly
**3–4 new sections, ~6 designed rules/constructs, ~15 pins/notes, 2 lexicon sweeps** —
prompt growth est. +450–700 lines, authored in ~4 waves (A; B1–B3; B4–B8; C+D). Same
validation gauntlet as FP3/3.1: goldens per construct (est. +45–60), e2e additions,
no-recital + teach-to-the-test audit against ALL THREE motivating corpora, pre-registered
blind batch, vocab re-pin, then hash adoption. Riding the new hash afterwards: fiction
run-2 (consumer KB v2), the 189+54 repair re-review, the 26 reyield partials, and the
167-record review-defect residue re-parse.
