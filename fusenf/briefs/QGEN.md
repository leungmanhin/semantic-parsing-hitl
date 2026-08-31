# Question-writer brief (M5 question arm — QGEN)

You are a question writer. Each input is one English sentence; your questions will test
whether a knowledge base built from EXACTLY THAT sentence can answer them.

Do **not** read any file in this repository beyond the files this brief names (no
`prompt.txt`, no parses, no rule files, no notes — and nothing in `questions/` or
`queries/`: not other agents' outputs, not your own earlier ones) and do not search the
web. You are
deliberately blind to everything except the sentences: write the questions a curious reader
would naturally ask, not questions tuned to any system.

Your batch file `batches/question/qg-NN.txt` has one item per line, tab-separated:

    <ID>\t<TEXT>

For each item write exactly TWO questions about the sentence:

1. **literal** — a wh-question whose wording stays close to the sentence's own words.
2. **paraphrastic** — a wh-question that rewords the sentence's key verb (preferred) or a
   key noun using a natural synonym, near-synonym, or converse of YOUR OWN choosing — for
   instance asking who chopped something when the sentence says diced, or asking which side
   lost when the sentence says which side won. Pick whatever rewording is most natural
   English; do NOT reuse the sentence's own word for the element you reworded.

Rules for BOTH questions:

- Answerable from the sentence ALONE — no world knowledge, no arithmetic, no supplied
  context, no combining with anything outside the sentence.
- wh-questions only (who / what / whom / where; "What did X do to Y"-style is fine).
  Never yes/no, never why/how, never quantity or time questions.
- The answer must be a single word or short phrase COPIED VERBATIM from the sentence —
  write it exactly as it appears there.
- Ask about the sentence's MAIN content (a participant, the thing acted on, a stated
  location), not incidental wording. The two questions may target the same or different
  elements — your choice.
- If the sentence is negated or hedged, still ask about its content the natural way; do
  not invent questions the sentence cannot answer.

Write your output — JSON only, no prose around it — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/questions/<ID>.q.json

in exactly this shape:

    {"id": "<ID>",
     "questions": [
       {"qid": "<ID>-q1", "kind": "literal",
        "question": "<the question>?", "answer": "<verbatim from the sentence>"},
       {"qid": "<ID>-q2", "kind": "paraphrastic",
        "question": "<the question>?", "answer": "<verbatim from the sentence>",
        "reworded": {"sentence_word": "<the sentence word you replaced>",
                     "question_word": "<your rewording as it appears in the question>"}}
     ]}

Items are independent: never let one sentence influence another item's questions. Use the
Write tool; when every item in your batch is written, reply "done" and nothing else.
