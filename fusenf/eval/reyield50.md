# Reyield-50 — blind re-review of the aj50 repair artifacts (2026-08-26)

The 54 Opus repair artifacts from the run-50 adjudication wave (`adjudication/
<ID>__run50.opus.repair.txt`), staged as `raw/<ID>__run90.txt` (pilot pattern; staging
only) and put through the standard 100% blind Opus review — 11 batches `rv90-01..11`,
REVIEW.md wrapper, run number 90, reviewers not told the parses are repairs. Both the
repairs and the judging standard are at `bb7c4b71` — **no standard-drift confound**
(the pilot's era gap does not apply; every residual here is real against the
contemporaneous instruction set). Machine-readable wave result:
`review_batches/rv90_wave_result.json`.

## Verdicts

**25 yes / 24 partial / 5 no = 46% clean repair yield** (pilot: 42% under drift).
Zero unlicensed heads, zero context leaks, 50/54 flag coverage gaps (gaps are
sentence facts, not repair defects). Transitions from the run-50 review of the same
records (51 partial / 3 no): partial→yes 25, partial→partial 23, partial→no 3,
no→partial 1, no→no 2.

Mechanical validation of the staged files (assemble `--dry-run`, both tiers):
45 clean / 9 with findings — **C4 ×8 report-only** (RightBehind, Hunt, Mean ×3,
Related, And-arity-11 informational, InTermsOf — all open-class-consistent or
attestation notes) + **C6 ×1** (tierB-001571, Time-on-entity shape). Zero
error-severity findings among the promotion candidates; the C6 record is in the
partial set.

## Promotion candidates (owner decision pending)

25 records, 22 tierB + 3 tierC — blind-verified clean, no error-severity findings
(4 carry benign C4 reports: tierB-000375/000431/000869/001907):

tierB-000354 000364 000375 000420 000431 000492 000641 000654 000869 000933 000967
000970 001066 001135 001436 001467 001585 001660 001664 001873 001906 001907;
tierC-000040 000062 000206.

tierB-000654 closes the full loop begun in the pilot (pilot repair → reparse-queued →
run-50 re-parse → flagged → run-50 repair → verified clean).

Proposed mechanics on owner go (pilot precedent): assemble `--runs 90` for the 25 with
batch `adjudicated-repair-nonblind`, model `claude-opus-5`, prompt pin `bb7c4b71`
(the authoring standard — no drift this time), seeded pin `b7e25b96…`; flip triage to
`repaired-promoted-r90`; prune the 29 non-verified staging files from `raw/`.

## The 29 non-verified

- **24 partial**: residual issues concentrate in fix-pack-4 ledger families —
  superlative carriers (one-of-N: 000436, 001144), degree adverbs dropped
  (quite/dangerously: 000592, tierC-000157), QuantifierPhrase companions missing/wrong
  (000027, 001571, 000223), plural/group distribution (001897, tierC-000044),
  restriction-stripping or over-widening (001483, 001826, 000347), connective carriers
  (adversative "but" 001301, concessive 000348/001489), frequency-word encoding
  (001571). The pilot's lesson operates forward: these wait for fix-pack 4 and
  re-parse at the new hash rather than a second hand-repair round. Disposition:
  stay `review-defect` (substrate-excluded).
- **5 no**: 4 are **deletion-dominant repairs** (statement counts run50→run90:
  001229 2→1, 001369 5→2, 000684 7→3, 001144 3→2) — the pilot's "652 pattern": the
  adjudicator deleted false/ill-typed content per doctrine and the remainder no longer
  carries the sentence; both roles behaved correctly, the record is unservable until
  the underlying gap is designed (counterfactual conditional; "on the verge of"
  predicate; feels-comparative with conditioning adjunct; specificational
  superlative). tierB-001562 (8→7) is a content repair whose sealed factive
  complement is still empty. Candidates for `excluded-deferred-gap` at the owner's
  discretion; otherwise they ride `review-defect` into the FP4 loop.

## Provenance notes

- 4 of the 54 records had pilot-era re-review verdicts at the same path pattern
  (their pilot repairs were reviewed, records then reparse-queued and re-repaired at
  run 50): tierB-000436, tierB-000654, tierB-001826, tierC-000157. The pilot files
  were renamed `review/<ID>__run90.pilot-reyield.review.json` before dispatch — both
  eras preserved.
- Staging collision-check against the 11 already-promoted run-90 records: zero
  overlap; run 90 is reusable for promotion with `harness/substrate.py` unchanged.
- Wave ops: 11 Opus agents (8+3), 0 incidents, disk-diff exact (54/54 verdicts,
  schema-conformant, id/run fields correct).

## §promotion — EXECUTED (owner go, 2026-08-26)

Owner decisions: promote the 25; partials stay `review-defect` (FP4 loop); the 5 "no"
split per recommendation — tierB-001144 + tierB-001562 → `review-defect` (FP4-covered /
existing-doctrine defect), tierB-000684 + tierB-001229 + tierB-001369 →
`excluded-deferred-gap` (feels-comparative w/ conditioning adjunct; counterfactual
conditional; proximative "on the verge of").

Mechanics run in order: (1) 29 non-verified staging files pruned from `raw/`
(adjudication artifacts untouched); (2) run-50 triage rows flipped — 25 →
`repaired-promoted-r90`, 3 → `excluded-deferred-gap`, 26 remain `review-defect`;
(3) assembled `--runs 90`, batch `adjudicated-repair-nonblind`, model `claude-opus-5`,
pins `bb7c4b71`/`b7e25b96` (authoring standard — same-hash promotion, no drift):
tierB 22 (18 clean / 4×C4 report-only), tierC 3 (clean), 152 statements; (4) the 4
promotion-time `(id, 90)` triage rows assemble writes as `open` flipped to
`repaired-promoted-r90` — plus **one latent-bug fix: `tierB-000982`, the pilot's
"1 C4 at promotion" record, still sat `open` at (id, 90) and was being wrongly
excluded by the substrate gate since the pilot promotion** (visible as
`disposition:open: 1` in the G.2 manifest); flipped with pilot-crediting provenance.

Substrate verification (canonical store set — recorded here because the G.2 report
never spelled it out): `--store` tierB + tierC_p1 + tierC_p2 + tierC_p3 + tierC_r40 +
tierC (the last two carry newer runs for the same ids: D.4 run-40 + fix-loop/promoted
run-90 rows); measurement stores (tierC_p4 = PAWS held-out 640, tierC_m1*, tierA_m1*,
tierD) never enter; `--allowed-hash f6448eac bb7c4b71`. Result: **2,360 ids (= G.2
exactly) → 2,302 included / 58 excluded**; delta vs G.2's 2,205 = +76 run-50 clean
+25 promoted +1 tierB-000982 −5 validator:C6 belt = +97 ✓. Exclusions: 45
review-defect, 7 excluded-deferred-gap, 5 validator:C6, 1 validator:C3+C6+C7.
Hash composition surfaced for the mining-time call: 2,206 @ f6448eac + 96 @ bb7c4b71.
Pair-incomplete 18 → 8 (wave healed ten tierC pairs). Run 90 now holds 36 records
(11 pilot + 25 reyield-50).
