# M1 Tier C — diagnosis of the 25 `unclassified` disagreements

Input: `canonical/tierC_m1.canon.jsonl` (60 items × 2 runs, prompt `38fc16af20`, canon/3).
Dump tool: `harness/m1_disagreements.py` (new — reusable for every future fix round).

**Verdict: M1 = 0.317 is not a ceiling.** Of the 25 `unclassified` pairs, **21 are convention
gaps** — the prompt does not decide the question, so two runs decide it differently — and only
**4 have an irreducible component** (PP-attachment ambiguity or corpus noise). Nothing here is a
defect in the representation; every gap is a missing paragraph.

The gaps are dominated by one thing Tier A does not contain and Tier C is made of: **the
encyclopedic named entity in a static, non-eventive sentence** ("X is a village in Y", "the
Yarkand River of western China"). The prompt's locative, meronymic and naming machinery is all
defined **on events**, and Tier C's sentences mostly have none.

---

## The `canonicalizer` BLOCKER is closed — it was a bucket-rule ordering bug

`tierC-000147` ("In modern times it is mainly a recreational sport and sporting activity"):

- wildcard terms: **identical**
- terms at full precision: **identical**
- STVs: **differ** — run 1 read *mainly* as `0.9`, run 2 as `1.0` on four `Member` atoms
- `shape_id`: **same**; `graph_id`: differs

That is the textbook definition of `tv-only`. It was reported as `canonicalizer` because
`attribute()` ran the wildcard test *before* the `shape_id` test, and the wildcard projection
cannot see truth values.

**Fixed** in `m1_stability.py`: `tv-only` is now checked first. A second guard was added — wildcard
equality also collapses *coreference* differences (`(Theme e0 x0)` and `(Theme e0 x1)` both read
`(Theme SK SK)`), which are real meaning differences, so `canonicalizer` now additionally requires
the canonicalizer's own `exact` certificate on both sides.

Confirmed clean: `proof_name` does **not** enter any hash (`_project` uses `term` + STV only), so
arbitrary proof labels never depressed M1. Tier A v8 re-runs unchanged at **0.931**; Tier C
buckets are now `unclassified` 25 / `decomposition-depth` 11 / `optional-atom` 4 / `tv-only` 1,
**no blocker**.

---

## The gaps, ranked by how many of the 41 disagreeing pairs they touch

Tags are mechanical over all 41 pairs; a pair usually carries two or three.

| # | gap | pairs | kind |
|---|---|---|---|
| G1 | static locative / meronymy on an **entity** | 20 | missing construct |
| G2 | `Name` atom emission is optional in practice | 15 | underspecified |
| G3 | multi-word proper name: one symbol or decomposed | 10 | **two rules conflict** |
| G4 | `Member` vs `Inheritance` for a kind-level subject | 8 | underspecified |
| G5 | definite/bare plural → `GroupOf` or plain kind | 6 | underspecified |
| G6 | property-vs-event routing under deontics | 1 | decision not generalized |
| G7 | derived/participial modifier: lemma or surface | 2 | underspecified |
| G8 | bare pronoun's class symbol | 1 | underspecified |

`decomposition-depth` (11 pairs) is **the same eight causes** with a larger atom-count delta —
its head profile is identical (`Member` 34, `Name` 16, `Location` 10, `Inheritance` 10, `PartOf`
7). The bucket boundary is an artifact of size, not of cause.

---

### G1 — static locative and meronymy on an entity (20 pairs)

The prompt defines `Location` as an **event oblique** ("Obliques: … `Location` ('in/at/on …')")
and `PartOf` as **group membership** ("link any named members with `PartOf`"). Tier C asks for
neither: it asks where a *thing* is and what it is *part of*, with no event anywhere.

    tierC-000028  The Frasin River is a tributary of the Straja River in Romania.
      run 1  (PartOf frasin_river straja_river)  (Location frasin_river romania)
      run 2  (Possession frasin_river straja_river)  (Location straja_river romania)

    tierC-000168  Chongqing is a district in Wanzhou District, China …
      run 1  (PartOf chongqing wanzhou_district)
      run 2  (Location chongqing wanzhou_district)   (PartOf wanzhou_district china)

    tierC-000154  In fluid mechanics, a homentropic current has uniform … entropy.
      run 1  (In SK fluid_mechanics)        run 2  (Location SK fluid_mechanics)

Three separate improvisations for one missing construct: `PartOf` (repurposed from groups),
`Possession`, and entity-attached `Location`. The validator already notices the last one — **C6
fired 3× in this sample** with *"`(Location …)` attaches to `straja_river`, which has no `(Member
straja_river <verb>)`"*. Across all 360 parsed Tier C records, **44 of 190 `Location` atoms (23%)
attach to a non-event**, and `PartOf` is used 95 times.

`tierC-000154` is a third case again — a **framing/domain** PP ("in fluid mechanics"), which is
not a place at all. The prompt's preposition-named-oblique carve-out covers "what the activity is
*about*", which does not quite fit a domain frame, and `In` is a sanctioned open-class
preposition, so both runs are legal.

**Proposed:** a static-relation rule giving entity-level location and meronymy their own heads,
distinct from the event oblique `Location` and from group `PartOf`; and an explicit line routing
domain/framing PPs. This is the one gap that needs a **spec decision**, not just wording.

### G2 — when is a `Name` atom required (15 pairs)

The prompt says a *named individual* gets "a stable name-derived symbol … **plus** a `Name`
fact". Runs disagree on whether a **place, organization or work** counts as an individual:

    tierC-000031  (Name greece "Greece")        — run 1 only
    tierC-000111  (Name japan "Japan")          — run 1 only
    tierC-000196  (Name morrow "Morrow")        — run 1 only
    tierC-000302  (Name wilson "Wilson")        — run 2 only

Cheapest fix in the set: state that **every** proper noun — person, place, organization, work,
event — gets exactly one `Name`. Note `Name` is `surface-record` class, so it is already excluded
from `content_id`; this depresses `graph_id` agreement only.

### G3 — multi-word proper names: one symbol or decomposed (10 pairs)

Two prompt sections give opposite instructions and neither yields to the other. **Names and
casing** says derive the symbol *from the name*; **Compound concepts** says prefer a single lemma
and otherwise decompose into parts. For "Yarkand River" both apply.

    tierC-000076  Margaret Fleming married James of Barrochan …
      run 1  (Agent SK margaret)          (Name margaret "Margaret Fleming")
      run 2  (Agent SK margaret_fleming)  (Name margaret_fleming "Margaret Fleming")

The `Name` **string is identical**; only the symbol differs. That is a pure convention gap with no
semantic content whatsoever — and it costs a whole pair.

    tierC-000143  (PartOf xinjiang_uyghur yarkand) (Member yarkand river) (Name yarkand "Yarkand")
             vs   (Location SK yarkand_river)      (Name yarkand_river "Yarkand River")

    tierC-000206  (Member SK context) (Member SK non_spatial)
             vs   (Member SK non_spatial_context) + 2 (Inheritance …) atoms

**Proposed:** a proper name is a **single opaque symbol from its full surface form**, and the
compound-decomposition rule does not apply to it (it already exempts "non-compositional names" —
that exemption just needs to name proper nouns explicitly, and to say the whole name goes in the
symbol).

### G4 — `Member` vs `Inheritance` for a kind-level subject (8 pairs)

    tierC-000340  Its subtropical or tropical moist habitats are natural lowland forests …
      run 1  (Member SK moist)      (Member SK plantation)      (Or (Member SK subtropical) …)
      run 2  (Inheritance SK moist) (Inheritance SK plantation) (Or (Inheritance SK subtropical) …)

Instance-level vs class-level for a plural generic subject. This one has **engine consequences**:
a concrete `Inheritance` auto-generates a member view plus an inheritance view, so the choice
changes what is derivable, not just what is written. Worth a decision paragraph of its own.

### G5 — definite/bare plural → `GroupOf` or plain kind (6 pairs)

    tierC-000160  It supported the views of the Free Soil Party and the Republican Party.
    tierC-000356  It supported the views of the Republican Party and of the Free Soil Party.
      run 1  (Member SK view)
      run 2  (GroupOf SK view) (GroupOf SK view) (Theme SK SK)

These two items are **each other's paraphrase pair**, and they diverge *the same way* — that is
about as clean a demonstration as one gets that this is systematic, not sampling noise. Also
`tierC-000258` (`Possession` vs `GroupOf`) and `tierC-000351` (plural agent as a group node vs
directly as the kind).

### G6 — property-vs-event routing under deontics (1 pair, high value)

    tierC-000320  Pedestrians and bicycles are not permitted, but may be allowed on a footpath.
      run 1  4 × (Implication (Member $v0 …) (And … (Might …) …))     — full event rules
      run 2  (ConditionalProperty bicycle allowed footpath)
             (Inheritance bicycle permitted)                          — property form

The 2026-07-27 decision settled exactly this shape for capability generics ("Ns can V" → the
property `(Inheritance kind (can v))`, not an event rule). It was never generalized to
`permitted` / `allowed` / `obligated`, even though the prompt already lists `(permitted <action>)`
as a reified property constructor. One pair here, but the construction is common and the fix is
already-decided doctrine.

Related, same family — **ad-hoc relation invention** instead of decomposition:

    tierC-000262  (Implication (And (Compute == …) …) (AlgorithmicallyEquivalent $v0 $v1))
    tierC-000282  (Concerning $v0 kiev)   vs   an event: (Member SK concern) (Theme SK kiev)

C4 already catches `AlgorithmicallyEquivalent` (and flagged `Brother`, `Similar`, `Assist`,
`Immiscible` elsewhere in this sample). It does **not** catch `Concerning`, because `Concerning`
is one of the 72 sanctioned open-class prepositions — so `(Concerning treaty kiev)` is legal, and
so is the event reading. The prompt needs to say that a **reduced relative clause is an event**,
not a prepositional relation.

### G7 / G8 — two one-line fixes

    tierC-000211  (Member SK north)    vs  (Member SK northern)      "northern Estonia"
    tierC-000214  (Member SK present)  vs  (Member SK presented)     "a presented scale"
    tierC-000089  (Member SK person)   vs  (Member SK man)           "He wrote the script"

G7: the lemmatization rule covers **inflection** ("All inflectional variants … map to one
symbol"); `northern` and `presented` are **derivational**, and the rule is silent. Standing
surface-faithfulness doctrine says keep `northern` / `presented`. G8: fix one class symbol for a
bare pronoun.

---

## What this buys, honestly

A pair only flips to agreement when **every** difference in it resolves, and most pairs here carry
two or three gaps. So these are not additive: G1 touching 20 pairs does not mean fixing G1 adds 20.
The useful reading is the other direction — **the same eight causes account for essentially all 41
disagreeing pairs**, and 21 of the 25 I read have no irreducible component at all. Fixing the set
should move M1 substantially; predicting the number would be guessing, and the last time I
estimated a stability figure from a partial signal I was wrong in the optimistic direction.

The four with an irreducible core:

- `tierC-000028` — "in Romania" attaches to Frasin or Straja. Genuine.
- `tierC-000308` — "being part of the Alexander Valley AVA": Wine Country or Cloverdale. Genuine.
- `tierC-000043` — distribution of an embedded event over a coordinated implored subject;
  sentence is also garbled.
- `tierC-000197` — "…bake ice cream cones Headquarters moves to Baltimore" — two sentences run
  together with no punctuation. Corpus noise.

The last two are a reminder that Tier C is machine-extracted Wikipedia: `tierC-000143` asserts
that an autonomous region *is a river*, and `tierC-000111` ("In Japan it was first given on and
the name was discovered") is truncated. A residue of irreducible disagreement is expected here in
a way it never was for Tier A's constructed sentences.

## Recommended order

1. **G3, G2, G7, G8** — pure wording, no spec decision, four cheap edits.
2. **G6** — generalize the settled 2026-07-27 property-vs-event rule to deontics; add the
   reduced-relative-is-an-event line.
3. **G4, G5** — decision paragraphs (`Member`/`Inheritance` for kind subjects; when a plural
   becomes a group).
4. **G1** — the one real spec decision: static location and meronymy as first-class relations on
   entities. Biggest win, most design work.
5. Re-measure M1 on the **same 60** before parsing anything further.

---

# Fix round 1 — applied 2026-08-06

`prompt.txt` 2,195 → **2,230** lines, sha `38fc16af20` → **`a69803e5ea8e`**. e2e **329/329** after
every edit (prompt-only edits can't move e2e, which runs on hand-written goldens — it is insurance,
not evidence). Harness tests 56/56 under the PeTTaChainer uv env.

**G3 + G2 — `## Names and casing`.** A proper noun now explicitly includes places, organizations,
works, vessels, treaties and named events, and gets **exactly one** `Name`, "neither optional nor
restricted to people". New bullet: a multi-word name is **one opaque symbol from the whole name**,
the name is its **capitalized run of words** (internal lowercase particles kept), an adjacent
lowercase common noun is the **type** not part of the name, and the kind is stated in one ordinary
type atom. Cross-reference added at the head of **Compound concepts**: *"Nothing in this section
applies to a proper noun."* That retires the direct conflict between the two sections.

