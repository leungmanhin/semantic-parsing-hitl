"""R9 — type-check parse statements against the atom-type substrate, using PeTTa's own typing.

For every statement ``(: name atom tv)`` the checker asks PeTTa ``(get-type atom)`` with the
generated declarations (``templates/generated/atom-types.metta``) loaded, and passes the atom
iff its head's ``out`` type (``Proposition`` for statement-forming heads) is AMONG the
solutions.  Membership, not uniqueness: symbols with several sort declarations yield several
candidate lines.

Symbol sorts.  PeTTa only types a symbol that carries a declaration, so the checker needs
``(: sk_cook_1 Event)`` etc.  Until the emitter emits them, ``--infer`` (the default) derives
them from usage, PER RECORD (symbol names are record-local): every bare symbol in a position
whose declared sort is a single sort other than ``Atom`` receives that sort (``Event`` /
``Entity`` / ``TimeTerm`` / ``Statement`` / ``Context`` also receive ``Instance``); a bare
symbol that ends up with no specific sort is an ``Entity`` by default; proof names receive
``Statement``; a skolem-function head ``sk_<verb>`` receives ``(-> Atom … Event)`` and
``(-> Atom … Instance)`` at the arity it is used with.  Legacy constructor signatures
(``legacy_type_defs``) take part in the inference so pre-reification forms still type.
Record-local symbols are renamed ``<symbol>__r<n>`` before PeTTa sees them, so records never
pollute each other's declarations inside the one PeTTa session.

Reported kinds: ``type`` (the atom does not type), ``sort-conflict`` (a symbol used as a Class
and as an instance, or as a Level and anything else), ``sort-warning`` (a symbol used both as an
Entity and as an Event: an eventive nominal such as "the storm", or a swapped role — look),
``unknown-head`` (a head the substrate does not know; open-class relation heads are licensed and
cannot be enumerated, so this is a warning), ``parse-error``.  ``Atom``-typed positions are
replaced by a fresh variable before the query: they are unchecked by design.

Run from ``templates/`` inside the engine environment (the ``petta`` package)::

    cd /home/manhin/Dev/semantic-parsing-hitl/templates && uv run --project /home/manhin/Dev/PeTTaChainer \\
        python -m tmpl.typecheck <statements.jsonl | statements.metta> [--report out.json]

Input: a JSONL whose lines carry ``id`` and ``statements`` (a list of statement strings), or a
``.metta`` file with one statement per line (one record).
"""
from __future__ import annotations

import argparse
import collections
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
SRC_PATH = os.path.join(REPO, "templates", "atom-type-substrates.json")
DECL_PATH = os.path.join(REPO, "templates", "generated", "atom-types.metta")

#: sorts that imply ``Instance`` as a second declaration
INSTANCE_SUBSORTS = {"Entity", "Event", "TimeTerm", "Statement", "Context"}
#: sort pairs a symbol may not carry together (findings)
CONFLICTS = [({"Class"}, {"Entity", "TimeTerm", "Statement", "Context"}), ({"Level"}, INSTANCE_SUBSORTS | {"Instance", "Class"})]
#: sort pairs worth a look but legitimate: an eventive nominal ("the storm" as agent and as an
#: eventuality), or a compound-action class under the compound decomposition (Patient on a class)
WARNINGS = [({"Entity"}, {"Event"}), ({"Class"}, {"Event"})]


# --------------------------------------------------------------------------
# s-expressions
# --------------------------------------------------------------------------

_TOKEN = re.compile(r'"(?:[^"\\]|\\.)*"|[()]|[^\s()]+')


def parse(text: str):
    """Parse one s-expression into nested lists; atoms stay strings."""
    toks = _TOKEN.findall(text)
    pos = 0

    def read():
        nonlocal pos
        if pos >= len(toks):
            raise ValueError("unexpected end of expression")
        tok = toks[pos]
        pos += 1
        if tok == "(":
            items = []
            while pos < len(toks) and toks[pos] != ")":
                items.append(read())
            if pos >= len(toks):
                raise ValueError("unbalanced parentheses")
            pos += 1
            return items
        if tok == ")":
            raise ValueError("unexpected ')'")
        return tok

    expr = read()
    if pos != len(toks):
        raise ValueError("stray text after the expression")
    return expr


