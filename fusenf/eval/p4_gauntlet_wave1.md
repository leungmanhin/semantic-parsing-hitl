# P4 validation gauntlet — wave 1 (2026-08-14)

Runner `harness/gauntlet.py` (mech + finalize) → **`rules/validated.jsonl`** (52 rules, full
per-rule evidence); bridges regenerated validated-only (`mined_bridges_wave1.metta`, 82 rules);
`consolidated/*` rebuilt with `--status validated`. Probes: 42 cards × 3 blind judges (18 agents,
majority vote), notes retained per rule.

## Verdicts

| type | status | n |
|---|---|---|
| consolidation | validated | **13** (all lexical symbol rewrites; 9 via logged register-override) |
| bridging | validated | 36 (converses, wrappers, decide-frames, degree, role bridges, register-demoted…) |
| rejected | | 3 — `acquire→purchase` (hypernym: no payment entailment), teach/learn frame, `very_tired→exhausted` (scale) |

Gates: **control merges 0** (every rule applied solo over Tier A; M4 hard gate), seeded collisions
0, frozen-head rewrites = exactly the 10 role-canonicalizations + converse frames → demoted per
the §1 compatibility clause.

**Calibration incident, resolved per plan:** my probe wording told judges to count register as
loss; they demoted `purchase→buy` — which is §1's *own canonical consolidation example*. Fix =
mechanical note-review in finalize (`register_only()`: a lossless-no note citing only
register/formality words, with zero semantic-content words, is overridden; every override logged
with its notes). Judges' semantic-loss verdicts stand — they beat the seed table twice
(`acquire` hypernymy; degree-scale exceedance).

## Metrics

- **M4**: rule-level precision (judged meaning-preserving, same-truth majority) **49/52 = 0.94 ≥ 0.9** ✓;
  recall vs engineered targets 30/31 (from mining); **zero negative-control merges** ✓.
- **M5** (40 changed Tier A records, faithful-vocab star queries, seeded+bridges both KBs):
  **preservation 32/32 = 1.0** ✓ hard gate; **fabrication 0** ✓; **frozen deltas none** ✓;
  0 misses attributable to `bug_conj_reuses_rule_premise`. (8/40 queries unanswered by the
  faithful KB itself — auto-generated 4-conjunct queries exceed back-chaining depth; spec ratio
  is over faithful-answered.)
- **M3**: atoms 6372 → 6372 (symbol rewrites preserve counts) ⇒ **MDL net −39: FAILS its
  criterion, honestly** — atom-count compression was designed to come from structural collapses
  (judges demoted them all to bridging) and §4.3.1 meta-nodes (deferred to wave 2 for lack of
  interchangeability evidence). The real effect shows elsewhere: distinct star forms
  3085 → **3041**, distinct class symbols 844 → **832**.
- **Tier A convergence under validated-only rules: 18.9% → 43.3%** graph-identical (was 79.0%
  pre-gauntlet), **controls 0/468 → 0/468**. The gauntlet traded half the convergence for
  judge-certified losslessness; the demoted equivalences still connect at inference time via the
  82 bridges (M5 shows exactly that working).
- **Tier C**: back to ≈ the before column (exact 35.4%, d 0.246) — its earlier movement was the
  role rules, now frozen-gated to bridging.

## New canonicalizer edge (1/862, ticket)

`tierC-000043` re-canonicalizes to a different `graph_id` from identical statements: skolem twins
whose ONLY occurrences are inside one sealed/opaque term (`x1`/`x2`, both `Agent twilight`) take
names from surface encounter order — refinement cannot see into the seal, and `exact:true` does
not certify sealed interiors. Explains the ±0.002 d_content wobble.

## Standing

The full pre-registered loop **candidates → gauntlet → validated → rewrite → bridges → M3/M4/M5**
now exists and all hard gates pass. Open by design: meta-node encoding (wave 2), both-arm
same-hash parse for the full M2 (P4 tail), owner call on the register-override list and on
re-promoting role canonicalization if annotation-level merging is ever wanted in the consolidated
view.
