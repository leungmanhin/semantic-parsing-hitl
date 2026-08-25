"""FUSE-NF §4.3.4 — paraphrase alignment + anti-unification (wave 1).

The main consolidation-rule source. For every labeled paraphrase pair (Tier A
same-polarity variants within an ``equiv_class``; Tier C complete ``a``/``b``
pairs), align the two canonical graphs unit-by-unit, extract the differing
aligned subgraphs, and anti-unify recurring diffs into LHS↔RHS rule candidates
with variables, support counts and example ids.

Units per record (disjoint):
* each **event star** (atoms of one event skolem; satellites named ACROSS the
  two sides by role-signature, so a diff reads ``(Member $C buy)`` vs
  ``(Member $C purchase)`` with everything else literally shared),
* each **entity star**, restricted to the entity's own predications (atoms
  whose first argument is the entity), so lexical noun swaps surface as
  ``(Member $C box)`` ↔ ``(Member $C crate)`` without double-counting the
  event's role atoms,
* one **kind-level unit** (skolem-free atoms).

Anti-unification here is syntactic: after canonical abstraction (center →
``$C``, satellites → shared stream-typed names carrying their class, numbers/
strings wildcarded, ``~NEG`` polarity marker), identical (LHS, RHS) keys ARE
the least general generalization expressible in that vocabulary; support is
counted per distinct equiv_class, never per pair.

**Negative controls are mined too** (Tier A same×different-polarity pairs —
antonym swap, added negation, participant swap, …). Any candidate whose key
also arises from a control pair is flagged ``fires_on_control`` and excluded
from signals: rise↔fall must die here, not in P4.

Tier A's ``target_rule`` labels give a free recovery metric, reported per
target. ``alt:voice`` / ``alt:dative`` targets expect NO diff (the parser
already normalizes voice); they are reported as identical-parse rates instead.

**Item E upgrade — §4 diff factoring (PATTERN_MINER_STUDY §4).** Alongside the
unchanged unit keys (granularity ``unit`` — they double as the study's "joint
keys"), each pair also yields **factor keys** (granularity ``factor``): the
pair's pooled diff, rendered under a PAIR-GLOBAL satellite naming, split into
connected components. Connectors are shared satellite variables, lone-unit
centers, and shared content constants; matched-EVENT centers are inert (they
are the shared scaffold — every within-unit atom mentions them, so letting
them connect would make factoring a no-op), while matched-entity centers DO
connect (a converse's role swap must stay one component). Components that
span units recover cross-star correspondences the unit granularity cannot
express (CoAgent ~ distributed twin-event); components that split a bundled
unit diff are the loop-2 fix. Discipline per the study: a factor is
``promotable`` only if independently attested as some positive pair's SOLE
diff (single-component pair) and clean against controls — control checks for
factors run against both the control unit keys and the single-component
control factor keys (control pairs with multiple components stay out: their
meaning change is carried by an unknown component, and flagging all of them
would kill benign edits). Non-promotable factors stay in the rules file for
judge review, never in signals.

Deterministic end to end; mixed canon versions refused.

Usage:
  python align_pairs.py --corpus ../corpora/tierA.jsonl --corpus ../corpora/tierC.jsonl \
      ../canonical/tierA.canon.jsonl ../canonical/tierC_p1.canon.jsonl [...] \
      [--slots out/slots.jsonl] [--report ../eval/align_wave1.md]
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import math
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "harness"))
import canonicalize as C  # noqa: E402

RE_SKOLEM = re.compile(r"(?<![\w$])([exf])(\d+)(?![\w])")
RE_SKOLEM_FULL = re.compile(r"\A[exf]\d+\Z")
RE_NUM = re.compile(r"(?<![\w$])[+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?(?![\w])")
RE_STR = re.compile(r'"[^"]*"')
MAX_UNIT_ATOMS = 20
MAX_ASSIGN = 5040
STOP = {"a", "an", "the", "of"}


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def cosine(ca, cb):
    dot = sum(v * cb.get(k, 0) for k, v in ca.items())
    na = math.sqrt(sum(v * v for v in ca.values()))
    nb = math.sqrt(sum(v * v for v in cb.values()))
    return dot / (na * nb) if na and nb else 0.0


def abstract(term, stv, center, names, scalars=True):
    """``scalars=False`` keeps numbers/strings verbatim — used for CONTROL pairs.

    Wildcarding scalars in the control pass lets a quantity-change control
    (2 vs 3 forklifts -> both ``<num>``) alias onto a clean lexical key and
    falsely flag it; with exact scalars the control's own difference stays in
    its key and the flag only fires when the control's ENTIRE diff equals the
    candidate. (Positive keys containing ``<num>`` can then never be flagged —
    an accepted under-flagging, noted in the report.)
    """
    def sub(m):
        tok = m.group(0)
        if tok == center:
            return "$C"
        return names.get(tok, tok)
    text = RE_SKOLEM.sub(sub, term)
    if scalars:
        text = RE_STR.sub("<str>", text)
        text = RE_NUM.sub("<num>", text)
    return text + (" ~NEG" if stv[0] < 0.5 else "")


class Rec:
    """Units of one canonical record."""

    def __init__(self, rec, vocab, roles):
        self.id = rec["id"]
        self.graph_id = rec["graph_id"]
        self.atoms = rec["atoms"]
        self.parsed = [C.parse_term(a["term"]) for a in self.atoms]
        self.heads = [p[0] for p in self.parsed]
        self.klass = {s: st.get("class") for s, st in rec["stars"].items()}
        surface = vocab["surface_record"]
        self.events, self.entities = [], []
        for sym, star in sorted(rec["stars"].items()):
            if not RE_SKOLEM_FULL.match(sym) or star["kind"] not in ("event", "entity"):
                continue
            idxs = [i for i in star["atoms"] if self.heads[i] not in surface][:MAX_UNIT_ATOMS]
            if not idxs:
                continue
            if star["kind"] == "event":
                self.events.append((sym, idxs))
            else:
                own = [i for i in idxs
                       if len(self.parsed[i]) > 1 and self.parsed[i][1] == sym
                       and self.heads[i] not in roles and self.heads[i] != "Implication"]
                if own:
                    self.entities.append((sym, own))
        self.kind = [i for i, a in enumerate(self.atoms)
                     if not RE_SKOLEM.search(a["term"])
                     and self.heads[i] != "Implication" and self.heads[i] not in surface]

    def sig(self, center, idxs):
        """Class-abstracted atom set for alignment scoring."""
        out = set()
        for i in idxs:
            def sub(m):
                tok = m.group(0)
                if tok == center:
                    return "$C"
                cls = self.klass.get(tok)
                return ":" + cls if cls else "$_"
            t = RE_SKOLEM.sub(sub, self.atoms[i]["term"])
            out.add(RE_NUM.sub("<num>", RE_STR.sub("<str>", t))
                    + (" ~NEG" if self.atoms[i]["stv"][0] < 0.5 else ""))
        return out

    def sat_roles(self, center, idxs):
        """satellite -> sorted tuple of heads linking it into this unit."""
        out = collections.defaultdict(list)
        for i in idxs:
            for m in RE_SKOLEM.finditer(self.atoms[i]["term"]):
                tok = m.group(0)
                if tok != center:
                    out[tok].append(self.heads[i])
        return {s: tuple(sorted(h)) for s, h in out.items()}


def shared_names(ra, ca, ia, rb, cb, ib):
    """Cross-side satellite naming: role-signature first, then class, then singles.

    Pass 2 is what lets a ``Patient``-linked ``decision`` on one side share an
    index with a ``Theme``-linked ``decision`` on the other — without it the
    role wobble reads as a two-token difference and the slot-merge kind can
    never fire.
    """
    sa, sb = ra.sat_roles(ca, ia), rb.sat_roles(cb, ib)
    names_a, names_b = {}, {}
    counters = collections.Counter()

    def assign(tok_a, tok_b):
        stream = (tok_a or tok_b)[0]
        n = counters[stream]
        counters[stream] += 1
        if tok_a:
            cls = ra.klass.get(tok_a)
            names_a[tok_a] = "$%s%d%s" % (stream, n, ":" + cls if cls else "")
        if tok_b:
            cls = rb.klass.get(tok_b)
            names_b[tok_b] = "$%s%d%s" % (stream, n, ":" + cls if cls else "")

    left_a, left_b = [], []
    for sig in sorted(set(sa.values()) | set(sb.values())):
        la = sorted([s for s, g in sa.items() if g == sig],
                    key=lambda s: (ra.klass.get(s) or "~", s))
        lb = sorted([s for s, g in sb.items() if g == sig],
                    key=lambda s: (rb.klass.get(s) or "~", s))
        for pos in range(min(len(la), len(lb))):
            assign(la[pos], lb[pos])
        left_a += la[len(lb):]
        left_b += lb[len(la):]
    # pass 2 — pair leftovers across sides by class (same stream)
    rest_b = list(left_b)
    for tok_a in sorted(left_a, key=lambda s: (ra.klass.get(s) or "~", s)):
        cls_a = ra.klass.get(tok_a)
        match = next((t for t in rest_b
                      if t[0] == tok_a[0] and rb.klass.get(t) == cls_a and cls_a), None)
        if match:
            rest_b.remove(match)
            assign(tok_a, match)
        else:
            assign(tok_a, None)
    for tok_b in rest_b:
        assign(None, tok_b)
    return names_a, names_b


def unit_atoms(rec, center, idxs, names, scalars=True):
    return sorted(abstract(rec.atoms[i]["term"], rec.atoms[i]["stv"], center, names, scalars)
                  for i in idxs)


RE_CLS = re.compile(r"(\$[exf]\d+):([A-Za-z0-9_]+)")
RE_WILD = re.compile(r"\$([exf])(\d+)((?::[A-Za-z0-9_]+)?)")


def renumber(lhs, rhs):
    """Canonical wildcard indices WITHIN one diff instance, jointly over both sides.

    ``shared_names`` numbers satellites over the WHOLE unit, so a diff atom's
    index depends on how many unrelated satellites the scenario carried —
    ``$e0:decision`` in one class, ``$e1:decision`` in the next — and the same
    rule then never pools to support 2. Re-number per stream by exact minimal
    form over the instance's own tokens (cross-side identity preserved: the
    same token maps to the same new index on both sides).
    """
    toks = []
    for a in lhs + rhs:
        for m in RE_WILD.finditer(a):
            t = m.group(0)
            if t not in toks:
                toks.append(t)
    by_stream = collections.defaultdict(list)
    for t in toks:
        by_stream[RE_WILD.match(t).group(1)].append(t)
    # lifted class labels are renamable too — lift() numbers them by class
    # ALPHABET, so the same converse frame keys apart when the participant
    # nouns sort differently across scenarios ("K" behaves as one more stream)
    klabels = []
    for a in lhs + rhs:
        for m in re.finditer(r":K(\d+)(?![\d])", a):
            if m.group(0) not in klabels:
                klabels.append(m.group(0))
    if klabels:
        by_stream["K"] = klabels
    n_assign = 1
    for ts in by_stream.values():
        for i in range(2, len(ts) + 1):
            n_assign *= i
    streams = sorted(by_stream)

    def render(assign):
        def sub(m):
            return "$%s%d%s" % (m.group(1), assign[m.group(0)], m.group(3))
        def subk(m):
            return ":K%d" % assign[m.group(0)]
        out = []
        for side in (lhs, rhs):
            out.append(tuple(sorted(
                re.sub(r":K(\d+)(?![\d])", subk, RE_WILD.sub(sub, a)) for a in side)))
        return tuple(out)

    def kmap(assign):
        return {t[1:]: "K%d" % assign[t] for t in klabels}   # ':K0' -> 'K1'

    if n_assign > MAX_ASSIGN:
        assign = {t: i for ts in (by_stream[s] for s in streams) for i, t in enumerate(ts)}
        return render(assign) + (kmap(assign),)
    best, best_assign = None, None
    perm_sets = [list(itertools.permutations(range(len(by_stream[s])))) for s in streams]
    for combo in itertools.product(*perm_sets):
        assign = {}
        for s_i, s in enumerate(streams):
            for pos, t in enumerate(by_stream[s]):
                assign[t] = combo[s_i][pos]
        cand = render(assign)
        if best is None or cand < best:
            best, best_assign = cand, assign
    if best is None:
        return (tuple(sorted(lhs)), tuple(sorted(rhs)), {})
    return best + (kmap(best_assign),)


def lift(lhs, rhs, extra_shared=()):
    """Anti-unify one level further: satellite classes appearing on BOTH sides
    become positional variables (``:K0``), so a converse frame pools across
    scenarios — ``(Agent $C $x0:depot)…(Recipient $C $x1:depot)`` and the same
    frame over ``library`` land on one key. One-sided classes (box vs crate)
    stay verbatim: they ARE the candidate. ``extra_shared`` (factor granularity
    only): classes annotated on cross-side-MATCHED satellites lift even when
    one-sided in the diff — a lone twin-event star drags its scenario fillers
    into the diff, but a matched satellite's identity is context, not content."""
    ca = {m.group(2) for a in lhs for m in RE_CLS.finditer(a)}
    cb = {m.group(2) for a in rhs for m in RE_CLS.finditer(a)}
    shared = sorted((ca & cb) | (set(extra_shared) & (ca | cb)))
    if not shared:
        return lhs, rhs, {}
    ren = {cls: "K%d" % i for i, cls in enumerate(shared)}
    def sub(side):
        return tuple(sorted(
            RE_CLS.sub(lambda m: m.group(1) + ":" + ren.get(m.group(2), m.group(2)), a)
            for a in side))
    # witnesses: which concrete class each K stood for in THIS instance — the
    # exporter needs them to tell a true participant variable (many witnesses)
    # from an erased semantic anchor like `decision` (one witness).
    return sub(lhs), sub(rhs), {v: k for k, v in ren.items()}


