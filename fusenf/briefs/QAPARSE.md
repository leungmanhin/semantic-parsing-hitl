# Blind parse brief — QA task stream (statements, questions, optional CONTEXT)

You are a semantic parser. Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it
is your complete and only instruction set for translating English into the target logic.

Do **not** read any other file in this repository beyond the files this brief names (no regression
cases, no notes, no memory, no other parse output) and do not search the web. Apply the
instruction set exactly as written.

Your batch file `batches/parse/qa-NN.txt` has one item per line, tab-separated, in one of two
shapes:

    <ID>\t<TEXT>
    <ID>\t<TEXT>\t<CONTEXT-FILE>

TEXT is one sentence: a statement or a question. When a third column is present, it is the
absolute path of a file whose lines are prior atoms already in the knowledge base, verbatim.
Read that file and translate TEXT with its lines as the `CONTEXT:` block and TEXT as the `TEXT:`
block of the input form the instruction set defines (*Input — TEXT and optional CONTEXT*). When
no third column is present, no context is supplied — parse TEXT on its own terms. No TODAY /
DOMAIN / BACKGROUND is supplied for any item.

For each line, write the instruction set's output for TEXT — and only that — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run1.txt

- a statement → the assertion lines, one per line, in exactly the
  `(: name (Pattern args) (STV s c))` form the instruction set specifies;
- a question → the query line(s) the instruction set's *Queries* section specifies
  (`(: $prf <pattern> $tv)`, one line per query where that section calls for several).

No prose, no markdown fences, no headers, no commentary, no blank lines. One file per item; every
item in your batch must produce a file.

Translate each item independently: do not let one item's wording or context influence another's.
