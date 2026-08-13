# M2 preview — the "before" column, zero parse spend (2026-08-07)

Tool: `harness/m2_convergence.py` (reusable — it is the real M2's distance implementation).
Data: the 360 already-parsed Tier C records (arm 1, prompt `38fc16af20`, canon/4) → **178 complete
paraphrase pairs** after pair-signature dedup (2 duplicate pairs in range); noise floors from the
M1 runs; 400 seeded random cross-class pairs as an easy reference. `d = 1 − soft_jaccard`.

| set | pairs | d_content mean (95% CI) | median | exact content_id |
|---|---|---|---|---|
| **paraphrase pairs (d_pos)** | 178 | **0.244** (0.209–0.286) | 0.200 | **0.354** |
| same-sentence, old prompt `38fc16af20` | 60 | 0.375 (0.287–0.462) | 0.385 | 0.333 |
| same-sentence, current prompt `64ad24645a04` | 60 | 0.234 (0.166–0.314) | 0.111 | 0.450 |
| random cross-class | 400 | 0.986 (0.982–0.989) | 1.000 | 0.000 |

(`d_graph` tracks `d_content` within ~0.02 everywhere; full histograms in the tool output.)

## Three findings

**1. The paraphrase signal already sits AT the parse-noise floor.** Under the prompt that parsed
them, two *different* sentences of a paraphrase pair land as close to each other (0.244) as —
actually closer than — two independent runs of the *same* sentence (0.375). PAWS positives are
high-overlap by construction, but the conclusion holds either way: **what separates paraphrase
sides today is parse instability, not paraphrase divergence.** Consolidation's job on positives
overlaps heavily with what stability work already does.

**2. A third of positives converge exactly with zero consolidation.** 35.4% identical
`content_id` (32.6% identical `graph_id`) — the spec's "exact-hash-match rate on positives" row
is already substantial before any mined rule exists.

**3. The dynamic range is enormous.** Cross-class pairs sit at 0.986 with literally zero mass
below 0.75 and zero exact matches; positives have 37% of mass below 0.15. Against this
reference the θ-rule's AUC is ≈ 1.0. The *pre-registered* control arm (PAWS adversarial
lookalikes, records 601–1000) is a much harder reference and remains the open question — but
parse noise is clearly NOT the binding constraint on M2's measurability.

## Verdict on the option-1 question

**M2 survives ~0.45 parse stability with room to spare.** Noise enters both columns of the
before/after comparison identically (the spec computes them with the same procedure), the
positive-arm distances are already noise-dominated rather than divergence-dominated, and the
current prompt's floor (0.234 → exact 0.450) is ~38% better than the one the 360 were parsed
under — so a same-hash re-parse would start M2 from a still-better baseline.

## Caveats, stated plainly

- The 178 pairs are arm-1-complete pairs only (of 495 distinct); the 601–1000 **control arm is
  unparsed**, so criterion 2 (controls stay apart) is untested against *adversarial* controls.
- One run per side (that is the M2 spec's design; run-to-run luck cuts both ways).
- The positives were parsed under the OLD prompt. The spec requires **same prompt hash** across
  compared records — a clean M2 therefore parses the control arm *and* re-parses the positive
  arm under one current hash. That is the real cost line for the full M2, and it belongs to P4;
  nothing forces it before P3 mining.
