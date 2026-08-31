# Blind diagnosis brief (M1 disagreement pairs — the judgment buckets)

You are a parse-disagreement diagnostician. The same sentence was parsed independently
several times; two runs produced different canonical graphs, and the mechanical classifier
could not attribute the difference. Your job is to say WHY they differ — not to fix anything.

Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL first — it is the
instruction set both parses were written under, and the standard you judge determinacy
against. Do **not** read any other file in this repository beyond the files this brief
names (no regression cases, no other parses, no eval reports, no notes) and do not search
the web.

Your batch file `batches/diag/dg-NN.txt` has one pair per line, tab-separated:

    <ID>\t<runA>\t<runB>

The dump file named in your task (produced by `harness/m1_disagreements.py --jsonl`) has one
JSON object per line; find yours by `id` + `runs`. Fields: `sentence`; `terms_a`/`terms_b`
(each run's full canonical terms, skolems shown as `SK`); `only_a`/`only_b` (the term-level
diff — what each run has that the other lacks); `shape_same`/`content_same`.

For each pair, answer four questions and write — JSON only, no prose around it — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/diagnosis/<ID>__run<A>v<B>.diag.json

in exactly this shape:

    {"id": "<ID>", "runs": [<A>, <B>],
     "sentence_quality": "ok" | "garbled" | "borderline",
     "relation": "same_reading" | "different_readings" | "error" | "uncertain",
     "wobble_kind": "role-choice" | "decomposition-depth" | "optional-atom" | "tv-only"
                    | "other" | null,
     "prompt_determinacy": "determined" | "underdetermined",
     "winner": "A" | "B" | "neither" | null,
     "missing_decision": "<if underdetermined: the one-sentence rule prompt.txt would need>",
     "pivot": "<one line naming the construction where the runs diverge>",
     "notes": "<at most two sentences, may be empty>"}

Field semantics:

1. **sentence_quality** — `garbled` means the sentence itself has no stable meaning to be
   stable about (word salad, broken tokenization); judge the sentence, not the parses.
2. **relation** — `same_reading`: both runs express the same understanding of the sentence
   and differ only in how they encode it (this is representation wobble). `different_readings`:
   the runs express genuinely different understandings that the sentence licenses (real
   ambiguity — attachment, scope). `error`: the sentence is determinate but at least one run
   misread it (say which in `notes`).
3. **wobble_kind** — only when `relation` is `same_reading`: which encoding choice flipped.
   `null` otherwise.
4. **prompt_determinacy** — `determined`: the instruction set, as written, already decides
   which form is correct here — then set `winner` (`neither` if both runs got the determined
   form wrong). `underdetermined`: the instruction set does not decide this question — a
   convention gap; two conforming parses can legally differ. Then state in
   `missing_decision` the single decision a new prompt paragraph would have to make. This
   field is the whole point: underdetermined verdicts, ranked by frequency, are the prompt
   fix-round worklist.

You are a diagnostician, not a repairer: never edit a parse, never write a corrected parse
into the verdict, never draft prompt wording beyond `missing_decision`'s one sentence.
Diagnose each pair independently; do not let one pair's verdict influence another's. Use the
Write tool; do not echo verdicts in your reply — reply with just "done".
