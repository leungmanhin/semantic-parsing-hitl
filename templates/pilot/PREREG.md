# Template pilot — pre-registration (PROPOSED 2026-09-30; frozen at the owner's go, before the first pilot run)

Written before any pilot parse exists. The development set (10 goldens) was used for a smoke run
of the machinery only and is excluded from everything below. Changing a threshold after the run
is allowed only with the reason and the pre-change number recorded here.

## Development history (before the freeze)

The development set was parsed twice by the template arm. Run 1 exposed one registry gap
("none of the Ns V-ed" had no rule in R01); the rule was added and run 2 confirmed it. One
wording refinement followed (what to keep beside an unmapped part is decided by entailment).
Both changes are registry edits made on development evidence only. No pilot item has been
parsed by either arm. Archived: `raw_dev_v1/`, `raw_dev_v2/`, `out/dev.v1.*`, `out/dev.v2.*`.

## What is compared

| | template arm `t26` | control arm `ctl` |
|---|---|---|
| parser | blind Sonnet subagent, brief `briefs/TPARSE.md` | blind Sonnet subagent, brief `briefs/CPARSE.md` |
| instruction set | `generated/PROMPT_T26.txt` (generated from `registry/starter26.yaml`) | `prompt.txt` at its pin |
| parser output | template instance records (JSON) | atoms |
| atoms produced by | `tmpl/emitter.py` (code) | the parser |

Same items, same 5-item batches, 3 runs per item, fresh agent per batch and run, in both arms.
Hashes of every instrument are in `manifest.json`.

## Substrates

| set | items | reference | used for |
|---|---|---|---|
| `gold` | 64 goldens, stratified (rule in `manifest.json`) | expected atoms in `regression/regression_cases.md` | fidelity, coverage, stability |
| `tiera` | 29 Tier A items (`tierA_m1v7.jsonl`) | none (equivalence classes only) | stability, cross-arm agreement |
| untouched | 272 eligible goldens | — | regression pool for the expansion rounds |

## Measures

All comparisons are on canonical forms (`fusenf-canon/4`), witnesses and proof names ignored.

1. **Validity.** `t26`: share of raw files that are JSON and pass R1–R8. Both arms: validator
   findings C1–C6, C8 on the resulting atoms (C7 engine load run separately).
2. **Fidelity.** Exact canonical match with the golden. For `t26` a parse CLAIMS FULL COVERAGE when
   its `unmapped` list is empty. Fidelity is compared on the items where `t26` claims full
   coverage in at least 2 of its 3 runs, both arms restricted to those items.
3. **Precision on partial coverage.** For `t26` parses with a non-empty `unmapped` list: the share
   of emitted atoms present in the golden. Atoms not in the golden are MISFIRES and are
   attributed to their owning template.
4. **Silent drops.** Parses that claim full coverage (every `ctl` parse does) and lack golden atoms.
5. **Stability.** M1 pairwise agreement of `graph_id` over the 3 runs, per set and per arm.
6. **Coverage** (`t26` only, no threshold): share claiming full coverage, unmapped codes, G00 rate,
   templates fired, losses recorded by the emitter.

## Thresholds and decision rule

| # | criterion | threshold |
|---|---|---|
| V1 | atoms emitted from valid records carry no validator finding of error severity (C1, C2, C3, C6) | 0 findings |
| V2 | `t26` raw files that are valid records | ≥ 0.95 |
| F1 | `t26` exact-match rate on its claimed-full items | ≥ `ctl` rate on the same items − 0.05 |
| P1 | mean precision of `t26` partial-coverage parses | ≥ 0.95 |
| D1 | `t26` silent-drop rate on claimed-full parses | ≤ `ctl` rate on the same items + 0.05 |
| S1 | `t26` pairwise agreement, `gold` | ≥ `ctl` − 0.03 |
| S2 | `t26` pairwise agreement, `tiera` | ≥ `ctl` − 0.03 |

**GO to expansion** when V1 holds and V2, F1, P1, D1, S1, S2 all hold, and no misfire family
(the same owning template producing atoms outside the golden on 3 or more different items)
remains without a registry fix. **Improvement**, as opposed to parity, is claimed only where
`t26` exceeds `ctl` by more than the tolerance in the table.

**Goldens at odds with prompt.txt.** The development run found two goldens that both arms
fail identically in every run and that contradict the current prompt. Such a case is a
candidate GOLDEN defect, not a parser error. Rule: an item that both arms miss in all three
runs with the same canonical form is listed separately for the owner's adjudication, and every
fidelity figure is reported twice, on all items and excluding the items the owner rules to be
golden defects. No item is excluded without that ruling.

A failed criterion is a finding, not a stop: it is reported with its per-item evidence in
`out/<set>.PAIRS.md`, and the owner decides between a registry fix with a re-run on the
untouched pool, or closing the exploration.

## Not covered by this pilot

Context-bearing input, questions, multi-reading output, the engine-load check on every parse,
and any template outside the starter 26. Inventory templates reached by composition rather than
by a record of their own (R02, T14, L04) are reported as such.
