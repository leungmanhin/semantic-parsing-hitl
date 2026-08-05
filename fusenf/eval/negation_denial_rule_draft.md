# DRAFT for review — the negation-denial scope rule (gap-0034 under negation)

Not yet applied to `prompt.txt`. Closes the class that pooled M1 showed is 3-of-3 unstable and
covers **56 Tier A negation controls (14% of the tier)**.

## Diagnosis — three rules meet and none yields

| # | rule | says |
|---|---|---|
| 1 | `### Negation (events)` L608 | "Wrap the event's atoms in a conjunction, strength `0.0`". **All three examples have a *named* subject (Bob).** Silent on indefinite and plural subjects. |
| 2 | `## Existential` L722 | "Indefinite 'a/an' can be generic, not existential — **judge from context**." |
| 3 | `## Quantifiers, generics & scope` L1489 | a **grouped/counted plural** ("the dogs barked") takes the distribution rule. |

Rule 2's *"judge from context"* is a **licence to diverge** — the fifth instance of the
optional-atom class, in its "may pick a form" guise. Two compliant readers emit different shapes,
which is exactly the tell.

Observed on all three negation items: a **5–1 split**, same failure mode each time —
strength-`0.0` `(And …)` bundle (*this* physician didn't) vs strength-`0.0` `Implication`
(*no* physician does). On `arrive` the outlier instead **dropped** the group-level bundle and kept
only the rule.

## The principle

**Negation fixes the truth value. It does not re-decide the subject's encoding, and it does not
suppress an emission the positive sentence would make.**

Parse the subject exactly as the positive sentence would, then wrap and set strength `0.0`.

This is *narrowing*: every stable indefinite-singular item in the sample already encodes the
subject as a witness (`sk_firm_1`, `sk_flood_1`, `sk_panel_1`, `sk_nurse_1`, `sk_warden_1`, 5/5).
The rule removes a freedom rather than claiming ground.

**The bare-plural half is already entailed by the prompt.** L1467 distinguishes the `"none"`
companion from *plain "Ns don't V"* — so a negated bare plural is already a strength-`0.0` rule.
It is simply invisible from inside `### Negation (events)`. The genuinely unstated part is the
**singular contrast**.

---

## EDIT 1 — append to `### Negation (events)` (after L613)

> **Negation does not re-decide the subject.** Parse the subject exactly as the positive sentence
> would, then wrap and set strength `0.0`. An **indefinite or definite singular** ("a cooper",
> "the tutor") is a **witness** under negation just as it is without one — it does **not** become a
> kind. A generic denial needs the same surface signal a positive generic needs: a **bare plural**
> or an **explicit quantifier**. The two are different claims; emit the one the surface shows.
>
>       A cooper does not caulk the barrel.
>         →  (: cooper_not_caulk (And (Member sk_caulk_1 caulk) (Agent sk_caulk_1 sk_cooper_1)
>                                     (Member sk_cooper_1 cooper) (Patient sk_caulk_1 sk_barrel_1)
>                                     (Member sk_barrel_1 barrel)) (STV 0.0 0.99))
>       Coopers do not caulk the barrel.
>         →  (: coopers_not_caulk (Implication (Premises (Member $x cooper))
>                  (Conclusions (Member (sk_caulk $x) caulk) (Agent (sk_caulk $x) $x)
>                               (Patient (sk_caulk $x) sk_barrel_1))) (STV 0.0 0.9))
>
> **A negated plural or group keeps both emissions.** Where the positive sentence would emit a
> group event **and** a distribution rule (*Quantifiers, generics & scope*; *Cardinality*), the
> negated one emits **both**, each at strength `0.0` — the group did not do it, and no member did.
> Dropping either is a different, weaker claim.
>
>       The kegs do not ferment.
>         →  (: kegs_g (GroupOf sk_group_1 keg) (STV 1.0 0.99))
>            (: kegs_neg (And (Member sk_ferment_1 ferment) (Agent sk_ferment_1 sk_group_1))
>               (STV 0.0 0.99))
>            (: kegs_rule (Implication (Premises (PartOf $x sk_group_1))
>                  (Conclusions (Member (sk_ferment $x) ferment) (Agent (sk_ferment $x) $x)))
>               (STV 0.0 0.9))
>
> This leaves **cessation** (which adds `(Past e)`), the **copular** denial (*Negation (copular)*),
> and the **"none of the"** twin untouched — "none" is an explicit quantifier, so it takes the rule
> form and its `QuantifierPhrase` companion as always.

## EDIT 2 — replace the last sentence of `## Existential` L722–723

**Remove:** *"Indefinite "a/an" can be generic, not existential ("A dog is a mammal" =
`(Inheritance dog mammal)`) — judge from context."*

