# §4.3.4 paraphrase alignment + anti-unification — item E (factoring)

- positive pairs: 411 (Tier A same-polarity within class + Tier C complete pairs); identical parses among them: 102
- control pairs mined: 468 (Tier A same x different polarity)
- anti-unified UNIT rules (support>=2): **46** — kinds {'lexical-collapse': 22, 'structural-alt': 24}; flagged fires_on_control: **0**; signals: **56** (unit + promotable factor)
- FACTOR rules (§4 factoring): **64** — 0 duplicate a unit key, 0 fire on control, **10** promotable (sole-diff-attested, control-clean, non-duplicate); the rest await judges
- control machinery evidence: 182 sole-diff control keys mined (a flag fires only when a candidate equals one); e.g. `(Cardinality $C 2) / <-> / (Cardinality $C 3)`; `(Future $C) / <-> / (Might $C)`; `(Member $C abandon) / <-> / (Member $C continue)`
- target-rule recovery: **31/31** lexical/converse targets (alt:* reported separately below)

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
| 3 (5×) | lexical-collapse | 0.96 | `(Member $C need)` | `(Member $C require)` |
| 3 (5×) | lexical-collapse | 0.98 | `(Member $C postpone)` | `(Member $C put_off)` |
| 3 (6×) | lexical-collapse | 0.93 | `(Member $C reject)` | `(Member $C turn_down)` |
| 2 (2×) | lexical-collapse | 0.94 | `(Member $C allow)` | `(Member $C permit)` |
| 2 (2×) | lexical-collapse | — | `(Member $C arrival)` | `(Member $C arrive)` |
| 2 (2×) | lexical-collapse | — | `(Member $C die)` | `(Member $C kick_the_bucket)` |
| 2 (2×) | lexical-collapse | — | `(Member $C endorse)` | `(Member $C support)` |
| 2 (2×) | lexical-collapse | — | `(Member $C fix)` | `(Member $C mend)` |
| 2 (4×) | lexical-collapse | — | `(Member $C fix)` | `(Member $C repair)` |
| 2 (2×) | lexical-collapse | 0.47 | `(Member $C follow)` | `(Member $C succeed)` |
| 2 (4×) | lexical-collapse | — | `(Member $C mend)` | `(Member $C repair)` |

## Slot-merge candidates

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|

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
| 3 (3×) | structural-alt | — | `(Degree $C big very)`<br>`(Member $C big)` | `(Member $C huge)` |
| 3 (3×) | structural-alt | — | `(Member $C answer)`<br>`(Theme $C $x0:K0)` | `(Member $C give)`<br>`(Member $x1:answer answer)`<br>`(Recipient $C $x0:K0)`<br>`(Theme $C $x1:answer)` |
| 3 (3×) | structural-alt | — | `(Member $C answer)`<br>`(Theme $C $x1:K0)` | `(Member $C give)`<br>`(Member $x0:answer answer)`<br>`(Recipient $C $x1:K0)`<br>`(Theme $C $x0:answer)` |
| 3 (5×) | structural-alt | — | `(Member $C decide)`<br>`(Theme $C $x0:K0)` | `(Member $C make)`<br>`(Member $e0:decision decision)`<br>`(Patient $C $e0:decision)`<br>`(Theme $e0:decision $x0:K0)` |
| 3 (5×) | structural-alt | — | `(Member $C decide)`<br>`(Theme $C $x0:K0)` | `(Member $C reach)`<br>`(Member $e0:decision decision)`<br>`(Theme $C $e0:decision)`<br>`(Theme $e0:decision $x0:K0)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)` | `(Agent $e0:take $x0:K0)`<br>`(Member $e0:take take)`<br>`(Theme $e0:take $C)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C borrow)`<br>`(Source $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C lend)`<br>`(Recipient $C $x3:K0)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C learn)`<br>`(Source $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C teach)`<br>`(Recipient $C $x3:K0)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C lend)`<br>`(Recipient $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C borrow)`<br>`(Source $C $x3:K0)` |
| 2 (2×) | structural-alt | — | `(Agent $C $x0:K0)`<br>`(Member $C teach)`<br>`(Recipient $C $x1:K1)` | `(Agent $C $x2:K1)`<br>`(Member $C learn)`<br>`(Source $C $x3:K0)` |

