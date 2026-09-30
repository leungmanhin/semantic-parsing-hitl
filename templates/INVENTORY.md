# Logical template inventory — DRAFT derived from prompt.txt (sha256 2ed18b934e28afac…, 2,925 lines)

Status: exploratory draft, 2026-09-28. Not doctrine. Nothing here changes prompt.txt, the parser
briefs or the pipeline. It answers one question: read as a registry of pre-defined logical
templates, how many templates does the current instruction set already contain, and what do they
look like. ★ marks the proposed starter set for a pilot.

## P06 — operator nesting order (derived from the prompt's own rules; all six corners RULED by the owner 2026-09-29, so the table stands as the registry's nesting order)

Seals are NOT wrappers in this stack: a sealed proposition is a TERM filling a slot of type Prp
(the Theme of an attitude, the first argument of AccordingTo, the argument of Whether / Question /
Directive / Forbid / Counterfactual). The sealed content is rendered by the same layers 0–2 and
5, with one restriction: no layer-3 bundle inside a Prp term (G05, no polarity inside seals).

| layer | what | placement rule |
|---|---|---|
| 0 referent atoms | typing `(Member x kind)`, `Name`, decomposition genus, `GroupOf` / `PartOf` / `Cardinality`, possessor links | top level, except an indefinite posited only inside a denial or seal stays inside (P05) |
| 1 predication | event class + roles; copular atom; relation atoms (More, Measure, LocatedIn, KindProperty …); a Prp slot renders as a term here | the unit everything else attaches to |
| 2 attachments | status `(Past e)` … or `(Past (atom))` for a copular; Time terms; Before / During / Start / End; Again / Still / Already; Degree; Result | inside whatever bundle layer 3 builds; never across a seal boundary |
| 3 denial bundle | explicit negation: `(And <layers 1–2 + non-projecting layer 0>) (STV 0.0 …)`; a copular denial is strength 0 on the (wrapped) atom | Yet sits outside as a positive atom; cessation emits Past outside and the denial without Past (V16) |
| 5 rules | `(Implication premises conclusion)` built from layers 0–2 with variables; status inside the consequent; a negated generic is strength 0 on the rule, not a bundle | QuantifierPhrase companion is a top-level sibling, a sealed sibling inside a seal |
| 6 link atoms | connective heads `(Because main sub)`, purpose `To`, focus `(Only filler e)`, `Symmetric`, `Xor` labels | top-level atoms referencing event symbols from any layer |
| 7 interpretation | `(Interpretation rN (: name <statement> (STV …)))` around any complete statement | outermost; never inside a seal |

Truth values are assigned last, per statement, from P01 / P02.

Corners the order exposes that the current prompt does not decide (to rule on, one line each):
Again / Still under negation — RULED 2026-09-29, see Corner 1 below; tense on a multi-atom copular denial — RULED 2026-09-29, see Corner 2 below; a focus atom on a denied prejacent — RULED 2026-09-29, see Corner 3 below; a connective endpoint that is a denied event — RULED 2026-09-29, see Corner 4 below; negation of a disjunction — RULED 2026-09-29, see Corner 5 below; a disjunction inside a seal — RULED 2026-09-29, see Corner 6 below. ALL SIX RULED: the layer table above stands as the registry's nesting order
(`(Past (And …))` or Past inside); a focus atom on a denied prejacent; a connective endpoint that
is a denied event (the head references a symbol whose bundle is at strength 0); negation of a
disjunction; a disjunction inside a seal.

## P06 corners — worked examples and proposed rulings

### Corner 1 — again / still under negation (RULED, owner 2026-09-29: the proposed principle and all four cases adopted; prompt.txt unchanged until a fix-pack)