def render(expr) -> str:
    if isinstance(expr, list):
        return "(" + " ".join(render(x) for x in expr) + ")"
    return expr


def is_symbol(tok) -> bool:
    if not isinstance(tok, str) or tok.startswith("$") or tok.startswith('"'):
        return False
    try:
        float(tok)
        return False
    except ValueError:
        return True


# --------------------------------------------------------------------------
# substrate
# --------------------------------------------------------------------------


def load_substrate(path: str = SRC_PATH) -> dict:
    with open(path, encoding="utf-8") as fh:
        src = json.load(fh)
    heads = src["heads"]
    oc = src.get("open_class") or {}
    sig = oc.get("oblique_signature")
    for prep in oc.get("oblique_prepositions") or []:
        if prep not in heads and sig:
            heads[prep] = {"kind": "oblique", "arity": len(sig["arg_types"]), "arg_types": sig["arg_types"], "out": sig["out"]}
    return src


def arities_of(entry: dict) -> list[int]:
    a = entry.get("arity")
    if isinstance(a, list):
        return sorted(int(x) for x in a)
    return [int(a)] if a is not None else []


_LEGACY = re.compile(r"^\(: (\S+) \(-> (.*) (\S+)\)\)$")


def signatures(entry: dict) -> list[tuple[list[str], str]]:
    """All (arg_types, out) signatures of a head: the primary one (per arity) plus legacy ones."""
    sigs = []
    arg_types = list(entry.get("arg_types") or [])
    out = entry.get("out") or "Proposition"
    if entry.get("variadic"):
        sigs.append((["*" + (arg_types[0] if arg_types else "Atom")], out))
    else:
        for n in arities_of(entry) or [len(arg_types)]:
            sigs.append(((arg_types + ["Atom"] * n)[:n], out))
    for d in entry.get("legacy_type_defs") or []:
        m = _LEGACY.match(d.strip())
        if m:
            sigs.append((m.group(2).split(), m.group(3)))
    return sigs


def arg_sorts_for(entry: dict, nargs: int) -> list[str]:
    """The argument sorts a head declares for this arity (variadic: repeated); [] if none fits."""
    for arg_types, _ in signatures(entry):
        if arg_types and arg_types[0].startswith("*"):
            return [arg_types[0][1:]] * nargs
        if len(arg_types) == nargs:
            return arg_types
    return []


# --------------------------------------------------------------------------
# sort inference from usage (one record)
# --------------------------------------------------------------------------


def infer_record(atoms: list, heads: dict):
    """Return ({symbol: set(sorts)}, {sk_head: set(arities)}, findings)."""
    sorts: dict[str, set] = collections.defaultdict(set)
    seen: set = set()
    sk_heads: dict[str, set] = collections.defaultdict(set)

    def visit(expr):
        if not isinstance(expr, list) or not expr:
            return
        head, args = expr[0], expr[1:]
        if isinstance(head, str) and head.startswith("sk_"):
            sk_heads[head].add(len(args))
        entry = heads.get(head) if isinstance(head, str) else None
        arg_sorts = arg_sorts_for(entry, len(args)) if entry else []
        for i, arg in enumerate(args):
            if isinstance(arg, list):
                visit(arg)
                continue
            if not is_symbol(arg):
                continue
            seen.add(arg)
            if i >= len(arg_sorts):
                continue
            sort = arg_sorts[i]
            if "|" in sort or sort == "Atom":
                continue
            sorts[arg].add(sort)

    for atom in atoms:
        visit(atom)

    findings = []
    for sym in seen:
        ss = sorts[sym]
        if not ss or ss <= {"Instance"}:
            ss.add("Entity")  # a bare individual that is never an eventuality is an entity
    for sym, ss in sorted(sorts.items()):
        for a, b in CONFLICTS:
            if ss & a and ss & b:
                findings.append({"kind": "sort-conflict", "symbol": sym, "sorts": sorted(ss)})
                break
        else:
            for a, b in WARNINGS:
                if ss & a and ss & b:
                    findings.append({"kind": "sort-warning", "symbol": sym, "sorts": sorted(ss)})
                    break
    return sorts, sk_heads, findings


