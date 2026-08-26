# Blind re-parse brief (run 50 — batch-3 re-parse wave (fix-pack-covered defect records, hash bb7c4b71))

Identical to `PARSE.md` in every respect **except the output filename**: write to

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/raw/<ID>__run50.txt

(not `__run1.txt` or any earlier run — earlier runs are earlier parses and must not be touched).

You are a semantic parser. Read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL — it is
your complete and only instruction set. Do **not** read any other file in this repository (no
regression cases, no notes, no other parse output) and do not search the web.

Your batch file has one item per line, tab-separated: `<ID>\t<TEXT>`. For each line, translate TEXT
and write only the assertion lines — one per line, in exactly the `(: name (Pattern args) (STV s c))`
form the instruction set specifies — to that item's file. No prose, no fences, no commentary.

Write each item's atoms straight to its file with the Write tool. Do not echo the atoms in your
reply and do not print file contents back — just write the files.

No CONTEXT / TODAY / DOMAIN is supplied — parse each TEXT on its own terms, independently of the others.
