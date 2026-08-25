# Item G — pre-flight checklist (gates H) — 2026-08-25

Status: **ALL SIX GATES GREEN — G.1–G.4 mechanical (2026-08-25), G.5–G.6 decided by the
owner same day (rulings in `rules/owner_decisions.jsonl`). H is unblocked.**

## G.1 — STRICT_SEVERITY set from the observed distribution ✓

Campaign distribution (2,360 records @ `f6448eac`, per-code record rates): C4 3.4%,
C6 0.55%, C3/C7 one record each (the same record), C1/C2/C5/C8 zero. Joined against
blind review: C4 = 13% precision / 100% recall (the G.1 calibration pair — the raw flag
is not the violation signal, the review join is); C6 = 12/13 flagged records carry
review issues (1 hard "no" — the negation-inside-seal record); the single C3+C6+C7
record is a query-shaped statement with free variables (mechanically unusable, blind
review nonetheless graded it "yes" — the validator catches what review forgives).

Final map (`harness/validator.py`, rationale inline): **C1/C2/C3/C6/C7 = error**
(structural unusability + the calibrated C6 signal), **C4/C5/C8 = report** (calibrated
low precision / zero observations / benign redundancy). Two tiers only; the "warn" tier
is retired. Ingestion stays report-only — `error` gates the MINING substrate (G.2),
nothing is discarded at assembly.

## G.2 — exclusion-by-disposition flow LIVE ✓

`harness/substrate.py` (new; deterministic, rerun byte-identical): builds the mining
substrate manifest from the parse stores. Two channels: triage dispositions
(review-defect / reparse-queued / excluded-deferred-gap / open exclude; reviewed-ok /
adjudicated-ok / accepted-with-gap / repaired-promoted-r90 include; unknown dispositions
REFUSE the run) + G.1 validator errors (the mechanical belt for records sampled review
never saw). Run precedence: highest run at allowed hashes wins (90 > 40 > 2 > 1), no
fallback past an excluded winner. Tier C pair-awareness: an excluded side annotates its
mate `pair_incomplete` (18 such) so the alignment channel's pair loss is explicit, never
silent. Measurement corpora exempt by construction (M1 keeps its unstable parses).

First run: **2,360 → 2,205 included** (155 excluded: 141 review-defect, 8 reparse-queued,
4 deferred-gap, 1 open, **1 validator:C3+C6+C7** — the belt working); hash composition
uniform `f6448eac`. The manifest reports composition because H will face the mixed-hash
question (campaign parses + the ~158-record re-parse wave @ `bb7c4b71`) — surfaced for
the H runbook, not decided here.

## G.3 — standing sampled review + review-by-provenance gauntlet gate ✓

All four DISPATCH.md strata exercised at scale in batch 2 (findings 100%, clean-sample
227, provenance via item A's 234-record audit, triage-open). The gauntlet-entry gate is
wired as the H runbook step: `provenance_audit.py --harvest` over a candidate's cited
records → blind review of any unreviewed citation → `--ingest` → failing evidence
recomputes support (below threshold = suspended with a ledger entry). Tooling
operational (exercised in item A: 3 role bridges retired by exactly this path).

## G.4 — vocab attest + brief inventory ✓

`vocab_attest` @ 2026-08-25: **0 unknown / 0 arity / 0 deprecated**; pin matches the
current hash `bb7c4b71`; 4 declared-but-unattested heads (Despite / EvenThough /
FoldAll / Probably — informational: declared, awaiting first attested use). Brief
inventory: **zero pending** — QGEN.md and QPARSE.md went standing with item F, so every
agent role in the DISPATCH.md table now has a standing brief.

## G.5 — DECIDED: graded-lexical-bridge route REGISTERED ✓ (owner, 2026-08-25)

`JUDGE.md task: grade` goes active for H's gauntlet, **bridging species only** (never
consolidation/packs): judges assign direction + strength ceiling (0.6/0.7/0.8 per the
brief's existing grade spec) to lexical-equivalence candidates, so near-synonyms enter
WEAK instead of dying binary. TV mapping: strength = the judge ceiling; confidence =
the support formula unchanged. **Hard safety gate: zero induced control merges on the
M2 adversarial arm per graded rule** before the ledger keeps it. Evidence basis: the
D.2 doctor/physician asymmetric-TV and AE-0.85-cap precedents + item F's demand-side
data (natural rewordings the binary inventory misses: obtain/acquire, wreck/destroy,
stroll/walk). DISPATCH.md §Judge updated; dormancy note retired.

## G.6 — DECIDED: MRPC arm ADDED at pilot scale ✓ (owner, 2026-08-25)

**`corpora/tierD.jsonl` built**: MRPC TEST split (pinned in-repo, sha256 `0360d0d3…`,
mirror URL + fetch date in `tierD_manifest.json`), deterministic hash-order selection,
75 paraphrase + 50 labeled non-paraphrase controls = 125 pairs / 250 records; light
filters (5–30 words, printable, identical-pair drop; eligible pool 1,146/576). The
source choice validates immediately: **125/125 selected pairs carry lexical variation**
(PAWS: ~87% word-order-only). Record shape mirrors tierC (`pairD-*` classes, sides a/b,
per-record `input_sha256`); `align_pairs.py`'s pair-prefix check generalized to
`("pairC","pairD")` (wave-1 behavior unchanged — no pairD existed). Quora rejected for
M2 (questions — type mismatch; future question-arm material). Parsing rides H's fleet
at `bb7c4b71` (250 sentences = 50 batches); M2's MRPC arm reads it as a second held-out
surface beside PAWS.
