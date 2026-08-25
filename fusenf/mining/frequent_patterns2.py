"""FUSE-NF §4.3.1 upgrade — ``frequent_patterns2`` (batch 2, item E).

Ben-faithful pattern miner per ``PATTERN_MINER_STUDY.md`` §3a: the batch-1
``frequent_stars`` fragment generalized to (1) the **shape stratum** via
constant-lifting (shallow abstraction) and (2) **bounded conjunction
expansion** — connected multi-clause patterns with NO privileged center —
plus (3) **nisurp** interestingness from sub-pattern supports, and (4) the
**valuation exports** the other §4.3 miners consume.

Pattern language. A pattern is a conjunction of clauses over shared
variables. Skolems render as per-stream variables (``$e0``/``$x0``/``$f0``)
with canonical numbering (minimum over per-stream permutations — identity
never depends on which skolem the canonicalizer called e0). Unlike batch 1
there is no ``$C``: single-center stars are just the special case where one
variable occurs in every clause (``mode: star``); skolem-free patterns are
``kindlevel``; everything else — the new capability — is ``cross``.

Connectivity: two atoms connect iff they share a skolem OR a content
constant. The second clause is deliberate: the twin-event correspondence
("Ana and Bo work on the mural" distributes to two events sharing verb and
Theme) is reachable only through the shared-constant edge.

Class annotations are GONE (batch-1 ``$x0:pie``): a satellite's class is an
explicit ``(Member $x0 pie)`` clause when the subset includes it — types are
clauses, per Ben's conception. Conjunction expansion at k>=3 subsumes the
light-verb shortcut the annotations existed for.

Shallow abstraction / lifting: content constants (lowercase symbols that are
not vocabulary operators) may lift to ``$v#`` variables, per distinct VALUE —
all occurrences at once, so co-reference survives and connectivity is
preserved (``(Member $e0 $v0) (Member $e1 $v0)`` = "two events with the SAME
verb"). Masks over a subset's liftable values span the lattice from fully
constant (batch-1 stratum) to fully lifted (shape). A-priori pruning is
top-down and sound: the all-lifted shape is the most general mask, so if it
misses min-support every intermediate mask does too; pass 1 counts only the
constant and shape masks, pass 2 re-enumerates and emits intermediate masks
for frequent shapes only.

Surprisingness (wiki formulas): for a multi-clause pattern,
``isurp = max(P - maxP, minP - P)`` where max/min range over set partitions
of the clauses into CONNECTED blocks (each block's own doc-frequency is in
the aggregate by construction; partitions with disconnected blocks are
skipped — their independence estimate is the refined partition's, already
ranged over). ``nisurp = isurp / P``. Ranking input for judge attention on
equivalence candidates ONLY (§3a: packs keep marginal-MDL; and in-corpus
surprise cannot tell world-facts from corpus artifacts — it never replaces
judges).

Standing invariants kept: DOCUMENT support primary (occurrences secondary),
determinism absolute (sorted iteration, no clock, no randomness), ``~NEG``
strength marker (a denial never pools with its positive twin), ``<num>``/
``<str>`` wildcards, surface-record and Implication atoms excluded,
mixed-canon refusal.

Exports:
  * ``patterns2.jsonl``   — the inventory; full supporting-id lists (the
                            record×feature matrix substrate for §4.3.3/5).
  * ``valuations_slots.jsonl`` — per (center kind, center class, head,
                            filler) counts with NO support floor: §4.3.2's
                            substrate for free, events AND entities.
  * ``patterns2_signals.jsonl`` — consensus-layer signals (star patterns as
                            subtree-collapse, cross patterns as conj-pattern).

Usage:
  python frequent_patterns2.py ../canonical/tierA.canon.jsonl [more ...] \
      [--k 3] [--min-support 3] [--out-dir out_e] [--report ../eval/...]
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "harness"))
import canonicalize as C  # noqa: E402

RE_SKOLEM = re.compile(r"(?<![\w$])([exf])(\d+)(?![\w])")
RE_NUM = re.compile(r"(?<![\w$])[+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?(?![\w])")
RE_STR = re.compile(r'"[^"]*"')
RE_CONTENT = re.compile(r"(?<![\w$<\"])[a-z][a-z0-9_]*(?![\w])")
RE_PVAR = re.compile(r"\$([exfv])(\d+)(?![\w])")

MAX_REC_ATOMS = 28      # eligible atoms per record before subset enumeration
MAX_LIFT_VALUES = 5     # liftable values per subset entering the mask lattice
MAX_ASSIGN = 5040       # per-stream permutation product cap (batch-1 value)

TIER_RE = re.compile(r"^(tier[A-Z]|pilot|probe)")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def tier_of(cid):
    m = TIER_RE.match(cid)
    return m.group(1) if m else "?"


def content_symbols(text, operators):
    """Content constants of one canonical term text (strings stripped first)."""
    out = set()
    for tok in RE_CONTENT.findall(RE_STR.sub("", text)):
        if tok in operators or RE_SKOLEM.fullmatch(tok):
            continue
        out.add(tok)
    return out


def render_pattern(terms_stvs, skolem_names, mask_values):
    """Render one subset under a fixed skolem naming + lift mask.

    Lifted values become ``$v#`` numbered by first occurrence in the SORTED
    clause tuple (two-step: placeholder render -> sort -> number -> resort),
    so the numbering is a function of the pattern, not of the instance.
    """
    lifted = {v: "\x01%d\x01" % i for i, v in enumerate(sorted(mask_values))}

    def sub_skolem(m):
        return skolem_names.get(m.group(0), m.group(0))

    prelim = []
    for term, stv in terms_stvs:
        t = RE_SKOLEM.sub(sub_skolem, term)
        t = RE_STR.sub("<str>", t)
        t = RE_NUM.sub("<num>", t)
        for v in sorted(mask_values, key=lambda s: (-len(s), s)):
            t = re.sub(r"(?<![\w$<\"])" + re.escape(v) + r"(?![\w])", lifted[v], t)
        prelim.append(t + (" ~NEG" if stv[0] < 0.5 else ""))
    prelim.sort()
    order = {}
    for t in prelim:
        for m in re.finditer(r"\x01(\d+)\x01", t):
            if m.group(1) not in order:
                order[m.group(1)] = len(order)
    final = tuple(sorted(
        re.sub(r"\x01(\d+)\x01", lambda m: "$v%d" % order[m.group(1)], t)
        for t in prelim))
    return final


def canonical_pattern2(terms_stvs, mask_values):
    """Minimal rendering over per-stream skolem permutations, mask applied."""
    skolems = collections.OrderedDict()
    for term, _ in terms_stvs:
        for m in RE_SKOLEM.finditer(term):
            if m.group(0) not in skolems:
                skolems[m.group(0)] = m.group(1)
    by_stream = collections.defaultdict(list)
    for tok, stream in skolems.items():
        by_stream[stream].append(tok)
    n_assign = 1
    for toks in by_stream.values():
        for i in range(2, len(toks) + 1):
            n_assign *= i
    streams = sorted(by_stream)

    def names_for(assign):
        return {tok: "$%s%d" % (skolems[tok], assign[tok]) for tok in skolems}

    if n_assign > MAX_ASSIGN:
        assign = {}
        for stream in streams:
            for i, tok in enumerate(by_stream[stream]):
                assign[tok] = i
        return render_pattern(terms_stvs, names_for(assign), mask_values)

    best = None
    perm_sets = [list(itertools.permutations(range(len(by_stream[s])))) for s in streams]
    for combo in itertools.product(*perm_sets):
        assign = {}
        for s_i, stream in enumerate(streams):
            for pos, tok in enumerate(by_stream[stream]):
                assign[tok] = combo[s_i][pos]
        cand = render_pattern(terms_stvs, names_for(assign), mask_values)
        if best is None or cand < best:
            best = cand
    return best


def canonical_pattern_text(clauses, operators):
    """Canonicalize a pattern given only its clause TEXTS (for block lookup).

    Streams e/x/f renumber by minimal rendering; ``$v`` renumbers by first
    occurrence in the sorted result — reproducing exactly the key the block
    would have received as a mined instance.
    """
    toks = collections.OrderedDict()
    for cl in clauses:
        for m in RE_PVAR.finditer(cl):
            if m.group(1) != "v" and m.group(0) not in toks:
                toks[m.group(0)] = m.group(1)
    by_stream = collections.defaultdict(list)
    for tok, stream in toks.items():
        by_stream[stream].append(tok)
    streams = sorted(by_stream)

    def render(assign):
        prelim = []
        for cl in clauses:
            t = RE_PVAR.sub(
                lambda m: ("$%s%d" % (m.group(1), assign[m.group(0)]))
                if m.group(1) != "v" else ("\x01" + m.group(2) + "\x01"), cl)
            prelim.append(t)
        prelim.sort()
        order = {}
        for t in prelim:
            for m in re.finditer(r"\x01(\d+)\x01", t):
                if m.group(1) not in order:
                    order[m.group(1)] = len(order)
        return tuple(sorted(
            re.sub(r"\x01(\d+)\x01", lambda m: "$v%d" % order[m.group(1)], t)
            for t in prelim))

    n_assign = 1
    for ts in by_stream.values():
        for i in range(2, len(ts) + 1):
            n_assign *= i
    if n_assign > MAX_ASSIGN:
        assign = {t: i for ts in (by_stream[s] for s in streams) for i, t in enumerate(ts)}
        return render(assign)
    best = None
    perm_sets = [list(itertools.permutations(range(len(by_stream[s])))) for s in streams]
    for combo in itertools.product(*perm_sets):
        assign = {}
        for s_i, s in enumerate(streams):
            for pos, t in enumerate(by_stream[s]):
                assign[t] = combo[s_i][pos]
        cand = render(assign)
        if best is None or cand < best:
            best = cand
    return best


def clause_connectors(clause, operators):
    """Connector tokens of one rendered clause: pattern vars + content constants."""
    out = {m.group(0) for m in RE_PVAR.finditer(clause)}
    out |= content_symbols(clause, operators)
    return out


def connected_blocks_ok(clauses, block, operators):
    """Is this block of clause indices connected (shared var or constant)?"""
    if len(block) == 1:
        return True
    conns = {i: clause_connectors(clauses[i], operators) for i in block}
    remaining = set(block)
    frontier = [block[0]]
    remaining.discard(block[0])
    while frontier:
        cur = frontier.pop()
        for j in sorted(remaining):
            if conns[cur] & conns[j]:
                remaining.discard(j)
                frontier.append(j)
    return not remaining


def set_partitions(items):
    """All set partitions of a list (n<=4 in practice)."""
    if not items:
        yield []
        return
    first, rest = items[0], items[1:]
    for part in set_partitions(rest):
        for i in range(len(part)):
            yield part[:i] + [[first] + part[i]] + part[i + 1:]
        yield [[first]] + part


class Enumerator:
    """Connected-subset enumeration over one record's eligible atoms."""

    def __init__(self, rec, operators, surface, keep_surface):
        self.catoms = rec["atoms"]
        heads = [C.parse_term(a["term"])[0] for a in self.catoms]
        self.idxs = [i for i, a in enumerate(self.catoms)
                     if heads[i] != "Implication"
                     and (keep_surface or heads[i] not in surface)]
        self.truncated = len(self.idxs) > MAX_REC_ATOMS
        self.idxs = self.idxs[:MAX_REC_ATOMS]
        self.conn = {}
        for i in self.idxs:
            t = self.catoms[i]["term"]
            toks = {m.group(0) for m in RE_SKOLEM.finditer(t)}
            toks |= content_symbols(t, operators)
            self.conn[i] = toks

    def connected(self, subset):
        if len(subset) == 1:
            return True
        remaining = set(subset)
        frontier = [subset[0]]
        remaining.discard(subset[0])
        while frontier:
            cur = frontier.pop()
            for j in sorted(remaining):
                if self.conn[cur] & self.conn[j]:
                    remaining.discard(j)
                    frontier.append(j)
        return not remaining

    def subsets(self, k):
        for size in range(1, min(k, len(self.idxs)) + 1):
            for combo in itertools.combinations(self.idxs, size):
                if self.connected(list(combo)):
                    yield combo

    def liftables(self, combo, operators):
        vals = set()
        for i in combo:
            vals |= content_symbols(self.catoms[i]["term"], operators)
        return sorted(vals)[:MAX_LIFT_VALUES]

    def terms_stvs(self, combo):
        return [(self.catoms[i]["term"], self.catoms[i]["stv"]) for i in combo]


