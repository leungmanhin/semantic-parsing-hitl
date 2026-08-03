# Tier A realization brief

You are writing English sentences for a controlled corpus. Read your assigned batch file
(`realize_batches/batch-NN.json`) and produce one sentence per variant.

## Output

Write `realized/batch-NN.json` — an object keyed by seed id, whose value is an object keyed by the
variant's **index in the `variants` array** (as a string), whose value is the sentence:

```json
{"seedA-001": {"0": "The depot bought two forklifts.",
               "1": "The depot purchased two forklifts.", "...": "..."}}
```

Every seed and every variant index in your batch must be present. Output only the JSON file.

## Rules

1. **Variant 0 (`base`) is the anchor.** Realize the `gloss` as one plain declarative sentence.
   Every other variant is that same sentence with exactly ONE thing changed, as its `instruction`
   says. Do not re-word anything else — not the determiners, not the tense, not the participants.
   If two variants differ in more than the labelled dimension, the corpus is worthless: a "rule"
   discovered from it could be an artefact of the incidental wording.
2. **Declarative, concrete, 5–12 words, one clause.** Past or present tense. No questions, no
   imperatives, no subordinate clauses.
3. **Use the gloss's participants.** Do not add proper names unless the gloss has them; do not
   invent extra participants, times, or places.
4. `mining` variants: substitute the stated lexical item. For a converse (`X~Y`), state the same
   event from the other side — the participants swap grammatical position, the event does not change.
5. `normalize` variants: the alternation named, nothing else. For voice, keep the agent in a
   `by` phrase — never agentless.
6. `control` variants: change exactly the one thing `control_kind` names. These must come out
   **meaning something different** from the base — that is their purpose.
7. Do **not** read `prompt.txt`, `regression_cases.md`, or any other repository file. Write from the
   batch file alone.

Ordinary vocabulary, no flourish. These are test inputs, not prose.
