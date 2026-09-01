# FUSE-NF — Parse record schema & validator (`fusenf-parse/1`)

P0 deliverable. Defines the on-disk format of corpora, faithful parses, and canonical forms, plus
the validator that gates a parse into the corpus. Companion specs: `canonicalization.md`,
`metrics.md`; the operator inventory the validator checks against is `vocabulary.json`.

## 0. Files & immutability

```
fusenf/corpora/<tier>.jsonl            corpus items — inputs only, never contain atoms
fusenf/parses/<tier>.parses.jsonl      faithful parses — APPEND-ONLY, never rewritten
fusenf/canonical/<tier>.canon.jsonl    canonicalizer output, keyed to a parse
fusenf/consolidated/<tier>.cons.jsonl  rewriter output (consolidation stage), keyed to a canonical form
fusenf/triage/parse_failures.jsonl     quarantined records + validator diagnostics
```

Three hard rules:

1. **The faithful parse is immutable.** Everything downstream (canonical, consolidated) lives in a
   *separate* file that points back by key. A parse is never edited in place — a re-parse is a new
   record with a new `run`.
2. **Corpus items hold no atoms.** Inputs and outputs never share a file, so a corpus can be
   re-parsed under a new prompt without touching its definition.
3. **Every derived record carries the hashes of what produced it** (`prompt_sha256`, `input_sha256`,
   `ruleset_sha256`), so any artifact can be traced to an exact prompt + input + rule set.

## 1. Primary key

`(id, run)`.

- `id` — the corpus item, stable forever: `<tier>-<6 digits>`, e.g. `tierB-000123`.
- `run` — integer ≥ 1, the parse attempt. **M1 (parse stability) requires several parses of one
  item**, so `id` alone cannot be the key. `run` also distinguishes re-parses after a prompt change.

A corpus item's `id` is never reused for different text. Corrections to an item's text mint a new id
and retire the old one (`"retired": true`).

## 2. Corpus item record

```json
{
  "schema": "fusenf-corpus/1",
  "id": "tierA-000042",
  "source": "synthetic-tierA",
  "sentences": ["Maria bought the bicycle."],
  "context": {"today": null, "domain": null, "prior": [], "notes": null},
  "equiv_class": "buy-01",
  "labels": {"polarity": "positive", "variant": "lexical-synonym", "seed": "buy-01"},
  "input_sha256": "…"
}
```

- `sentences` — one, or a very small number of related, raw English sentences. Multi-sentence items
  exist to exercise cross-sentence coreference; they are parsed as **one** unit.
- `equiv_class` — Tier-A/C ground-truth class id; `null` for Tier B.
- `labels` — free-form ground truth. Tier A uses `polarity` (`positive` = same meaning as the seed,
  `negative` = deliberate near-miss control) and `variant` (which phenomenon this variant tests, per
  `docs/BATCH1_PLAN.md` §5.1 categories i/ii/iii). Tier C uses `polarity` for paraphrase vs control.
- `input_sha256` — sha256 of the canonical JSON of `{sentences, context}`. Detects silent input drift.

## 3. Statement parse record

The user-specified core is `sentences` / `context` / `statements`; everything else is provenance.

```json
{
  "schema": "fusenf-parse/1",
  "id": "tierB-000123",
  "run": 1,
  "source": "tatoeba",
  "equiv_class": null,
  "sentences": ["Maria drove to the store."],
  "context": {"today": null, "domain": null, "prior": [], "notes": null},
  "statements": [
    "(: maria_drove (Member sk_drive_1 drive) (STV 1.0 0.99))",
    "(: drove_agent (Agent sk_drive_1 maria) (STV 1.0 0.99))",
    "(: maria_name (Name maria \"Maria\") (STV 1.0 0.99))",
    "(: drove_goal (Goal sk_drive_1 sk_store_1) (STV 1.0 0.99))",
    "(: store_kind (Member sk_store_1 store) (STV 1.0 0.99))",
    "(: drove_past (Past sk_drive_1) (STV 1.0 0.99))"
  ],
  "parser": {
    "model": "claude-sonnet-5",
    "prompt_sha256": "43290b91…",
    "seeded_sha256": "0b743262…",
    "harness": "fusenf-harness/1",
    "batch": "b0007",
    "date": "2026-07-27"
  },
  "input_sha256": "…",
  "validation": {"ok": true, "errors": [], "warnings": []}
}
```

