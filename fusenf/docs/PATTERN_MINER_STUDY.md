# Pattern-miner study — Ben Goertzel's miner lineage vs FUSE-NF `frequent_stars` (2026-08-19)

Owner-requested study before batch 2 commits to a mining design. Question: our batch-1
§4.3.1 miner is single-center by construction; rather than ad-hoc extensions (two-center,
three-center, …), how close can we get to Ben's general pattern-mining conception — and
should we run the TrueAGI implementation directly?

Sources (fetched 2026-08-19):
- https://wiki.opencog.org/w/Pattern_miner (the classic miner; now marked "OpenCog fossil")
- https://wiki.opencog.org/w/Measuring_Surprisingness (isurp/nisurp/iisurp formulas)
- https://github.com/opencog/miner — `opencog/miner/README.md` (the URE-based miner; the
  formal algorithm statement)
- https://github.com/trueagi-io/hyperon-miner (the living implementation, MeTTa,
  "optimized for the PeTTa interpreter"; ~1,265 commits, active)

## 1. Ben's conception, distilled

**Pattern language.** A pattern is a Lambda-wrapped conjunction of `Present` clauses over
typed variables — "a connected set of links and nodes with variables that occurs in the
Atomspace repeatedly." The most abstract pattern, Top, is the identity:

    (Lambda (Variable "$X") (Present (Variable "$X")))

An *n-conjunct* (n-gram) pattern has n clauses. Variables may appear in any position,
shared across clauses — connectivity comes from variable sharing, with **no restriction on
topology** (no privileged center).

**Semantics.** A *valuation set* of pattern P over database T = all mappings from P's
variables to values such that substitution yields data trees present in T. *Support* =
number of data trees matching; *frequency* = support / |T|.

**Algorithm (URE miner): top-down specialization.**
1. Start from Top (or seed abstractions).
2. Extract the valuation set of the current pattern.
3. Compute *shallow abstractions* per variable — the one-layer generalizations its values
   support: (a) constant nodes, (b) co-reference to a later variable, (c) a Lambda
   sub-pattern.
4. *Specialize* by composing pattern and abstraction with `Put` (beta-reduction).
5. Prune by the **a-priori (antimonotone) property**: "if a pattern tree has frequency f
   then a specialization can only have frequency ≤ f" — a pattern below min-support is
   discarded *with its entire specialization cone*.
6. **Conjunction expansion**: combine frequent patterns through shared variables into
   n-conjunct patterns. Noted in the README as violating the a-priori property, so it is
   a separately-controlled heuristic, bounded by a depth/conjunct parameter.
7. Iterate; in the URE version, inference control chooses what to specialize next.

**Interestingness: surprisingness, not frequency.** Frequency finds candidates;
*surprisingness* ranks them. I-Surprisingness for a conjunction ABC:

    isurp(ABC) = max{ P(ABC) − maxP,  minP − P(ABC) }
    maxP/minP  = max/min over all partitions of {A,B,C} of the product of the parts'
                 empirical probabilities, e.g. P(AB)·P(C), P(A)·P(B)·P(C), …
    nisurp     = isurp / P(ABC)          (normalized — else small-count patterns vanish)

i.e. the distance of the pattern's empirical probability from the *interval of
independence-based estimates* over its sub-pattern partitions. The wiki also defines
II-surprisingness (discounting patterns explained by coherent super/sub-concepts — the
Central-African-Republic/Bangui worked example), historically unimplemented. hyperon-miner
adds a `jsd` (Jensen–Shannon divergence) mode.

**hyperon-miner concretely.** `experiments/pattern-miner/pattern-miner.metta` entry point;
parameters `$db, $minsup, $depth, $surp-mode ∈ {none, isurp, jsd, isurp-old},
$normalization, $db-ratio (sampling!), $conj_exp`. Five-stage pipeline (abstract-pattern
formation → specialization via valuations → candidate filtering by support → conjunction
expansion with variable mapping + redundancy removal + normalization → surprisingness).
Module names mirror the URE miner one-to-one (`valuation.metta`,
`shallow-abstractions.metta`, `specialization.metta`, `conjunction-expansion.metta`) —
it is a faithful port of the same conception, and it targets **PeTTa**, the interpreter
family our engine (PeTTaChainer) is pinned to.