Also fixed the example that **taught** G2: `Mia has lived in Oslo since 2019` emitted
`(Name mia "Mia")` and no `(Name oslo "Oslo")` — precisely the person-yes/place-no asymmetry the
parses reproduced. Added, plus a parenthetical that later examples elide `Name` atoms but a real
parse always emits them.

**G7 — lemmatization.** "**Inflection only — never derivation.**" `coastal` is not `coast`; a
participle used as a modifier is an adjective (`laminated`, not `laminate`), decided by the word's
function in *this* sentence, not its shape.

**G8 — pronoun witnesses.** A pronoun with no antecedent takes a witness classed by what the
pronoun *means*, never by grammatical gender: he/she/they-sg → `person` (**not** `man`/`woman`),
plural they → a group, it → the salient kind else `thing`.

**G6 — corrected, then fixed.** My diagnosis above said the deontic property form "was never
generalized" beyond capability generics. **That was wrong** — lines 1534-1541 already name
"drivers must carry a license" / "visitors may enter" / "guests must not smoke" and route all of
them to `(Inheritance <kind> (obligated / permitted / can <action>))`. The real gap is narrower and
neither half was covered:

1. **Passive/participial deontics** ("are not permitted", "may be allowed") — every documented cue
   was an active modal verb, so the passive form did not read as a deontic norm at all.
