# fusenf/runs

Outputs of the mining runs, one folder per run. Everything here is regenerable from the parsed records in
`datasets/sample/` with `python -m fusenf.mine …` (run from the repo root).

| file | written by | what |
|---|---|---|
| `graphs.jsonl`, `lifted.jsonl`, `presence.jsonl` | `lift` | each sentence as a graph of atoms; the atoms lifted to typed variables under the key dials; family-level presence of single atoms (not versioned: large) |
| `summary.md` | `lift` | the lift run's counts |
| `patterns.lexicalized.jsonl`, `patterns.shape.jsonl` | `patterns` | §5.1's candidate records, one JSON object a line (not versioned: large) |
| `patterns.md` | `patterns` | §5.1's summary: the parameters, the counts per view and size, the two tests, the tables to read |

A candidate record is described in `fusenf/mine/candidates.py` and, for §5.1, in `fusenf/mine/subtree.py`.