## 2. Mapping onto batch-1 `frequent_stars`

| dimension | Ben's miner | frequent_stars (batch 1) |
|---|---|---|
| pattern topology | any variable-sharing conjunction (n centers free) | single-center star subsets + skolem-free kind components |
| traversal | top-down specialization from Top, a-priori pruning | bottom-up exhaustive subset enumeration, k ≤ 4 |
| content abstraction | full lattice: constants may stay or lift to variables | fixed stratum: skolems→variables, **constants always verbatim** |
| support | matching data-tree count (occurrences) | **document support** (distinct corpus ids) |
| interestingness | isurp / nisurp / jsd ranking | min-support + dominated-flag only; ranking left to cross-method consensus + judges |
| identity of a pattern | normalization inside the miner | canonical string via minimal satellite-permutation |
| determinism | URE control / `$db-ratio` sampling = not guaranteed | absolute (byte-identical reruns) — a FUSE-NF hard requirement |

Readings of the table:

- Our star patterns are exactly the fragment of Ben's lattice reachable by: specialize Top
  to one distinguished variable `$C`, clauses = atoms containing `$C`, all content
  positions specialized to constants. The single-center restriction and the
  constants-verbatim stratum are *both* prunings of his space — the first cost us
  `CoAgent~GroupOf` (spans two stars) and the 77 cross-star MI groups; the second hides
  shape-level patterns (`(Member $C $v) (Theme $C $x:$w)` with the verb itself variable).
- Two divergences are deliberate and should survive any rewrite: **document support**
  (burstiness guard — a pattern firing 5× in one record counts once; Ben's tree-count is
  the right *secondary* statistic) and **determinism** (voting, provenance, reproducibility
  all depend on it; `$db-ratio` sampling and URE-style control are off the table for the
  production path).
- Surprisingness fills a real hole: today nothing *ranks* frequent patterns — min-support
  is a floor, not an ordering, and candidate prioritization for the gauntlet is manual.
  nisurp is cheap given per-sub-pattern supports we already count. Honest caveat: it
  measures in-corpus deviation from independence — it cannot distinguish a world-fact from
  a corpus-construction artifact (the AE scenario siblings would score as *highly*
  surprising, correctly-but-uselessly), so it prioritizes judge attention; it never
  replaces judges.

## 3. Options for batch 2

**A. Ben-faithful Python miner (`frequent_patterns2`)** — implement his algorithm on our
substrate: per-record clause sets from canon atoms; Top-per-mode; shallow abstractions
computed from valuation sets; `Put`-style specialization; a-priori pruning at the
document-support floor; conjunction expansion by shared variables with bounded conjuncts
(n ≤ 3–4), canonical variable renumbering by the existing minimal-permutation trick
(generalizes unchanged: minimize the sorted rendering over variable numberings);
redundancy removal; isurp/nisurp scoring from sub-pattern supports. Deterministic by
construction; keeps ~NEG, surface-record exclusion, canon-version refusal, doc-support.
This *subsumes* the two-center proposal: multi-center patterns fall out of conjunction
expansion as a bounded parameter, not an architecture change — which answers the "why
stop at two?" objection on Ben's own terms.

**B. Run hyperon-miner directly.** In favor: faithful by definition; PeTTa-optimized, and
PeTTa is already a pinned dependency of our engine; shared substrate with TrueAGI work.
Against, all real: (i) *record boundaries vanish* — one atomspace holds everything, so
canonical skolems collide across records (the `e0` problem, now real) unless namespaced
per record, and document support must be reconstructed post-hoc from valuations; (ii)
determinism unverified (`$db-ratio`, evaluation order); (iii) our vocabulary specifics
(~NEG pooling guard, surface-record exclusion, opaque interiors) need pre/post filters;
(iv) engine-version coupling for a component that deterministic-first wants engine-free.