def align_units(ra, rb, units_a, units_b):
    """Deterministic best assignment on class-abstracted overlap; None = unmatched."""
    if not units_a or not units_b:
        return [(u, None) for u in units_a] + [(None, u) for u in units_b]
    sims = {}
    for x, (ca, ia) in enumerate(units_a):
        siga = ra.sig(ca, ia)
        for y, (cb, ib) in enumerate(units_b):
            sigb = rb.sig(cb, ib)
            sims[(x, y)] = len(siga & sigb) / max(len(siga), len(sigb))
    small, large = (units_a, units_b) if len(units_a) <= len(units_b) else (units_b, units_a)
    flip = len(units_a) > len(units_b)
    best, best_score = None, -1.0
    if len(large) <= 5:
        for perm in itertools.permutations(range(len(large)), len(small)):
            score = sum(
                sims[(i, perm[i])] if not flip else sims[(perm[i], i)]
                for i in range(len(small)))
            if score > best_score:
                best, best_score = perm, score
    else:
        taken, best = set(), []
        order = sorted(
            ((x, y) for x in range(len(units_a)) for y in range(len(units_b))),
            key=lambda xy: (-sims[xy], xy))
        got_a, got_b = set(), set()
        for x, y in order:
            if x in got_a or y in got_b:
                continue
            got_a.add(x)
            got_b.add(y)
            best.append((x, y))
    pairs, used_a, used_b = [], set(), set()
    if isinstance(best, tuple):
        for i in range(len(small)):
            x, y = (i, best[i]) if not flip else (best[i], i)
            if sims[(x, y)] > 0:
                pairs.append((units_a[x], units_b[y]))
                used_a.add(x)
                used_b.add(y)
    else:
        for x, y in best or []:
            if sims[(x, y)] > 0:
                pairs.append((units_a[x], units_b[y]))
                used_a.add(x)
                used_b.add(y)
    out = list(pairs)
    out += [(units_a[x], None) for x in range(len(units_a)) if x not in used_a]
    out += [(None, units_b[y]) for y in range(len(units_b)) if y not in used_b]
    return out


