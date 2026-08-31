# Coverage dashboard — current prompt `2ed18b93`

State vocabulary (#51 reshape): never-parsed / clean-unreviewed / verified (review-yes, adjudicated-accept, or triage-included) / flagged-open / defect-awaiting-reparse. Operative parse per id = highest run. **cur-coverage = verified AND at the current hash.** The substrate gate is EXCLUSION-based: clean-unreviewed records are substrate-eligible (sampled-review policy); substrate-elig = total − defect − flagged-open − never-parsed.

| corpus | role | total | @cur hash | cur-coverage | verified (any hash) | clean-unrev | flagged-open | defect-awaiting | never-parsed | substrate-elig | hash mix (operative) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| tierA | substrate (batch 1) | 402 | 0 | 0 (0%) | 0 | 402 | 0 | 0 | 0 | 402 | 38fc16af×397 102bba25×5 |
| tierB | substrate | 2000 | 0 | 0 (0%) | 224 | 1732 | 0 | 44 | 0 | 1956 | f6448eac×1890 bb7c4b71×110 |
| tierC | substrate | 1000 | 0 | 0 (0%) | 47 | 309 | 0 | 8 | 636 | 356 | f6448eac×340 bb7c4b71×20 102bba25×4 |
| tierD | measurement (M2) | 250 | 0 | 0 (0%) | 86 | 0 | 0 | 164 | 0 | — | bb7c4b71×250 |
| fiction | external consumer | 138 | 138 | 0 (0%) | 0 | 131 | 7 | 0 | 0 | — | 2ed18b93×138 |
| fixpack | validation | 7 | 0 | 0 (0%) | 0 | 7 | 0 | 0 | 0 | — | f6448eac×7 |
| fixpack3 | validation | 10 | 0 | 0 (0%) | 0 | 10 | 0 | 0 | 0 | — | 2aa57fa8×10 |
| fixpack31 | validation | 4 | 0 | 0 (0%) | 0 | 4 | 0 | 0 | 0 | — | bb7c4b71×4 |
| fixpack4 | validation | 12 | 0 | 0 (0%) | 0 | 12 | 0 | 0 | 0 | — | 1f3bcefc×12 |
| pilot | validation (batch 1) | 20 | 0 | 0 (0%) | 0 | 20 | 0 | 0 | 0 | — | 01839a33×20 |