2. **Elided action** — `(permitted <action>)` needs an action and "Pedestrians are not permitted"
   has none. Nothing said what to do, so one run built a full event rule with `Might` and the other
   dropped the constructor for a bare `Inheritance … permitted`.

Added: the cue is the **modal meaning, not an active modal verb**, with the participle→constructor
mapping; and when the action is elided, **do not invent one** — use the deontic participle as a
**bare property** of the kind, with any locative/circumstantial restriction going in the
`ConditionalProperty` condition slot as for any kind-level norm.

Also added the missing **reduced-relative** rule (the other half of G6): a participial
post-modifier is a reduced relative clause and takes the **event** form, never a relation named
after the participle — **not** `(Concerning rule levy)`. Test by expanding to a full relative
clause. Genuine *-ing* prepositions (`during`, `pending`, `notwithstanding`) are carved out.

**G4 + G5 — merged.** They turned out to be one gap, not two: every instance
(`tierC-000340` "its habitats", `000206` "these functions", `000160`/`000356` "the views") is a
**plural subject with a determiner**. One rule now covers both: a plural is decided by its
**determiner, not its meaning** — bare plural → generic `Inheritance` on the kind; definite /
demonstrative / possessed plural → a **group witness** `(GroupOf <group> <kind>)`, never
`Inheritance`. This also lines up with the negation-denial rule added 2026-08-04, which already
uses "a bare plural or an explicit quantifier" as *the* generic signal.

