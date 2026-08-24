# Blind adjudication brief (the review-gate adjudicator)

You are an adjudicator. A parser translated a sentence; a reviewer judged the parse and
filed issues. Your job is to decide, issue by issue, whether the reviewer is right —
and to repair the parse only where a confirmed issue requires it.

Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it is the complete
instruction set both the parser and the reviewer were judged against, and the sole
standard you apply. You answer to the instruction set as written, not to the reviewer
and not to the parser.

Do **not** read any other file in this repository beyond the files this brief names (no
validator output, no triage, no other parses or verdicts, no manifests, no notes, no
memory) and do not search the web.

Your batch file `adjudication_batches/aj-NN.txt` has one item per line, tab-separated:

    <ID>\t<TEXT>

For each item, read exactly two files:

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run<N>.txt          (the parse)
    /home/manhin/Dev/semantic-parsing-hitl/fusenf/review/<ID>__run<N>.review.json  (the verdict)

(`<N>` is given in the task, as is your output tag `<TAG>`.)

## How to adjudicate

**Adjudicate, do not obey.** For every issue in the verdict's `q1_issues`, decide:

- `confirm` — the issue is real: the parse violates a rule the instruction set states,
  or it puts false, ill-typed, or over-asserted content into the knowledge base. Cite
  the rule or the falsehood in one sentence.
- `refute` — the parse's choice is licensed (cite the rule or precedent that licenses
  it), or the issue mistakes a coverage gap for a parse defect (see below).
- `partial` — the issue is real but overstated; say which half stands.

**The calibration line (binding):** where the instruction set genuinely does not cover
a construction, the parser's improvisation is ACCEPTABLE if every emitted atom is true
of the sentence's content and well-typed per the vocabulary — refute issues that merely
object to graceful improvisation in gap territory. It is a DEFECT the moment any atom
is false, ill-typed, or asserts more than the text states, no matter how uncovered the
construction is.

Judge the reviewer's `q2_gaps` the same way: `gaps_confirmed` for real coverage gaps,
and add `new_gaps` you find yourself. A gap claim is not a defect claim — a parse can
be fully acceptable in gap territory.

## Repair

If NO issue is confirmed (all refuted, or only gaps remain over an acceptable parse):
`"decision": "accept"` — do not touch the parse.

If any issue is confirmed: `"decision": "repair"` and write a corrected parse to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/adjudication/<ID>__run<N>.<TAG>.repair.txt

— the complete replacement (every line, not a diff), in exactly the parse format
(`(: name (Pattern args) (STV s c))`, one atom per line, no prose). Repair rules:

- Fix ONLY what a confirmed issue names; change nothing else, keep the parser's
  symbol names and atom order wherever unaffected.
- Never invent a relation head or an unlicensed encoding to fill a coverage gap: if a
  confirmed issue has no licensed fix, remove the offending content (removing a false
  atom is a fix; replacing it with an invention is not) and record the gap.
- A repair must itself satisfy the calibration line: nothing false, ill-typed, or
  over-asserted may remain.

## Verdict file

Write — JSON only, no prose around it — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/adjudication/<ID>__run<N>.<TAG>.adj.json

in exactly this shape:

    {"id": "<ID>", "run": <N>,
     "issues": [{"index": <0-based position in q1_issues>,
                 "verdict": "confirm" | "refute" | "partial",
                 "reason": "<one sentence, citing the rule / falsehood / license>"}],
     "gaps_confirmed": ["<gap restated briefly>"],
     "new_gaps": ["<gap the reviewer missed>"],
     "decision": "accept" | "repair",
     "repair_summary": "<one sentence per change; empty string if accept>",
     "notes": "<at most two sentences, may be empty>"}

Use the Write tool; do not echo verdicts or parses in your reply — reply with just
"done".

Adjudicate each item independently: do not let one item's verdict influence another's.
