# §4.3.4 paraphrase alignment + anti-unification — wave 1

- positive pairs: 471 (Tier A same-polarity within class + Tier C complete pairs); identical parses among them: 109
- control pairs mined: 468 (Tier A same x different polarity)
- anti-unified rules (support>=2): **48** — kinds {'lexical-collapse': 22, 'slot-merge': 1, 'structural-alt': 25}; flagged fires_on_control: **0**; signals: **48**
- control machinery evidence: 182 sole-diff control keys mined (a flag fires only when a candidate equals one); e.g. `(Cardinality $C 2) / <-> / (Cardinality $C 3)`; `(Future $C) / <-> / (Might $C)`; `(Member $C abandon) / <-> / (Member $C continue)`
- target-rule recovery: **30/31** lexical/converse targets (alt:* reported separately below)

## Lexical-collapse candidates

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 4 (8×) | lexical-collapse | 0.93 | `(Member $C acquire)` | `(Member $C buy)` |
| 4 (4×) | lexical-collapse | 1.00 | `(Member $C acquire)` | `(Member $C purchase)` |
| 4 (4×) | lexical-collapse | 0.96 | `(Member $C begin)` | `(Member $C commence)` |
| 4 (4×) | lexical-collapse | 0.96 | `(Member $C begin)` | `(Member $C start)` |
| 4 (8×) | lexical-collapse | 0.93 | `(Member $C buy)` | `(Member $C purchase)` |
| 4 (4×) | lexical-collapse | 1.00 | `(Member $C commence)` | `(Member $C start)` |
| 3 (6×) | lexical-collapse | 0.98 | `(Member $C abandon)` | `(Member $C give_up)` |
| 3 (3×) | lexical-collapse | — | `(Member $C big)` | `(Member $C large)` |
| 3 (5×) | lexical-collapse | 0.96 | `(Member $C call_off)` | `(Member $C cancel)` |
| 3 (3×) | lexical-collapse | — | `(Member $C difficult)` | `(Member $C hard)` |
| 3 (6×) | lexical-collapse | — | `(Member $C discover)` | `(Member $C find_out)` |
| 3 (5×) | lexical-collapse | 0.85 | `(Member $C need)` | `(Member $C require)` |
| 3 (5×) | lexical-collapse | 0.98 | `(Member $C postpone)` | `(Member $C put_off)` |
| 3 (6×) | lexical-collapse | 0.93 | `(Member $C reject)` | `(Member $C turn_down)` |
| 2 (2×) | lexical-collapse | 0.94 | `(Member $C allow)` | `(Member $C permit)` |
| 2 (2×) | lexical-collapse | 0.42 | `(Member $C arrival)` | `(Member $C arrive)` |
| 2 (2×) | lexical-collapse | — | `(Member $C die)` | `(Member $C kick_the_bucket)` |
| 2 (2×) | lexical-collapse | — | `(Member $C endorse)` | `(Member $C support)` |
| 2 (2×) | lexical-collapse | — | `(Member $C fix)` | `(Member $C mend)` |
| 2 (4×) | lexical-collapse | — | `(Member $C fix)` | `(Member $C repair)` |
| 2 (2×) | lexical-collapse | 0.44 | `(Member $C follow)` | `(Member $C succeed)` |
| 2 (4×) | lexical-collapse | — | `(Member $C mend)` | `(Member $C repair)` |

## Slot-merge candidates

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 2 (2×) | slot-merge | — | `(Patient $C $x0:K0)` | `(Theme $C $x0:K0)` |

