# Consumer rewrite-advice brief (fiction world rules)

You are advising a downstream consumer who wrote the English sentences below and will
REWRITE them where needed so that our translator parses them cleanly. Your job, per
sentence: judge the CURRENT parse and, only where it falls short, suggest a rewrite that
parses easily **without losing any content of the original sentence**.

Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL first — it is the
translator's complete instruction set and the ground truth for what parses well. Do not
read any other repository file except the work files assigned to you below. Do not search
the web.

## Input

Each assigned work file `fusenf/consumer/semantic-chemistry/advice3_work/R<nn>.json` is one source item:
`{"id", "rule", "texts", "fields": [...]}` — `fields` has one entry per TEXT sentence
(the `rule` string is context only: the consumer does NOT parse rules) with:

- `sentence` — the consumer's original English.
- `parse` — the CURRENT parse (statements produced under the current prompt.txt).
  THIS is what you judge.
- `census` — deterministic fireability check of any `Implication` in the parse:
  `ok`, or `unfireable-rule: sk-function-in-premise` / `…unasserted-sk-constant-in-premise`
  (both mean the rule's antecedent contains Skolem terms that no query/fact can ever bind,
  so the rule can never fire in the reasoner — a parse-level defect worth a rewrite).
- `review` — a blind reviewer's verdict on THIS parse (q1 faithfulness, issues, gaps).
- `adjudication` — present when the review flagged the parse: an independent adjudicator
  judged each reviewer issue (confirm/refute/partial) and ruled the parse `accept` or
  `defect`, with `defect_summary` naming the compliant form. **The adjudication OVERRIDES
  the review where they disagree: a REFUTED issue is not a defect — never advise a rewrite
  on the strength of a refuted claim.** No adjudication present = the review found the
  parse faithful.

## Judgment

A parse is GOOD when it is faithful (says what the sentence says, nothing more), covers
the sentence's content, and — for conditional/generic sentences — its rule is fireable
(`census: ok`; adjudicated `accept` counts as good even when the review flagged it). It is BAD when content is lost or distorted, when a conditional's rule is unfireable,
or when the sentence's phrasing forces the translator into a shape the instruction set
handles poorly (e.g. multi-event conditions packed into participles).

## Output

For each assigned item write ONE file
`/home/manhin/Dev/semantic-parsing-hitl/fusenf/consumer/semantic-chemistry/advice3/R<nn>__advice.json`:

    {"id": "R<nn>", "texts": ["<comment for texts[0]>", …]}

(No `rule` comment: the rule string is context only and is not carried into the result —
owner 2026-09-02.)

Each comment is ONE plain string, 1–4 sentences:

- Good parse → start with `good.` — optionally one short clause on why (e.g. "good. parses
  as a fireable rule with all participants covered."). No rewrite suggestion.
- Defective → start with `bad:` (or `mixed:` when partly usable), name the problem in
  consumer terms (what content is lost/distorted or why the rule can't fire), then give a
  CONCRETE rewrite of the sentence — quote the suggested replacement sentence in full —
  that preserves the original meaning. Prefer minimal edits: one finite clause per
  condition event, explicit subjects, plain connectives ("When X does A, Y does B").

The `texts` array must have exactly as many strings as the item has texts, in order.
Valid JSON, no prose outside the JSON file, no markdown fences. Write each file with the
Write tool; do not echo file contents in your reply — reply only with the list of files
written.
