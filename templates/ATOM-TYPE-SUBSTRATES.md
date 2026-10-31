# Atom-type substrates

Generated from `templates/atom-type-substrates.json` (schema `atom-type-substrates/1`) by `templates/tmpl/gen_substrate.py`, together with `templates/generated/atom-types.metta`. Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`.

163 heads in 14 kinds (7 proposed; 163 with a reviewed type declaration so far). `type-def` is the PeTTa declaration emitted for the head; `?` as the output type means the head is not yet reviewed and is absent from the `.metta` file; `%Undefined%` marks a position the head takes but the JSON does not type.

Every atom is carried as a statement (: <proof-name> <atom> <tv>), tv = (STV strength confidence) or another engine truth value. The carrier is not an atom kind: ':' is never type-declared (it is also PeTTa's type-declaration head) and the truth value is declared by the engine, not by this substrate.

Types: Atom, Class, Context, Distribution, Entity, Event, Instance, Level, Number, Proposition, Statement, String, TimeTerm.

Declared type list (PeTTa convention, capitalized): Atom = unchecked position; Proposition = a statement-forming expression; Instance with sub-types Entity and Event (a symbol carries both its sub-type and Instance); Class; Number; String. Migration mapping from the ad-hoc names: term, assertion -> Proposition; property, verb-lemma, unit -> Class; symbol, reading-tag -> String; var, uncertain -> Atom. A union such as Event|Proposition expands to one declaration per alternative. `out` = the output type of the head's type declaration, set as each kind is reviewed. Proposed types Statement (a statement id = the proof name, reified) and Context (a scope reified), both sub-types of Instance by dual declaration; they belong to the flat context VIEW of scope unless that form becomes canonical. TimeTerm = a reified time instant or period (not named Time: that is the role head) (sub-type of Instance by dual declaration; time predicates Day / Hour / Month / … describe it). Distribution = an engine value (ParticleFromNormal …) allowed where an approximate number is. Level = a degree / proportion level: a symbol from a closed label set (very, excessive, most, half — declared Level by the emitter) or a term standing in for one ((forKind class), (Fraction n d)).

## core-link (11)

head: And
kind: core-link
arity: 2+ (variadic)
type-def: (: And (-> Proposition Proposition Proposition))  ; and 7 more (per arity / per union alternative)
gloss: Conjunction bundle; one fact, one truth value.


head: Coref
kind: core-link
arity: 2
type-def: (: Coref (-> Instance Instance Proposition))
gloss: Hypothesis that two mentions denote one entity; STV = probability of identity. Base of the resolved-entity view. A mention type is pending.
status: proposed


head: Equivalence
kind: core-link
arity: 2
type-def: (: Equivalence (-> Proposition Proposition Proposition))
gloss: Symmetric equivalence of two propositions; strength = P(P and Q | P or Q). The reversible-packaging link; lowers to the engine's BiImplication.
status: proposed


head: Implication
kind: core-link
arity: 2
type-def: (: Implication (-> Proposition Proposition Proposition))
gloss: Inference rule: a Premises term implies a Conclusions term.


head: InContext
kind: core-link
arity: 2
type-def: (: InContext (-> Statement Context Proposition))
gloss: Membership of a statement in a scope context: the flat (unnested) form of scope, where a scope operator becomes a predicate of the context — (Might c1) (InContext f1 c1). Structural link, not a status; absent from the canonical operator form, present in the generated flat view.
status: proposed


head: Inheritance
kind: core-link
arity: 2
type-def: (: Inheritance (-> Class Class Proposition))
gloss: A class/property is a subclass of another class/property.


head: Member
kind: core-link
arity: 2
type-def: (: Member (-> Instance Class Proposition))
gloss: An individual belongs to a class or holds a property.


head: Narrow
kind: core-link
arity: 2
type-def: (: Narrow (-> Class Atom Class))
gloss: A comparison class: the class as a noun phrase narrows it — (Narrow city (LocatedIn sk_scotland_1)), the cities located in Scotland; (Narrow album (And (Mod jazz) (Possession sk_ottoline_1))). Each restriction is an atom with its member left out, several in an And in a fixed order; a noun, a name or a year before the class noun is (Mod harbour), (Mod sk_calderwick_1), (Mod (Year 1904)) — a class narrowed by its nouns alone, (Narrow pilot (Mod harbour)), is stated by its members beside their plain class, with no rule; a relational noun's relatum is (Relation mayor sk_calderwick_1), a dated period (Within (Century 18)). Built by the program from the parse, so every text that says the same gets the same term; a rule beside the superlative defines its members.


head: Or
kind: core-link
arity: 2+ (variadic)
type-def: (: Or (-> Proposition Proposition Proposition))  ; and 7 more (per arity / per union alternative)
gloss: Inclusive disjunction: at least one disjunct holds, unspecified which.


head: Similarity
kind: core-link
arity: 2
type-def: (: Similarity (-> Class Class Proposition))
gloss: Symmetric, non-transitive similarity between two classes; the approximate-abstraction link. Never chained into equivalence classes.
status: proposed


head: Xor
kind: core-link
arity: 2
type-def: (: Xor (-> Proposition Proposition Proposition))
gloss: Exclusive disjunction: exactly one of two disjuncts holds.


## role (17)

head: Agent
kind: role
arity: 2
type-def: (: Agent (-> Event Entity Proposition))
gloss: Volitional doer / subject of an action. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Bearer
kind: role
arity: 2
type-def: (: Bearer (-> Event Entity Proposition))
gloss: The one a relation holds of — the subject of a stative relation: Bram in 'Bram is Yusra's son', (Bearer state Bram); both relata of a symmetric relation ('Yusra and Lamine are cousins': two Bearer atoms on one state); the mill in 'the mill depends on the stream'. Order: (Bearer state bearer); the other relatum is the Theme. A feeling, a perception or an attitude takes Experiencer; a state of having (own, have, lack) takes Holder.


head: Beneficiary
kind: role
arity: 2
type-def: (: Beneficiary (-> Event Entity Proposition))
gloss: 'for …' oblique: only a party the event is done for the benefit of (incl. acting in someone's place); a 'for' naming the ground, prize or exchange is the preposition-named (For …) oblique instead. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: CoAgent
kind: role
arity: 2
type-def: (: CoAgent (-> Event Entity Proposition))
gloss: Animate co-participant named by a comitative phrase ('with John'). A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Experiencer
kind: role
arity: 2
type-def: (: Experiencer (-> Event Entity Proposition))
gloss: Subject of a felt or experienced state — a psych state, a sensation, a perception, an attitude, a predicate-adjective state; the subject of a stative relation (son of, married to, depends on) is Bearer. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Goal
kind: role
arity: 2
type-def: (: Goal (-> Event Entity Proposition))
gloss: Non-recipient destination / 'to …' oblique (whither); the addressee of a transfer or communication is Recipient, never Goal. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Holder
kind: role
arity: 2
type-def: (: Holder (-> Event Entity Proposition))
gloss: Subject of a possession state only (own, have, lack); the subject of a stative relation is Bearer. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Instrument
kind: role
arity: 2
type-def: (: Instrument (-> Event Entity Proposition))
gloss: The means an action is performed by ('with a knife') or a 'via / by way of' route or channel: a tool, substance or conduit, never a person (a person 'with' whom is CoAgent). A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Location
kind: role
arity: 2
type-def: (: Location (-> Event Entity Proposition))
gloss: Where the eventuality holds ('in/at/on …'). A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Manner
kind: role
arity: 2
type-def: (: Manner (-> Event Class Proposition))
gloss: Adverbial manner of the eventuality. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Path
kind: role
arity: 2
type-def: (: Path (-> Event Entity Proposition))
gloss: The landmark a motion passes, crosses or follows as its direct object: (Path e x) — passed a stall, crossed the river, climbed the hill; the transitive counterpart of the obliques Past / Across / Along.


head: Patient
kind: role
arity: 2
type-def: (: Patient (-> Event Entity Proposition))
gloss: Object the action creates, destroys, consumes or physically changes. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Recipient
kind: role
arity: 2
type-def: (: Recipient (-> Event Entity Proposition))
gloss: Goal of a transfer (indirect object / 'to'); the addressee of a communication. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Source
kind: role
arity: 2
type-def: (: Source (-> Event Entity Proposition))
gloss: Origin / 'from …' oblique. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Stimulus
kind: role
arity: 2
type-def: (: Stimulus (-> Event Entity Proposition))  ; and 2 more (per arity / per union alternative)
gloss: Object of a psych/perception state. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event. A sealed clause as the stimulus describes an action the experiencer likes, enjoys or fears doing (likes to send quilts).


head: Theme
kind: role
arity: 2
type-def: (: Theme (-> Event Entity Proposition))  ; and 2 more (per arity / per union alternative)
gloss: Object acquired, transferred, moved, possessed, perceived or evaluated unchanged. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event. Filler: an entity, an actual eventuality (aspectual / continuation complements: "stopped knitting", "kept falling"), or a sealed proposition (attitude / control complements).


head: Time
kind: role
arity: 2
type-def: (: Time (-> Event TimeTerm Proposition))
gloss: Locates an eventuality at a time point or recurrence slot. Filler = a time instance (deictic constants such as yesterday / now are declared Time by the emitter). A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


## scope (20)

head: AccordingTo
kind: scope
arity: 2
type-def: (: AccordingTo (-> Proposition Instance Proposition))
gloss: Evidential attribution: seals P and names its source ("according to X, P").


head: Appear
kind: scope
arity: 1
type-def: (: Appear (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by an inference from the evidence at hand ('appears'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Appear P).


head: Can
kind: scope
arity: 1
type-def: (: Can (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: A specific subject's capability on this event. Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Counterfactual
kind: scope
arity: 2
type-def: (: Counterfactual (-> Proposition Proposition Proposition))
gloss: Sealed subjunctive conditional: antecedent and consequent, neither asserted.


head: Directive
kind: scope
arity: 1
type-def: (: Directive (-> Proposition Proposition))
gloss: Seals a positive imperative's commanded eventuality.


head: Feel
kind: scope
arity: 1
type-def: (: Feel (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by touch ('feels cold'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Feel P).


head: Forbid
kind: scope
arity: 1
type-def: (: Forbid (-> Proposition Proposition))
gloss: Seals a negative imperative's forbidden eventuality. RETIRE: under explicit scope a negative imperative is (Directive (Not P)), parallel to (Obligated (Not P)); declaration kept only until the re-parse.
status: retire


head: Look
kind: scope
arity: 1
type-def: (: Look (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by sight ('looks tired'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Look P).


head: Might
kind: scope
arity: 1
type-def: (: Might (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Epistemic possibility ('might / may'). Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Must
kind: scope
arity: 1
type-def: (: Must (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Epistemic necessity ('must'-inference). Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Not
kind: scope
arity: 1
type-def: (: Not (-> Proposition Proposition))
gloss: Explicit negation over a proposition. The top-level form lowers natively (the engine canonicalizes (Not X) to X at strength 1-s); nested forms (under a modal, a particle or a seal) are the lowering's work.
status: proposed


head: Obligated
kind: scope
arity: 1
type-def: (: Obligated (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Deontic obligation over the sealed clause: (Obligated P), the norm template's obligation (must, has to, is required to; a weak should at strength 0.7); an exemption (need not, does not have to) is (Not (Obligated P)); on a class the generic's rule concludes it. The tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Permitted
kind: scope
arity: 1
type-def: (: Permitted (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Deontic permission over the sealed clause: (Permitted P), the norm template's permission (may, can, is allowed to); a prohibition (must not, may not, cannot, forbidden) is (Not (Permitted P)), the denial of permission; on a class the generic's rule concludes it. The tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Question
kind: scope
arity: 2
type-def: (: Question (-> Atom Proposition Proposition))
gloss: Seals an embedded constituent (wh-) question with its wh-word. The wh-word is a bare symbol that doubles as the gap filler inside the body, so its position is unchecked.


head: Seem
kind: scope
arity: 1
type-def: (: Seem (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by an inference from the evidence at hand ('seems'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Seem P).


head: Smell
kind: scope
arity: 1
type-def: (: Smell (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by smell ('smells fresh'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Smell P).


head: Sound
kind: scope
arity: 1
type-def: (: Sound (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by hearing ('sounded distorted'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Sound P).


head: Taste
kind: scope
arity: 1
type-def: (: Taste (-> Proposition Proposition))
gloss: Evidential operator over a sealed claim: how things appear by taste ('tastes salty'); the claim is not asserted. The evidential template's head, the verb kept as the head because the sense is the evidence; carries the sealed claim's own truth value. Order: (Taste P).


head: Whether
kind: scope
arity: 1
type-def: (: Whether (-> Proposition Proposition))
gloss: Seals an embedded polar question under the matrix verb's Theme.


head: Would
kind: scope
arity: 1
type-def: (: Would (-> Proposition Proposition))
gloss: The conditional mood with its condition unstated ('would', 'would have'): (Would P) — P holds under circumstances the text does not state; nothing under it is asserted. A stated condition makes a Counterfactual; a would seen from a past moment is the Prospective aspect, a past habit Habitual, a wish want / prefer.


## particle (8)

head: Again
kind: particle
arity: 1
type-def: (: Again (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Repetitive/restitutive presupposition: a prior same-type event happened.


head: Already
kind: particle
arity: 1
type-def: (: Already (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: The eventuality happened earlier than expected.


head: Also
kind: particle
arity: 2
type-def: (: Also (-> Instance Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Additive focus particle ('also / too / as well'). Filler as for Only; also the carrier of either / neither; the additive presupposition is recorded, never asserted.


head: Cleft
kind: particle
arity: 2
type-def: (: Cleft (-> Instance Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: It-cleft / pseudo-cleft focus marker. Filler = the clefted phrase; the backgrounded clause is the asserted prejacent.


head: Even
kind: particle
arity: 2
type-def: (: Even (-> Instance Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Scalar focus particle ('even'). Filler as for Only; the scalar presupposition is recorded, never asserted.


head: Only
kind: particle
arity: 2
type-def: (: Only (-> Instance Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Exclusive focus particle ('only / just / solely'). Filler = the focused constituent: an instance (subject / object focus) or a class lemma (VP / predicate focus); the prejacent is asserted normally; no exclusion rule is emitted (closure-gated).


head: Pending
kind: particle
arity: 1
type-def: (: Pending (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: NPI 'yet' particle: expected but not yet (under negation or a question); the expectation is recorded, never asserted — its own positive atom outside any denial. Renamed from the arity-1 sense of Yet to free Yet for the adversative connective.
status: proposed


head: Still
kind: particle
arity: 1
type-def: (: Still (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Continuative: the eventuality still holds (positive counterpart of cessation).


## temporal (27)

head: Before
kind: temporal
arity: 2
type-def: (: Before (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Canonical ordering: the first eventuality precedes the second, an eventuality or a time instance (the catalog renders after as Before with the arguments swapped).


head: BeforeBy
kind: temporal
arity: 4
type-def: (: BeforeBy (-> Event Event Number Class Proposition))  ; and 3 more (per arity / per union alternative)
gloss: Measured temporal gap: the first eventuality or time instance precedes the second (an eventuality, or a time instance such as the text's reference time now) by n units; 0 units = the same period (today = 0 day before now).


head: Century
kind: temporal
arity: 2
type-def: (: Century (-> TimeTerm Number Proposition))
gloss: The century of a time instance, by its number: (Century t 18) for the 18th century, a BCE century negative.


head: Day
kind: temporal
arity: 2
type-def: (: Day (-> TimeTerm Number Proposition))
legacy: (: Day (-> Number TimeTerm))  ; kept until the re-parse
gloss: Day-of-month of a time instance: (Day t 6). Legacy constructor form (Day 6) kept until the re-parse.


head: Decade
kind: temporal
arity: 2
type-def: (: Decade (-> TimeTerm Number Proposition))
gloss: The decade of a time instance, by its first year: (Decade t 1880) for the 1880s.


head: Duration
kind: temporal
arity: 2
type-def: (: Duration (-> Event String Proposition))
gloss: Licensed duration-adverb slot: the surface adverb lemma on an eventuality. A surface-record-like slot (vague extent); the measured form is (Measure e duration n unit).


head: During
kind: temporal
arity: 2
type-def: (: During (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: The inner eventuality is nested inside the outer one, an eventuality or a time period (during the meeting, while Yusra sang, until dawn is End).


head: End
kind: temporal
arity: 2
type-def: (: End (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Interval end point of an eventuality: (End e r), r a time instance or the eventuality it stops with (until Yusra arrived).


head: Every
kind: temporal
arity: 3
type-def: (: Every (-> Event Number Class Proposition))
gloss: Periodic recurrence: the eventuality recurs every n units ((Every e 1 day) for every day / daily / every morning, (Every e 2 week) for every two weeks); the slot of a schedule (morning, a weekday) is a Time on the same eventuality.


head: Future
kind: temporal
arity: 1
type-def: (: Future (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Future tense on an eventuality.


head: Habitual
kind: temporal
arity: 1
type-def: (: Habitual (-> Event Proposition))
gloss: Marks an eventuality as a habit: the sum of its occurrences, a characterizing state, rather than one occurrence — (Habitual sk_swim_1) for a bare habitual present (Yusra swims) and, with (Past e), for the habitual past (used to). A top-level Event is an asserted eventuality: an occurrence or, when marked, a habit; a stated frequency builds a rule over occasions instead and marks nothing.


head: Hour
kind: temporal
arity: 2
type-def: (: Hour (-> TimeTerm Number Proposition))  ; and 1 more (per arity / per union alternative)
legacy: (: Hour (-> Number TimeTerm)) · (: Hour (-> Distribution TimeTerm))  ; kept until the re-parse
gloss: Clock hour (24-hour) of a time instance: (Hour t 15); an approximate hour may be a distribution. Legacy constructor form (Hour 15) kept until the re-parse.


head: Minute
kind: temporal
arity: 2
type-def: (: Minute (-> TimeTerm Number Proposition))
legacy: (: Minute (-> Number TimeTerm))  ; kept until the re-parse
gloss: Clock minute of a time instance: (Minute t 30). Legacy constructor form kept until the re-parse.


head: Month
kind: temporal
arity: 2
type-def: (: Month (-> TimeTerm Class Proposition))
legacy: (: Month (-> Class TimeTerm))  ; kept until the re-parse
gloss: Calendar month of a time instance, the month name as a class of time periods: (Month t july). Legacy constructor form (Month july) kept until the re-parse.


head: Ongoing
kind: temporal
arity: 1
type-def: (: Ongoing (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Progressive / continuative aspect.


head: Past
kind: temporal
arity: 1
type-def: (: Past (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Past tense on an eventuality.


head: Prospective
kind: temporal
arity: 1
type-def: (: Prospective (-> Event Proposition))
gloss: Prospective aspect: the eventuality is upcoming at the clause's reference time (be about to V, be due to V, be to V; would V and was going to V seen from a past moment, with the past tense; the word is the record's aspect value). As Ongoing says underway, Prospective says ahead; whether it came about is not stated.


head: Quarter
kind: temporal
arity: 2
type-def: (: Quarter (-> TimeTerm Number Proposition))
legacy: (: Quarter (-> Number Number TimeTerm))  ; kept until the re-parse
gloss: Calendar / fiscal quarter of a time instance: (Quarter t 3) beside (Year t 2003). Legacy constructor form (Quarter 3 2003) kept until the re-parse.


head: Start
kind: temporal
arity: 2
type-def: (: Start (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Interval start point of an eventuality: (Start e r), r a time instance described by Day / Hour / Year … atoms, or the eventuality it starts with (since the audit).


head: TimeAtLeast
kind: temporal
arity: 2
type-def: (: TimeAtLeast (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Lower-bounded (earliest) time of an eventuality, inclusive: (TimeAtLeast e r), r a time instance or an eventuality (no earlier than Monday).


head: TimeAtMost
kind: temporal
arity: 2
type-def: (: TimeAtMost (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Upper-bounded (latest) time of an eventuality, inclusive: (TimeAtMost e r), r a time instance or an eventuality (by Monday, by the audit).


head: Times
kind: temporal
arity: 2
type-def: (: Times (-> Event Number Proposition))
gloss: Count of occurrences of a plural episode: (Times e 2) for two particular knocks, and on an occasion's episode inside a rate rule, (Times (sk_visit $w) 2) for twice a week. A numeric period is Every.


head: TimesPer
kind: temporal
arity: 3
type-def: (: TimesPer (-> Event Number Class Proposition))
gloss: Rate recurrence: the eventuality recurs n times per unit. RETIRE: the catalog renders a rate as the rule over the unit with the count on each occasion's episode — (Implication (Member $w week) (And … (Times (sk_visit $w) 2))) — so no top-level habit carries a rate tag; declaration kept for the 6 legacy atoms until the re-parse.
status: retire


head: Week
kind: temporal
arity: 2
type-def: (: Week (-> TimeTerm Number Proposition))
gloss: A numbered week of a season or a schedule, a field of a time instance: (Week t 16) — week 16 of the season the text dates, if any.


head: Weekday
kind: temporal
arity: 2
type-def: (: Weekday (-> TimeTerm Class Proposition))
legacy: (: Weekday (-> Class TimeTerm))  ; kept until the re-parse
gloss: Weekday of a time instance, the weekday name as a class: (Weekday t tuesday). Legacy constructor form kept until the re-parse.


head: WithinLast
kind: temporal
arity: 3
type-def: (: WithinLast (-> Event Number Class Proposition))
gloss: Backward window: the eventuality falls within the last n units. RETIRE: the catalog composes it from a time instance at the offset and a bound — (BeforeBy t now n unit) (TimeAtLeast e t) — and the forward window (within n units) the same way with TimeAtMost; no stored parse uses it; declaration kept only until the re-parse.
status: retire


head: Year
kind: temporal
arity: 2
type-def: (: Year (-> TimeTerm Number Proposition))
legacy: (: Year (-> Number TimeTerm))  ; kept until the re-parse
gloss: Calendar year of a time instance: (Year t 2026). Legacy constructor form (Year 2026) kept until the re-parse.


## relation (17)

head: Between
kind: relation
arity: 2 | 3
type-def: (: Between (-> Instance Instance Proposition))  ; and 11 more (per arity / per union alternative)
gloss: The preposition between, as written: (Between x a b) — x between a and b, the place, the parties or the two ends, the reading the consumer's; the order of a and b carries nothing (the symmetry rule between_sym). With one object, a group (between the pillows), the two-place form of every preposition head.


head: ClassProperty
kind: relation
arity: 2
type-def: (: ClassProperty (-> Class Class Proposition))
gloss: Non-distributing property of a class/population as a whole. Order: (ClassProperty class property). Opaque: distributes to no member. Also the kind word of a kind-of phrase (the class-statement template): the lurcher is a breed of dog, (ClassProperty lurcher breed) beside (Inheritance lurcher dog) — the lurcher as a whole is a breed, no lurcher is. Emitted by the class-property template; the frozen prompt line writes it as KindProperty.


head: ConditionalProperty
kind: relation
arity: 3
type-def: (: ConditionalProperty (-> Class Class Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: A class-level property restricted to a place, a time or a circumstance: the class as found there has the property (otters are rare in Norfolk; cranes are rare in winter). Order: (ConditionalProperty class property restriction); the restriction is an entity (a place, a thing) or a class (a time, a circumstance). Opaque like KindProperty: distributes to no member. A member-level property under a condition is a parser-emitted rule instead, never this atom.


head: Entails
kind: relation
arity: 1
type-def: (: Entails (-> Event Proposition))
gloss: The event's sealed Theme holds: the parser's record that the matrix verb is implicative (manage, make, let, begin, remember to …). A background rule derives the Theme's content at the event's tense; nothing in the parse asserts it. Order: (Entails matrix-event).


head: GroupOf
kind: relation
arity: 2
type-def: (: GroupOf (-> Entity Class Proposition))
gloss: The members of this group individual are of that class.


head: KindProperty
kind: relation
arity: 2
type-def: (: KindProperty (-> Class Class Proposition))
gloss: The legacy name of ClassProperty (the frozen prompt line and its corpora write it); kept until the re-parse so those parses still type-check. Order: (KindProperty class property).
status: retire


head: LocatedIn
kind: relation
arity: 2
type-def: (: LocatedIn (-> Entity Entity Proposition))
gloss: Static location of an entity ('X is in Y') — as against the event oblique Location. Order: (LocatedIn entity place); the location of an EVENT is the role Location.


head: MadeOf
kind: relation
arity: 2
type-def: (: MadeOf (-> Entity Class Proposition))
gloss: What a thing is made of: (MadeOf whole material), the material a class of stuff (wool, glass, oxygen). The part-whole template's constitution atom, beside (PartOf part whole) for parts, members and constituents that are individuals.


head: PartOf
kind: relation
arity: 2
type-def: (: PartOf (-> Instance Instance Proposition))
gloss: Part / component, member or constituent of a whole: the part-whole template's atom for every wording (is part of, has, contains, includes, consists of, a member of, the lid of the box). Order: (PartOf part whole); both are instances (a material is MadeOf); eventualities may have parts; the distribution template's premise over a group's members.


head: Possession
kind: relation
arity: 2
type-def: (: Possession (-> Entity Entity Proposition))
gloss: Possessed-to-possessor link (ownership, kinship, loose association). Order: (Possession possessed possessor). The possessive construction (NP-internal); the verb "own / have" is an event with Holder and Theme, and their relation is a background rule, never a parser collapse.


head: Precludes
kind: relation
arity: 1
type-def: (: Precludes (-> Event Proposition))
gloss: The event's sealed Theme does not hold: the parser's record that the matrix verb is negatively implicative (fail, forget to, prevent, keep from). A background rule derives the Theme's negation at the event's tense. Order: (Precludes matrix-event).


head: ProportionOf
kind: relation
arity: 3
type-def: (: ProportionOf (-> Entity Entity Level Proposition))
gloss: The portion's proportion of a definite whole. Order: (ProportionOf portion whole level); the level is a symbol from a closed label set (most, half, …), declared String-typed by the emitter. The level is a Level label (most, half) or a (Fraction n d) term.


head: PurposeOf
kind: relation
arity: 2
type-def: (: PurposeOf (-> Event Event Proposition))
gloss: Canonical ask-relation: purpose/goal of a focus event. Order: (PurposeOf goal-eventuality focus-event). Observation when the text states it; derived by a seeded bridge from InOrderTo / To otherwise — the origin field tells which.


head: ReasonFor
kind: relation
arity: 2
type-def: (: ReasonFor (-> Event Event Proposition))
gloss: Canonical ask-relation: reason for a focus event. Order: (ReasonFor reason-eventuality focus-event). Observation when the text states it; derived by a seeded bridge from Because / Since otherwise — the origin field tells which.


head: RestOf
kind: relation
arity: 2
type-def: (: RestOf (-> Entity Entity Proposition))
gloss: Flags a portion as the remainder of a definite whole. Order: (RestOf remainder whole).


head: Result
kind: relation
arity: 2
type-def: (: Result (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Links a change event to its result. Order: (Result event result). The result is the outcome proposition as a sealed term in the catalog form ((Result sk_become_1 (Member teodor locksmith))); that the outcome holds afterwards is a background rule (the catalog's seeded rules), not a flat emission; the legacy form linked a reified result-state eventuality.


head: SubsetOf
kind: relation
arity: 2
type-def: (: SubsetOf (-> Entity Entity Proposition))
gloss: A quantified subset group of a definite superset group. Order: (SubsetOf subset-group superset-group); both are group individuals.


## measure (20)

head: AmongMost
kind: measure
arity: 3
type-def: (: AmongMost (-> Class Instance Class Proposition))
gloss: Top-stratum membership: one of the ADJ-est members of a class. Order: (AmongMost scale X class).


head: Cardinality
kind: measure
arity: 2
type-def: (: Cardinality (-> Entity Number Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Exact size of a group (a point value, native integer). Order: (… group n); an approximate size may be a distribution.


head: CardinalityAtLeast
kind: measure
arity: 2
type-def: (: CardinalityAtLeast (-> Entity Number Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Lower bound on a group's size. Order: (… group n); an approximate size may be a distribution.


head: CardinalityAtMost
kind: measure
arity: 2
type-def: (: CardinalityAtMost (-> Entity Number Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Upper bound on a group's size. Order: (… group n); an approximate size may be a distribution.


head: Degree
kind: measure
arity: 3
type-def: (: Degree (-> Instance Class Level Proposition))
gloss: Intensity level of a property on an entity. Order: (Degree entity scale level); the level is the degree word as written, declared Level (very, slightly, too, enough, almost), or (forClass class) for a comparison class. Whether the property's positive atom is asserted beside it is the parse's decision: an intensifier, a downtoner, too and enough keep it; almost, nearly, all_but and forClass do not.


head: Extent
kind: measure
arity: 2
type-def: (: Extent (-> Event Level Proposition))
gloss: How much an eventuality holds: a degree adverb on a verb, kept as written and declared Level (deeply, really, barely, sharply, a_lot). Order: (Extent event level). The event stays asserted; an approximator on a verb (almost fell) is not an Extent.


head: Fraction
kind: measure
arity: 2
type-def: (: Fraction (-> Number Number Level))
gloss: Exact fraction / percentage term, numerator over denominator. A value term, not a statement: stands in the level slot of ProportionOf ("two-thirds of", "37% of" as (Fraction 37 100), never reduced).


head: Measure
kind: measure
arity: 4
type-def: (: Measure (-> Instance Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Puts a magnitude and unit on an entity's dimension. Order: (… entity-or-event dimension magnitude unit); an approximate magnitude may be a distribution.


head: MeasureAtLeast
kind: measure
arity: 4
type-def: (: MeasureAtLeast (-> Instance Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Lower-bounded measure. Order: (… entity-or-event dimension magnitude unit); an approximate magnitude may be a distribution.


head: MeasureAtMost
kind: measure
arity: 4
type-def: (: MeasureAtMost (-> Instance Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Upper-bounded measure. Order: (… entity-or-event dimension magnitude unit); an approximate magnitude may be a distribution.


head: MeasureBy
kind: measure
arity: 4
type-def: (: MeasureBy (-> Event Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Delta of a scalar-change eventuality: how much the dimension changed. Order: (… event dimension magnitude unit).


head: MeasureFrom
kind: measure
arity: 4
type-def: (: MeasureFrom (-> Event Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Start value of a scalar change ("from X"). Order: (… event dimension magnitude unit).


head: MeasureTo
kind: measure
arity: 4
type-def: (: MeasureTo (-> Event Class Number Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: End value of a scalar change ("to Y", "rose to 6.1%"). Order: (… event dimension magnitude unit).


head: More
kind: measure
arity: 3
type-def: (: More (-> Class Instance Instance Proposition))  ; and 3 more (per arity / per union alternative)
gloss: X exceeds Y on a scale (reified comparative ordering). Order: (More scale X Y) = X exceeds Y. X and Y are instances, or classes in a class-level comparison ((More hard basalt chalk)).


head: MoreBy
kind: measure
arity: 5
type-def: (: MoreBy (-> Class Instance Instance Number Class Proposition))  ; and 7 more (per arity / per union alternative)
gloss: Comparative with a measured gap: X exceeds Y by n units. Order: (MoreBy scale X Y magnitude unit). X and Y are instances, or classes in a class-level comparison ((More hard basalt chalk)).


head: Most
kind: measure
arity: 3
type-def: (: Most (-> Class Instance Class Proposition))
gloss: Superlative: X is the most ADJ member of a class. Order: (Most scale X class).


head: Ordinal
kind: measure
arity: 4
type-def: (: Ordinal (-> Instance Number Class Class Proposition))  ; and 1 more (per arity / per union alternative)
gloss: The entity's rank on an ordering within a class: (Ordinal entity rank ordering class), the rank a number or the symbol last; the ordering an adjective's scale (the third tallest weaver → tall, weaver), a verb lemma (the first to respond → respond, respond: those who did) or the counted class itself (the third ferret → ferret, ferret); the class may be a comparison class (Narrow …). The rule rank_orders compares two ranks on one scale in one class.


head: SameDegree
kind: measure
arity: 3
type-def: (: SameDegree (-> Class Instance Instance Proposition))  ; and 3 more (per arity / per union alternative)
gloss: Equative: X is as ADJ as Y. Order: (SameDegree scale X Y). X and Y are instances, or classes in a class-level comparison ((More hard basalt chalk)).


head: TimesAs
kind: measure
arity: 4
type-def: (: TimesAs (-> Class Instance Instance Number Proposition))  ; and 3 more (per arity / per union alternative)
gloss: Multiplicative comparative: X is <factor> times as ADJ as Y. Order: (TimesAs scale X Y factor). X and Y are instances, or classes in a class-level comparison ((More hard basalt chalk)).


head: forClass
kind: measure
arity: 1
type-def: (: forClass (-> Class Level))
gloss: Comparison-class marker: ADJ relative to the norm for a class. A value term, not a statement: stands in the level slot of Degree.


## lexicon (8)

head: DimensionScale
kind: lexicon
arity: 2
type-def: (: DimensionScale (-> Class Class Proposition))
gloss: A dimension noun's positive adjective scale (weight heavy, age old, cost expensive). Order: (DimensionScale noun adjective). Background fact (the rules file's lexicon), never parser output; the rules carry an ordering derived on the noun onto the adjective's scale.


head: MonthIndex
kind: lexicon
arity: 2
type-def: (: MonthIndex (-> Class Number Proposition))
gloss: The place of a month in the year, a lexicon fact the rules use to order dates: (MonthIndex july 7).


head: MonthNumber
kind: lexicon
arity: 2
type-def: (: MonthNumber (-> Class Number Proposition))
gloss: Seeded lexicon fact giving a month name its ordinal number. Background fact (seeded), never parser output; month names are classes of time periods.


head: ScaleOpposite
kind: lexicon
arity: 2
type-def: (: ScaleOpposite (-> Class Class Proposition))
gloss: Links the two poles of one gradable dimension. Background fact (seeded), never parser output.


head: Symmetric
kind: lexicon
arity: 1
type-def: (: Symmetric (-> Atom Proposition))
gloss: The legacy line's tag on an open-class relation head (Friend) read by its seeded sym_rel; never catalog output. The catalog represents a symmetric relation as ONE state with TWO bearers — (Experiencer s x) (Experiencer s y) — chosen by the stative-relation template's lexicon, so nothing is tagged or derived. Declaration kept only until the re-parse.


head: Transparent
kind: lexicon
arity: 1
type-def: (: Transparent (-> Class Proposition))
gloss: A property whose felt or complemented state entails the bare property of its bearer (tired, afraid: feeling tired is being tired; afraid of the ferret is afraid), unlike guilty, fond or good. Background fact (the rules file's lexicon), never parser output; the rule felt_state_holds reads it.


head: UnitFactor
kind: lexicon
arity: 3
type-def: (: UnitFactor (-> Class Class Number Proposition))
gloss: A unit's factor to a canonical unit: a magnitude in the first unit times the factor is the magnitude in the second (centimetre metre 0.01; a spelling variant is a factor of 1). Order: (UnitFactor unit canonical factor). Background fact (the rules file's lexicon), never parser output; the rules derive every measure and gap in the canonical unit.


head: WeekdayNumber
kind: lexicon
arity: 2
type-def: (: WeekdayNumber (-> Class Number Proposition))
gloss: Seeded lexicon fact giving a weekday name its number (monday=1). Background fact (seeded), never parser output.


## discourse (21)

head: Although
kind: discourse
arity: 2
type-def: (: Although (-> Event Event Proposition))
gloss: Concessive connective 'although'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: AsAResult
kind: discourse
arity: 2
type-def: (: AsAResult (-> Event Event Proposition))
gloss: Causal connective 'as a result'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: Because
kind: discourse
arity: 2
type-def: (: Because (-> Event Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Causal connective 'because'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized. The second argument is an eventuality in a link between clauses, or the thing named as the cause when a rule reads a causal preposition (because of, due to, owing to, thanks to, on account of) as Because.


head: BecauseOf
kind: discourse
arity: 2
type-def: (: BecauseOf (-> Event Instance Proposition))
gloss: A cause stated by the preposition 'because of' on the event: (BecauseOf e x) — e because of x; the words are the head, a background rule reads it as Because.


head: But
kind: discourse
arity: 2
type-def: (: But (-> Event Event Proposition))
gloss: Adversative connective 'but'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: Consequently
kind: discourse
arity: 2
type-def: (: Consequently (-> Event Event Proposition))
gloss: Causal connective 'consequently'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: Despite
kind: discourse
arity: 2
type-def: (: Despite (-> Event Event Proposition))
gloss: Concessive connective 'despite'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: DueTo
kind: discourse
arity: 2
type-def: (: DueTo (-> Event Instance Proposition))
gloss: A cause stated by the preposition 'due to' on the event: (DueTo e x) — e due to x; the words are the head, a background rule reads it as Because (the schedule reading 'is due to V' is the Prospective aspect, not this).


head: EvenThough
kind: discourse
arity: 2
type-def: (: EvenThough (-> Event Event Proposition))
gloss: Concessive connective 'even though'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: InOrderTo
kind: discourse
arity: 2
type-def: (: InOrderTo (-> Event Proposition Proposition))
gloss: Purpose connective 'in order to'. Order: (InOrderTo action-event aim); the aim is the purpose clause SEALED as one term (an aim is not an occurrence: nothing of it is asserted on its own), its actor the action's subject.


head: InSpiteOf
kind: discourse
arity: 2
type-def: (: InSpiteOf (-> Event Instance Proposition))
gloss: A concession stated by the preposition 'in spite of' on the event: (InSpiteOf e x), beside Despite; no rule relates the two.


head: OnAccountOf
kind: discourse
arity: 2
type-def: (: OnAccountOf (-> Event Instance Proposition))
gloss: A cause stated by the preposition 'on account of' on the event: (OnAccountOf e x); a background rule reads it as Because.


head: OwingTo
kind: discourse
arity: 2
type-def: (: OwingTo (-> Event Instance Proposition))
gloss: A cause stated by the preposition 'owing to' on the event: (OwingTo e x); a background rule reads it as Because.


head: Since
kind: discourse
arity: 2
type-def: (: Since (-> Event Event Proposition))
gloss: Causal connective 'since'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: So
kind: discourse
arity: 2
type-def: (: So (-> Event Event Proposition))
gloss: Causal connective 'so'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: SoAsTo
kind: discourse
arity: 2
type-def: (: SoAsTo (-> Event Proposition Proposition))
gloss: Purpose connective 'so as to'. Order: (SoAsTo action-event aim); the aim is the purpose clause SEALED as one term (an aim is not an occurrence: nothing of it is asserted on its own), its actor the action's subject.


head: ThanksTo
kind: discourse
arity: 2
type-def: (: ThanksTo (-> Event Instance Proposition))
gloss: A cause stated by the preposition 'thanks to' on the event: (ThanksTo e x), the cause often an individual; a background rule reads it as Because.


head: Therefore
kind: discourse
arity: 2
type-def: (: Therefore (-> Event Event Proposition))
gloss: Causal connective 'therefore'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: Thus
kind: discourse
arity: 2
type-def: (: Thus (-> Event Event Proposition))
gloss: Causal connective 'thus'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


head: To
kind: discourse
arity: 2
type-def: (: To (-> Event Proposition Proposition))
gloss: Purpose connective 'to'. Order: (To action-event aim); the aim is the purpose clause SEALED as one term (an aim is not an occurrence: nothing of it is asserted on its own), its actor the action's subject.


head: Yet
kind: discourse
arity: 2
type-def: (: Yet (-> Event Event Proposition))
legacy: (: Yet (-> Event Proposition)) · (: Yet (-> Proposition Proposition))  ; kept until the re-parse
gloss: Adversative inter-clause connective 'X, yet Y' (main, sub), like But. The unary particle sense is now Pending; its legacy declarations are kept until the re-parse. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


## property-constructor (3)

head: can
kind: property-constructor
arity: 1
type-def: (: can (-> Class Class))
gloss: Builds the reified capability property term from a verb lemma; a class-valued term kept nested: (Inheritance bird (can fly)), (Inheritance swimmer (can swim)); on an individual, (Member x (can fly)) is the inherited form.


head: obligated
kind: property-constructor
arity: 1
type-def: (: obligated (-> Class Class))
gloss: Builds the reified obligation property term from an action (possibly a compound verb_object symbol); a class-valued term kept nested: (Inheritance member (obligated pay)); weak "should" at strength 0.7.


head: permitted
kind: property-constructor
arity: 1
type-def: (: permitted (-> Class Class))
gloss: Builds the reified permission property term from an action; a class-valued term kept nested: (Inheritance visitor (permitted enter)); a class-level prohibition is the same term at strength 0.0.


## surface-record (5)

head: CardinalityPhrase
kind: surface-record
arity: 2
type-def: (: CardinalityPhrase (-> Entity String Proposition))
gloss: Records a vague count phrase on a group ('several', 'dozens'). Surface record: a literal string; excluded from the faithful mining view.


head: LikelihoodPhrase
kind: surface-record
arity: 2
type-def: (: LikelihoodPhrase (-> Event String Proposition))
gloss: Surface record of a likelihood adverb ("probably", "likely", "definitely", "certainly") on the eventuality whose clause carries the corresponding STV strength band — traceability and reversibility of the word-to-strength mapping. Excluded from the faithful mining view like the other surface records.
status: proposed


head: Name
kind: surface-record
arity: 2
type-def: (: Name (-> Instance String Proposition))
gloss: Records a named individual's surface name string. Surface record: a literal string; excluded from the faithful mining view.


head: QuantifierPhrase
kind: surface-record
arity: 3
type-def: (: QuantifierPhrase (-> Class Class String Proposition))
gloss: Records the surface quantifier word beside the strength it set. Surface record: a literal string; excluded from the faithful mining view. RETIRE: the catalog no longer emits it — the word stays in the instance record (range.quantifier, class-statement.quantifier, frequency.word / level), reachable from any statement through its instance link, so it is provenance beside the knowledge base, not an atom in it; its original job (telling an explicit word from a bare generic at the same strength) is done by the confidence; declaration kept for the legacy records until the re-parse.
status: retire


head: QuantityPhrase
kind: surface-record
arity: 2
type-def: (: QuantityPhrase (-> Entity String Proposition))
gloss: Records a vague amount phrase on a mass witness ('a lot', 'plenty', 'a little'). Surface record: a literal string; excluded from the faithful mining view.


## meta (1)

head: Interpretation
kind: meta
arity: 2
type-def: (: Interpretation (-> String Statement Proposition))
legacy: (: Interpretation (-> String Atom Proposition))  ; kept until the re-parse
gloss: Transport wrapper marking a statement as belonging to one reading of a multi-reading parse: (Interpretation rN (: name expr stv)). The legacy canonicalizer dissolves it (split-before-canonicalize); the chainer accepts it as a reading-scoped assertion and answers per reading or as a marginal with the confidence discounted by the reading share. Typed form: (Interpretation reading-tag statement-id); the legacy inline form wraps the whole statement and is unchecked. Under the flat scope view a reading is a Context and this becomes (Reading c) + (InContext f c).


## computation (4)

head: Compute
kind: computation
arity: 4
type-def: (: Compute (-> Atom Atom Atom Atom Proposition))
lowering: PeTTaChainer  ; engine form produced by the lowering, not by a template
gloss: Hard-numeric arithmetic/comparison test on bound integers. Engine form inside rules and queries (Compute op (args) -> result); positions unchecked. Lowering target: templates emit the generic comparison; the lowering produces this form.


head: FoldAll
kind: computation
arity: 6
type-def: (: FoldAll (-> Atom Atom Atom Atom Atom Atom Proposition))
lowering: PeTTaChainer  ; engine form produced by the lowering, not by a template
gloss: Aggregate fold across all pattern matches (e.g. sum of cardinalities). Engine aggregate form; positions unchecked. Lowering target: templates emit the generic aggregate (count / sum over a pattern); the lowering produces this form.


head: GreaterThan
kind: computation
arity: 2
type-def: (: GreaterThan (-> Number Number Proposition))  ; and 3 more (per arity / per union alternative)
gloss: Graded P(value > N) over a distribution magnitude. Generic meaning (a comparison, graded over a distribution); engine-named.


head: ParticleFromNormal
kind: computation
arity: 2
type-def: (: ParticleFromNormal (-> Number Number Distribution))
gloss: Approximate magnitude as a normal distribution: mean and sigma. Generic meaning (an approximate magnitude, "about 200 kg"); engine-named; other engines get it by lowering.


## state (1)

head: Holds
kind: state
arity: 2
type-def: (: Holds (-> Event Proposition Proposition))
gloss: The state of a flat predication holding: (Holds state P) names the eventuality that P (a copular or locative atom, asserted on its own beside it) holds, so that a time, a place, a duration, a relation, a link or a focus can hang on the state. Minted by the emitter only when something attaches to the predication; the state carries the clause's tense as an event does. Order: (Holds state proposition); the proposition is untensed and is not asserted by this atom.


## open-class heads (not enumerable)

Heads the prompt licenses generically; the validator checks position and arity only. Licensed positions:

- head of a class-level relation atom, e.g. (Carry mosquito malaria)
- head of a symmetric relation atom accompanied by (Symmetric <head>)
- head of a nominalization class-relation, e.g. (Build dam_builder dam)
- skolem-function head (sk_<verb>) in a scope construction, e.g. (sk_y $x)

Oblique prepositions (68), all declared `(-> Instance|Class Instance|Class|Proposition Proposition)`: About, Above, Across, After, Against, Along, Among, Around, As, At, BecauseOf, Before, Behind, Below, Beneath, Beside, Besides, Between, Beyond, But, By, Concerning, Despite, Down, DueTo, During, Except, For, From, In, InSpiteOf, Inside, Into, Like, Near, Of, Off, On, OnAccountOf, Onto, Opposite, Out, Outside, Over, OwingTo, Past, Per, Regarding, Round, Since, Than, ThanksTo, Through, Throughout, Till, To, Toward, Towards, Under, Underneath, Unlike, Until, Up, Upon, Via, With, Within, Without.

## notes

- Proposed, not yet emitted by any template: Coref, Equivalence, InContext, LikelihoodPhrase, Not, Pending, Similarity.
- To retire at the re-parse (declaration kept until then so today's parses still type-check): Forbid, KindProperty, QuantifierPhrase, TimesPer, WithinLast.
