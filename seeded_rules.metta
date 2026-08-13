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
(: inh_trans (Implication (And (Inheritance $a $b) (Inheritance $b $c)) (Inheritance $a $c)) (STV 1.0 0.99))

; Member-of-superclass (x∈A , A⊑B ⟹ x∈B) is derived NATIVELY by the chainer
; (member-inheritance-implication), including strength-0 propagation — no seeded rule needed.

; ===== Deontic scaffolding =====

; Obligation implies permission:  Obligated(e)  ⟹  Permitted(e)
(: oblig_perm (Implication (Obligated $e) (Permitted $e)) (STV 1.0 0.99))

; Property-form (kind-norm) obligation implies permission:
;   Inheritance(k, obligated a)  ⟹  Inheritance(k, permitted a)
(: oblig_perm_prop (Implication (Inheritance $k (obligated $a)) (Inheritance $k (permitted $a))) (STV 1.0 0.99))

; ... and at the member level. Native member-inheritance does NOT fire off a rule-DERIVED
; Inheritance, so the kind-level permission above never reaches a member; derive member-permission
; directly from the member-obligation that member-inheritance DOES produce:
;   Member(x, obligated a)  ⟹  Member(x, permitted a)
(: oblig_perm_mem (Implication (Member $x (obligated $a)) (Member $x (permitted $a))) (STV 1.0 0.99))

; ===== Cardinality-phrase lexicon =====
; The translator emits  (CardinalityPhrase g "<phrase>")  for a vague count word.
; These DEFEASIBLE rules give that phrase a numeric reading. Each is single-
; conclusion (so a two-sided band = two rules), to avoid multi-conclusion
; bundling. STV strength/confidence = how reliably the phrase implies the bound;
; lower bounds are surer than upper bounds. Tune freely.

; "a few" ≈ 2–4
(: cp_a_few_min (Implication (CardinalityPhrase $g "a few") (CardinalityAtLeast $g 2)) (STV 1.0 0.8))
(: cp_a_few_max (Implication (CardinalityPhrase $g "a few") (CardinalityAtMost $g 4)) (STV 0.7 0.6))

; "several" ≈ 3–7
(: cp_several_min (Implication (CardinalityPhrase $g "several") (CardinalityAtLeast $g 3)) (STV 1.0 0.8))
(: cp_several_max (Implication (CardinalityPhrase $g "several") (CardinalityAtMost $g 7)) (STV 0.6 0.5))

; "a handful" ≈ 3–6
(: cp_handful_min (Implication (CardinalityPhrase $g "a handful") (CardinalityAtLeast $g 3)) (STV 0.9 0.7))
(: cp_handful_max (Implication (CardinalityPhrase $g "a handful") (CardinalityAtMost $g 6)) (STV 0.6 0.5))

; "a lot of" / "lots of" ≳ 10  (normalize "lots of" → "a lot of")
(: cp_a_lot_of_min (Implication (CardinalityPhrase $g "a lot of") (CardinalityAtLeast $g 10)) (STV 0.7 0.5))

; "dozens" ≥ 24
(: cp_dozens_min (Implication (CardinalityPhrase $g "dozens") (CardinalityAtLeast $g 24)) (STV 1.0 0.8))

; "scores" ≥ 40
(: cp_scores_min (Implication (CardinalityPhrase $g "scores") (CardinalityAtLeast $g 40)) (STV 1.0 0.7))

; "hundreds" ≥ 200
(: cp_hundreds_min (Implication (CardinalityPhrase $g "hundreds") (CardinalityAtLeast $g 200)) (STV 1.0 0.8))

; ===== Comparative / degree scaffolding =====

; "more" is transitive on any scale:  More(s,x,y), More(s,y,z) ⟹ More(s,x,z)
(: more_trans (Implication (And (More $s $x $y) (More $s $y $z)) (More $s $x $z)) (STV 1.0 0.99))

; "as ADJ as" (equative) is symmetric
(: samedegree_sym (Implication (SameDegree $s $x $y) (SameDegree $s $y $x)) (STV 1.0 0.99))

; a measured comparative entails the plain ordering:  MoreBy(s,x,y,n,u) => More(s,x,y)
(: morebydiff (Implication (MoreBy $s $x $y $n $u) (More $s $x $y)) (STV 1.0 0.99))

