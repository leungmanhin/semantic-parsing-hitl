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

; Member of a subclass is a member of the superclass:  x∈A , A⊑B  ⟹  x∈B
(: mem_inh (Implication (Premises (Member $x $a) (Inheritance $a $b))
   (Conclusions (Member $x $b))) (STV 1.0 0.99))

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
