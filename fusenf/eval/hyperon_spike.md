# hyperon-miner cross-reference spike — item E (2026-08-25)

Per `PATTERN_MINER_STUDY.md` §3 option C: run the living TrueAGI implementation on a
namespaced Tier A export as a cross-reference (NOT an oracle; arbiter = written spec +
answer key). Setup: shallow clone of `trueagi-io/hyperon-miner` @ master (2026-08-25),
run under the pinned PeTTa (`/home/manhin/Dev/PeTTa/run.sh`), data = first 60 Tier A
records exported as flat ground atoms with per-record-namespaced skolems
(`e0 → e0_r007`), surface/Implication excluded (parity with our miner).

## Verdict

**The spike question — "could hyperon-miner serve directly later?" — answers NO at
current maturity**, for reasons that are upstream defects/limitations, not conception
problems. On the fragment where it runs, **it corroborates `frequent_patterns2`
exactly (24/24 pattern-count agreement)**. `frequent_patterns2` stands as the
production miner, as planned.

## Findings, classified per §3 (our-gap / our-extension / their-bug)

1. **THEIR-BUG — the documented entry path is a silent no-op at master.** Two arity
   skews: (a) the starter `run_miner.metta` calls `pattern-miner` with 8 args while the
   definition takes 9 (`$initpat` was added and the starter not updated; their own test
   file passes `$x`); (b) with that fixed, `pattern-miner`'s body calls
   `frequency-pattern-miner` with 7 args of the wrong kinds (`&db $initpat &cndpspace
   &conjspace minsup depth conj-exp`) against a definition wanting 5 spaces + 3 params.
   MeTTa partial application does not error, so the whole path returns an empty result
   space with exit 0 — a **silently-empty failure mode** worth flagging upstream.
2. **THEIR-LIMITATION — multi-head atomspaces yield zero candidates.** Driving
   `frequency-pattern-miner` directly (the component their tests exercise): all phases
   run, but on our mixed-head data (Member/Agent/Theme/Past/…) the candidate space
   comes back empty; on a single-head slice of the SAME records (Member-only, same
   symbols, namespaced skolems) it produces the full inventory; control on their
   single-head sample also works. Our substrate is intrinsically multi-head, so at
   master the miner cannot cross-reference it without per-head sharding. Additionally
   the db-ingest destructures `($link $x $y)` — strictly binary: unary (`(Past e0)`),
   n-ary, nested (`(Time e0 (Month …))`) and numeric atoms are silently dropped or, in
   the full pipeline, kill the abstraction stage (our first run died right after
   "Pattern Miner Started" with no error).
3. **DIALECT SKEW.** Newer test files use `! (import! …)` spacing that the pinned PeTTa
   parser rejects (`expected '(' or '!('`); older bang-flush files parse. The repo
   tracks a moving PeTTa dialect.
4. **CORROBORATION on the working fragment.** Member-only 60-record slice, their
   minsup 3 occurrences vs our `--min-support 1 --k 2` run on identical records:
   **24/24 lexical patterns agree exactly on occurrence counts** once our e/x streams
   are pooled — e.g. their `(Member Z depot) 7` = our `(Member $x0 depot)` 7×, their
   fully-abstract `(Member Z (S Z)) 147` = our shape stratum's `(Member $_ $v0)`
   total. Their de-Bruijn variables (`Z`, `(S Z)`) carry no stream typing; our
   event/entity distinction is a deliberate extension (documented), as is document
   support as the primary statistic (theirs counts tree matches = our secondary
   `occurrences`).

## Upstream-reportable package (owner may forward)

- run_miner.metta starter vs `pattern-miner` arity (8 vs 9);
- `pattern-miner` body vs `frequency-pattern-miner` signature (7 wrong-kind args vs
  5-spaces+3);
- multi-head atomspace → silently empty candidate space (repro: any two link types);
- (minor) test-file `! (` spacing vs PeTTa parser.

Repro drivers and logs: session scratchpad `drive2/3/4.metta`, `hm_*.log`; the working
direct call form is
`!(frequency-pattern-miner &dbspace &specspace &cndpspace &aptrnspace &conjspace 3 0 True)`
after copying `&db` into `&dbspace` via the binary-destructure line, with the
`run_miner.metta` import block.