def pattern_mode(key):
    """star: one skolem var in every clause; kindlevel: no skolem vars; else cross."""
    per_clause = []
    any_skolem = False
    for cl in key:
        vs = {m.group(0) for m in RE_PVAR.finditer(cl) if m.group(1) != "v"}
        per_clause.append(vs)
        any_skolem = any_skolem or bool(vs)
    if not any_skolem:
        return "kindlevel"
    common = set.intersection(*per_clause) if per_clause else set()
    return "star" if common else "cross"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+")
    ap.add_argument("--k", type=int, default=3,
                    help="max clauses per pattern (study §3a: bounded n<=3-4)")
    ap.add_argument("--min-support", type=int, default=3,
                    help="min DOCUMENT support")
    ap.add_argument("--out-dir", default=os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "out_e"))
    ap.add_argument("--report", default=None)
    ap.add_argument("--keep-surface", action="store_true")
    args = ap.parse_args()

    vocab = C.load_vocabulary()
    surface = vocab["surface_record"]
    raw = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                      os.pardir, "specs", "vocabulary.json"), encoding="utf-8"))
    operators = set(raw["operators"]) | set(raw.get("deprecated_operators", {}))

    records, seen_ids, dup, versions = [], set(), 0, set()
    for path in args.canonical:
        for r in load(path):
            versions.add(r.get("schema"))
            if r["id"] in seen_ids:
                dup += 1
                continue
            seen_ids.add(r["id"])
            records.append(r)
    if len(versions) > 1:
        raise SystemExit(f"REFUSED: mixed canon versions {sorted(versions)} — regenerate first.")
    n_docs = len(records)

    # ---- valuation-slot export (no support floor; events AND entities) -----
    slots = {}
    for rec in records:
        star_class = {s: st.get("class") for s, st in rec["stars"].items()}
        parsed = [C.parse_term(a["term"]) for a in rec["atoms"]]
        for sym, star in sorted(rec["stars"].items()):
            if star["kind"] not in ("event", "entity") or not re.fullmatch(r"[exf]\d+", sym):
                continue
            cls = star.get("class") or "<unclassed>"
            for i in star["atoms"]:
                t = parsed[i]
                if len(t) != 3 or t[1] != sym or t[0] == "Implication" or t[0] in surface:
                    continue
                arg = t[2]
                if isinstance(arg, list):
                    filler = "<term:%s>" % arg[0]
                elif re.fullmatch(r"[exf]\d+", arg):
                    filler = star_class.get(arg) or "<untyped>"
                elif arg.startswith('"'):
                    filler = "<str>"
                elif re.fullmatch(r"[+-]?\d+(?:\.\d+)?", arg):
                    filler = "<num>"
                else:
                    filler = arg
                key = (star["kind"], cls, t[0], filler)
                e = slots.setdefault(key, {"n": 0, "ids": set()})
                e["n"] += 1
                e["ids"].add(rec["id"])

    # ---- pass 1: constant + shape masks ------------------------------------
    agg = {}
    truncated_records = 0
    enums = []

    def feed(key, cid, terms_stvs, n_lifted):
        entry = agg.get(key)
        if entry is None:
            entry = agg[key] = {
                "size": len(key), "n_lifted": n_lifted,
                "ids": set(), "occurrences": 0,
                "s_sum": 0.0, "c_sum": 0.0, "n_tv": 0,
            }
        entry["ids"].add(cid)
        entry["occurrences"] += 1
        for _, stv in terms_stvs:
            entry["s_sum"] += stv[0]
            entry["c_sum"] += stv[1]
            entry["n_tv"] += 1

    for rec in records:
        en = Enumerator(rec, operators, surface, args.keep_surface)
        if en.truncated:
            truncated_records += 1
        enums.append((rec["id"], en))
        for combo in en.subsets(args.k):
            ts = en.terms_stvs(combo)
            feed(canonical_pattern2(ts, ()), rec["id"], ts, 0)
            vals = en.liftables(combo, operators)
            if vals:
                feed(canonical_pattern2(ts, tuple(vals)), rec["id"], ts, len(vals))

    # ---- pass 2: intermediate masks for frequent shapes --------------------
    frequent_shapes = {k for k, v in agg.items()
                       if v["n_lifted"] > 0 and len(v["ids"]) >= args.min_support}
    for cid, en in enums:
        for combo in en.subsets(args.k):
            vals = en.liftables(combo, operators)
            if len(vals) < 2:
                continue
            ts = en.terms_stvs(combo)
            if canonical_pattern2(ts, tuple(vals)) not in frequent_shapes:
                continue
            for r in range(1, len(vals)):
                for mv in itertools.combinations(vals, r):
                    feed(canonical_pattern2(ts, mv), cid, ts, len(mv))

    # ---- threshold + dominated ---------------------------------------------
    kept = {k: v for k, v in agg.items() if len(v["ids"]) >= args.min_support}
    by_support_set = collections.defaultdict(list)
    for k, v in kept.items():
        by_support_set[frozenset(v["ids"])].append(k)
    for _, keys in by_support_set.items():
        if len(keys) < 2:
            continue
        best = max(keys, key=lambda k: (kept[k]["size"], -kept[k]["n_lifted"], k))
        for k in keys:
            if k != best:
                kept[k]["dominated"] = True

    # ---- nisurp (multi-clause; sub-pattern supports from the FULL agg) -----
    def doc_p(key):
        e = agg.get(key)
        return (len(e["ids"]) / n_docs) if e else None

    for k, v in kept.items():
        if v["size"] < 2:
            v["isurp"] = v["nisurp"] = None
            continue
        p = len(v["ids"]) / n_docs
        estimates = []
        idxs = list(range(len(k)))
        for part in set_partitions(idxs):
            if len(part) < 2:
                continue
            ok, prod = True, 1.0
            for block in part:
                if not connected_blocks_ok(list(k), sorted(block), operators):
                    ok = False
                    break
                bp = doc_p(canonical_pattern_text([k[i] for i in sorted(block)], operators))
                if bp is None:
                    ok = False
                    break
                prod *= bp
            if ok:
                estimates.append(prod)
        if not estimates:
            v["isurp"] = v["nisurp"] = None
            continue
        isurp = max(p - max(estimates), min(estimates) - p)
        v["isurp"] = round(isurp, 6)
        v["nisurp"] = round(isurp / p, 4)

    # ---- rows + outputs ----------------------------------------------------
    rows = []
    for k, v in kept.items():
        tiers = sorted({tier_of(i) for i in v["ids"]})
        rows.append({
            "mode": pattern_mode(k), "size": v["size"], "n_lifted": v["n_lifted"],
            "atoms": list(k), "support": len(v["ids"]), "occurrences": v["occurrences"],
            "tiers": tiers,
            "per_tier": {t: sum(1 for i in v["ids"] if tier_of(i) == t) for t in tiers},
            "lexicalized": any(content_symbols(a, operators) for a in k),
            "dominated": v.get("dominated", False),
            "mean_s": round(v["s_sum"] / v["n_tv"], 4),
            "mean_c": round(v["c_sum"] / v["n_tv"], 4),
            "isurp": v["isurp"], "nisurp": v["nisurp"],
            "ids": sorted(v["ids"]),
            "examples": sorted(v["ids"])[:3],
        })
    rows.sort(key=lambda r: (-r["support"], r["mode"], -r["size"], r["n_lifted"], r["atoms"]))
    for n, r in enumerate(rows, 1):
        r["pattern_id"] = "p2%05d" % n

    os.makedirs(args.out_dir, exist_ok=True)
    pat_path = os.path.join(args.out_dir, "patterns2.jsonl")
    with open(pat_path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    slot_path = os.path.join(args.out_dir, "valuations_slots.jsonl")
    with open(slot_path, "w", encoding="utf-8") as fh:
        for (kind, cls, head, filler), e in sorted(slots.items()):
            fh.write(json.dumps({
                "center_kind": kind, "center_class": cls, "head": head,
                "filler": filler, "n": e["n"], "docs": len(e["ids"]),
                "examples": sorted(e["ids"])[:3],
            }, ensure_ascii=False, sort_keys=True) + "\n")

    sig_path = os.path.join(args.out_dir, "patterns2_signals.jsonl")
    n_sig = 0
    with open(sig_path, "w", encoding="utf-8") as fh:
        for r in rows:
            if r["size"] < 2 or not r["lexicalized"] or r["dominated"]:
                continue
            if r["mode"] == "kindlevel" and r["n_lifted"] > 0:
                continue
            n_sig += 1
            fh.write(json.dumps({
                "candidate": {"pattern_id": r["pattern_id"], "atoms": r["atoms"],
                              "mode": r["mode"], "n_lifted": r["n_lifted"]},
                # monotone support squash, NOT a probability (P4 normalizes).
                "confidence": round(r["support"] / (r["support"] + 10.0), 3),
                "kind": "subtree-collapse" if r["mode"] == "star" else "conj-pattern",
                "support": r["support"], "tiers": r["tiers"], "nisurp": r["nisurp"],
                "examples": r["examples"], "method": "frequent-patterns2-3a",
            }, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- report ------------------------------------------------------------
    by_mode = collections.Counter(r["mode"] for r in rows)
    n_shape = sum(1 for r in rows if r["n_lifted"] > 0)
    cross_rows = [r for r in rows if r["mode"] == "cross" and not r["dominated"]]
    L = []
    L.append("# §4.3.1+§3a frequent patterns 2 — item E\n")
    L.append(f"- inputs: {', '.join(os.path.basename(p) for p in args.canonical)}"
             f"  ({n_docs} records, {dup} duplicate ids skipped, canon {sorted(versions)[0]})")
    L.append(f"- params: k={args.k}, min_support={args.min_support}"
             f"{', surface kept' if args.keep_surface else ''}"
             f"{f', {truncated_records} record(s) truncated at {MAX_REC_ATOMS} atoms' if truncated_records else ''}")
    L.append(f"- patterns >= support: **{len(rows)}** — modes {dict(sorted(by_mode.items()))}; "
             f"shape-stratum (n_lifted>0): **{n_shape}**; signals: **{n_sig}**; "
             f"slot-valuation rows: **{len(slots)}**\n")

    def table(title, sel, n=20):
        L.append(f"## {title}\n")
        L.append("| support | mode | lift | nisurp | atoms |\n|---|---|---|---|---|")
        for r in sel[:n]:
            atoms = "<br>".join("`%s`" % a for a in r["atoms"])
            ns = "%.2f" % r["nisurp"] if r["nisurp"] is not None else "—"
            L.append(f"| {r['support']} ({r['occurrences']}×) | {r['mode']} "
                     f"| {r['n_lifted']} | {ns} | {atoms} |")
        L.append("")

    table("Top cross-mode patterns (the new capability)", cross_rows)
    table("Top shape-stratum patterns (n_lifted>0, non-dominated)",
          [r for r in rows if r["n_lifted"] > 0 and not r["dominated"] and r["size"] >= 2])
    table("Top by nisurp (multi-clause, non-dominated)",
          sorted([r for r in rows if r["nisurp"] is not None and not r["dominated"]],
                 key=lambda r: (-r["nisurp"], r["atoms"]))[:20], 20)
    table("Top lexicalized star units (batch-1 continuity)",
          [r for r in rows if r["mode"] == "star" and r["lexicalized"]
           and r["size"] >= 2 and not r["dominated"] and r["n_lifted"] == 0])

    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {pat_path}  ({len(rows)} patterns)")
    print(f"-> {slot_path}  ({len(slots)} slot rows)")
    print(f"-> {sig_path}  ({n_sig} signals)")
    print(f"records {n_docs}  patterns {len(rows)}  modes {dict(sorted(by_mode.items()))}  "
          f"shape {n_shape}  signals {n_sig}")


if __name__ == "__main__":
    main()
