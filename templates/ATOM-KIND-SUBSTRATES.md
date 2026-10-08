# Atom-kind substrates

Generated from `fusenf/specs/vocabulary.json` (schema `fusenf-vocabulary/1`, revised 2026-08-29, prompt `2ed18b93…`) by `templates/tmpl/gen_substrate.py`. Do not edit by hand; regenerate with `cd templates && python -m tmpl.gen_substrate`.

124 heads in 9 classes. Placeholders are the vocabulary's `arg_types`; `<?>` marks an attested position the vocabulary does not type; `...` marks a variadic head.

## core-link (6)

(And <atom> <atom> ...)
class: core-link
arity: 2+ (variadic)
arg_types: [atom, atom, ...]


(Implication <term> <term>)
class: core-link
arity: 2
arg_types: [term, term]


(Inheritance <kind> <kind>)
class: core-link
arity: 2
arg_types: [kind, kind]


(Member <individual> <kind>)
class: core-link
arity: 2
arg_types: [individual, kind]


(Or <atom> <atom> ...)
class: core-link
arity: 2+ (variadic)
arg_types: [atom, atom, ...]


(Xor <proposition> <proposition>)
class: core-link
arity: 2
arg_types: [proposition, proposition]


## role (15)

(Agent <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Beneficiary <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(CoAgent <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Experiencer <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Goal <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Holder <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Instrument <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Location <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Manner <event> <uncertain>)
class: role
arity: 2
arg_types: [event, uncertain]


(Patient <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Recipient <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Source <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Stimulus <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Theme <event> <individual>)
class: role
arity: 2
arg_types: [event, individual]


(Time <event> <term>)
class: role
arity: 2
arg_types: [event, term]


## status (13)

(Again <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Already <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Can <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Future <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Might <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Must <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Obligated <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Ongoing <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Past <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Permitted <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Probably <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Still <event|proposition>)
class: status
arity: 1
arg_types: [event|proposition]


(Yet <event> <?>)
class: status
arity: 1 | 2
arg_types: [event]


## operator (64)

(AccordingTo <proposition> <term>)
class: operator
arity: 2
arg_types: [proposition, term]


(Also <individual> <event>)
class: operator
arity: 2
arg_types: [individual, event]


(AmongMost <property> <individual> <kind>)
class: operator
arity: 3
arg_types: [property, individual, kind]


(Before <event> <event>)
class: operator
arity: 2
arg_types: [event, event]


(BeforeBy <event> <event> <number> <unit>)
class: operator
arity: 4
arg_types: [event, event, number, unit]


(Cardinality <individual> <number>)
class: operator
arity: 2
arg_types: [individual, number]


(CardinalityAtLeast <individual> <number>)
class: operator
arity: 2
arg_types: [individual, number]


(CardinalityAtMost <individual> <number>)
class: operator
arity: 2
arg_types: [individual, number]


(Cleft <individual> <event>)
class: operator
arity: 2
arg_types: [individual, event]


(ConditionalProperty <kind> <property> <property>)
class: operator
arity: 3
arg_types: [kind, property, property]


(Counterfactual <proposition> <proposition>)
class: operator
arity: 2
arg_types: [proposition, proposition]


(Day <number>)
class: operator
arity: 1
arg_types: [number]


(Degree <individual> <property> <symbol>)
class: operator
arity: 3
arg_types: [individual, property, symbol]


(Directive <proposition>)
class: operator
arity: 1
arg_types: [proposition]


(Duration <event> <symbol>)
class: operator
arity: 2
arg_types: [event, symbol]


(During <event> <event>)
class: operator
arity: 2
arg_types: [event, event]


(End <event> <term>)
class: operator
arity: 2
arg_types: [event, term]


(Even <individual> <event>)
class: operator
arity: 2
arg_types: [individual, event]


(Every <event> <number> <unit>)
class: operator
arity: 3
arg_types: [event, number, unit]


(Forbid <proposition>)
class: operator
arity: 1
arg_types: [proposition]


(Fraction <number> <number>)
class: operator
arity: 2
arg_types: [number, number]


(GroupOf <individual> <kind>)
class: operator
arity: 2
arg_types: [individual, kind]


(Hour <number>)
class: operator
arity: 1
arg_types: [number]


(KindProperty <kind> <property>)
class: operator
arity: 2
arg_types: [kind, property]


(LocatedIn <individual> <individual>)
class: operator
arity: 2
arg_types: [individual, individual]


(Measure <individual> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [individual, property, number, unit]


(MeasureAtLeast <individual> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [individual, property, number, unit]


(MeasureAtMost <individual> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [individual, property, number, unit]


(MeasureBy <event> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [event, property, number, unit]


(MeasureFrom <event> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [event, property, number, unit]


(MeasureTo <event> <property> <number> <unit>)
class: operator
arity: 4
arg_types: [event, property, number, unit]


(Minute <number>)
class: operator
arity: 1
arg_types: [number]


(Month <symbol>)
class: operator
arity: 1
arg_types: [symbol]


(MonthNumber <symbol> <number>)
class: operator
arity: 2
arg_types: [symbol, number]


(More <property> <individual> <individual>)
class: operator
arity: 3
arg_types: [property, individual, individual]


(MoreBy <property> <individual> <individual> <number> <unit>)
class: operator
arity: 5
arg_types: [property, individual, individual, number, unit]


(Most <property> <individual> <kind>)
class: operator
arity: 3
arg_types: [property, individual, kind]


(Only <individual> <event>)
class: operator
arity: 2
arg_types: [individual, event]


(Ordinal <individual> <number> <property>)
class: operator
arity: 3
arg_types: [individual, number, property]


(PartOf <individual> <individual>)
class: operator
arity: 2
arg_types: [individual, individual]


(ParticleFromNormal <number> <number>)
class: operator
arity: 2
arg_types: [number, number]


(Possession <individual> <individual>)
class: operator
arity: 2
arg_types: [individual, individual]


(ProportionOf <individual> <individual> <symbol>)
class: operator
arity: 3
arg_types: [individual, individual, symbol]


(PurposeOf <event> <event>)
class: operator
arity: 2
arg_types: [event, event]


(Quarter <number> <number>)
class: operator
arity: 2
arg_types: [number, number]


(Question <symbol> <proposition>)
class: operator
arity: 2
arg_types: [symbol, proposition]


(ReasonFor <event> <event>)
class: operator
arity: 2
arg_types: [event, event]


(RestOf <individual> <individual>)
class: operator
arity: 2
arg_types: [individual, individual]


(Result <event> <event>)
class: operator
arity: 2
arg_types: [event, event]


(SameDegree <property> <individual> <individual>)
class: operator
arity: 3
arg_types: [property, individual, individual]


(ScaleOpposite <property> <property>)
class: operator
arity: 2
arg_types: [property, property]


(Start <event> <term>)
class: operator
arity: 2
arg_types: [event, term]


(SubsetOf <individual> <individual>)
class: operator
arity: 2
arg_types: [individual, individual]


(Symmetric <symbol>)
class: operator
arity: 1
arg_types: [symbol]


(TimeAtLeast <event> <term>)
class: operator
arity: 2
arg_types: [event, term]


(TimeAtMost <event> <term>)
class: operator
arity: 2
arg_types: [event, term]


(TimesAs <property> <individual> <individual> <number>)
class: operator
arity: 4
arg_types: [property, individual, individual, number]


(TimesPer <event> <number> <unit>)
class: operator
arity: 3
arg_types: [event, number, unit]


(Weekday <symbol>)
class: operator
arity: 1
arg_types: [symbol]


(WeekdayNumber <symbol> <number>)
class: operator
arity: 2
arg_types: [symbol, number]


(Whether <proposition>)
class: operator
arity: 1
arg_types: [proposition]


(WithinLast <event> <number> <unit>)
class: operator
arity: 3
arg_types: [event, number, unit]


(Year <number>)
class: operator
arity: 1
arg_types: [number]


(forKind <kind>)
class: operator
arity: 1
arg_types: [kind]


## discourse (14)

(Although <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(AsAResult <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Because <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(But <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Consequently <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Despite <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(EvenThough <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(InOrderTo <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Since <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(So <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(SoAsTo <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Therefore <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(Thus <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


(To <event> <event>)
class: discourse
arity: 2
arg_types: [event, event]


## property-constructor (3)

(can <verb-lemma>)
class: property-constructor
arity: 1
arg_types: [verb-lemma]


(obligated <verb-lemma>)
class: property-constructor
arity: 1
arg_types: [verb-lemma]


(permitted <verb-lemma>)
class: property-constructor
arity: 1
arg_types: [verb-lemma]


## surface-record (3)

(CardinalityPhrase <individual> <string>)
class: surface-record
arity: 2
arg_types: [individual, string]


(Name <individual> <string>)
class: surface-record
arity: 2
arg_types: [individual, string]


(QuantifierPhrase <kind> <property> <string>)
class: surface-record
arity: 3
arg_types: [kind, property, string]


## meta (1)

(Interpretation <reading-tag> <assertion>)
class: meta
arity: 2
arg_types: [reading-tag, assertion]


## engine (5)

(: <symbol> <term> <term>)
class: engine
arity: 3
arg_types: [symbol, term, term]


(Compute <symbol> <term> <symbol> <var>)
class: engine
arity: 4
arg_types: [symbol, term, symbol, var]


(FoldAll <term> <var> <number> <symbol> <symbol> <var>)
class: engine
arity: 6
arg_types: [term, var, number, symbol, symbol, var]


(GreaterThan <number> <number>)
class: engine
arity: 2
arg_types: [number, number]


(STV <number> <number>)
class: engine
arity: 2
arg_types: [number, number]


## open-class heads (not enumerable)

Heads the prompt licenses generically; the validator checks position and arity only. Attested positions:

- head of a kind-level relation atom, e.g. (Carry mosquito malaria)
- head of a symmetric relation atom accompanied by (Symmetric <head>)
- head of a nominalization kind-relation, e.g. (Build dam_builder dam)
- skolem-function head (sk_<verb>) in a scope construction, e.g. (sk_y $x)

Attested so far: 10 relation heads, 42 skolem-function heads, 62 oblique prepositions (listed in `vocabulary.json`).

## notes

- Declared in prompt.txt but exercised by no golden, e2e case or seeded rule (listed above all the same): Despite, EvenThough, FoldAll, Probably.
- Deprecated heads, not listed: Conclusions, Premises.
- `And` is declared 2+ but also attested below that (arity 1 ×3) — to review.