## Corpus hygiene

Every new example token was checked against `regression/regression_cases.md` and all corpora
before use. Two were caught and replaced:

- **`margaret_fleming`** — lifted from `tierC-000076`, the very item it illustrated. Publishing the
  intended symbol for a sentence we are about to re-measure would have seeded the answer.
  → `imogen_hartsley`.
- **`panel`** — live in two regression cases (`[dist-partof]`, `[recip-group-collnoun]`) and in
  Tier A, so it breaks the no-overlap rule. → `worktop`.

Remaining new tokens verified clear: `kestrel_river`, `halvard_of_sunne`, `brindle`, `estuary`,
`coastal`, `mountainous`, `tidal`, `laminated`, `trellis`, `levy`, `skiff`, `jetty`, `trailer`,
`causeway`.

## Still open

**G1 (static locative / meronymy on an entity, 20/41 pairs)** — deliberately not attempted here;
it is the one item needing a spec decision rather than wording. One correction to the diagnosis
above: `PartOf` is **not** only group membership — the prompt already uses it for part-whole
("car engine" → `(PartOf sk_engine_1 sk_car_1)`), so the meronymy half is partly covered and the
gap is narrower than stated. What has no home at all is **static location of an entity** ("X is a
village in Y"), which is why `Location` gets attached to non-events 44/190 times and C6 fires.

---

# Fix round 2 — G1 applied 2026-08-06 (`LocatedIn`)

Decision: a **distinct head**, not a widened `Location`. `prompt.txt` → **2,256** lines
(sha `4a0ff2a1a495`), `seeded_rules.metta` → **288** lines (sha `b7e25b963478`), goldens
346 → **351**, e2e **334 / 334**.

## Why distinct, in one line

Widening was cheaper by exactly one seeded rule; it cost a representation in which "a thing is in
a place" and "an event happened in a place" are the same predication. The new
`locin-noleak` e2e check is that argument made empirical: with `(LocatedIn averby marchford)`
asserted, a bare `(Location $x marchford)` returns `[]`. Under a widened `Location` it would have
returned a village in answer to "what took place here?".

A second reason for widening evaporated on inspection: **C6 never checked event-hood.** It checks
that a role's carrier was *typed somewhere* (`declared` is built from `Member`/`Inheritance`
heads), and the three firings were parses that gave an entity a `Name` but no type atom —
`tierC-000028` being the case in point. G3's now-mandatory type atom addresses that directly, so
the validator was neutral between the options all along.

## What was added

**`prompt.txt`** — `(LocatedIn <entity> <place>)` for the static location of a thing, with the
**stative locative verbs** ("is located in / lies in / sits in / is situated in") routed onto it
since they predicate a position rather than report an event. `Location` keeps its event job; the
head *is* the event-vs-entity distinction, as `Member` vs `Inheritance` is the individual-vs-class
one. Never both for one fact. Plus two boundary rules:

- **A place inside a place is `LocatedIn`, never `PartOf`.** `PartOf` keeps its two existing jobs
  (object component, group member). A relational noun that states a link rather than a position
  ("a tributary **of** …") stays an ordinary genitive.
- **A framing / domain PP** ("in fluid mechanics") is not a place under either head — it takes the
  preposition-named oblique `(In …)`.

**`seeded_rules.metta`** — new *Spatial scaffolding* section:

    (: locin_trans (Implication (And (LocatedIn $a $b) (LocatedIn $b $c)) (LocatedIn $a $c)) (STV 1.0 0.99))
    (: locin_event (Implication (And (Location $e $x) (LocatedIn $x $y)) (Location $e $y)) (STV 1.0 0.99))

`locin_event` is the one that would be easy to omit and expensive to miss: without it, "the
festival is held in Methoni, a village in Greece" answers "was it held in Greece?" with `[]` and
no error.

