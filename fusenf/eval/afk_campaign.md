# AFK parse campaign — final report (2026-08-22 → 2026-08-23)

The batch-2 parse program from `BATCH2_PLAN.md` (front-loading item H's parsing), run
entirely on the frozen fix-pack instrument. **COMPLETE: 2,360 sentences parsed blind at
one hash, assembled append-only, mechanically validated; zero data loss.**

## Instrument (frozen throughout — verified at every group boundary)

- `prompt.txt` sha256 `f6448eac9f884ae607a37f09ce16b4c0997e08590464a150c16f24fa7ca2af11`
- `seeded_rules.metta` sha256 `b7e25b963478…` — pair pinned in `specs/vocabulary.json`
- Parser: blind Sonnet agents (claude-sonnet-5), briefs `PARSE.md` / `REPARSE.md` /
  `REPARSE_run40.md`; 5-item load-balanced batches, 8-agent groups, disk-diff per group.

## What was parsed

| wave | corpus slice | run | batches | records | clean | report-only |
|---|---|---|---|---|---|---|
| Tier B pilot re-parse | tierB-000001–000100 | 2 | pb-tbr001–020 | 100 | 97 | 3 |
| Tier C in-sample (D.4) | tierC 360 | 40 | pb-tcr001–072 | 360 | 340 | 20 |
| Tier B new | tierB-000101–002000 | 1 | pb-tb001–380 | 1,900 | 1,830 | 70 |
| **total** | | | **472** | **2,360** | **2,267** | **93 (3.9%)** |

All findings are report-only (validation never blocks): Tier B new finding instances =
66×C4 (unknown head — dominated by two licensed-by-shape families: opaque open-class
kind-relations e.g. `Stifle`/`Prey`/`Establish`, and multiword surface-preposition heads
e.g. `NextTo`/`Atop`/`AcrossTheStreetFrom`/`BecauseOf`), 19×C6 (Time/Location attached
to a non-event symbol), 2×C3, 1×C7, plus singletons like `BeforeByAtLeast`/`Century`
(reasoned construct extensions). Triage rows in `triage/parse_failures.jsonl`.

Final verification (this file's checklist executed 2026-08-23):
`tierB.parses.jsonl` = 2,100 records, 0 duplicate (id,run): 1,900 run-1 + 100 run-2
pinned `f6448eac` (the 100 old-hash pilot run-1 records untouched, as designed);
**2,000/2,000 corpus ids carry a final-hash record**; `tierC_r40.parses.jsonl` =
360/360 run-40 pinned. Append-only assembly confirmed safe end-to-end.

## Incidents (all recovered, zero loss)

1. **Session-limit ×2** (groups 28 and 47): killed agents; disk-diff identified truly
   missing batches (dead agents' landed files count — disk is ground truth); whole
   batches re-run. 9 recovery agents total.
2. **Blind-protocol breach** (group 59, pb-tb374 first run): the agent self-reported
   glancing at one unrelated pre-existing `raw/` file (format corroboration only).
   Per the fix-pack precedent, its 5 unassembled outputs were deleted and the batch
   re-run fully blind. No content influence suspected; replaced anyway so every
   campaign record is uniformly blind.
3. **cwd-drift** (recurring trap, recorded in memory): the engine-env `cd` persists
   across shell calls; any disk-diff/inspection printing `cat:`/`ls:` errors is INVALID
   and was re-run from `fusenf/`. No check was accepted in a drifted state.

## Corpus/filter observations (for the batch-2 report + build_tierB backlog)

- Pronoun stoplist gaps: possessive **its**, reflexives (**herself/themselves**),
  absolutive **mine** are not in `_RE_REJECT`; a handful of sentences carry them
  (e.g. tierB-001627, tierB-001538, tierB-001613) — all benign (in-sentence or
  speaker-deictic antecedents), parsers handled per doctrine.
- Multi-sentence leaks ×3: the ends-with-period filter admits interior boundaries —
  tierB-000606 ("If planes are dangerous…", flagged at pause 2), tierB-001461
  ("This animal cannot fly. Its wings are broken." — parsed with in-record coref),
  tierB-001799 ("Just look! This is much cheaper…").
- Tatoeba sibling near-duplicates survive exact-normalized dedup and are free natural
  paraphrase pairs (e.g. tierB-000937 "the blue sky" / tierB-001124 "the blue skies").
- Relaxed-filter material (digits, 2-comma) landed as intended: times ("7:15 a.m."),
  dates ("November 5th"), measures ("1 tbsp", "20 metres"), counts.

## Construct sightings in the wild (validation of recent prompt work)

- **[G] Perception reports** (the fix-pack section) fired correctly ≥5 times unprompted:
  active (tierB-001720 "watched the team practice"), passive (tierB-000176 "was heard
  to crash"), passive+participial with the `Ongoing` 4th marker (tierB-001911 "observed
  gathering"), under neither/nor negation (tierB-001274), plus routing respected.
- **#48 Interpretation** used once on a genuine PP-attachment ambiguity
  (tierB-001713 "The search for life in space continues") — first natural-text use.

## Recurring parser-flagged gaps (batch-3 prompt-side candidates; NOT acted on)

1. Vague frequency adverbs ("often/always/sometimes/never-as-frequency") — no
   construct; agents variously drop them or hedge via confidence/strength. Most-cited
   gap of the campaign.
2. Control-infinitive complements ("need/try/decide/want/struggle to V") — no explicit
   doctrine; agents split between attitude-style sealing and Theme-linked assertion.
3. Tough-constructions ("easy/hard/difficult to V") and "worth NP" — repeatedly
   improvised from adjacent patterns.
4. Multiword locative prepositions ("next to", "atop", "across the street from") —
   consistently coined as CamelCase oblique heads (C4 report-only by design); a
   licensing note in the prompt would formalize the pattern the parsers converged on.

## Ops ledger

Campaign agents: 564 of 600 session-lifetime (463 through pause 2 incl. 9 recovery +
4 fix-pack, + 96 batches in groups 48–59 + 1 pb-tb374 re-run); slack ~36. Groups 48–59
ran 2026-08-23 with zero session-limit incidents; disk-diff clean at every group;
mid-tranche assembly at pb-tb340, final assembly at pb-tb380.

## What deliberately did NOT happen (owner-gated)

No review agents, no mining, no measurement (items E/F/G/H await the owner per
`BATCH2_PLAN.md`). Owner-return review queue: tierB-000606 one-line parse flag, the
run-30-vs-run-40 supersession bookkeeping, and this report's gap list.
