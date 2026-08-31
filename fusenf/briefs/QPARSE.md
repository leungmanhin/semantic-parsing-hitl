# Question→query brief (M5 question arm — QPARSE)

You translate one English QUESTION at a time into ONE query for a PeTTaChainer knowledge
base. The knowledge base holds the logical form of a single sentence plus general rules;
your query is the conjunction of atoms that must hold for the question to be answered,
with variables for the unknowns.

First read `/home/manhin/Dev/semantic-parsing-hitl/prompt.txt` IN FULL. It is the complete
definition of the representation (events, roles, Member/Inheritance, tense and status
operators, compounds, truth values). You are NOT parsing sentences and you write no
statements — you write the query-side mirror of that representation.

Do **not** read any other file in this repository (no parses, no rule files, no regression
cases, no notes — and nothing in `queries/` or `questions/`: not other agents' outputs,
not your own earlier ones; each item is translated from the brief and `prompt.txt` alone)
and do not search the web. You never see the sentence behind a question.
**Translate the question exactly as asked, in its own vocabulary** — never substitute a
synonym, never guess what word the underlying sentence "probably" used. If the question
says a word, your query uses that word's lemma; whether the knowledge base bridges it is
the experiment's business, not yours.

Your batch file `batches/question/qp-NN.txt` has one item per line, tab-separated:

    <QID>\t<QUESTION>

## Mapping rules

- The asked-for unknown (who/what/whom/where) is the variable `$ans`, appearing in the
  role or position the question asks about.
- Every other unknown individual gets its own variable (`$e1`, `$x1`, `$x2`, …; events
  from the `$e` series, entities from the `$x` series).
- An event mentioned by the question is reified exactly as `prompt.txt` prescribes for
  statements: `(Member $e1 <verb-lemma>)` plus one atom per role the question gives.
  Verb lemma = the question's own verb, lowercased, multiword joined with underscores.
- A common-noun participant ("the ledger", "a mason") becomes a variable typed by its
  kind: `(Member $x1 <noun-lemma>)` — compounds decomposed per `prompt.txt` only when the
  question itself uses the compound.
- A proper name in the question binds through its surface form:
  `(Name $x1 "<Name as written>")`.
- Tense/status atoms appear ONLY as the question marks them: past-tense question →
  `(Past $e1)`; plain present → no tense atom; a modal or negation in the question maps
  per `prompt.txt`. Add nothing the question does not say.
- Kind-level questions (about kinds in general, no specific event) use the categorical
  forms (`Inheritance`, kind-level heads) per `prompt.txt`, with `$ans` in the asked slot.
- Role choice (Agent / Patient vs Theme / Experiencer, …) follows `prompt.txt`'s own
  tests, applied to the question's verb as the question uses it.
- A bare "Where …?" that names no preposition of its own maps to
  `(LocatedIn $x1 $ans)`; when the question names the position relation ("What is the
  pail on?"), use that preposition's head instead.

## Output

Exactly ONE s-expression per question — a single atom, or `(And <atom> <atom> ...)` when
more than one atom is needed. No truth values, no proof names, no `(: ...)` wrapper, no
comments, no prose. Write it as the entire content of

    /home/manhin/Dev/semantic-parsing-hitl/fusenf/queries/<QID>.query.txt

Worked shapes (invented vocabulary, for form only):

    "Who towed the dinghy?"
      -> (And (Member $e1 tow) (Agent $e1 $ans) (Theme $e1 $x1) (Member $x1 dinghy) (Past $e1))

    "Where is the tannery?"
      -> (And (Member $x1 tannery) (LocatedIn $x1 $ans))

Items are independent. Use the Write tool; when every item in your batch is written,
reply "done" and nothing else.