**`vocabulary.json`** — `LocatedIn` (operator, arity 2, `bridged: true`, `frozen: false`).
Verified hash-neutral: re-canonicalizing all 87 `tierA_m1v8` records reproduces
`graph_id`/`shape_id`/`content_id` **identically**, so every earlier M1 number stays comparable.

**Regression** — 5 e2e checks (`locin-static`, `locin-trans`, `locin-event`, and the two SAFETY
cases `locin-noleak` / `locin-partof-ctrl`) and 5 goldens.

## Corpus hygiene, round 2

Two violations caught **in my own goldens** and fixed: `situated` and `maritime law` both appear in
the prompt's *worked examples*, so a golden using them would test recall rather than the rule.
The stative-verb golden now uses "lies in" (named only in the prose list, not in any worked
example) and the framing-PP golden uses "admiralty law". New tokens verified clear: `averby`,
`marchford`, `thornmere`, `calderwick`, `hamlet`, `boathouse`, `regatta`, `derelict`, `admiralty`.

## Status

All eight gaps G1–G8 are now addressed. **Next: re-measure M1 on the same 60 Tier C items** —
same sample, same 2 runs, so the number is directly comparable to 0.317 — before any further
parsing.

---

# Round 2 measurement + diagnosis of the remaining 18 (2026-08-06)

`tierC_m1v2` = the same 60 items, runs 3 & 4, under prompt `4a0ff2a1a495`.

**M1: 0.317 → 0.417.** Still below the 0.60 bar, so the decision rule still says STOP.
`soft_jaccard_mismatch` 0.485 → **0.634** (surviving disagreements are much closer to each other);
disagreeing pairs 41 → 35; buckets `unclassified` 18 / `decomposition-depth` 9 /
`optional-atom` 6 / `role-choice` 2, and **no `canonicalizer`**.

## The fixes hit their targets

Item level: **19 → 25 agreeing = 12 fixed − 6 regressed.**

Nine of the twelve fixed are exactly the diagnosed items — `000028`, `000031`, `000065`,
`000076`, `000089`, `000143`, `000214`, `000308`, `000320`. **Two of them (`000028`, `000308`) I
had called irreducible PP-attachment ambiguity**; the `LocatedIn` / `PartOf` split resolved both,
so that estimate was pessimistic.

Of the six regressions, **only one is attributable to the edits**: `000106`, where run 4 emits the
now-required `(Member east_coast_railway railway)` and run 3 doesn't. The other five are older
gaps that happened to agree in the old pair — three are `Patient` vs `Theme` (backlog #23), one a
`CardinalityPhrase`, one a `Between` arity choice. With 2 runs per item, agreement is a noisy
binary and items flip both ways from sampling alone.

## What the remaining 18 are

The character has shifted. Round 1 was *"the prompt does not say"*. Round 2 is mostly **boundary
cases the new rules do not actually decide** — a gap in how I wrote them, not parser noise.

| # | gap | pairs |
|---|---|---|
| H1 | `Location` vs `LocatedIn` boundary | 4 |
| H2 | `Member` vs `Inheritance` for a property on a **witness** | 3 |
| H3 | oblique role choice (`Beneficiary`/`For`, `In`/`During`) | 3 |
| H4 | ad-hoc relation invented from a verb/adjective | 2 |
| H6 | named-entity granularity residue | 2 |
| H8 | optional core-event atoms (bucket-rule gap) | 2 |
| H5 | derivational **adverb** (`commercial` / `commercially`) | 1 |
| H7 | `Name` string whitespace | 1 |

### H1 — the boundary I failed to draw (4 pairs)

    tierC-000045  The company built a hotel in Eskisehir in Turkey …
      run 3  (Location SK eskisehir)      run 4  (LocatedIn SK eskisehir)

My rule says "where a *thing* is → `LocatedIn`; event oblique → `Location`". **"Built a hotel in
Eskisehir" is both** — the building event happened there *and* the hotel is there — and the rule
is silent on which to emit. Same in `000046`. Two further edges it does not cover: **"from"-origin
on an entity** (`000204`: `(LocatedIn barako batangas)` vs `(Source barako batangas)`) and
place-in-place, where `000211` still shows `LocatedIn` vs `PartOf` despite the new rule.

**Needed:** when an event creates or positions an object in a place, emit the event `Location`
only — the object's position follows from the event, and a second atom double-states it. Plus an
explicit line for "from X" origin, and a restatement of place-in-place.

### H2 — property on a witness (3 pairs)

    tierC-000262  These algorithmically equivalent sequences …
      run 3  (Inheritance SK accidental)    run 4  (Member SK accidental)

The G4/G5 rule decided the **subject** (bare plural → kind, determined plural → group witness) but
never said which relation predicates a **property of a witness symbol**. It should be `Member` —
a witness is an individual — but the prompt does not say so. Also `000154`, `000211`.

### H3 — obliques (3 pairs)

`000302` is a genuine internal conflict: the prompt lists `Beneficiary` glossed **"for …"**, and
also says to use the preposition-named oblique when the PP is not a where/when/how. "Won an Emmy
**for his portrayal**" satisfies both readings — `(Beneficiary …)` vs `(For …)`. `Beneficiary`
needs a narrower gloss (an animate party who benefits). Also `In` vs `During` on an event-denoting
noun (`000152`, "in the LaGrand case"), and whether a framing PP's object is a bare symbol or a
witness (`000206`).

### H4 — ad-hoc relations, still (2 pairs)

`(Inject local_intradermal_injection botulinum_toxin)` and `(Similar …)`+`(Symmetric Similar)` vs
`(Like …)`. I added the *reduced-relative* case but never wrote the general prohibition. C4 keeps
catching these — `Brother`, `Similar`, `Inject`, `AlgorithmicallyEquivalent` across both runs — so
the check works and only the instruction is missing.

### H5 / H7 — two one-line items

`000231`: `commercial` vs `commercially`. My derivation rule gave **adjective** examples only; an
adverb needs the same treatment (`-ly` is derivation — keep it).

`000296`: the two `Name` strings differ **only by a space before a comma** —
`"City , LA"` vs `"City, LA"` — because the PAWS source is tokenized with spaced punctuation.
`content_id` is identical; only `graph_id` differs. This is mechanical, so per deterministic-first
it belongs in the **canonicalizer** (normalize whitespace around punctuation inside string
literals), not in the prompt.

### H8 — a bucket-rule gap, not a parse gap (2 pairs)

`000160` and `000356` have `only_a` empty and `only_b` non-empty — one run is a strict multiset
superset — which should bucket as `optional-atom`. They land in `unclassified` because
`attribute()` compares wildcard atoms as **sets**, so duplicated atoms make the set difference
empty. Worth fixing alongside the earlier ordering bug.

## Where Patient/Theme actually lives

The head profile shows `Theme`/`Patient` in 9 disagreeing pairs, but only **one** of those is in
`unclassified` — the rest are mechanically bucketed. Backlog **#23** is now the largest single
family among the *bucketed* pairs, and is the clearest round-3 target alongside H1 and H2.

---

# Fix round 3 — applied 2026-08-07 (H1–H8 + backlog #23)

`prompt.txt` 2,256 → **2,314** lines (sha `4a0ff2a1a495` → **`a28062d07204`**); goldens 351 →
**361**; e2e **334/334**; canonicalizer + validator tests **73 + 56 OK**. Prompt edits, code
fixes, and a canon version bump, in that order:

## Prompt edits

- **H1 boundary.** *An event that creates or positions a thing takes `Location` on the event
  ONLY* — the object's later position is an inference (and may be false: built once, demolished
  since), so a second `LocatedIn` both double-states one fact and asserts unclaimed persistence.
  Stacked "in <Place>" after a place NP contains the **place**. Entity-attached **"from" is
  origin, not position** — `(From sk_wool_1 calderwick)`, neither `LocatedIn` (wrong fact) nor
  event `Source` (no event).
