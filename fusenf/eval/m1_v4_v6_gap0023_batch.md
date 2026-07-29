# M1 v4–v6 — the gap-0023 batch (2026-07-29)

Same 20 stratified items, 3 blind parses per version, 180 further parses (runs 10–18).
**All 180 clean on C1–C8**, chainer smoke test included.

| | v3 | v4 | v5 | v6 |
|---|---|---|---|---|
| `pairwise_agreement` | 0.967 | 0.883 | 0.933 | **1.000** |
| `unanimity` | 0.950 | 0.850 | 0.900 | **1.000** |
| `modal_share` | 0.983 | 0.933 | 0.967 | **1.000** |
| disagreeing pairs | 2 | 7 | 4 | **0** |
| families at 1.000 | 19/20 | 17/20 | 18/20 | **20/20** |
| `canonicalizer` variance | 0 | 0 (after the fix) | 0 | **0** |

v4 is reported at 0.883, its value under `fusenf-canon/2`; it first came back at **0.850** under
`canon/1`, and the difference is the canonicalizer bug below. v1–v3 are unchanged by that fix
(0.800 / 0.833 / 0.967), which is precisely why it had gone unnoticed.

## v4 — one fix landed, three unrelated things broke

`event-ditrans` went 0.333 → 1.000 and stayed there, so **gap-0023 was fixed on the first attempt**.
The headline still fell, because four other families regressed for three *different* reasons — the
v2 pattern repeating, and the reason the re-measure covers all 20 items rather than the one item
being fixed.

**1. A canonicalizer bug (`pilot-000007`, negation).** Two parses of the same sentence differed only
in where `(Past …)` sat inside an `(And …)` bundle and scored as a genuine disagreement. `And`
conjuncts are unordered, and the engine's bundle matching has been order-insensitive since the
2026-07-09 fix to `bug_and_query_order_sensitivity`, so this was pure canonicalizer noise — the one
bucket M1 is supposed to hold at zero, silently nonzero the whole time.

Sorting the conjuncts was **not** sufficient. The skolem renaming is assigned by walking each atom's
term, and inside a single bundle the walk order *is* the emission order, so the entire renaming
moved with it (`sk_r_1 → x0` in one parse, `→ x1` in the other). The sort has to happen **before**
naming, keyed on the colour-masked form so it cannot depend on the names being assigned. Fixed,
`CANON_VERSION` bumped to `fusenf-canon/2` so stale canonical files cannot be silently mixed in, two
tests added: `And` conjunct order is canonical; `Or`/`Xor` order is deliberately **preserved**,
because those are opaque heads the chainer matches verbatim and their argument order is still
operationally load-bearing.

**2. A hedge I had just written (`pilot-000004`, `pilot-000018`).** The gap-0023 edit added "each
fires only where **Compound decomposition** says it does" to the *Assert only what the text states*
Core pattern. Inside a bullet whose whole thrust is *do not over-emit*, a qualifier reads as a
caution — and compound genus atoms started going missing. Logged as **gap-0026**; the lesson is that
**in a Core pattern a qualifier reads as a caution**, so hedging a mandatory rule there is
functionally identical to marking the atom optional.

**3. Two real coverage gaps.** `night_shift` (**gap-0024**) fell outside every stated modifier
category, since the exposure list enumerated purpose/association/role but not *time* — three runs
gave three different answers. And `lie` (**gap-0012**) finally showed its cost: a locative stative
had no branch in the intransitive-subject procedure, so runs split `Agent` / `Experiencer`.

## v5 — the last two disagreements were one rule

At 0.933 the only survivors were `pilot-000017` and `pilot-000019`, and both were the **past-perfect
ordering atom**. The rule existed but was scoped by example — "had V-ed **when / by the time** …" —
leaving a causal clause and an attitude complement undetermined. **Third instance this session of
one defect: a rule whose scope is shown rather than stated behaves exactly like an optional atom.**

Replaced the connective-based scope with a test (emit `Before` whenever the sentence contains
another *asserted* event to precede, whatever links them), plus two carve-outs that follow from
doctrine already in the prompt rather than new invention: nothing to order against → no atom; inside
a **seal** → no atom, because ordering atoms never cross a seal boundary in either direction. Both
carve-outs match what the majority of runs already did (**gap-0025**).

## v6 — 1.000

Every metric perfect, zero disagreeing pairs, 20/20 families at 1.000. The decision rule
(**parse corpora once per item**) is unchanged and now holds with margin; the expansion trigger is
not close.

## What this batch cost and bought

Nine prompt/code changes over 180 parses. Two of the six defects found were **mine** — the Core-pattern
hedge and the canonicalizer bug — and neither was visible on inspection; both needed repeated
measurement to surface. The coverage-gap channel stayed predictive: every regression traced to a
gap, and no unstable family lacked one.

Ledger: **26 gaps, 23 fixed, 3 open** (gap-0007 NP-ellipsis, gap-0010 "expire", gap-0017
collective-noun distribution — all with no measured stability cost).

State: prompt 2,090 lines, goldens 326, e2e 327/327, seeded rules 106, `fusenf-canon/2`,
harness tests 69 + 56.
