"""ANSWERS: an engine's proofs for a question's query → the bindings of its asked variables → readable answers.

Pure Python — no catalog, no YAML — so it runs beside the engine as well as here. The engine (PeTTaChainer, our line)
answers a query ``(: $prf <pattern> $tv)`` with one proof line per derivation, ``(: <proof> <instantiated pattern>
(STV s c))``. ``bindings`` reads back what each pattern variable was bound to; ``index`` reads a knowledge base's
statements for what can name a symbol (its Name atoms, its classes, and the coreference links that make several
symbols one referent); ``answers`` groups the proofs by the referents the asked variables were bound to. Grouping
is a reading aid, never a filter: every proof is kept, with its truth value.

A symbol the knowledge base names is answered by its names (through the coreference links: "her" in "her daughter
Annie" is answered by the name of the referent it corefers with); a value that is no symbol of the knowledge base is
a word — the class a relation question asks for (daughter).

    python -m tmpl.answers run JOB.json OUT.json      (inside the engine's environment: the queries asked)

A job is ``{"statements": [...], "rules": [<file or statements>], "queries": [...], "steps": n}``, optionally with
``saturate`` (the closure stage to forward-chain first: ``tmpl.reason``, a workaround for our engine line); the output
lists per query the raw proof lines, and what saturation derived. A file of jobs (a list) gives a list of outputs.
"""
from __future__ import annotations

import json
import re
import sys

_TOKEN = re.compile(r'"(?:[^"\\]|\\.)*"|[()]|[^\s()]+')


def parse(text: str):
    """One s-expression → a tree of lists and tokens (a string literal keeps its quotes)."""
    toks = _TOKEN.findall(text)
    pos = 0

    def read():
        nonlocal pos
        tok = toks[pos]
        pos += 1
        if tok == "(":
            items = []
            while toks[pos] != ")":
                items.append(read())
            pos += 1
            return items
        return tok

    return read()


def render(tree) -> str:
    return "(" + " ".join(render(x) for x in tree) + ")" if isinstance(tree, list) else str(tree)


def statement_parts(text: str):
    """``(: <name or proof> <term> (STV s c))`` → ``(name, term, (s, c))``; None when it is no such line."""
    try:
        t = parse(text)
    except (IndexError, ValueError):
        return None
    if not (isinstance(t, list) and len(t) == 4 and t[0] == ":"):
        return None
    tv = t[3]
    if isinstance(tv, list) and len(tv) == 3 and tv[0] == "STV":
        try:
            return t[1], t[2], (float(tv[1]), float(tv[2]))
        except ValueError:
            return t[1], t[2], None
    return t[1], t[2], None


def bindings(pattern, term) -> dict | None:
    """What each ``$`` variable of the pattern is bound to in an instantiated term (the engine returns the pattern
    with its variables filled, in the pattern's order); None when the two do not line up."""
    out: dict = {}

    def walk(p, t):
        if isinstance(p, list):
            if not isinstance(t, list) or len(p) != len(t):
                return False
            return all(walk(a, b) for a, b in zip(p, t))
        if isinstance(p, str) and p.startswith("$"):
            if p in out and out[p] != t:
                return False
            out[p] = t
            return True
        return p == t

    return out if walk(pattern, term) else None


