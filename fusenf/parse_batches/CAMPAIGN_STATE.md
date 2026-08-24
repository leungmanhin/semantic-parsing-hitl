# AFK parse campaign — COMPLETE 2026-08-23

Full report: `../eval/afk_campaign.md`. Nothing left to dispatch.

Instrument: prompt `f6448eac9f88…` / seeded `b7e25b96…` — verified unchanged at every
group boundary, freeze held end-to-end. Model claude-sonnet-5, briefs PARSE.md /
REPARSE.md / REPARSE_run40.md.

## Final ledger (all 472 batches + 1 protocol re-run)

- `pb-tbr001–020` — Tier B pilot 100 @ run 2: assembled + validated (97/3).
- `pb-tcr001–072` — Tier C in-sample 360 @ run 40: assembled + validated (340/20);
  `tierC_r40.parses.jsonl` 360/360 pinned; owner decision D.4 fully executed.
- `pb-tb001–380` — Tier B new 1,900 @ run 1: assembled + validated (1,830/70).
  pb-tb374's first parse was replaced (blind-protocol breach, self-reported; 5 raws
  deleted unassembled, batch re-run blind).
- Full-corpus verification PASSED: tierB.parses.jsonl = 2,100 records, 0 dup (id,run)
  (1,900 r1 + 100 r2 @final hash; 100 legacy pilot r1 @old hash untouched);
  2,000/2,000 corpus ids have a final-hash record.
- Incidents: session-limit ×2 (groups 28, 47) + breach ×1 — all recovered, zero loss.
- Agents: 564/600 session-lifetime used.

## Next (owner-gated — NO review agents until then)

Items E (frequent_patterns2 miner) → F (M5 question arm) → G (pre-flight checklist)
→ H mining+measurement over this pre-parsed corpus, per `BATCH2_PLAN.md`. Owner-return
review queue: tierB-000606 one-liner flag + `eval/afk_campaign.md` §gap-list.
