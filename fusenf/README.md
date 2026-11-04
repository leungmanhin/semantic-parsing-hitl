# fusenf — the FUSE-NF mining thread

- `docs/` — the FUSE-NF paper, the Next-Steps recommendations, and the NESS material.
- `reference/` — the batch-1 implementations of the five mining methods, kept as reference records only
  (frequent patterns, role fillers, mutual information, paraphrase alignment, the autoencoder, the tier splits).
  Their data — raw parses, canonical forms, mining outputs, reviews, the harness — lives at the git tag
  `batch1-records`, the last commit that holds it.
- `mine/` — the implementation of the five methods on the catalog-era parses (templates/ + datasets/), per the
  §5 decisions of the Next-Steps walkthrough.
- `runs/` — the runs' outputs: candidate records with their evidence, reports.

The legacy parser line (prompt.txt, seeded_rules.metta, the regression harness) is at the tag `legacy-line`.