; differential gaps add along a chain (same unit):
;   MoreBy(s,x,y,a,u), MoreBy(s,y,z,b,u) => MoreBy(s,x,z,a+b,u)
(: morebydiff_trans (Implication (And (MoreBy $s $x $y $a $u) (MoreBy $s $y $z $b $u) (Compute + ($a $b) -> $c)) (MoreBy $s $x $z $c $u)) (STV 1.0 0.99))

; a multiplicative comparative entails the plain ordering, by the factor's side of 1:
;   TimesAs(s,x,y,f), f>1 => More(s,x,y) ;  f<1 => More(s,y,x)
(: ratio_more_gt (Implication (And (TimesAs $s $x $y $f) (Compute > ($f 1) -> true)) (More $s $x $y)) (STV 1.0 0.99))
(: ratio_more_lt (Implication (And (TimesAs $s $x $y $f) (Compute < ($f 1) -> true)) (More $s $y $x)) (STV 1.0 0.99))

; a multiplicative comparative + a known measure of Y derives the measure of X:
;   TimesAs(s,x,y,f), Measure(y,s,m,u) => Measure(x,s,f*m,u)
(: ratio_measure (Implication (And (TimesAs $s $x $y $f) (Measure $y $s $m $u) (Compute * ($m $f) -> $r)) (Measure $x $s $r $u)) (STV 1.0 0.99))

; ===== Scale poles (antonym comparatives) =====
; An antonym comparative is stored on the SURFACE adjective, in surface argument order
; ("Bob is shorter than Alice" -> (More short bob alice)); these rules link the two poles
; of one dimension, so orderings on it still chain and a question worded from either pole
; matches. The translator emits neither ScaleOpposite nor the flipped atom.
;   (More short bob alice)  <=>  (More tall alice bob)

; the pole relation is mutual — one fact per dimension below supplies both directions
(: so_sym (Implication (ScaleOpposite $a $b) (ScaleOpposite $b $a)) (STV 1.0 0.99))

(: pole_more (Implication (And (ScaleOpposite $a $b) (More $a $x $y)) (More $b $y $x)) (STV 1.0 0.99))
(: pole_moreby (Implication (And (ScaleOpposite $a $b) (MoreBy $a $x $y $n $u)) (MoreBy $b $y $x $n $u)) (STV 1.0 0.99))
; The flipped PLAIN ordering needs no rule of its own: morebydiff gives the ordering on the
; stated pole and pole_more flips it. Do NOT add a direct MoreBy->More pole edge as well --
; two independently sufficient derivations of one goal make the query return NOTHING
; (repro bug_competing_derivations_return_empty.py).

; One fact per dimension (so_sym gives the reverse). Extend freely — a dimension with no
; pair here simply keeps its surface scale and does not chain with its opposite.
(: sp_tall      (ScaleOpposite short tall) (STV 1.0 0.99))
(: sp_strong    (ScaleOpposite weak strong) (STV 1.0 0.99))
(: sp_fast      (ScaleOpposite slow fast) (STV 1.0 0.99))
(: sp_expensive (ScaleOpposite cheap expensive) (STV 1.0 0.99))
(: sp_heavy     (ScaleOpposite light heavy) (STV 1.0 0.99))
(: sp_wide      (ScaleOpposite narrow wide) (STV 1.0 0.99))
(: sp_deep      (ScaleOpposite shallow deep) (STV 1.0 0.99))
(: sp_high      (ScaleOpposite low high) (STV 1.0 0.99))
(: sp_old       (ScaleOpposite young old) (STV 1.0 0.99))
(: sp_hot       (ScaleOpposite cold hot) (STV 1.0 0.99))
(: sp_bright    (ScaleOpposite dim bright) (STV 1.0 0.99))
(: sp_loud      (ScaleOpposite quiet loud) (STV 1.0 0.99))

; ===== Symmetric-relation scaffolding =====

