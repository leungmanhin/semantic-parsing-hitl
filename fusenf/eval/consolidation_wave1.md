# Consolidation wave 1 — candidates, rewriter, and the M2 "after" column (2026-08-07)

Artifacts: **`rules/candidates.jsonl`** (52 candidates, PLAN §7 format) built by
`mining/build_candidates.py`; **`harness/consolidate.py`** (deterministic rewriter);
**`consolidated/*.cons.jsonl`** for tierA, tierB, tierC_p1-3, tierC_m1v4 — re-canonicalized
under canon/4 with per-record provenance (source graph_id, rules applied).

## The candidate ledger (52)

| type | kind | n | direction policy |
|---|---|---|---|
| consolidation | lexical-collapse | 22 | canonical = higher corpus frequency (tie → lexicographic) |
| consolidation | structural-alt | 12 | larger side → smaller side (rewriter-terminating) |
| consolidation | role-canonicalization | 10 | minority role → majority role per event class |
| bridging | structural-alt (converses etc.) | 8 | both — chainer file only, never rewritten |

Routing follows the seed table's `expected_routing` labels where the rule was mined from Tier A
(`X<-Y` → consolidation; `X~Y` converses → bridging; `die<-kick_the_bucket` keeps
`lossless: false` per its `consolidation-lossy` label); Tier-C-only rules default lexical →
consolidation. 4 mined rules skipped as rewrite-inexpressible (unbound target variable —
entity-view duplicates of pairs already covered by symbol rewrites). Frequency agreed with the
seed arrows on buy/begin/repair; `large/big` tied 16–16 → lexicographic `big` (provisional,
gauntlet may override).

## Rewriter semantics (consolidate.py)

Symbol rewrites (single-atom Member↔Member rules) apply as exact-token substitution outside
string literals — class symbols canonicalize everywhere they occur, `Ordinal`/decomposition/rule
bodies included. Structural rules match by unification over top-level atoms (variables bind whole
argument terms), require every matched atom **positive** (strength ≥ 0.5 — a denial is never
restructured), replace matched atoms with RHS instantiations at (min s, min c), then an orphan
sweep drops `(Past e0)`-style residue of collapsed wrapper events. Priority: larger LHS, then
confidence, then id; fixpoint with symbol chains pre-resolved (a→b→c compiled to a→c).
**Idempotence verified: re-consolidating tierA.cons changes 0 records.**

## Results

| measurement | before | after |
|---|---|---|
| **Tier A same-polarity pairs graph-identical** | 44/233 (18.9%) | **184/233 (79.0%)** |
| **Tier A control pairs identical (must stay 0)** | 0/468 | **0/468** ✓ |
| Tier C 178 pairs — d_content mean | 0.244 | 0.242 |
| Tier C 178 pairs — exact content_id | 35.4% | **37.6%** |
| Tier C 178 pairs — exact graph_id | 32.6% | 34.8% |
| Tier C random cross-class d_content (n=400) | 0.986 | **0.986** (zero exact, both) |
| Tier C same-sentence noise floor (runs 7+8) | 0.234 / exact 45.0% | 0.235 / exact 45.0% |

Records changed by the rewriter: tierA 102/402, tierB 11/100, tierC 27/360 (+8 of 120 m1v4).

## Reading

- **The rewriter does exactly what consolidation promises where the mined vocabulary applies:**
  four-fifths of Tier A's engineered paraphrase pairs now collapse to literally identical
  canonical graphs, while all 468 meaning-different controls stay apart. That is the
  pre-registered M2 shape (d_pos down, d_neg untouched) demonstrated end-to-end on the corpus
  that was designed to test it.
- **Tier C moves little — by corpus construction, not by rewriter failure.** Tier C's positives
  are structural paraphrases (PAWS reordering); its lexical variation was never there to collapse
  (the Tier C builder's docstring says exactly this). The Tier C rules that fired are mostly the
  #23 role canonicalizations. Criterion 2 (controls stay apart) and criterion 3 (separation not
  degraded) hold on Tier C; criterion 1's ≥25% d_pos reduction is a Tier-A phenomenon at wave 1.
- The noise floor is untouched (0.234 → 0.235) — consolidation does not absorb parse instability;
  those are different variance sources, exactly as the M2 preview argued.

## Standing

Everything here is **candidate-grade**: the P4 gauntlet (cross-method consensus, Tier-A precision,
losslessness probes, seeded-rules compatibility, meta-node encoding for §4.3.1's 253
subtree-collapse signals) has not run. The full pre-registered M2 additionally needs both Tier C
arms parsed under one prompt hash. What exists now that did not before: the complete
candidates → rewriter → consolidated → M2-after pipeline, exercised and safety-checked.