## Structural alternations

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 4 (4×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C acquire)` | `(Member $C sell)`<br>`(Recipient $C $x0:K0)` |
| 4 (8×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C buy)` | `(Member $C sell)`<br>`(Recipient $C $x0:K0)` |
| 4 (4×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C purchase)` | `(Member $C sell)`<br>`(Recipient $C $x0:K0)` |
| 4 (4×) | structural-alt | — | `(Member $C make)`<br>`(Patient $C $e0:K0)` | `(Member $C reach)`<br>`(Theme $C $e0:K0)` |
| 4 (4×) | structural-alt | — | `(Patient $e0:make $C)` | `(Theme $e1:reach $C)` |
| 3 (6×) | structural-alt | — | `(Agent $C $x0:K0)` | `(Agent $e0:cause $x0:K0)`<br>`(Member $e0:cause cause)`<br>`(Theme $e0:cause $C)` |
| 3 (3×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C give)`<br>`(Recipient $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C receive)`<br>`(Source $C $x3:K0)` |
| 3 (3×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C receive)`<br>`(Source $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C give)`<br>`(Recipient $C $x3:K0)` |
| 3 (3×) | structural-alt | — | `(Agent $C $x0:doctor)`<br>`(Member $x0:doctor doctor)` | `(Agent $C $x1:physician)`<br>`(Member $x1:physician physician)` |
| 3 (3×) | structural-alt | — | `(Agent $C $x0:physician)`<br>`(Member $x0:physician physician)` | `(Agent $C $x1:doctor)`<br>`(Member $x1:doctor doctor)` |
| 3 (3×) | structural-alt | — | `(CoAgent $C karen)`<br>`(Past $C)` | `(Holder $C karen)` |
| 3 (3×) | structural-alt | — | `(Degree $C big very)`<br>`(Member $C big)` | `(Member $C huge)` |
| 3 (3×) | structural-alt | — | `(Member $C answer)`<br>`(Theme $C $x0:K0)` | `(Member $C give)`<br>`(Member $x1:answer answer)`<br>`(Recipient $C $x0:K0)`<br>`(Theme $C $x1:answer)` |
| 3 (3×) | structural-alt | — | `(Member $C answer)`<br>`(Theme $C $x1:K0)` | `(Member $C give)`<br>`(Member $x0:answer answer)`<br>`(Recipient $C $x1:K0)`<br>`(Theme $C $x0:answer)` |
| 3 (5×) | structural-alt | — | `(Member $C decide)`<br>`(Theme $C $x0:K0)` | `(Member $C make)`<br>`(Member $e0:decision decision)`<br>`(Patient $C $e0:decision)`<br>`(Theme $e0:decision $x0:K0)` |
| 3 (5×) | structural-alt | — | `(Member $C decide)`<br>`(Theme $C $x0:K0)` | `(Member $C reach)`<br>`(Member $e0:decision decision)`<br>`(Theme $C $e0:decision)`<br>`(Theme $e0:decision $x0:K0)` |
| 2 (2×) | structural-alt | — | ∅ | `(Experiencer $C wellsville)`<br>`(For $C alma_township)`<br>`(Member $C railhead)`<br>`(Time $C today)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)` | `(Agent $e0:take $x0:K0)`<br>`(Member $e0:take take)`<br>`(Theme $e0:take $C)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C borrow)`<br>`(Source $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C lend)`<br>`(Recipient $C $x3:K0)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C learn)`<br>`(Source $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C teach)`<br>`(Recipient $C $x3:K0)` |

## Flagged by negative controls (kept OUT of signals)

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|

## Target-rule recovery

| target | classes | recovered by |
|---|---|---|
| CoAgent~GroupOf | 4 | **MISS** |
| abandon<-give_up | 3 | au0012 |
| allow<-permit | 3 | au0031 |
| answer<-give_an_answer | 3 | au0027 |
| arrive<-arrival | 3 | au0032 |
| automobile<-car | 3 | au0046 |
| begin<-commence | 4 | au0003 |
| begin<-start | 4 | au0004 |
| buy<-acquire | 4 | au0001 |
| buy<-purchase | 4 | au0005 |
| buy~sell | 4 | au0008 |
| cancel<-call_off | 3 | au0014 |
| decide<-decision | 4 | au0029 |
| decide<-make_a_decision | 4 | au0029 |
| destroy<-destruction | 3 | au0020 (prov) |
| die<-kick_the_bucket | 3 | au0033 |
| difficult<-hard | 3 | au0015 |
| discover<-find_out | 3 | au0016 |
| exhausted<-very_tired | 3 | au0047 |
| give~receive | 4 | au0021 |
| huge<-very_big | 3 | au0026 |
| large<-big | 3 | au0013 |
| lend~borrow | 3 | au0042 |
| physician<-doctor | 3 | au0023 |
| postpone<-put_off | 3 | au0018 |
| reject<-turn_down | 3 | au0019 |
| repair<-fix | 4 | au0036 |
| repair<-mend | 4 | au0038 |
| require<-need | 3 | au0017 |
| teach~learn | 3 | au0043 |
| walk<-take_a_walk | 3 | au0041 (prov) |

## alt:* targets (expect identical parses, nothing to mine)

| target | pairs | identical |
|---|---|---|
| alt:dative | 10 | 10 |
| alt:voice | 36 | 33 |