- `sentences` and `context` are **denormalized** copies of the corpus item — a parse file is
  self-contained and reviewable on its own. `input_sha256` must match the corpus item's; a mismatch
  is a mechanical-check failure (C1).
- `statements` — the assertion strings **exactly as the parser emitted them**, in emission order,
  including proof names and STVs. This is the faithful record; no normalization of any kind is
  applied here (that is the canonicalizer's job, into a different file).
- `parser.model` — the concrete model id resolved at parse time, not "latest Sonnet".
- `validation` — filled by the validator, the only field written after creation, and only once.

### 3.1 Question records (reserved, not batch 1)

Same envelope with `questions` / `context` / `queries`; `queries` holds query s-expressions
(`(: $prf <pattern> $tv)`) in emission order, and `expected` is optional ground truth. Reserved so
the schema does not have to change when question parsing arrives.

## 4. The `context` object

**Deliberately semi-structured.** Reserved keys have fixed meanings; any other key is allowed and is
rendered as free background. May be `{}`.

| Key | Type | Meaning | Renders as |
|---|---|---|---|
| `today` | string\|null | real or fictional current date | `TODAY:` line |
| `domain` | string\|null | subject-matter domain | `DOMAIN:` line |
| `prior` | list of strings | earlier sentences, for anaphora and symbol reuse | `CONTEXT:` block |
| `notes` | string\|list\|null | situational / conversational / perceptual background | `BACKGROUND:` block |
| *(other)* | any | ad-hoc | `BACKGROUND:` block, as `key: value` |

`notes` is the deliberately loose one. It carries things like *"turn-based conversation, you are
chatting with X"* or *"you saw a person at a distance; you are holding a telescope; you intend to
confirm whether that person is Bob"* — background that legitimately shifts the preferred reading and
its confidence for an input like *"I saw the man with the telescope"*, without itself being a claim
to translate.

**Authoring rule — which channel to put a thing in.** This is guidance for whoever *populates* a
corpus item (the harness, the corpus builder), not for the parser, which only ever reads what it is
given:

> An entity named **only** in `notes`/`BACKGROUND` is **not referable** — background may not mint a
> symbol, so a pronoun pointing at it gets an anonymous witness rather than the intended referent.
> To let the text corefer with someone the setting names, put them in **`prior`/`CONTEXT`**
> (`(Name dana "Dana")`) and let `notes` describe the situation. The two compose: `CONTEXT` supplies
> referable symbols, `BACKGROUND` supplies interpretation. Verified 3/3 blind.

**The interpretive-only rule.** `prior` supplies symbols for coreference and *may* be re-asserted per
the prompt's existing CONTEXT handling. `notes` and ad-hoc keys are **interpretive only**: they may
change which reading is chosen and the confidence attached, but **no atom may be emitted for their
content**. This distinction was new relative to the prompt's #18 CONTEXT input, so batch 1 opened with a
small prompt extension declaring it, validated blind before any corpus was parsed (done). Until that lands,
`notes` stays empty outside a dedicated pilot.

## 5. Validation

Validation is deliberately split by **what can be decided objectively**. Python decides anything
mechanical; an agent judges anything requiring the prompt to be read and understood. Neither is
asked to do the other's job — a program cannot tell whether a parse *means* the right thing, and an
LLM should not be trusted to count parentheses.

### 5.1 Mechanical checks (Python) — `validator.py`

Input: one parse record. Output: `validation` block + a triage entry when not clean. All of these
are decidable from the text of the record plus `vocabulary.json`; none involves judgment.

| # | Check |
|---|---|
| C1 | JSON conformance: required fields present, correct types, `run` ≥ 1, `input_sha256` matches the corpus item |
| C2 | Every statement is a balanced s-expression; string literals closed; no stray text outside the outermost parens |
| C3 | Assertion shape `(: <proof-name> <expr> (STV <s> <c>))`; proof names snake_case and **unique within the record**; `s, c ∈ [0,1]`; **`c ≠ 1.0`** (prompt rule) |
| C4 | Closed-class head + arity check against `vocabulary.json`, keyed on **`(name, arity)`** |
| C5 | Casing: heads UpperCamelCase except the declared lowercase property constructors (`can`/`obligated`/`permitted`) and `forKind`; entity terms lowercase snake_case; variables `$`-prefixed; string literals double-quoted |
| C6 | Structural sanity: every symbol bearing a role or status atom is **declared** — by `(Member <e> <verb>)` *or* `(Inheritance <e> <verb>)` (compound-action decomposition uses the latter); role/status fillers are not literals; no free variable outside an `Implication` |
| C7 | Chainer smoke test: all statements load into a fresh PeTTaChainer KB without exception |
| C8 | Duplicate detection: two statements with identical expressions differing only in proof name |

- **C4 and open class.** `vocabulary.json` marks which argument positions are open-class. Open-class
  heads (`(Carry mosquito malaria)`, `(Cousin wendy xavier)`) cannot be checked by name — only
  position and arity. This check is the reason `vocabulary.json` exists as a maintained file: a
  Python validator cannot read 1,900 lines of English prose, so the operator inventory has to be
  extracted into a table. Regenerate it whenever `prompt.txt` or `seeded_rules.metta` changes —
  and staleness is **enforced, not remembered** (2026-08-18): `validate_file` compares the
  vocabulary's meta pins against the live files and reports `VOCABULARY IS STALE` loudly;
  `harness/vocab_attest.py` is the standing update procedure (mechanical attestation fields and
  pins regenerated from the curated sources only; classes, glosses and non-variadic arities stay
  human-adjudicated; its report lists anything needing adjudication first). Removed operators move
  to `deprecated_operators` rather than vanishing — C4 then flags them with the removal reason
  (e.g. the pre-cfe25f9 `Premises`/`Conclusions` Implication syntax, which the engine loads
  silently and answers with `[]`). Engine-class operators' compound arguments (`(Compute - (7 4)
  -> 3)`'s number tuple) are exempt from C4/C5 head checks — engine syntax, not operator
  applications.
- **C7 is expensive**, so it runs batched per file, not per record. Calibration found it is a
  **backstop, not an independent check**: nothing the chainer rejects survives C2/C3/C4. Kept as
  cheap insurance against a malformation we did not anticipate.
- **C6 carve-outs, all found by calibrating against the goldens** rather than reasoned in advance:
  a status head may scope a **whole proposition** rather than an event symbol
  (`(Past (Member tom nervous))`, `(Must (Member mary ill))` — 23 and 1 golden occurrences), so no
  declaration is required when the argument is a compound term; skolem-**function** heads are
  lowercase (`(sk_hunt $x $y)`), and a relation name may legitimately sit in an argument slot
  (`(Symmetric Cousin)`), so C5 exempts any symbol used as a head elsewhere in the record.
- **C6 does not check filler existence.** "Every role filler is declared somewhere" is not
  objectively implementable: a legitimate parse may mention a participant once
  (`(Goal sk_drive_1 sk_store_1)` with no further atom about the store). The stricter reading is a
  judgment call and belongs to §5.2.
- **The context-carried symbol set has no mechanical source.** §4's `context` holds English
  (`prior`), not atoms, so C6 cannot resolve a symbol introduced by a prior sentence. A corpus item
  may supply `context["symbols"]` explicitly; absent that, a parse referencing a prior-sentence
  symbol will show a C6 finding, which is why report-only mode matters for multi-sentence items.
- **C4's open-class boundary is the least objective check.** An unknown UpperCamelCase head is
  either a typo'd operator or a licensed open-class lexical relation, and nothing in the text
  distinguishes them. It reports with a hint; adjudication belongs to §5.2.

- **Multi-reading records (2026-08-21)**: a statement may be a transport wrapper
  `(Interpretation rN (: …))` (prompt.txt "Multiple live readings"). A reading = the shared
  statements + that tag's wrapped statements, and the checks scope accordingly: C3 validates
  the wrapper shape and scopes proof-name uniqueness per reading; C6 scopes declarations
  (shared lines declare for every reading, wrapped lines for their own tag); C8 scopes
  duplicates the same way (the same expression in two *different* readings is legal — if it
  holds in all readings it belongs in shared, a reviewer judgment, not C8's); C7 skips
  wrapper lines entirely (transport, never a KB atom — engine marginalization is #48's
  deferred half). The canonicalizer dissolves wrappers into per-reading records
  (`canonicalization.md` §4.8).

**Severities are set from data, not guessed.** For the first pilot the mechanical validator runs
**report-only**: nothing is quarantined, every check records what it fired on. We then set
ERROR/WARN from the observed distribution. Assigning them up front risks the worst failure mode
available here — a too-strict check silently quarantining exactly the novel constructions Tier B
exists to surface, biasing the corpus toward what the prompt already handles while looking clean.

Output entry:

```json
{"code": "C4", "severity": "report", "statement_index": 3,
 "detail": "unknown closed-class head 'Beneficiary' (arity 2)", "text": "(: … )"}
