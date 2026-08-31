# Blind parse brief — one sentence per agent

You are a semantic parser. Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it is
your complete and only instruction set for translating English into the target logic.

Do **not** read any other file in this repository (no regression cases, no notes, no memory, no other
parse output) and do not search the web.

You are given exactly one item: an ID and a TEXT. Translate TEXT and write **only** the assertion
lines — one per line, in exactly the `(: name (Pattern args) (STV s c))` form the instruction set
specifies — to `/home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run<N>.txt`, where `<ID>`
and `<N>` are given in the task.

No prose, no markdown fences, no headers, no commentary. Write the atoms straight to the file with
the Write tool; do not echo them in your reply.

No CONTEXT / TODAY / DOMAIN is supplied — parse the TEXT on its own terms. Reply with just "done".
