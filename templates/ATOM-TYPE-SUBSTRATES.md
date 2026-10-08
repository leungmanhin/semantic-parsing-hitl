# Atom-type substrates

Generated from `templates/atom-type-substrates.json` (schema `atom-type-substrates/1`) by `templates/tmpl/gen_substrate.py`, together with `templates/generated/atom-types.metta`. Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`.

127 heads in 9 kinds (3 proposed; 24 with a reviewed type declaration so far). `type-def` is the PeTTa declaration emitted for the head; `?` as the output type means the head is not yet reviewed and is absent from the `.metta` file; `%Undefined%` marks a position the head takes but the JSON does not type.

Sorts: Atom, Class, Entity, Event, Instance, Number, Proposition, String.

Declared sort list (PeTTa convention, capitalized): Atom = unchecked position; Proposition = a statement-forming expression; Instance with sub-sorts Entity and Event (a symbol carries both its sub-sort and Instance); Class; Number; String. Migration mapping from the ad-hoc names: term, assertion -> Proposition; property, verb-lemma, unit -> Class; symbol, reading-tag -> String; var, uncertain -> Atom. A union such as Event|Proposition expands to one declaration per alternative. `out` = the output type of the head's type declaration, set as each kind is reviewed.

## core-link (9)

head: And
kind: core-link
arity: 2+ (variadic)
type-def: (: And (-> Proposition Proposition Proposition))  ; and 7 more (per arity / per union alternative)
gloss: Conjunction bundle; one fact, one truth value.


head: Coref
kind: core-link
arity: 2
type-def: (: Coref (-> Instance Instance Proposition))
gloss: Hypothesis that two mentions denote one entity; STV = probability of identity. Base of the resolved-entity view. A mention sort is pending.
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
gloss: Volitional doer / subject of an action.


head: Beneficiary
kind: role
arity: 2
type-def: (: Beneficiary (-> Event Entity Proposition))
gloss: 'for …' oblique: only a party the event is done for the benefit of (incl. acting in someone's place); a 'for' naming the ground, prize or exchange is the preposition-named (For …) oblique instead.


head: CoAgent
kind: role
arity: 2
type-def: (: CoAgent (-> Event Entity Proposition))
gloss: Animate co-participant named by a comitative phrase ('with John').


head: Experiencer
kind: role
arity: 2
type-def: (: Experiencer (-> Event Entity Proposition))
gloss: Subject of a stative predication — psych state or predicate-adjective state.


head: Goal
kind: role
arity: 2
type-def: (: Goal (-> Event Entity Proposition))
gloss: Non-recipient destination / 'to …' oblique (whither); the addressee of a transfer or communication is Recipient, never Goal.


head: Holder
kind: role
arity: 2
type-def: (: Holder (-> Event Entity Proposition))
gloss: Subject of a possession/relational state only (own, have, lack).


head: Instrument
kind: role
arity: 2
type-def: (: Instrument (-> Event Entity Proposition))
gloss: The means an action is performed by ('with a knife') or a 'via / by way of' route or channel: a tool, substance or conduit, never a person (a person 'with' whom is CoAgent).


head: Location
kind: role
arity: 2
type-def: (: Location (-> Event Entity Proposition))
gloss: Where the eventuality holds ('in/at/on …').


head: Manner
kind: role
arity: 2
type-def: (: Manner (-> Event Class Proposition))
gloss: Adverbial manner of the eventuality.


head: Patient
kind: role
arity: 2
type-def: (: Patient (-> Event Entity Proposition))
gloss: Object the action creates, destroys, consumes or physically changes.


head: Recipient
kind: role
arity: 2
type-def: (: Recipient (-> Event Entity Proposition))
gloss: Goal of a transfer (indirect object / 'to').


head: Source
kind: role
arity: 2
type-def: (: Source (-> Event Entity Proposition))
gloss: Origin / 'from …' oblique.


head: Stimulus
kind: role
arity: 2
type-def: (: Stimulus (-> Event Entity Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Object of a psych/perception state.


head: Theme
kind: role
arity: 2
type-def: (: Theme (-> Event Entity Proposition))  ; and 1 more (per arity / per union alternative)
gloss: Object acquired, transferred, moved, possessed, perceived or evaluated unchanged.


head: Time
kind: role
arity: 2
type-def: (: Time (-> Event Instance Proposition))
gloss: Locates an eventuality at a time point or recurrence slot.


## status (13)

head: Again
kind: status
arity: 1
type-def: (: Again (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Repetitive/restitutive presupposition: a prior same-type event happened.


head: Already
kind: status
arity: 1
type-def: (: Already (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: The eventuality happened earlier than expected.


head: Can
kind: status
arity: 1
type-def: (: Can (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: A specific subject's capability on this event.


head: Future
kind: status
arity: 1
type-def: (: Future (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Future tense on an eventuality.


head: Might
kind: status
arity: 1
type-def: (: Might (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Epistemic possibility ('might / may').


head: Must
kind: status
arity: 1
type-def: (: Must (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Epistemic necessity ('must'-inference).


head: Obligated
kind: status
arity: 1
type-def: (: Obligated (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Deontic obligation on a specific act.


head: Ongoing
kind: status
arity: 1
type-def: (: Ongoing (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Progressive / continuative aspect.


head: Past
kind: status
arity: 1
type-def: (: Past (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Past tense on an eventuality.


head: Permitted
kind: status
arity: 1
type-def: (: Permitted (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Deontic permission on a specific act.


head: Probably
kind: status
arity: 1
type-def: (: Probably (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Epistemic probability ('probably').


head: Still
kind: status
arity: 1
type-def: (: Still (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: Continuative: the eventuality still holds (positive counterpart of cessation).


head: Yet
kind: status
arity: 1 | 2
type-def: (: Yet (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review
gloss: NPI 'yet': expected but not yet — under negation or a question.


## operator (64)

head: AccordingTo
kind: operator
arity: 2
type-def: (: AccordingTo (-> Proposition Proposition ?))  ; out type pending review
gloss: Evidential attribution: seals P and names its source ("according to X, P").


head: Also
kind: operator
arity: 2
type-def: (: Also (-> Instance Event ?))  ; out type pending review
gloss: Additive focus particle ('also / too / as well').


head: AmongMost
kind: operator
arity: 3
type-def: (: AmongMost (-> Class Instance Class ?))  ; out type pending review
gloss: Top-stratum membership: one of the ADJ-est members of a class.


head: Before
kind: operator
arity: 2
type-def: (: Before (-> Event Event ?))  ; out type pending review
gloss: Canonical ordering: the first eventuality precedes the second.


head: BeforeBy
kind: operator
arity: 4
type-def: (: BeforeBy (-> Event Event Number Class ?))  ; out type pending review
gloss: Measured temporal gap between two eventualities.


head: Cardinality
kind: operator
arity: 2
type-def: (: Cardinality (-> Instance Number ?))  ; out type pending review
gloss: Exact size of a group (a point value, native integer).


head: CardinalityAtLeast
kind: operator
arity: 2
type-def: (: CardinalityAtLeast (-> Instance Number ?))  ; out type pending review
gloss: Lower bound on a group's size.


head: CardinalityAtMost
kind: operator
arity: 2
type-def: (: CardinalityAtMost (-> Instance Number ?))  ; out type pending review
gloss: Upper bound on a group's size.


head: Cleft
kind: operator
arity: 2
type-def: (: Cleft (-> Instance Event ?))  ; out type pending review
gloss: It-cleft / pseudo-cleft focus marker.


head: ConditionalProperty
kind: operator
arity: 3
type-def: (: ConditionalProperty (-> Class Class Class ?))  ; out type pending review
gloss: A kind has a property only under a stated condition.


head: Counterfactual
kind: operator
arity: 2
type-def: (: Counterfactual (-> Proposition Proposition ?))  ; out type pending review
gloss: Sealed subjunctive conditional: antecedent and consequent, neither asserted.


head: Day
kind: operator
arity: 1
type-def: (: Day (-> Number ?))  ; out type pending review
gloss: Day-of-month term.


head: Degree
kind: operator
arity: 3
type-def: (: Degree (-> Instance Class String ?))  ; out type pending review
gloss: Intensity level of a property on an entity.


head: Directive
kind: operator
arity: 1
type-def: (: Directive (-> Proposition ?))  ; out type pending review
gloss: Seals a positive imperative's commanded eventuality.


head: Duration
kind: operator
arity: 2
type-def: (: Duration (-> Event String ?))  ; out type pending review
gloss: Licensed duration-adverb slot: the surface adverb lemma on an eventuality.


head: During
kind: operator
arity: 2
type-def: (: During (-> Event Event ?))  ; out type pending review
gloss: The inner eventuality is nested inside the outer one.


head: End
kind: operator
arity: 2
type-def: (: End (-> Event Proposition ?))  ; out type pending review
gloss: Interval end point of an eventuality.


head: Even
kind: operator
arity: 2
type-def: (: Even (-> Instance Event ?))  ; out type pending review
gloss: Scalar focus particle ('even').


head: Every
kind: operator
arity: 3
type-def: (: Every (-> Event Number Class ?))  ; out type pending review
gloss: Periodic recurrence: the event happens every n units.


head: Forbid
kind: operator
arity: 1
type-def: (: Forbid (-> Proposition ?))  ; out type pending review
gloss: Seals a negative imperative's forbidden eventuality.


head: Fraction
kind: operator
arity: 2
type-def: (: Fraction (-> Number Number ?))  ; out type pending review
gloss: Exact fraction / percentage term, numerator over denominator.


head: GroupOf
kind: operator
arity: 2
type-def: (: GroupOf (-> Instance Class ?))  ; out type pending review
gloss: The members of this group individual are of that kind.


head: Hour
kind: operator
arity: 1
type-def: (: Hour (-> Number ?))  ; out type pending review
gloss: Clock hour term, 24-hour.


head: KindProperty
kind: operator
arity: 2
type-def: (: KindProperty (-> Class Class ?))  ; out type pending review
gloss: Non-distributing property of a kind/population as a whole.


head: LocatedIn
kind: operator
arity: 2
type-def: (: LocatedIn (-> Instance Instance ?))  ; out type pending review
gloss: Static location of an entity ('X is in Y') — as against the event oblique Location.


head: Measure
kind: operator
arity: 4
type-def: (: Measure (-> Instance Class Number Class ?))  ; out type pending review
gloss: Puts a magnitude and unit on an entity's dimension.


head: MeasureAtLeast
kind: operator
arity: 4
type-def: (: MeasureAtLeast (-> Instance Class Number Class ?))  ; out type pending review
gloss: Lower-bounded measure.


head: MeasureAtMost
kind: operator
arity: 4
type-def: (: MeasureAtMost (-> Instance Class Number Class ?))  ; out type pending review
gloss: Upper-bounded measure.


head: MeasureBy
kind: operator
arity: 4
type-def: (: MeasureBy (-> Event Class Number Class ?))  ; out type pending review
gloss: Delta of a scalar-change eventuality: how much the dimension changed.


head: MeasureFrom
kind: operator
arity: 4
type-def: (: MeasureFrom (-> Event Class Number Class ?))  ; out type pending review
gloss: Start value of a scalar change ("from X").


head: MeasureTo
kind: operator
arity: 4
type-def: (: MeasureTo (-> Event Class Number Class ?))  ; out type pending review
gloss: End value of a scalar change ("to Y", "rose to 6.1%").


head: Minute
kind: operator
arity: 1
type-def: (: Minute (-> Number ?))  ; out type pending review
gloss: Clock minute term.


head: Month
kind: operator
arity: 1
type-def: (: Month (-> String ?))  ; out type pending review
gloss: Calendar month term (lowercase month-name lemma).


head: MonthNumber
kind: operator
arity: 2
type-def: (: MonthNumber (-> String Number ?))  ; out type pending review
gloss: Seeded lexicon fact giving a month name its ordinal number.


head: More
kind: operator
arity: 3
type-def: (: More (-> Class Instance Instance ?))  ; out type pending review
gloss: X exceeds Y on a scale (reified comparative ordering).


head: MoreBy
kind: operator
arity: 5
type-def: (: MoreBy (-> Class Instance Instance Number Class ?))  ; out type pending review
gloss: Comparative with a measured gap: X exceeds Y by n units.


head: Most
kind: operator
arity: 3
type-def: (: Most (-> Class Instance Class ?))  ; out type pending review
gloss: Superlative: X is the most ADJ member of a class.


head: Only
kind: operator
arity: 2
type-def: (: Only (-> Instance Event ?))  ; out type pending review
gloss: Exclusive focus particle ('only / just / solely').


head: Ordinal
kind: operator
arity: 3
type-def: (: Ordinal (-> Instance Number Class ?))  ; out type pending review
gloss: The entity's rank n on an ordering scale.


head: PartOf
kind: operator
arity: 2
type-def: (: PartOf (-> Instance Instance ?))  ; out type pending review
gloss: Part/component (or named member) of a whole.


head: ParticleFromNormal
kind: operator
arity: 2
type-def: (: ParticleFromNormal (-> Number Number ?))  ; out type pending review
gloss: Approximate magnitude as a normal distribution: mean and sigma.


head: Possession
kind: operator
arity: 2
type-def: (: Possession (-> Instance Instance ?))  ; out type pending review
gloss: Possessed-to-possessor link (ownership, kinship, loose association).


head: ProportionOf
kind: operator
arity: 3
type-def: (: ProportionOf (-> Instance Instance String ?))  ; out type pending review
gloss: The portion's proportion of a definite whole.


head: PurposeOf
kind: operator
arity: 2
type-def: (: PurposeOf (-> Event Event ?))  ; out type pending review
gloss: Canonical ask-relation: purpose/goal of a focus event.


head: Quarter
kind: operator
arity: 2
type-def: (: Quarter (-> Number Number ?))  ; out type pending review
gloss: Calendar/fiscal quarter term: (Quarter q year).


head: Question
kind: operator
arity: 2
type-def: (: Question (-> String Proposition ?))  ; out type pending review
gloss: Seals an embedded constituent (wh-) question with its wh-word.


head: ReasonFor
kind: operator
arity: 2
type-def: (: ReasonFor (-> Event Event ?))  ; out type pending review
gloss: Canonical ask-relation: reason for a focus event.


head: RestOf
kind: operator
arity: 2
type-def: (: RestOf (-> Instance Instance ?))  ; out type pending review
gloss: Flags a portion as the remainder of a definite whole.


head: Result
kind: operator
arity: 2
type-def: (: Result (-> Event Event ?))  ; out type pending review
gloss: Links an event to the reified result state it caused.


head: SameDegree
kind: operator
arity: 3
type-def: (: SameDegree (-> Class Instance Instance ?))  ; out type pending review
gloss: Equative: X is as ADJ as Y.


head: ScaleOpposite
kind: operator
arity: 2
type-def: (: ScaleOpposite (-> Class Class ?))  ; out type pending review
gloss: Links the two poles of one gradable dimension.


head: Start
kind: operator
arity: 2
type-def: (: Start (-> Event Proposition ?))  ; out type pending review
gloss: Interval start point of an eventuality.


head: SubsetOf
kind: operator
arity: 2
type-def: (: SubsetOf (-> Instance Instance ?))  ; out type pending review
gloss: A quantified subset group of a definite superset group.


head: Symmetric
kind: operator
arity: 1
type-def: (: Symmetric (-> String ?))  ; out type pending review
gloss: Tags a relation head as mutual by meaning.


head: TimeAtLeast
kind: operator
arity: 2
type-def: (: TimeAtLeast (-> Event Proposition ?))  ; out type pending review
gloss: Lower-bounded (earliest) time of an eventuality.


head: TimeAtMost
kind: operator
arity: 2
type-def: (: TimeAtMost (-> Event Proposition ?))  ; out type pending review
gloss: Upper-bounded (latest) time of an eventuality.


head: TimesAs
kind: operator
arity: 4
type-def: (: TimesAs (-> Class Instance Instance Number ?))  ; out type pending review
gloss: Multiplicative comparative: X is <factor> times as ADJ as Y.


head: TimesPer
kind: operator
arity: 3
type-def: (: TimesPer (-> Event Number Class ?))  ; out type pending review
gloss: Rate recurrence: n times per unit.


head: Weekday
kind: operator
arity: 1
type-def: (: Weekday (-> String ?))  ; out type pending review
gloss: Weekday term (lowercase weekday-name lemma).


head: WeekdayNumber
kind: operator
arity: 2
type-def: (: WeekdayNumber (-> String Number ?))  ; out type pending review
gloss: Seeded lexicon fact giving a weekday name its number (monday=1).


head: Whether
kind: operator
arity: 1
type-def: (: Whether (-> Proposition ?))  ; out type pending review
gloss: Seals an embedded polar question under the matrix verb's Theme.


head: WithinLast
kind: operator
arity: 3
type-def: (: WithinLast (-> Event Number Class ?))  ; out type pending review
gloss: Backward window: the eventuality falls within the last n units.


head: Year
kind: operator
arity: 1
type-def: (: Year (-> Number ?))  ; out type pending review
gloss: Calendar year term.


head: forKind
kind: operator
arity: 1
type-def: (: forKind (-> Class ?))  ; out type pending review
gloss: Comparison-class marker: ADJ relative to the norm for a kind.


## discourse (14)

head: Although
kind: discourse
arity: 2
type-def: (: Although (-> Event Event ?))  ; out type pending review
gloss: Concessive connective 'although'.


head: AsAResult
kind: discourse
arity: 2
type-def: (: AsAResult (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'as a result'.


head: Because
kind: discourse
arity: 2
type-def: (: Because (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'because'.


head: But
kind: discourse
arity: 2
type-def: (: But (-> Event Event ?))  ; out type pending review
gloss: Adversative connective 'but'.


head: Consequently
kind: discourse
arity: 2
type-def: (: Consequently (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'consequently'.


head: Despite
kind: discourse
arity: 2
type-def: (: Despite (-> Event Event ?))  ; out type pending review
gloss: Concessive connective 'despite'.


head: EvenThough
kind: discourse
arity: 2
type-def: (: EvenThough (-> Event Event ?))  ; out type pending review
gloss: Concessive connective 'even though'.


head: InOrderTo
kind: discourse
arity: 2
type-def: (: InOrderTo (-> Event Event ?))  ; out type pending review
gloss: Purpose connective 'in order to'.


head: Since
kind: discourse
arity: 2
type-def: (: Since (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'since'.


head: So
kind: discourse
arity: 2
type-def: (: So (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'so'.


head: SoAsTo
kind: discourse
arity: 2
type-def: (: SoAsTo (-> Event Event ?))  ; out type pending review
gloss: Purpose connective 'so as to'.


head: Therefore
kind: discourse
arity: 2
type-def: (: Therefore (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'therefore'.


head: Thus
kind: discourse
arity: 2
type-def: (: Thus (-> Event Event ?))  ; out type pending review
gloss: Causal connective 'thus'.


head: To
kind: discourse
arity: 2
type-def: (: To (-> Event Event ?))  ; out type pending review
gloss: Purpose infinitive connective 'to'.


## property-constructor (3)

head: can
kind: property-constructor
arity: 1
type-def: (: can (-> Class ?))  ; out type pending review
gloss: Builds the reified capability property term from a verb lemma.


head: obligated
kind: property-constructor
arity: 1
type-def: (: obligated (-> Class ?))  ; out type pending review
gloss: Builds the reified obligation property term from an action.


head: permitted
kind: property-constructor
arity: 1
type-def: (: permitted (-> Class ?))  ; out type pending review
gloss: Builds the reified permission property term from an action.


## surface-record (3)

head: CardinalityPhrase
kind: surface-record
arity: 2
type-def: (: CardinalityPhrase (-> Instance String ?))  ; out type pending review
gloss: Records a vague count phrase on a group ('several', 'dozens').


head: Name
kind: surface-record
arity: 2
type-def: (: Name (-> Instance String ?))  ; out type pending review
gloss: Records a named individual's surface name string.


head: QuantifierPhrase
kind: surface-record
arity: 3
type-def: (: QuantifierPhrase (-> Class Class String ?))  ; out type pending review
gloss: Records the surface quantifier word beside the strength it set.


## meta (1)

head: Interpretation
kind: meta
arity: 2
type-def: (: Interpretation (-> String Proposition ?))  ; out type pending review
gloss: Transport wrapper marking a statement as belonging to one reading of a multi-reading parse: (Interpretation rN (: name expr stv)). Dissolved by the canonicalizer's split-before-canonicalize; never a KB atom (engine marginalization = deferred #48 half).


## engine (5)

head: :
kind: engine
arity: 3
type-def: (: : (-> String Proposition Proposition ?))  ; out type pending review
gloss: Statement wrapper: proof-name, logical content, truth value.


head: Compute
kind: engine
arity: 4
type-def: (: Compute (-> String Proposition String Atom ?))  ; out type pending review
gloss: Hard-numeric arithmetic/comparison test on bound integers.


head: FoldAll
kind: engine
arity: 6
type-def: (: FoldAll (-> Proposition Atom Number String String Atom ?))  ; out type pending review
gloss: Aggregate fold across all pattern matches (e.g. sum of cardinalities).


head: GreaterThan
kind: engine
arity: 2
type-def: (: GreaterThan (-> Number Number ?))  ; out type pending review
gloss: Graded P(value > N) over a distribution magnitude.


head: STV
kind: engine
arity: 2
type-def: (: STV (-> Number Number ?))  ; out type pending review
gloss: Truth value: strength and confidence, both in [0,1].


## open-class heads (not enumerable)

Heads the prompt licenses generically; the validator checks position and arity only. Licensed positions:

- head of a kind-level relation atom, e.g. (Carry mosquito malaria)
- head of a symmetric relation atom accompanied by (Symmetric <head>)
- head of a nominalization kind-relation, e.g. (Build dam_builder dam)
- skolem-function head (sk_<verb>) in a scope construction, e.g. (sk_y $x)

## notes

- Proposed, not yet emitted by any template: Coref, Equivalence, Similarity.