```

### 5.2 Agent judgment — the parse reviewer

An agent reads `prompt.txt`, the source sentences and the emitted statements, and answers two
questions that no program can:

1. **Is this parse right for this sentence?** Wrong role, missed negation, wrong scope, a compound
   left undecomposed — mechanically valid output that means the wrong thing.
2. **Does `prompt.txt` actually cover this construction?** If the sentence contains something the
   instruction set never addresses, that is not a bad parse — it is a **coverage gap**, and it is
   the single most valuable signal the pipeline produces, because it feeds the prompt-improvement
   loop directly.

Question 2 has no mechanical analogue at all, and is the reason the agent half is not optional.

Also assigned here, having no reliable mechanical form: the **context-leak** check — did the parse
emit an atom for background that was supplied as interpretive context only (§4)? A program cannot
distinguish that from a legitimate skolem or a `TODAY`-grounded calendar atom.

The reviewer runs **sampled**, not on every record (cost), with sampling weighted toward records the
mechanical checks flagged and toward construction types not yet seen.

### 5.3 Where validation sits in the parse loop

```
corpus item ──▶ [agent: parse]  ──▶ raw statements
                      ▲                  │
                      │                  ▼
              (errors fed back)   [Python: mechanical checks §5.1]
                      │                  │
                      └───── fail ◀──────┤
                                         │ pass
                                         ▼
                              faithful parse record (JSONL)
                                         │
                                         ├──▶ [agent: sampled review §5.2] ──▶ triage / prompt loop
                                         ▼
                                   [Python: canonicalizer]
