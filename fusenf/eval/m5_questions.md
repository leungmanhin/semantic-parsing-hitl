# M5 question arm — differential run (item F)

- questions: 80 rows (40 literal + 40 paraphrastic); QGEN `90a8e0d72fc8` QPARSE `7552d7e8ab9e`; bridges: mined_bridges_wave1.metta, mined_bridges_wave2.metta, mined_bridges_wave3.metta
- literal baseline (arm A answers with gold): **21/40**
- bridge payoff (paraphrastic, B-only with gold): **5** — named rules: mined_w1_lex_begin_start, mined_w1_lex_buy_purchase, mined_w1_lex_commence_begin, mined_w1_lex_fix_repair, mined_w1_lex_give_up_abandon
- buckets: {'answered-both': 21, 'bridge-payoff': 5, 'engine-bug': 2, 'engine-bug-suppressed': 11, 'query-brittleness': 17, 'uncovered-paraphrase-inventory-miss': 17, 'uncovered-rule-present-unfired': 7}

## Reading (item F close-out, 2026-08-25)

**The instrument works.** The differential held its contract: zero
`control-fabrication-analog` (bridges invented nothing on the 10 bridge-free control
records), zero `bridge-supplied-literal`, zero monotonicity violations (no A-only binds),
and every payoff is attributable to a named rule. First direct QA measurement of the
mined bridges (#33 by another name): **5 paraphrastic questions answered ONLY because a
bridge carried them** — buy→purchase, fix→repair, begin→start, commence→begin,
give_up→abandon — against blind writers' natural rewordings, of which 10/40 landed in
the 62-lexeme inventory at all (the honest natural-coverage rate; writers never saw the
inventory).

**The engine And-prover is the single biggest suppressor**: 13 rows attribute to
`bug_conj_reuses_rule_premise` (11 paraphrastic + 2 literal), including one confirmed
suppressed payoff (cancel↔call_off, `mined_w1_lex_call_off_cancel` — the query re-asserts
the premise of the very rule that derives its verb conjunct). The upstream fix (item X)
converts these mechanically; payoff 5 is a floor.

**`uncovered-rule-present-unfired` (7) is mostly good news misread by the conjunction**:
per-conjunct census shows the bridge LEMMA derived in 6/7 — the structural light-verb
bridge (make_a_decision→decide) and the idiom bridge (kick_the_bucket→die) each came ONE
conjunct short of a full answer. What failed instead: an FP3-doctrine oblique (`On` query
vs archival `Theme`), a measure-dimension token (`old` vs `age`), the S1 reified-state
form vs flat archival parses, a `Like` head QPARSE improvised for "What is X like?"
(a genuine QPARSE.md gap — property questions were never mapped; fix: `(Member $x1 $ans)`),
and one generic-record (below). The distinct real gap: **lexical bridges do not remap role
frames** — find_out→discover fires but Experiencer/Stimulus (perception frame) does not
convert to the query's Agent/Theme; frame-carrying bridges are a rule species the wave-1
slot-merge signals pointed at and nothing yet emits.

**`query-brittleness` (17, all literal) decomposes into named families** (per-conjunct
census in `questions/results.json`):

| family | n | failing conjunct | nature |
|---|---|---|---|
| occurrence-role drift (Patient-query vs Theme-record: abandon/give_up the search) | 2 | `(Patient $e1 $x1)` | standard drift — archival parses predate the B2 occurrence rule |
| prepositional-verb oblique drift (decide **on** → `On` vs archival `Theme`) | 3 | `(On …)` | standard drift — FP3 doctrine |
| S1 adj-complement drift ("in size" reified vs flat archival copular) | 3 | `(Experiencer …) (In …)` | standard drift — FP3 doctrine |
| perception-frame mismatch (discover/find_out: Agent/Theme vs Experiencer/Stimulus + Location-vs-LocatedIn) | 2 | role atoms | frame remapping missing (same species as above) |
| generic-record vs episodic wh-question (habitual/bare-plural records parse as rules; no witness exists) | 3 | everything (rule-internal) | representation-fundamental, not brittleness — QGEN cannot know a sentence is generic |
| time normalization (`noon` vs `(Time e0 (Hour 12))`, plus a futurate tense) | 1 | `(Time $e1 noon)` | NEW species: surface-time↔structured-time bridges do not exist |
| QGEN idiom literalization ("What does the founder kick…?") | 1 | idiom atoms | question-writer artifact, accounted |
| relation shift in the question (where-question vs record's `Goal` path) | 1 | `(Location …)` | QGEN/QPARSE relation-neutrality limit |
| nominalization structure (cause-the-destruction-of) | 1 | `(Of …)` etc. | cross-form structural gap |

So ~8/17 brittleness rows + several unfired rows are **standard drift measured from the
QA side** — the same phenomenon as PAPER_NOTES §19, now visible in queries: the Tier A
canon is archival (64ad2464-era parses) while QPARSE writes current-hash doctrine. These
dissolve when H re-parses the substrate at `bb7c4b71`; the question arm should re-run
there and the drift families are the prediction to check.

**Literal baseline 21/40** is therefore NOT a KB-quality number — it is dominated by the
same drift + engine families; `answered-both` (21) + engine-attributed (13) + drift
families (8) + generic-records (3) account for the bulk.

**Protocol notes.** One deviation logged (`questions/manifest.json`): the qp-06 QPARSE
agent style-checked sibling query files (no sentence/gold exposure; core blindness held);
both briefs tightened post-wave. A harness bug was caught and fixed mid-analysis
(probe queries without `$ans` misread as failures — run_query now returns bind-status and
answers separately); arm results were never affected. Runs 1→3 recorded in the task logs;
run 3 is final.

**Feeding forward.** (1) `query-brittleness` rows carry `failing_conjuncts` — the QPARSE
prompt-loop worklist analog; the QPARSE.md fixes queued: property-question mapping,
where-vs-Goal note. (2) New bridge species for the backlog: frame-remapping rules,
surface↔structured time terms, measure-dimension synonyms (`age`/`old`). (3) At H: re-run
this arm on the re-parsed substrate (drift families should vanish; payoff floor should
rise with the And-prover fix). (4) Engine-fix dividend now has a question-level number
attached (13 rows).


| qid | kind | stratum | bucket | A | B | question |
|---|---|---|---|---|---|---|
| tierA-000001-q1 | literal | bridge | answered-both | ✓ | ✓ | Who bought two forklifts? |
| tierA-000001-q2 | paraphrastic | bridge | bridge-payoff | — | ✓ | What did the depot purchase? |
| tierA-000003-q1 | literal | bridge | answered-both | ✓ | ✓ | Who acquired two forklifts? |
| tierA-000003-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | What did the depot obtain? |
| tierA-000030-q1 | literal | bridge | answered-both | ✓ | ✓ | Who fixed a seized gearbox? |
| tierA-000030-q2 | paraphrastic | bridge | bridge-payoff | — | ✓ | What did the mechanic repair? |
| tierA-000052-q1 | literal | bridge | answered-both | ✓ | ✓ | What begins at dawn? |
| tierA-000052-q2 | paraphrastic | bridge | bridge-payoff | — | ✓ | What starts at dawn? |
| tierA-000054-q1 | literal | bridge | answered-both | ✓ | ✓ | What commences at dawn? |
| tierA-000054-q2 | paraphrastic | bridge | bridge-payoff | — | ✓ | What begins at dawn? |
| tierA-000072-q1 | literal | bridge | query-brittleness | — | — | Who allows visitors on Sundays? |
| tierA-000072-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | Who does the warden permit on Sundays? |
| tierA-000099-q1 | literal | bridge | query-brittleness | — | — | Who abandons the search? |
| tierA-000099-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What does the rescue team call off? |
| tierA-000100-q1 | literal | bridge | query-brittleness | — | — | Who gives up the search? |
| tierA-000100-q2 | paraphrastic | bridge | bridge-payoff | — | ✓ | What does the rescue team abandon? |
| tierA-000128-q1 | literal | bridge | query-brittleness | — | — | Who discovers an error in the ledger? |
| tierA-000128-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What does the auditor spot in the ledger? |
| tierA-000129-q1 | literal | bridge | query-brittleness | — | — | Who finds out an error in the ledger? |
| tierA-000129-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | What does the auditor discover in the ledger? |
| tierA-000143-q1 | literal | bridge | engine-bug | — | — | What does an airline cancel? |
| tierA-000143-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | Who scrubs the evening flight? |
| tierA-000144-q1 | literal | bridge | engine-bug | — | — | What does an airline call off? |
| tierA-000144-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | Who cancels the evening flight? |
| tierA-000173-q1 | literal | control | answered-both | ✓ | ✓ | Who walks along the ridge? |
| tierA-000173-q2 | paraphrastic | control | engine-bug-suppressed | — | — | Where does a shepherd hike? |
| tierA-000181-q1 | literal | control | query-brittleness | — | — | Where do two children walk? |
| tierA-000181-q2 | paraphrastic | control | engine-bug-suppressed | — | — | Who strolls to the pier? |
| tierA-000185-q1 | literal | bridge | query-brittleness | — | — | What does a committee decide on? |
| tierA-000185-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | Who chooses a new roof? |
| tierA-000186-q1 | literal | bridge | query-brittleness | — | — | Who makes a decision on a new roof? |
| tierA-000186-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | What does a committee decide on? |
| tierA-000191-q1 | literal | bridge | query-brittleness | — | — | Who makes a decision on the case? |
| tierA-000191-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What does a judge rule on? |
| tierA-000207-q1 | literal | bridge | answered-both | ✓ | ✓ | Who answers the query? |
| tierA-000207-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What does a clerk respond to? |
| tierA-000208-q1 | literal | bridge | answered-both | ✓ | ✓ | Who gives an answer to the query? |
| tierA-000208-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What does a clerk provide to the query? |
| tierA-000222-q1 | literal | control | answered-both | ✓ | ✓ | What destroys the greenhouse? |
| tierA-000222-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What does a storm wreck? |
| tierA-000223-q1 | literal | bridge | query-brittleness | — | — | What does a storm cause the destruction of? |
| tierA-000223-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | What wrecks the greenhouse? |
| tierA-000224-q1 | literal | control | answered-both | ✓ | ✓ | What is destroyed by a storm? |
| tierA-000224-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What wrecked the greenhouse? |
| tierA-000227-q1 | literal | control | answered-both | ✓ | ✓ | What does a fire destroy? |
| tierA-000227-q2 | paraphrastic | control | engine-bug-suppressed | — | — | What burns down the archive? |
| tierA-000229-q1 | literal | control | answered-both | ✓ | ✓ | What is destroyed by a fire? |
| tierA-000229-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What burned down the archive? |
| tierA-000232-q1 | literal | control | answered-both | ✓ | ✓ | What destroys the footbridge? |
| tierA-000232-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What does a flood wash away? |
| tierA-000234-q1 | literal | control | answered-both | ✓ | ✓ | What is destroyed by a flood? |
| tierA-000234-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What wrecked the footbridge? |
| tierA-000237-q1 | literal | bridge | query-brittleness | — | — | What arrives at noon? |
| tierA-000237-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What pulls in at noon? |
| tierA-000242-q1 | literal | bridge | answered-both | ✓ | ✓ | What is on Thursday? |
| tierA-000242-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | The coming of what is on Thursday? |
| tierA-000249-q1 | literal | bridge | query-brittleness | — | — | What dies during the winter? |
| tierA-000249-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What perishes during the winter? |
| tierA-000250-q1 | literal | control | query-brittleness | — | — | What kicks the bucket during the winter? |
| tierA-000250-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | What passes away during the winter? |
| tierA-000254-q1 | literal | bridge | query-brittleness | — | — | What does the founder kick at ninety? |
| tierA-000254-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | Who dies at ninety? |
| tierA-000262-q1 | literal | control | answered-both | ✓ | ✓ | What does a recruit receive from a trainer? |
| tierA-000262-q2 | paraphrastic | control | uncovered-paraphrase-inventory-miss | — | — | Who gives a whistle to a recruit? |
| tierA-000327-q1 | literal | bridge | query-brittleness | — | — | What is large in size? |
| tierA-000327-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | What is big in size? |
| tierA-000328-q1 | literal | bridge | query-brittleness | — | — | What is big in size? |
| tierA-000328-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What is sizable in size? |
| tierA-000339-q1 | literal | bridge | query-brittleness | — | — | What is huge in size? |
| tierA-000339-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | What is enormous in size? |
| tierA-000351-q1 | literal | bridge | answered-both | ✓ | ✓ | What is difficult? |
| tierA-000351-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | What is the fix like? |
| tierA-000352-q1 | literal | bridge | answered-both | ✓ | ✓ | What is hard? |
| tierA-000352-q2 | paraphrastic | bridge | uncovered-rule-present-unfired | — | — | What is the fix like? |
| tierA-000376-q1 | literal | bridge | answered-both | ✓ | ✓ | Who signs the chart? |
| tierA-000376-q2 | paraphrastic | bridge | uncovered-paraphrase-inventory-miss | — | — | Who endorses the chart? |
| tierA-000390-q1 | literal | bridge | answered-both | ✓ | ✓ | What blocks the lane? |
| tierA-000390-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | What obstructs the lane? |
| tierA-000391-q1 | literal | bridge | answered-both | ✓ | ✓ | What blocks the lane? |
| tierA-000391-q2 | paraphrastic | bridge | engine-bug-suppressed | — | — | What obstructs the lane? |
