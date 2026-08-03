# Tier A — synthetic controlled corpus: design table

Ground truth for **M4** (precision/recall of discovered equivalences) and the **negative-control
gate** in P4 routing. **Built: 84 seeds, 402 sentences, 31 target rules, minimum support 3.**

> The plan sketched ~50 seeds / ~300 sentences. The extra is bought by §1: allocating seeds to rules
> rather than to phenomena is what keeps every rule above the support floor.

## 1. The decision that shapes everything: support, not coverage

The obvious way to build Tier A is one instance per phenomenon — a `purchase/buy` pair, a
`give up/abandon` pair, and so on. That corpus is **structurally unminable**. Every Wave-1 method
thresholds on document support: frequent sub-stars count occurrences, MI needs a contingency table,
anti-unification needs recurring diffs to generalize over. A rule seen once cannot clear any
threshold, so M4 recall would be capped near zero and we would be measuring the corpus, not the
miner.

So Tier A is organized **target-rule first**: 31 target rules, each instantiated by **3–4 independent
seeds** in different scenarios and argument structures. Coverage of phenomena is the *secondary*
axis; support per rule is the primary one.

The consequence to keep in view: Tier A is deliberately **denser in equivalences than natural text**.
It measures whether the miner finds what is there, not what the rate would be in the wild — that is
Tier B's job. M4 is a ceiling estimate and is reported as one.

## 2. Record shape

One **sentence** = one corpus record (parsed independently). Grouping is by label, not by file:

```json
{"id": "tierA-000037", "source": "tierA-synthetic",
 "sentences": ["The depot purchased two forklifts."],
 "context": {"today": null, "domain": null, "prior": [], "notes": null},
 "equiv_class": "seedA-012",
 "labels": {"variant_kind": "mining", "polarity": "same",
            "target_rule": "buy<-purchase", "control_kind": null}}
```

- `equiv_class` — the seed id. Every variant of one meaning shares it.
- `polarity` — `same` (should consolidate to the base) or `different` (**must not**).
- `variant_kind` — `base` | `normalize` | `mining` | `control`.
- `target_rule` — which equivalence this variant is evidence for; `null` for base/control.

## 3. The four variant kinds

**`base`** — the plain realization. One per seed.

**`normalize` (plan category i)** — alternations the *prompt* should already collapse, so the two
records should produce the **identical canonical graph**. These are not mining targets; they are
assertions about our own prompt, and a mismatch is a prompt finding.

Only two alternations qualify, and the plan's original list was wrong on a third:

| alternation | identical? | why |
|---|---|---|
| active ↔ **by**-passive | expected **yes** | same event, same two roles |
| dative alternation (double-object ↔ *to*-PP) | expected **yes** | same roles, surface order not recorded |
| **cleft ↔ plain** | **no** — removed | the prompt emits `(Cleft filler event)` *in addition* to the prejacent, so the graphs differ by one atom **by design** |
| agentless passive ↔ active | **no** — removed | agentless passive omits `Agent`; the active mints an indefinite witness *and* an `Agent`. A real difference, not a normalization failure |

Cleft and agentless passive are still useful — as **Tier C paraphrase pairs**, where a small
principled difference is the point. They do not belong in a category that asserts graph identity.

**§7 gates this**: the identity claims are probed on a small batch **before** the full corpus is
generated, because if voice does not in fact normalize, ~50 records carry wrong ground truth.

**`mining` (plan category ii)** — the real targets. The prompt deliberately keeps these distinct
(surface faithfulness), so the equivalence must be *discovered*:

| family | target rules (support) | expected routing |
|---|---|---|
| lexical verb | `buy<-purchase` (4), `buy<-acquire` (4), `repair<-fix` (4), `repair<-mend` (4), `begin<-start` (4), `begin<-commence` (4), `allow<-permit` (3), `require<-need` (3) | consolidation |
| lexical noun | `physician<-doctor` (3), `automobile<-car` (3) | consolidation |
| lexical adj | `large<-big` (3), `difficult<-hard` (3) | consolidation |
| phrasal ↔ simple | `abandon<-give_up` (3), `postpone<-put_off` (3), `discover<-find_out` (3), `cancel<-call_off` (3), `reject<-turn_down` (3) | consolidation |
| light verb | `walk<-take_a_walk` (3), `decide<-make_a_decision` (4), `answer<-give_an_answer` (3) | consolidation |
| degree wording | `huge<-very_big` (3), `exhausted<-very_tired` (3) | consolidation (lossy? — M4 decides) |
| nominalization | `destroy<-destruction` (3), `arrive<-arrival` (3), `decide<-decision` (4) | consolidation |
| idiom | `die<-kick_the_bucket` (3) | consolidation, lossy |
| converse | `buy~sell` (4), `give~receive` (4), `teach~learn` (3), `lend~borrow` (3) | **bridging** (argument swap ⇒ no canonical direction) |
| role merge | `CoAgent~GroupOf` (4) | **bridging or reject** |

