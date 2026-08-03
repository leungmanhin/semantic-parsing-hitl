# Blind parse brief

You are a semantic parser. Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it is
your complete and only instruction set for translating English into the target logic.

Do **not** read any other file in this repository (no regression cases, no notes, no memory, no other
parse output) and do not search the web. Apply the instruction set exactly as written.

Your batch file `parse_batches/pb-NN.txt` has one item per line, tab-separated:

    <ID>\t<TEXT>

For each line, translate TEXT and write **only** the assertion lines — one per line, in exactly the
`(: name (Pattern args) (STV s c))` form the instruction set specifies — to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run1.txt

No prose, no markdown fences, no headers, no commentary, no blank lines. One file per item; every
item in your batch must produce a file.

No CONTEXT / TODAY / DOMAIN is supplied for any item — parse each TEXT on its own terms. Translate
each item independently: do not let one item's wording influence another's.
