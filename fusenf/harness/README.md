# FUSE-NF harness

Deterministic components. Orchestration (spawning parser agents) happens outside Python —
agents write raw output to `fusenf/raw/<id>__run<N>.txt`; everything below is code.

    corpora/<t>.jsonl  +  raw/*.txt   --assemble.py-->  parses/<t>.parses.jsonl  (+ triage/)
    parses/<t>.parses.jsonl           --canonicalize.py-->  canonical/<t>.canon.jsonl
    canonical/<t>.canon.jsonl         --m1_stability.py-->  eval/m1_stability.md

Specs: `../specs/schema.md` (records + checks C1-C8), `../specs/canonicalization.md`,
`../specs/metrics.md`. Run everything with /home/manhin/Dev/.venv-dev/bin/python.
