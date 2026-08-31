# PeTTaChainer migration study — 02a85c6 (Jul 20) → cfe25f9 (Aug 3)

Studied in a detached worktree at `cfe25f9`; `/home/manhin/Dev/PeTTaChainer` was only **fetched**,
its working tree is untouched and still on `master` @ `02a85c6`. 56 commits.

Authoritative sources: `pettachainer/LANGUAGE_SPEC.md` and **`pettachainer/LLM_RULE_SPEC.md`** — the
latter is written specifically for LLM rule authoring, i.e. it is the upstream counterpart of our
`prompt.txt`. Read it before editing ours.

---

## 1. THE BREAKING CHANGE — and it fails *silently*

`Implication` now takes **exactly two expressions**. The `Premises` / `Conclusions` wrappers are gone
from the user syntax (only internal type names like `CompiledPremises` remain).

```metta
;; OLD — what prompt.txt emits today
(Implication (Premises p1 p2) (Conclusions c1 c2))
;; NEW — singleton side bare, conjunction explicit
(Implication (And p1 p2) (And c1 c2))
(Implication (Member $x dog) (Member $x mammal))     ; singletons need no unary And
```

**Measured behaviour of the old form on the new engine:** `add_atom` **accepts it without error**,
and the query then returns `[]`. No exception, no warning. Every rule we have would quietly stop
firing. This is the single biggest risk in the migration — a loud failure would be safer.

### Our exposure

| file | occurrences |
|---|---|
| `seeded_rules.metta` | 75 |
| `regression/regression_cases.md` | 38 |
| `regression/e2e_regression.py` | 26 |
| `prompt.txt` | 25 |
| parse records (Tier A 39 + Tier B 10) | 49 records |
| `fusenf/harness/canonicalize.py` | 2 (`COMMUTATIVE_HEADS`) |

A converter is written and unit-tested: `scratchpad/conv_impl.py`. It handles multi-conjunct sides,
singleton collapse, nested `And`, and is **idempotent** (already-new forms are left alone) — verified
on 4 cases plus 3 real bug repros.

---

## 2. Member / Inheritance — our usage is CORRECT

The engine's model (`LANGUAGE_SPEC.md` §Member and Inheritance):

- `(Member object class)` — instance-to-class. **This is preferred for new instance data.**
- `(Inheritance subclass superclass)` — class-to-class.
- **Concept nodes are created along the way**, but only from the *class* term: *"Only class terms are
  registered as concept nodes by `Member`; the member object is not."*
- A concrete `(Inheritance A B)` **auto-generates two views**:
  `(Member $x A) -> (Member $x B)` and `(Inheritance $x A) -> (Inheritance $x B)`.
  The member view is marked **non-invertible**. **"Do not emit either helper rule yourself."**
- Legacy `(Inheritance object class)` for instance membership still works but is **not an alias** —
  asserting both forms records **two distinct propositions**.

**Verified empirically against our conventions:**

```
(Member sk_dog_1 dog) + (Inheritance dog mammal)  ⊢  (Member sk_dog_1 mammal)
  -> (by (no_inverse (member-inheritance-implication gen)) e_dog)  (STV 1.0 0.9802)
```

Individuals by `Member`, kind-to-kind by `Inheritance` — exactly what our proto-spec mandates.

**The duplication hazard is real and I measured it.** Adding a hand-written twin alongside the
`Inheritance` produces a `merge/revision` of the auto-view and the twin, inflating confidence
0.9802 → 0.98505 — the same evidence counted twice.

**We do not trip it.** Scanned all 1,057 parse records: **0 duplications**. One single legacy
object-style `(Inheritance sk_group_1 …)`, in `tierA-000372` — the universal-copular item whose
golden `[dist-universal-copular]` already forbids exactly that form.

---

## 3. Running it — solved, no PeTTa branch needed

PeTTa is now an ordinary pinned dependency (`pyproject.toml`):
`petta @ git+https://github.com/trueagi-io/PeTTa@e038e4db…` — **upstream, not a fork branch**. The
`PeTTa-fiet` `file-import-throw-error-split` checkout and the `sys.path.insert` shim are both
obsolete.

```bash
cd /home/manhin/Dev/PeTTaChainer
uv sync --frozen                 # creates ./.venv, builds pinned PeTTa
uv run python your_script.py     # or: cd pettachainer/metta && uv run petta tests/x.metta -s
```

