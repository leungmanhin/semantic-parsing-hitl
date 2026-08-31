# #48 bounded pilot — reading-set stability on the Tier C ambiguous residue (2026-08-16)

**Question** (owner-approved): is the M1 Tier C plateau (≈0.45, residual diagnosed as garble +
genuine ambiguity + 1–2-atom flips) substantially caused by GENUINE two-reading ambiguity that a
multi-interpretation contract would stabilize?

**Setup.** Draft `Interpretation` contract in `ADDENDUM.md` (prompt.txt UNTOUCHED — hash
`64ad24645a04` unchanged; the addendum extends it for pilot batches only). Items = the 51
never+flip records from the four M1 fix-round pairs (classification reproduces 9/18/33 exactly).
2 runs × 51 items, 22 blind Sonnet parse agents, outputs split mechanically (`harness/pilot48.py`)
so the frozen canonicalizer sees ordinary per-reading records; item identity = sha256 of the
SORTED reading graph_ids. **Baseline = v4 runs 7–8 on the same 51 items: 17/51 = 0.333** — same
prompt, no addendum: the natural no-addendum control.

## Result: the strong hypothesis is REFUTED

| measure | value |
|---|---|
| multi-reading emissions | **1 of 102 parses** (run 1: 1, run 2: 0) |
| stable multi-reading items (the #48 payoff case) | **0** |
| reading-set stability | 25/51 = 0.490 (baseline 0.333) |
| — never class | 4/18 = 0.222 (baseline 0/18 — selected for 0/4) |
| — flip class | 21/33 = 0.636 (baseline 17/33 = 0.515) |
| emission × agreement | single/single: 25 agree / 25 disagree; mixed: 1 disagree |

The apparent stability gain is NOT attributable to the mechanism: it sits entirely in
single/single pairs, and the never-class share (0.222 over items *selected* for 0/4 past
agreement) is what regression-to-the-mean produces when you condition on past noise. The four
never-items that agreed are all corpus garble ("Chongqing is a district in Wanzhou District…",
"Des Moines are included in the Warren County -- West Des Moines…") — chance re-convergence on
mangled text.

## Forensics on the one emission (tierC-000309)

Run 1 used the mechanism EXACTLY as designed — a textbook PP-attachment ambiguity ("the channel
between Laamu Atoll and Thaa Atoll **of the Maldives**"): 8 shared atoms + one wrapped
`LocatedIn` per reading (Thaa-in-Maldives vs channel-in-Maldives). Run 2 then emitted a THIRD
analysis with no wrapper at all: `Between` split from ternary to two binary atoms, and the
of-phrase distributed to BOTH atolls. So the item's instability is representation wobble
(operator arity + attachment) over ≥3 live analyses — not a discrete two-reading flip, and a
reading-SET identity cannot stabilize it either.

## Conclusions

1. **The plateau's residual is NOT clean binary ambiguity.** The parser, given an explicit and
   conservative multi-reading mechanism, judged 101/102 of the most unstable Tier C parses to be
   single-reading. The residual instability is (a) garbled corpus text parsed differently each
   time and (b) representation wobble across ≥2 live analyses that the parser does not perceive
   as discrete readings. This closes the "ambiguity share" theory of the M1 plateau.
2. **The Interpretation mechanism itself is sound**: transport syntax, mechanical splitting,
   per-reading canonicalization and set-hashing all worked first try; the one emission was a
   correct, well-formed use. But its trigger fires ~1% of the time on this corpus and the
   trigger itself is run-unstable — as an M1 instrument it is inert.
3. **Recommendation: do NOT adopt the contract change for M1/stability reasons.** #48 remains
   representation-motivated (honest QA over genuinely ambiguous inputs, the #5/#21 scope
   readings, marginalization) and the pilot files stand as its reference implementation
   (`ADDENDUM.md` + `harness/pilot48.py` + this report); any future adoption should argue from
   representation needs, likely with a trigger that names ambiguity TYPES (attachment / lexical
   / idiom-vs-literal) rather than "two complete readings".
4. Plateau follow-ups now point at the other residual components: corpus hygiene on the garbled
   share (an owner call — it changes what M1 measures), or accepting ≈0.45 as this corpus
   slice's ceiling and reporting it as such.

Cost: 102 parses (22 agents, ~160–220k tokens each). Artifacts: `pilot48/{ADDENDUM.md,
items.tsv, batches/, raw/ (102 files), canon_run1.jsonl, canon_run2.jsonl}`.