def index(statements: list[str], coref_threshold: float = 0.5) -> dict:
    """What can name a symbol in a knowledge base: ``names`` (symbol → its Name strings), ``classes`` (symbol → the
    classes a Member atom gives it) and ``group`` (symbol → the referent it belongs to: the symbols joined by a
    Coref atom whose strength is above the threshold)."""
    names: dict = {}
    classes: dict = {}
    attributes: dict = {}                                  # symbol -> "(Weekday monday)": a word or a number said of it
    parent: dict = {}

    def find(x):
        while parent.get(x, x) != x:
            parent[x] = parent.get(parent[x], parent[x])
            x = parent[x]
        return x

    for st in statements:
        parts = statement_parts(st)
        if not parts:
            continue
        _name, term, tv = parts
        if not isinstance(term, list) or len(term) != 3:
            continue
        head, a, b = term
        if head == "Name" and isinstance(a, str) and isinstance(b, str) and b.startswith('"'):
            names.setdefault(a, []).append(json.loads(b))
        elif head == "Member" and isinstance(a, str) and isinstance(b, str) and (tv is None or tv[0] > 0.5):
            classes.setdefault(a, []).append(b)
        elif head == "Coref" and isinstance(a, str) and isinstance(b, str) and (tv is None or tv[0] > coref_threshold):
            ra, rb = find(a), find(b)
            if ra != rb:
                parent[max(ra, rb)] = min(ra, rb)
        elif isinstance(head, str) and isinstance(a, str) and isinstance(b, str) and not b.startswith(("sk_", "$", '"')) \
                and (tv is None or tv[0] > 0.5):
            attributes.setdefault(a, []).append(f"({head} {b})")   # a time's weekday, year, hour; a measure's unit …
    group = {s: find(s) for s in set(names) | set(classes) | set(parent) | set(attributes)}
    return {"names": names, "classes": classes, "attributes": attributes, "group": group}


def describe(value, idx: dict) -> dict:
    """A bound value read through the knowledge base: a symbol's referent (its group) with the names and classes of
    every symbol in it, or a word the knowledge base does not hold as a referent."""
    if isinstance(value, list):
        return {"value": render(value), "term": True}
    g = idx["group"].get(value)
    if g is None:
        return {"value": value, "word": True}
    members = sorted(s for s, h in idx["group"].items() if h == g)
    names = sorted({n for s in members for n in idx["names"].get(s, [])})
    classes = sorted({c for s in members for c in idx["classes"].get(s, [])})
    attributes = sorted({x for s in members for x in idx.get("attributes", {}).get(s, [])})
    return {"value": value, "referent": g, "names": names, "classes": classes, "attributes": attributes}


def answers(results: list[str], pattern, asked_vars: list[str], statements: list[str]) -> dict:
    """The engine's proof lines for one query → ``{"proofs": n, "unread": n, "best": (s, c) | None, "answers":
    [{"key", "bindings": {var: describe}, "best": (s, c), "proofs": n}]}``, one answer per combination of the
    asked variables' referents (or words), the best truth value first (confidence, then strength)."""
    idx = index(statements)
    pat = parse(pattern) if isinstance(pattern, str) else pattern
    grouped: dict = {}
    unread, best = 0, None
    for line in results:
        parts = statement_parts(line)
        if not parts:
            unread += 1
            continue
        _proof, term, tv = parts
        b = bindings(pat, term)
        if b is None:
            unread += 1
            continue
        if tv is not None and (best is None or (tv[1], tv[0]) > (best[1], best[0])):
            best = tv
        described = {v: describe(b.get(v), idx) for v in asked_vars}
        key = tuple(d.get("referent") or d.get("value") for d in described.values())
        g = grouped.setdefault(key, {"key": list(key), "bindings": described, "best": tv, "proofs": 0})
        g["proofs"] += 1
        if tv is not None and (g["best"] is None or (tv[1], tv[0]) > (g["best"][1], g["best"][0])):
            g["best"] = tv
    ranked = sorted(grouped.values(), key=lambda g: (-(g["best"] or (0, 0))[1], -(g["best"] or (0, 0))[0], str(g["key"])))
    return {"proofs": len(results), "unread": unread, "best": best, "answers": ranked}


# --------------------------------------------------------------------------
# asking the engine (inside its environment)
# --------------------------------------------------------------------------


def statements_of(text: str) -> list[str]:
    """The top-level s-expressions of a MeTTa text (``;`` comment lines dropped): a rules file's statements."""
    out, depth, start = [], 0, None
    text = "\n".join(ln for ln in text.splitlines() if not ln.strip().startswith(";"))
    in_str = False
    for i, ch in enumerate(text):
        if ch == '"' and (i == 0 or text[i - 1] != "\\"):
            in_str = not in_str
        if in_str:
            continue
        if ch == "(":
            if depth == 0:
                start = i
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0 and start is not None:
                out.append(text[start:i + 1])
                start = None
    return out


