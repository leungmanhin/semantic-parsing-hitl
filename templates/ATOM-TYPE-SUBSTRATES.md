# Atom-type substrates

Generated from `templates/atom-type-substrates.json` (schema `atom-type-substrates/1`) by `templates/tmpl/gen_substrate.py`, together with `templates/generated/atom-types.metta`. Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`.

127 heads in 9 kinds (3 proposed; 9 with a reviewed type declaration so far). `type-def` is the PeTTa declaration emitted for the head; `?` as the output type means the head is not yet reviewed and is absent from the `.metta` file; `%Undefined%` marks a position the head takes but the JSON does not type.

Sorts: Atom, Class, Entity, Event, Instance, Number, Proposition, String.

Declared sort list (PeTTa convention, capitalized): Atom = unchecked position; Proposition = a statement-forming expression; Instance with sub-sorts Entity and Event (a symbol carries both its sub-sort and Instance); Class; Number; String. Migration mapping from the ad-hoc names: term, assertion -> Proposition; property, verb-lemma, unit -> Class; symbol, reading-tag -> String; var, uncertain -> Atom. A union such as Event|Proposition expands to one declaration per alternative. `out` = the output type of the head's type declaration, set as each kind is reviewed.

## core-link (9)

head: And
kind: core-link
arity: 2+ (variadic)
type-def: (: And (-> Proposition Proposition Proposition))  ; and 7 more (per arity / per union alternative)


head: Coref
kind: core-link
arity: 2
type-def: (: Coref (-> Instance Instance Proposition))
status: proposed


head: Equivalence
kind: core-link
arity: 2
type-def: (: Equivalence (-> Proposition Proposition Proposition))
status: proposed


head: Implication
kind: core-link
arity: 2
type-def: (: Implication (-> Proposition Proposition Proposition))


head: Inheritance
kind: core-link
arity: 2
type-def: (: Inheritance (-> Class Class Proposition))


head: Member
kind: core-link
arity: 2
type-def: (: Member (-> Instance Class Proposition))


head: Or
kind: core-link
arity: 2+ (variadic)
type-def: (: Or (-> Proposition Proposition Proposition))  ; and 7 more (per arity / per union alternative)


head: Similarity
kind: core-link
arity: 2
type-def: (: Similarity (-> Class Class Proposition))
status: proposed


head: Xor
kind: core-link
arity: 2
type-def: (: Xor (-> Proposition Proposition Proposition))


## role (15)

head: Agent
kind: role
arity: 2
type-def: (: Agent (-> Event Instance ?))  ; out type pending review


head: Beneficiary
kind: role
arity: 2
type-def: (: Beneficiary (-> Event Instance ?))  ; out type pending review


head: CoAgent
kind: role
arity: 2
type-def: (: CoAgent (-> Event Instance ?))  ; out type pending review


head: Experiencer
kind: role
arity: 2
type-def: (: Experiencer (-> Event Instance ?))  ; out type pending review


head: Goal
kind: role
arity: 2
type-def: (: Goal (-> Event Instance ?))  ; out type pending review


head: Holder
kind: role
arity: 2
type-def: (: Holder (-> Event Instance ?))  ; out type pending review


head: Instrument
kind: role
arity: 2
type-def: (: Instrument (-> Event Instance ?))  ; out type pending review


head: Location
kind: role
arity: 2
type-def: (: Location (-> Event Instance ?))  ; out type pending review


head: Manner
kind: role
arity: 2
type-def: (: Manner (-> Event Atom ?))  ; out type pending review


head: Patient
kind: role
arity: 2
type-def: (: Patient (-> Event Instance ?))  ; out type pending review


head: Recipient
kind: role
arity: 2
type-def: (: Recipient (-> Event Instance ?))  ; out type pending review


head: Source
kind: role
arity: 2
type-def: (: Source (-> Event Instance ?))  ; out type pending review


head: Stimulus
kind: role
arity: 2
type-def: (: Stimulus (-> Event Instance ?))  ; out type pending review


head: Theme
kind: role
arity: 2
type-def: (: Theme (-> Event Instance ?))  ; out type pending review


head: Time
kind: role
arity: 2
type-def: (: Time (-> Event Proposition ?))  ; out type pending review


## status (13)

head: Again
kind: status
arity: 1
type-def: (: Again (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Already
kind: status
arity: 1
type-def: (: Already (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Can
kind: status
arity: 1
type-def: (: Can (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Future
kind: status
arity: 1
type-def: (: Future (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Might
kind: status
arity: 1
type-def: (: Might (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Must
kind: status
arity: 1
type-def: (: Must (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Obligated
kind: status
arity: 1
type-def: (: Obligated (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Ongoing
kind: status
arity: 1
type-def: (: Ongoing (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Past
kind: status
arity: 1
type-def: (: Past (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Permitted
kind: status
arity: 1
type-def: (: Permitted (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Probably
kind: status
arity: 1
type-def: (: Probably (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Still
kind: status
arity: 1
type-def: (: Still (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


head: Yet
kind: status
arity: 1 | 2
type-def: (: Yet (-> Event ?))  ; and 1 more (per arity / per union alternative)  ; out type pending review


## operator (64)

head: AccordingTo
kind: operator
arity: 2
type-def: (: AccordingTo (-> Proposition Proposition ?))  ; out type pending review


head: Also
kind: operator
arity: 2
type-def: (: Also (-> Instance Event ?))  ; out type pending review


head: AmongMost
kind: operator
arity: 3
type-def: (: AmongMost (-> Class Instance Class ?))  ; out type pending review


head: Before
kind: operator
arity: 2
type-def: (: Before (-> Event Event ?))  ; out type pending review


head: BeforeBy
kind: operator
arity: 4
type-def: (: BeforeBy (-> Event Event Number Class ?))  ; out type pending review


head: Cardinality
kind: operator
arity: 2
type-def: (: Cardinality (-> Instance Number ?))  ; out type pending review


head: CardinalityAtLeast
kind: operator
arity: 2
type-def: (: CardinalityAtLeast (-> Instance Number ?))  ; out type pending review


head: CardinalityAtMost
kind: operator
arity: 2
type-def: (: CardinalityAtMost (-> Instance Number ?))  ; out type pending review


head: Cleft
kind: operator
arity: 2
type-def: (: Cleft (-> Instance Event ?))  ; out type pending review


head: ConditionalProperty
kind: operator
arity: 3
type-def: (: ConditionalProperty (-> Class Class Class ?))  ; out type pending review


head: Counterfactual
kind: operator
arity: 2
type-def: (: Counterfactual (-> Proposition Proposition ?))  ; out type pending review


head: Day
kind: operator
arity: 1
type-def: (: Day (-> Number ?))  ; out type pending review


head: Degree
kind: operator
arity: 3
type-def: (: Degree (-> Instance Class String ?))  ; out type pending review


head: Directive
kind: operator
arity: 1
type-def: (: Directive (-> Proposition ?))  ; out type pending review


head: Duration
kind: operator
arity: 2
type-def: (: Duration (-> Event String ?))  ; out type pending review


head: During
kind: operator
arity: 2
type-def: (: During (-> Event Event ?))  ; out type pending review


head: End
kind: operator
arity: 2
type-def: (: End (-> Event Proposition ?))  ; out type pending review


head: Even
kind: operator
arity: 2
type-def: (: Even (-> Instance Event ?))  ; out type pending review


head: Every
kind: operator
arity: 3
type-def: (: Every (-> Event Number Class ?))  ; out type pending review


head: Forbid
kind: operator
arity: 1
type-def: (: Forbid (-> Proposition ?))  ; out type pending review


head: Fraction
kind: operator
arity: 2
type-def: (: Fraction (-> Number Number ?))  ; out type pending review


head: GroupOf
kind: operator
arity: 2
type-def: (: GroupOf (-> Instance Class ?))  ; out type pending review


head: Hour
kind: operator
arity: 1
type-def: (: Hour (-> Number ?))  ; out type pending review


head: KindProperty
kind: operator
arity: 2
type-def: (: KindProperty (-> Class Class ?))  ; out type pending review


head: LocatedIn
kind: operator
arity: 2
type-def: (: LocatedIn (-> Instance Instance ?))  ; out type pending review


head: Measure
kind: operator
arity: 4
type-def: (: Measure (-> Instance Class Number Class ?))  ; out type pending review


head: MeasureAtLeast
kind: operator
arity: 4
type-def: (: MeasureAtLeast (-> Instance Class Number Class ?))  ; out type pending review


head: MeasureAtMost
kind: operator
arity: 4
type-def: (: MeasureAtMost (-> Instance Class Number Class ?))  ; out type pending review


head: MeasureBy
kind: operator
arity: 4
type-def: (: MeasureBy (-> Event Class Number Class ?))  ; out type pending review


head: MeasureFrom
kind: operator
arity: 4
type-def: (: MeasureFrom (-> Event Class Number Class ?))  ; out type pending review


head: MeasureTo
kind: operator
arity: 4
type-def: (: MeasureTo (-> Event Class Number Class ?))  ; out type pending review


head: Minute
kind: operator
arity: 1
type-def: (: Minute (-> Number ?))  ; out type pending review


head: Month
kind: operator
arity: 1
type-def: (: Month (-> String ?))  ; out type pending review


head: MonthNumber
kind: operator
arity: 2
type-def: (: MonthNumber (-> String Number ?))  ; out type pending review


head: More
kind: operator
arity: 3
type-def: (: More (-> Class Instance Instance ?))  ; out type pending review


head: MoreBy
kind: operator
arity: 5
type-def: (: MoreBy (-> Class Instance Instance Number Class ?))  ; out type pending review


head: Most
kind: operator
arity: 3
type-def: (: Most (-> Class Instance Class ?))  ; out type pending review


head: Only
kind: operator
arity: 2
type-def: (: Only (-> Instance Event ?))  ; out type pending review


head: Ordinal
kind: operator
arity: 3
type-def: (: Ordinal (-> Instance Number Class ?))  ; out type pending review


head: PartOf
kind: operator
arity: 2
type-def: (: PartOf (-> Instance Instance ?))  ; out type pending review


head: ParticleFromNormal
kind: operator
arity: 2
type-def: (: ParticleFromNormal (-> Number Number ?))  ; out type pending review


head: Possession
kind: operator
arity: 2
type-def: (: Possession (-> Instance Instance ?))  ; out type pending review


head: ProportionOf
kind: operator
arity: 3
type-def: (: ProportionOf (-> Instance Instance String ?))  ; out type pending review


head: PurposeOf
kind: operator
arity: 2
type-def: (: PurposeOf (-> Event Event ?))  ; out type pending review


head: Quarter
kind: operator
arity: 2
type-def: (: Quarter (-> Number Number ?))  ; out type pending review


head: Question
kind: operator
arity: 2
type-def: (: Question (-> String Proposition ?))  ; out type pending review


head: ReasonFor
kind: operator
arity: 2
type-def: (: ReasonFor (-> Event Event ?))  ; out type pending review


head: RestOf
kind: operator
arity: 2
type-def: (: RestOf (-> Instance Instance ?))  ; out type pending review


head: Result
kind: operator
arity: 2
type-def: (: Result (-> Event Event ?))  ; out type pending review


head: SameDegree
kind: operator
arity: 3
type-def: (: SameDegree (-> Class Instance Instance ?))  ; out type pending review


head: ScaleOpposite
kind: operator
arity: 2
type-def: (: ScaleOpposite (-> Class Class ?))  ; out type pending review


head: Start
kind: operator
arity: 2
type-def: (: Start (-> Event Proposition ?))  ; out type pending review


head: SubsetOf
kind: operator
arity: 2
type-def: (: SubsetOf (-> Instance Instance ?))  ; out type pending review


head: Symmetric
kind: operator
arity: 1
type-def: (: Symmetric (-> String ?))  ; out type pending review


head: TimeAtLeast
kind: operator
arity: 2
type-def: (: TimeAtLeast (-> Event Proposition ?))  ; out type pending review


head: TimeAtMost
kind: operator
arity: 2
type-def: (: TimeAtMost (-> Event Proposition ?))  ; out type pending review


head: TimesAs
kind: operator
arity: 4
type-def: (: TimesAs (-> Class Instance Instance Number ?))  ; out type pending review


head: TimesPer
kind: operator
arity: 3
type-def: (: TimesPer (-> Event Number Class ?))  ; out type pending review


head: Weekday
kind: operator
arity: 1
type-def: (: Weekday (-> String ?))  ; out type pending review


head: WeekdayNumber
kind: operator
arity: 2
type-def: (: WeekdayNumber (-> String Number ?))  ; out type pending review


head: Whether
kind: operator
arity: 1
type-def: (: Whether (-> Proposition ?))  ; out type pending review


head: WithinLast
kind: operator
arity: 3
type-def: (: WithinLast (-> Event Number Class ?))  ; out type pending review


head: Year
kind: operator
arity: 1
type-def: (: Year (-> Number ?))  ; out type pending review


head: forKind
kind: operator
arity: 1
type-def: (: forKind (-> Class ?))  ; out type pending review


## discourse (14)

head: Although
kind: discourse
arity: 2
type-def: (: Although (-> Event Event ?))  ; out type pending review


head: AsAResult
kind: discourse
arity: 2
type-def: (: AsAResult (-> Event Event ?))  ; out type pending review


head: Because
kind: discourse
arity: 2
type-def: (: Because (-> Event Event ?))  ; out type pending review


head: But
kind: discourse
arity: 2
type-def: (: But (-> Event Event ?))  ; out type pending review


head: Consequently
kind: discourse
arity: 2
type-def: (: Consequently (-> Event Event ?))  ; out type pending review


head: Despite
kind: discourse
arity: 2
type-def: (: Despite (-> Event Event ?))  ; out type pending review


head: EvenThough
kind: discourse
arity: 2
type-def: (: EvenThough (-> Event Event ?))  ; out type pending review


head: InOrderTo
kind: discourse
arity: 2
type-def: (: InOrderTo (-> Event Event ?))  ; out type pending review


head: Since
kind: discourse
arity: 2
type-def: (: Since (-> Event Event ?))  ; out type pending review


head: So
kind: discourse
arity: 2
type-def: (: So (-> Event Event ?))  ; out type pending review


head: SoAsTo
kind: discourse
arity: 2
type-def: (: SoAsTo (-> Event Event ?))  ; out type pending review


head: Therefore
kind: discourse
arity: 2
type-def: (: Therefore (-> Event Event ?))  ; out type pending review


head: Thus
kind: discourse
arity: 2
type-def: (: Thus (-> Event Event ?))  ; out type pending review


head: To
kind: discourse
arity: 2
type-def: (: To (-> Event Event ?))  ; out type pending review


## property-constructor (3)

head: can
kind: property-constructor
arity: 1
type-def: (: can (-> Class ?))  ; out type pending review


head: obligated
kind: property-constructor
arity: 1
type-def: (: obligated (-> Class ?))  ; out type pending review


head: permitted
kind: property-constructor
arity: 1
type-def: (: permitted (-> Class ?))  ; out type pending review


## surface-record (3)

head: CardinalityPhrase
kind: surface-record
arity: 2
type-def: (: CardinalityPhrase (-> Instance String ?))  ; out type pending review


head: Name
kind: surface-record
arity: 2
type-def: (: Name (-> Instance String ?))  ; out type pending review


head: QuantifierPhrase
kind: surface-record
arity: 3
type-def: (: QuantifierPhrase (-> Class Class String ?))  ; out type pending review


## meta (1)

head: Interpretation
kind: meta
arity: 2
type-def: (: Interpretation (-> String Proposition ?))  ; out type pending review


## engine (5)

head: :
kind: engine
arity: 3
type-def: (: : (-> String Proposition Proposition ?))  ; out type pending review


head: Compute
kind: engine
arity: 4
type-def: (: Compute (-> String Proposition String Atom ?))  ; out type pending review


head: FoldAll
kind: engine
arity: 6
type-def: (: FoldAll (-> Proposition Atom Number String String Atom ?))  ; out type pending review


head: GreaterThan
kind: engine
arity: 2
type-def: (: GreaterThan (-> Number Number ?))  ; out type pending review


head: STV
kind: engine
arity: 2
type-def: (: STV (-> Number Number ?))  ; out type pending review


## open-class heads (not enumerable)

Heads the prompt licenses generically; the validator checks position and arity only. Licensed positions:

- head of a kind-level relation atom, e.g. (Carry mosquito malaria)
- head of a symmetric relation atom accompanied by (Symmetric <head>)
- head of a nominalization kind-relation, e.g. (Build dam_builder dam)
- skolem-function head (sk_<verb>) in a scope construction, e.g. (sk_y $x)

## notes

- Proposed, not yet emitted by any template: Coref, Equivalence, Similarity.
