# P4 validation gauntlet — ROUND 2, wave-2 signals (2026-08-14)

Runner `harness/gauntlet2.py` (mech + finalize) over `rules/candidates2.jsonl`
(built by `mining/wave2/build_candidates2.py` from `mi_groups.jsonl` + `interchange.jsonl`)
→ **`rules/validated2.jsonl`** (109 rules, full per-rule evidence). Probes: 13 meta-coherence
cards ×3 blind judges + 93 AE substitutability cards ×3 (21 agents, majority vote, zero
dispatch failures). Consolidated corpus rebuilt with wave-1 + round-2 validated rules;
bridges exported to `mined_bridges_wave2.metta` (34 rules).

## Verdicts

| family | outcome | n |
|---|---|---|
| meta-node packs (subtree-collapse) | **validated → consolidation** | **10** (MnEvAgThPast, MnEvAgPatPast, MnEvAgRecTh, MnEvAgTh, MnEvAgPat, MnEvExpLoc, MnEvPatPast, MnEvTh, MnEvAg, MnEvPat) |
| meta-node packs | rejected | 4 — mn0004 (pre-registered greedy MDL, 4 occ × 3 < cost 14); mn0006/mn0010/mn0014 (judges: not one coherent unit) |
| AE lexical pairs | validated → **bridging** | 2 — car↔automobile (register-only override), doctor↔physician (judges: hypernym → lossy) |
| AE lexical pairs | rejected | 91 (scenario siblings / converses / aspectuals — as predicted by wave-2's interpretation) |
| role-interchange (frozen heads) | rejected | 2 — Agent→Theme, Experiencer→Theme (unconditioned frozen swaps; round-1 class-conditioned role bridges already cover QA) |

**The meta-coherence probe was not a rubber stamp.** Judges rejected exactly the packs whose
shape strands a core argument outside the node: MnEvAgLoc fires on permit/forbid events whose
real frame includes the Theme ("bundling only Agent+Location and dropping Theme splits one
frame"), MnEvLoc drops both core arguments of `discover`. MnEvExpLoc survived because for
locative predication the Location IS core. This is frame-theoretic discrimination the
mechanical gates cannot make.

**AE-generator precision: 2/93 = 0.022** — the honest §4.3.5-alone number, confirming
similarity ≠ synonymy at corpus scale. Both rescues route to bridging, not consolidation:
without a Tier-A design label the evidence formula caps AE confidence at 0.85 < the §1
consolidation threshold 0.9 — a weaker evidence class cannot buy a rewrite, by construction.
Judges again out-performed casual intuition (doctor is a hypernym of physician — covers
dentists/PhDs — so the merge is lossy; same failure mode they caught on `acquire` in round 1).

## Metrics

- **M3 compression (the round-2 headline)** — formula pinned in `gauntlet2.py`
  (round 1 left it inline): rule cost = |lhs|+|rhs|+1 per consolidation rule; *strict*
  adds 2 atoms per expansion bridge (the decompressor is part of the description length).
  Validated-only, over the same 862-record / 6,372-atom set as round 1:
  **atoms 6,372 → 4,894 (−1,478, −23.2%); M3 strict = +1,329** (w1-consistent accounting
  +1,389), vs round 1's honest **−39**. The compression the wave-1 report said "awaited
  structural/meta-node rules" is now claimed, through the gauntlet, with the parameterized
  encoding decided at P4 start. 746 pack applications; every validated pack has positive
  measured marginal (min +14 strict, MnEvPatPast).
- **M4-style hard gates**: control merges **0** (each of 109 candidates applied solo over
  Tier A); seeded collisions 0; frozen-head substitutions = exactly the 2 role-interchange
  pairs, both rejected.
- **Tier A convergence**: 0.189 → **0.433** graph-identical, **bit-for-bit equal** to the
  wave-1 validated-only figure, controls **0/468** — empirical proof the packs are bijective
  (no pair merged, none split). Tier C: exact **unchanged** (content 35.4%, graph 32.6%);
  per-atom d rose mechanically (0.244 → 0.293 pos, 0.986 → 0.998 cross) because packing
  shrinks atom sets so each residual diff weighs more; discrimination remains maximal
  (0 cross-class exact).
- **M5 preservation** (40 changed Tier A records, faithful-vocab star queries,
  seeded + wave-1 + wave-2 bridges): **atom-level recovery 38/38** — every faithful
  conjunct individually derivable from the packed KB; **fabrication 0; unexplained
  misses 0**. **Conjunction-level: 1/38 — FAILS the pre-registered gate pending an
  engine fix**: 34/37 misses attributed to the NEW engine gap below (every conjunct
  binds alone), 3/37 to the previously filed `bug_conj_reuses_rule_premise`. The gap
  reproduces in a 3-atom KB with no wave-2 rule involved, so it is an engine
  completeness bug, not a rule defect — but operationally the packed consolidated view
  **must not serve conjunction QA until the engine fix lands** (faithful + bridges
  remains the QA-serving layout). Frozen-head atom deltas are large and negative by
  design (Member −300, Agent −247, Theme −200, Patient −65, Past −33, …): these atoms
  moved inside meta nodes and are restored one-by-one by the expansion bridges (smoke:
  every component check passes).

## NEW ENGINE BUG (filed): `bug_conj_two_conjuncts_share_premise`

Minimal repro at repo root (`bug_conj_two_conjuncts_share_premise_minimal.py`, 3 atoms):
two expansion rules each derive one atom from the same stored meta-node atom; each derived
atom is provable alone; their conjunction returns [] — ground or variable, either order,
steps 400 or 1500. Distinct from `bug_conj_reuses_rule_premise` (no conjunct re-asserts the
premise here; they merely share it). Derived ∧ asserted works. Same bundle-rigidity family:
the And-prover appears unable to let one stored atom support two sub-derivations in a single
proof. Smoke `harness/smoke_bridges2.py`: 6/7 (this is the 7th).

## Standing

Round 2 completes the wave-2 arc: MI groups → parameterized meta-nodes → gauntlet →
**applied compression with MDL claimed**, and AE interchange → gauntlet → 2 bridges + a
quantified negative result. Open by design: the 77 event-centering-untranslatable MI groups
(entity-class/cross-star bundles — a wave-3 shape family); the engine And-prover fix, which
would flip M5-conjunction from 1/38 to ~37/38 with no rule change; Tier B scale-up (weakens
the scenario-sibling failure mode that produced 91/93 AE rejections); the P4 tail (both-arm
same-hash parse for the full pre-registered M2).