- **H2 witness.** Appended to the `Member`/`Inheritance` discipline: any minted `sk_*` symbol —
  ordinary or **group** witness — is an individual, so its properties attach by `Member`;
  `Inheritance` requires kinds on **both** sides.
- **Fuse-vs-split determinizer** (the H2/H6 residue): adjective+noun **fuses** only as a term of
  art (`blast_furnace`), nationality/origin (`breton_tapestry`), role title, or material
  adjective; **incidental description never fuses** ("a dented pail" = two atoms). On a plural,
  a fusing classifier rides in the `GroupOf` kind slot; a **descriptive** modifier distributes
  like a copular predicate.
- **H3 obliques.** `Beneficiary` narrowed to *a party the event is done for the benefit of*;
  "for" naming ground/prize/exchange → `(For …)`. Two mechanical rules: the oblique head is the
  preposition **actually used** (`in` stays `In`; `During` renders only "during"), and oblique
  object NPs follow ordinary NP rules (article → witness; bare domain/mass/proper → constant).
- **H4.** *Never coin a relation head* — closed-class heads + preposition-named obliques are the
  entire relational vocabulary; the only open-class escape is the `Symmetric`-tagged mutual
  predicate; a preposition is never promoted ("like" stays `(Like …)`).
- **H5.** `-ly` adverbs are derivation: `Manner` keeps `brightly`, never `bright`.
- **H6.** A lowercase **adjective** before a name is not part of it: region witness + `Member`
  property + `LocatedIn` containment ("in coastal Calderwick").
- **#23.** Extended the "state change need not be physical" clause to **informational
  artifacts** (compile/splice/redact/abridge → `Patient`; "physically" contrasts with handling,
  not with abstract media) and made displacement explicit for animates (an abducted diplomat →
  `Theme`).

## Code fixes

- **H8 (`m1_stability.attribute`)** — wildcard comparison switched from sets to **multisets**.
  Wildcarding collapses distinct skolems onto identical strings, so records carry duplicate
  wildcard atoms; under `set()` a strict multiset superset diffed to nothing on both sides and
  fell to `unclassified`. Counters fix that (and re-file some pairs the set test had
  mis-bucketed in *both* directions — bucket tables before/after this fix are not comparable).
