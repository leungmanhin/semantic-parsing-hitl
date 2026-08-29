# FUSE-NF — progress mini-report (2026-08-27)

*A short orientation for readers new to this work. Detail lives in `BATCH1_REPORT.md`,
`PIPELINE.md`, and the per-experiment reports under `eval/`.*

## What this project is

FUSE-NF is the normalization layer of a natural-language → symbolic-logic pipeline. An
LLM parser (Claude Sonnet, driven by a frozen instruction file, `prompt.txt`) translates
English sentences into typed logic atoms over a neo-Davidsonian event representation,
and a reasoning engine (PeTTaChainer) answers queries over the result. The parser is
deliberately surface-faithful: it never decides that "buy" and "purchase" are the same
thing. FUSE-NF's job is to *discover* such equivalences empirically — by parsing
corpora at scale, mining the parses for recurring structure, and validating candidate
rules before they are allowed to influence question answering. Validated rules come in
two species: **consolidation** rules (lossless rewrites, safe to merge) and **bridging**
rules (directional implications that connect near-synonymous or structurally variant
forms at an explicit truth-value, without destroying the original).

## The pipeline in one paragraph

Corpora are built with a fixed role (mining substrate vs held-out measurement). Every
sentence is parsed by a *blind* Sonnet agent against a hash-pinned instruction file, then
mechanically validated (eight check classes, C1–C8). Parses are reviewed blind by a
second model family (Claude Opus) — reviewers never see the validator's findings — and
flagged records go to a third, independent adjudicator that is instructed to refute
reviews, not obey them. Adjudicator repairs are artifacts only: they enter the record
store solely after a *second* blind review verifies them, under a separate run number
that marks their non-blind provenance. A disposition gate then decides exactly which
parses mining may see. Mining runs a portfolio of five methods (appendix), candidate
rules pass a judge gauntlet with mechanical safety gates, and validated rules are
compiled into an executable rule file loaded beside the knowledge base. Measurement
suites (parser stability, merge safety, coverage, meaning preservation, and a
question-answering arm) close the loop.

## Corpora

**Tier A — constructed control set (402 sentences).** Hand-designed seed meanings, each
realized in systematic variant families (voice, dative, cleft, negation, quantifier,
politeness…), with a self-checking "normalize" arm: a base sentence and its pure
syntactic alternation must canonicalize to identical graphs. It provides the mining
answer key: we know in advance which variants are equivalent, so any miner can be scored
for recall and false merges (metric M4) before its candidates touch anything real.

**Tier B — natural corpus (2,000 sentences).** Everyday sentences drawn from Tatoeba
(CC-BY). This is the mining substrate proper — the place rules are supposed to come
from, and the main test of whether the instruction set survives unconstrained text.

**Tier C — adversarial paraphrase pairs (1,000 records = 500 pairs).** Drawn from PAWS,
where pairs share nearly all their words and differ mainly in word order — so a wrong
merge is easy to make and easy to detect. 360 records feed the paraphrase-alignment
miner; 640 are held out untouched for the merge-safety measurement (M2). Non-paraphrase
pairs act as negative controls: a rule that makes any control pair collapse is rejected
outright.

**Tier D — lexically varied paraphrase pairs (250 records = 125 pairs).** Newswire pairs
from MRPC (75 paraphrase + 50 non-paraphrase controls), added because PAWS pairs are
~87% word-order-only: MRPC pairs vary their vocabulary (125/125 selected pairs do),
giving the bridge inventory a second, harder held-out arm. Measurement-only — never
mined. As a side effect, newswire stress-tests the parser far harder than Tatoeba
(13.7 statements per sentence vs ~6).

