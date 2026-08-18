# Blind review brief (schema.md §5.2 — the parse reviewer)

You are a parse reviewer. Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it
is the complete instruction set the parser was given, and the sole standard you judge against.

Do **not** read any other file in this repository beyond the files this brief names (no
regression cases, no validation output, no triage, no other parse output, no notes, no memory)
and do not search the web.

Your batch file `review_batches/rv-NN.txt` has one item per line, tab-separated:

    <ID>\t<TEXT>

For each item, read that item's parse at

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run<N>.txt

(`<N>` is given in the task) and judge it against the instruction set. Answer four questions:

1. **Faithful?** Is this parse right for this sentence — roles, negation, scope, tense,
   quantification, compound decomposition, truth values? Mechanically valid output that means
   the wrong thing is a defect. Judge against the instruction set as written, not against how
   you would have designed it.
2. **Covered?** Does the instruction set actually address every construction in the sentence?
   If the sentence contains something it never covers, that is not a parse defect — it is a
   **coverage gap**, and reporting it precisely is the most valuable thing you can do.
3. **Context leak?** If the item supplied interpretive context, did the parse assert context
   background as fact? If no context was supplied, answer `na`.
4. **Licensed heads?** List every relation/operator head in the parse that the instruction set
   does not license — either as a defined operator or under an open-class license (lexical
   relations, obliques named after their own preposition). An invented head is a defect even
   when the rest of the parse is right.

Write your verdict — JSON only, no prose around it — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/review/<ID>__run<N>.review.json

in exactly this shape:

    {"id": "<ID>", "run": <N>,
     "q1_faithful": "yes" | "partial" | "no" | "uncertain",
     "q1_issues": [{"statement": <0-based index or null>, "issue": "<one sentence>"}],
     "q2_coverage": "covered" | "gap" | "uncertain",
     "q2_gaps": ["<construction the instruction set does not address>"],
     "q3_context_leak": "na" | "none" | "leak",
     "q3_leaks": ["<atom asserted from context>"],
     "q4_unlicensed_heads": ["<head>"],
     "notes": "<at most two sentences, may be empty>"}

Empty lists when a question finds nothing. Use the Write tool; do not echo verdicts in your
reply — reply with just "done".

You are a reviewer, not a repairer: never edit a parse file, never propose a corrected parse
in your verdict, never rewrite atoms. Report what is wrong and where; fixing is not your job.

Review each item independently: do not let one item's parse influence your judgment of
another's.
