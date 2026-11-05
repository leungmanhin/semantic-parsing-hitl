# Lift run `first` — 2026-11-05 08:44

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 4257 (skipped 115: {'no graph (failed reply, empty or malformed)': 115})
- families: 1082 · by dataset: {'sick': 2798, 'mrpc': 1459} · by dataset and role: {'sick/mine': 1983, 'mrpc/mine': 937, 'sick/evaluate': 815, 'mrpc/evaluate': 522}
- atoms: 59991 ({'content': 47128, 'scope': 4551, 'tense': 5865, 'surface': 2447}); inside a scope: 16841
- units in the key (content atoms lifted): 51679 · distinct: 10392 · present in ≥ 2 families: 2201
- time: 3.6 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 676 | 2694 | `|Agent($e1,$x1)|asserted` |
| 564 | 1449 | `|Patient($e1,$x1)|asserted` |
| 445 | 1180 | `|Implication(§premise,§consequent)|graded` |
| 379 | 923 | `|Implication(§premise,§consequent)|asserted` |
| 320 | 513 | `|Experiencer($e1,$x1)|asserted` |
| 316 | 925 | `|Location($e1,$x1)|asserted` |
| 305 | 772 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 303 | 482 | `|Theme($e1,§1)|asserted` |
| 293 | 505 | `|Coref($x1,$x2)|asserted` |
| 274 | 543 | `|Theme($e1,$x1)|asserted` |
| 260 | 409 | `|Possession($x1,$x2)|asserted` |
| 238 | 621 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 202 | 296 | `|Member($e1,say)|asserted` |
| 200 | 250 | `|Implication(§premise,§consequent)|denied` |
| 196 | 239 | `|Not(§0)|asserted` |
| 184 | 268 | `|Time($e1,$t1)|asserted` |
| 183 | 313 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 180 | 225 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 159 | 321 | `|PartOf($x1,$x2)|asserted` |
| 154 | 621 | `|Member($x1,man)|asserted` |
| 148 | 179 | `Not|Agent($e1,$x1)|asserted` |
| 138 | 202 | `Theme:$e1|Agent($e2,$x1)|asserted` |
| 122 | 168 | `|Member($t1,day)|asserted` |
| 113 | 153 | `Theme:$e1|Patient($e2,$x1)|asserted` |
| 104 | 248 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