- **H7 (canonicalizer) → `fusenf-canon/4`.** Whitespace inside string literals is normalized at
  tokenization (runs → one space; none before `,;:.!?%')]` or after `([`). PAWS's tokenized
  punctuation ("City , LA") made two faithful parses hash apart on spacing alone. Four new
  tests. **Every hash changes with the version, so all 22 live canonical files were
  regenerated** (the five `canon/1` pilot relics stay as history, as in the /3 sweep).

## Numbers under canon/4 (the comparable set)

| measurement | canon/3 | canon/4 |
|---|---|---|
| Tier A m1v8 (3 runs) | 0.931 | **0.931** (unchanged) |
| Tier C runs 1+2, prompt `38fc16af20` | 0.317 | **0.317** (unchanged) |
| Tier C runs 3+4, prompt `4a0ff2a1a495` | 0.417 | **0.433** |

Exactly one pair moved: `tierC-000296`, the whitespace case /4 exists to erase. The baseline
report `m1_tierC_2run.md` was regenerated with the fixed bucket rule (its old table came from the
buggy `attribute()`).

**Standing: 0.317 → 0.433 after two rounds, bar is 0.60. Next: re-measure on the same 60 under
`a28062d07204` (runs 5+6) — round-3 edits target 11 of the 34 remaining disagreeing pairs (H1 4,
H2 3, H3 3, H5 1) plus the role-choice/decomposition share of #23.**

---

# Round 3 measurement — runs 5+6 under `a28062d07204` (2026-08-07)

**M1: 0.433 → 0.483** (`tierC_m1v3`, same 60 items, canon/4). Still below the 0.60 bar.
Trajectory: **0.317 → 0.433 → 0.483**. Disagreeing pairs 34 → 31; `soft_jaccard_mismatch` 0.580;
`unclassified` 18 → **12**. Runs clean: 58+59/60, C4 only (`Brother` again, plus one
informational variadic-arity note on the garbled `000043`).

## Item level: 29/60 agreeing = 13 fixed − 10 regressed