MAX_MERGE_ATOMS = 5


def _merge_satellites(rec, matched, lone, side):
    """Fold an unmatched unit into the matched pair that references its center.

    A nominalized event ("makes a DECISION on the roof") parses as its own
    star, referenced from the host event as a satellite. Left unmatched it
    yields a noise instance, and worse, the oblique that migrated onto it
    drags scenario classes into the host's diff key so nothing pools. Folding
    its atoms into the referencing side makes the light-verb alternation ONE
    instance whose migrated material cancels or lifts.
    """
    still = []
    for center, idxs in lone:
        if len(idxs) > MAX_MERGE_ATOMS:
            still.append((center, idxs))
            continue
        pat = re.compile(r"(?<![\w])" + re.escape(center) + r"(?![\w])")
        host = None
        for m in matched:
            unit = m[side]
            if unit and any(pat.search(rec.atoms[i]["term"]) for i in unit[1]):
                host = m
                break
        if host is None:
            still.append((center, idxs))
            continue
        unit = host[side]
        host[side] = (unit[0], unit[1] + [i for i in idxs if i not in unit[1]])
    return still


def pair_alignment(ra, rb, mode_units):
    """Unit matching for one pair — the shared first half of both granularities."""
    matched, lone_a, lone_b = [], [], []
    kind_units = None
    for mode, ua, ub in mode_units:
        if mode == "kind":
            kind_units = (ua, ub)
            continue
        for a_unit, b_unit in align_units(ra, rb, ua, ub):
            if a_unit and b_unit:
                matched.append([mode, a_unit, b_unit])
            elif a_unit:
                lone_a.append(a_unit)
            else:
                lone_b.append(b_unit)
    lone_a = _merge_satellites(ra, matched, lone_a, 1)
    lone_b = _merge_satellites(rb, matched, lone_b, 2)
    if kind_units and kind_units[0] and kind_units[1]:
        matched.append(["kind", kind_units[0][0], kind_units[1][0]])
    elif kind_units:
        lone_a += kind_units[0]
        lone_b += kind_units[1]
    return matched, lone_a, lone_b