**Replace with:**

> Indefinite "a/an" is generic in a **copular / definitional** predication ("A dog is a mammal" =
> `(Inheritance dog mammal)` — see *Categorical statements*). With a **verbal** predicate it is a
> **witness**: a verbal generic takes a bare plural or an explicit quantifier ("Dogs bark", "Every
> dog barks"), not "a dog". **Modal predications are decided by their own section** — a deontic norm
> or a capability generic over a kind keys on the modal, not the determiner, so "A wheelwright must
> lacquer the spigot" stays the kind-level property form (*Deontic norms & prohibitions over a kind*).

## Carve-outs (stated so this doesn't annex owned territory)

Twice before, a new rule quietly took ground an existing one held (gap-0031, gap-0036). Explicitly
**unchanged**:

- **cessation** — "no longer / not anymore" keeps its `(Past e)` shape
- **copular negation** — §`Negation (copular)`, incl. `"no"`/`"none"` companions and the
  *"not all"* counterexample witness
- **"none of the"** — explicit quantifier → distribution rule at strength `0.0`, unchanged
- **deontic norms / capability generics** — keyed on the modal, not the determiner, so
  "A driver must carry a licence" remains a kind-level property
- **bare-plural negated generics** — already the rule form; only made locally visible

## Risk check (run before drafting)

- goldens whose sentence starts "A/An <noun>" **and** contain an `Implication`: **0**
- 5/5 stable indefinite-singular items already encode the subject as a witness
- all 26 example words leak-checked against Tier A/B/C **and** `prompt.txt` **and** the goldens;
  `cooper / caulk / barrel / keg / ferment / wheelwright / lacquer / spigot` are clean in all three.
  None of the three failing corpus sentences (`physician`/`examine`, `elder`/`teach`/`song`,
  `soil sample`/`arrive`/`post`) appears anywhere in the new text.

## New goldens to add (distinct vocabulary again, so they don't recite the prompt)

| tag | sentence | expects |
|---|---|---|
| `[neg-indef-witness]` | A farrier does not burnish the flange. | strength-`0.0` `(And …)`, subject a witness |
| `[neg-bareplural-rule]` | Farriers do not burnish the flange. | strength-`0.0` `Implication` over `farrier` |
| `[neg-group-dual]` | The thatchers do not grout the culvert. | group `(And …)` **and** distribution rule, both `0.0` |
| `[neg-indef-deontic]` | A wheelwright must lacquer the spigot. | kind-level property — pins the carve-out |

## The honest cost

This **forces one reading on a surface that is genuinely ambiguous.** "A physician does not examine
the samples" really can be read either way in isolation, and the rule picks the witness reading by
convention, not because the other is wrong. That is the standing trade: determinacy now, at the price
of a reading. If we ever build **#48 (multi-reading / `Interpretation`)** this is precisely a case
that should emit both and let marginalization decide — worth tagging in the #48 backlog as a
motivating example. The convention is cheap to reverse; the instability is not.

## Verification plan (the stopping rule, as agreed)

1. Apply both edits; add the 4 goldens; run e2e (expect 329 + new).
2. Re-measure **all 26 M1 items × 3 runs** — full coverage catches collateral damage, which is how
   gap-0036 silently broke `discover`.
3. **Out-of-sample:** 3 *fresh* negation controls drawn from the other 53 × 3 runs — re-measuring only
   the items that motivated the fix shows improvement through regression to the mean.
4. ~87 parses. Then parse the corpus **regardless of the result**, unless another 3-of-3 class appears.
