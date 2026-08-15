"""FUSE-NF — deterministic consolidation rewriter (PLAN.md §7, the M2 "after" column).

Applies ``type: consolidation`` rules from ``rules/candidates.jsonl`` to canonical
records and writes re-canonicalized results to ``consolidated/<tier>.cons.jsonl``.
The chainer never sees these rules — a consolidated graph IS the equivalence,
so nothing is left to infer at runtime; bridging rules stay in
``rules/mined_bridges_wave1.metta``.

Two rule shapes, recognized from the rule body:

* **symbol rewrites** — ``lhs = [(Member $v A)] -> rhs = [(Member $v B)]``:
  applied as exact-token substitution ``A -> B`` everywhere outside string
  literals (class symbols denote the class wherever they occur: ``Ordinal``
  args, decomposition atoms, rule bodies included). Atom STVs unchanged.
* **structural rewrites** — multi-atom LHS with shared variables: matched by
  unification against the record's top-level atoms (variables bind whole
  argument terms; all matched atoms must be POSITIVE, strength >= 0.5 — the
  mined diffs came from positive paraphrases and a denial must never be
  restructured by them), matched atoms removed, RHS instantiated with
  ``(min strength, min confidence)`` over the matched set.
* **pack rewrites** (``kind: subtree-collapse``, gauntlet round 2) — a
  structural rewrite with three extra instance guards, enforced by
  backtracking search (a failing assignment is skipped, not fatal): every
  class variable (2nd arg of a ``Member`` LHS atom) must bind a plain
  lowercase symbol, every center variable (1st arg of every LHS atom) must
  bind a skolem, and ALL matched atoms must carry one identical STV — a
  meta-node atom carries a single truth value, so a mixed-STV bundle stays
  faithful.  RHS heads unknown to the vocabulary (the ``Mn*`` meta heads) are
  registered in-process via ``augment_vocab`` so the re-canonicalization sees
  them as ordinary role/status operators, NOT as opaque sealed terms —
  ``specs/vocabulary.json`` (the parse validator's inventory) is never touched.

Application order per the plan: larger LHS first, then higher confidence, then
rule id; repeat to fixpoint (symbol rewrites are idempotent, structural rules
strictly reduce or preserve atom count with one direction only — no cycles).
After structural rewrites, a light orphan sweep drops single-argument
role/status atoms (``(Past e0)``) whose skolem no longer occurs anywhere else —
the residue of a collapsed wrapper event. Everything is deterministic; output
records are re-canonicalized (fresh graph/shape/content ids under the current
CANON_VERSION) and carry a ``consolidation`` provenance block including the
source ``graph_id``.

Usage:
  python consolidate.py --rules ../rules/candidates.jsonl --date 2026-08-07 \
      ../canonical/tierA.canon.jsonl --out ../consolidated/tierA.cons.jsonl
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import canonicalize as C  # noqa: E402

MAX_PASSES = 50
RE_QUOTED = re.compile(r'"[^"]*"')
RE_MEMBER_PAT = re.compile(r"\A\(Member \$(\w+) ([a-z][a-z0-9_]*)\)\Z")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def is_var(tok):
    return isinstance(tok, str) and tok.startswith("$")


def unify(pat, term, bnd):
    if is_var(pat):
        if pat in bnd:
            return bnd[pat] == term and bnd or None
        out = dict(bnd)
        out[pat] = term
        return out
    if isinstance(pat, str) or isinstance(term, str):
        return bnd if pat == term else None
    if len(pat) != len(term):
        return None
    for p, t in zip(pat, term):
        bnd = unify(p, t, bnd)
        if bnd is None:
            return None
    return bnd


def substitute(pat, bnd):
    if is_var(pat):
        return bnd[pat]
    if isinstance(pat, str):
        return pat
    return [substitute(p, bnd) for p in pat]


def match_rule(lhs_pats, atoms, positive_only=True, accept=None):
    """First (deterministic) assignment of distinct atom indices to LHS patterns.

    ``accept(used, bnd)`` — optional instance guard checked on a complete
    assignment; a rejection backtracks and the search continues, so a rule can
    still fire on a later (guard-passing) instance in the same record."""
    def rec(i, used, bnd):
        if i == len(lhs_pats):
            return (used, bnd) if accept is None or accept(used, bnd) else None
        for j, atom in enumerate(atoms):
            if j in used:
                continue
            if positive_only and atom["stv"][0] < 0.5:
                continue
            b2 = unify(lhs_pats[i], atom["parsed"], dict(bnd))
            if b2 is not None:
                hit = rec(i + 1, used + [j], b2)
                if hit:
                    return hit
        return None
    return rec(0, [], {})


RE_CLASS_SYM = re.compile(r"[a-z][a-z0-9_]*")
RE_SKOLEM_SYM = re.compile(r"[exf]\d+")


def pack_guard(rule, atoms):
    """Instance guard for subtree-collapse rules (see module docstring)."""
    def accept(used, bnd):
        if len({tuple(atoms[j]["stv"]) for j in used}) != 1:
            return False
        for v in rule["class_vars"]:
            t = bnd.get(v)
            if not (isinstance(t, str) and RE_CLASS_SYM.fullmatch(t)):
                return False
        for v in rule["center_vars"]:
            t = bnd.get(v)
            if not (isinstance(t, str) and RE_SKOLEM_SYM.fullmatch(t)):
                return False
        return True
    return accept


def token_rewrite(term_text, table):
    """Exact-token substitution outside string literals."""
    spans = [m.span() for m in RE_QUOTED.finditer(term_text)]

    def in_quotes(pos):
        return any(a <= pos < b for a, b in spans)

    def sub(m):
        return table[m.group(0)] if not in_quotes(m.start()) else m.group(0)

    pat = re.compile(r"(?<![\w$])(?:%s)(?![\w])" % "|".join(re.escape(k) for k in sorted(table)))
    return pat.sub(sub, term_text)


def orphan_sweep(atoms):
    """Drop 1-arg role/status atoms whose skolem occurs in no other atom."""
    changed = True
    while changed:
        changed = False
        counts = collections.Counter()
        for a in atoms:
            for tok in re.findall(r"(?<![\w$])[exf]\d+(?![\w])", a["term"]):
                counts[tok] += 1
        keep = []
        for a in atoms:
            p = a["parsed"]
            args = [t for t in (p[1:] if isinstance(p, list) else []) if isinstance(t, str)]
            if (isinstance(p, list) and len(p) == 2 and isinstance(p[1], str)
                    and re.fullmatch(r"[exf]\d+", p[1]) and counts[p[1]] == 1):
                changed = True
                continue
            keep.append(a)
        atoms[:] = keep
    return atoms


def consolidate_record(rec, sym_table, struct_rules):
    atoms = [{"proof_name": a["proof_name"], "term": a["term"], "stv": list(a["stv"])}
             for a in rec["atoms"]]
    n_tok = 0
    if sym_table:
        for a in atoms:
            new = token_rewrite(a["term"], sym_table)
            if new != a["term"]:
                n_tok += 1
                a["term"] = new
    for a in atoms:
        a["parsed"] = C.parse_term(a["term"])

    applied = collections.Counter()
    for _ in range(MAX_PASSES):
        hit_any = False
        for rule in struct_rules:
            while True:
                # the guard closes over the CURRENT atoms list — rebuilt every
                # iteration because a hit rebinds ``atoms`` below
                hit = match_rule(rule["lhs_parsed"], atoms,
                                 accept=pack_guard(rule, atoms) if rule.get("pack") else None)
                if not hit:
                    break
                used, bnd = hit
                s = min(atoms[j]["stv"][0] for j in used)
                c = min(atoms[j]["stv"][1] for j in used)
                base = min(used)
                atoms = [a for j, a in enumerate(atoms) if j not in used]
                for k, rp in enumerate(rule["rhs_parsed"]):
                    term = C.linearize_term(substitute(rp, bnd))
                    atoms.append({
                        "proof_name": "cons_%s_%d" % (rule["id"], k),
                        "term": term, "stv": [s, c], "parsed": C.parse_term(term)})
                applied[rule["id"]] += 1
                hit_any = True
        if not hit_any:
            break
    if applied:
        atoms = orphan_sweep(atoms)

    # dedupe identical terms (keep the higher-confidence STV)
    best = {}
    order = []
    for a in atoms:
        key = a["term"]
        if key not in best:
            best[key] = a
            order.append(key)
        elif a["stv"][1] > best[key]["stv"][1]:
            best[key] = a
    atoms = [best[k] for k in order]

    seen_names = set()
    statements = []
    for a in atoms:
        name = a["proof_name"]
        while name in seen_names:
            name += "_x"
        seen_names.add(name)
        statements.append("(: %s %s (STV %s %s))" % (name, a["term"], a["stv"][0], a["stv"][1]))
    return statements, n_tok, applied


def prepare_rules(rules):
    """Split consolidation rules into (symbol table, structural rules), plan-ordered."""
    sym_table = {}
    struct_rules = []
    for r in rules:
        if len(r["lhs"]) == 1 and len(r["rhs"]) == 1:
            ma, mb = RE_MEMBER_PAT.match(r["lhs"][0]), RE_MEMBER_PAT.match(r["rhs"][0])
            if ma and mb and ma.group(1) == mb.group(1):
                sym_table[ma.group(2)] = mb.group(2)
                continue
        lhs_parsed = [C.parse_term(x) for x in r["lhs"]]
        pack = r.get("kind") == "subtree-collapse"
        class_vars, center_vars = [], []
        if pack:
            class_vars = sorted({p[2] for p in lhs_parsed
                                 if isinstance(p, list) and len(p) == 3
                                 and p[0] == "Member" and is_var(p[2])})
            firsts = [set([p[1]] if isinstance(p, list) and len(p) > 1
                          and is_var(p[1]) else []) for p in lhs_parsed]
            center_vars = sorted(set.intersection(*firsts)) if firsts else []
        struct_rules.append({
            "id": r["id"], "confidence": r["confidence"],
            "lhs_parsed": lhs_parsed,
            "rhs_parsed": [C.parse_term(x) for x in r["rhs"]],
            "pack": pack, "class_vars": class_vars, "center_vars": center_vars,
        })
    struct_rules.sort(key=lambda r: (-len(r["lhs_parsed"]), -r["confidence"], r["id"]))
    # resolve symbol chains (a->b, b->c => a->c); cycles are a build error
    for k in sorted(sym_table):
        seen = {k}
        v = sym_table[k]
        while v in sym_table:
            v = sym_table[v]
            if v in seen:
                raise SystemExit(f"symbol-rewrite cycle at {k!r}")
            seen.add(v)
        sym_table[k] = v
    return sym_table, struct_rules


def augment_vocab(vocab, struct_rules):
    """Register RHS heads unknown to the vocabulary (mined ``Mn*`` meta heads)
    as ordinary non-opaque role/status operators — copies, never mutates: the
    base vocab object is cached inside canonicalize."""
    extra = set()
    for r in struct_rules:
        for p in r["rhs_parsed"]:
            if isinstance(p, list) and p:
                key = (p[0], len(p) - 1)
                if key not in vocab["known"]:
                    extra.add(key)
    if not extra:
        return vocab
    out = dict(vocab)
    out["known"] = frozenset(vocab["known"] | extra)
    out["role_status"] = frozenset(vocab["role_status"] | extra)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical")
    ap.add_argument("--rules", required=True, action="append",
                    help="rules file; repeatable (wave-1 + wave-2 validated sets)")
    ap.add_argument("--out", required=True)
    ap.add_argument("--date", required=True)
    ap.add_argument("--status", default="candidate,validated",
                    help="comma list of statuses to apply (post-gauntlet: 'validated')")
    args = ap.parse_args()

    ok_status = set(args.status.split(","))
    rules = [r for path in args.rules for r in load(path)
             if r["type"] == "consolidation" and r["status"] in ok_status
             and r["direction"] == "lhs->rhs"]
    sym_table, struct_rules = prepare_rules(rules)

    vocab = augment_vocab(C.load_vocabulary(), struct_rules)
    n_rec = n_changed = 0
    tok_total = 0
    applied_total = collections.Counter()
    out_rows = []
    for rec in load(args.canonical):
        n_rec += 1
        statements, n_tok, applied = consolidate_record(rec, sym_table, struct_rules)
        tok_total += n_tok
        applied_total.update(applied)
        cons = C.canonicalize({"id": rec["id"], "run": rec.get("run"),
                               "statements": statements}, vocab=vocab)
        cons["consolidation"] = {
            "date": args.date,
            "rules_file": "+".join(os.path.basename(p) for p in args.rules),
            "source_graph_id": rec["graph_id"],
            "token_rewrites": n_tok,
            "structural_applied": dict(sorted(applied.items())),
        }
        if cons["graph_id"] != rec["graph_id"]:
            n_changed += 1
        out_rows.append(cons)

    os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        for row in out_rows:
            fh.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
    print(f"-> {args.out}")
    print(f"records {n_rec}  changed {n_changed}  token-rewritten atoms {tok_total}  "
          f"structural applications {sum(applied_total.values())}")
    if applied_total:
        top = ", ".join(f"{k}×{v}" for k, v in applied_total.most_common(6))
        print(f"  structural: {top}")


if __name__ == "__main__":
    main()