**Why paraphrase pairs, and how the pairing is consumed.** A labeled paraphrase pair is
supervision-free ground truth for exactly the thing FUSE-NF must learn: same meaning,
different surface form. Parsing both sides and aligning the two graphs cancels
everything the sentences share and leaves only the differing subgraphs, so a candidate
equivalence is read directly off that residue rather than inferred from distributional
statistics — and the labeled *non*-paraphrase pairs provide matched negative controls
for free. Only one of the five mining methods actually consumes the pairing: paraphrase
alignment (§4.3.4) aligns each pair in isolation, but it never mints a rule from a
single pair — recurring diffs are anti-unified *across* pairs, every candidate carries a
cross-pair support count, and a candidate that also fires on a non-paraphrase control
pair is rejected outright. The other four methods ignore pair structure entirely,
treating each sentence as an independent record — their benefit from the pair corpora
arrives only downstream, at validation, where the labeled pairs and their
non-paraphrase controls score merge safety for every validated rule, whichever method
proposed it. The held-out pair sets (Tier C's 640 records and all of Tier D) are
consumed by no miner at all: they exist so that safety is measured on pairs the rules
have never seen.

Small validation-only corpora (pilot sets, fix-pack probes) exist besides these and are
excluded from mining by construction.

## Scale and quality control so far

The parse stores hold 6,227 parse records across all corpora, stability re-runs, and
repair waves. The mining substrate currently stands at 2,302 of 2,360 eligible records —
every exclusion is an explicit, machine-readable disposition (defect under review,
awaiting re-parse, or a construction whose representation is not yet designed).
Review calibration is measured, not assumed: adjudicators refute about a third of
reviewer objections, matching the project owner's own calibration sample, and repairs
show a 46% verified-clean yield under second blind review. Nothing self-certifies: the
parser, reviewer, adjudicator, and question-writing roles are separate blind agents, and
every promotion or exclusion is an owner-gated decision with provenance recorded.

## The parser instruction set: what broke and what was fixed

`prompt.txt` (currently 2,627 lines, backed by 378 golden examples and a 354-case
end-to-end harness) has been through four revision rounds since FUSE-NF began, with a
fifth queued. Several hundred individual gap reports from validators, reviewers, and
adjudicators were harvested, de-duplicated, and ranked (one harvest alone yielded 681
distinct claims); fixes are batched into "fix-packs," each validated by fresh blind
parses against pre-registered expectations before the new instruction hash is adopted.
Five representative gap families that were found and closed:

1. **Argument structure of nouns and adjectives** — nominalizations ("the *destruction
   of the city*") and adjective complements ("*wary of traps*") needed dedicated
   routing rather than ad-hoc verb-style roles.
2. **Restriction scoping on generic claims** — "birds *in Australia* are noisy" must
   keep its restriction; dropping it silently widens a claim, the most safety-critical
   defect class we track.
3. **Attitude and evidential framing** — non-factive reports ("is considered to be…")
   are sealed so their content is not asserted as fact, while perception reports
   ("saw him leave") assert veridically; getting this split wrong either fabricates
   facts or loses them.
4. **Copular, positional, and focus constructions** — bare position statements ("the
   crate sat in the bay") no longer mint spurious events; focus particles ("only")
   anchor correctly on copular statements.
5. **Quantification and frequency** — frequency adverbs map to rule strengths
   (always 1.0, usually 0.8, rarely 0.1) with an explicit quantifier-phrase companion,
   instead of being dropped or over-asserted.

The queued fifth pack comes from the newswire corpus: organization-name premodifiers
("SEC charges"), attribution clusters ("according to…", "reported"), negated content
inside reported speech, and unit-less financial figures.

## Engine findings (PeTTaChainer)

Running real QA over mined-rule-augmented knowledge bases surfaced engine issues that
sentence-level demos never hit. Three categories:

1. **Conjunction / premise-sharing rigidity** — two open bugs (minimal reproductions at
   the repository root) where a proof cannot re-use a rule premise or share one premise
   across two conjuncts; they block conjunction QA over consolidated ("packed") views
   and currently suppress 13 otherwise-correct bridge answers in the question arm.
   Three earlier bugs in the same family were reported and fixed upstream in July.
2. **Truth-value query features** — two feature requests: range queries over
   strength/confidence (so negation can be queried as a low-strength band under
   revision) and marginalization across alternative readings of an ambiguous sentence.
   Both are prerequisites for representation decisions already made on the parsing side.
3. **Robustness/arity issues** — `Implication` silently breaking beyond two arguments,
   partial unit-conversion in distributive readings, and (in the related hyperon-miner
   cross-check) two arity mismatches and a silently-empty multi-head query, packaged
   for upstream.

## Mined rules to date

Across three gauntlet rounds, 174 candidate rules entered validation and **69 were
validated: 44 bridging + 25 consolidation**; 105 were rejected by judge panels or
mechanical safety gates, and 3 initially-validated role bridges were later retired when
a provenance audit re-reviewed their cited evidence — the audit trail exists precisely
to allow that. The rules are collected by species in two files, each in both a
record form and a MeTTa rendering: `rules/bridging_rules.{jsonl,metta}` (44 rules —
41 live plus the 3 retired, marked) and `rules/consolidation_rules.{jsonl,metta}`
(25 rules; its MeTTa form is a syntax rendering — production applies this species
through the rewriter's packed views). For question answering the rules compile to
**126 executable implications** loadable beside the hand-seeded scaffolding
`seeded_rules.metta`: 96 from the bridging species and 30 that re-express the
lossless lexical consolidations as mutual implication pairs, since in the faithful
serving layout that is the form in which an equivalence can act.
The full per-candidate record — every vote, gate, and routing — is
`eval/rule_ledger.md`. Typical validated content: lexical bridges (buy↔acquire,
commence↔begin), structural alternation bridges, and role-vocabulary consolidations.

## Measurement headlines

Parser stability (M1): 0.93 exact-match on the control corpus; ~0.45 on adversarial
word-order paraphrases — the known open front, not a regression. Merge safety (M2):
zero unsafe merges induced by the validated rule set on held-out PAWS controls.
Answer-key recall (M4): the batch-1 miner scored 0.94; the upgraded pattern miner
passes 31/31 with zero control merges. Meaning preservation through
serving views (M5): 38/38 at atom level, with conjunction-level checks engine-blocked
(category 1 above). The new question-answering arm gives the first end-to-end payoff
number: independently written questions where the knowledge base alone fails but mined
bridges answer correctly — 5 question types (a floor: 13 more are engine-suppressed),
with **zero** bridge-induced fabrications.

## Near term (~1–2 weeks)

1. Full blind review + adjudication of the 250 newswire parses (in progress next).
2. Fix-pack 4 from the harvested newswire families, re-pinning the instruction hash.
3. **The main Tier-B mining run** — the batch-2 substrate's one full mining pass,
   feeding the gauntlet with a newly registered *graded* admission route: judges assign
   near-synonym bridges a strength ceiling (0.6/0.7/0.8) instead of a binary verdict,
   under a per-rule zero-control-merge safety gate.
4. The measurement suite re-run on both held-out arms (PAWS + MRPC), including the
   question arm, closing into a batch-2 report.

---

## Appendix — what each §4.3 mining method produced

The five methods from the design document's §4.3, with their gauntlet yield to date
(a candidate's method is recorded in its provenance; per-method detail in `eval/`):

| §4.3 method | role in the portfolio | gauntlet entrants | validated | headline |
|---|---|---|---|---|
| 4.3.1 frequent stars/patterns | candidate vocabulary + feature space for the others | 0 (by design) | — | 5,799 patterns at k=4 over 762 records; supplies the feature matrix for 4.3.3/4.3.5 and the M4 gate language |
| 4.3.2 role-filler clustering | slot-merge proposals + role-doctrine audit | 16 | 16 (3 later retired by provenance audit) | confirmed Theme/Patient distributions genuinely separate; filler-flip outliers turned out to be parse *defect detectors* |
| 4.3.3 MI grouping | co-occurrence interchangeability | 14 | 10 | reliable mid-volume source of lexical bridge candidates |
| 4.3.4 paraphrase alignment + anti-unification | the main consolidation/bridge source | 49 | 41 | highest precision (84%); upgraded with factor-granularity alignment; one new promotable role-equivalence found on the control corpus |
| 4.3.5 autoencoder | interchangeability from tied encoder weights | 95 | 2 | high-volume/low-precision as expected; retained as a *prior* (now seeded with Qwen3-Embedding-8B similarities) rather than a primary source |

Two composition lessons worth stating: frequency alone never established equivalence
(the design's warning held empirically — 4.3.1 feeds the others rather than proposing
rules), and the portfolio's value is decorrelation: alignment finds structural
equivalences MI can't see, while MI/AE reach lexical pairs alignment's paired corpora
never exhibit. Cross-method consensus plus the negative-control gate is what kept the
false-merge count at zero on held-out data.
