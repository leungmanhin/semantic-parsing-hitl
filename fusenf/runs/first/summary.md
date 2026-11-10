# Lift run `first` — 2026-11-10 09:44

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 6388 (skipped 83: {'no graph (failed reply, empty or malformed)': 83})
- families: 1346 · by dataset: {'sick': 4886, 'mrpc': 1502} · by dataset and role: {'sick/mine': 2301, 'mrpc/mine': 971, 'sick/evaluate': 2585, 'mrpc/evaluate': 531}
- atoms: 88275 ({'content': 69750, 'scope': 6877, 'tense': 9013, 'surface': 2635}); inside a scope: 25236
- units in the key (content atoms lifted): 76627 · distinct: 13166 · present in ≥ 2 families: 2916
- time: 5.0 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 946 | 4386 | `|Agent($e1,$x1)|asserted` |
| 751 | 2227 | `|Patient($e1,$x1)|asserted` |
| 618 | 1859 | `|Implication(§premise,§consequent)|graded` |
| 514 | 1405 | `|Implication(§premise,§consequent)|asserted` |
| 462 | 1449 | `|Location($e1,$x1)|asserted` |
| 438 | 1228 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 433 | 729 | `|Experiencer($e1,$x1)|asserted` |
| 365 | 784 | `|Theme($e1,$x1)|asserted` |
| 352 | 457 | `|Implication(§premise,§consequent)|denied` |
| 345 | 539 | `|Theme($e1,§1)|asserted` |
| 338 | 970 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 337 | 635 | `|Coref($x1,$x2)|asserted` |
| 326 | 423 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 313 | 502 | `|Possession($x1,$x2)|asserted` |
| 305 | 385 | `|Not(§0)|asserted` |
| 261 | 403 | `|Member($e1,say)|asserted` |
| 251 | 315 | `Not|Agent($e1,$x1)|asserted` |
| 245 | 447 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 239 | 993 | `|Member($x1,man)|asserted` |
| 201 | 422 | `|PartOf($x1,$x2)|asserted` |
| 199 | 302 | `|Time($e1,$t1)|asserted` |
| 167 | 281 | `|Member($x1,male)|asserted` |
| 162 | 589 | `|Member($x1,woman)|asserted` |
| 160 | 203 | `Implication:consequent:$r1|Patient($e1,$x1)|denied` |
| 156 | 388 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
