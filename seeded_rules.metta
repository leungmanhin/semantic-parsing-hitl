; seeded_rules.metta
; ---------------------------------------------------------------------------
; Background scaffolding for PeTTaChainer. These rules are NOT emitted by the
; translator (prompt.txt) — they are the reusable inference machinery the
; translated atoms rely on. Load ALL of them into the KB BEFORE any forward /
; backward chaining (e.g. Python `h.add_atom("(: ...)")` per rule, or MeTTa
; `!(compileadd <kb> (: ...))`).
;
; Confidence is 0.99 for definitional scaffolding (never 1.0). The cardinality-
; phrase rules carry a lower, tunable confidence because they stipulate a vague
; reading.
; ---------------------------------------------------------------------------

; ===== Taxonomy scaffolding =====

; Inheritance transitivity:  A⊑B , B⊑C  ⟹  A⊑C
(: inh_trans (Implication (Premises (Inheritance $a $b) (Inheritance $b $c))
   (Conclusions (Inheritance $a $c))) (STV 1.0 0.99))

; Member-of-superclass (x∈A , A⊑B ⟹ x∈B) is derived NATIVELY by the chainer
; (member-inheritance-implication), including strength-0 propagation — no seeded rule needed.

; ===== Deontic scaffolding =====

; Obligation implies permission:  Obligated(e)  ⟹  Permitted(e)
(: oblig_perm (Implication (Premises (Obligated $e))
   (Conclusions (Permitted $e))) (STV 1.0 0.99))

; ===== Cardinality-phrase lexicon =====
; The translator emits  (CardinalityPhrase g "<phrase>")  for a vague count word.
; These DEFEASIBLE rules give that phrase a numeric reading. Each is single-
; conclusion (so a two-sided band = two rules), to avoid multi-conclusion
; bundling. STV strength/confidence = how reliably the phrase implies the bound;
; lower bounds are surer than upper bounds. Tune freely.

; "a few" ≈ 2–4
(: cp_a_few_min (Implication (Premises (CardinalityPhrase $g "a few"))
   (Conclusions (CardinalityAtLeast $g 2))) (STV 1.0 0.8))
(: cp_a_few_max (Implication (Premises (CardinalityPhrase $g "a few"))
   (Conclusions (CardinalityAtMost $g 4))) (STV 0.7 0.6))

; "several" ≈ 3–7
(: cp_several_min (Implication (Premises (CardinalityPhrase $g "several"))
   (Conclusions (CardinalityAtLeast $g 3))) (STV 1.0 0.8))
(: cp_several_max (Implication (Premises (CardinalityPhrase $g "several"))
   (Conclusions (CardinalityAtMost $g 7))) (STV 0.6 0.5))

; "a handful" ≈ 3–6
(: cp_handful_min (Implication (Premises (CardinalityPhrase $g "a handful"))
   (Conclusions (CardinalityAtLeast $g 3))) (STV 0.9 0.7))
(: cp_handful_max (Implication (Premises (CardinalityPhrase $g "a handful"))
   (Conclusions (CardinalityAtMost $g 6))) (STV 0.6 0.5))

; "a lot of" / "lots of" ≳ 10  (normalize "lots of" → "a lot of")
(: cp_a_lot_of_min (Implication (Premises (CardinalityPhrase $g "a lot of"))
   (Conclusions (CardinalityAtLeast $g 10))) (STV 0.7 0.5))

; "dozens" ≥ 24
(: cp_dozens_min (Implication (Premises (CardinalityPhrase $g "dozens"))
   (Conclusions (CardinalityAtLeast $g 24))) (STV 1.0 0.8))

; "scores" ≥ 40
(: cp_scores_min (Implication (Premises (CardinalityPhrase $g "scores"))
   (Conclusions (CardinalityAtLeast $g 40))) (STV 1.0 0.7))

; "hundreds" ≥ 200
(: cp_hundreds_min (Implication (Premises (CardinalityPhrase $g "hundreds"))
   (Conclusions (CardinalityAtLeast $g 200))) (STV 1.0 0.8))

