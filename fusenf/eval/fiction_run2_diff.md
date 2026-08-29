# Fiction run-1 → run-2 diff (rewrite-guide input)

Run 2 = the full 138-sentence re-parse at FP4-pinned prompt `2ed18b93…` (28 batches,
one-sentence-per-item constraint, zero incidents; assembled with C1–C8 — 7 report-only C4
vocabulary notes, zero structural errors). Run 1 was parsed at `bb7c4b71…` pre-FP4.

**Headline: unfireable rules 29 → 11** (census ok 109/138 → 127/138). The FP4
premise-binding pin cleared 20 of 29 (16 sk-function + 4 unasserted-constant). All 11
residual flags — 9 persistent + 2 sentences whose run-2 route landed in the same family —
are ONE shape: a **multi-event premise** (participial condition "nightmoths *landing* on
lanterns …", chained condition events, or a hypothesized state "if the Watch *holds* …")
where the premise EVENT terms are still emitted as Skolem functions/constants instead of
plain variables. The pin's goldens exercise single-event premises; the sharper line —
*every premise eventuality gets its own plain variable* — is registered as a wire candidate
for the next pack. Rewrite guidance for the consumer meanwhile: conditions phrased as ONE
finite clause per premise event ("When a nightmoth lands on a lantern, it leaves a silken
thread") parse fireable today; participial/stacked-event conditions are the hard shape.

Also noteworthy: 2 sentences carry parser lexical improvisations flagged C4 report-only
(`Inherit` on fict-000102, `Prompt` on fict-000134 — open-class-shaped, left as-is per
never-auto-repair); no FP4 new head (AccordingTo/MeasureBy/…) appears in run 2 — this
corpus states no evidentials, scalar changes, or time windows, so none was licensed.
Statement text differs run-1→run-2 on all 138 (symbol naming + FP4 phrasing effects);
the census + per-sentence table below is the semantic comparison.

## Census transition matrix (sentences)

- ok → ok: **107**
- UNFIREABLE(fn) → ok: **16**
- UNFIREABLE(fn) → UNFIREABLE(fn): **8**
- UNFIREABLE(const) → ok: **4**
- ok → UNFIREABLE(fn): **2**
- UNFIREABLE(const) → UNFIREABLE(const): **1**

Statements changed on 138/138 sentences.

## Per-sentence table

| id | item/field | census r1 | census r2 | #stmts r1→r2 | changed | new heads |
|---|---|---|---|---|---|---|
| fict-000001 | R1/rule | ok | ok | 2→2 | changed | - |
| fict-000002 | R1/t1 | ok | ok | 3→3 | changed | - |
| fict-000003 | R1/t2 | UNFIREABLE(fn) | ok | 3→3 | changed | - |
| fict-000004 | R1/t3 | ok | ok | 4→4 | changed | - |
| fict-000005 | R1/t4 | ok | ok | 2→2 | changed | - |
| fict-000006 | R2/rule | ok | ok | 3→3 | changed | - |
| fict-000007 | R2/t1 | ok | ok | 3→3 | changed | - |
| fict-000008 | R2/t2 | UNFIREABLE(fn) | ok | 3→3 | changed | - |
| fict-000009 | R2/t3 | ok | ok | 2→3 | changed | - |
| fict-000010 | R2/t4 | ok | ok | 2→3 | changed | - |
| fict-000011 | R3/rule | UNFIREABLE(fn) | UNFIREABLE(fn) | 4→4 | changed | - |
| fict-000012 | R3/t1 | ok | ok | 4→4 | changed | - |
| fict-000013 | R3/t2 | ok | ok | 3→4 | changed | - |
| fict-000014 | R3/t3 | ok | ok | 3→6 | changed | - |
| fict-000015 | R4/rule | UNFIREABLE(fn) | UNFIREABLE(fn) | 5→5 | changed | - |
| fict-000016 | R4/t1 | ok | ok | 7→7 | changed | - |
| fict-000017 | R4/t2 | ok | ok | 7→7 | changed | - |
| fict-000018 | R4/t3 | ok | ok | 11→10 | changed | - |
| fict-000019 | R4/t4 | ok | ok | 4→4 | changed | - |
| fict-000020 | R5/rule | ok | ok | 5→4 | changed | - |
| fict-000021 | R5/t1 | ok | ok | 5→5 | changed | - |
| fict-000022 | R5/t2 | ok | ok | 5→5 | changed | - |
| fict-000023 | R5/t3 | UNFIREABLE(fn) | ok | 5→3 | changed | - |
| fict-000024 | R5/t4 | ok | ok | 5→4 | changed | - |
| fict-000025 | R6/rule | ok | ok | 8→7 | changed | - |
| fict-000026 | R6/t1 | ok | ok | 4→6 | changed | - |
| fict-000027 | R6/t2 | UNFIREABLE(fn) | ok | 6→7 | changed | - |
| fict-000028 | R6/t3 | UNFIREABLE(fn) | ok | 6→6 | changed | - |
| fict-000029 | R7/rule | ok | ok | 3→4 | changed | - |
| fict-000030 | R7/t1 | UNFIREABLE(fn) | ok | 2→3 | changed | - |
| fict-000031 | R7/t2 | ok | ok | 10→8 | changed | - |
| fict-000032 | R7/t3 | ok | ok | 8→8 | changed | - |
| fict-000033 | R7/t4 | ok | ok | 10→7 | changed | - |
| fict-000034 | R8/rule | ok | ok | 1→2 | changed | - |
| fict-000035 | R8/t1 | ok | ok | 4→4 | changed | - |
| fict-000036 | R8/t2 | UNFIREABLE(fn) | ok | 6→5 | changed | - |
| fict-000037 | R8/t3 | ok | UNFIREABLE(fn) | 4→6 | changed | - |
| fict-000038 | R9/rule | ok | ok | 4→4 | changed | - |
| fict-000039 | R9/t1 | ok | ok | 4→4 | changed | - |
| fict-000040 | R9/t2 | ok | ok | 3→3 | changed | - |
| fict-000041 | R9/t3 | ok | ok | 6→5 | changed | - |
| fict-000042 | R10/rule | ok | ok | 5→4 | changed | - |
| fict-000043 | R10/t1 | UNFIREABLE(fn) | UNFIREABLE(fn) | 5→5 | changed | - |
| fict-000044 | R10/t2 | UNFIREABLE(fn) | UNFIREABLE(fn) | 5→5 | changed | - |
| fict-000045 | R10/t3 | ok | ok | 1→3 | changed | - |
| fict-000046 | R10/t4 | ok | ok | 11→10 | changed | - |
| fict-000047 | R11/rule | ok | ok | 1→1 | changed | - |
| fict-000048 | R11/t1 | UNFIREABLE(fn) | ok | 1→1 | changed | - |
| fict-000049 | R11/t2 | UNFIREABLE(fn) | UNFIREABLE(fn) | 1→1 | changed | - |
| fict-000050 | R11/t3 | ok | ok | 12→12 | changed | - |
| fict-000051 | R12/rule | ok | ok | 3→3 | changed | - |
| fict-000052 | R12/t1 | ok | ok | 5→5 | changed | - |
| fict-000053 | R12/t2 | UNFIREABLE(fn) | ok | 5→5 | changed | - |
| fict-000054 | R12/t3 | ok | ok | 1→1 | changed | - |
| fict-000055 | R12/t4 | ok | ok | 6→6 | changed | - |
| fict-000056 | R13/rule | ok | ok | 2→2 | changed | - |
| fict-000057 | R13/t1 | ok | ok | 1→2 | changed | - |
| fict-000058 | R13/t2 | ok | ok | 2→2 | changed | - |
| fict-000059 | R13/t3 | ok | ok | 5→5 | changed | - |
| fict-000060 | R14/rule | ok | ok | 4→2 | changed | - |
| fict-000061 | R14/t1 | UNFIREABLE(fn) | ok | 2→2 | changed | - |
| fict-000062 | R14/t2 | ok | ok | 2→2 | changed | - |
| fict-000063 | R14/t3 | ok | ok | 4→4 | changed | - |
| fict-000064 | R14/t4 | UNFIREABLE(fn) | ok | 3→4 | changed | - |
| fict-000065 | R15/rule | ok | ok | 3→1 | changed | - |
| fict-000066 | R15/t1 | UNFIREABLE(const) | ok | 3→2 | changed | - |
| fict-000067 | R15/t2 | ok | ok | 2→2 | changed | - |
| fict-000068 | R15/t3 | ok | ok | 1→1 | changed | - |
| fict-000069 | R15/t4 | ok | ok | 3→3 | changed | - |
| fict-000070 | R15/t5 | ok | ok | 1→1 | changed | - |
| fict-000071 | R16/rule | ok | ok | 1→1 | changed | - |
| fict-000072 | R16/t1 | UNFIREABLE(fn) | UNFIREABLE(fn) | 2→4 | changed | - |
| fict-000073 | R16/t2 | UNFIREABLE(const) | ok | 3→3 | changed | - |
| fict-000074 | R16/t3 | ok | ok | 3→7 | changed | - |
| fict-000075 | R17/rule | ok | ok | 6→3 | changed | - |
| fict-000076 | R17/t1 | ok | ok | 5→4 | changed | - |
| fict-000077 | R17/t2 | UNFIREABLE(const) | ok | 4→4 | changed | - |
| fict-000078 | R17/t3 | ok | ok | 7→7 | changed | - |
| fict-000079 | R18/rule | ok | ok | 2→4 | changed | - |
| fict-000080 | R18/t1 | ok | ok | 3→3 | changed | - |
| fict-000081 | R18/t2 | ok | ok | 3→3 | changed | - |
| fict-000082 | R18/t3 | UNFIREABLE(fn) | ok | 6→6 | changed | - |
| fict-000083 | R19/rule | ok | ok | 5→5 | changed | - |
| fict-000084 | R19/t1 | ok | ok | 5→5 | changed | - |
| fict-000085 | R19/t2 | ok | ok | 5→5 | changed | - |
| fict-000086 | R19/t3 | ok | ok | 3→3 | changed | - |
| fict-000087 | R19/t4 | ok | ok | 6→6 | changed | - |
| fict-000088 | R20/rule | ok | ok | 2→3 | changed | - |
| fict-000089 | R20/t1 | ok | ok | 4→4 | changed | - |
| fict-000090 | R20/t2 | ok | ok | 4→4 | changed | - |
| fict-000091 | R20/t3 | ok | ok | 9→13 | changed | - |
| fict-000092 | R21/rule | ok | ok | 3→5 | changed | - |
| fict-000093 | R21/t1 | UNFIREABLE(fn) | UNFIREABLE(fn) | 3→1 | changed | - |
| fict-000094 | R21/t2 | ok | ok | 5→4 | changed | - |
| fict-000095 | R21/t3 | ok | ok | 3→3 | changed | - |
| fict-000096 | R21/t4 | ok | ok | 5→6 | changed | - |
| fict-000097 | R22/rule | ok | ok | 4→3 | changed | - |
| fict-000098 | R22/t1 | UNFIREABLE(fn) | ok | 4→4 | changed | - |
| fict-000099 | R22/t2 | ok | UNFIREABLE(fn) | 5→5 | changed | - |
| fict-000100 | R22/t3 | ok | ok | 5→5 | changed | - |
| fict-000101 | R22/t4 | ok | ok | 3→3 | changed | - |
| fict-000102 | R23/rule | ok | ok | 2→2 | changed | - |
| fict-000103 | R23/t1 | UNFIREABLE(fn) | ok | 5→5 | changed | - |
| fict-000104 | R23/t2 | UNFIREABLE(fn) | ok | 5→4 | changed | - |
| fict-000105 | R23/t3 | ok | ok | 6→4 | changed | - |
| fict-000106 | R23/t4 | ok | ok | 4→4 | changed | - |
| fict-000107 | R24/rule | ok | ok | 3→3 | changed | - |
| fict-000108 | R24/t1 | ok | ok | 5→4 | changed | - |
| fict-000109 | R24/t2 | ok | ok | 1→1 | changed | - |
| fict-000110 | R24/t3 | ok | ok | 12→11 | changed | - |
| fict-000111 | R25/rule | ok | ok | 1→1 | changed | - |
| fict-000112 | R25/t1 | UNFIREABLE(fn) | ok | 4→2 | changed | - |
| fict-000113 | R25/t2 | ok | ok | 6→6 | changed | - |
| fict-000114 | R25/t3 | ok | ok | 6→6 | changed | - |
| fict-000115 | R26/rule | ok | ok | 4→4 | changed | - |
| fict-000116 | R26/t1 | ok | ok | 6→4 | changed | - |
| fict-000117 | R26/t2 | ok | ok | 4→4 | changed | - |
| fict-000118 | R26/t3 | ok | ok | 4→3 | changed | - |
| fict-000119 | R27/rule | ok | ok | 5→5 | changed | - |
| fict-000120 | R27/t1 | UNFIREABLE(const) | ok | 4→5 | changed | - |
| fict-000121 | R27/t2 | ok | ok | 5→5 | changed | - |
| fict-000122 | R27/t3 | ok | ok | 4→4 | changed | - |
| fict-000123 | R27/t4 | ok | ok | 5→5 | changed | - |
| fict-000124 | R27/t5 | ok | ok | 10→9 | changed | - |
| fict-000125 | R28/rule | ok | ok | 6→7 | changed | - |
| fict-000126 | R28/t1 | ok | ok | 12→6 | changed | - |
| fict-000127 | R28/t2 | UNFIREABLE(fn) | UNFIREABLE(fn) | 5→5 | changed | - |
| fict-000128 | R28/t3 | ok | ok | 5→7 | changed | - |
| fict-000129 | R29/rule | ok | ok | 4→7 | changed | - |
| fict-000130 | R29/t1 | ok | ok | 11→10 | changed | - |
| fict-000131 | R29/t2 | UNFIREABLE(const) | UNFIREABLE(const) | 5→10 | changed | - |
| fict-000132 | R29/t3 | ok | ok | 9→10 | changed | - |
| fict-000133 | R29/t4 | ok | ok | 4→4 | changed | - |
| fict-000134 | R30/rule | ok | ok | 3→3 | changed | - |
| fict-000135 | R30/t1 | ok | ok | 8→10 | changed | - |
| fict-000136 | R30/t2 | ok | ok | 10→9 | changed | - |
| fict-000137 | R30/t3 | ok | ok | 9→9 | changed | - |
| fict-000138 | R30/t4 | ok | ok | 2→2 | changed | - |
