# Lift run `first` — 2026-11-09 04:08

key: {"polarity": "three", "tense": "evidence", "habitual": "evidence", "shape": "lexicalized"}
inputs: ../datasets/sample/paraphrase.parsed.jsonl

- sentences with a graph: 6363 (skipped 108: {'no graph (failed reply, empty or malformed)': 108})
- families: 1341 · by dataset: {'sick': 4886, 'mrpc': 1477} · by dataset and role: {'sick/mine': 2301, 'mrpc/mine': 955, 'sick/evaluate': 2585, 'mrpc/evaluate': 522}
- atoms: 87030 ({'content': 68712, 'scope': 6822, 'tense': 8871, 'surface': 2625}); inside a scope: 25035
- units in the key (content atoms lifted): 75534 · distinct: 13077 · present in ≥ 2 families: 2890
- time: 5.7 s

## The 25 most widespread units (families)

| families | sentences | unit |
|---|---|---|
| 941 | 4378 | `|Agent($e1,$x1)|asserted` |
| 751 | 2229 | `|Patient($e1,$x1)|asserted` |
| 612 | 1856 | `|Implication(§premise,§consequent)|graded` |
| 509 | 1391 | `|Implication(§premise,§consequent)|asserted` |
| 456 | 1442 | `|Location($e1,$x1)|asserted` |
| 433 | 1212 | `Implication:premise:$r1|PartOf($x1,$x2)|asserted` |
| 373 | 597 | `|Experiencer($e1,$x1)|asserted` |
| 367 | 787 | `|Theme($e1,$x1)|asserted` |
| 352 | 457 | `|Implication(§premise,§consequent)|denied` |
| 340 | 524 | `|Theme($e1,§1)|asserted` |
| 337 | 967 | `Implication:consequent:$r1|Agent($e1,$x1)|asserted` |
| 335 | 632 | `|Coref($x1,$x2)|asserted` |
| 326 | 423 | `Implication:consequent:$r1|Agent($e1,$x1)|denied` |
| 306 | 496 | `|Possession($x1,$x2)|asserted` |
| 304 | 384 | `|Not(§0)|asserted` |
| 251 | 315 | `Not|Agent($e1,$x1)|asserted` |
| 244 | 443 | `Implication:consequent:$r1|Patient($e1,$x1)|asserted` |
| 239 | 994 | `|Member($x1,man)|asserted` |
| 213 | 309 | `|Member($e1,say)|asserted` |
| 200 | 421 | `|PartOf($x1,$x2)|asserted` |
| 197 | 298 | `|Time($e1,$t1)|asserted` |
| 162 | 589 | `|Member($x1,woman)|asserted` |
| 160 | 203 | `Implication:consequent:$r1|Patient($e1,$x1)|denied` |
| 156 | 388 | `Implication:consequent:$r1|Location($e1,$x1)|asserted` |
| 147 | 207 | `Theme:$e1|Agent($e2,$x1)|asserted` |
