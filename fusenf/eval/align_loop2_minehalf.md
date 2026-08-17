# §4.3.4 paraphrase alignment + anti-unification — wave 1

- positive pairs: 60 (Tier A same-polarity within class + Tier C complete pairs); identical parses among them: 7
- control pairs mined: 0 (Tier A same x different polarity)
- anti-unified rules (support>=1): **104** — kinds {'lexical-collapse': 12, 'slot-merge': 4, 'structural-alt': 88}; flagged fires_on_control: **0**; signals: **104**
- control machinery evidence: 0 sole-diff control keys mined (a flag fires only when a candidate equals one); e.g. 
- target-rule recovery: **0/0** lexical/converse targets (alt:* reported separately below)

## Lexical-collapse candidates

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 1 (1×) | lexical-collapse | — | `(About $C alexander_mackenzie)` | `(Of $C alexander_mackenzie)` |
| 1 (1×) | lexical-collapse | — | `(Inheritance flow_rate rate)` | `(Inheritance rate_of_flow rate)` |
| 1 (1×) | lexical-collapse | — | `(Inheritance railway_station station)` | `(Inheritance train_station station)` |
| 1 (1×) | lexical-collapse | — | `(Member $C direct)` | `(Member $C orchestrate)` |
| 1 (1×) | lexical-collapse | — | `(Member $C divide)` | `(Member $C separate)` |
| 1 (1×) | lexical-collapse | — | `(Member $C propose)` | `(Member $C suggest)` |
| 1 (1×) | lexical-collapse | — | `(Member $C railway_station)` | `(Member $C train_station)` |
| 1 (1×) | lexical-collapse | — | `(Member rongcheng town)` | `(Member rongcheng_town town)` |
| 1 (1×) | lexical-collapse | — | `(Member will child)` | `(Member will_smith child)` |
| 1 (1×) | lexical-collapse | — | `(Possession $C rongcheng)` | `(Possession $C rongcheng_town)` |
| 1 (1×) | lexical-collapse | — | `(Theme $C ballox)` | `(Theme $C ballox_the_monstroid)` |
| 1 (1×) | lexical-collapse | — | `(Theme $C spider_man)` | `(Theme $C spiderman)` |

## Slot-merge candidates

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 1 (1×) | slot-merge | — | `(Agent $C limbang)` | `(Location $C limbang)` |
| 1 (1×) | slot-merge | — | `(CoAgent $C hastings_ndlovu)` | `(Theme $C hastings_ndlovu)` |
| 1 (1×) | slot-merge | — | `(Patient $C $x0:K0)` | `(Theme $C $x0:K0)` |
| 1 (1×) | slot-merge | — | `(Patient $C dan_barrera)` | `(Theme $C dan_barrera)` |

## Structural alternations

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 2 (2×) | structural-alt | — | ∅ | `(Experiencer $C wellsville)`<br>`(For $C alma_township)`<br>`(Member $C railhead)`<br>`(Time $C today)` |
| 1 (1×) | structural-alt | — | ∅ | `(Agent $C $x0)`<br>`(Manner $C fluently)`<br>`(Member $C speak)`<br>`(Theme $C english)` |
| 1 (1×) | structural-alt | — | ∅ | `(Agent $C $x0:small)`<br>`(Member $C border)`<br>`(Theme $C red_house)` |
| 1 (1×) | structural-alt | — | ∅ | `(Agent $C $x1:thing)`<br>`(Member $C include)`<br>`(Theme $C $x0:ischium)` |
| 1 (1×) | structural-alt | — | ∅ | `(Agent $e0:replace $x0:person)`<br>`(By $C $e0:replace)`<br>`(Member $e0:replace replace)`<br>`(Past $e0:replace)`<br>`(Theme $e0:replace adam_rodriguez)` |
| 1 (1×) | structural-alt | — | ∅ | `(Before $e0:arrive $C)` |
| 1 (1×) | structural-alt | — | ∅ | `(Border $C red_house)`<br>`(Member $C part)` |
| 1 (1×) | structural-alt | — | ∅ | `(Cardinality $C <num>)`<br>`(GroupOf $C national_committee)` |
| 1 (1×) | structural-alt | — | ∅ | `(Close $C trabzon_airport)`<br>`(Member $C complex)`<br>`(PartOf $C trabzon_world_trade_center)` |
| 1 (1×) | structural-alt | — | ∅ | `(During $C $e0:wound)` |
| 1 (1×) | structural-alt | — | ∅ | `(During $C $x0:fight)`<br>`(Member $C kill)`<br>`(Past $C)`<br>`(Patient $C steedman)` |
| 1 (1×) | structural-alt | — | ∅ | `(During $e0:shoot $C)` |
| 1 (1×) | structural-alt | — | ∅ | `(Experiencer $C $x0)`<br>`(Member $C understand)`<br>`(Stimulus $C english)` |
| 1 (1×) | structural-alt | — | ∅ | `(GroupOf $C papyrus_reed)`<br>`(PartOf $C $x0)` |
| 1 (1×) | structural-alt | — | ∅ | `(GroupOf $C person)` |
| 1 (1×) | structural-alt | — | ∅ | `(GroupOf $C person)`<br>`(ProportionOf $C $x0 some)`<br>`(SubsetOf $C $x0)` |
| 1 (1×) | structural-alt | — | ∅ | `(GroupOf $C result)` |
| 1 (1×) | structural-alt | — | ∅ | `(Holder $C cuta)`<br>`(Member $C have)`<br>`(Theme $C $x0)` |
| 1 (1×) | structural-alt | — | ∅ | `(Inheritance atheist_movement atheist)`<br>`(Inheritance atheist_movement movement)`<br>`(Inheritance marxist_element element)`<br>`(Inheritance marxist_element marxist)` |
| 1 (1×) | structural-alt | — | ∅ | `(Inheritance imaginary_sign imaginary)`<br>`(Inheritance imaginary_sign sign)`<br>`(Inheritance minus_part minus)`<br>`(Inheritance minus_part part)` |

## Flagged by negative controls (kept OUT of signals)

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|

## Target-rule recovery

| target | classes | recovered by |
|---|---|---|

## alt:* targets (expect identical parses, nothing to mine)

| target | pairs | identical |
|---|---|---|