```

Everything except the two agent boxes is deterministic. Three consequences worth stating:

- **Repair, don't re-roll.** A mechanical failure hands the *specific* diagnostics back to the same
  agent to fix. That turns "the parser dropped a paren" from lost data into a corrected record, and
  it is far more informative than silently sampling again.
- **Never auto-repair content.** Stripping a markdown fence the agent wrapped its output in is safe
  and non-semantic. Inserting a missing STV, guessing an omitted role, or renaming a head is not —
  that fabricates data into the record we have promised is faithful. Mechanical fixes are limited to
  non-semantic wrappers; anything else goes back to the agent or to triage.
- **Majority-of-N is available but not default.** Parse 3×, canonicalize, keep the modal form — the
  strongest deterministic defence against parser non-determinism, and the reason canonicalization
  must be code rather than judgment (voting needs a stable notion of "the same parse"). It triples
  parsing cost, so it is switched on only if M1 shows the instability that justifies it
  (`metrics.md` M1 decision rules).

## 6. Triage record

```json
{"id": "tierB-000123", "run": 1, "date": "2026-07-27",
 "sentences": [...], "statements": [...],
 "errors": [...], "warnings": [...],
 "disposition": "open|prompt-fix|vocab-add|reparse|wontfix",
 "resolution": "prompt.txt §Cardinality clarified 2026-07-28; reparsed as run 2"}
