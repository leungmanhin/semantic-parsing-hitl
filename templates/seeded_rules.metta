;; Seeded background rules for the catalog's atoms.
;;
;; These rules state what the parse deliberately leaves out: inferences the text licenses but
;; does not state. They are loaded beside the emitted statements by a consumer (the chainer),
;; never by the parser. One rule per inference, with the atoms it reads and writes named in its
;; comment. The legacy instruction set has its own seeded rules file at the repository root; this
;; one belongs to the catalog.
;;
;; Every rule carries an explicit conditional truth value, (CTV <P(B|A)> <P(B|not A)>), the
;; chainer's documented form for a conditional relationship: the positive branch is the rule's
;; own strength and confidence (0.99 for a congruence or an arithmetic rule, 0.9 for a
;; generalization a later fact can revise), the negative branch (STV 0.0 1.0) says the rule
;; contributes nothing when its premise fails. A plain (STV …) on a rule makes the chainer
;; estimate the negative branch from base rates over the stored facts of the conclusion's
;; predicate, and a conclusion drawn from a premise below strength 1.0 — a coreference link, a
;; graded generalization — then comes out at strength 1.0 with its confidence collapsed. The
;; explicit branch carries the premise's truth value instead (0.95 in, 0.95 out).

;; A change's named result holds afterwards:  (Result e (Member x s))  =>  (Member x s)
;; Reads the sealed Result term a change-of-state instance emits ("became a locksmith",
;; "got wet"); binds x and s inside the term. "Became" says what the change was into; that
;; it still holds is this rule's claim, at 0.9.
(: result_holds (Implication (Result $e (Member $x $s)) (Member $x $s)) (CTV (STV 1.0 0.9) (STV 0.0 1.0)))
;; Coreference: a stated link (Coref mention antecedent) carries the mention's facts to the antecedent
;; at the link's strength (its probability of identity), and back.
(: coref_sym (Implication (Coref $a $b) (Coref $b $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_agent (Implication (And (Coref $m $a) (Agent $e $m)) (Agent $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_patient (Implication (And (Coref $m $a) (Patient $e $m)) (Patient $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_theme (Implication (And (Coref $m $a) (Theme $e $m)) (Theme $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_recipient (Implication (And (Coref $m $a) (Recipient $e $m)) (Recipient $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_experiencer (Implication (And (Coref $m $a) (Experiencer $e $m)) (Experiencer $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_stimulus (Implication (And (Coref $m $a) (Stimulus $e $m)) (Stimulus $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_holder (Implication (And (Coref $m $a) (Holder $e $m)) (Holder $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_goal (Implication (And (Coref $m $a) (Goal $e $m)) (Goal $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_source (Implication (And (Coref $m $a) (Source $e $m)) (Source $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_location (Implication (And (Coref $m $a) (Location $e $m)) (Location $e $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_member (Implication (And (Coref $m $a) (Member $m $k)) (Member $a $k)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_possession (Implication (And (Coref $m $a) (Possession $x $m)) (Possession $x $a)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: coref_locatedin (Implication (And (Coref $m $a) (LocatedIn $m $p)) (LocatedIn $a $p)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
;; Dates: a deictic time is an offset from the text's reference time (the anchor `now`), and the
;; anchor carries calendar fields when the caller states the date. Within one month the day number
;; follows by arithmetic; month and year are carried at 0.9 (no boundary handling yet: a time n days
;; before the 1st needs a days-in-month table and a previous-month rule, and weekdays need modular
;; arithmetic — follow-ups).
(: days_before_day (Implication (And (BeforeBy $t $a $n day) (Day $a $d) (Compute - ($d $n) -> $e)) (Day $t $e)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: days_after_day (Implication (And (BeforeBy $a $t $n day) (Day $a $d) (Compute + ($d $n) -> $e)) (Day $t $e)) (CTV (STV 1.0 0.99) (STV 0.0 1.0)))
(: days_before_month (Implication (And (BeforeBy $t $a $n day) (Month $a $m)) (Month $t $m)) (CTV (STV 1.0 0.9) (STV 0.0 1.0)))
(: days_before_year (Implication (And (BeforeBy $t $a $n day) (Year $a $y)) (Year $t $y)) (CTV (STV 1.0 0.9) (STV 0.0 1.0)))
(: days_after_month (Implication (And (BeforeBy $a $t $n day) (Month $a $m)) (Month $t $m)) (CTV (STV 1.0 0.9) (STV 0.0 1.0)))
(: days_after_year (Implication (And (BeforeBy $a $t $n day) (Year $a $y)) (Year $t $y)) (CTV (STV 1.0 0.9) (STV 0.0 1.0)))