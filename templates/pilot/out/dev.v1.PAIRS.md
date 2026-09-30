# Template pilot — side by side, set `dev`

One block per (item, arm, distinct parse) that does not match its golden exactly. Atoms are shown in wildcard form (witnesses as SK).

## gold-000074 [part-percent-decimal]

> 12.5% of the applicants withdrew.

golden:
    (: e_applicants (GroupOf sk_applicants_1 applicant) (STV 1.0 0.99))
    (: e_sub (GroupOf sk_sub_1 applicant) (STV 1.0 0.99))
    (: e_sub_subset (SubsetOf sk_sub_1 sk_applicants_1) (STV 1.0 0.99))
    (: e_sub_prop (ProportionOf sk_sub_1 sk_applicants_1 (Fraction 12.5 100)) (STV 1.0 0.99))
    (: e_withdraw (Member sk_withdraw_1 withdraw) (STV 1.0 0.99))
    (: e_withdraw_agent (Agent sk_withdraw_1 sk_sub_1) (STV 1.0 0.99))
    (: e_withdraw_past (Past sk_withdraw_1) (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision None · recall 0.0 · bucket `optional-atom`

only in the golden:
    (Agent SK SK) (STV 1.0 0.99)
    (GroupOf SK applicant) (STV 1.0 0.99)
    (GroupOf SK applicant) (STV 1.0 0.99)
    (Member SK withdraw) (STV 1.0 0.99)
    (Past SK) (STV 1.0 0.99)
    (ProportionOf SK SK (Fraction 12.5 100)) (STV 1.0 0.99)
    (SubsetOf SK SK) (STV 1.0 0.99)

unmapped [G00] “12.5% of the applicants withdrew” — A partitive subject expressing a percentage share of a definite plural, with a past-tense verb.

**ctl** runs 2 · precision 0.875 · recall 1.0 · bucket `optional-atom`

only in the parse:
    (Implication (PartOf $v0 SK) (And (Agent (FN $v0) $v0) (Member (FN $v0) withdraw) (Past (FN $v0)))) (STV 1.0 0.9)

## gold-000147 [time-bound-year]

> The castle was demolished before 1960.

golden:
    (: e_castle (Member sk_castle_1 castle) (STV 1.0 0.99))
    (: e_dem (Member sk_demolish_1 demolish) (STV 1.0 0.99))
    (: e_dem_pat (Patient sk_demolish_1 sk_castle_1) (STV 1.0 0.99))
    (: e_dem_past (Past sk_demolish_1) (STV 1.0 0.99))
    (: e_dem_bound (TimeAtMost sk_demolish_1 (Year 1959)) (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision 1.0 · recall 0.8 · bucket `optional-atom`

only in the golden:
    (TimeAtMost SK (Year 1959)) (STV 1.0 0.99)

unmapped [G00] “before 1960” — A temporal bound made of the preposition 'before' and a bare year, limiting when the event happened.

## gold-000152 [time-duration]

> Rosa hiked for five hours.

golden:
    (: e_hike (Member sk_hike_1 hike) (STV 1.0 0.99))
    (: e_hike_ag (Agent sk_hike_1 rosa) (STV 1.0 0.99))
    (: e_hike_past (Past sk_hike_1) (STV 1.0 0.99))
    (: e_hike_dur (Measure sk_hike_1 duration 5 hour) (STV 1.0 0.99))
    (: rosa_name (Name rosa "Rosa") (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision 1.0 · recall 0.8 · bucket `optional-atom`

only in the golden:
    (Measure SK duration 5 hour) (STV 1.0 0.99)

unmapped [G00] “for five hours” — A for-phrase giving a measured duration of time on the verb.

## gold-000202 [gen-none]

> None of the tenants complained.

golden:
    (: none_tenants_complained (Implication (Member $x tenant) (And (Member (sk_complain $x) complain) (Agent (sk_complain $x) $x) (Past (sk_complain $x)))) (STV 0.0 0.9))
    (: tenants_q (QuantifierPhrase tenant complain "none") (STV 1.0 0.99))

**t26** runs 1 · precision None · recall 0.0 · bucket `optional-atom`

only in the golden:
    (Implication (Member $v0 tenant) (And (Agent (FN $v0) $v0) (Member (FN $v0) complain) (Past (FN $v0)))) (STV 0.0 0.9)
    (QuantifierPhrase tenant complain "none") (STV 1.0 0.99)

unmapped [G00] “None of the tenants complained” — A negative quantifier in a partitive ('none of' plus a definite plural) as the subject of an intransitive verb.

**t26** runs 2, 3 · precision 0.0 · recall 0.0 · bucket `unclassified`

only in the parse:
    (And (Agent SK SK) (Member SK complain) (Past SK)) (STV 0.0 0.99)    ← O03
    (GroupOf SK tenant) (STV 1.0 0.99)    ← E03
    (Implication (PartOf $v0 SK) (And (Agent (FN $v0) $v0) (Member (FN $v0) complain) (Past (FN $v0)))) (STV 0.0 0.9)    ← R03

only in the golden:
    (Implication (Member $v0 tenant) (And (Agent (FN $v0) $v0) (Member (FN $v0) complain) (Past (FN $v0)))) (STV 0.0 0.9)
    (QuantifierPhrase tenant complain "none") (STV 1.0 0.99)

## gold-000218 [dist-bare]

> The trustees approved the budget.

golden:
    (: approve (Member sk_approve_1 approve) (STV 1.0 0.99))
    (: aa (Agent sk_approve_1 sk_group_1) (STV 1.0 0.99))
    (: ag (GroupOf sk_group_1 trustee) (STV 1.0 0.99))
    (: at (Theme sk_approve_1 sk_budget_1) (STV 1.0 0.99))
    (: ab (Member sk_budget_1 budget) (STV 1.0 0.99))
    (: ap (Past sk_approve_1) (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision 0.8571 · recall 1.0 · bucket `optional-atom`

only in the parse:
    (Implication (PartOf $v0 SK) (And (Agent (FN $v0) $v0) (Member (FN $v0) approve) (Past (FN $v0)) (Theme (FN $v0) SK))) (STV 1.0 0.9)    ← R03

**ctl** runs 1, 2, 3 · precision 0.8571 · recall 1.0 · bucket `optional-atom`

only in the parse:
    (Implication (PartOf $v0 SK) (And (Agent (FN $v0) $v0) (Member (FN $v0) approve) (Past (FN $v0)) (Theme (FN $v0) SK))) (STV 1.0 0.9)

## gold-000334 [ord-nth]

> Nadia was the second to finish.

golden:
    (: nadia_ord (Ordinal nadia 2 finish) (STV 1.0 0.99))
    (: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e_finish_ag (Agent sk_finish_1 nadia) (STV 1.0 0.99))
    (: e_finish_past (Past sk_finish_1) (STV 1.0 0.99))
    (: nadia_name (Name nadia "Nadia") (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision None · recall 0.0 · bucket `optional-atom`

only in the golden:
    (Agent SK nadia) (STV 1.0 0.99)
    (Member SK finish) (STV 1.0 0.99)
    (Name nadia "Nadia") (STV 1.0 0.99)
    (Ordinal nadia 2 finish) (STV 1.0 0.99)
    (Past SK) (STV 1.0 0.99)

unmapped [G00] “Nadia was the second to finish” — A copular clause whose predicate is an ordinal with an infinitival relative clause, stating a rank in an ordering.

## gold-000420 [maker-genitive]

> Odalys's protest delayed the hearing.

golden:
    (: t_prot (Member sk_protest_1 protest) (STV 1.0 0.99))
    (: a_prot (Agent sk_protest_1 odalys) (STV 1.0 0.99))
    (: n_od (Name odalys "Odalys") (STV 1.0 0.99))
    (: e_del (Member sk_delay_1 delay) (STV 1.0 0.99))
    (: e_del_ag (Agent sk_delay_1 sk_protest_1) (STV 1.0 0.99))
    (: e_del_th (Theme sk_delay_1 sk_hearing_1) (STV 1.0 0.99))
    (: e_del_past (Past sk_delay_1) (STV 1.0 0.99))
    (: t_hear (Member sk_hearing_1 hearing) (STV 1.0 0.99))

**t26** runs 1, 2, 3 · precision 0.8571 · recall 0.75 · bucket `unclassified`

only in the parse:
    (Patient SK SK) (STV 1.0 0.99)    ← V01

only in the golden:
    (Agent SK odalys) (STV 1.0 0.99)
    (Theme SK SK) (STV 1.0 0.99)

unmapped [G00] “Odalys's protest” — A possessive naming the doer of an event noun, that is the subject of 'protest', rather than an owner or relative.

**ctl** runs 1, 2, 3 · precision 0.875 · recall 0.875 · bucket `role-choice`

only in the parse:
    (Patient SK SK) (STV 1.0 0.99)

only in the golden:
    (Theme SK SK) (STV 1.0 0.99)