; ===== Comparative / degree scaffolding =====

; "more" is transitive on any scale:  More(s,x,y), More(s,y,z) ⟹ More(s,x,z)
(: more_trans (Implication (Premises (More $s $x $y) (More $s $y $z))
   (Conclusions (More $s $x $z))) (STV 1.0 0.99))

; "as ADJ as" (equative) is symmetric
(: samedegree_sym (Implication (Premises (SameDegree $s $x $y))
   (Conclusions (SameDegree $s $y $x))) (STV 1.0 0.99))

; a measured comparative entails the plain ordering:  MoreBy(s,x,y,n,u) => More(s,x,y)
(: morebydiff (Implication (Premises (MoreBy $s $x $y $n $u))
   (Conclusions (More $s $x $y))) (STV 1.0 0.99))

; ===== Symmetric-relation scaffolding =====

; A tagged symmetric relation holds both ways:  Symmetric(R), R(x,y) => R(y,x).
; The translator emits  (R a b)  +  (Symmetric R)  for a relation that is mutual by
; meaning ("are friends / siblings / similar"); this single rule symmetrizes any
; tagged relation (R's head is a variable).
(: sym_rel (Implication (Premises (Symmetric $r) ($r $x $y))
   (Conclusions ($r $y $x))) (STV 1.0 0.99))

; ===== Conditional-property scaffolding =====

; A property that holds only under a condition.  (ConditionalProperty k p c) means
; members of kind k have property p when they are also in the condition-state c.
(: cond_prop (Implication (Premises (ConditionalProperty $k $p $c) (Member $x $k) (Member $x $c))
   (Conclusions (Member $x $p))) (STV 1.0 0.99))

; ===== Unit-conversion scaffolding =====
; Each measure in a non-canonical unit derives its value in the dimension's canonical unit
; (length -> meter, mass -> kilogram, time -> second), so measures in different units can be
; compared. Conversions are definitional (linear scalar; affine units like temperature excluded).

; -- length -> meter --
(: foot_to_meter (Implication (Premises (Measure $x $s $m foot) (Compute * ($m 0.3048) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: inch_to_meter (Implication (Premises (Measure $x $s $m inch) (Compute * ($m 0.0254) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: yard_to_meter (Implication (Premises (Measure $x $s $m yard) (Compute * ($m 0.9144) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: mile_to_meter (Implication (Premises (Measure $x $s $m mile) (Compute * ($m 1609.344) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: centimeter_to_meter (Implication (Premises (Measure $x $s $m centimeter) (Compute * ($m 0.01) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: millimeter_to_meter (Implication (Premises (Measure $x $s $m millimeter) (Compute * ($m 0.001) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))
(: kilometer_to_meter (Implication (Premises (Measure $x $s $m kilometer) (Compute * ($m 1000.0) -> $r))
   (Conclusions (Measure $x $s $r meter))) (STV 1.0 0.99))

; -- mass -> kilogram --
(: gram_to_kilogram (Implication (Premises (Measure $x $s $m gram) (Compute * ($m 0.001) -> $r))
   (Conclusions (Measure $x $s $r kilogram))) (STV 1.0 0.99))
(: milligram_to_kilogram (Implication (Premises (Measure $x $s $m milligram) (Compute * ($m 0.000001) -> $r))
   (Conclusions (Measure $x $s $r kilogram))) (STV 1.0 0.99))
(: pound_to_kilogram (Implication (Premises (Measure $x $s $m pound) (Compute * ($m 0.453592) -> $r))
   (Conclusions (Measure $x $s $r kilogram))) (STV 1.0 0.99))
(: ounce_to_kilogram (Implication (Premises (Measure $x $s $m ounce) (Compute * ($m 0.0283495) -> $r))
   (Conclusions (Measure $x $s $r kilogram))) (STV 1.0 0.99))
(: ton_to_kilogram (Implication (Premises (Measure $x $s $m ton) (Compute * ($m 1000.0) -> $r))
   (Conclusions (Measure $x $s $r kilogram))) (STV 1.0 0.99))

; -- time -> second --
(: minute_to_second (Implication (Premises (Measure $x $s $m minute) (Compute * ($m 60.0) -> $r))
   (Conclusions (Measure $x $s $r second))) (STV 1.0 0.99))
(: hour_to_second (Implication (Premises (Measure $x $s $m hour) (Compute * ($m 3600.0) -> $r))
   (Conclusions (Measure $x $s $r second))) (STV 1.0 0.99))
(: day_to_second (Implication (Premises (Measure $x $s $m day) (Compute * ($m 86400.0) -> $r))
   (Conclusions (Measure $x $s $r second))) (STV 1.0 0.99))
(: week_to_second (Implication (Premises (Measure $x $s $m week) (Compute * ($m 604800.0) -> $r))
   (Conclusions (Measure $x $s $r second))) (STV 1.0 0.99))

; -- temperature -> kelvin (AFFINE: offset, not just a scale factor) --
(: celsius_to_kelvin (Implication (Premises (Measure $x $s $m celsius) (Compute + ($m 273.15) -> $r))
   (Conclusions (Measure $x $s $r kelvin))) (STV 1.0 0.99))
(: fahrenheit_to_kelvin (Implication (Premises (Measure $x $s $m fahrenheit)
   (Compute - ($m 32) -> $a) (Compute * ($a 5) -> $b) (Compute / ($b 9) -> $c) (Compute + ($c 273.15) -> $r))
   (Conclusions (Measure $x $s $r kelvin))) (STV 1.0 0.99))

; -- bounded measures convert the same way (the bound is a plain number; scaling preserves the
;    >=/<= sense). Same lexicon as plain Measure; extend to other units as needed. --
(: foot_atleast_m (Implication (Premises (MeasureAtLeast $x $s $m foot) (Compute * ($m 0.3048) -> $r)) (Conclusions (MeasureAtLeast $x $s $r meter))) (STV 1.0 0.99))
(: foot_atmost_m (Implication (Premises (MeasureAtMost $x $s $m foot) (Compute * ($m 0.3048) -> $r)) (Conclusions (MeasureAtMost $x $s $r meter))) (STV 1.0 0.99))
(: inch_atleast_m (Implication (Premises (MeasureAtLeast $x $s $m inch) (Compute * ($m 0.0254) -> $r)) (Conclusions (MeasureAtLeast $x $s $r meter))) (STV 1.0 0.99))
(: inch_atmost_m (Implication (Premises (MeasureAtMost $x $s $m inch) (Compute * ($m 0.0254) -> $r)) (Conclusions (MeasureAtMost $x $s $r meter))) (STV 1.0 0.99))
(: centimeter_atleast_m (Implication (Premises (MeasureAtLeast $x $s $m centimeter) (Compute * ($m 0.01) -> $r)) (Conclusions (MeasureAtLeast $x $s $r meter))) (STV 1.0 0.99))
(: centimeter_atmost_m (Implication (Premises (MeasureAtMost $x $s $m centimeter) (Compute * ($m 0.01) -> $r)) (Conclusions (MeasureAtMost $x $s $r meter))) (STV 1.0 0.99))
(: kilometer_atleast_m (Implication (Premises (MeasureAtLeast $x $s $m kilometer) (Compute * ($m 1000.0) -> $r)) (Conclusions (MeasureAtLeast $x $s $r meter))) (STV 1.0 0.99))
(: kilometer_atmost_m (Implication (Premises (MeasureAtMost $x $s $m kilometer) (Compute * ($m 1000.0) -> $r)) (Conclusions (MeasureAtMost $x $s $r meter))) (STV 1.0 0.99))
(: pound_atleast_kg (Implication (Premises (MeasureAtLeast $x $s $m pound) (Compute * ($m 0.453592) -> $r)) (Conclusions (MeasureAtLeast $x $s $r kilogram))) (STV 1.0 0.99))
(: pound_atmost_kg (Implication (Premises (MeasureAtMost $x $s $m pound) (Compute * ($m 0.453592) -> $r)) (Conclusions (MeasureAtMost $x $s $r kilogram))) (STV 1.0 0.99))
