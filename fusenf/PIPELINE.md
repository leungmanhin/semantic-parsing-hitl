# FUSE-NF pipeline — current overview (2026-08-26)

The living end-to-end picture. **Supersedes `PLAN.md` §2 as the current overview**
(PLAN.md remains the batch-1 method document); update this file whenever a stage,
brief, or gate changes. Per-stage authorities are named under the diagram — this file
points, it never duplicates doctrine.

```
[corpus build  build_tier*.py + manifests (source shas, dates, filters)]
      │        corpus ROLE fixed here: mining substrate vs measurement-only arm
      ▼
[blind parse fleet  Sonnet @ FROZEN prompt.txt hash]      briefs: PARSE / REPARSE* /
      │  raw/<ID>__run<N>.txt                             M1PARSE / SOLOPARSE; ops per
      ▼                                                   DISPATCH.md (5-item batches,
[assemble + validate  C1–C8, report-only ingestion]       ~8-agent groups, disk-diff)
      │  parses/*.parses.jsonl — append-only, keyed (id, run), per-record hash pins
      │
      ├────────────▶ [blind review  Opus, REVIEW.md]
      │                 coverage: DISPATCH strata (100% findings / ≥10% clean /
      │                 100% provenance-cited / triage-open); EXCEPTION owner
      │                 2026-08-26: 100% for tierD + the run-50 wave
      │                   │  flagged (partial / no)
      │                   ▼
      │              [adjudicate  Opus production, Fable escalation; ADJUDICATE.md]
      │                 refute-don't-obey; owner calibration line
      │                   │
      │         ┌─────────┼──────────────────┐
      │         ▼         ▼                  ▼
      │      accept   minimal repair     prompt-gap report
      │                 │ adjudication/ artifact              │
      │                 ▼                                     ▼
      │         [EXPLICIT promotion → new run,        [fix-pack loop → new prompt.txt
      │          non-blind provenance (run-90 style)]  hash → re-parse defect families]
      │                   │
      ▼                   ▼
[triage dispositions  triage/parse_failures.jsonl  (id, run)-scoped]
      │
      ▼
[substrate gate  harness/substrate.py  (G.2)]
      │  dispositions + STRICT_SEVERITY errors (G.1); run precedence 90>50>40>2>1;
      │  Tier C pair-aware; measurement corpora EXEMPT → mining_substrate.json
      ▼
[canonicalize  fusenf-canon/4] ──▶ canonical graphs + star decomposition
      │
      ├── mining substrate only ─────────────────┐
      ▼                                          │  measurement arms (never mined):
[mining portfolio  mining/]                      │  Tier A answer key, M1 sets,
   frequent_patterns2 (k=4; shape stratum,       │  PAWS held-out 640, tierD MRPC 250
     conjunction expansion, nisurp)              │
   role_fillers2 (valuation export; D.3          │
     prompt_determined_roles.json)               │
   align_pairs (unit + §4 factor granularity;    │
     negative controls; promotability)           │
   MI / AE (patterns2 matrix; Qwen3-8B prior)    │
      │  signals + candidates                    │
      ▼                                          │
[gauntlet  JUDGE.md  Sonnet panels ×3]           │
   mech gates: M4 vs Tier A key, 0 control       │
     merges; provenance review gate              │
     (provenance_audit.py) BEFORE entry;         │
   graded route (G.5): bridging only,            │
     ceiling→strength, per-rule M2 control gate  │
      │                                          │
      ▼                                          │
[rule ledger  rules/validated*.jsonl + retired.jsonl → eval/rule_ledger.md
   + species files  rules/{bridging,consolidation}_rules.{jsonl,metta}
     (mining/combine_rules.py, re-run after every gauntlet round / retirement;
      consolidation .metta = syntax rendering only, never loaded for QA)]
   ├─ consolidation species → [rewriter → packs / consolidated views]
   └─ bridging species → mined_bridges_*.metta (loads beside seeded_rules.metta)
      │                                          │
      ▼                                          ▼
[serving: faithful + bridges = the QA layout]   [measurement  M1 / M2 (PAWS + tierD) /
   packed view BLOCKED for conjunction QA          M3 / M5 atom+conjunction gates]
   until the And-prover fix (item X)               │
      │                                            │  M5 question arm: QGEN (blind
      ▼                                            │  Sonnet) → QPARSE (blind Sonnet +
[PeTTaChainer  pinned b0e24f9]                     │  prompt.txt) → differential harness
   uv run, STEPS=400, timeout_sec=0                ▼
   engine bugs → minimal repros at repo root   eval/*.md reports → BATCH2_REPORT.md
   → upstream → item-X adoption battery
```

## Per-stage authorities

| stage | governing doc / script | notes |
|---|---|---|
| corpus build | `corpora/build_tier{A,B,C,D}.py` + manifests | role (mining vs measurement) is a build-time fact |
| parse | `prompt.txt` (hash = instrument identity) + `PARSE.md` family | freeze-before-dispatch; parsers blind |
| validate | `harness/validator.py` (C1–C8; `STRICT_SEVERITY` per G.1) | ingestion report-only; errors gate substrate only |
| review | `REVIEW.md` + DISPATCH §Review strata | reviewers blind to validator findings; never edit parses |
| adjudicate | `ADJUDICATE.md` + DISPATCH §Adjudication | Opus production / Fable escalation (pilot 2026-08-24) |
| repair→store | explicit promotion, new run number | non-blind provenance; never lands in `raw/` |
| fix-pack loop | gap harvest → `prompt.txt` edit → goldens/e2e/blind batch → re-pin | teach-to-the-test audit; no-recital both ways |
| substrate | `harness/substrate.py` → `mining/mining_substrate.json` | mixed-hash composition surfaced, decided at mining time |
| canonicalize | `harness/canonicalize.py` (`fusenf-canon/4`) | deterministic; mixed versions refused |
| mine | `mining/frequent_patterns2.py`, `role_fillers2.py`, `align_pairs.py`, `wave2/mi_ae.py` | deterministic; doc-support primary |
| gauntlet | `JUDGE.md`, `harness/gauntlet*.py`, `provenance_audit.py` | graded route registered (G.5) |
| serving | `rules/mined_bridges_*.metta` + seeded rules | faithful+bridges is the QA layout |
| measure | `harness/m1_*.py`, `m2_*.py`, `m5_preservation.py`, `m5_questions.py` + `QGEN.md`/`QPARSE.md` | measurement corpora exempt from substrate gating |
| engine | PeTTaChainer @ b0e24f9 | open bugs + feature-reqs listed in memory / repo root |

## Standing cross-cutting rules

Deterministic-first (mechanical → Python; agents only where judgment is required);
translation-faithful (never distort a parse or a query to dodge an engine limitation —
file a repro); never-auto-repair-content (reviewers and validators never edit parses;
adjudicator repairs are artifacts until promoted); append-only parse store (hash changes
never block re-parses; analyses hold hash uniform, storage doesn't); blind-role
placement is part of the measurement design (parsers/reviewers/question-writers see
exactly what their brief names, nothing else).
