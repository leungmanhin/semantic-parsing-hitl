;; Seeded background rules for the catalog's atoms.
;;
;; These rules state what the parse deliberately leaves out: inferences the text licenses but
;; does not state. They are loaded beside the emitted statements by a consumer (the chainer),
;; never by the parser, and they carry confidence 0.9: each is a generalization a later fact
;; can revise. One rule per inference, with the atoms it reads and writes named in its comment.
;; The legacy instruction set has its own seeded rules file at the repository root; this one
;; belongs to the catalog.

;; A change's named result holds afterwards:  (Result e (Member x s))  =>  (Member x s)
;; Reads the sealed Result term a change-of-state instance emits ("became a locksmith",
;; "got wet"); binds x and s inside the term. "Became" says what the change was into; that
;; it still holds is this rule's claim, at 0.9.
(: result_holds (Implication (Result $e (Member $x $s)) (Member $x $s)) (STV 1.0 0.9))

;; Coreference: a stated link (Coref mention antecedent) carries the mention's facts to the antecedent
;; at the link's strength (its probability of identity), and back.
(: coref_sym (Implication (Coref $a $b) (Coref $b $a)) (STV 1.0 0.99))
(: coref_agent (Implication (And (Coref $m $a) (Agent $e $m)) (Agent $e $a)) (STV 1.0 0.99))
(: coref_patient (Implication (And (Coref $m $a) (Patient $e $m)) (Patient $e $a)) (STV 1.0 0.99))
(: coref_theme (Implication (And (Coref $m $a) (Theme $e $m)) (Theme $e $a)) (STV 1.0 0.99))
(: coref_recipient (Implication (And (Coref $m $a) (Recipient $e $m)) (Recipient $e $a)) (STV 1.0 0.99))
(: coref_experiencer (Implication (And (Coref $m $a) (Experiencer $e $m)) (Experiencer $e $a)) (STV 1.0 0.99))
(: coref_stimulus (Implication (And (Coref $m $a) (Stimulus $e $m)) (Stimulus $e $a)) (STV 1.0 0.99))
(: coref_holder (Implication (And (Coref $m $a) (Holder $e $m)) (Holder $e $a)) (STV 1.0 0.99))
(: coref_goal (Implication (And (Coref $m $a) (Goal $e $m)) (Goal $e $a)) (STV 1.0 0.99))
(: coref_source (Implication (And (Coref $m $a) (Source $e $m)) (Source $e $a)) (STV 1.0 0.99))
(: coref_location (Implication (And (Coref $m $a) (Location $e $m)) (Location $e $a)) (STV 1.0 0.99))
(: coref_member (Implication (And (Coref $m $a) (Member $m $k)) (Member $a $k)) (STV 1.0 0.99))
(: coref_possession (Implication (And (Coref $m $a) (Possession $x $m)) (Possession $x $a)) (STV 1.0 0.99))
(: coref_locatedin (Implication (And (Coref $m $a) (LocatedIn $m $p)) (LocatedIn $a $p)) (STV 1.0 0.99))
