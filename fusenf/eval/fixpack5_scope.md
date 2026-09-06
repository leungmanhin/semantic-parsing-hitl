# Fix-pack 5 — scope proposal (2026-09-06, for owner approval)

Inputs: the three semantic-chemistry LORE harvests at prompt `2ed18b93` — 607 reviewed records
(461 reviewer q2 gap strings) and 192 adjudicated records (210 adjudicator-confirmed gaps, 119
adjudicator-new gaps, 156 defect summaries of `defect` rulings) = **946 strings**, routed
mechanically into 31 families by `harness/harvest_gaps.py` with the table
`eval/fp5_families.json` → `eval/fp5_gap_routing.json` (family → [record, source, string]) and
`eval/fp5_gap_harvest.md` (counts per family × source × chunk, examples, 4 unrouted). Counts are
RELATIVE MASS: a string routes to every family whose pattern matches, and the same gap is often
filed at review and again at adjudication. The fiction v2–v4/pending harvests (61 + 65 + 65
strings, banked in the cycle log) were not re-routed here; they fall into the same families.

Chunk-level signal: flagged rate 26% → 29% → 39% across chunks 1–3, driven by chunk 3's
technical-process register (distillation, tides, harvest yields), not by #52. Adjudicators
now routinely file "no licensed compliant form" (135 strings carry that verdict), which is
the cleanest signal for where DESIGNED text (not pins) is needed.

Standing constraints honored: prompt stays pinned at `2ed18b93` until FP5 is validated and
adopted; the fragment/`InFragment` pack stays OUT (its own pack); engine-gated items OUT;
teach-to-the-test — no pack example may echo a lore or fiction record (consumer corpora are
never mined and never recited); #49 caution — anything that reverses an FP4-legislated
boundary (the indefinite-singular witness rule; the plural-label Name-only boundary) is an
explicit decision point in Tier D, never a silent pin.

---

## Tier A — safety class (false or widened atoms). All INCLUDE.

| # | item | evidence | treatment |
|---|---|---|---|
| A1 | **near-fit head instead of record-the-gap** — totality "the whole cliff base" → `(Member base whole)`; "for the coming month" → `Time`; a comitative reified as a `trade` event; "in one night" → `Measure duration`; "a full night of essence" → an invented `duration` scale where `unspecified` is mandated | adjudicator cross-cutting note (ajlo2-12, ajlo3-10, ajlo3-16); ~30 defect summaries | emphasis pin in Core patterns: the leave-out-and-record rule beats any near-fit head; list the four recurrent traps (totality, frame adverbial, comitative, container span) |
| A2 | **restriction widening** — "unprotected lanterns" universalised over every lantern; "eat nothing else" / "other insects" dropped so the claim widens; "through late autumn" flattened to a `Time` point; `Start`/`End` invented from a "through" frame | 194 negation/contrast strings; lore-000447/580/585/573 | pin + add temporal windows and contrastive "other" to the widening examples; the licensed move is drop-and-record |
| A3 | **dependent existentials hoisted or shared** — "a Keeper's personal tool" possessor hoisted to top level; "the trapped fish" minted per subject; one `sk_key_1` shared across a rule and a separate event (asserts identical key sets) | 158 strings; no-form 19; lore-000505/521/460 | safety half of B4: possessor + possessum stay inside the consequent as Skolem functions; nothing is shared unless the text says so |
| A4 | **tense dropped inside strength-0 distribution rules** — a past denial ("No wraith emerged in the near-miss winters") becomes dispositional | lore-000267 + chunk-1 siblings | pin: tense atoms travel into the rule consequent with the event |
| A5 | **causee role in periphrastic causatives** — "let the lantern dim", "makes salt-bloom crumble" get `Agent` from the form-based bullet, ill-typed against the intransitive-subject test | lore-000373/486; reviewers + adjudicators agree | fix the causative bullet: the causee takes the role the embedded verb assigns it (unaccusative → `Patient`) |

## Tier B — the lore/consumer core (high mass, needs designed text). All INCLUDE unless marked.