def declarations_for(sorts: dict, sk_heads: dict, proof_names: set, rename) -> list[str]:
    lines = []
    for sym, ss in sorted(sorts.items()):
        full = set(ss)
        if full & INSTANCE_SUBSORTS:
            full.add("Instance")
        for s in sorted(full):
            lines.append(f"(: {rename(sym)} {s})")
    for name in sorted(proof_names):
        if name not in sorts:
            lines.append(f"(: {rename(name)} Statement)")
            lines.append(f"(: {rename(name)} Instance)")
    for head, arities in sorted(sk_heads.items()):
        for n in sorted(arities):
            for out in ("Event", "Instance"):
                lines.append(f"(: {head} (-> {' '.join(['Atom'] * n)} {out}))")
    return lines


def check_expr(expr, expected: set | None, heads: dict, rename, checker) -> tuple[bool, list[str], list]:
    """Type one expression LINEARLY: every nested expression is checked on its own against the
    sort its position expects, then replaced by a fresh variable in the parent's query, so
    PeTTa never enumerates candidate combinations across a whole bundle.

    Returns (ok, types PeTTa gave for this expression, nested failures)."""
    if not isinstance(expr, list) or not expr:
        return True, [], []
    head, args = expr[0], expr[1:]
    entry = heads.get(head) if isinstance(head, str) else None
    arg_sorts = arg_sorts_for(entry, len(args)) if entry else []
    out_sort = (entry or {}).get("out") or "Proposition"
    query = [head]
    ok = True
    failures = []
    for i, arg in enumerate(args):
        sort = arg_sorts[i] if i < len(arg_sorts) else None
        if sort == "Atom":
            query.append("$_unchecked")
        elif isinstance(arg, list):
            want = set(sort.split("|")) if sort else None
            child_ok, child_types, child_fail = check_expr(arg, want, heads, rename, checker)
            failures.extend(child_fail)
            if not child_ok:
                ok = False
            query.append(f"$_c{i}")
        elif is_symbol(arg):
            query.append(rename(arg))
        else:
            query.append(arg)
    types = checker.get_type(render(query))
    want_here = expected if expected else {out_sort}
    # a child must deliver a sort its position accepts; an undeclared sort pattern is a failure
    if not (want_here & set(types)):
        ok = False
        failures.append({"expr": render(expr), "expected": sorted(want_here), "got": types[:3]})
    return ok, types, failures


# --------------------------------------------------------------------------
# PeTTa
# --------------------------------------------------------------------------


class Checker:
    def __init__(self, declarations_text: str):
        from petta import PeTTa  # the engine environment provides it

        self.p = PeTTa()
        self.p.process_metta_string(declarations_text + "\n")

    def declare(self, lines: list[str]) -> None:
        if lines:
            self.p.process_metta_string("\n".join(lines) + "\n")

    def get_type(self, atom_text: str) -> list[str]:
        out = self.p.process_metta_string(f"!(get-type {atom_text})")
        return [str(x).strip() for x in (out or [])]


# --------------------------------------------------------------------------
# driver
# --------------------------------------------------------------------------


def read_records(path: str) -> list[dict]:
    records = []
    if path.endswith(".jsonl"):
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                if line:
                    d = json.loads(line)
                    records.append({"id": d.get("id", "?"), "statements": d.get("statements") or [],
                                    "declarations": d.get("declarations") or []})
    else:
        stmts = []
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                if line and not line.startswith(";"):
                    stmts.append(line)
        records.append({"id": os.path.basename(path), "statements": stmts, "declarations": []})
    return records