**The round-3 targets landed.** Fixed: `000045`/`000046` (H1 built-in-place, the headline
targets), `000104`/`000270` (#23 informational-creation / abduction), `000154` (H2 witness),
`000160` (H8 family), `000231` (H5 adverb), `000302` (H3 For-ground), `000144` (H6 lowercase
"western China"), plus `000025`, `000106`, `000113`, `000258`.

**The 10 regressions decode into four causes, none mysterious:**

1. **Genuine ambiguity resurfacing** — `000028` both runs now use `LocatedIn` (the construct is
   stable); they differ on *which* river "in Romania" modifies. Its round-2 agreement was luck.
   The 2-run binary will keep flipping such items.
2. **A new boundary my H3 gloss created** — `000055` "doubled **for** Nelson": substitution
   satisfies both the benefit reading (`Beneficiary`) and the ground reading (`For`). The gloss
   needs one clause deciding on-behalf-of/substitution.
3. **Name-rule adoption lag** — `000076` (one run split "James of Barrochan" into
   `(LocatedIn james barrochan)` despite the rule's own `halvard_of_sunne` example),
   `000308`/`000296` (one run emits the now-required kind/decomposition atom, the other doesn't
   — same shape as `000106` last round, which settled this round).
4. **Rule collision at the capitalization margin** — `000143` has capitalized "**W**estern
   China": G3 (capitalized run = name) and H6 (region witness) genuinely conflict there; the
   lowercase sister `000144` fixed cleanly. Needs one sentence: capitalized direction adjectives
   join the name.

Plus pre-existing wobbles unrelated to round 3: `000209` `Recipient`/`Goal` on "talk to",
`000172` tense-on-copular, `000065`/`000309` optional atoms.

## The `canonicalizer` bucket is retired — the test was structurally unsound

This round's report flagged `canonicalizer = 1` again. Traced: `tierC-000111`,
`(Ordinal e0 1 give)` vs `(Ordinal x1 1 give)` — the ordinal attached to the **event** in one run
and an **entity** in the other, both exactly canonicalized. Wildcard-equality cannot distinguish
"isomorphic graphs hashed apart" (a real canonicalizer bug) from "same atoms, different wiring"
(a real semantic difference): collapsing skolems erases exactly the wiring information needed.
Two rounds, two firings, two false alarms — the test is not fixable in this projection.
`attribute()` now buckets these as **`attachment`** (a mechanical, honest label), and
canonicalizer health stays where it can actually be checked: the unit suite's permutation-
invariance and idempotence tests. All three eval reports regenerated under the final bucket rule.

## Reading the trajectory honestly

+0.116, +0.050 per round, against a 0.60 bar. Three observations rather than a forecast:

- Roughly half of each round's regressions are **adoption lag on that round's own rules**, which
  the *next* round's runs partly recover (`000106` lagged in round 2, settled in round 3). Some
  of the remaining gap is self-healing noise, not missing doctrine.
- The residue is now dominated by **small optional-atom / role-boundary wobbles** (optional-atom
  7, decomposition-depth 9) rather than missing constructs — cheap rules each covering 1–2 pairs,
  with diminishing per-edit yield.
- A **hard floor is visible**: `000028`-style attachment ambiguity, `000043`/`000197`-style
  corpus garble, and flip-luck on a 2-run binary. On this machine-extracted corpus that floor is
  plausibly in the 0.75–0.85 region of *items*, several of which will still flip in any given
  2-run sample — worth keeping in mind when judging distance to 0.60.

**Candidate round-4 edits (small):** H3' substitution-for clause; capitalized-direction-adjective
clause; `Recipient` vs `Goal` on speech verbs; tense inside vs outside a copular in a
`Past`-wrapped membership. Whether to spend another round before the arm-level decision is a
judgment call, not an obvious continuation.

---

# Fix round 4 — applied 2026-08-07 (four boundary edits)

`prompt.txt` 2,314 → **2,330** lines (sha `a28062d07204` → **`64ad24645a04`**); goldens 361 →
**365**; e2e **334/334**. No code changes, no canon change. All four edits close boundaries the
round-3 measurement exposed:

- **Substitution-"for"** (`000055`): acting in someone's place or on their behalf ("deputized
  for the reeve") is the benefit relation → `Beneficiary`; the ground/prize reading keeps
  `(For …)`. Golden `[ben-substitute]`.
- **Capitalized modifier joins the name** (`000143`): the G3/H6 cue is the **casing itself** —
  "Upper Calderwick" is the single name `upper_calderwick`, no witness; the same word lowercased
  carves the sub-region. Golden `[name-capmod]`.
- **Addressee = `Recipient`** (`000209`): communication is a transfer, so "talk / mutter to X"
  takes `Recipient`, never spatial `Goal`. Golden `[recipient-speech]`.
- **Surface tense decides, mechanically** (`000172`/`000065`): a past copular wraps even when
  the fact reads as timeless, wraps **every** categorical atom the clause yields (`PartOf`
  included), and an **appositive** takes its host clause's wrapper. Golden `[appositive-tense]`.

Next when quota allows: runs 7+8 on the same 60 under `64ad24645a04` — the fourth point on the
0.317 → 0.433 → 0.483 trajectory, and the round most informative about the floor (these four
edits target ~5 specific pairs; whatever remains after them is close to irreducible-plus-noise).

---

# Round 4 measurement — runs 7+8 under `64ad24645a04` (2026-08-07): THE PLATEAU

**M1 = 0.433.** Trajectory: **0.317 → 0.433 → 0.483 → 0.433.** Runs clean 118/120 (C4 ×2, the
usual `Brother`). On 60 binary items the standard error of this measurement is ≈ 0.06, so rounds
3 and 4 are **statistically indistinguishable**: the fix loop has plateaued at **≈ 0.45 ± 0.06**,
and the 0.60 bar is not reachable by prompt edits on this corpus.

## The edits worked — and it didn't move the number

Three of the four round-4 targets settled (`000143` capitalized name, `000209` Recipient,
`000172` tense). The fourth (`000055`) no longer fights over `Beneficiary`/`For` at all — the
substitution rule landed — it now differs by ONE atom: `(Also paul_cavanagh SK)` vs
`(Also double SK)`, a focus-particle attachment wobble. Meanwhile **ten items that agreed in
round 3 flipped out** (`000046`, `000144`, `000154`, `000160`, `000231`, `000258` among them —
several were earlier rounds' "fixes"), and seven flipped in. Net −3.

## The four-measurement structure is the floor made visible

Across all four measurement pairs (runs 1–8, four prompt versions):

- **9 items agreed every time** — the stable core.
- **18 items agreed never** — the hard core: corpus garble (`000043`, `000197`, `000111`),
  genuine attachment/reading ambiguity (`000012`, `000152`, `000196`, `000211`, `000282`), and
  items whose parse distribution has ≥3 forms.
- **33 items flip between rounds** — per-item agreement probability sits mid-range, so a 2-run
  binary keeps re-rolling them. 15 of round 4's 34 disagreements differ by **1–2 atoms**.

Under this structure the measured M1 is the mean of per-item agreement probabilities, and that
mean is capped well below 0.60 regardless of further wording: each round's edits genuinely fix
their targets (verified three rounds running) while the flip zone re-rolls, which is why the
number oscillates instead of climbing.

## Standing

The pre-registered decision rule (< 0.60 → STOP, fix the prompt) assumed instability = prompt
defects. Four rounds have now separated the two: the fixable share was real (0.317 → ~0.45) and
is spent; the residual is **structural** — machine-extracted corpus noise, genuine ambiguity,
and 1–2-atom attachment wobbles on a 2-run binary. Options from here are decision-level, not
edit-level: accept ~0.45 and parse Tier C under a majority-of-3 (or modal-of-5) regime; or first
measure the **M2 convergence half on the already-parsed 360** (they are the paraphrase arm, so
complete pairs exist) to see whether the headline metric survives this noise level without any
further parsing spend. Further prompt rounds against this sample would be chasing noise.