| # | item | evidence | treatment |
|---|---|---|---|
| B1 | **Kind-level subjects with verbal predicates** — (i) bare MASS/process kind subjects ("Distillation thins", "Mire-essence smells…", "Salt does not replace…") land as flat token events with the kind in a role slot at 1.0/0.99; (ii) present-tense STANDING-CONFIGURATION bare plurals ("Iron bands reinforce the Lantern", "stones pave the path") match neither arm of the bare-plural split; (iii) kind-relation trigger mis-fired/missed for bare-plural + bare-mass pairs | 132 + 51 + 29 strings; no-form 19; chunk 3 = 67 | NEW sub-section "Kind-level subjects": mass/process kind → distributing rule at 0.9/0.9 (kind-relation when the object is also bare), never a token event; a THIRD arm of the bare-plural split = specific group witness for standing configurations; restate the kind-relation trigger with a negative example. The indefinite-singular witness rule is NOT reopened here (D2) |
| B2 | **Of-phrases on non-nominalization NPs** — container/measure ("several vessels of mire-essence", "a handful of feathers"), material/constitution ("walls of dark stone", "a table of oak"), part-whole with a KIND whole ("sky-cat feathers"), relational nouns ("precursor of", "the flame of", "cousin of"), place part-nouns ("the outer edge of the village": `PartOf` vs the geography `LocatedIn` rule) | 145 strings; no-form 18; the possessive-of exclusion names no replacement | NEW "Of-phrases" table: container/measure → container witness + entity-attached `(Of <container> <mass>)` (extends the nominalization/origin licence — the adjudicators' nominated form); relational nouns → `Possession` with the verb-paraphrase test restated; place part-nouns → `PartOf` when the head is a relational part-noun; material → D3 |
| B3 | **Compound modifier exposure** — multi-word/hyphenated modifiers inside fused compounds (cold-threshold, deep-ebb, full-moon spring tide) exposed or half-exposed; participial preparation modifiers (ground/dried/boiled/prewarmed/molted) fused vs distributed; coined vocabulary whose IS-A test is unevaluable (wintergloss→gloss, salt-bloom→bloom, sky-cat→cat); agent-nominalization compounds (harbor_lantern_keeper: genus AND capability?) | 244 + 107 strings; no-form 23; chunk 3 = 94 + 60 | decomposition table: expose only single-word predicable adjectives; multi-word/hyphenated modifiers stay inside the symbol, no exposure; participial preparation modifiers = descriptive (never fuse, distribute); coined vocabulary: head genus by default, modifier never exposed; agent-nominalization compounds emit BOTH capability pattern and head genus. Symbol form for solid compounds = D4 |
| B4 | **Scope under rules** — indefinites, possessives ("its station", "a Keeper's child"), covarying definites, unnumbered bare-plural dependent groups, second same-verb event naming (`sk_<verb>` collides) | 158 + 13 strings; no-form 19 | NEW sub-section with a table: consequent indefinite → Skolem function of every universal it varies with; possessor+possessum inside; definite object → shared constant unless possessive/covarying; bare-plural dependent group → `(sk_group $x)` + `GroupOf`; naming `(sk_<verb>_2 $x)` for a second same-verb event |
| B5 | **when/whenever/after triggers** — "after P, Q" has no `Before` substitution in the whenever template; stative/copular triggers ("when the tide is low", "when nightmoths are scarce") have no trigger eventuality; definite participants in a present-tense regularity; "at each <event-noun>"; trigger event placed in the conclusion; mass anaphora ("that salt-bloom") | 143 strings; no-form 17 | extend the template: connective table (when/whenever → `During`; after → `Before(trigger, response)`; before → the reverse); stative trigger → the reified state IS the trigger eventuality; "each <event-noun>" → occurrence rule + `QuantifierPhrase`; definite-participant regularities → rule form over the constants; mass anaphora → premise variable |
| B6 | **Frequency adverbs & the QuantifierPhrase companion** — over witness subjects ("A Keeper often inherits…"), definite individuals ("The Council usually decides"), mass subjects; sub-1.0 `(And …)` on positive events is unlicensed; "occasionally" absent from the dial | 167 strings; no-form 18; adjudicators accepted the `(And …)`-at-strength improvisation twice | legislate the carrier (D5): whole event bundle in one `(And …)` at the dial strength for witness/definite subjects + `QuantifierPhrase` allowing the subject symbol in slot 1; add "occasionally" to the dial |
| B7 | **Plural distribution pins** — definite-plural objects need `GroupOf` not `Member`; per-member rule omitted for distributive transitives; group-vs-distribute undecided for position atoms, stative transitives, plural-subject change-of-phase resultatives, jointly-produced structural transitives ("Iron bands reinforce"); coordinated objects inside rule conclusions (one Skolem event per binding); bare-plural objects in obliques/habituals | 297 (largest, heavily cross-routed) + 90 coordination; no-form 36 + 16 | extend the "which predicates distribute" table (position atoms, stative transitives, resultatives with plural subjects, structural transitives = group-only); coordinated objects in a rule → per-conjunct Skolem functions or a rule split; bare-plural objects in habituals/obliques = non-specific kind fillers |
| B8 | **Identity / definite predicate nominal** ("X is THE N": "Neap tides are the small tides", "Frost-eve is the night before…", "Mid-summer is a feast", "the deep ebb is a slow current at…") | ~15 distinct records (120 cross-routed); no carrier for uniqueness or identity | D6 — pin the status quo (Member/Inheritance, uniqueness unrecorded, gap-record) unless an engine-side identity head is adopted |

## Tier C — cheap lexicon & pins. All INCLUDE.

| # | item | evidence | treatment |
|---|---|---|---|
| C1 | preposition obliques: `LocatedIn` is containment-only; on/around/along/over/into/off/out of/through/alongside → surface-preposition oblique; directional path PPs on motion; framing "in X"; accompaniment "with" on inanimates → `With` | 133; no-form 14 | one pin + the with-split extended (CoAgent / Instrument / With) |
| C2 | role tests: animate self-propelled risers (wraiths rise → `Agent`); institutional stative verbs (hears/recognizes/observes → Agent/Theme); need/want → Experiencer; "hold" custody vs capacity; scalar-change subjects → Theme; "winter came" → Theme; sensory linking verbs (smells/tastes ADJ) | 133 strings, 74 defect summaries | a verb-class line-up appended to the role section |
| C3 | seasons & spans: non-deictic seasons = bare `Time` constants; modified seasons ("late autumn", "deep winter") = one joined constant; recurring natural cycles ("at the quarter moons", "every full moon") → `(Every e 1 <cycle>)`; coordinated seasons → two events or `Or`; "through/over <period>" = D7 | 181; chunk 3 = 97 | pins + one dial line |
| C4 | named recurring occasions (Lantern-night, Frost-eve, Mid-summer) = Name-bearing constant usable as a `Time` filler; no genus, no kind decomposition ("new moon" stays opaque in a time slot) | 45 | pin |
| C5 | singular cardinal "one N" → `(Cardinality <witness> 1)` licensed on a witness | 120 (measure family) | pin |
| C6 | adverb drops: once / then / far / late / repeatedly / periodically / in succession = drop-and-record; "in pairs/batches" → `In` oblique; "by heart" → gap | 109 | pin list |
| C7 | position-clause verb class: add roost/nest/run (along)/extend/stretch/reach for spatial extent; semi-copular "sit idle" / "stays good" → state reification; stacked PPs on a position clause | 42 | lexicon line + pin |
| C8 | `QuantifierPhrase` companions mandatory for each/every/all/no over kind ranges incl. "at each <event-noun>"; never invented over a witness subject (see B6) | (mass inside B6/B5) | pin |
| C9 | deontic/modal: "may/cannot" on a definite individual stays an event with `Permitted`/`Can`; relational kinds ("A Keeper's child may decline") → rule with `Permitted` on the consequent event; "not forbidden" resolves to permitted | 86 | pins |
| C10 | deverbal nouns never typed under the verb class (persistence, lighting → their own kind with `Of` to the underlying event where stated); "re-" prefixes never split into `Again` | 72 | pin |

## Tier D — decision points (include in FP5, or defer per #49)

| # | question | my lean |
|---|---|---|
| D1 | **The #52 casing cluster** (five boundaries seen in all three chunks): capitalized plural role labels ("the Keepers" — Name-only vs `GroupOf keeper`), epithets ("Old Vesh" three routes), proper noun + lowercase head ("Cauldron Hall Warden", "Hollows lanterns" — Possession vs fusion vs label), institution labels ("the Council", "the Watch" — no-Name default), hyphenated occasions and sentence-initial labels ("Harbor-lantern Keepers"). Options: (a) status quo; (b) capitalized plural ROLE labels = `GroupOf <role>` + `Name` (both), so per-role rules join the label; (c) consumer rewrites only | (b) — it is the one change that connects the consumer's rules to its labels; reverses an FP4 boundary, so it is yours to call; epithets → title carve-out extended to "Old/Young"; institution labels → keep no-Name but ALWAYS emit the kind atom (they already do) |
| D2 | **Lore-register generic route for indefinite-singular subjects** ("A thin day yields one vessel", "A Keeper often inherits…") — reopen the FP4 witness rule, or keep it and let the consumer write bare plurals? | keep the rule (the newswire corpora depend on it); the standing-configuration arm in B1 and the frequency carrier in B6 remove most of the pain; advisers already give the bare-plural rewrite |
| D3 | **Material/constitution head** (`MadeOf`) for "walls of dark stone", "a table of oak", "iron-lidded" | include — small, frequent in lore AND newswire, no engine impact |
| D4 | **Symbol form for solid/hyphenated compounds** (`nightmoth` vs `night_moth`) | as written (surface-faithful symbol) + mandatory head genus; hyphen → underscore only; the consumer's own hyphenation then decides joins |
| D5 | **Frequency carrier over witness/definite subjects** — `(And …)` at dial strength + `QuantifierPhrase` with the subject symbol | include (B6); it is the improvisation adjudicators already accept |
| D6 | **Identity / uniqueness of definite predicate nominals** — new `SameAs`-style head vs status-quo pin | status-quo pin in FP5; file the identity head as an engine ask (substitution semantics), OUT of doctrine text |
| D7 | **"through/over <period>" spans** — extend `During` to period fillers vs drop-and-record | extend `During` to calendar/season constants (smallest change); coordinated periods → two events |
| D8 | **Empty-parse marker** — a licensed empty parse and a crashed run are byte-identical on disk | harness-side only: assembler records `empty: true` and the incident log is the disambiguator; no prompt change |
| D9 | **Timing vs H mining** — H is running on the `2ed18b93` substrate; adopting a new hash mid-H splits the substrate | author FP5 now, VALIDATE and pin it, but adopt for dispatch only after BATCH2_REPORT (or re-substrate at the new hash as a measured M2 arm) — your scheduling call |

## Tier E — explicitly OUT

Multi-reading marginalization (#48, engine-gated); identity substitution (D6's engine half);
the fragment/`InFragment` pack; open-world negation (#10) incl. exceptive "nothing else"
beyond the drop-and-record pin; metonymic subjects (2 strings); object-control
communication verbs (2 strings, the control rule already covers them).

## Sizing & validation

Roughly **2 new sub-sections (Kind-level subjects; Scope under rules), 2 tables (Of-phrases;
compound decomposition), ~5 designed rules (frequency carrier, whenever connectives,
standing-configuration arm, `MadeOf`, coordinated-object rule split), ~25 pins, 2 lexicon
sweeps (position verbs; adverb drops + dial words)** — prompt growth est. +300–450 lines in
~3 waves (A + B1–B4; B5–B8 + C; D as ruled). Validation as FP3/FP4: goldens per construct
(est. +35–50; none may echo a lore/fiction/tierD record), e2e additions (container `Of`
retrieval; frequency carrier at strength; whenever/after ordering; `MadeOf` if adopted),
no-recital + teach-to-the-test audit against ALL consumer and measurement corpora,
pre-registered blind batch, vocab re-pin (`MadeOf`, `With`, `Occasionally` band as needed),
then hash adoption per D9. Riding the new hash: the 145 lore defect-awaiting records
(coverage row), the fiction pending set, and the tierC_heldout/tierD M2 arms as fresh
re-parses.
