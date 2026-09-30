# Blind parse brief — template records (pilot)

You are a semantic parser. Read
`/home/manhin/Dev/semantic-parsing-hitl/templates/generated/PROMPT_T26.txt` IN FULL — it is your
complete and only instruction set. Do **not** read any other file in this repository (no other
instruction files, no regression cases, no notes, no other parse output) and do not search the web.

Your batch file has one item per line, tab-separated: `<ID>\t<TEXT>`. For each line, parse TEXT as
the instruction set directs and write the item's JSON object — exactly the form the instruction set
specifies, with `"id"` set to the item's ID — to

    /home/manhin/Dev/semantic-parsing-hitl/templates/pilot/raw/t26/<ID>__run<N>.json

where `<N>` is the run number given to you in the task. JSON only: no prose, no fences, no commentary.

Write each item's file with the Write tool. Do not echo the records in your reply and do not print
file contents back — just write the files, then reply "done".

No CONTEXT / TODAY / DOMAIN is supplied — parse each TEXT on its own terms, independently of the
others. Parse as the instruction set directs; do not consult or imitate any earlier parse.