def pair_diffs(ra, rb, mode_units, scalars=True):
    """Yield (mode, lhs_tuple, rhs_tuple) instances for one record pair."""
    matched, lone_a, lone_b = pair_alignment(ra, rb, mode_units)

    for mode, a_unit, b_unit in matched:
        na, nb = shared_names(ra, a_unit[0], a_unit[1], rb, b_unit[0], b_unit[1])
        aa = unit_atoms(ra, a_unit[0], a_unit[1], na, scalars)
        bb = unit_atoms(rb, b_unit[0], b_unit[1], nb, scalars)
        ca, cb = collections.Counter(aa), collections.Counter(bb)
        lhs = tuple(sorted((ca - cb).elements()))
        rhs = tuple(sorted((cb - ca).elements()))
        if lhs or rhs:
            l2, r2, wit = lift(lhs, rhs)
            l3, r3, km = renumber(l2, r2)
            yield mode, l3, r3, {km.get(k, k): cls for k, cls in wit.items()}

    for rec, units, is_a in ((ra, lone_a, True), (rb, lone_b, False)):
        for unit in units:
            sats = rec.sat_roles(unit[0], unit[1])
            names = {}
            counters = collections.Counter()
            for tok in sorted(sats, key=lambda s: (rec.klass.get(s) or "~", s)):
                stream = tok[0]
                cls = rec.klass.get(tok)
                names[tok] = "$%s%d%s" % (stream, counters[stream], ":" + cls if cls else "")
                counters[stream] += 1
            atoms = tuple(sorted(unit_atoms(rec, unit[0], unit[1], names, scalars)))
            yield "lone", (atoms if is_a else ()), (() if is_a else atoms), {}


RE_PAIRVAR = re.compile(r"\$[exf]\d+")
_OPERATORS = None


def _operators():
    global _OPERATORS
    if _OPERATORS is None:
        raw = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                          os.pardir, "specs", "vocabulary.json"),
                             encoding="utf-8"))
        _OPERATORS = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))
    return _OPERATORS


def global_names(ra, rb, matched, lone_a, lone_b):
    """Pair-global token naming: idx maps per side + the inert-name set.

    Matched unit centers share an index (event centers inert, rendered WITHOUT
    class suffix — their class rides the Member atom, wave-1 center style);
    satellites are paired per matched unit by role-signature then class, with
    ONE global counter so a token keeps its index across units; lone units and
    a final sweep name whatever remains, one-sided.
    """
    idx_a, idx_b = {}, {}
    counters = collections.Counter()
    inert = set()
    shared_idx = set()

    def fresh(stream):
        n = counters[stream]
        counters[stream] += 1
        return n

    def assign(tok_a, tok_b):
        if tok_a and tok_b:
            if tok_a in idx_a and tok_b in idx_b:
                return
            if tok_a in idx_a:
                idx_b[tok_b] = idx_a[tok_a]
                shared_idx.add(idx_a[tok_a])
                return
            if tok_b in idx_b:
                idx_a[tok_a] = idx_b[tok_b]
                shared_idx.add(idx_b[tok_b])
                return
            n = fresh(tok_a[0])
            idx_a[tok_a] = (tok_a[0], n)
            idx_b[tok_b] = (tok_b[0], n)
            shared_idx.add((tok_a[0], n))
        elif tok_a and tok_a not in idx_a:
            idx_a[tok_a] = (tok_a[0], fresh(tok_a[0]))
        elif tok_b and tok_b not in idx_b:
            idx_b[tok_b] = (tok_b[0], fresh(tok_b[0]))

    ordered = sorted((m for m in matched if m[0] != "kind"),
                     key=lambda m: (m[0], m[1][0]))
    for mode, (ca, _), (cb, _) in ordered:
        assign(ca, cb)
        if mode == "event":
            inert.add(("a", ca))
            inert.add(("b", cb))
    for mode, (ca, ia), (cb, ib) in ordered:
        sa, sb = ra.sat_roles(ca, ia), rb.sat_roles(cb, ib)
        left_a, left_b = [], []
        for sig in sorted(set(sa.values()) | set(sb.values())):
            la = sorted([s for s, g in sa.items() if g == sig],
                        key=lambda s: (ra.klass.get(s) or "~", s))
            lb = sorted([s for s, g in sb.items() if g == sig],
                        key=lambda s: (rb.klass.get(s) or "~", s))
            for pos in range(min(len(la), len(lb))):
                assign(la[pos], lb[pos])
            left_a += la[len(lb):]
            left_b += lb[len(la):]
        rest_b = list(left_b)
        for tok_a in sorted(left_a, key=lambda s: (ra.klass.get(s) or "~", s)):
            cls_a = ra.klass.get(tok_a)
            match = next((t for t in rest_b
                          if t[0] == tok_a[0] and rb.klass.get(t) == cls_a and cls_a), None)
            if match:
                rest_b.remove(match)
                assign(tok_a, match)
            else:
                assign(tok_a, None)
        for tok_b in rest_b:
            assign(None, tok_b)
    for units, is_a in ((lone_a, True), (lone_b, False)):
        for center, idxs in sorted(units):
            rec = ra if is_a else rb
            toks = [center] if RE_SKOLEM_FULL.match(center) else []
            toks += sorted(rec.sat_roles(center, idxs),
                           key=lambda s: (rec.klass.get(s) or "~", s))
            for tok in toks:
                assign(tok if is_a else None, None if is_a else tok)
    return idx_a, idx_b, inert, shared_idx


