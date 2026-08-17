# P3 loop 2 — second mining loop on the doubled substrate (2026-08-17)

**Terminology** (owner-flagged): this is PLAN §9 step 6's "second loop of P3→P4" re-running the
wave-1 MINERS — not PLAN §6's method-Wave-3, which stays unstarted.

**Design (pre-registered).** The 120 held-out positive pairs split 60/60 by sorted equiv_class
(even→MINE, odd→VALIDATION; `mining/out2/loop2_split.json`). Mining substrate = the 862 loop-1
records + the 120 MINE-half records ONLY — the validation half and all 200 control pairs feed
no miner. Loop-2 outputs live in `mining/out2/` (`out/` frozen as loop-1 artifacts).

## Mining

- Stars: 982 records → 1,225 patterns / 299 signals. Role-fillers: 702 slots, 16/221 flip
  witnesses. Alignment at the registered support≥2: **471 pairs → 48 rules — only 2 net-new**
  vs wave-1 (one unconditioned Patient↔Theme wobble, one junk one-sided bundle). Finding: PAWS
  pairs' diffs are essentially unique — anti-unification at support≥2 mechanically cannot
  recur on 60 diverse natural pairs.
- **Singleton extension (explicit threshold deviation, exploratory-labeled):** mine-half alone
  at min-support 1 → 104 rules; kept only the 12 lexical-collapse singletons, mechanically
  filtered to class-position swaps (4 proper-noun/name-variant swaps excluded as
  per-document coreference, not lexicon; 88 structural singletons excluded as one-pair
  idiosyncrasies). Judges replace support as the filter.

## Gauntlet round 3 (13 candidates, 6 judges, mech gates all clean)

- **Validated consolidation ×2 (conf 0.95, judges unanimous):** `rate_of_flow → flow_rate`,
  `train_station → railway_station` — genuine compound-form synonyms in PAWS vocabulary, the
  exact species the held-out M2 lacked.
- Bridging ×6: new class-conditioned Theme/Patient role rules (defeat, finish, play, spend,
  stop, train) — frozen-gated to annotation-level, extending the round-1 family.
- Rejected ×5: orchestrate→direct (manner/skill), divide→separate (polysemy), propose→suggest
  (commitment strength), the About/Of preposition mistemplate (a `build_candidates` limitation:
  head-swap diffs get mis-rendered as Member-swaps — noted), one unconditioned slot-merge.
  Judge precision held: 6/7 lexical verdicts match lexicographic ground truth; the singletons
  they passed are real, the ones they killed are really lossy.

## Validation-half re-measure (the loop's question)

| view | VAL pairs (n=60) | MINE pairs (n=60) | controls (n=200) | AUC |
|---|---|---|---|---|
| BEFORE | d 0.488, exact 8/60 | d 0.475, exact 7/60 | d 0.623, exact 4 | 0.624 |
| AFTER equiv-only (no packs) | d 0.488, exact **8/60 (unchanged)** | d 0.464, exact **8/60 (+1)** | d 0.622, exact 4 | 0.622 |
| AFTER full (w1+w2+w3) | d 0.550, exact 8/60 | d 0.529, exact 8/60 | d 0.695, exact 4 | 0.623 |

The two new rules fire in-sample (MINE half +1 exact pair — precisely a mined compound) and
**do not touch the validation half at all**: their compounds never occur there. Controls stay
clean in every view; the pack columns show the usual denominator rescale, AUC flat.

## Verdict

**The pipeline generalizes end-to-end; rule density is the binding constraint.** Singleton
mining + judge gauntlet correctly extracted the only 2 genuinely valid lexical equivalences
that 60 diverse natural pairs contain — and 2 rules have ≈0 chance of intersecting a disjoint
60-pair sample. Quantified yield: 60 pairs → 12 lexical singletons → ~6 judge-worthy → 2
valid. Closing held-out convergence therefore needs inventory scale (×10–100), i.e. **Tier B
at 1–2k natural sentences (batch 2)** — not more machinery. This is batch 1's last experiment;
what remains is the Batch-1 synthesis report.

Transparency note: the confidence formula's 0.15 "design" term is granted to any
consolidation-typed candidate whose build-time routing lean is lossless (wave-1 behavior,
consistent across rounds); the two validated rules were judge-unanimous with stars
corroboration and clear 0.9 regardless.

Artifacts: `mining/out2/*` (+`minehalf/`), `rules/candidates3.jsonl(.mech)`,
`rules/probes3/`, `rules/validated3.jsonl`, `consolidated/tierC_p4.cons.jsonl` (rebuilt
w1+w2+w3, 390/640 changed, 19 token rewrites).