Confirmed working: `uv sync --frozen` builds cleanly (uv 0.11.21, CPython 3.10.20, janus-swi 1.5.2),
and `uv run petta tests/test_var_head.metta -s` passes. **The Python API is unchanged** —
`PeTTaChainer()`, `add_atom`, `query(atom, timeout_sec=0)` — so our harness calls port as-is; only
the `sys.path` shim and the interpreter change. Note this venv is **separate from `.venv-dev`**;
`uv` warns about `VIRTUAL_ENV` and ignores it, which is fine.

---

## 4. Status of the bugs we filed

| repro | verdict on cfe25f9 |
|---|---|
| `bug_competing_derivations_return_empty` | **FIXED** — both rules now `merge/revision` to STV 1.0 0.974 instead of returning `[]` |
| `bug_rule_proofname_collision` | **FIXED** — all four proof-name variants resolve correctly |
| `bug_dist_unit_conversion` | **partly fixed** — foot→meter now yields `1.8288 meter`; but see the CTV note below |
| `bug_cessation_revision_lost` | **still needs re-baselining** — denial merges to STV ≈0.333, not obviously resolved |

---

## 5. Other changes that matter to us

- **Explicit `Exists`** — `(Exists ($v ...) body)`, wrapping one complete side of an implication.
  Constraints: no nesting, not inside an outer `And`, no bound-variable reuse across sides, no direct
  `Exists` queries, none inside `BiImplication`.
- **Automatic witnesses.** A variable occurring only in a conclusion now gets a stable witness like
  `(exists ruleName 0 (alice))`. **This does not force a change on us** — our Skolem-function terms
  `(sk_fly $x)` are functions of an antecedent-*bound* variable, and I verified they still work
  unchanged under the new syntax. Our convention stays; `Exists` is an added capability, not a
  replacement.
- **`CTV` on rules.** New rule examples carry `(CTV pos neg)`. Plain `STV` still works — the compiler
  derives a CTV from antecedent/consequent base rates ("An explicit CTV already carries both").
  Verified: plain rules, and our `Compute` rules, all fire with `STV`. **But** a `MapDist` rule with
  an `STV` now hard-errors: `Type mismatch: got ['STV',1.0,1.0] but expected 'CTVType'`. We use **no**
  `MapDist`/`Map2Dist`/`AverageDist`, so current exposure is nil — but whether to adopt explicit CTV
  is a real modelling decision (it makes each rule's base-rate behaviour explicit instead of estimated).
- **Negated facts canonicalized.** Our strength-0 convention *is* the canonical form:
  `(: noLeak (SealLeak old unit-1) (STV 0.0 1.0))`. `(Not X)` at strength 1.0 is also accepted and
  stored complemented. Verified our strength-0 `(And …)` denial round-trips intact.
- **Pattern mining in the engine** — `set_pattern_mining_on_add`, `enable_pattern_mining_on_add`,
  `materialize_mined_implications`. Directly relevant to FUSE-NF **P3**; worth assessing before
  building our own miner.
- **`GreaterThan` operates on distributions**, not raw numbers (a plain float binding yields `[]`;
  that was my own test error, not a regression). We have 8 uses in `prompt.txt` — verify each binds a
  distribution (`PointMass` / `ParticleFromNormal` / `NatDist`) during migration.

---

## 6. Proposed migration plan (for review — nothing applied yet)

1. **Update the canonicalizer first.** `COMMUTATIVE_HEADS = ("Premises","Conclusions","And")` →
   `("And",)`. This changes every hash, so bump `fusenf-canon/2` → `/3`; all existing
   `canonical/*.jsonl` must be regenerated.
2. **Convert at assemble time, not in `raw/`.** The `raw/*.txt` files *are* the provenance record of
   what a given model emitted under a given `prompt_sha256`; rewriting them would falsify that. Put
   the (idempotent) converter in `assemble.py` so old and new parses normalize alike and the 502
   already-parsed records need no re-parsing.
3. **`seeded_rules.metta`, goldens, `e2e_regression.py`** — run the converter, then re-run e2e. Expect
   real breakage to surface here first; that is what it is for.
4. **`prompt.txt`** — the 25 rule examples, plus the surrounding prose that names "Premises"/
   "Conclusions". This is a prompt change, so it invalidates parse provenance and warrants an M1
   re-measure (the corpus parse should wait until after this lands).
5. **Decide the open modelling questions**: explicit `CTV` vs derived; whether to adopt `Exists`
   anywhere; whether the engine's pattern mining changes the P3 plan.

**Recommended order:** 1→3 first (mechanical, e2e-verified), then 4, then re-measure M1, then parse the
corpus. Parsing 1,219 records *before* the prompt migrates would waste them.