def _render_side(rec, idxs, idx_map, no_class, scalars):
    """Rendered multiset of one side's unit-covered atoms under global names."""
    names = {}
    for tok, (stream, n) in idx_map.items():
        cls = rec.klass.get(tok)
        suffix = ":" + cls if cls and tok not in no_class else ""
        names[tok] = "$%s%d%s" % (stream, n, suffix)
    return [abstract(rec.atoms[i]["term"], rec.atoms[i]["stv"], "\x00none",
                     names, scalars)
            for i in sorted(idxs)]


def _connectors(text, inert_names):
    out = {m.group(0) for m in RE_PAIRVAR.finditer(text)} - inert_names
    ops = _operators()
    for tok in re.findall(r"(?<![\w$<\"])[a-z][a-z0-9_]*(?![\w])", RE_STR.sub("", text)):
        if tok not in ops and not RE_SKOLEM_FULL.match(tok):
            out.add(tok)
    return out


def pair_components(ra, rb, mode_units, scalars=True):
    """Factor-granularity instances: connected components of the pooled pair diff.

    Returns (components, n_components) — each component (lhs, rhs, kwit) after
    lift + renumber, exactly the unit pipeline's abstraction steps.
    """
    matched, lone_a, lone_b = pair_alignment(ra, rb, mode_units)
    idx_a, idx_b, inert, shared_idx = global_names(ra, rb, matched, lone_a, lone_b)
    no_class_a = {tok for side, tok in inert if side == "a"}
    no_class_b = {tok for side, tok in inert if side == "b"}
    for units, bucket in ((lone_a, no_class_a), (lone_b, no_class_b)):
        for center, _ in units:
            if RE_SKOLEM_FULL.match(center) and center[0] == "e":
                bucket.add(center)

    def covered(matched_side, lones):
        idxs = set()
        for m in matched:
            unit = m[matched_side]
            if unit:
                idxs.update(unit[1])
        for _, ui in lones:
            idxs.update(ui)
        return idxs

    aa = _render_side(ra, covered(1, lone_a), idx_a, no_class_a, scalars)
    bb = _render_side(rb, covered(2, lone_b), idx_b, no_class_b, scalars)
    ca, cb = collections.Counter(aa), collections.Counter(bb)
    lhs_atoms = sorted((ca - cb).elements())
    rhs_atoms = sorted((cb - ca).elements())
    if not lhs_atoms and not rhs_atoms:
        return [], 0

    inert_names = {"$%s%d" % v for tok, v in idx_a.items() if ("a", tok) in inert}
    inert_names |= {"$%s%d" % v for tok, v in idx_b.items() if ("b", tok) in inert}
    entries = [("L", t) for t in lhs_atoms] + [("R", t) for t in rhs_atoms]
    conns = [_connectors(t, inert_names) for _, t in entries]
    parent = list(range(len(entries)))

    def find(i):
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i

    by_conn = collections.defaultdict(list)
    for i, cs in enumerate(conns):
        for c in cs:
            by_conn[c].append(i)
    for c in sorted(by_conn):
        group = by_conn[c]
        for j in group[1:]:
            ri, rj = find(group[0]), find(j)
            if ri != rj:
                parent[max(ri, rj)] = min(ri, rj)

    comps = collections.defaultdict(lambda: ([], []))
    for i, (side, t) in enumerate(entries):
        comps[find(i)][0 if side == "L" else 1].append(t)
    out = []
    for root in sorted(comps):
        lhs, rhs = comps[root]
        extra = set()
        for t in itertools.chain(lhs, rhs):
            for m in RE_CLS.finditer(t):
                sm = re.match(r"\$([exf])(\d+)\Z", m.group(1))
                if sm and (sm.group(1), int(sm.group(2))) in shared_idx:
                    extra.add(m.group(2))
        l2, r2, wit = lift(tuple(sorted(lhs)), tuple(sorted(rhs)), extra)
        l3, r3, km = renumber(l2, r2)
        out.append((l3, r3, {km.get(k, k): cls for k, cls in wit.items()}))
    return out, len(out)


