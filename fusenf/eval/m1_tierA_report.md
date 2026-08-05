# M1 on Tier A — 26 stratified items × 3 runs (2026-08-03)

| | pilot (20 items) | **Tier A (26 items)** |
|---|---|---|
| `pairwise_agreement` | 1.000 | **0.654** |
| `unanimity` | 1.000 | **0.538** |
| `modal_share` | 1.000 | **0.808** |
| `soft_jaccard_mismatch` | — | 0.503 (27 disagreeing pairs) |
| families at 1.000 | 20/20 | **14/26** |
| decision rule | parse once | **majority-of-3** |

78 parses, all clean on C1–C8; `canonicalizer` variance 0. Sample is one item per family, variant
kinds balanced (7 base / 7 mining / 5 normalize / 7 control), selected deterministically by hash.

## The headline is the gap between the two columns

**A stability number does not transfer across construction mixes.** M1 = 1.000 was measured on the
pilot's 20 items and we were about to rely on it for 1,300 more parses. On Tier A's actual mix the
same metric reads **0.654**, and the spec's own decision rule flips from *parse once* to
*majority-of-3*. Had we parsed everything once, roughly a third of the corpus would have been one
arbitrary reading out of several — and mining cannot tell that from a real alternation.

## The recent fixes are holding

Three of the four families targeted by the last two fix batches are now perfectly stable:
`require` 1.000 (gap-0031 stative-transitive collision), `cancel` 1.000 (gap-0029), and **no
`(Future …)` atom appears in any of the 78 parses** (gap-0032 — the futurate rule no longer fires
without evidence). The instability that remains is elsewhere.

## What is actually unstable

| class | evidence | why it matters |
|---|---|---|
| **idiom not recognized** | "The last elm **kicks the bucket** that autumn" — 2 of 3 runs parsed it *literally* (`Member e0 kick` + `Member x1 bucket`); only one produced `kick_the_bucket` | this is a Tier A **mining target** (`die<-kick_the_bucket`); if the idiom isn't a unit, M4 scores a rule that was never expressible |
| **negation bundle scope** | "An elder does not teach the children a song" — the three runs disagree on which atoms sit *inside* the `(And …)` blob and which stay outside | Tier A has **56 negation controls**; if the bundle boundary moves, every one of them is unstable |
| **universal + copular** | "The divers are all very tired" — run3 a distribution `Implication`, run4 `GroupOf`+`Inheritance` on the group, run5 `Inheritance` on the kind | three incompatible readings of an explicit universal over a copular predicate |
| **gross parse error** | "A shoreline survey begins at dawn" — run5 dropped the event entirely, emitting `(Member e0 shoreline_survey)` with no `begin` | not a convention gap; ordinary noise, and the reason `modal_share` (0.808) sits well above `unanimity` (0.538) |

Mechanical attribution: `optional-atom` 12, `unclassified` 7, `decomposition-depth` 6,
`role-choice` 2, `canonicalizer` 0.

## The decision this forces

Majority-of-3 on the full corpus is **402 × 3 + 917 × 3 ≈ 3,960 parses**. That is an order of
magnitude more than anything run so far, and it buys a corpus that is *stable* but still carries the
underlying convention gaps into mining.

The cheaper path is the one that already worked once: **run the prompt loop on the 12 unstable
families and re-measure**. The pilot went 0.800 → 1.000 over four such rounds, and the classes above
are concrete and few — idiom recognition, negation-bundle scope, universal-over-copular. Each round
costs ~78 parses, against ~4,000 for brute-force triple parsing.

Recommended: two or three fix-and-re-measure rounds targeting the classes above; adopt majority-of-3
only if Tier A stability stalls below 0.80.

## Method note

Runs 1 and 2 of these items exist but were **not** used: they were produced under two earlier prompt
versions, and mixing prompt versions into a stability measure would confound prompt change with
parse variance. Runs 3–5 are all under the current prompt (`sha e4cbd35`).
