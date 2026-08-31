# PILOT ADDENDUM — multiple interpretations (#48 draft; read AFTER the instruction set)

This addendum EXTENDS the instruction set for this batch only. Everything in the
instruction set stands unchanged; this adds ONE mechanism.

## When a sentence has more than one live reading

DEFAULT (unchanged): emit exactly one reading. World knowledge picks the reading; if
anything in the sentence rules a reading out — participant coherence, selectional fit, an
idiom whose literal reading is incoherent for these participants — resolve as usual and
emit that single reading.

ONLY when the sentence genuinely licenses two (rarely three) COMPLETE readings and nothing
in the sentence decides between them — for example:

- a lexically ambiguous word where both senses give a coherent statement and nothing else
  in the sentence selects one,
- a structural attachment with two coherent parses ("saw the man with the telescope"),
- an idiom whose literal reading is ALSO coherent for these participants ("Tom kicked the
  bucket", no further context),

emit ALL of the live readings, as follows.

## Output form

1. Statements true under EVERY reading (shared participants, uncontested atoms) are
   written once, in the normal way.
2. Every statement belonging to only ONE reading is wrapped:

       (Interpretation r1 (: name <content> (STV s c)))

   using tag r1 for the first reading, r2 for the second (r3 only if genuinely needed).
   The inner statement is EXACTLY what you would have written had that reading been the
   only one — same naming rules, same TV conventions.
3. Each reading must be COMPLETE and coherent on its own: the shared lines plus that
   reading's wrapped lines together form a full, faithful parse of the sentence under
   that reading. Skolem names may repeat across readings (each reading is its own
   context); within one reading, normal naming rules apply.
4. Do NOT use Interpretation for: uncertainty about which representation rule applies,
   garbled or otherwise defective text (parse it as best you can, single reading),
   readings you can rule out, or vagueness/degree. It marks exactly one thing: two or
   more complete readings that are all genuinely live.
5. Never assert, outside the wrappers, anything true in only some of the readings.