def classify(lhs, rhs, roles):
    toks = lambda a: re.findall(r"[^\s()]+", a)
    if len(lhs) == 1 and len(rhs) == 1:
        ta, tb = toks(lhs[0]), toks(rhs[0])
        if len(ta) == len(tb):
            diffs = [i for i in range(len(ta)) if ta[i] != tb[i]]
            if len(diffs) == 1:
                i = diffs[0]
                a, b = ta[i], tb[i]
                if i == 0 and a in roles and b in roles:
                    return "slot-merge", tuple(sorted((a, b)))
                if a.startswith("$") and b.startswith("$") and ":" in a and ":" in b \
                        and a.split(":")[0] == b.split(":")[0]:
                    return "lexical-collapse", tuple(sorted((a.split(":", 1)[1],
                                                             b.split(":", 1)[1])))
                if not a.startswith(("$", "<")) and not b.startswith(("$", "<")):
                    return "lexical-collapse", tuple(sorted((a, b)))
    joined = " ".join(lhs) + " " + " ".join(rhs)
    if lhs and rhs and [a.replace(" ~NEG", "") for a in lhs] == \
            [b.replace(" ~NEG", "") for b in rhs]:
        return "polarity-diff", None
    return "structural-alt", None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+")
    ap.add_argument("--corpus", action="append", required=True)
    ap.add_argument("--slots", default=None, help="out/slots.jsonl for cross-method annotation")
    ap.add_argument("--min-support", type=int, default=2)
    ap.add_argument("--out-dir", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "out"))
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    vocab = C.load_vocabulary()
    raw = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                      os.pardir, "specs", "vocabulary.json"), encoding="utf-8"))
    roles = {n for n, e in raw["operators"].items() if e.get("class") == "role"}

    meta = {}
    for path in args.corpus:
        for r in load(path):
            meta[r["id"]] = r
    recs, versions = {}, set()
    for path in args.canonical:
        for r in load(path):
            versions.add(r.get("schema"))
            if r["id"] not in recs:
                recs[r["id"]] = Rec(r, vocab, roles)
    if len(versions) > 1:
        raise SystemExit(f"REFUSED: mixed canon versions {sorted(versions)}")

    # ---- pair lists --------------------------------------------------------
    by_class = collections.defaultdict(list)
    for cid, rec in recs.items():
        m = meta.get(cid)
        if m and m.get("equiv_class"):
            by_class[m["equiv_class"]].append(cid)
    pos_pairs, ctl_pairs, seen_sig = [], [], set()
    for ec in sorted(by_class):
        ids = sorted(by_class[ec])
        if ec.startswith(("pairC", "pairD")):   # tierC PAWS + tierD MRPC (G.6) pair corpora
            sides = {meta[i]["labels"].get("side"): i for i in ids}
            if meta[ids[0]]["labels"].get("pair_kind") != "paraphrase":
                continue
            if "a" in sides and "b" in sides:
                sig = frozenset((meta[sides["a"]]["input_sha256"],
                                 meta[sides["b"]]["input_sha256"]))
                if sig in seen_sig:
                    continue
                seen_sig.add(sig)
                pos_pairs.append((ec, sides["a"], sides["b"]))
            continue
        same = [i for i in ids if meta[i]["labels"].get("polarity") == "same"]
        diff = [i for i in ids if meta[i]["labels"].get("polarity") == "different"]
        for a, b in itertools.combinations(same, 2):
            pos_pairs.append((ec, a, b))
        for a in same:
            for b in diff:
                ctl_pairs.append((ec, a, b))

    # ---- mine --------------------------------------------------------------
    def mine(pairs, scalars=True):
        agg = collections.defaultdict(lambda: {
            "classes": set(), "occ": 0, "examples": [], "modes": collections.Counter()})
        identical = 0
        sole_keys = set()          # unit keys that were some pair's ONLY diff
        factor_sole = set()        # (s1, s2) of single-component pairs
        for ec, ia, ib in pairs:
            ra, rb = recs[ia], recs[ib]
            if ra.graph_id == rb.graph_id:
                identical += 1
                continue
            mode_units = (("event", ra.events, rb.events),
                          ("entity", ra.entities, rb.entities),
                          ("kind", [("\x00k", ra.kind)] if ra.kind else [],
                                   [("\x00k", rb.kind)] if rb.kind else []))
            pair_keys = []
            for mode, lhs, rhs, kwit in pair_diffs(ra, rb, mode_units, scalars):
                s1, s2 = (lhs, rhs) if (lhs, rhs) <= (rhs, lhs) else (rhs, lhs)
                pair_keys.append((mode, s1, s2))
                e = agg[(mode, s1, s2)]
                e["classes"].add(ec)
                e["occ"] += 1
                for k, cls in kwit.items():
                    e.setdefault("kwit", collections.defaultdict(collections.Counter))[k][cls] += 1
                if len(e["examples"]) < 3:
                    e["examples"].append(f"{ia}|{ib}")
            if len(pair_keys) == 1:
                sole_keys.add(pair_keys[0])
            comps, n_comp = pair_components(ra, rb, mode_units, scalars)
            for lhs, rhs, kwit in comps:
                s1, s2 = (lhs, rhs) if (lhs, rhs) <= (rhs, lhs) else (rhs, lhs)
                e = agg[("factor", s1, s2)]
                e["classes"].add(ec)
                e["occ"] += 1
                for k, cls in kwit.items():
                    e.setdefault("kwit", collections.defaultdict(collections.Counter))[k][cls] += 1
                if len(e["examples"]) < 3:
                    e["examples"].append(f"{ia}|{ib}")
                if n_comp == 1:
                    factor_sole.add((s1, s2))
        return agg, identical, sole_keys, factor_sole

    pos, pos_identical, _, pos_factor_sole = mine(pos_pairs)
    # A control pair flags a key only when that key is the pair's SOLE diff:
    # only then would rewriting it make a meaning-different pair converge. A
    # control differing in the candidate AND elsewhere (quantity, modality)
    # is not evidence against the candidate — the meaning change is carried
    # by the other diff. Scalars stay exact here so that other diff EXISTS.
    _, _, ctl_keys, ctl_factor_sole = mine(ctl_pairs, scalars=False)
    ctl_texts = {(s1, s2) for _, s1, s2 in ctl_keys} | ctl_factor_sole

    rows = []
    for key, e in pos.items():
        mode, s1, s2 = key
        support = len(e["classes"])
        if support < args.min_support:
            continue
        kind, pair = classify(s1, s2, roles)
        row = {
            "mode": mode, "lhs": list(s1), "rhs": list(s2), "kind": kind,
            "symbol_pair": list(pair) if pair else None,
            "support": support, "occurrences": e["occ"],
            "granularity": "factor" if mode == "factor" else "unit",
            "classes": sorted(e["classes"]),
            "k_witnesses": {k: dict(sorted(c.items(), key=lambda kv: (-kv[1], kv[0])))
                            for k, c in sorted(e.get("kwit", {}).items())},
            "examples": e["examples"],
        }
        if mode == "factor":
            row["fires_on_control"] = (s1, s2) in ctl_texts
            row["attested_sole"] = (s1, s2) in pos_factor_sole
            row["promotable"] = row["attested_sole"] and not row["fires_on_control"]
        else:
            row["fires_on_control"] = key in ctl_keys
        rows.append(row)
    rows.sort(key=lambda r: (-r["support"], r["granularity"], r["kind"], r["lhs"], r["rhs"]))
    for n, r in enumerate(rows, 1):
        r["rule_id"] = "au%04d" % n
    unit_texts = {(tuple(r["lhs"]), tuple(r["rhs"])) for r in rows
                  if r["granularity"] == "unit"}
    for r in rows:
        if r["granularity"] == "factor":
            r["duplicates_unit"] = (tuple(r["lhs"]), tuple(r["rhs"])) in unit_texts

    # ---- slot-cosine annotation (cross-method consensus preview) -----------
    slot_vec = {}
    if args.slots and os.path.exists(args.slots):
        for s in load(args.slots):
            slot_vec[(s["event_class"], s["role"])] = collections.Counter(s["fillers"])
    for r in rows:
        r["slot_cosine"] = None
        if r["kind"] == "lexical-collapse" and r["symbol_pair"] and slot_vec:
            a, b = r["symbol_pair"]
            cos_list = []
            for (ev, role), va in slot_vec.items():
                if ev != a:
                    continue
                vb = slot_vec.get((b, role))
                if vb and sum(va.values()) >= 3 and sum(vb.values()) >= 3:
                    cos_list.append(cosine(va, vb))
            if cos_list:
                r["slot_cosine"] = round(sum(cos_list) / len(cos_list), 3)

    os.makedirs(args.out_dir, exist_ok=True)
    with open(os.path.join(args.out_dir, "align_rules.jsonl"), "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    n_sig = 0
    with open(os.path.join(args.out_dir, "align_signals.jsonl"), "w", encoding="utf-8") as fh:
        for r in rows:
            if r["fires_on_control"] or r["kind"] == "polarity-diff":
                continue
            if r["granularity"] == "factor" and (
                    not r["promotable"] or r["duplicates_unit"]):
                continue
            n_sig += 1
            fh.write(json.dumps({
                "candidate": {"rule_id": r["rule_id"], "lhs": r["lhs"], "rhs": r["rhs"],
                              "mode": r["mode"], "symbol_pair": r["symbol_pair"]},
                # monotone support squash, not calibrated; slot_cosine is the
                # cross-method (§4.3.2) corroboration where available.
                "confidence": round(r["support"] / (r["support"] + 10.0), 3),
                "kind": r["kind"], "support": r["support"],
                "slot_cosine": r["slot_cosine"], "examples": r["examples"],
                "granularity": r["granularity"],
                "method": "paraphrase-align-4.3.4" if r["granularity"] == "unit"
                          else "paraphrase-align-4.3.4-factor",
            }, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- target-rule recovery ----------------------------------------------
    targets = collections.defaultdict(set)
    for cid, m in meta.items():
        tr = m.get("labels", {}).get("target_rule")
        if tr and cid in recs:
            targets[tr].add(m["equiv_class"])
    recovery, alt_rows = [], []
    word = lambda w, text: re.search(r"(?<![\w])" + re.escape(w) + r"(?![\w])", text)
    for tr in sorted(targets):
        if tr.startswith("alt:"):
            # only pairs where BOTH members belong to this target (or are the
            # base) — a class hosts several targets, and counting its lexical
            # variants here dilutes the identical-rate the alt targets predict.
            ecs = targets[tr]
            ps = [(ec, a, b) for ec, a, b in pos_pairs if ec in ecs
                  and all(meta[i]["labels"].get("target_rule") in (None, tr) for i in (a, b))]
            ident = sum(1 for ec, a, b in ps if recs[a].graph_id == recs[b].graph_id)
            alt_rows.append({"target": tr, "pairs": len(ps), "identical": ident})
            continue
        sep = "<-" if "<-" in tr else "~"
        x, y = tr.split(sep)
        parts = [p for p in y.split("_") if p not in STOP]
        hit = None
        for r in rows:
            if r["fires_on_control"]:
                continue
            t1, t2 = " ".join(r["lhs"]), " ".join(r["rhs"])
            for u, v in ((t1, t2), (t2, t1)):
                # a fused surface symbol (give_up, kick_the_bucket) matches
                # whole; a decomposed light-verb matches by content parts
                if word(x, u) and (word(y, v) or all(word(p, v) for p in parts)):
                    hit = r["rule_id"] + (" (factor)" if r["granularity"] == "factor" else "")
                    break
            if hit:
                break
        if hit is None:
            # provenance fallback: a rule pooled from >=2 of this target's own
            # classes recovered it even when anti-unification cancelled the
            # shared lexeme out of the diff (take-/cause-wrapper rules)
            for r in rows:
                if not r["fires_on_control"] \
                        and len(set(r["classes"]) & targets[tr]) >= 2:
                    hit = r["rule_id"] + " (prov" + \
                        (", factor)" if r["granularity"] == "factor" else ")")
                    break
        recovery.append({"target": tr, "recovered_by": hit, "classes": len(targets[tr])})
    n_rec = sum(1 for r in recovery if r["recovered_by"])

    # ---- report -------------------------------------------------------------
    units_only = [r for r in rows if r["granularity"] == "unit"]
    factors = [r for r in rows if r["granularity"] == "factor"]
    kinds = collections.Counter(r["kind"] for r in units_only if not r["fires_on_control"])
    n_ctl = sum(1 for r in units_only if r["fires_on_control"])
    n_fac_ctl = sum(1 for r in factors if r["fires_on_control"])
    n_promotable = sum(1 for r in factors if r.get("promotable") and not r["duplicates_unit"])
    n_dup = sum(1 for r in factors if r["duplicates_unit"])
    L = []
    L.append("# §4.3.4 paraphrase alignment + anti-unification — item E (factoring)\n")
    L.append(f"- positive pairs: {len(pos_pairs)} (Tier A same-polarity within class + Tier C"
             f" complete pairs); identical parses among them: {pos_identical}")
    L.append(f"- control pairs mined: {len(ctl_pairs)} (Tier A same x different polarity)")
    L.append(f"- anti-unified UNIT rules (support>={args.min_support}): **{len(units_only)}**"
             f" — kinds {dict(sorted(kinds.items()))}; flagged fires_on_control: **{n_ctl}**;"
             f" signals: **{n_sig}** (unit + promotable factor)")
    L.append(f"- FACTOR rules (§4 factoring): **{len(factors)}** — {n_dup} duplicate a unit"
             f" key, {n_fac_ctl} fire on control, **{n_promotable}** promotable"
             f" (sole-diff-attested, control-clean, non-duplicate); the rest await judges")
    ctl_lex = sorted({" / ".join(k[1] + ("<->",) + k[2]) for k in ctl_keys
                      if len(k[1]) == 1 and len(k[2]) == 1})
    L.append(f"- control machinery evidence: {len(ctl_keys)} sole-diff control keys mined"
             f" (a flag fires only when a candidate equals one); e.g. "
             + "; ".join(f"`{s}`" for s in ctl_lex[:3]))
    L.append(f"- target-rule recovery: **{n_rec}/{len(recovery)}** lexical/converse targets"
             f" (alt:* reported separately below)\n")

    def table(title, sel, n=25):
        L.append(f"## {title}\n")
        L.append("| support | kind | slot-cos | LHS | RHS |\n|---|---|---|---|---|")
        for r in sel[:n]:
            L.append("| %d (%d×) | %s%s%s | %s | %s | %s |" % (
                r["support"], r["occ"] if "occ" in r else r["occurrences"], r["kind"],
                " ⚠CTL" if r["fires_on_control"] else "",
                " ✓" if r.get("promotable") and not r.get("duplicates_unit") else "",
                "%.2f" % r["slot_cosine"] if r["slot_cosine"] is not None else "—",
                "<br>".join("`%s`" % a for a in r["lhs"]) or "∅",
                "<br>".join("`%s`" % a for a in r["rhs"]) or "∅"))
        L.append("")

    table("Lexical-collapse candidates",
          [r for r in units_only if r["kind"] == "lexical-collapse" and not r["fires_on_control"]])
    table("Slot-merge candidates",
          [r for r in units_only if r["kind"] == "slot-merge" and not r["fires_on_control"]], 10)
    table("Structural alternations",
          [r for r in units_only if r["kind"] == "structural-alt" and not r["fires_on_control"]], 20)
    table("Factor candidates (non-duplicate; ✓ = promotable)",
          sorted([r for r in factors if not r["duplicates_unit"] and not r["fires_on_control"]],
                 key=lambda r: (-r.get("promotable", False), -r["support"],
                                r["lhs"], r["rhs"])), 25)
    table("Flagged by negative controls (kept OUT of signals)",
          [r for r in rows if r["fires_on_control"]], 15)

    L.append("## Target-rule recovery\n")
    L.append("| target | classes | recovered by |\n|---|---|---|")
    for r in recovery:
        L.append(f"| {r['target']} | {r['classes']} | {r['recovered_by'] or '**MISS**'} |")
    L.append("\n## alt:* targets (expect identical parses, nothing to mine)\n")
    L.append("| target | pairs | identical |\n|---|---|---|")
    for r in alt_rows:
        L.append(f"| {r['target']} | {r['pairs']} | {r['identical']} |")

    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {os.path.join(args.out_dir, 'align_rules.jsonl')}  ({len(rows)} rules)")
    print(f"-> {os.path.join(args.out_dir, 'align_signals.jsonl')}  ({n_sig} signals)")
    print(f"pairs {len(pos_pairs)}+{len(ctl_pairs)}ctl  rules {len(rows)}  ctl-flagged {n_ctl}  "
          f"recovery {n_rec}/{len(recovery)}")


if __name__ == "__main__":
    main()
