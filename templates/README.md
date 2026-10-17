# Logical templates — the catalog

Parsing as recognition: a blind parser fills pre-defined templates; code renders the atoms.
Nothing here changes `prompt.txt`, the briefs under `fusenf/briefs/`, or any pipeline store.

| path | what |
|---|---|
| `catalog/<id>.yaml` | one template per file: trigger, slots, mints, emits, notes, examples (`shown` / `held_out`) |
| `catalog/_general.yaml` | the shared prompt text: intro, output contract, identifiers, lemmas, abstain rule, gap codes, issue codes |
| `atom-type-substrates.json` | the typed substrate, hand-maintained; rendered to `ATOM-TYPE-SUBSTRATES.md` (review) and `generated/atom-types.metta` (PeTTa declarations) |
| `generated/PROMPT_CATALOG.txt` | the parser's instruction set, rendered from the catalog; never edited by hand |
| `tmpl/catalog.py` | loader and structural checks |
| `tmpl/emit.py` | generic emitter: instances → statements + declarations |
| `tmpl/render_prompt.py` | catalog → instruction set |
| `tmpl/typecheck.py` | C9: statements type-checked against the substrate with PeTTa |
| `tmpl/validate.py` | post-parse validator: contract, emitter checks, graph lints, C9 |
| `tmpl/suite.py` | suite runner: `check` · `collect` · `score` |
| `tmpl/gen_substrate.py` | substrate source → review document + declarations |
| `suite/raw/<template>/` · `suite/out/` | stored run records · scores, summary, `REPORT.md` |
| `INVENTORY.md` | prompt.txt read as a registry of constructions: the coverage worklist (its template ids are historical) |
| `tmpl/frequency.py` → `FREQUENCY.md` | which verb classes and constructions the parsed corpora contain, and what share the live templates claim |
| `../semantic-parse.py` | one sentence → instances via an LLM, validated |

## Recipes

    P=python            # an environment with pyyaml (and petta for the type checker)
    cd templates
    $P -m tmpl.gen_substrate                                 # after editing atom-type-substrates.json
    $P -m tmpl.render_prompt                                 # after ANY catalog edit → generated/PROMPT_CATALOG.txt
    $P -m tmpl.suite check                                   # catalog-wide checks, no LLM call
    $P -m tmpl.suite collect --template <id> --runs 3 \
        --provider google --model gemini-4-argon --effort low    # one call per held-out case and run
    $P -m tmpl.suite score --template <id>                   # or --all → suite/out/REPORT.md
    $P ../suite.py <check|collect|score> …                   # the same runner from any directory
    $P -m tmpl.frequency                                     # verb-class / construction frequencies → FREQUENCY.md
    $P ../semantic-parse.py "<sentence>" --atoms             # one parse, validated, atoms shown
    for t in tests/test_*.py; do $P $t; done

### Catalog (one template per file) and the generic emitter

- `catalog/<id>.yaml` is a whole template: trigger (construction, boundary), slots with their
  substrate class, `mints`, `emits` shapes (`if_filled`, `each`, `when`, `project`), `one_of` slot groups, notes,
  `examples.shown` / `examples.held_out`. A sentence another template abstains on is claimed in the SAME
  section (shown or held-out), or `check` reports a leak.
  `python -c "from tmpl import catalog; catalog.load()"` checks the structural invariants.
- `tmpl/emit.py` renders instances through the shapes (nothing template-specific in code);
  `from tmpl import emit; emit.emit(item)` → statements + declarations. Tests: `python tests/test_emit.py`.
- `python -m tmpl.render_prompt` renders the parser's instruction set from the catalog (shared text in
  `catalog/_general.yaml`, only `shown` examples, each with its emitted rendering) → `generated/PROMPT_CATALOG.txt`.
  Tests: `python tests/test_render_prompt.py`.

### Parsing and validation

- `../semantic-parse.py "<sentence>"` sends one sentence with the generated catalog prompt to an LLM
  (`--provider google|openai`, `--model`, `--effort`, `--out run.json`, `--dry-run`; keys from the
  environment, e.g. `GEMINI_API_KEY`). No temperature is sent unless `--temperature` is given (Gemini 4
  Argon ignores sampling parameters; Gemini 3 is meant to run at its default). Every reply is validated
  after the call: the summary and any findings go to stderr, the result into the run record,
  `--atoms` prints the emitted statements too, `--no-validate` skips it, exit status 3 on findings. The
  suite runner uses the same script for blind parses.
- `tmpl/validate.py` is the one post-parse validator, shared by the script and the suite scorer: the
  reply's contract (object, lists, null slots counted and stripped), the emitter's instance checks
  (unknown template, ids, required slots, enum values, dangling references, a filler pointing at a
  scope, a scope cycle), graph lints (a witness nothing mentions, a name nothing mentions while nothing
  is unmapped, bare predication, empty optional scope) and C9 on the emitted statements (skipped without
  `petta`). Report only; it
  never changes a reply. `from tmpl import validate; validate.validate(reply)`. Tests:
  `python tests/test_validate.py`.

### Suite runner (`tmpl/suite.py`)

- `check`: every example emits; abstain targets exist (else listed as PENDING, the worklist of
  templates to write) and, when they exist, claim the sentence in their own examples without firing
  the abstaining template; a sentence that is a firing example of two templates with different
  expected atoms is an OVERLAP; no held-out sentence is a shown sentence anywhere; gap codes exist;
  no example sentence comes from prompt.txt, the goldens or a corpus.
- `collect` stores one run record per call under `suite/raw/<template>/<key>.r<n>.json` and is
  resumable (stored replies are skipped; `--force` re-requests). `--section shown` parses the prompt's
  own examples (a smoke test, not a regression); `--only <words>`, `--category abstain` (repeatable),
  `--failed` (only the cases the last score flagged, e.g. abstain cases whose target now exists), `--limit N`,
  `--delay s`, `--dry-run`. The parser sees only a hash as the item id.
- `score` renders every reply through the validator and compares the atoms with the expected instances'
  atoms label-independently (witness symbols up to a bijection, bundles unordered), classifies each
  (case, run) by category, type-checks every emitted parse (C9, when `petta` is importable), and writes
  `suite/out/<template>.scores.jsonl`, `summary.json`, `REPORT.md` (selection, fill, stability, usage,
  the parser's `issues`, graph lints — any lint fails the record — the per-run view of every abstain
  case, mismatches with leaf-level diffs). Records collected under another instruction set are counted
  as stale. Tests: `python tests/test_suite.py`.

### Atom-type substrate and type checker (C9)

- Source: `atom-type-substrates.json` (hand-maintained). Render: `python -m tmpl.gen_substrate` →
  `ATOM-TYPE-SUBSTRATES.md` (review) + `generated/atom-types.metta` (PeTTa declarations). Never edit
  the generated files.
- Check statements: `python -m tmpl.typecheck <statements.jsonl|.metta> [--no-infer] [--report out.json]`
  (needs the `petta` package). A record may carry `declarations` (the emitter's `(: sym Type)` lines);
  without them types are inferred from usage, which only surfaces type errors as `type-conflict` /
  `type-warning`. Tests: `python tests/test_typecheck.py`.

## Rules of the road

- Freeze before collect: never regenerate the instruction set while a collect is in flight (the scorer
  flags records collected under another instruction set as stale).
- Example sentences never reuse a sentence from prompt.txt, the goldens or any corpus, and a held-out
  sentence never appears in the prompt (both enforced by `tmpl.suite check`).
- Suite output never enters `fusenf/raw` or `fusenf/parses`.
