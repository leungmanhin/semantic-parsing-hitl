# Logical templates — pilot (exploratory)

Parsing as recognition: a blind parser fills pre-defined templates; code renders the atoms.
Nothing here changes `prompt.txt`, the briefs under `fusenf/briefs/`, or any pipeline store.

| path | what |
|---|---|
| `INVENTORY.md` | prompt.txt read as a registry: 110 statement templates, gap codes, the nesting order and its rules |
| `registry/starter26.yaml` | THE single source for the pilot: slot specs, criteria, examples, parameters (quote the keys `"on"`, `"n"`, `"y"`) |
| `tmpl/records.py` | R1–R8, mechanical checks on template instance records |
| `tmpl/emitter.py` | records → atoms: symbols, witness numbers, truth values, proof names, nesting, projection |
| `tmpl/genprompt.py` | registry → `generated/PROMPT_T26.txt`; example renderings come from the emitter |
| `tmpl/goldens.py` | reads `regression/regression_cases.md`; head-based coverage prediction |
| `tmpl/pilot.py` | `select` · `batches` · `assemble` · `score` · `report` · `examples` |
| `tmpl/c7.py` | engine-load check (runs under PeTTaChainer's environment, imports only the harness validator) |
| `tests/test_emitter.py` | emitter vs prompt.txt's own examples, the nesting rules, determinism, example freshness |
| `briefs/TPARSE.md`, `briefs/CPARSE.md` | blind briefs: template arm, control arm |
| `pilot/PREREG.md` | pre-registration (proposed thresholds, not yet adopted) |
| `pilot/manifest.json` | sampling rule, item ids, hashes of every instrument |
| `pilot/out/*.REPORT.md`, `*.PAIRS.md` | summary and side-by-side mismatches per set |

## Recipes

    P=python            # an environment with pyyaml (and petta for the type checker)
    $P templates/tests/test_emitter.py                       # from the repository root
    cd templates
    $P -m tmpl.genprompt                                     # after ANY registry edit
    $P -m tmpl.pilot select --date <YYYY-MM-DD>              # refreshes manifest hashes
    $P -m tmpl.pilot assemble --set <dev|gold|tiera> --arm <t26|ctl> --runs 3 --date <YYYY-MM-DD>
    $P -m tmpl.pilot score  --set <set> --arm <arm>
    $P -m tmpl.pilot report --set <set>
    STEPS=400 python templates/tmpl/c7.py <parses.jsonl>      # in the chainer's environment

Dispatch wrapper for a blind parser (nothing else):

    Read <repo>/templates/briefs/<TPARSE|CPARSE>.md and follow it exactly.
    Your batch file is <repo>/templates/pilot/batches/<set>/<batch>.txt.
    Run number: <N>.

### Catalog (one template per file) and the generic emitter

- `catalog/<id>.yaml` is a whole template: trigger (construction, boundary), slots with their
  substrate class, `mints`, `emits` shapes, notes, `examples.shown` / `examples.held_out`.
  `python -c "from tmpl import catalog; catalog.load()"` checks the structural invariants.
- `tmpl/emit.py` renders instances through the shapes (nothing template-specific in code);
  `from tmpl import emit; emit.emit(item)` → statements + declarations. Tests: `python tests/test_emit.py`.
- `python -m tmpl.render_prompt` renders the parser's instruction set from the catalog (shared text in
  `catalog/_general.yaml`, only `shown` examples, each with its emitted rendering) → `generated/PROMPT_CATALOG.txt`.
  Tests: `python tests/test_render_prompt.py`.

- `../semantic-parse.py "<sentence>"` sends one sentence with the generated catalog prompt to an LLM
  (`--provider google|openai`, `--model`, `--effort`, `--out run.json`, `--dry-run`; keys from the
  environment, e.g. `GEMINI_API_KEY`). No temperature is sent unless `--temperature` is given (Gemini 4
  Argon ignores sampling parameters; Gemini 3 is meant to run at its default). The suite runner uses it
  for blind parses.

### Suite runner (`tmpl/suite.py`)

    python -m tmpl.suite check                                   # catalog-wide checks, no LLM call
    python -m tmpl.suite collect --template transfer --runs 3 \
        --provider google --model gemini-4-argon --effort low    # one call per held-out case and run
    python -m tmpl.suite score --template transfer               # or --all → suite/out/REPORT.md

- `check`: every example emits; abstain targets exist (else listed as PENDING, the worklist of
  templates to write) and, when they exist, claim the sentence in their own examples without firing
  the abstaining template; a sentence that is a firing example of two templates with different
  expected atoms is an OVERLAP; no held-out sentence is a shown sentence anywhere; gap codes exist;
  no example sentence comes from prompt.txt, the goldens or a corpus.
- `collect` stores one run record per call under `suite/raw/<template>/<key>.r<n>.json` and is
  resumable (stored replies are skipped; `--force` re-requests). `--section shown` parses the prompt's
  own examples (a smoke test, not a regression); `--only <words>`, `--limit N`, `--delay s`,
  `--dry-run`. The parser sees only a hash as the item id.
- `score` renders every reply through the emitter and compares the atoms with the expected instances'
  atoms label-independently (witness symbols up to a bijection, bundles unordered), classifies each
  (case, run) by category, type-checks every emitted parse (C9, when `petta` is importable), and writes
  `suite/out/<template>.scores.jsonl`, `summary.json`, `REPORT.md` (selection, fill, stability, usage,
  the parser's `issues`, the per-run view of every abstain case, mismatches with leaf-level diffs).
  Records collected under another instruction set are counted as stale. Tests: `python tests/test_suite.py`.

### Atom-type substrate and type checker (C9)

- Source: `atom-type-substrates.json` (hand-maintained). Render: `python -m tmpl.gen_substrate` →
  `ATOM-TYPE-SUBSTRATES.md` (review) + `generated/atom-types.metta` (PeTTa declarations). Never edit
  the generated files.
- Check parses: `python -m tmpl.typecheck <statements.jsonl|.metta> [--no-infer] [--report out.json]`
  (needs the `petta` package). A record may carry
  `declarations` (the emitter's `(: sym Sort)` lines); without them types are inferred from usage,
  which only surfaces type errors as `type-conflict` / `type-warning`. Tests:
  `python tests/test_typecheck.py`.

## Rules of the road

- Freeze before dispatch: never regenerate the instruction set while a parser is in flight.
- Clear an arm's raw files for the items about to be re-parsed; an agent must never meet an
  existing parse (archive first: `pilot/raw_dev_v*/`).
- Examples in the registry never reuse a sentence from prompt.txt, the goldens or any corpus
  (enforced by a test).
- Pilot output never enters `fusenf/raw` or `fusenf/parses`.