**C. Recommended: A as production, B as cross-reference (owner emphasis 2026-08-19: NOT
an oracle).** Build `frequent_patterns2` as the deterministic production miner, and run
hyperon-miner as a *spike* on a small namespaced export (Tier A 402 is ideal: known
answer key) to cross-check inventories. hyperon-miner is itself work-in-progress and may
contain bugs, so neither implementation is ground truth for the other; **on any
divergence the arbiter is the written formal spec** (the URE miner's definitions of
valuation / shallow abstraction / a-priori, the wiki's isurp formulas) **plus the Tier A
answer key**. A divergence then classifies three ways: our coverage gap, our deliberate
extension (doc-support, ~NEG, surface exclusion), or a hyperon-miner defect — the last
worth reporting upstream, a side benefit of the exercise. That is the honest meaning of
"as faithful as Ben's as possible": faithful to the *conception as written*, with the
living implementation as a reference to triangulate against, not to defer to. The spike
also answers empirically whether hyperon-miner at current maturity could serve directly
later.

## 3a. Scope decision (owner, 2026-08-19)

Option C proceeds **scoped to the three exceptions of §3's honest scoping plus the other
miners' input needs — not the full-fledged miner as Ben outlined**. Recorded so the
boundary is auditable:

**In scope for `frequent_patterns2`:**
1. shallow abstraction / constant-lifting — the shape stratum (§4.3.1's own "go to with
   two participants" example, mined directly instead of via the MI detour);
2. bounded conjunction expansion (n ≤ 3–4) with a-priori pruning — the principled
   multi-center form (CoAgent~GroupOf, the 77 cross-star groups);
3. nisurp ranking of equivalence candidates (judge-attention prioritization at Tier B
   scale; packs keep marginal-MDL as their selector — surprisingness is the wrong measure
   for that species);
4. exports the other miners consume: valuation sets (= §4.3.2 role-filler substrate for
   free) and the enriched pattern vocabulary (MI/AE feature space);
5. all standing invariants: document support primary, determinism absolute, canonical
   pattern strings, ~NEG, surface-record exclusion, canon-version refusal, M4 gate before
   the gauntlet.

**Explicitly out of scope (not now):**
URE-style inference control / mining-as-reasoning; unbounded lattice or conjunction
depth; sampling modes (`$db-ratio`-style); II-surprisingness (coherence-weighted
super/sub-concept discounting) and jsd unless trivially cheap; mining in an atomspace.
hyperon-miner remains a cross-reference spike only (§3 option C, not-an-oracle framing).

## 4. Batch-2 slotting

Supersedes the earlier "two-center patterns over cross-star edges" idea (BATCH1_REPORT §6
item 3): conjunction expansion is the principled form of the same capability. Expected
first targets on the doubled substrate: the CoAgent~GroupOf correspondence (2-conjunct,
2-center), the 77 cross-star MI groups (candidate 2–3-conjunct patterns), and shape-level
role-frame patterns for #23-style role wobble. M4 (Tier A answer key) gates
`frequent_patterns2` like any other method before its candidates enter the gauntlet.

**§4.3.4 companion upgrade — within-unit diff factoring (owner discussion 2026-08-19).**
Loop 2's null result is mechanical: natural-pair diffs bundle several independent edits
in one unit, so bundled keys never recur. Fix: factor each unit diff into connected
components over shared satellite variables, each minimal edit becoming its own candidate
key. **Trap (must-keep discipline):** co-dependent edits fabricate false rules when split
— the converse `buy↔sell` = lexeme swap + argument swap *jointly*; the lexeme atom shares
only `$C` with the role atoms, so naive components split exactly there, and Tier A's
participant-swap control keys would not catch the bare Member-swap. Therefore: (1) always
emit the joint key alongside its factors; (2) a factor is promotable only if independently
attested as a *sole* diff elsewhere, or judge-approved as meaning-preserving *on its own*;
(3) existing guards stay (fires_on_control, garble/review gate, and the About/Of
diff-rendering mistemplate fix — factoring raises the price of rendering bugs). Composes
with cluster-level anti-unification: factor first (smaller exact keys), cluster the
factors (approximate matching + true lgg).