def split_statement(stmt_text: str):
    """``(: name atom tv)`` → (name, atom-expr); raises on any other shape."""
    expr = parse(stmt_text)
    if not (isinstance(expr, list) and len(expr) == 4 and expr[0] == ":"):
        raise ValueError("not a (: name atom tv) statement")
    return expr[1], expr[2]


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("path", help="statements .jsonl (id + statements) or .metta (one statement per line)")
    ap.add_argument("--declarations", default=DECL_PATH)
    ap.add_argument("--substrate", default=SRC_PATH)
    ap.add_argument("--no-infer", action="store_true",
                    help="never infer sorts from usage: every record must carry its own `declarations` (the emitter's)")
    ap.add_argument("--report", default=None, help="write the findings as JSON here")
    ap.add_argument("--limit", type=int, default=None, help="check only the first N records")
    args = ap.parse_args(argv)

    src = load_substrate(args.substrate)
    heads = src["heads"]
    with open(args.declarations, encoding="utf-8") as fh:
        decl_text = fh.read()
    checker = Checker(decl_text)

    records = read_records(args.path)
    if args.limit:
        records = records[: args.limit]

    findings = []
    n_statements = passed = 0
    by_head_fail = collections.Counter()
    for idx, rec in enumerate(records):
        parsed = []
        proof_names = set()
        for st in rec["statements"]:
            try:
                name, atom = split_statement(st)
            except ValueError as exc:
                findings.append({"kind": "parse-error", "id": rec["id"], "statement": st, "error": str(exc)})
                continue
            proof_names.add(name)
            parsed.append((st, name, atom))
        n_statements += len(parsed)

        given = rec.get("declarations") or []
        if given:
            # the emitter's own sort declarations: no inference, sk heads and proof names still declared
            sorts = collections.defaultdict(set)
            for d in given:
                m = re.match(r"^\(: (\S+) (\S+)\)$", d.strip())
                if m:
                    sorts[m.group(1)].add(m.group(2))
            _, sk_heads, _ = infer_record([a for _, _, a in parsed], heads)
        elif args.no_infer:
            findings.append({"kind": "parse-error", "id": rec["id"], "statement": "", "error": "no declarations and --no-infer"})
            continue
        else:
            sorts, sk_heads, rec_findings = infer_record([a for _, _, a in parsed], heads)
            for f in rec_findings:
                f["id"] = rec["id"]
            findings.extend(rec_findings)
        known = set(sorts) | proof_names
        rename = lambda s, _i=idx, _k=known: f"{s}__r{_i}" if s in _k else s  # noqa: E731
        checker.declare(declarations_for(sorts, sk_heads, proof_names, rename))

        for st, name, atom in parsed:
            head = atom[0] if isinstance(atom, list) and atom else atom
            entry = heads.get(head) if isinstance(head, str) else None
            if entry is None:
                findings.append({"kind": "unknown-head", "id": rec["id"], "statement": st, "head": head})
                continue
            expected = entry.get("out") or "Proposition"
            ok, got, nested = check_expr(atom, {expected}, heads, rename, checker)
            if ok:
                passed += 1
            else:
                by_head_fail[head] += 1
                findings.append({"kind": "type", "id": rec["id"], "statement": st, "head": head, "expected": expected,
                                 "got": got[:3], "where": nested[:3]})

    kinds = collections.Counter(f["kind"] for f in findings)
    print(f"records {len(records)} · statements {n_statements} · passed {passed} · findings {len(findings)} "
          f"({', '.join(f'{k} {n}' for k, n in sorted(kinds.items())) or 'none'})")
    if by_head_fail:
        print("type failures by head:", ", ".join(f"{h} {n}" for h, n in by_head_fail.most_common(12)))
    if args.report:
        with open(args.report, "w", encoding="utf-8") as fh:
            json.dump({"records": len(records), "statements": n_statements, "passed": passed, "findings": findings}, fh, indent=2)
        print(f"report: {args.report}")
    return 1 if any(f["kind"] in ("type", "sort-conflict", "parse-error") for f in findings) else 0


if __name__ == "__main__":
    sys.exit(main())