; A tagged symmetric relation holds both ways:  Symmetric(R), R(x,y) => R(y,x).
; The translator emits  (R a b)  +  (Symmetric R)  for a relation that is mutual by
; meaning ("are friends / siblings / similar"); this single rule symmetrizes any
; tagged relation (R's head is a variable).
(: sym_rel (Implication (And (Symmetric $r) ($r $x $y)) ($r $y $x)) (STV 1.0 0.99))

; ===== Spatial scaffolding (2026-08-06, FUSE-NF gap G1) =====

; (LocatedIn thing place) is the STATIC location of an entity — where a thing is — as
; against the event oblique (Location event place), which says where an eventuality
; holds.  They are deliberately different heads: an entity's location is a state of a
; thing, an event's is a property of an eventuality, and merging them would make
; "what happened in Greece?" return villages.  These two rules are what buys the
; merge's convenience back without the conflation.

; Containment is transitive:  LocatedIn(a,b), LocatedIn(b,c)  ⟹  LocatedIn(a,c)
(: locin_trans (Implication (And (LocatedIn $a $b) (LocatedIn $b $c)) (LocatedIn $a $c)) (STV 1.0 0.99))

; ... and it carries an EVENT's location outward too, so an event located in a place is
; located in whatever contains that place:
;   Location(e,x), LocatedIn(x,y)  ⟹  Location(e,y)
; Without this, "the festival is held in Methoni, a village in Greece" answers "was it
; held in Greece?" with [] — the two links would never meet.
(: locin_event (Implication (And (Location $e $x) (LocatedIn $x $y)) (Location $e $y)) (STV 1.0 0.99))

; ===== Conditional-property scaffolding =====

; A property that holds only under a condition.  (ConditionalProperty k p c) means
; members of kind k have property p when they are also in the condition-state c.
(: cond_prop (Implication (And (ConditionalProperty $k $p $c) (Member $x $k) (Member $x $c)) (Member $x $p)) (STV 1.0 0.99))

; ===== Unit-conversion scaffolding =====
; Each measure in a non-canonical unit derives its value in the dimension's canonical unit
; (length -> meter, mass -> kilogram, time -> second), so measures in different units can be
; compared. Conversions are definitional (linear scalar; affine units like temperature excluded).

; -- length -> meter --
(: foot_to_meter (Implication (And (Measure $x $s $m foot) (Compute * ($m 0.3048) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: inch_to_meter (Implication (And (Measure $x $s $m inch) (Compute * ($m 0.0254) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: yard_to_meter (Implication (And (Measure $x $s $m yard) (Compute * ($m 0.9144) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: mile_to_meter (Implication (And (Measure $x $s $m mile) (Compute * ($m 1609.344) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: centimeter_to_meter (Implication (And (Measure $x $s $m centimeter) (Compute * ($m 0.01) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: millimeter_to_meter (Implication (And (Measure $x $s $m millimeter) (Compute * ($m 0.001) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))
(: kilometer_to_meter (Implication (And (Measure $x $s $m kilometer) (Compute * ($m 1000.0) -> $r)) (Measure $x $s $r meter)) (STV 1.0 0.99))

; -- mass -> kilogram --
(: gram_to_kilogram (Implication (And (Measure $x $s $m gram) (Compute * ($m 0.001) -> $r)) (Measure $x $s $r kilogram)) (STV 1.0 0.99))
(: milligram_to_kilogram (Implication (And (Measure $x $s $m milligram) (Compute * ($m 0.000001) -> $r)) (Measure $x $s $r kilogram)) (STV 1.0 0.99))
(: pound_to_kilogram (Implication (And (Measure $x $s $m pound) (Compute * ($m 0.453592) -> $r)) (Measure $x $s $r kilogram)) (STV 1.0 0.99))
(: ounce_to_kilogram (Implication (And (Measure $x $s $m ounce) (Compute * ($m 0.0283495) -> $r)) (Measure $x $s $r kilogram)) (STV 1.0 0.99))
(: ton_to_kilogram (Implication (And (Measure $x $s $m ton) (Compute * ($m 1000.0) -> $r)) (Measure $x $s $r kilogram)) (STV 1.0 0.99))

; -- time -> second --
(: minute_to_second (Implication (And (Measure $x $s $m minute) (Compute * ($m 60.0) -> $r)) (Measure $x $s $r second)) (STV 1.0 0.99))
(: hour_to_second (Implication (And (Measure $x $s $m hour) (Compute * ($m 3600.0) -> $r)) (Measure $x $s $r second)) (STV 1.0 0.99))
(: day_to_second (Implication (And (Measure $x $s $m day) (Compute * ($m 86400.0) -> $r)) (Measure $x $s $r second)) (STV 1.0 0.99))
(: week_to_second (Implication (And (Measure $x $s $m week) (Compute * ($m 604800.0) -> $r)) (Measure $x $s $r second)) (STV 1.0 0.99))

; -- temperature -> kelvin (AFFINE: offset, not just a scale factor) --
(: celsius_to_kelvin (Implication (And (Measure $x $s $m celsius) (Compute + ($m 273.15) -> $r)) (Measure $x $s $r kelvin)) (STV 1.0 0.99))
(: fahrenheit_to_kelvin (Implication (And (Measure $x $s $m fahrenheit) (Compute - ($m 32) -> $a) (Compute * ($a 5) -> $b) (Compute / ($b 9) -> $c) (Compute + ($c 273.15) -> $r)) (Measure $x $s $r kelvin)) (STV 1.0 0.99))

; -- bounded measures convert the same way (the bound is a plain number; scaling preserves the
;    >=/<= sense). Same lexicon as plain Measure; extend to other units as needed. --
(: foot_atleast_m (Implication (And (MeasureAtLeast $x $s $m foot) (Compute * ($m 0.3048) -> $r)) (MeasureAtLeast $x $s $r meter)) (STV 1.0 0.99))
(: foot_atmost_m (Implication (And (MeasureAtMost $x $s $m foot) (Compute * ($m 0.3048) -> $r)) (MeasureAtMost $x $s $r meter)) (STV 1.0 0.99))
(: inch_atleast_m (Implication (And (MeasureAtLeast $x $s $m inch) (Compute * ($m 0.0254) -> $r)) (MeasureAtLeast $x $s $r meter)) (STV 1.0 0.99))
(: inch_atmost_m (Implication (And (MeasureAtMost $x $s $m inch) (Compute * ($m 0.0254) -> $r)) (MeasureAtMost $x $s $r meter)) (STV 1.0 0.99))
(: centimeter_atleast_m (Implication (And (MeasureAtLeast $x $s $m centimeter) (Compute * ($m 0.01) -> $r)) (MeasureAtLeast $x $s $r meter)) (STV 1.0 0.99))
(: centimeter_atmost_m (Implication (And (MeasureAtMost $x $s $m centimeter) (Compute * ($m 0.01) -> $r)) (MeasureAtMost $x $s $r meter)) (STV 1.0 0.99))
(: kilometer_atleast_m (Implication (And (MeasureAtLeast $x $s $m kilometer) (Compute * ($m 1000.0) -> $r)) (MeasureAtLeast $x $s $r meter)) (STV 1.0 0.99))
(: kilometer_atmost_m (Implication (And (MeasureAtMost $x $s $m kilometer) (Compute * ($m 1000.0) -> $r)) (MeasureAtMost $x $s $r meter)) (STV 1.0 0.99))
(: pound_atleast_kg (Implication (And (MeasureAtLeast $x $s $m pound) (Compute * ($m 0.453592) -> $r)) (MeasureAtLeast $x $s $r kilogram)) (STV 1.0 0.99))
(: pound_atmost_kg (Implication (And (MeasureAtMost $x $s $m pound) (Compute * ($m 0.453592) -> $r)) (MeasureAtMost $x $s $r kilogram)) (STV 1.0 0.99))

; ===== Temporal scaffolding =====

; "before" is transitive:  Before(x,y), Before(y,z)  ⟹  Before(x,z)
(: before_trans (Implication (And (Before $x $y) (Before $y $z)) (Before $x $z)) (STV 1.0 0.99))

; a measured gap entails the plain ordering:  BeforeBy(x,y,n,u)  ⟹  Before(x,y)
(: beforeby_before (Implication (BeforeBy $x $y $n $u) (Before $x $y)) (STV 1.0 0.99))

; gaps add along a chain (same unit):
;   BeforeBy(x,y,a,u), BeforeBy(y,z,b,u)  ⟹  BeforeBy(x,z,a+b,u)
(: beforeby_trans (Implication (And (BeforeBy $x $y $a $u) (BeforeBy $y $z $b $u) (Compute + ($a $b) -> $c)) (BeforeBy $x $z $c $u)) (STV 1.0 0.99))

; a clock interval's length (same-day Start/End hours):
;   Start(e, Hour s), End(e, Hour n)  ⟹  Measure(e, duration, n−s, hour)
(: interval_duration_hour (Implication (And (Start $e (Hour $s)) (End $e (Hour $n)) (Compute - ($n $s) -> $d)) (Measure $e duration $d hour)) (STV 1.0 0.99))

; a year interval's length:  Start(e, Year s), End(e, Year n)  ⟹  duration n−s years
(: interval_duration_year (Implication (And (Start $e (Year $s)) (End $e (Year $n)) (Compute - ($n $s) -> $d)) (Measure $e duration $d year)) (STV 1.0 0.99))

; ===== Date-ordering scaffolding =====
; STRICT rules deriving (Before x y) from stored calendar terms. Guards: the month rule needs
; the SAME year on both events (shared $yr), the day rule the same year AND month — so a
; cross-year "march before june" can never fire wrongly. UNDATED comparisons (no year stated)
; are deliberately NOT seeded (a no-year rule would mis-fire across years); they stay
; query-side joins (see prompt.txt, Time questions).
(: date_before_year (Implication (And (Time $x (Year $a)) (Time $y (Year $b)) (Compute < ($a $b) -> true)) (Before $x $y)) (STV 1.0 0.99))
(: date_before_month (Implication (And (Time $x (Year $yr)) (Time $y (Year $yr)) (Time $x (Month $ma)) (MonthNumber $ma $na) (Time $y (Month $mb)) (MonthNumber $mb $nb) (Compute < ($na $nb) -> true)) (Before $x $y)) (STV 1.0 0.99))
(: date_before_day (Implication (And (Time $x (Year $yr)) (Time $y (Year $yr)) (Time $x (Month $mo)) (Time $y (Month $mo)) (Time $x (Day $da)) (Time $y (Day $db)) (Compute < ($da $db) -> true)) (Before $x $y)) (STV 1.0 0.99))

; ===== Weekday lexicon =====
; Weekday names stay symbols inside Time terms; these facts supply the number for
; ordering/threshold queries (monday=1 … sunday=7), like MonthNumber below.
(: wd_monday (WeekdayNumber monday 1) (STV 1.0 0.99))
(: wd_tuesday (WeekdayNumber tuesday 2) (STV 1.0 0.99))
(: wd_wednesday (WeekdayNumber wednesday 3) (STV 1.0 0.99))
(: wd_thursday (WeekdayNumber thursday 4) (STV 1.0 0.99))
(: wd_friday (WeekdayNumber friday 5) (STV 1.0 0.99))
(: wd_saturday (WeekdayNumber saturday 6) (STV 1.0 0.99))
(: wd_sunday (WeekdayNumber sunday 7) (STV 1.0 0.99))

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

; ===== Inter-clause connective bridge (2026-07-09) =====

; Statements store the SURFACE connective head, main clause first / subordinate
; second (see prompt.txt "Inter-clause connectives"). These rules derive the
; canonical ask-relations (ReasonFor <reason> <event>) / (PurposeOf <goal> <event>)
; that explanation QUERIES use; the two canonical heads never appear in translated
; statements. But / Although / Despite / Yet state no reason — no bridge.

(: rf_because (Implication (Because $m $s) (ReasonFor $s $m)) (STV 1.0 0.99))
(: rf_since (Implication (Since $m $s) (ReasonFor $s $m)) (STV 1.0 0.99))
(: rf_so (Implication (So $a $c) (ReasonFor $a $c)) (STV 1.0 0.99))
(: rf_asaresult (Implication (AsAResult $a $c) (ReasonFor $a $c)) (STV 1.0 0.99))
(: rf_therefore (Implication (Therefore $a $c) (ReasonFor $a $c)) (STV 1.0 0.99))
(: rf_consequently (Implication (Consequently $a $c) (ReasonFor $a $c)) (STV 1.0 0.99))
(: rf_thus (Implication (Thus $a $c) (ReasonFor $a $c)) (STV 1.0 0.99))
(: po_to (Implication (To $m $p) (PurposeOf $p $m)) (STV 1.0 0.99))
(: po_inorderto (Implication (InOrderTo $m $p) (PurposeOf $p $m)) (STV 1.0 0.99))
(: po_soasto (Implication (SoAsTo $m $p) (PurposeOf $p $m)) (STV 1.0 0.99))
(: rf_purpose (Implication (PurposeOf $p $m) (ReasonFor $p $m)) (STV 1.0 0.99))

; ===== Possession bridge (2026-07-27 review decision #3) =====

; A genitive stores (Possession <possessed> <possessor>) directly; a verbal
; "X has / owns Y" stores a have/own EVENT (Holder/Theme — the roles section
; restricts Holder to possession states, which gates these rules). Possession
; QUESTIONS always query the Possession form; these rules derive it from the
; verbal storages on demand. ("lack" is a Holder verb too but states absence —
; deliberately NO bridge.)

(: poss_have (Implication (And (Member $e have) (Holder $e $x) (Theme $e $y)) (Possession $y $x)) (STV 1.0 0.99))
(: poss_own (Implication (And (Member $e own) (Holder $e $x) (Theme $e $y)) (Possession $y $x)) (STV 1.0 0.99))
