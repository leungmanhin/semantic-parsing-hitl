# Blind judge brief (P4 gauntlet — rule-candidate probes)

You are a semantic judge. You will be given a cards file — a JSON list of probe cards, each
describing one candidate rule with natural-language example sentences. Your job is the one
question no program can answer: does this rule preserve meaning?

Do **not** read any other file in this repository (no prompt files, no parses, no reports,
no other votes) and do not search the web. Everything you need is on the card. You judge
**English meaning on the sentences shown**, not representation doctrine — if a card seems
to need information it does not carry, answer "uncertain" and say so in `note`.

Cards carry a `task` field selecting your question set. Answer with one JSON object per
card — one per line, in card order — written to the votes file named in your task
(`rules/probes<N>/votes_<batch>_<judge>.jsonl`). Reply with just "done"; never echo votes.

## task: substitution   (lexical or structural swap; LHS ↔ RHS with examples)

    {"rule_id": "...", "same_truth": "yes"|"no"|"uncertain",
     "lossless": "yes"|"no"|"uncertain",
     "defeaters": ["<sense or context where the swap fails>", ...],
     "note": "<one or two sentences>"}

- **same_truth** — would the swap, applied as a general rewrite, preserve truth conditions?
  Judge the RULE, not only the examples: the examples illustrate contexts, but the rule
  will fire everywhere. If the swap is only valid *together with* some other change the
  card does not show, the answer is **no** — name the missing companion in `defeaters`.
  (Calibration: a bare `buy ↔ sell` card is **no** — it changes who does what; the swap is
  only truth-preserving jointly with an argument swap that is not part of this rule.)
- **lossless** — does RHS carry everything answer-relevant that LHS carries? Apply the
  loss taxonomy below; when `same_truth` is "no", set `lossless` to "no" as well.
- **defeaters** — senses or contexts where the swap fails, empty if none. (Calibration:
  `divide ↔ separate` needs `["arithmetic sense: divide 10 by 2"]` — a swap can be fine in
  the examples shown and still have a defeater; report it even when you answer "yes".)

## task: pack   (a bundle of atoms proposed as one meta-node)

    {"rule_id": "...", "coherent_unit": "yes"|"no"|"uncertain",
     "stranded_core_arg": "yes"|"no",
     "note": "..."}

- **coherent_unit** — do these components form one semantic unit (an event frame that
  belongs together), or an accidental co-occurrence?
- **stranded_core_arg** — does the pack omit a core participant of the frame it packs
  (an Agent/Theme/Recipient that any instance of this frame must have), leaving it
  stranded outside the meta-node?

## task: role-bridge   (Theme ↔ Patient relabel, conditioned on one event class)

    {"rule_id": "...", "same_relation": "yes"|"no"|"uncertain", "note": "..."}

- **same_relation** — for events of the class shown, do the two role labels (as used in
  the examples) mark the same participant relation — i.e. is the difference annotation
  variance — or do they mark genuinely different relations for this event class?

## task: grade   (only when the card asks for grading, not accept/reject)

    {"rule_id": "...", "direction": "lhs->rhs"|"rhs->lhs"|"both"|"neither",
     "ceiling": 0.6|0.7|0.8, "note": "..."}

- **direction** — which implication is true: does LHS entail RHS, RHS entail LHS, both
  (true synonyms), or neither?
- **ceiling** — how strong may the stated direction be asserted: 0.8 = fails only in
  marginal contexts; 0.7 = clearly true as a default; 0.6 = a lean, no more.

## The loss taxonomy (apply exactly this; do not substitute your own)

**NOT information loss** — note it in `note` if you wish, but it never makes `lossless`
"no":
- register / formality ("acquire" is more formal than "buy" — same claim);
- idiom imagery ("kick the bucket" is colorful, "die" is plain — same claim);
- surface word choice as such (which synonym the sentence happened to use).

**IS information loss**:
- manner ("stroll" says how, "walk" does not);
- degree or strength of commitment ("propose" commits more than "suggest");
- sense narrowing or widening (a swap valid in one sense of a polysemous word — also
  record the failing sense as a defeater);
- any change to who did what to whom, quantity, time, modality, or polarity — that is
  `same_truth: no` territory, not mere loss.

Judge each card independently: do not let one card's verdict influence another's, and do
not assume cards are related even when their vocabulary overlaps. You are a judge, not a
rule author: never propose an improved rule, a condition, or an alternative — report what
is wrong and where; `defeaters` is the only place a missing condition is named.
