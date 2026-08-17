# M2 held-out — the P4 tail: Tier C 361–1000 @ 64ad2464 (2026-08-16)

**Setup.** The 640 previously-unparsed Tier C records (320 self-contained equiv classes: 120
paraphrase pairs + 200 PAWS adversarial control pairs, zero straddling the old parse boundary)
parsed under the CURRENT frozen prompt hash `64ad2464…` — one hash across both arms of every
pair, exactly as the M2 spec requires. Every mined rule, both gauntlets, and both consolidation
waves saw only the first 360 records, so this block is **fully held-out**. Ops: 4 waves × 32
five-item batches; wave 1 hit a server-side rate-limit burst (18/32 agents killed → 84 items
rebuilt from the disk diff, 17 recovery batches, all clean); waves 2–4 ran 8 agents at a time
and had **zero failures**. 137 parse agents total; 640/640 raw files, 6,670 atom lines, 0
malformed. Assembly (`--no-c7`, matching prior strata): 31/640 records with report-only
findings (C4 ×37, C6 ×2). Consolidation (wave-1 + wave-2 validated rules): 389/640 records
changed — 642 pack applications (mn0001 ×135, mn0011 ×110, mn0002 ×84…), but only **15
token-level lexical rewrites** corpus-wide.

## Results (d_content on pairs; content_id exact)

| | paraphrase (n=120) | adversarial control (n=200) | AUC |
|---|---|---|---|
| BEFORE (canonical) | d 0.482, exact 15/120 = 12.5% | d 0.623, exact 4/200 | 0.6354 |
| AFTER (consolidated) | d 0.546, exact 15/120 = 12.5% | d 0.695, exact 4/200 | 0.6352 |

## Verdicts against the pre-registered criteria

- **Criterion 2 — adversarial controls preserved: PASS.** This is the FIRST test against the
  true pre-registered control arm (the preview only had random cross-class pairs).
  Consolidation collapsed **zero** control pairs: exact stays 4/200, d_ctl went UP. The 4
  exacts pre-date consolidation (parser-level) and dissect as: 2 PAWS label artifacts that are
  genuinely semantically equivalent (predicate-conjunction order swaps: "white…cylindrical" /
  "written and composed"), 1 garble normalization (the Kozani containment scramble resolves to
  the only coherent reading), and 1 real representation-sensitivity miss (pairC-0378: the
  "Chief" title moves between two named people and both parses land on the same graph). Net:
  the representation held ≥199/200 genuinely-different controls apart, and the rules held all
  of them.
- **Criterion 1 — d_pos −25%: NOT MET on held-out data.** d_pos moved +13.4% — but this is the
  documented denominator artifact of pack rules (packing shrinks atom sets, so each residual
  diff weighs more): the control column moved by the same amount (+11.6%) and **AUC is
  unchanged to three decimals** — the geometry was rescaled, not degraded. The substantive
  fact is exact_pos: 15/120 unchanged. The 13 validated lexical rules were mined from Tier A's
  engineered vocabulary and have ≈0 recall on this PAWS-derived block (15 rewrites in 640
  records); packs are bijective by design and cannot create convergence. **The convergence
  power of the current rule set is in-sample-vocabulary-scoped; its safety is not.**

## Reading

Batch 1's M2 story is now precise: convergence is demonstrated in-sample (Tier A 18.9% →
43.3% graph-identical under judge-validated rules, controls 0/468), and **safety generalizes
out-of-sample** (this block: 0 induced control merges, AUC preserved), but held-out
convergence awaits rules mined from comparable vocabulary. The held-out block itself is now
the substrate for that: 120 fresh positive pairs double the alignment-mining corpus — a
split-half design (mine on 60 pairs, validate on 60) would keep the held-out property for
wave 3. Metric note for the paper: d_content across pack/no-pack views embeds the denominator
artifact — report the faithful-view distance (or both views) when comparing consolidation
regimes.

## Corpus/state after this run

Tier C is now **1000/1000 parsed** (360 @ `38fc16af20` in-sample stratum + 640 @ `64ad2464`
held-out stratum); artifacts: `parses/tierC_p4.parses.jsonl`, `canonical/tierC_p4.canon.jsonl`,
`consolidated/tierC_p4.cons.jsonl`, `corpora/tierC_361_1000.jsonl` (slice), batches
`parse_batches/c4-*.txt` + `c4r-*` (wave-1 recovery). Open next steps: wave-3 mining on the
doubled substrate (split-half), Tier B scale-up, engine And-prover fix, or close batch 1.
