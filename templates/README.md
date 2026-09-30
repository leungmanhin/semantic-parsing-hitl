# Logical templates — pilot (exploratory)

Parsing as recognition: a blind parser fills pre-defined templates; code renders the atoms.
Nothing here changes `prompt.txt`, the briefs under `fusenf/briefs/`, or any pipeline store.

| path | what |
|---|---|
| `INVENTORY.md` | prompt.txt read as a registry: 110 statement templates, gap codes, the P06 nesting order and its six rulings |
| `registry/starter26.yaml` | THE single source for the pilot: slot specs, criteria, examples, parameters (quote the keys `"on"`, `"n"`, `"y"`) |
| `tmpl/records.py` | R1–R8, mechanical checks on template instance records |
| `tmpl/emitter.py` | records → atoms: symbols, witness numbers, truth values, proof names, nesting, projection |
| `tmpl/genprompt.py` | registry → `generated/PROMPT_T26.txt`; example renderings come from the emitter |
| `tmpl/goldens.py` | reads `regression/regression_cases.md`; head-based coverage prediction |
| `tmpl/pilot.py` | `select` · `batches` · `assemble` · `score` · `report` · `examples` |
| `tmpl/c7.py` | engine-load check (runs under PeTTaChainer's environment, imports only the harness validator) |
| `tests/test_emitter.py` | emitter vs prompt.txt's own examples, the six rulings, determinism, example freshness |
| `briefs/TPARSE.md`, `briefs/CPARSE.md` | blind briefs: template arm, control arm |
| `pilot/PREREG.md` | pre-registration (proposed until the owner's go) |
| `pilot/manifest.json` | sampling rule, item ids, hashes of every instrument |
| `pilot/out/*.REPORT.md`, `*.PAIRS.md` | summary and side-by-side mismatches per set |

## Recipes

    P=/home/manhin/Dev/.venv-dev/bin/python
    $P templates/tests/test_emitter.py                       # from the repository root
    cd templates
    $P -m tmpl.genprompt                                     # after ANY registry edit
    $P -m tmpl.pilot select --date <YYYY-MM-DD>              # refreshes manifest hashes
    $P -m tmpl.pilot assemble --set <dev|gold|tiera> --arm <t26|ctl> --runs 3 --date <YYYY-MM-DD>
    $P -m tmpl.pilot score  --set <set> --arm <arm>
    $P -m tmpl.pilot report --set <set>
    cd /home/manhin/Dev/PeTTaChainer && STEPS=400 uv run python \
        /home/manhin/Dev/semantic-parsing-hitl/templates/tmpl/c7.py <parses.jsonl>

Dispatch wrapper for a blind parser (nothing else):

    Read /home/manhin/Dev/semantic-parsing-hitl/templates/briefs/<TPARSE|CPARSE>.md and follow it exactly.
    Your batch file is /home/manhin/Dev/semantic-parsing-hitl/templates/pilot/batches/<set>/<batch>.txt.
    Run number: <N>.

## Rules of the road

- Freeze before dispatch: never regenerate the instruction set while a parser is in flight.
- Clear an arm's raw files for the items about to be re-parsed; an agent must never meet an
  existing parse (archive first: `pilot/raw_dev_v*/`).
- Examples in the registry never reuse a sentence from prompt.txt, the goldens or any corpus
  (enforced by a test).
- Pilot output never enters `fusenf/raw` or `fusenf/parses`.
