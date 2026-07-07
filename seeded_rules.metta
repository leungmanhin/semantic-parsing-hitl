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

; Property-form (kind-norm) obligation implies permission:
;   Inheritance(k, obligated a)  ⟹  Inheritance(k, permitted a)
(: oblig_perm_prop (Implication (Premises (Inheritance $k (obligated $a)))
   (Conclusions (Inheritance $k (permitted $a)))) (STV 1.0 0.99))

; ... and at the member level. Native member-inheritance does NOT fire off a rule-DERIVED
; Inheritance, so the kind-level permission above never reaches a member; derive member-permission
; directly from the member-obligation that member-inheritance DOES produce:
;   Member(x, obligated a)  ⟹  Member(x, permitted a)
(: oblig_perm_mem (Implication (Premises (Member $x (obligated $a)))
   (Conclusions (Member $x (permitted $a)))) (STV 1.0 0.99))

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

; differential gaps add along a chain (same unit):
;   MoreBy(s,x,y,a,u), MoreBy(s,y,z,b,u) => MoreBy(s,x,z,a+b,u)
(: morebydiff_trans (Implication (Premises (MoreBy $s $x $y $a $u) (MoreBy $s $y $z $b $u)
   (Compute + ($a $b) -> $c)) (Conclusions (MoreBy $s $x $z $c $u))) (STV 1.0 0.99))

; a multiplicative comparative entails the plain ordering, by the factor's side of 1:
;   TimesAs(s,x,y,f), f>1 => More(s,x,y) ;  f<1 => More(s,y,x)
(: ratio_more_gt (Implication (Premises (TimesAs $s $x $y $f) (Compute > ($f 1) -> true))
   (Conclusions (More $s $x $y))) (STV 1.0 0.99))
(: ratio_more_lt (Implication (Premises (TimesAs $s $x $y $f) (Compute < ($f 1) -> true))
   (Conclusions (More $s $y $x))) (STV 1.0 0.99))

; a multiplicative comparative + a known measure of Y derives the measure of X:
;   TimesAs(s,x,y,f), Measure(y,s,m,u) => Measure(x,s,f*m,u)
(: ratio_measure (Implication (Premises (TimesAs $s $x $y $f) (Measure $y $s $m $u)
   (Compute * ($m $f) -> $r)) (Conclusions (Measure $x $s $r $u))) (STV 1.0 0.99))

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

; ===== Temporal scaffolding =====

; "before" is transitive:  Before(x,y), Before(y,z)  ⟹  Before(x,z)
(: before_trans (Implication (Premises (Before $x $y) (Before $y $z))
   (Conclusions (Before $x $z))) (STV 1.0 0.99))

; a measured gap entails the plain ordering:  BeforeBy(x,y,n,u)  ⟹  Before(x,y)
(: beforeby_before (Implication (Premises (BeforeBy $x $y $n $u))
   (Conclusions (Before $x $y))) (STV 1.0 0.99))

; gaps add along a chain (same unit):
;   BeforeBy(x,y,a,u), BeforeBy(y,z,b,u)  ⟹  BeforeBy(x,z,a+b,u)
(: beforeby_trans (Implication (Premises (BeforeBy $x $y $a $u) (BeforeBy $y $z $b $u)
   (Compute + ($a $b) -> $c)) (Conclusions (BeforeBy $x $z $c $u))) (STV 1.0 0.99))

; a clock interval's length (same-day Start/End hours):
;   Start(e, Hour s), End(e, Hour n)  ⟹  Measure(e, duration, n−s, hour)
(: interval_duration_hour (Implication (Premises (Start $e (Hour $s)) (End $e (Hour $n))
   (Compute - ($n $s) -> $d)) (Conclusions (Measure $e duration $d hour))) (STV 1.0 0.99))

; a year interval's length:  Start(e, Year s), End(e, Year n)  ⟹  duration n−s years
(: interval_duration_year (Implication (Premises (Start $e (Year $s)) (End $e (Year $n))
   (Compute - ($n $s) -> $d)) (Conclusions (Measure $e duration $d year))) (STV 1.0 0.99))

; ===== Month lexicon =====
; Month names stay symbols inside Time terms; these facts supply the number for
; ordering/threshold queries via a join:
;   (Time $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 7) -> true)
(: mn_january (MonthNumber january 1) (STV 1.0 0.99))
(: mn_february (MonthNumber february 2) (STV 1.0 0.99))
(: mn_march (MonthNumber march 3) (STV 1.0 0.99))
(: mn_april (MonthNumber april 4) (STV 1.0 0.99))
(: mn_may (MonthNumber may 5) (STV 1.0 0.99))
(: mn_june (MonthNumber june 6) (STV 1.0 0.99))
(: mn_july (MonthNumber july 7) (STV 1.0 0.99))
(: mn_august (MonthNumber august 8) (STV 1.0 0.99))
(: mn_september (MonthNumber september 9) (STV 1.0 0.99))
(: mn_october (MonthNumber october 10) (STV 1.0 0.99))
(: mn_november (MonthNumber november 11) (STV 1.0 0.99))
(: mn_december (MonthNumber december 12) (STV 1.0 0.99))
