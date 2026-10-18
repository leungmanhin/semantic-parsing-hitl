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