```

Triage is the prompt-improvement loop's queue: a repeated failure class becomes a `prompt.txt` /
`seeded_rules.metta` edit plus a new regression case — subject to the standing rule that **no
regression sentence may copy a prompt.txt example**.

## 7. `vocabulary.json`

The closed-class operator inventory, extracted from the current `prompt.txt` + `seeded_rules.metta`
and cross-checked against every atom in the 317 regression goldens and the e2e harness.

**As built (2026-07-27):** 116 operators — 102 `frozen`, 34 `opaque`, 39 `bridged` (11 both), 4
variadic — plus 9 open-class lexical heads, 35 skolem-function heads, and 5 declared-but-unattested
heads. Method: two independent full-prompt extractions by different models, reconciled against the
mechanical attestation inventory; the two agreed on the operator name set exactly (116, no
one-sided entries) and diverged on 17 fields, each adjudicated and marked `_adjudicated`.

**Operator identity is `(name, arity)`, not name.** `Yet` is a genuine head collision — `(Yet <event>)`
is the aspectual NPI particle and `(Yet <main> <sub>)` is the adversative connective, two unrelated
senses distinguished only by arity, because the connective rule derives its head from the surface
word. Its entry carries a `senses` array. Anything keyed on head name alone — the validator, star
decomposition, frequent-subtree mining — would conflate the two.

```json
{
  "meta": {"generated": "2026-07-27", "prompt_sha256": "…", "seeded_sha256": "…",
           "prompt_lines": 1959, "seeded_rules": 106, "attestation_sources": ["…"]},
  "operators": {
    "Member": {"class": "core-link", "arities": [2], "arg_types": ["individual|event", "kind"],
               "opaque": false, "variadic": false, "frozen": true,
               "section": "Categorical statements", "gloss": "individual is an instance of a kind",
               "attested": {"goldens": 604, "seeded": 7}}
  },
  "open_class": {"policy": "…", "positions": ["…"]}
}
```

Two fields exist for FUSE-NF specifically:

- **`frozen`** — mining may not propose a rule that rewrites this operator away. This makes
  `docs/BATCH1_PLAN.md` §1's seeded-rules/QA compatibility gate a machine lookup instead of a judgment call:
  anything a seeded rule premise or a documented query pattern matches on is frozen. Open-class
  heads are never frozen — they are exactly what consolidation is *for*.

  **`frozen: false` is not a licence to merge.** This is a *compatibility* gate: it says rewriting
  the head breaks no existing seeded rule or query, not that a merge preserves meaning. Semantic
  safety is M4's job — rule precision plus the zero-negative-control-merge hard gate. Several of the
  14 unfrozen heads (`Must`, `Future`, `Probably`, `Instrument`, `Manner`) are unfrozen only because
  no current query happens to exercise them, which is a statement about our regression coverage
  rather than about their mergeability.
- **`opaque`** — from the prompt's `## Core patterns` roster. Opaque heads are single nodes for star
  decomposition (`canonicalization.md` §5), so mining must not reach inside them.
- **`bridged`** — a seeded rule fires *from* this head. Independent of `opaque`, and needed because
  eleven roster members are both (the ten surface connectives, and `Symmetric`); see
  `canonicalization.md` §5. Derived mechanically from the heads appearing in a `Premises` in
  `seeded_rules.metta`.

`vocabulary.json` is regenerated whenever `prompt.txt` or `seeded_rules.metta` changes; its `meta`
hashes are what tell the validator it is stale.

## 8. Versioning

`schema` strings carry a major version. Additive fields do not bump it; a changed meaning or a
removed field does, and old files stay readable under their own version. Parse records produced by
different `prompt_sha256` values may be mixed in mining only when explicitly requested — the default
is to mine within one prompt version, since a convention change alters the graph shape.