The last two families are the interesting ones: they are *equivalences a naive miner will propose as
consolidations*, and the routing criterion must send them elsewhere. `CoAgent~GroupOf` is the
paper's own flagship merge (§6.4), which we declined to hard-code — so Tier A is also the test of
whether our routing rediscovers it and classifies it correctly.

**`control` (plan category iii)** — `polarity: different`, **must not consolidate**. Each is
*lexically close* to its base, which is what makes it a real test:

`antonym` · `negation` · `modality-shift` (must↔may) · `participant-swap` · `quantity-change` ·
`manner-near-miss` (stroll vs sprint)

Two per seed, kind rotated over the kinds each family can actually host — which is why the
distribution is uneven (negation 56, modality-shift 37, antonym 33, participant-swap 26,
quantity-change 12, manner-near-miss 4). The imbalance is intrinsic: "the board postpones the vote"
has no manner near-miss, and a `teach` event has no lexical antonym. Two kinds were **removed from
families that cannot host them honestly**:

- `antonym` off `teach` — asked for one, the realizer coined *"A potter unteaches an apprentice."*
- `participant-swap` off `work_with` — **`work with` is symmetric**, so "Bo works with Ana" means
  exactly what "Ana works with Bo" means. Labelling that `polarity: different` would have scored a
  *correct* consolidation as a false positive: a control that corrupts M4 against the miner.

## 4. Seed inventory

84 seeds over concrete everyday domains — workshop, depot, office, kitchen, garden, lab, school,
shop, transport, library, clinic, farm, studio, site, harbour. Domain variety matters because
role-filler clustering (§4.3.2) keys on event-conditioned slots: if every `buy` event had the same
filler, the slot distribution would be degenerate.

Target rules are assigned round-robin, so each rule lands in 3–4 different seeds with different
participants and argument structures. The assignment is generated, not hand-listed — see
`build_tierA.py`, which is the source of truth and is deterministic.

**One rule per family.** A family bundling two rules (`large<-big` *and* `huge<-very_big`) asks each
of its seeds for a variant its own base cannot support: a seed glossed "the repair is difficult"
dutifully produced "The repair is very tired". Every adjective pair now has its own family whose
gloss instantiates it.

## 5. Constraints on realization

Sentences are realized by blind agents from this table, then mechanically checked. Rules:

1. **Declarative, concrete, present or past.** No questions, no imperatives — the parser's strong
   zone, so parse noise does not contaminate M4.
2. **No sentence may appear in `prompt.txt` or `regression_cases.md`** — the no-recital rule, in both
   directions. Checked mechanically over the whole corpus.
3. **Variants of one seed differ only in the labelled dimension.** A `mining` variant swaps the
   lexical item and nothing else; a `control` changes exactly the one thing its `control_kind` names.
   Otherwise a "discovered" rule could be an artefact of unrelated wording drift.
4. **No pilot sentence, no golden sentence.**
5. One clause, 5–12 words, no proper-noun-heavy scenes (names are free variables for the miner).

Built corpus: 84 base / 104 mining / 46 normalize / 168 control = **402 records**, 4–11 words
(median 7), zero duplicates, zero leaks, and all 104 mining variants verified to contain the lexical
item their rule names.

## 6. What Tier A cannot tell us

- **Not a frequency estimate.** Density is by construction (§1).
- **Not a natural-distribution test.** Tier B is.
- **It cannot validate a rule we did not think of.** M4 measures recall against *this* list; a
  correct rule outside the list scores as a false positive unless triaged. P3 reports
  out-of-inventory candidates separately rather than counting them against precision.

## 7. Build order

1. Author this table + `build_tierA.py` (deterministic assignment).
2. **Probe the §3 identity claims** — 12 alternation pairs, 1 parse each, compare canonical
   `graph_id`. Cheap, and it gates ~50 records of ground truth.
3. Realize sentences (blind agents, batched by seed).
4. Assemble + mechanically validate: label well-formedness, no duplicates, leak check both
   directions, per-rule support counts, control-kind balance.
5. Review a stratified sample; checkpoint with corpus stats.
