# Lift run `first` — 2026-11-07 08:35

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 6340 (skipped 131: {'no graph (failed reply, empty or malformed)': 131})
- families: 1334 · by dataset: {'sick': 4881, 'mrpc': 1459} · by dataset and role: {'sick/mine': 2299, 'mrpc/mine': 937, 'sick/evaluate': 2582, 'mrpc/evaluate': 522}
- atoms: 84557 ({'content': 66900, 'scope': 6436, 'tense': 8664, 'surface': 2557}); inside a scope: 23434
- units in the key (content atoms lifted): 73336 · distinct: 12239 · present in ≥ 2 families: 2790
- time: 5.4 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 927 | 4358 | `|Agent($e1,$x1)|asserted` |
| 750 | 2233 | `|Patient($e1,$x1)|asserted` |
| 600 | 1848 | `|Implication(§premise,§consequent)|graded` |
| 470 | 1301 | `|Implication(§premise,§consequent)|asserted` |
| 453 | 1439 | `|Location($e1,$x1)|asserted` |
| 396 | 1140 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 348 | 569 | `|Experiencer($e1,$x1)|asserted` |
| 347 | 725 | `|Theme($e1,$x1)|asserted` |
| 345 | 447 | `|Implication(§premise,§consequent)|denied` |
| 336 | 627 | `|Coref($x1,$x2)|asserted` |
| 323 | 938 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 322 | 419 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 306 | 487 | `|Theme($e1,§1)|asserted` |
| 303 | 380 | `|Not(§0)|asserted` |
| 282 | 459 | `|Possession($x1,$x2)|asserted` |
| 250 | 314 | `Not|Agent($e1,$x1)|asserted` |
| 240 | 994 | `|Member($x1,man)|asserted` |
| 230 | 422 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 203 | 298 | `|Member($e1,say)|asserted` |
| 198 | 420 | `|PartOf($x1,$x2)|asserted` |
| 188 | 280 | `|Time($e1,$t1)|asserted` |
| 162 | 589 | `|Member($x1,woman)|asserted` |
| 158 | 200 | `Implication:consequent:$r1|Patient($e1,$x1)|denied` |
| 145 | 364 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
| 139 | 204 | `Theme:$e1|Agent($e2,$x1)|asserted` |
