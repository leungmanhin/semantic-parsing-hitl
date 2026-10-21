# Atom-type substrates

Generated from `templates/atom-type-substrates.json` (schema `atom-type-substrates/1`) by `templates/tmpl/gen_substrate.py`, together with `templates/generated/atom-types.metta`. Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`.

133 heads in 13 kinds (7 proposed; 133 with a reviewed type declaration so far). `type-def` is the PeTTa declaration emitted for the head; `?` as the output type means the head is not yet reviewed and is absent from the `.metta` file; `%Undefined%` marks a position the head takes but the JSON does not type.

Every atom is carried as a statement (: <proof-name> <atom> <tv>), tv = (STV strength confidence) or another engine truth value. The carrier is not an atom kind: ':' is never type-declared (it is also PeTTa's type-declaration head) and the truth value is declared by the engine, not by this substrate.

Types: Atom, Class, Context, Distribution, Entity, Event, Instance, Level, Number, Proposition, Statement, String, TimeTerm.

Declared type list (PeTTa convention, capitalized): Atom = unchecked position; Proposition = a statement-forming expression; Instance with sub-types Entity and Event (a symbol carries both its sub-type and Instance); Class; Number; String. Migration mapping from the ad-hoc names: term, assertion -> Proposition; property, verb-lemma, unit -> Class; symbol, reading-tag -> String; var, uncertain -> Atom. A union such as Event|Proposition expands to one declaration per alternative. `out` = the output type of the head's type declaration, set as each kind is reviewed. Proposed types Statement (a statement id = the proof name, reified) and Context (a scope reified), both sub-types of Instance by dual declaration; they belong to the flat context VIEW of scope unless that form becomes canonical. TimeTerm = a reified time instant or period (not named Time: that is the role head) (sub-type of Instance by dual declaration; time predicates Day / Hour / Month / … describe it). Distribution = an engine value (ParticleFromNormal …) allowed where an approximate number is. Level = a degree / proportion level: a symbol from a closed label set (very, excessive, most, half — declared Level by the emitter) or a term standing in for one ((forKind class), (Fraction n d)).

## core-link (10)

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


## role (15)

head: Agent
kind: role
arity: 2
type-def: (: Agent (-> Event Entity Proposition))
gloss: Volitional doer / subject of an action. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


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
gloss: Subject of a stative predication — psych state or predicate-adjective state. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Goal
kind: role
arity: 2
type-def: (: Goal (-> Event Entity Proposition))
gloss: Non-recipient destination / 'to …' oblique (whither); the addressee of a transfer or communication is Recipient, never Goal. A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


head: Holder
kind: role
arity: 2
type-def: (: Holder (-> Event Entity Proposition))
gloss: Subject of a possession/relational state only (own, have, lack). A compound-action class symbol under the compound decomposition ((Patient use_crosswalk crosswalk)) is declared both Class and Event.


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


## scope (13)

head: AccordingTo
kind: scope
arity: 2
type-def: (: AccordingTo (-> Proposition Instance Proposition))
gloss: Evidential attribution: seals P and names its source ("according to X, P").


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


head: Forbid
kind: scope
arity: 1
type-def: (: Forbid (-> Proposition Proposition))
gloss: Seals a negative imperative's forbidden eventuality. RETIRE: under explicit scope a negative imperative is (Directive (Not P)), parallel to (Obligated (Not P)); declaration kept only until the re-parse.
status: retire


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
gloss: Deontic obligation on a specific act. Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Permitted
kind: scope
arity: 1
type-def: (: Permitted (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Deontic permission on a specific act. Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse.


head: Probably
kind: scope
arity: 1
type-def: (: Probably (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Epistemic probability ('probably'). Target form: operator over the sealed clause (-> Proposition Proposition); the tag form (-> Event Proposition) is legacy, kept only until the re-parse. RETIRE: the likelihood becomes the clause statement's STV strength (band per word, in the template), and the surface word is kept by a LikelihoodPhrase surface record; declaration kept only until the re-parse.
status: retire


head: Question
kind: scope
arity: 2
type-def: (: Question (-> Atom Proposition Proposition))
gloss: Seals an embedded constituent (wh-) question with its wh-word. The wh-word is a bare symbol that doubles as the gap filler inside the body, so its position is unchecked.


head: Whether
kind: scope
arity: 1
type-def: (: Whether (-> Proposition Proposition))
gloss: Seals an embedded polar question under the matrix verb's Theme.


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


## temporal (21)

head: Before
kind: temporal
arity: 2
type-def: (: Before (-> Event Event Proposition))
gloss: Canonical ordering: the first eventuality precedes the second.


head: BeforeBy
kind: temporal
arity: 4
type-def: (: BeforeBy (-> Event Event Number Class Proposition))  ; and 3 more (per arity / per union alternative)
gloss: Measured temporal gap: the first eventuality or time instance precedes the second (an eventuality, or a time instance such as the text's reference time now) by n units; 0 units = the same period (today = 0 day before now).


head: Day
kind: temporal
arity: 2
type-def: (: Day (-> TimeTerm Number Proposition))
legacy: (: Day (-> Number TimeTerm))  ; kept until the re-parse
gloss: Day-of-month of a time instance: (Day t 6). Legacy constructor form (Day 6) kept until the re-parse.


head: Duration
kind: temporal
arity: 2
type-def: (: Duration (-> Event String Proposition))
gloss: Licensed duration-adverb slot: the surface adverb lemma on an eventuality. A surface-record-like slot (vague extent); the measured form is (Measure e duration n unit).


head: During
kind: temporal
arity: 2
type-def: (: During (-> Event Event Proposition))
gloss: The inner eventuality is nested inside the outer one.


head: End
kind: temporal
arity: 2
type-def: (: End (-> Event TimeTerm Proposition))
gloss: Interval end point of an eventuality: (End e t), t a time instance.


head: Every
kind: temporal
arity: 3
type-def: (: Every (-> Event Number Class Proposition))
gloss: Periodic recurrence: the event happens every n units.


head: Future
kind: temporal
arity: 1
type-def: (: Future (-> Event Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Future tense on an eventuality.


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


head: Quarter
kind: temporal
arity: 2
type-def: (: Quarter (-> TimeTerm Number Proposition))
legacy: (: Quarter (-> Number Number TimeTerm))  ; kept until the re-parse
gloss: Calendar / fiscal quarter of a time instance: (Quarter t 3) beside (Year t 2003). Legacy constructor form (Quarter 3 2003) kept until the re-parse.


head: Start
kind: temporal
arity: 2
type-def: (: Start (-> Event TimeTerm Proposition))
gloss: Interval start point of an eventuality: (Start e t) with the time instance t described by Day / Hour / Year … atoms.


head: TimeAtLeast
kind: temporal
arity: 2
type-def: (: TimeAtLeast (-> Event TimeTerm Proposition))
gloss: Lower-bounded (earliest) time of an eventuality: (TimeAtLeast e t), t a time instance.


head: TimeAtMost
kind: temporal
arity: 2
type-def: (: TimeAtMost (-> Event TimeTerm Proposition))
gloss: Upper-bounded (latest) time of an eventuality: (TimeAtMost e t), t a time instance.


head: TimesPer
kind: temporal
arity: 3
type-def: (: TimesPer (-> Event Number Class Proposition))
gloss: Rate recurrence: n times per unit.


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
gloss: Backward window: the eventuality falls within the last n units.


head: Year
kind: temporal
arity: 2
type-def: (: Year (-> TimeTerm Number Proposition))
legacy: (: Year (-> Number TimeTerm))  ; kept until the re-parse
gloss: Calendar year of a time instance: (Year t 2026). Legacy constructor form (Year 2026) kept until the re-parse.


## relation (15)

head: ClassProperty
kind: relation
arity: 2
type-def: (: ClassProperty (-> Class Class Proposition))
gloss: Non-distributing property of a class/population as a whole. Order: (ClassProperty class property). Opaque: distributes to no member. Emitted by the class-property template; the frozen prompt line writes it as KindProperty.


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


head: PartOf
kind: relation
arity: 2
type-def: (: PartOf (-> Instance Instance Proposition))
gloss: Part/component (or named member) of a whole. Order: (PartOf part whole); eventualities may have parts.


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
arity: 3
type-def: (: Ordinal (-> Instance Number Class Proposition))
gloss: The entity's rank n on an ordering scale. Order: (Ordinal entity rank scale); the scale may be a verb lemma ("first to respond").


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


## lexicon (4)

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
gloss: Tags a relation head as mutual by meaning. The argument is a relation HEAD symbol (an open-class mutual predicate such as Friend); heads are not a type, so the position is unchecked. Background fact about the vocabulary.


head: WeekdayNumber
kind: lexicon
arity: 2
type-def: (: WeekdayNumber (-> Class Number Proposition))
gloss: Seeded lexicon fact giving a weekday name its number (monday=1). Background fact (seeded), never parser output.


## discourse (15)

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
type-def: (: Because (-> Event Event Proposition))
gloss: Causal connective 'because'. Order: (Connective main-clause-eventuality subordinate-eventuality); a copular endpoint is reified as a state witness. The head is the surface connective itself, never normalized.


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


## surface-record (4)

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
gloss: Records the surface quantifier word beside the strength it set. Surface record: a literal string; excluded from the faithful mining view.


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


## open-class heads (not enumerable)

Heads the prompt licenses generically; the validator checks position and arity only. Licensed positions:

- head of a class-level relation atom, e.g. (Carry mosquito malaria)
- head of a symmetric relation atom accompanied by (Symmetric <head>)
- head of a nominalization class-relation, e.g. (Build dam_builder dam)
- skolem-function head (sk_<verb>) in a scope construction, e.g. (sk_y $x)

Oblique prepositions (62), all declared `(-> Instance|Class Instance Proposition)`: About, Above, Across, After, Against, Along, Among, Around, As, At, Before, Behind, Below, Beneath, Beside, Besides, Between, Beyond, But, By, Concerning, Despite, Down, During, Except, For, From, In, Inside, Into, Like, Near, Of, Off, On, Onto, Opposite, Out, Outside, Over, Past, Per, Regarding, Round, Since, Than, Through, Throughout, Till, To, Toward, Towards, Under, Underneath, Unlike, Until, Up, Upon, Via, With, Within, Without.

## notes

- Proposed, not yet emitted by any template: Coref, Equivalence, InContext, LikelihoodPhrase, Not, Pending, Similarity.
- To retire at the re-parse (declaration kept until then so today's parses still type-check): Forbid, KindProperty, Probably.