def _expand(items: list) -> list[str]:
    """Statements and rule texts; an item that is no s-expression is a file of them."""
    out = []
    for r in items or []:
        if isinstance(r, str) and not r.lstrip().startswith("("):
            with open(r, encoding="utf-8") as fh:
                out += statements_of(fh.read())
        else:
            out.append(r)
    return out


def derived_statements(lines: list[str], stored: set) -> list[str]:
    """What a forward-chaining run returns — ``(<term> <context> <proof> (STV s c))`` per changed fact — as statements to
    load: one per atom (a derived conjunction is no fact of its own), an atom already stored left as stored."""
    out, seen = [], set(stored)
    for line in lines:
        try:
            t = parse(line)
        except (IndexError, ValueError):
            continue
        if not (isinstance(t, list) and len(t) == 4 and isinstance(t[0], list) and t[0][:1] != ["And"]):
            continue
        key = render(t[0])
        if key in seen:
            continue
        seen.add(key)
        out.append(f"(: derived_{len(out) + 1} {key} {render(t[3])})")
    return out


def run_job(job: dict) -> dict:
    """Load a job's statements and rules into a fresh PeTTaChainer and ask each query: ``{"results": [[proof lines] per
    query], "refused": [statements the engine refused], "derived": [what saturation added]}``. With ``saturate``
    (``{"facts", "rules", "steps"}``: the closure stage, ``tmpl.reason``) those rules are first forward-chained over the
    statements in an engine of their own, and what they derive is loaded beside the statements of the asking engine,
    which holds the job's other rules only. Needs the engine's environment."""
    from pettachainer import PeTTaChainer                  # noqa: PLC0415 — only inside the engine's environment
    refused = []

    def load(h, items):
        for st in items:
            try:
                h.add_atom(st)
            except Exception as exc:                        # an engine refusal is reported, never hidden
                refused.append({"statement": st, "error": str(exc).splitlines()[0][:200]})

    statements = list(job.get("statements") or [])
    derived: list[str] = []
    sat = job.get("saturate") or {}
    if sat.get("rules"):
        h0 = PeTTaChainer()
        load(h0, statements + _expand(sat.get("facts")) + _expand(sat["rules"]))
        lines = h0.forward_chain(h0.all_facts(), steps=int(sat.get("steps") or 2000))
        stored = {render(p[1]) for p in (statement_parts(s) for s in statements) if p}
        derived = derived_statements(list(lines), stored)
    h = PeTTaChainer()
    load(h, statements + derived + _expand(job.get("rules")))
    steps = int(job.get("steps") or 2000)
    results = []
    for q in job.get("queries") or []:
        try:
            results.append(list(h.query(q, steps=steps, timeout_sec=0)))
        except Exception as exc:
            results.append([f"ERROR {str(exc).splitlines()[0][:200]}"])
    return {"results": results, "refused": refused, "derived": derived}


def main(argv=None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    if len(argv) != 3 or argv[0] != "run":
        print(__doc__.strip().splitlines()[0])
        print("usage: python -m tmpl.answers run JOB.json OUT.json     (a job, or a list of jobs)")
        return 2
    with open(argv[1], encoding="utf-8") as fh:
        jobs = json.load(fh)
    many = isinstance(jobs, list)
    outs = []
    for i, job in enumerate(jobs if many else [jobs], 1):
        out = run_job(job)
        outs.append(out)
        print(f"[{i}] {job.get('question') or ''} {len(out['results'])} queries · {sum(len(r) for r in out['results'])} proofs · "
              f"{len(out['derived'])} derived · {len(out['refused'])} refused", flush=True)
    with open(argv[2], "w", encoding="utf-8") as fh:
        json.dump(outs if many else outs[0], fh, ensure_ascii=False, indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