Two different things can be under the negation: the EVENT (the particle's presupposition survives)
or the particle's own meaning (continuation). Placement question = presupposition projection.

Case 1, negation over the repeated event — "The server did not crash again."

    Option A (tag outside, proposed):
    (: srv_type    (Member sk_server_1 server) (STV 1.0 0.99))
    (: crash_neg   (And (Member sk_crash_1 crash) (Patient sk_crash_1 sk_server_1) (Past sk_crash_1)) (STV 0.0 0.99))
    (: crash_again (Again sk_crash_1) (STV 1.0 0.99))        ; a prior crash is presupposed; survives the denial
    Option B (tag inside): (And … (Again sk_crash_1)) at strength 0 — the prior crash is denied with the event.

Case 2, the particle over the denial — "Again, the courier did not call." → the SAME atoms as
"The courier did not call again." The opaque tag does not say whether what came before was a
call or a non-call. Registered loss (sense), not a second form.

Case 3, still scoping over the negation — "The parcel still has not shipped."

    (: parcel_type (Member sk_parcel_1 parcel) (STV 1.0 0.99))
    (: ship_neg    (And (Member sk_ship_1 ship) (Patient sk_ship_1 sk_parcel_1) (Past sk_ship_1)) (STV 0.0 0.99))
    (: ship_still  (Still sk_ship_1) (STV 1.0 0.99))         ; the situation with this polarity persists
    Inside would read "it is not the case that the shipping continues" = a cessation claim, wrong here.

Case 4, negation over the continuation — "Tom is not still waiting." = cessation (V16), no tag:

    (: tom_name  (Name tom "Tom") (STV 1.0 0.99))
    (: wait_ev   (Member sk_wait_1 wait) (STV 1.0 0.99))
    (: wait_ag   (Agent sk_wait_1 tom) (STV 1.0 0.99))
    (: wait_past (Past sk_wait_1) (STV 1.0 0.99))
    (: wait_neg  (And (Member sk_wait_1 wait) (Agent sk_wait_1 tom)) (STV 0.0 0.99))

RULED principle: an aspectual tag never enters a denial bundle (the bundle holds asserted
content only; the tag records a presupposition, which survives negation, exactly as Yet already
does); negation that targets the continuation itself is cessation, not a tag. Scope test: does
the "not" deny the event, or the continuing? Sub-corner to rule with the family: "not already
V-ed" (rare, ≈ "not yet") gets the same outside placement.

### Corner 2 — tense on a multi-atom copular denial (RULED, owner 2026-09-29: Option A — tense wraps each categorical atom, the denial bundles the wrapped atoms)

Baseline, one atom: "Alice was not happy." → `(: alice_not_happy (Past (Member alice happy)) (STV 0.0 0.99))`
(tense wraps the atom, negation is strength 0 on the same atom — the two existing rules compose).

Two atoms: "The loft was not a legal dwelling."

    (: loft_type (Member sk_loft_1 loft) (STV 1.0 0.99))     ; the referent's typing: presupposed, untensed, projects
    Option A (proposed): tense wraps each categorical atom, the denial bundles the wrapped atoms
    (: loft_neg (And (Past (Member sk_loft_1 dwelling)) (Past (Member sk_loft_1 legal))) (STV 0.0 0.99))
    Option B: tense wraps the bundle
    (: loft_neg (Past (And (Member sk_loft_1 dwelling) (Member sk_loft_1 legal))) (STV 0.0 0.99))

For A: the prompt's tense rule is per categorical atom ("wraps every categorical atom the clause
yields"); the positive "The loft was a legal dwelling" is two separately wrapped atoms, and the
denial is those same atoms bundled; the query "Was the loft a legal dwelling?" is built per atom,
`(And (Member $l loft) (Past (Member $l dwelling)) (Past (Member $l legal)))` pinned at 0, and
matches A directly; and it mirrors the event case, where `(Past e)` is a conjunct inside the
bundle — tense always sits inside the denial (P06 layer 2 inside layer 3). The same per-atom
rule extends to Future and the modal wrappers.

### Corner 3 — a focus atom on a denied prejacent (RULED, owner 2026-09-29: negated focus = strength 0 on the focus atom, prejacent asserted; focus over a denial = bundle + atom outside; negated cleft = agentless backgrounded event + Cleft at 0; either / neither → Also)

What "not" targets decides the shape; the particle largely fixes it.

(a) "not" targets the FOCUS claim — "Not only Sara passed." (also VP focus: "did not only pass"):
    prejacent asserted, the focus atom itself at strength 0

    (: sara_name (Name sara "Sara") (STV 1.0 0.99))
    (: pass_ev   (Member sk_pass_1 pass) (STV 1.0 0.99))
    (: pass_ag   (Agent sk_pass_1 sara) (STV 1.0 0.99))
    (: pass_past (Past sk_pass_1) (STV 1.0 0.99))
    (: only_neg  (Only sara sk_pass_1) (STV 0.0 0.99))     ; exclusivity denied; "others too" stays unasserted

(b) "not" targets the PREJACENT — "Only Sara did not pass." / "Sara did not pass either." /
    "Not even Sara passed." / "Sara did not even try.": denial bundle + the focus atom positive OUTSIDE
    (the corner-1 principle: a tag never enters the bundle)

    (: sara_name (Name sara "Sara") (STV 1.0 0.99))
    (: pass_neg  (And (Member sk_pass_1 pass) (Agent sk_pass_1 sara) (Past sk_pass_1)) (STV 0.0 0.99))
    (: only_sara (Only sara sk_pass_1) (STV 1.0 0.99))     ; the exclusive focus holds of the denied eventuality

    "either" / "neither did X" = the negative-polarity form of "too / also" → head `Also` (surface word
    recorded nowhere else; proposed mapping). "not even" always denies the prejacent (Even outside);
    "not only" always denies the focus (a); "only … not" denies the prejacent (b).

(c) negated cleft — "It was not Sara who passed.": the backgrounded clause is asserted with its
    agent unstated (someone passed), the identification is denied on the focus atom; no Agent atom for
    Sara in either polarity (her non-passing follows only with exhaustivity, which stays closure-gated)

    (: sara_name (Name sara "Sara") (STV 1.0 0.99))
    (: pass_ev   (Member sk_pass_1 pass) (STV 1.0 0.99))
    (: pass_past (Past sk_pass_1) (STV 1.0 0.99))
    (: cleft_neg (Cleft sara sk_pass_1) (STV 0.0 0.99))

Why not the focus atom inside the bundle: `(And … (Only sara e)) (STV 0.0)` reads "it is not the case
that only Sara passed" — that is reading (a), which already has its own form, and it would leave (b)
inexpressible. Proposed ruling: negated focus = strength 0 on the focus atom with the prejacent
asserted; focus over a denial = bundle + the atom positive outside; negated cleft = agentless
backgrounded event + Cleft at 0; "either / neither" → `Also`.

### Corner 4 — a connective whose endpoint is a denied event (RULED, owner 2026-09-29: link positive at top level, polarity in the endpoint; link denied only on the corrective "not because X, but because Y"; temporal relations inside the bundle)

The prompt already parses each endpoint "as usual — classes, roles, tense, negation" and emits one
top-level `(Head main sub)`; it does not say what happens when an endpoint's atoms sit inside a
strength-0 bundle, nor what "not … because" denies.

(a) the subordinate clause is denied — "The latch stuck because the hinge was not oiled."

    (: latch_type (Member sk_latch_1 latch) (STV 1.0 0.99))
    (: hinge_type (Member sk_hinge_1 hinge) (STV 1.0 0.99))
    (: stick_ev   (Member sk_stick_1 stick) (STV 1.0 0.99))
    (: stick_pat  (Patient sk_stick_1 sk_latch_1) (STV 1.0 0.99))
    (: stick_past (Past sk_stick_1) (STV 1.0 0.99))
    (: oil_neg    (And (Member sk_oil_1 oil) (Patient sk_oil_1 sk_hinge_1) (Past sk_oil_1)) (STV 0.0 0.99))
    (: conn       (Because sk_stick_1 sk_oil_1) (STV 1.0 0.99))   ; the link is positive; polarity lives in the endpoint

(b) the main clause is denied, default reading — "The alarm did not sound because the battery was flat."
    = [not sound] because [flat]: negation stays inside the main clause, the link stays outside

    (: alarm_type (Member sk_alarm_1 alarm) (STV 1.0 0.99))
    (: batt_type  (Member sk_battery_1 battery) (STV 1.0 0.99))
    (: sound_neg  (And (Member sk_sound_1 sound) (Agent sk_sound_1 sk_alarm_1) (Past sk_sound_1)) (STV 0.0 0.99))
    (: flat_st    (Member sk_flat_1 flat) (STV 1.0 0.99))          ; copular endpoint → reified state + flat
    (: flat_exp   (Experiencer sk_flat_1 sk_battery_1) (STV 1.0 0.99))
    (: flat_past  (Past sk_flat_1) (STV 1.0 0.99))
    (: flat_flat  (Past (Member sk_battery_1 flat)) (STV 1.0 0.99))
    (: conn       (Because sk_sound_1 sk_flat_1) (STV 1.0 0.99))

(c) the LINK is denied, only on the corrective cue "not because X, but because Y" —
    "The alarm did not sound because the battery was flat, but because the wire snapped."
    the sounding is asserted; the wrong reason's link is at strength 0, the right one positive;
    the corrective "but" emits no adversative atom (consumed by the construction)

    (: sound_ev   (Member sk_sound_1 sound) (STV 1.0 0.99))  (: sound_ag (Agent sk_sound_1 sk_alarm_1) (STV 1.0 0.99))  (: sound_past (Past sk_sound_1) (STV 1.0 0.99))
    … the flat state reified as in (b) (asserted: the battery WAS flat) …
    (: wire_type  (Member sk_wire_1 wire) (STV 1.0 0.99))  (: snap_ev (Member sk_snap_1 snap) (STV 1.0 0.99))  (: snap_pat (Patient sk_snap_1 sk_wire_1) (STV 1.0 0.99))  (: snap_past (Past sk_snap_1) (STV 1.0 0.99))
    (: conn_neg   (Because sk_sound_1 sk_flat_1) (STV 0.0 0.99))
    (: conn_pos   (Because sk_sound_1 sk_snap_1) (STV 1.0 0.99))

(d) the boundary: temporal relations are ATTACHMENTS (layer 2) and go inside the bundle —
    "The bus did not leave before the show."

    (: bus_type  (Member sk_bus_1 bus) (STV 1.0 0.99))
    (: show_type (Member sk_show_1 show) (STV 1.0 0.99))
    (: leave_neg (And (Member sk_leave_1 leave) (Agent sk_leave_1 sk_bus_1) (Past sk_leave_1) (Before sk_leave_1 sk_show_1)) (STV 0.0 0.99))

Proposed ruling: a non-temporal connective atom is a top-level positive link between endpoint
symbols; each endpoint carries its own polarity in its own bundle; negation inside an endpoint
never moves the link; the link itself is denied only on the explicit corrective cue "not because
X, but (because) Y" (`(Because main x)` at 0 + the positive link to Y, no `But` atom); temporal
relations stay inside the bundle. A seeded `ReasonFor` derived from a link whose reason endpoint
is denied binds that symbol — the intended reading ("because it did not …"); consumers read the
polarity off the endpoint's bundle, exactly as for the tags of corners 1 and 3.

### Corner 5 — negation of a disjunction (RULED, owner 2026-09-29: "not … or" = neither by default, distributed one denial per disjunct; never a denied bundle with Or inside; "at least one did not" = gap G17 until the #10 fragment carrier)

The prompt has "neither A nor B → one strength-0 fact per disjunct" (copular section) and the
generic "wrap the event's atoms at strength 0", but nothing on "not … or" over an event, and
nothing on a disjunction whose disjuncts are themselves denials.

(a) default reading of "not … or" = NEITHER (De Morgan): distribute into one denial per disjunct,
    a fresh event witness each (the distributive-coordination rule applied to a denied "and")
    "Bob did not order tea or coffee."

    (: bob_name   (Name bob "Bob") (STV 1.0 0.99))
    (: order_neg1 (And (Member sk_order_1 order) (Agent sk_order_1 bob) (Theme sk_order_1 tea) (Past sk_order_1)) (STV 0.0 0.99))
    (: order_neg2 (And (Member sk_order_2 order) (Agent sk_order_2 bob) (Theme sk_order_2 coffee) (Past sk_order_2)) (STV 0.0 0.99))

    Rejected: one bundle with the Or inside, `(And (Member e order) (Agent e bob) (Or (Theme e tea)
    (Theme e coffee)) (Past e)) (STV 0.0 …)` — the same truth conditions, but "Did Bob order tea?"
    pinned at 0 can never match it, and the Or's opacity protects nothing once the whole is denied.
    Indefinite disjuncts keep their witness typing inside each bundle (P05).

(b) copular: "The vase is not red or blue." → `(Member sk_vase_1 vase)` + `(Member sk_vase_1 red)`
    at 0 + `(Member sk_vase_1 blue)` at 0. VP disjunction "did not sing or dance" → two denial
    bundles. "neither … nor" and "not … either A or B" are the explicit forms of the same reading.

(c) the OTHER reading, "at least one did not" ("Bob or Alice did not come"; "didn't order tea or
    coffee, I forget which") needs a disjunction whose disjuncts are denials — polarity cannot sit
    inside an Or term (the same limitation as G05 for seals), and the narrow form
    `(And (Member e come) (Or (Agent e bob) (Agent e alice)) (Past e))` at 0 would wrongly say
    neither came. No licensed form → new gap code G17: parse the referents (`Name` / typing),
    report the clause as UNMAPPED G17, assert nothing for the disjunction.

Proposed ruling: negation over an inclusive "or" reads as neither by default and distributes,
one denial per disjunct (fresh witnesses for verbal predications, per-atom strength 0 for
copular); never a denied bundle with `(Or …)` inside; the "at least one did not" reading is a
registered gap (G17) until a polarity carrier inside Or exists.

#### Corner 5 addendum — how the gap closes once a polarity carrier exists (the #10 fragment design)

No new head: `Or` / `Xor` take FRAGMENT IDS instead of terms, and each alternative's content is
stored as per-statement carriers with their own truth values, `(: n (InFragment <alt-id> <P>) (STV s c))`
(working name from the #10 addendum; negation inside = strength 0, uniform with the main space).
Shared atoms stay top level (true under every alternative, as Interpretation already does).

    Bob ordered tea or coffee.            (positive, for the shape)
    (Member sk_order_1 order) (Agent sk_order_1 bob) (Past sk_order_1)          ; top level
    (: order_or (Or alt_1a alt_1b) (STV 1.0 0.99))
    (: a1 (InFragment alt_1a (Theme sk_order_1 tea)) (STV 1.0 0.99))
    (: b1 (InFragment alt_1b (Theme sk_order_1 coffee)) (STV 1.0 0.99))

    Bob or Alice did not come.            (G17 today: at least one did not)
    (: or_1 (Or alt_2a alt_2b) (STV 1.0 0.99))
    (: a1 (InFragment alt_2a (And (Member sk_come_1 come) (Agent sk_come_1 bob) (Past sk_come_1))) (STV 0.0 0.99))
    (: b1 (InFragment alt_2b (And (Member sk_come_2 come) (Agent sk_come_2 alice) (Past sk_come_2))) (STV 0.0 0.99))

Mixed polarity ("either Bob came or Alice did not") = one alternative at 1, one at 0. `Xor` over
the same fragments; the hand-written rule-out implications become one seeded rule over Xor once
projection exists. Verified already (design_sealed_fragments_probe.py @ b0e24f9): isolation,
retrieval with own TVs, enumeration, skolem sharing — none Or-specific. Engine-gated: "at least
one alternative holds" needs the #10 projection primitive; "possibly" answers = the #48
marginalisation ask. Corner 5's neither ruling is unchanged (a conjunction of denials needs no
container). G17 retires into a disjunction template (J04) when the #10 pack lands — never
piecemeal (#10: all sealing constructs migrate in ONE pack after FP4); alternative ids take an
`alt_` stem (P07).

### Corner 6 — a disjunction inside a seal (RULED, owner 2026-09-29: positive Or seals by composition; scope follows the coordination site; Xor inside a seal = label only; negated disjunction → corner 5 then the wholly-negative-complement drop; projection unchanged)

A POSITIVE disjunction inside a seal is already expressible by composition: the `Or` is a term
constructor, so it nests wherever the disjunction template puts it, and the seal takes the whole.

(a) narrow, inside the sealed And — "Nadia believes that Bob or Alice took the key."

    (: nadia_name (Name nadia "Nadia") (STV 1.0 0.99))  (: bob_name (Name bob "Bob") (STV 1.0 0.99))  (: alice_name (Name alice "Alice") (STV 1.0 0.99))
    (: key_type   (Member sk_key_1 key) (STV 1.0 0.99))                     ; definite inside the seal: projects
    (: bel_ev     (Member sk_believe_1 believe) (STV 1.0 0.99))
    (: bel_exp    (Experiencer sk_believe_1 nadia) (STV 1.0 0.99))
    (: bel_th     (Theme sk_believe_1 (And (Member sk_take_1 take) (Or (Agent sk_take_1 bob) (Agent sk_take_1 alice))
                                           (Theme sk_take_1 sk_key_1) (Past sk_take_1))) (STV 1.0 0.99))

(b) wide, clause-level inside the seal — "Nadia believes that the server crashed or the network failed."
    the sealed term is the Or itself (a single term), each disjunct an `(And …)`; definites project

    (: bel_th (Theme sk_believe_1 (Or (And (Member sk_crash_1 crash) (Patient sk_crash_1 sk_server_1) (Past sk_crash_1))
                                      (And (Member sk_fail_1 fail) (Patient sk_fail_1 sk_network_1) (Past sk_fail_1)))) (STV 1.0 0.99))
    (note: the prompt's own wide-Or example still writes `Agent` for crash / fail — it predates the FP4
    unaccusative-subject boundary; the registry audit is what catches such stale examples)

(c) scope follows the coordination site — "Nadia believes Bob took the key, or she believes Alice did."
    = a TOP-LEVEL wide Or over two attitude bundles, each with its own seal; never an Or inside one seal

(d) Xor inside a seal = the LABEL only — "Nadia believes that the door is either open or closed."

    (: door_type (Member sk_door_1 door) (STV 1.0 0.99))
    (: bel_th    (Theme sk_believe_1 (Xor (Member sk_door_1 open) (Member sk_door_1 closed))) (STV 1.0 0.99))
    The two rule-out implications are NOT emitted: inside the seal they cannot carry their own strength 0
    (G05), and at top level they would assert the exclusivity in the main space. Registered loss until the
    #10 fragment pack (then they become fragment statements, or one seeded rule over Xor).

(e) a NEGATED disjunction inside a seal: corner 5 distributes it into denials, which are negative content
    → the existing wholly-negative-complement rule applies (complement dropped, G05); the "at least one
    did not" reading is G17 as outside a seal. Projection unchanged throughout: definites and names
    project, an indefinite stays inside its own branch inside the seal.

Proposed ruling: (1) a positive disjunction seals by composition, narrow inside the sealed And or as
the sealed term itself for a clause-level Or; (2) the Or's scope follows its coordination site
(inside the that-clause → inside the seal; coordinating two attitude clauses → a top-level wide Or
over two attitude bundles); (3) Xor inside a seal emits the label only, the rule-out implications
are a registered loss until fragments; (4) a negated disjunction inside a seal follows corner 5 and
then the wholly-negative-complement rule; (5) projection rules unchanged. Under the #10 design a
sealed disjunction becomes an Or statement inside the fragment whose alternatives are fragments of
their own (fragments nest by id).

## Counting rule

A template is one distinct trigger → emission mapping that can fire on its own and be wrong on its
own. Closed value choices made inside a template (which role, which status head, which focus head,
which strength) are PARAMETERS of that template and live in the P-tables, not separate templates.
Procedures that emit nothing (coreference resolution, symbol formation) are listed but not counted.

## Independence: what it means and what it does not

Templates are independent in TRIGGER and in OWNERSHIP, not in emission.

- Trigger partition, per layer: for one constituent, at most one predication template claims a
  clause, at most one entity template claims an NP, and each operator kind applies at most once
  to one target. Two templates may not both claim the same constituent at the same layer. This is
  the property the overlap audit checks.
- Atom ownership: every emitted atom is owned by exactly one instance, the one that emitted it,
  so a wrong atom traces to exactly one template (its trigger, its slot filling, or its emission
  spec). Where the current prompt makes two forms coexist on purpose (the dual-emits: a reified
  state plus its flat atom, a factive's sealed and asserted P, a deictic plus its calendar atoms,
  a negated plural's group event plus its rule) ONE template emits both atoms; the other template
  is not fired a second time. Coreference (E11) keeps one instance per referent, so a name
  mentioned three times still yields one Name atom.
- Emission is compositional, not disjoint: a template's atoms reference symbols minted by other
  templates, operators wrap or bundle other templates' atoms, and the projection table decides on
  which side of a seal or denial a referent's atoms land. The output of a sentence is a function
  of the whole instance tree under the nesting order P06, never the union of independent outputs.

## Slot types

| type | meaning |
|---|---|
| Ind | an individual symbol: name-derived (E01) or a witness (E02 / E03) |
| Kind | lowercase lemma naming a class |
| Prop | lowercase lemma naming a property |
| Ev | an eventuality witness minted by V01 or V02 (`sk_<verb>_n`, `sk_<prop>_n`) |
| Prp | a proposition: a set of template instances, used by seals, denials and rules |
| Term | calendar term `(Year n)` `(Month m)` `(Day n)` `(Weekday w)` `(Hour h)` `(Minute n)` `(Quarter n y)`, or a deictic / day-part constant |
| Num / Unit / Str | native number / lemmatized singular unit / double-quoted surface string |
| Var | a `$`-variable inside a rule |
| Head | a closed-class relation head (UpperCamelCase) |

## Proposed record shape for one template

id · family · trigger (the semantic condition, and what it is NOT for) · slots (typed) · emits (atom
patterns) · tv (which P-dial applies) · composes (which templates fill its slots, which operators may
wrap it) · loss (what is deliberately dropped) · examples (sentence → instance → atoms; regression
sentences are never reused as examples).

## Proposed parser output under templates

One instance record per fired template, plus one UNMAPPED record per clause no template claims:

    {"t":"E01","id":"bob","name":"Bob"}
    {"t":"V01","id":"e1","verb":"cook","roles":{"Agent":"bob","Patient":"dinner"}}
    {"t":"O01","on":"e1","head":"Past"}
    {"t":"T02","on":"e1","const":"yesterday"}
    {"t":"O03","over":["e1"]}
    {"t":"UNMAPPED","span":"…","code":"G04"}

Emission (atoms, STVs, proof names, witness indices, operator nesting) is code, never the parser.

---

## E — entities (NP level)

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| E01 | ★ | proper noun: the capitalized run, internal particles kept, kinship or courtesy title kept in the string, occupational premodifier and post-nominal tags excluded | sym, Str, optional Kind read off the words | `(Name sym "…")` exactly once; `(Member sym kind)` only when a kind word is stated inside or beside the name | multi-word name = one symbol, no compound decomposition; same-named distinct entities → `_1/_2`; numeral-initial → `addr_` prefix; a capitalized plural label ("the Wrens") = Name-only, no GroupOf; a capitalized bare kind word as sole label ("the Assembly") is a common noun → E02 |
| E02 | ★ | indefinite, definite or demonstrative singular NP; pronoun or demonstrative with no antecedent (`person` / `thing`, never by gender); one-anaphora | Kind, [Prop…] | `(Member sk_<kind>_n kind)` + `(Member sk prop)` per incidental modifier | definiteness only affects coreference (E11); indices continue past CONTEXT; bridging definite → E07 |
| E03 | ★ | definite, demonstrative or possessed plural; bare plural subject or participating object of an episodic clause; collective noun; antecedentless plural pronoun | g, Kind, [members] | `(GroupOf g kind)`; collective noun `(Member g noun)` (+ GroupOf only if the member kind is stated); named members `(PartOf m g)` | the group is an individual: a member property is never predicated of g (→ R03); counts → N01–N03 |
| E04 | ★ | bare plural or mass generic subject; non-specific object ("pays tax"); kind-level argument | Kind | no atom; the lemma fills the slot | selects C02 / C08 / R01 on the clause side |
| E05 | ★ | modifier + head noun naming a genuine subtype (classifying noun, term of art, nationality, role title, material adjective; solid spellings) | compound, head, [mod] | `(Inheritance compound head)` always; `(Inheritance compound mod)` iff the modifier is a predicable adjective; no genus when the IS-A fails (`hot_dog`); coordinated premodifiers → both fused kinds | not for incidental description (E02 + C01), names, part-whole (E07); decompose once, to single words |
| E06 |  | verb_object action inside `(can …)` / `(obligated …)` / `(permitted …)` | comp, verb, obj | `(Inheritance comp verb) (Patient comp obj)` | an event-form verb + object needs nothing extra |
| E07 |  | part-whole: "car engine", "the car's engine", "engine of the car", bridging definite ("the engine" after a car) | part Kind, whole Ind | `(Member part kind) (PartOf part whole)` | geography is never PartOf (→ C14) |
| E08 | ★ | 's, possessive pronoun, possessive of-phrase, relational noun (sister of, capital of), proper-noun premodifier on a common head ("a Northgate spokesman") | possessed Ind, possessor Ind | `(Possession possessed possessor)` | never an `own` event; not for partitives (N04), measures, "photo of", nominalization objects (V01 `Of` oblique), event-noun subject genitives (a role) |
| E09 |  | agent-nominalization fused from the surface (`egg_layer`) or used as the copular predicate | nom, verb, [obj] | `(Inheritance nom (can verb))` + `(Verb nom obj)` when an object is incorporated | referring uses stay plain kinds; two tests (suffix strips to a verb; "one who Vs" by definition) |
| E10 |  | lowercase adjective before a place name ("coastal Calderwick") | Prop, place | `(Member sk_zone_n prop) (LocatedIn sk_zone_n place)` | a capitalized modifier joins the name instead (E01) |
| E11 |  | coreference resolution: pronoun, anaphoric definite, reflexive, event anaphora, cataphora, contrastive some/others, CONTEXT antecedents, mid-discourse naming | — | symbol reuse; naming adds `(Name x "…")` | procedure, not counted |
| E12 |  | age appositive ", 43," | person, Num | `(Measure person old 43 year)` | an M01 instance |

## X — symbol formation (procedures, not counted)

X01 lemmatize inflection (verbs base, nouns singular, adjectives base). X02 derivation kept
(`coastal` ≠ `coast`; a participle used as a modifier is an adjective; `-ly` Manner adverbs keep
the surface form). X03 phrasal verb = one `verb_particle` symbol, no genus, no synonym. X04 idiom
coherence test → one surface symbol (`spill_the_beans`), never unpacked. X05 multiword heads
CamelCase-joined (`NextTo`, `AsAResult`, `InOrderTo`). X06 casing: heads UpperCamelCase, terms
snake_case, property constructors lowercase `(can v)`, term constructors UpperCamelCase, `forKind`.

## C — categorical / copular predications

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| C01 | ★ | an individual (name, witness, group-as-object) is a kind or has a property | Ind, Kind or Prop | `(Member x k)` | tense / modality wraps via O01; plural subjects never here (→ R03 or C02) |
| C02 | ★ | a kind is a kind or has a property: bare-plural generic, "every / all / most / many / few N are P", definitional "a dog is a mammal" | Kind, Kind or Prop, quantity | `(Inheritance k p)` strength by P01, confidence by P02 | + C03 when a quantifier word is present; striking minority 0.2–0.3; never for a definite plural (E03) or a partitive (N05) |
| C03 | ★ | an explicit quantifier or frequency word on a kind claim or a rule | Kind, pred, Str | `(QuantifierPhrase kind pred "word") (STV 1.0 0.99)` | one per explicit phrase; none for an existential subject or "every time"; "no / none" gets one, plain "not" does not |
| C04 |  | "not all / not every N is P" (or V) | — | E02 witness + the predication at strength 0 | copular or verbal |
| C05 |  | "neither A nor B" | — | one strength-0 fact per disjunct | |
| C06 |  | copular denial of a multi-atom predicate ("not a legal dwelling") | Ind, atoms | `(And (Member x dwelling) (Member x legal)) (STV 0.0 …)` | never split the bundle |
| C07 |  | non-distributing kind-level property (extinct, widespread, common, rare, endangered …) | Kind, Prop | `(KindProperty kind prop)` | test: could one individual be it? |
| C08 |  | bare relational generic, both arguments bare kinds ("mosquitoes carry malaria") | Head, KindA, KindB | `(Carry mosquito malaria) (STV 0.9 0.9)` | opaque, never distributes; an adjectivally restricted subject → R01; an indefinite / definite singular → V01 |
| C09 |  | a kind's property holding only under a condition; a locative / domain restriction on a kind claim; a circumstantial modifier on a kind norm | Kind, Prop or property term, cond | `(ConditionalProperty kind prop cond)`; compound condition decomposed | no bare Inheritance beside it |
| C10 |  | deontic norm over a kind (must / may / must not / required / forbidden), active or passive wording | Kind, action | `(Inheritance kind (obligated action))` / `(permitted action)`; prohibition = permitted at strength 0; elided action → bare `permitted` property | E06 decomposes the action; defeasible → C12 with the general at 0.9 |
| C11 |  | capability generic "Ns can V" | Kind, verb | `(Inheritance kind (can verb))` | an individual's capability is O01 `Can` |
| C12 |  | generic plus sub-kind exception ("birds can fly, but penguins can't") | general, sub, prop | general at (0.9 0.9) + `(Inheritance sub kind) (1.0 0.99)` + the exception at the opposite strength, confidence 0.99 | consumes the but / except connective (no L01 atom); a definitional general admits no exception |
| C13 |  | stative mutual predicate by meaning (friends, similar to, married to) | Head, a, b | `(Rel a b) (Symmetric Rel)` | eventive symmetric verbs stay collective events (V17); group version → R08 |
| C14 | ★ | where a thing is: "X is a village in Y", stative locative and postural verbs, "there was a ledger on the workbench", entity-attached "from" | Ind, place, prep | containment prep → `(LocatedIn e place)`; any other prep → entity-attached surface head `(On e place)`; origin → `(From e place)`; framing PP → `(In claim field)` | no event minted; tense wraps; never both LocatedIn and Location; a creating event takes Location only |
| C15 |  | adjective with a PP complement ("full of silt", "responsible for") | subj, Prop, prep, comp | V02 state + `(Of state comp)` + flat `(Member subj prop)`; kind-level with a bare-kind complement → fused `sensitive_to_light` + decomposition + flat Inheritance | dual-emit |
| C16 |  | appositive typing ("Halvard, a wheelwright, …") | — | C01 under the host clause's O01 wrapper | |
| C17 |  | a property of a partitive subset | subset, Prop | `(Inheritance subset prop)` | the one deliberate exception to individual → Member |

## V — eventualities

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| V01 | ★ | any verbal clause, action or state (own, know, list, hold), that is not copular, not a bare position clause (C14) and not a light verb over an event noun (V14) | verb Kind, roles {Head → Ind or Kind or Ev}, [status] | `(Member e verb)` + one `(Role e filler)` per participant | roles by P03; passive = the active's roles, agentless omits Agent; expletive "it" dropped; a prepositional verb's object → `(Prep e obj)`; Manner only for how-adverbs; vague duration adverb → `(Duration e word)`; other adverbs → G02 |
| V02 | ★ | a state that needs an eventuality anchor (triggers in P04) | subj, Prop | `(Member sk_<prop>_n prop) (Experiencer sk_<prop>_n subj)` + flat `(Member subj prop)` | dual-emit; the approximator (D11) drops the flat half; never on a group object (→ R03) |
| V03 |  | participial post-modifier, a reduced relative ("the rules concerning the levy") | — | V01 with the noun in its role, no tense | genuine -ing prepositions (during, pending) are not this |
| V04 |  | resultative and change of state: "painted it white", "kept it shut" (+ Still), "became a landmark", "turned into a museum" | event, obj, result Prop or Kind | object (subject, for become) as Patient; V02 result state on the same symbol; `(Result e state)` | plural object → the flat half becomes an R03 rule; depictive → plain state, no Result; motion result → Source / Goal only; unclear → no Result |
| V05 | ★ | thought / speech verb with a finite that-clause; direct quotation | holder, verb, Prp | `(Member e verb) (Experiencer e holder) (Theme e <sealed P>)` + P05 projection | non-factive: no predication of P at top level; a wholly negative complement → G05 (Theme dropped); credibility never makes a verb factive |
| V06 |  | factive verb (know, realize, discover, regret …) | as V05 | V05 + P's atoms asserted at top level | dual-emit |
| V07 |  | control verb + to-infinitive (try, want, decide, refuse, manage …) | matrix, complement Ev | complement event at top level, `(Theme matrix compl)`, no status on it (a perfect infinitive → Past), the controller's role copied in | matrix keeps its ordinary roles; never sealed |
| V08 |  | impersonal report "is considered / said / thought to be P" | Prp | attitude event with no Experiencer + sealed P + projection | hedging adverb → confidence 0.9 |
| V09 |  | "according to S, P" | source, Prp | `(AccordingTo <sealed P> source)` + projection | never the oblique |
| V10 |  | perception verb + bare-infinitive or participial complement | perceiver, verb, complement Ev | both events asserted; `(Stimulus perc compl)`; participial → `(Ongoing compl)`; the complement has no tense of its own | see / hear / feel → Experiencer, watch / observe / notice → Agent; negation wraps the whole bundle; seem / appear → O01 epistemic on the complement |
| V11 |  | indirect question (wonder whether, know who …) | holder, verb, Prp with gap | attitude event + `(Theme e (Whether P))` or `(Theme e (Question wh P))` | never `(Might P)`; the gap never leaks |
| V12 |  | imperative | commanded Ev | `(Directive <sealed event>)` / `(Forbid …)`; vocative inside as Agent; real objects typed at top level | no tense, no addressee witness |
| V13 |  | causation verbs (cause, prevent … from) and periphrastic causatives (have / get / make / let X V) | causer, matrix verb, caused Ev | matrix event with `(Theme matrix caused)`; causee = the caused event's Agent for a bare / to-infinitive, Patient for a past participle | the caused event has no status of its own |
| V14 |  | light verb over an event noun (occurred, took place); an event noun used only as a temporal anchor | noun witness | no `occur` event: tense and Time on the noun witness; anchor use: class + ordering only | |
| V15 |  | inception "began / started to V" | subject, activity Ev | begin event + `(Theme begin act)` + `(Ongoing act)`; Past on both if past | surface lemma kept |
| V16 |  | cessation "no longer / not anymore / used to"; "stopped / quit V-ing" | state Ev | state atoms + `(Past e)` + a same-symbol strength-0 `(And class + roles)` without Past; stopped / quit → an eventive stop event + the activity, both Past | "until" → T12 End instead |
| V17 | ★ | coordination: clause / VP; NP conjunction (distributive by default); collective predicates or "together / jointly" | — | independent instances per conjunct (shared subject carried); distributive → one predication per conjunct, a shared object one symbol; collective → one event with several Agent atoms | a plural pronoun distributes; comitative "with" → CoAgent |
| V18 |  | definite or bare-plural episodic subject | — | E03 group + V01 with the group as filler | + R03 when the predicate is distributive and the plural is counted or grouped |

## O — operators on one predication

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| O01 | ★ | tense / aspect / modality on a finite clause | Ev or atom; head ∈ {Past, Future, Ongoing, Can, Might, Probably, Must, Obligated, Permitted} | `(Head e)`; on a copular, comparative, measure or position atom → `(Head (atom))` | finite only; Ongoing needs one of four markers; futurate needs evidence (T05); a bare epistemic → no tense, confidence 0.9; should → Obligated 0.7; prohibition → Permitted 0.0; would: embedded Future / refusal denial with Past / irrealis → G04; could → Can or Permitted + Past, or Might |
| O02 |  | again / still / already / yet | Ev | `(Again e)` `(Still e)` `(Already e)` `(Yet e)` | RULED 2026-09-29: a tag never enters a denial bundle (it records a presupposition, which survives negation); "not still V" = cessation V16, no tag; "again" scoping over a denial collapses into the tag-outside form (loss: sense, G16); the presupposed event is never asserted |
| O03 | ★ | explicit not / n't / never / no on an event | Prp | one `(And <every atom of the event, status and time included>) (STV 0.0 …)`; copular → strength 0 on the same atom; multi-atom copular → the bundle of the individually tense-wrapped atoms `(And (Past (Member x a)) (Past (Member x b))) (STV 0.0 …)` (RULED 2026-09-29) | subject parsed as in the positive; definites project, indefinites stay inside (P05); a negated plural keeps the group event and the rule, both at 0; antonyms are not negation |
| O04 |  | seal mechanics, used by V05–V12 and L05 | Prp | nest as one term: a single atom, or `(And …)`; fresh variables per sealed rule | P05 projection. RULED 2026-09-29: a positive `Or` nests inside the sealed term by composition (or is the sealed term for a clause-level Or); `Xor` inside a seal = the label only (rule-out implications a registered loss until fragments); a negated disjunction inside a seal → corner 5 then the wholly-negative-complement drop (G05) |
| O05 |  | genuine two-reading equipoise (attachment, lexical sense, idiom vs literal) | readings | shared atoms once; `(Interpretation rN (: name atom (STV …)))` per reading-specific atom; each reading complete | not for representation doubt, garbling or scope |

## R — rules (Implication)

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| R01 | ★ | non-modal verbal generic or universal over a kind ("birds fly", "every student read a book") | Kind, verb, roles | `(Implication (Member $x kind) (And (Member (sk_v $x) v) (Role (sk_v $x) $x) …))`, strength by P01 (frequency adverbs too), confidence 0.9 or 0.99; + C03 | striking → 0.2–0.3; modals → C10 / C11; copular universals → C02 or R03 |
| R02 |  | "Ns don't V"; "none of the Ns V" | as R01 | R01 at strength 0; companion "no" / "none" | "not every" → C04 |
| R03 | ★ | distribution over a specific group: explicit universal "all the / each of the Ns", a counted or definite plural with a distributive predicate, a copular universal over a group | g, predicate | `(Implication (PartOf $x g) (And …))`, confidence 0.9; a counted plural keeps its group event beside it; copular → the conclusion is the property atom | a singular collective noun never distributes; a collective predicate never distributes |
| R04 |  | two or more quantifiers over a relation | — | ∀∃ → a Skolem function of every scoping universal; ∃∀ → a shared constant; ∀∀ → two premises; a number under a universal → Skolem group + Cardinality | "the same / a certain" forces the constant; genuine ambiguity → first quantifier wide |
| R05 |  | relational universal with a copular conclusion ("everyone who owns a dog is a pet owner") | — | event atoms in the premises, `(Member $x kind)` conclusion | |
| R06 |  | donkey anaphora | — | relative clause in the premises; the pronoun is the rule variable | |
| R07 |  | "every time / whenever P, Q"; bare "when" with generic referents; gerund-subject generic | trigger Prp, response | trigger as premises, response as a per-occurrence Skolem consequent, `(During (sk_q $x) $x)` | no companion; specific referents → two events ordered (T08 / T13) |
| R08 |  | reciprocal over an unnamed group; group-wide symmetric predicate | g or Kind, verb | `(Implication (And (Member $x k) (Member $y k) (Compute == ($x $y) -> false)) (And (Member (sk_v $x $y) v) …))`; a literal-head conclusion for a symmetric predicate | named participants → one V01 per ordered pair |
| R09 |  | indicative conditional "if P, Q" | Prp, Prp | Implication rule | "unless / if not" → G09 |
| R10 |  | disjunction in a rule condition | — | one rule per disjunct | |
| R11 |  | comparative correlative "the ADJ-er X, the ADJ-er Y" | Kind, scales | `(Implication (And (Member $x k) (Member $y k) (More s1 $x $y)) (More s2 $x $y))`; inverse swaps | |
| R12 |  | well-formedness: premises bind through plain variables; Skolem terms only in conclusions; status inside the consequent; fresh variables per sealed rule | — | constraint, not counted | |

## N — counts and partitives

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| N01 | ★ | numeral, both, a pair, a dozen, a couple, "exactly n" | g, Num | `(Cardinality g n)` | both = 2, definite |
| N02 |  | more than / at least / fewer than / at most n | g, Num | `(CardinalityAtLeast g n)` / `(CardinalityAtMost g n)`, ±1 for strict | |
| N03 |  | vague count (a few, several, dozens, a lot of Ns) | g, Str | `(CardinalityPhrase g "phrase")` | no number; seeded rules map it |
| N04 |  | "k of the Ns" | G, S, Num | `(GroupOf G kind)` [+ Cardinality] `(GroupOf S kind) (SubsetOf S G) (Cardinality S k)`; the predicate on S | universals are not partitives (R03) |
| N05 |  | "most / half / 40% / two-thirds of the Ns" | G, S, level | subset + `(ProportionOf S G level)`, level = word, `(Fraction n d)` or `(Fraction p 100)` | a property → C17 |
| N06 |  | mass partitive "half of the cake" | W, P, level | `(Member P mass) (PartOf P W) (ProportionOf P W level)` | |
| N07 |  | "the rest of / the remaining" | rest, whole | portion atoms + `(RestOf rest whole)` | |

## D — comparison and degree

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| D01 | ★ | comparative with a stated standard | scale, X, Y | `(More scale X Y)`; "less" swaps; an antonym keeps the surface scale | no positive entailed; attributive / elided standard → G01 |
| D02 |  | measured gap "3 cm taller" | + Num, Unit | `(MoreBy scale X Y n unit)` | rate units `kilometer_per_hour` |
| D03 |  | "twice / half as ADJ as" | + factor | `(TimesAs scale X Y f)` | |
| D04 |  | superlative; "one of the ADJ-est" | scale, X, class | `(Most scale X class) (Member X class)`; `(AmongMost …)` | bare "the tallest" → class person |
| D05 |  | ordinal "the third climber", "the first to respond" | entity, n, scale | `(Ordinal x n scale)`; last → `last` | |
| D06 |  | equative "as ADJ as" | scale, X, Y | `(SameDegree scale X Y)` | |
| D07 |  | adverbial comparative "swims faster than Mia" | two Ev | two V01 events + `(More scale e1 e2)` | |
| D08 |  | intensifier / downtoner; too / enough; "ADJ for a N" | X, scale, level | positive C01 + `(Degree X scale word)`; markers `excessive` / `sufficient` / `insufficient`; `(Degree X scale (forKind class))` without the positive | |
| D09 |  | "too ADJ to V" / "ADJ enough to V" | + Ev | D08 + the action as a strength-0 or positive capability / permission event (`Can` or `Permitted`) | |
| D10 |  | "too much / too little / enough N" | witness, marker | `(Degree n quantity marker)` | purpose consequence as D09 |
| D11 |  | approximator "almost / nearly"; minimizer "barely / little" | — | V02 without the flat half + `(Degree bearer adj almost)`; minimizer → strength 0.1 | |
| D12 |  | clausal quantity comparative "fewer guests attended than she invited" | two groups | two events with groups + `(More few g1 g2)` | |

## M — measures

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| M01 | ★ | a number on a dimension | entity, scale, Num, Unit | `(Measure x scale n unit)`; scale = the stated adjective, else the dimension noun, else `unspecified`; unit lemma singular, `percent` is a unit, rates `u_per_u`; plural bearer = aggregate | no positive entailed; tense wraps |
| M02 |  | at least / no more than / strict bound | | `(MeasureAtLeast …)` / `(MeasureAtMost …)` | |
| M03 |  | about / roughly | | `(ParticleFromNormal X σ)` in the magnitude slot, σ 10% tight / 20% loose | |
| M04 |  | scalar change (rose, fell, was up, from X to Y) | change Ev, figures | change event (bearer = Theme) + `(MeasureBy e scale n unit)` / `(MeasureFrom …)` / `(MeasureTo …)`; a restatement pair = two MeasureBy | never Goal, never a standing Measure |
| M05 |  | duration "for six hours", "lasted two days"; bare-plural "for days" | Ev | `(Measure e duration n unit)`; bare plural → `(MeasureAtLeast e duration 2 unit)` | vague adverb → `(Duration e word)` |

## T — time

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| T01 | ★ | calendar or clock expression | Ev, Terms | one `(Time e (Term))` per stated granularity | lowercase names, 24-hour; next / last Tuesday → Weekday only |
| T02 | ★ | deictic time (yesterday, tonight, last_week, now) | Ev, constant | `(Time e yesterday)`; with TODAY also the calendar atoms (dual-emit) | never a witness |
| T03 |  | day-part | Ev | `(Time e morning)`, composing with T01 | |
| T04 |  | approximate clock time | | `(Time e (Hour (ParticleFromNormal h σ)))` | |
| T05 |  | present-tense futurate with evidence (a date after TODAY, or a lexically future adjunct) | | `(Future e)` | absent evidence → no tense atom |
| T06 |  | anaphoric time NP ("that evening", "the following morning / week") | antecedent Ev | copy the antecedent's day terms + day-part; next / following → +1 + `(Before ant new)`; a missing level → `(BeforeBy ant new 1 unit)` | |
| T07 |  | habitual schedule / frequency | Ev | slot `(Time e (Weekday monday))` + `(Every e 1 week)`; periodic `(Every e n unit)`; rate `(TimesPer e n unit)`; event unmarked | |
| T08 | ★ | before / after + clause or event noun; "N units ago / from now" | two Ev | `(Before earlier later)` (after swaps); `(BeforeBy earlier later n unit)`; the `now` anchor | |
| T09 |  | past perfect with another asserted event | | Past on both + `(Before …)` | none if no other event; none across a seal |
| T10 |  | before / after / by + a date term | Ev, Term | `(TimeAtMost e term)` / `(TimeAtLeast e term)`, strict bounds decrement / increment by name; day-part constants; `(Quarter n y)` | a superseded bound → the operative one only |
| T11 |  | backward window "in the past six months" | | `(WithinLast e n unit)` | |
| T12 |  | interval from / to, until, since | | `(Start e term)` `(End e term)`; since → Start (+ Ongoing) | |
| T13 |  | during / while / throughout | inner, outer | `(During inner outer)` | "in July" → T01; "in the final round" → In oblique |
| T14 |  | copular clause with a time modifier | | V02 + Time + Past + the wrapped flat atom | dual-emit |

## L — inter-clause links

| id | ★ | trigger | slots | emits | notes |
|---|---|---|---|---|---|
| L01 | ★ | explicit non-temporal connective (because, so, although, but, yet, as a result, therefore …) | main Ev, sub Ev, Head | `(Because main sub)` etc., main clause first, multiword CamelCase | temporal connectives → T08 / T13; discourse-initial → G06; exception "but" → C12. RULED 2026-09-29: the link is a top-level POSITIVE atom whatever the endpoints' polarity (each endpoint keeps its own denial bundle); "not … because" = negation inside the main clause by default; the link at strength 0 only on the corrective "not because X, but (because) Y" (+ positive link to Y; that "but" emits no atom); temporal relations are attachments and go inside the bundle |
| L02 |  | purpose infinitive | main, purpose Ev | `(To main purpose)` / `(InOrderTo …)` | degree infinitives → D09; result infinitives → G07 |
| L03 |  | belief-reason "thought P, so Q" | | `(So think_ev q_ev)` with P sealed | |
| L04 |  | a copular endpoint of a connective | | V02 + flat | |
| L05 |  | counterfactual had / would have | ant Prp, cons Prp | `(Counterfactual (And ant) (And cons))` + the antecedent at strength 0 | the consequent asserted neither way |

## J — disjunction

| id | ★ | trigger | emits | notes |
|---|---|---|---|---|
| J01 | ★ | "or" over a constituent | narrow `(Or (Role e a) (Role e b))` inside ONE `(And …)` fact; an indefinite entity's typing inside its own `(And …)` branch; property disjunction `(Or (Member x red) (Member x blue))` | inclusive by default; disjuncts never asserted alone. RULED 2026-09-29 under negation: "not … or" = neither, distributed into one denial per disjunct (fresh event witness each; per-atom strength 0 for copular); never a denied bundle with `(Or …)` inside; "at least one did not" → G17 |
| J02 |  | "or" over independent clauses sharing nothing | wide `(Or (And …) (And …))` | |
| J03 |  | exclusivity cue ("but not both", "either … or" over contradictory states) | `(Xor a b)` + two strength-0 Implications when both disjuncts are atomic; the label only when a disjunct is complex | inside a seal: the label only (RULED 2026-09-29); the engine has no native Xor, the implications are the host-side exclusivity |

## F — focus

| id | ★ | trigger | emits | notes |
|---|---|---|---|---|
| F01 |  | only / just / solely; even; also / too / as well, and their negative-polarity forms either / neither; it-cleft / pseudo-cleft | prejacent asserted normally + `(Only filler e)` / `(Even …)` / `(Also …)` / `(Cleft …)`; VP focus → the verb lemma; ellipsis reconstructed | no exclusion rule, no presupposition asserted; "only one N" → G08. RULED 2026-09-29 under negation: "not only" = the focus atom at strength 0 with the prejacent asserted; "only … not", "not even", "either / neither" = denial bundle + the focus atom positive outside; negated cleft = backgrounded event asserted agentless + `(Cleft x e)` at 0 |
| F02 |  | focus particle on a copular clause | V02 as the anchor + the focus atom on the state witness | |

## Q — queries (the mirror side; one per statement family)

| id | trigger | shape |
|---|---|---|
| Q01 | any question | yes/no = the whole proposition; wh → a `$`-variable; a named individual bound by `(Name $x "…")`; the wh answer variable bare; negative pin `(STV 0.0 $conf)`; a definite common noun bound by its kind; compound questions: one query when parts share a referent, one line each when independent; disjunctive → one line per disjunct |
| Q02 | capability | kind subject → `(Inheritance kind (can v))`; individual → union of `(Can $e)` and `(Member $r (can v))`; with an object → the event form |
| Q03 | counting | `(Cardinality $g $n)`; bounded via `Compute`; union with `CardinalityAtLeast` / `AtMost`; `FoldAll` for totals; partitives via `SubsetOf` / `ProportionOf` |
| Q04 | measure | bind the magnitude; threshold = `Compute` ∪ `GreaterThan`; canonical-unit comparison; in-query conversion factors; temperature affine |
| Q05 | time | When (open Time); what year / day / time (inside the term); before / after a date = union with the bounds; `MonthNumber` / `WeekdayNumber` joins; hour-with-minutes split; order of two events (Before + join branch); how long before (BeforeBy); duration; ongoing at T (Start ≤ T ≤ End) |
| Q06 | frequency | `Every` ∪ `TimesPer`; what day → the slot term |
| Q07 | cessation / inception | did X V (Past); still (bare present, graded); stopped (pin 0); when did X stop (End ∪ stop event) |
| Q08 | possession | always `(Possession possessed possessor)` |
| Q09 | sealed content | attitude, perception, embedded question, Directive, Xor, Only: rebuild the stored term with variables |
| Q10 | explanation | `(ReasonFor $r focus)`, `(PurposeOf $g focus)`, how = the chain, why-not = the pinned focus |
| Q11 | comparison | More / Most / MoreBy / TimesAs bindings; disjunctive comparatives one line each |

## G — named gap and loss codes (the parser reports these instead of improvising)

| code | construction | current instruction |
|---|---|---|
| G00 | any clause no template claims and no registered code names | report `{"t":"UNMAPPED","span":…,"code":"G00","construction":"<one sentence naming the construction>"}`; the parser never mints a code |
| G01 | attributive or elided-standard comparative ("a sturdier bracket") | no licensed form; record the gap |
| G02 | sequence / scope-domain / degree-on-verb adverbs; frequency comparison on an episode | no slot; record the gap |
| G03 | party / district post-nominal tag; secondary identifiers | dropped (loss) |
| G04 | irrealis relative clause or lone would-have consequent | unencoded; record the gap |
| G05 | wholly negative attitude complement; a negated conjunct inside a seal | dropped; registered limitation |
| G06 | discourse-initial connective | parse the clause, no atom |
| G07 | result / outcome infinitive (non-scalar) | both events, no link |
| G08 | "only one N" | exact Cardinality, particle dropped |
| G09 | unless / if-not conditional | unsupported |
| G10 | stay / remain + locative continuation | position atom, no continuation carrier |
| G11 | verbatim wording of quotations | not preserved (loss by design) |
| G12 | rich in-seal grammar (possessor / Of links inside seals) | stays sealed; awaiting the fragment redesign |
| G13 | adjective / condition compounds ("solid_at_room_temperature") | left opaque |
| G14 | "exactly n" closure | not encoded (open-world reading) |
| G15 | exhaustivity closure for only / clefts | closure-gated, not fired |
| G16 | "again" scoping over a denial ("Again, X did not V") | same atoms as "X did not V again"; loss of sense by design (ruled 2026-09-29) |
| G17 | a disjunction of denials, "at least one did not" ("Bob or Alice did not come") | no polarity carrier inside `Or`; parse the referents, report the clause UNMAPPED G17, assert nothing for the disjunction (ruled 2026-09-29); retires into a disjunction template when the #10 fragment pack lands |

Lifecycle of gap codes: G01–G15 are only the cases the current prompt already names, not an
exhaustive list; the reviewers' q2 gap reports hold many more. New gaps arrive as G00 records with
the construction sentence. Downstream, G00 reports are clustered (mechanically where possible,
by an agent for the judgment part, like the M1 diagnosis brief) and the OWNER promotes a cluster
to a new registered code, or to a new template when a licensed form is decided. A code is
retired, kept as history, when a template covers it. Parsers report gaps; they never edit codes.

## P — shared parameter tables

| table | content |
|---|---|
| P01 strength dial | all / every 1.0; bare generic 0.9; most 0.9; a lot 0.8; many 0.7; few 0.1; no / none 0.0; always 1.0; usually / often 0.8; sometimes 0.5; rarely 0.1; striking minority 0.2–0.3; barely 0.1; should 0.7 |
| P02 confidence dial | individual facts 0.99; definitional 0.99; empirical generic 0.9; epistemic 0.9; exception 0.99 over a general at 0.9; hedged generality 0.9; never 1.0 |
| P03 roles and tests | Agent (any transitive subject, even inanimate or stative; self-powered intransitive); Patient (created / destroyed / consumed / changed; occurrence objects; artifacts reworked; intransitive change of state; natural processes); Theme (unchanged object; un-powered relocation; the default); Recipient (transfer goal, addressee); Experiencer (stative subject incl. a reified property state; the progressive test); Stimulus; Holder (own / have / lack only); CoAgent vs Instrument; Location / Time / Manner / Source / Goal / Beneficiary; preposition-named oblique = the surface preposition, object NP parsed normally |
| P04 reification triggers (V02) | resultative result; connective endpoint; time modifier; adjective PP complement; focus particle; progressive, manner or time on a postural |
| P05 projection | out of a denial: everything presupposed (typing, Name, a definite's possessor / Of); out of a seal: typing of definites and names, definitional decomposition atoms, a factive's full P; nothing else |
| P06 operator nesting order | the P06 section below; the one decision the current prompt left implicit — its six corners were RULED 2026-09-29 (rulings live in the registry; prompt.txt carries them only via a fix-pack) |
| P07 naming | proof names snake_case unique; witnesses `sk_<kind>_<n>` per class, continuing past CONTEXT |
| P08 unit factors | belong to seeded_rules, not to templates |

## Count

| family | counted templates |
|---|---|
| E entities | 11 |
| C categorical / copular | 17 |
| V eventualities | 18 |
| O operators | 5 |
| R rules | 11 |
| N counts | 7 |
| D comparison / degree | 12 |
| M measures | 5 |
| T time | 14 |
| L links | 5 |
| J disjunction | 3 |
| F focus | 2 |
| **statement side** | **110** |
| Q query mirrors | 11 |
| G gap codes | 15 |
| X procedures / P tables | 6 / 8 |

Starter set (★): E01 E02 E03 E04 E05 E08 · C01 C02 C03 C14 · V01 V02 V05 V17 · O01 O03 · R01 R03 ·
N01 · D01 · M01 · T01 T02 T08 · L01 · J01 = 26 templates, plus UNMAPPED with the G codes.
