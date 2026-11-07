# Lift run `first` — 2026-11-08 00:36

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 6345 (skipped 126: {'no graph (failed reply, empty or malformed)': 126})
- families: 1334 · by dataset: {'sick': 4886, 'mrpc': 1459} · by dataset and role: {'sick/mine': 2301, 'mrpc/mine': 937, 'sick/evaluate': 2585, 'mrpc/evaluate': 522}
- atoms: 84962 ({'content': 67134, 'scope': 6484, 'tense': 8708, 'surface': 2636}); inside a scope: 23676
- units in the key (content atoms lifted): 73618 · distinct: 12286 · present in ≥ 2 families: 2790
- time: 5.5 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 927 | 4363 | `|Agent($e1,$x1)|asserted` |
| 741 | 2208 | `|Patient($e1,$x1)|asserted` |
| 601 | 1846 | `|Implication(§premise,§consequent)|graded` |
| 472 | 1335 | `|Implication(§premise,§consequent)|asserted` |
| 453 | 1437 | `|Location($e1,$x1)|asserted` |
| 399 | 1171 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 351 | 770 | `|Theme($e1,$x1)|asserted` |
| 349 | 571 | `|Experiencer($e1,$x1)|asserted` |
| 349 | 452 | `|Implication(§premise,§consequent)|denied` |
| 336 | 628 | `|Coref($x1,$x2)|asserted` |
| 326 | 959 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 325 | 422 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 306 | 487 | `|Theme($e1,§1)|asserted` |
| 303 | 380 | `|Not(§0)|asserted` |
| 282 | 461 | `|Possession($x1,$x2)|asserted` |
| 250 | 314 | `Not|Agent($e1,$x1)|asserted` |
| 240 | 994 | `|Member($x1,man)|asserted` |
| 233 | 429 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 203 | 298 | `|Member($e1,say)|asserted` |
| 198 | 420 | `|PartOf($x1,$x2)|asserted` |
| 188 | 280 | `|Time($e1,$t1)|asserted` |
| 162 | 589 | `|Member($x1,woman)|asserted` |
| 159 | 202 | `Implication:consequent:$r1|Patient($e1,$x1)|denied` |
| 146 | 374 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
| 139 | 204 | `Theme:$e1|Agent($e2,$x1)|asserted` |
