# Consumer rewrite-advice brief — QA task stream (fiction world)

You are advising a downstream consumer who wrote the English sentences below and will
REWRITE them where needed so that our translator parses them cleanly. Your job, per
sentence: judge the CURRENT parse and, only where it falls short, suggest a rewrite that
parses easily **without losing any content of the original sentence**.

Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL first — it is the
translator's complete instruction set and the ground truth for what parses well. Do not
read any other repository file except the work files assigned to you below. Do not search
the web.

## Input

Each assigned work file `fusenf/consumer/semantic-chemistry/<cycle>_advice_work/<item-id>.json`
(the directory is the one named in your task; `<cycle>` is its stem, e.g. `qa_pending`) is one
source item — one task of the consumer's question stream: `{"id", "rule", "texts", "fields": [...]}`
— `fields` has one entry per TEXT sentence (the `rule` string names the task category and is
context only) with:

- `sentence` — the consumer's original English: a statement or a question.
- `mode` — how the sentence was to be translated: `query` (a question → the query line(s) of
  the instruction set's *Queries* / *Explanation questions* sections), `statement` (a premise
  or an added fact → assertion lines) or `intervention` (a fact the consumer's task will
  REMOVE from the knowledge base — translated as an ordinary statement; the removal is the
  consumer's business, so judge it as a statement).
- `context` — present when the sentence was translated with prior atoms in the `CONTEXT:`
  block of the instruction set's input form (a later premise, or a question, of a what-next
  task: the earlier sentences' parses, listed in `context_of`). The parse was to reuse those
  symbols for the referents the context identifies and to emit atoms for the sentence only.
- `parse` — the CURRENT parse (statements or query lines produced under the current
  prompt.txt). THIS is what you judge.
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

A parse is GOOD when it is faithful (says — or, for a query, asks — what the sentence says,
nothing more), covers the sentence's content, reuses its context's symbols where the sentence
refers back to them, and — for conditional/generic sentences — its rule is fireable
(`census: ok`; adjudicated `accept` counts as good even when the review flagged it). It is BAD
when content is lost or distorted, when a query asks something other than the question or
puts the unknown in the wrong slot, when a conditional's rule is unfireable, or when the
sentence's phrasing forces the translator into a shape the instruction set handles poorly
(e.g. multi-event conditions packed into participles).

## Output

For each assigned item write ONE file
`/home/manhin/Dev/semantic-parsing-hitl/fusenf/consumer/semantic-chemistry/<cycle>_advice/<item-id>__advice.json`
(the sibling of your work-file directory: work files under `<cycle>_advice_work/` → results
under `<cycle>_advice/`) (`<item-id>` exactly as in the work file, e.g. `N4`):

    {"id": "<item-id>", "texts": ["<comment for texts[0]>", …]}

(No `rule` comment: the rule string is context only and is not carried into the result.)

Each comment is ONE plain string, 1–4 sentences:

- Good parse → start with `good.` — optionally one short clause on why (e.g. "good. the
  query binds the asked-for keeper as the tending event's agent."). No rewrite suggestion.
- Defective → start with `bad:` (or `mixed:` when partly usable), name the problem in
  consumer terms (what content is lost/distorted, what the query fails to ask, or why the
  rule can't fire), then give a CONCRETE rewrite of the sentence — quote the suggested
  replacement sentence (or question) in full — that preserves the original meaning. Prefer
  minimal edits: one finite clause per condition event, explicit subjects, plain
  connectives ("When X does A, Y does B"), a question that names its focus event plainly.

The `texts` array must have exactly as many strings as the item has texts, in order.
Valid JSON, no prose outside the JSON file, no markdown fences. Write each file with the
Write tool; do not echo file contents in your reply — reply only with the list of files
written.
