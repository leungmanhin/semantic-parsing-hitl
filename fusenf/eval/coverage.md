# Coverage dashboard — current prompt `2ed18b93`

State vocabulary (#51 reshape): never-parsed / clean-unreviewed / verified (review-yes, adjudicated-accept, or triage-included) / flagged-open / defect-awaiting-reparse. Operative parse per id = highest run. **cur-coverage = verified AND at the current hash.** The substrate gate is EXCLUSION-based: clean-unreviewed records are substrate-eligible (sampled-review policy); substrate-elig = total − defect − flagged-open − never-parsed − G.1-belted (error-class validator structure, e.g. free variables, excludes a row from MINING mechanically even when review/adjudication accepted it semantically).

| corpus | role | total | @cur hash | cur-coverage | verified (any hash) | clean-unrev | flagged-open | defect-awaiting | never-parsed | substrate-elig | hash mix (operative) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| tierA | M4 answer key (frozen batch-1) | 402 | 0 | 0 (0%) | 0 | 402 | 0 | 0 | 0 | — | 38fc16af×397 102bba25×5 |
| tierB | substrate | 2000 | 0 | 0 (0%) | 224 | 1732 | 0 | 44 | 0 | 1950 (−6 G.1) | f6448eac×1890 bb7c4b71×110 |
| tierC | substrate | 360 | 0 | 0 (0%) | 47 | 305 | 0 | 8 | 0 | 352 | f6448eac×340 bb7c4b71×20 |
| tierC_heldout | measurement (M2 held-out) | 640 | 0 | 0 (0%) | 7 | 595 | 38 | 0 | 0 | — | 64ad2464×636 102bba25×4 |
| tierD | measurement (M2) | 250 | 0 | 0 (0%) | 86 | 0 | 0 | 164 | 0 | — | bb7c4b71×250 |
| fiction | external consumer (v1 rules) | 138 | 138 | 0 (0%) | 0 | 131 | 7 | 0 | 0 | — | 2ed18b93×138 |
| fiction2 | external consumer (v2 texts) | 109 | 109 | 70 (64%) | 70 | 0 | 0 | 39 | 0 | — | 2ed18b93×109 |
| fiction3 | external consumer (v3 texts) | 108 | 108 | 82 (76%) | 82 | 0 | 0 | 26 | 0 | — | 2ed18b93×108 |
| fixpack | validation | 7 | 0 | 0 (0%) | 0 | 7 | 0 | 0 | 0 | — | f6448eac×7 |
| fixpack3 | validation | 10 | 0 | 0 (0%) | 0 | 10 | 0 | 0 | 0 | — | 2aa57fa8×10 |
| fixpack31 | validation | 4 | 0 | 0 (0%) | 0 | 4 | 0 | 0 | 0 | — | bb7c4b71×4 |
| fixpack4 | validation | 12 | 0 | 0 (0%) | 0 | 12 | 0 | 0 | 0 | — | 1f3bcefc×12 |
| pilot | validation (batch 1) | 20 | 0 | 0 (0%) | 0 | 20 | 0 | 0 | 0 | — | 01839a33×20 |