## Factor candidates (non-duplicate; ✓ = promotable)

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|
| 10 (19×) | slot-merge ✓ | — | `(Agent $e0 $x0:K0)` | `(Source $e0 $x0:K0)` |
| 4 (4×) | structural-alt ✓ | — | ∅ | `(Past $e0)` |
| 3 (3×) | structural-alt ✓ | — | `(Agent $e0 $x0:K0)` | `(Agent $e1:cause $x0:K0)`<br>`(Member $e1:cause cause)`<br>`(Theme $e1:cause $e0)` |
| 3 (3×) | structural-alt ✓ | — | `(Agent $e0 $x0:K0)`<br>`(Member $x0:K0 doctor)` | `(Agent $e0 $x1:K1)`<br>`(Member $x1:K1 physician)` |
| 3 (3×) | structural-alt ✓ | — | `(Agent $e0 $x0:K0)`<br>`(Member $x0:K0 physician)` | `(Agent $e0 $x1:K1)`<br>`(Member $x1:K1 doctor)` |
| 3 (3×) | structural-alt ✓ | — | `(Agent $e0:cause $x0:K0)`<br>`(Member $e0:cause cause)`<br>`(Theme $e0:cause $e1)` | `(Agent $e1 $x0:K0)` |
| 2 (2×) | structural-alt ✓ | — | `(Agent $e0 $x0:K0)` | `(Agent $e1:take $x0:K0)`<br>`(Member $e1:take take)`<br>`(Theme $e1:take $e0)` |
| 2 (2×) | structural-alt ✓ | — | `(Agent $e0 $x0:K0)`<br>`(Member $x0:K0 automobile)` | `(Agent $e0 $x1:K1)`<br>`(Member $x1:K1 car)` |
| 2 (2×) | structural-alt ✓ | — | `(Agent $e1 $x0:K0)`<br>`(Location $e1 $x1:K1)`<br>`(Member $e1 work)` | `(CoAgent $e0 $x0:K0)` |
| 2 (2×) | lexical-collapse ✓ | — | `(Member $x0:K0 difficult)` | `(Member $x0:K0 hard)` |
| 11 (30×) | slot-merge | — | `(Agent $e0 $x0:K0)` | `(Recipient $e0 $x0:K0)` |
| 6 (12×) | structural-alt | — | ∅ | `(Member $e0 give)` |
| 5 (9×) | structural-alt | — | ∅ | `(Member $e0 start)` |
| 4 (8×) | structural-alt | — | ∅ | `(Member $e0 begin)` |
| 4 (8×) | structural-alt | — | ∅ | `(Member $e0 commence)` |
| 4 (12×) | structural-alt | — | ∅ | `(Member $e0 decide)` |
| 4 (7×) | structural-alt | — | ∅ | `(Member $e0 give_up)` |
| 4 (10×) | structural-alt | — | ∅ | `(Member $e0 make)` |
| 4 (10×) | structural-alt | — | ∅ | `(Member $e0 reach)` |
| 4 (4×) | structural-alt | — | ∅ | `(Patient $e0 $e1)` |
| 4 (4×) | structural-alt | — | ∅ | `(Theme $e0 $e1)` |
| 3 (6×) | structural-alt | — | ∅ | `(Member $e0 abandon)` |
| 3 (12×) | structural-alt | — | ∅ | `(Member $e0 acquire)` |
| 3 (3×) | structural-alt | — | ∅ | `(Member $e0 be)` |
| 3 (6×) | structural-alt | — | ∅ | `(Member $e0 borrow)` |

## Flagged by negative controls (kept OUT of signals)

| support | kind | slot-cos | LHS | RHS |
|---|---|---|---|---|

## Target-rule recovery

| target | classes | recovered by |
|---|---|---|
| CoAgent~GroupOf | 4 | au0091 (prov, factor) |
| abandon<-give_up | 3 | au0056 |
| allow<-permit | 3 | au0094 |
| answer<-give_an_answer | 3 | au0070 |
| arrive<-arrival | 3 | au0095 |
| automobile<-car | 3 | au0090 (factor) |
| begin<-commence | 4 | au0016 |
| begin<-start | 4 | au0017 |
| buy<-acquire | 4 | au0014 |
| buy<-purchase | 4 | au0018 |
| buy~sell | 4 | au0021 |
| cancel<-call_off | 3 | au0058 |
| decide<-decision | 4 | au0072 |
| decide<-make_a_decision | 4 | au0072 |
| destroy<-destruction | 3 | au0049 (prov, factor) |
| die<-kick_the_bucket | 3 | au0096 |
| difficult<-hard | 3 | au0059 |
| discover<-find_out | 3 | au0060 |
| exhausted<-very_tired | 3 | au0109 |
| give~receive | 4 | au0065 |
| huge<-very_big | 3 | au0069 |
| large<-big | 3 | au0057 |
| lend~borrow | 3 | au0103 |
| physician<-doctor | 3 | au0050 (factor) |
| postpone<-put_off | 3 | au0062 |
| reject<-turn_down | 3 | au0063 |
| repair<-fix | 4 | au0099 |
| repair<-mend | 4 | au0101 |
| require<-need | 3 | au0061 |
| teach~learn | 3 | au0104 |
| walk<-take_a_walk | 3 | au0089 (prov, factor) |

## alt:* targets (expect identical parses, nothing to mine)

| target | pairs | identical |
|---|---|---|
| alt:dative | 10 | 10 |
| alt:voice | 36 | 33 |
