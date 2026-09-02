# FUSE-NF pipeline — current overview (2026-08-26)

The living end-to-end picture. **Supersedes `PLAN.md` §2 as the current overview**
(PLAN.md remains the batch-1 method document); update this file whenever a stage,
brief, or gate changes. Per-stage authorities are named under the diagram — this file
points, it never duplicates doctrine.

**Record lifecycle (#51 reshape, owner 2026-08-29 — five states, no repair branch):**
`parsed@hash → clean | flagged`; `flagged → adjudicated-accept | defect`;
`defect → awaiting-reparse` (swept by the next pinned hash's re-parse). Repairs, run-90
staging, and promotion decisions are RETIRED (existing run-90 records stand as history);
coverage of the current prompt over a corpus = % of records with a current-hash parse
that is review-clean or adjudicated-accept — see `harness/coverage.py`.

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
      │              [adjudicate  FABLE, sole tier (owner 2026-08-29); ADJUDICATE.md]
      │                 refute-don't-obey; owner calibration line; NO repairs
      │                   │
      │              ┌────┴──────────────────────┐
      │              ▼                           ▼
      │           accept                  defect → EXCLUDED (awaiting-reparse)
      │              │                           │  gap harvest (reviewer + adjudicator)
      │              │                           ▼
      │              │                  [fix-pack loop → new prompt.txt hash →
      │              │                   next batch re-parses the awaiting pool]
      │              │
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
   routing (#50, FUZZY 2026-09-02): consolidation│
     | rejected — hard gates = 0 control merges  │
     + same-truth ONLY; loss = annotation        │
     (fuzzy ok); frozen-head gate RETIRED,       │
     rewrites filed as prompt-side evidence;     │
     G.5 graded route RETIRED                    │
      │                                          │
      ▼                                          │
[rule ledger  rules/validated*.jsonl + retired.jsonl → eval/rule_ledger.md
   + the SINGLE species file  rules/consolidation_rules.{jsonl,metta}
     (mining/combine_rules.py, re-run after every gauntlet round / retirement;
      .metta = syntax rendering only, never loaded; #50 owner 2026-09-01:
      consolidation is FUSE-NF's only species — batch-1 bridging artifacts
      stay on disk as experimental records, not deliverables)]
   └─ consolidation rules (kinds: lexical-collapse · subtree-collapse "packs" ·
      structural-alt · modifier-prune · role relabels; each carries a loss annotation)
        → [rewriter → consolidated views + a normalized seeded-rule view]
        → [query normalizer harness/normalize_query.py (built at H): the SAME
           rules re-express every query at submission; partial pack queries =
           pack ∪ residual; e2e-under-normalization = the frozen-gate replacement]
      │                                          │
      ▼                                          ▼
[serving: consolidated view + normalized        [measurement  M1 / M2 (PAWS + tierD) /
   queries + normalized seeded view (#50 target;   M3 / M5 atom+conjunction gates]
   M5 + e2e-under-normalization validate at H)
   (batch-1 faithful+bridges layout = history;     │
   full-bundle pack queries sidestep item X)]      │
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
| parse | `prompt.txt` (hash = instrument identity) + `briefs/PARSE.md` family | freeze-before-dispatch; parsers blind |
| validate | `harness/validator.py` (C1–C8; `STRICT_SEVERITY` per G.1) | ingestion report-only; errors gate substrate only |
| review | `briefs/REVIEW.md` + DISPATCH §Review strata | reviewers blind to validator findings; never edit parses |
| adjudicate | `briefs/ADJUDICATE.md` + DISPATCH §Adjudication | FABLE sole tier (2026-08-29; supersedes the 2026-08-24 Opus-production pilot); accept/defect, no repairs |
| ~~repair→store~~ | RETIRED 2026-08-29 (#51) | historical run-90 promotions stand; defects await the next hash's re-parse |
| fix-pack loop | gap harvest → `prompt.txt` edit → goldens/e2e/blind batch → re-pin | teach-to-the-test audit; no-recital both ways |
| substrate | `harness/substrate.py` → `mining/mining_substrate.json` | mixed-hash composition surfaced, decided at mining time |
| canonicalize | `harness/canonicalize.py` (`fusenf-canon/4`) | deterministic; mixed versions refused |
| mine | `mining/frequent_patterns2.py`, `role_fillers2.py`, `align_pairs.py`, `wave2/mi_ae.py` | deterministic; doc-support primary |
| gauntlet | `briefs/JUDGE.md`, `harness/gauntlet*.py`, `provenance_audit.py` | #50 routing: consolidation\|rejected, no demotion tier; G.5 RETIRED 2026-09-01 |
| serving | consolidated views + `harness/normalize_query.py` (H) + seeded rules | #50 query-side normalization; batch-1 bridge files = historical records |
| measure | `harness/m1_*.py`, `m2_*.py`, `m5_preservation.py`, `m5_questions.py` + `briefs/QGEN.md`/`briefs/QPARSE.md` | measurement corpora exempt from substrate gating |
| engine | PeTTaChainer @ b0e24f9 | open bugs + feature-reqs listed in memory / repo root |

## Standing cross-cutting rules

Deterministic-first (mechanical → Python; agents only where judgment is required);
translation-faithful (never distort a parse or a query to dodge an engine limitation —
file a repro); never-auto-repair-content (NOBODY edits parses — reviewers, validators,
and since the 2026-08-29 reshape the adjudicator too; a parse is replaced only by a
fresh blind parse at a pinned hash); append-only parse store (hash changes
never block re-parses; analyses hold hash uniform, storage doesn't); blind-role
placement is part of the measurement design (parsers/reviewers/question-writers see
exactly what their brief names, nothing else); instruments are revisable (owner
2026-09-01) — metrics, gates, and routings are our own creations, so retire or reshape
a misfit instrument rather than bending the pipeline around it (results already
produced under a retired instrument stand as records). Fuzzy consolidation (owner
2026-09-02, paper §3.2): loss is recorded, never gated — the hard gates are error gates
(control merges, same-truth); the faithful store stays the record, so fuzz is reversible.

## Letter-code legend (single source; added 2026-09-01)

Global families (live):
- **Tier A/B/C/D** — corpora: A engineered answer-key (M4 instrument), B Tatoeba general,
  C PAWS pairs (1–360 substrate; 361–1000 = `tierC_heldout`), D MSRP-test newswire (M2 arm).
- **C1–C8** — validator checks (`specs/schema.md` §5.1; code list in `harness/validator.py`):
  C1 id contract · C2 s-expression structure · C3 assertion shape · C4 vocabulary ·
  C5 casing · C6 free variables · C7 chainer load · C8 duplicates.
  Severity (G.1): C1/C2/C3/C6/C7 = error (substrate-excluding), C4/C5/C8 = report-only.
- **M1–M5** — metrics (`specs/metrics.md`): M1 parse stability · M2 paraphrase convergence
  vs control separation (headline) · M3 compression · M4 rule quality vs the Tier-A
  answer key · M5 chainer QA preservation (+ question arm).
- **G.1–G.6** — the six pre-flight gates of batch-2 item G (`eval/preflight_g.md`):
  G.1 severity map · G.2 substrate gate · G.3/G.4 mechanical checks · G.5 graded-bridge
  route (RETIRED 2026-09-01, #50) · G.6 tierD measurement arm.
- **A–H, X** — batch-2 plan items (`docs/BATCH2_PLAN.md` headings); "the H run" = item H,
  the Tier-B campaign/mining centerpiece; X = the event-triggered engine-fix slot.
  **D.N** = owner decisions under item D (e.g. D.4 = the Tier-C in-sample re-parse ride-along).
- **q1–q4** — review verdict fields (`briefs/REVIEW.md`, schema §5.2): q1 faithful ·
  q2 coverage · q3 context leak · q4 unlicensed heads.
- **pack / packed view / `Mn*`** — one rule KIND (`subtree-collapse`, the paper's §4.4 operation),
  not a species: a pack rule rewrites a k-atom bundle sharing one event symbol into a single
  meta-node atom (`Mn` = meta-node, then the slot signature: `MnEvAgTh` = Event+Agent+Theme);
  "pack" is our round-2 coinage for the rule/verb, "packed view" = a consolidated view with
  packs applied. Other kinds: `lexical-collapse` (symbol substitution), `structural-alt`
  (frame alternation), `modifier-prune` (drop a redundant modifier — fuzzy, 2026-09-02),
  `role-canonicalization` / `role-interchange` (role relabels, also filed as prompt-side
  evidence). Every validated rule carries a `loss` annotation (`none|manner|degree|sense|other`;
  fuzzy = not none) — see `specs/metrics.md` §M5 Fuzziness governance.
- **FP0…FP4 (and B2)** — fix-pack lineage; **#1–#51** — the deferred-topics backlog
  (memory-side); **runs 1/2/30/40/50/90** — run-number ledger (`DISPATCH.md`).
- **Batch-file prefixes** (`batches/<stage>/`): pb parse · rv review (rv9d = tierD repair
  re-review) · aj adjudication · dg diagnosis · qg/qp question gen/parse · fc/fb FP4
  conformance/blind · fx fiction run-2 · p48 the #48 pilot. Wrappers in `DISPATCH.md`.

Scoped or historical (read inside their own doc only; letters are NOT global):
- **P1–P4** — batch-1 plan PHASES (`docs/BATCH1_PLAN.md`, `eval/p*_checkpoint*`).
  Historical; retired from the live spec docs 2026-09-01. Distinct from lowercase store shards
  `tierC_p1..p3` (parse waves; the old `_p4` shard is renamed `tierC_heldout`).
- **S1–S4 / D1–D2** — FP3's new sections / designed rules (`eval/fixpack3.md`).
- **A1–A6, B1–B8, C1–C10, D1–D6, E** — FP4 scope tiers & decision points
  (`eval/fixpack4_scope.md`; its C/D numbering is pack-local, unrelated to validator C-codes).
- **Groups A–T** — prompt construct groups (representation conventions; prompt.txt).

Convention going forward: new letter schemes must be doc-local and defined at first use;
anything meant to be global gets added HERE.
