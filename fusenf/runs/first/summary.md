# Lift run `first` — 2026-11-05 17:21

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 4257 (skipped 115: {'no graph (failed reply, empty or malformed)': 115})
- families: 1082 · by dataset: {'sick': 2798, 'mrpc': 1459} · by dataset and role: {'sick/mine': 1983, 'mrpc/mine': 937, 'sick/evaluate': 815, 'mrpc/evaluate': 522}
- atoms: 59995 ({'content': 47140, 'scope': 4551, 'tense': 5857, 'surface': 2447}); inside a scope: 16877
- units in the key (content atoms lifted): 51691 · distinct: 10412 · present in ≥ 2 families: 2207
- time: 4.5 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 676 | 2694 | `|Agent($e1,$x1)|asserted` |
| 564 | 1449 | `|Patient($e1,$x1)|asserted` |
| 445 | 1179 | `|Implication(§premise,§consequent)|graded` |
| 379 | 921 | `|Implication(§premise,§consequent)|asserted` |
| 320 | 513 | `|Experiencer($e1,$x1)|asserted` |
| 316 | 925 | `|Location($e1,$x1)|asserted` |
| 311 | 783 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 303 | 482 | `|Theme($e1,§1)|asserted` |
| 293 | 504 | `|Coref($x1,$x2)|asserted` |
| 274 | 543 | `|Theme($e1,$x1)|asserted` |
| 258 | 404 | `|Possession($x1,$x2)|asserted` |
| 240 | 622 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 202 | 296 | `|Member($e1,say)|asserted` |
| 200 | 250 | `|Implication(§premise,§consequent)|denied` |
| 196 | 239 | `|Not(§0)|asserted` |
| 185 | 315 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 184 | 268 | `|Time($e1,$t1)|asserted` |
| 180 | 225 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 158 | 313 | `|PartOf($x1,$x2)|asserted` |
| 154 | 621 | `|Member($x1,man)|asserted` |
| 148 | 179 | `Not|Agent($e1,$x1)|asserted` |
| 138 | 202 | `Theme:$e1|Agent($e2,$x1)|asserted` |
| 122 | 168 | `|Member($t1,day)|asserted` |
| 113 | 153 | `Theme:$e1|Patient($e2,$x1)|asserted` |
| 104 | 248 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
