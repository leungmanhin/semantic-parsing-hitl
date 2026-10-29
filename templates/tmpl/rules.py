"""The catalog's background rules: a consumer-neutral source (rules.yaml) and its lowering.

A rule is an inference the parse leaves out on purpose: premises and a conclusion as atom patterns
over the substrate's heads, optional arithmetic steps, a reliability (strength, confidence) and a
semantics. ``load`` validates the source, ``lower`` renders one rule for a consumer, ``render``
writes the consumer's file:

    python -m tmpl.rules                 # validate rules.yaml, write generated/seeded_rules.metta

A rule over a SEALED CLAUSE (a complement bound as one term, ``$c``) declares ``expand``:
``{tenses: [none, past, future], event: "$o", matrix: "$m"}``. Its patterns use ``{tense}`` for
the matrix event's tense atom (a premise dropped for ``none``) and ``{tensed}`` for the bound
clause with that tense carried onto the clause's event (``$c``, or ``(And $c (Past $o))``); the
clause's event comes from the computation ``clause-event`` over the term. One source rule
stands for one lowered rule per tense (``id``, ``id_past``, ``id_future``); ``check`` validates
the variants. A rule may name a consumer capability it ``requires`` (``sealed-term-projection``:
concluding the conjuncts of a bound term, and the clause-event computation); lowering for a
target that lacks the capability lists the rule as pending instead of writing it.

Lowering for the chainer (the only target so far): ``(: id (Implication <premises> <conclusion>)
(CTV (STV s c) (STV 0.0 0.0)))``. The explicit conditional is the chainer's documented form for a
conditional relationship; its negative branch, with no confidence, states the deductive semantics (nothing follows from
a failed premise). A bare ``(STV s c)`` would make the chainer estimate that branch from base rates
over stored facts, which collapses the confidence of any conclusion drawn from a premise below
strength 1.0. Arithmetic steps lower to the chainer's ``(Compute op (args) -> result)`` premise; a
boolean guard (``!=``, ``>``, ``<`` with ``result: true``) is a premise that holds only when the test does.

EQUIVALENCES. A rule with ``semantics: equivalence`` states that its one premise and its
conclusion hold together (a symmetric relation read from either side: ``(Coref $a $b)`` and
``(Coref $b $a)``). It lowers to the chainer's Equivalence link, ``(: id (Equivalence P Q)
(STV s c))``, which the chainer uses in both directions at the strength 2s/(1+s) with the
rule's confidence, and whose denied side denies the other; it never lowers to two implications
(the chainer would count a conclusion twice). The two sides must bind the same variables, hold
no skolem function term (a term against a bare variable makes the search explode) and need no
computation.

FACTS. ``rules.yaml`` may also hold a ``facts`` list: background LEXICON atoms with no variables —
the poles of a gradable dimension (``ScaleOpposite short tall``), unit factors to a canonical unit
(``UnitFactor centimetre metre 0.01``), a dimension noun's adjective scale (``DimensionScale
weight heavy``). A facts group names its ``head``, a ``truth``, the templates it ``reads`` and its
``entries`` (one argument list per atom); each entry lowers to a plain statement
``(: <group id>_<symbolic args> (<head> <args>) (STV s c))`` written before the rules, so a consumer
loads the lexicon with the rules. Facts are never parser output.
"""
from __future__ import annotations

import argparse
import glob
import json
import os
import re
import sys

import yaml

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import typecheck as T  # noqa: E402

RULES = os.path.join(TEMPLATES, "rules.yaml")
SUBSTRATE = os.path.join(TEMPLATES, "atom-type-substrates.json")
CATALOG_DIR = os.path.join(TEMPLATES, "catalog")
GENERATED = os.path.join(TEMPLATES, "generated", "seeded_rules.metta")

SEMANTICS = ("deductive", "equivalence")
OPS = ("+", "-", "*", "/", "clause-event", "!=", ">", "<")   # arithmetic, the event of a sealed clause, and boolean guards (result: true)
TENSES = {"none": None, "past": "Past", "future": "Future"}
CAPABILITIES = ("sealed-term-projection",)
TARGET_CAPABILITIES = {"pettachainer": {"sealed-term-projection"}}  # what each consumer can run; grows with the consumer
_VAR = re.compile(r"\$[A-Za-z_][A-Za-z0-9_]*")


class RulesError(Exception):
    pass


_SKOLEM = re.compile(r"sk_[a-z][a-z0-9_]*")     # a skolem function term in a conclusion: a new individual that depends on the bound ones


def _heads(expr, out: set) -> set:
    if isinstance(expr, list) and expr:
        if isinstance(expr[0], str):
            out.add(expr[0])
        for x in expr[1:]:
            _heads(x, out)
    return out


def expand(rule: dict) -> list[dict]:
    """The concrete rules a source rule stands for: itself, or one per matrix tense when it
    declares ``expand`` over a sealed clause."""
    spec = rule.get("expand")
    if not spec:
        return [rule]
    out = []
    for tense in spec["tenses"]:
        head = TENSES[tense]
        tensed = "$c" if head is None else f"(And $c ({head} {spec['event']}))"
        fill = {"{tensed}": tensed, "{tense}": "" if head is None else f"({head} {spec['matrix']})"}

        def sub(text: str) -> str:
            for k, v in fill.items():
                text = text.replace(k, v)
            return text
        variant = {k: v for k, v in rule.items() if k != "expand"}
        variant["id"] = rule["id"] + ("" if head is None else f"_{tense}")
        variant["premises"] = [p for p in (sub(p) for p in rule["premises"]) if p.strip()]
        variant["conclusion"] = sub(rule["conclusion"])
        out.append(variant)
    return out


def check(rules: list[dict], heads: set | None = None, templates: set | None = None) -> list[str]:
    """Structural problems of the source; an empty list means it is sound. A rule with
    ``expand`` is checked through its variants."""
    problems, seen = [], set()
    for i, src in enumerate(rules):
        spec = src.get("expand")
        if spec is not None:
            where = f"rules[{i}] ({src.get('id', '?')})"
            ok = (isinstance(spec, dict) and set(spec) == {"tenses", "event", "matrix"}
                  and isinstance(spec["tenses"], list) and spec["tenses"] and all(t in TENSES for t in spec["tenses"])
                  and all(isinstance(spec[k], str) and spec[k].startswith("$") for k in ("event", "matrix")))
            if not ok:
                problems.append(f"{where}: expand must be {{tenses: [none | past | future …], event: $var, matrix: $var}}")
                continue
        req = src.get("requires")
        if req is not None and req not in CAPABILITIES:
            problems.append(f"rules[{i}] ({src.get('id', '?')}): requires unknown capability {req!r}")
            variants = expand(src)
        else:
            variants = [src]
        for r in variants:
            problems += _check_one(r, i, heads, templates, seen, expanded=spec is not None)
    return problems


def _check_one(r: dict, i: int, heads, templates, seen: set, expanded: bool = False) -> list[str]:
    problems = []
    if True:
        where = f"rules[{i}] ({r.get('id', '?')})"
        rid = r.get("id")
        if not isinstance(rid, str) or not re.fullmatch(r"[a-z][a-z0-9_]*", rid):
            problems.append(f"{where}: id must be lowercase snake_case")
        elif rid in seen:
            problems.append(f"{where}: duplicate id")
        seen.add(rid)
        if not r.get("meaning"):
            problems.append(f"{where}: no meaning")
        prem = r.get("premises")
        if not isinstance(prem, list) or not prem or not all(isinstance(p, str) for p in prem):
            problems.append(f"{where}: premises must be a non-empty list of atoms")
            prem = []
        concl = r.get("conclusion")
        if not isinstance(concl, str):
            problems.append(f"{where}: conclusion must be an atom")
            concl = None
        parsed = []
        for atom in prem + ([concl] if concl else []):
            try:
                parsed.append(T.parse(atom))
            except ValueError as exc:
                problems.append(f"{where}: {atom!r} does not parse: {exc}")
        if heads is not None:
            for atom in parsed:
                for h in _heads(atom, set()):
                    if h not in heads and not _SKOLEM.fullmatch(h):      # (sk_sym $s): a dependent individual, the emitter's convention
                        problems.append(f"{where}: unknown head {h!r} (not in the substrate)")
        bound = set(v for p in prem for v in _VAR.findall(p))
        for j, c in enumerate(r.get("computations") or []):
            cw = f"{where}: computations[{j}]"
            if not isinstance(c, dict) or set(c) != {"result", "op", "args"}:
                problems.append(f"{cw}: needs result, op, args")
                continue
            if c["op"] not in OPS:
                problems.append(f"{cw}: op must be one of {', '.join(OPS)}")
            if not isinstance(c["args"], list) or not c["args"]:
                problems.append(f"{cw}: args must be a non-empty list")
            else:
                for a in c["args"]:
                    if isinstance(a, str) and a.startswith("$") and a not in bound:
                        problems.append(f"{cw}: argument {a} is bound by no premise")
            if c["result"] is True or c["result"] == "true":        # a guard: the premise holds only when the test is true
                if c["op"] not in ("!=", ">", "<"):
                    problems.append(f"{cw}: a true result needs a boolean op (!=, >, <)")
            elif not (isinstance(c["result"], str) and c["result"].startswith("$")):
                problems.append(f"{cw}: result must be a variable, or true for a guard")
            elif c["result"] in bound:
                problems.append(f"{cw}: result {c['result']} is already bound")
            else:
                bound.add(c["result"])
        if concl:
            for v in _VAR.findall(concl):
                if v not in bound:
                    problems.append(f"{where}: conclusion variable {v} is bound by no premise or computation")
        truth = r.get("truth")
        if not (isinstance(truth, dict) and set(truth) == {"strength", "confidence"}
                and all(isinstance(truth[k], (int, float)) and 0 <= truth[k] <= 1 for k in truth)):
            problems.append(f"{where}: truth must be {{strength, confidence}} in [0, 1]")
        if r.get("semantics") not in SEMANTICS:
            problems.append(f"{where}: semantics must be one of {', '.join(SEMANTICS)}")
        elif r.get("semantics") == "equivalence":
            if len(prem) != 1:
                problems.append(f"{where}: an equivalence has exactly one premise, its other side")
            if r.get("computations"):
                problems.append(f"{where}: an equivalence takes no computations")
            if r.get("expand") or r.get("requires"):
                problems.append(f"{where}: an equivalence neither expands nor requires a capability")
            if concl and prem and set(_VAR.findall(prem[0])) != set(_VAR.findall(concl)):
                problems.append(f"{where}: an equivalence binds the same variables on both sides")
            for atom in parsed:
                if any(_SKOLEM.fullmatch(h) for h in _heads(atom, set())):
                    problems.append(f"{where}: an equivalence holds no skolem function term")
        if templates is not None:
            for t in r.get("reads") or []:
                if t not in templates:
                    problems.append(f"{where}: reads unknown template {t!r}")
        for key in r:
            if key not in ("id", "meaning", "premises", "computations", "conclusion", "truth", "semantics", "reads", "notes", "expand", "requires"):
                problems.append(f"{where}: unknown key {key!r}")
        if not expanded:
            for atom in prem + ([concl] if concl else []):
                if "{" in atom:
                    problems.append(f"{where}: {atom!r} holds a placeholder but the rule declares no expand")
    return problems


def substrate_heads(path: str = SUBSTRATE) -> set:
    with open(path, encoding="utf-8") as fh:
        return set(json.load(fh)["heads"])


def catalog_ids(directory: str = CATALOG_DIR) -> set:
    return {os.path.basename(p)[:-5] for p in glob.glob(os.path.join(directory, "*.yaml")) if not os.path.basename(p).startswith("_")}


def substrate_arities(path: str = SUBSTRATE) -> dict:
    """Head → the arities the substrate declares (a list)."""
    with open(path, encoding="utf-8") as fh:
        heads = json.load(fh)["heads"]
    return {name: T.arities_of(entry) for name, entry in heads.items()}


_SYMBOL = re.compile(r"[a-z][a-z0-9_]*")
FACT_KEYS = ("id", "meaning", "head", "truth", "reads", "entries", "notes")


def fact_id(group: dict, entry: list) -> str:
    """The statement name of one entry: the group id and the entry's symbolic arguments."""
    return group["id"] + "".join(f"_{a}" for a in entry if isinstance(a, str))


def check_facts(facts: list[dict], arities: dict | None = None, templates: set | None = None, seen: set | None = None) -> list[str]:
    """Structural problems of the facts: a known head of the right arity, ground symbolic or
    numeric arguments, unique statement names (also against the rules' ids when ``seen`` is
    shared), a truth value in range, known templates."""
    problems, seen = [], set() if seen is None else seen
    for i, g in enumerate(facts):
        where = f"facts[{i}] ({g.get('id', '?')})"
        gid = g.get("id")
        if not isinstance(gid, str) or not re.fullmatch(r"[a-z][a-z0-9_]*", gid):
            problems.append(f"{where}: id must be lowercase snake_case")
        if not g.get("meaning"):
            problems.append(f"{where}: no meaning")
        head = g.get("head")
        if not isinstance(head, str) or not re.fullmatch(r"[A-Z][A-Za-z0-9]*", head):
            problems.append(f"{where}: head must be an UpperCamelCase head")
            head = None
        elif arities is not None and head not in arities:
            problems.append(f"{where}: unknown head {head!r} (not in the substrate)")
            head = None
        truth = g.get("truth")
        if not (isinstance(truth, dict) and set(truth) == {"strength", "confidence"}
                and all(isinstance(truth[k], (int, float)) and 0 <= truth[k] <= 1 for k in truth)):
            problems.append(f"{where}: truth must be {{strength, confidence}} in [0, 1]")
        if templates is not None:
            for t in g.get("reads") or []:
                if t not in templates:
                    problems.append(f"{where}: reads unknown template {t!r}")
        for key in g:
            if key not in FACT_KEYS:
                problems.append(f"{where}: unknown key {key!r}")
        entries = g.get("entries")
        if not isinstance(entries, list) or not entries:
            problems.append(f"{where}: entries must be a non-empty list of argument lists")
            continue
        rows = set()
        for j, e in enumerate(entries):
            ew = f"{where}: entries[{j}]"
            if not isinstance(e, list) or not e or not all(isinstance(a, (str, int, float)) and not isinstance(a, bool) for a in e):
                problems.append(f"{ew}: must be a list of symbols and numbers")
                continue
            for a in e:
                if isinstance(a, str) and not _SYMBOL.fullmatch(a):
                    problems.append(f"{ew}: {a!r} is not a lowercase symbol (no variables in a fact)")
            if head and arities is not None and len(e) not in arities[head]:
                problems.append(f"{ew}: {head} takes {' or '.join(str(a) for a in arities[head])} arguments, not {len(e)}")
            key = tuple(str(a) for a in e)
            if key in rows:
                problems.append(f"{ew}: duplicate entry")
            rows.add(key)
            if isinstance(gid, str):
                name = fact_id(g, e)
                if name in seen:
                    problems.append(f"{ew}: statement name {name!r} already used")
                seen.add(name)
    return problems


def load_facts(path: str = RULES, strict: bool = True, rules: list[dict] | None = None) -> list[dict]:
    """The facts groups of the source (an empty list when it has none), validated; the rules'
    ids are reserved against the statement names when ``rules`` is given."""
    with open(path, encoding="utf-8") as fh:
        doc = yaml.safe_load(fh)
    facts = (doc or {}).get("facts") or []
    if not isinstance(facts, list):
        raise RulesError(f"{path}: `facts` must be a list")
    seen = {v["id"] for r in (rules or []) for v in expand(r)}
    problems = check_facts(facts, substrate_arities(), catalog_ids(), seen)
    if problems and strict:
        raise RulesError("\n".join(problems))
    return facts


def lower_fact(group: dict, entry: list, target: str = "pettachainer") -> str:
    """One lexicon entry in the consumer's form: a plain statement."""
    if target != "pettachainer":
        raise RulesError(f"no lowering for target {target!r}")
    args = " ".join(a if isinstance(a, str) else _num(a) for a in entry)
    s, c = group["truth"]["strength"], group["truth"]["confidence"]
    return f"(: {fact_id(group, entry)} ({group['head']} {args}) (STV {_num(s)} {_num(c)}))"


def statements_of(facts: list[dict], target: str = "pettachainer") -> list[str]:
    return [lower_fact(g, e, target) for g in facts for e in g["entries"]]


def load(path: str = RULES, strict: bool = True) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        doc = yaml.safe_load(fh)
    rules = (doc or {}).get("rules")
    if not isinstance(rules, list):
        raise RulesError(f"{path}: no `rules` list")
    problems = check(rules, substrate_heads(), catalog_ids())
    if problems and strict:
        raise RulesError("\n".join(problems))
    return rules


def _num(x) -> str:
    return repr(float(x))


def lower(rule: dict, target: str = "pettachainer") -> str:
    """One rule in the consumer's form."""
    if target != "pettachainer":
        raise RulesError(f"no lowering for target {target!r}")
    s, c = rule["truth"]["strength"], rule["truth"]["confidence"]
    if rule.get("semantics") == "equivalence":
        return f"(: {rule['id']} (Equivalence {rule['premises'][0]} {rule['conclusion']}) (STV {_num(s)} {_num(c)}))"
    premises = list(rule["premises"])
    for comp in rule.get("computations") or []:
        result = "true" if comp["result"] is True else comp["result"]
        premises.append(f"(Compute {comp['op']} ({' '.join(str(a) for a in comp['args'])}) -> {result})")
    premise = premises[0] if len(premises) == 1 else "(And " + " ".join(premises) + ")"
    tv = f"(CTV (STV {_num(s)} {_num(c)}) (STV 0.0 0.0))"      # deductive: nothing follows from a failed premise — a branch with no confidence
    return f"(: {rule['id']} (Implication {premise} {rule['conclusion']}) {tv})"


def concrete(rules: list[dict]) -> list[dict]:
    """Every rule the source stands for, expansions written out."""
    return [v for r in rules for v in expand(r)]


def runnable(rule: dict, target: str = "pettachainer") -> bool:
    """Whether the target can run the rule: it requires no capability the target lacks."""
    req = rule.get("requires")
    return req is None or req in TARGET_CAPABILITIES.get(target, set())


def render(rules: list[dict], target: str = "pettachainer", facts: list[dict] | None = None) -> str:
    """The consumer's file: the lexicon facts (loaded from the source unless given), then the
    rules."""
    if facts is None:
        facts = load_facts(rules=rules)
    lines = [
        ";; The catalog's background rules, lowered for the chainer from rules.yaml — generated by",
        ";; `python -m tmpl.rules`; never edited by hand. Loaded beside the emitted statements by a",
        ";; consumer, never by the parser. Each rule is a deductive implication with an explicit",
        ";; conditional truth value: the positive branch is the rule's reliability, the negative branch",
        ";; (STV 0.0 0.0) carries no confidence, so nothing follows from a failed or denied premise",
        ";; (a branch at (STV 0.0 1.0) would derive the conclusion DENIED, at full confidence). An",
        ";; equivalence (semantics: equivalence) is the chainer's Equivalence link with a plain STV: used in",
        ";; both directions at 2s/(1+s) with the rule's confidence, its denied side denying the other.",
    ]
    pending = [r for r in rules if not runnable(r, target)]
    if pending:
        lines.append(";;")
        lines.append(";; NOT WRITTEN, pending a capability of the chainer (the source states them; a consumer that")
        lines.append(";; can run them lowers them):")
        for r in pending:
            lines.append(f";;   {r['id']} — {r['meaning']} (requires {r['requires']})")
    lines.append("")
    if facts:
        lines.append(";; ===== Lexicon facts: background atoms with no variables, loaded with the rules (never parser output) =====")
        for g in facts:
            reads = f" (reads: {', '.join(g['reads'])})" if g.get("reads") else ""
            lines.append(f";; {g['id']}: {g['meaning']}{reads}")
            for e in g["entries"]:
                lines.append(lower_fact(g, e, target))
        lines.append("")
        lines.append(";; ===== Rules =====")
    for src in rules:
        if not runnable(src, target):
            continue
        reads = f" (reads: {', '.join(src['reads'])})" if src.get("reads") else ""
        variants = expand(src)
        suffix = f" — {len(variants)} variants, by the matrix event's tense" if src.get("expand") else ""
        lines.append(f";; {src['id']}: {src['meaning']}{reads}{suffix}")
        for r in variants:
            lines.append(lower(r, target))
    return "\n".join(lines) + "\n"


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="validate rules.yaml and write the chainer's rules file")
    ap.add_argument("--rules", default=RULES)
    ap.add_argument("--out", default=GENERATED)
    ap.add_argument("--check", action="store_true", help="validate and compare with the generated file; write nothing")
    args = ap.parse_args(argv)
    rules = load(args.rules)
    facts = load_facts(args.rules, rules=rules)
    text = render(rules, facts=facts)
    n = len([v for r in rules if runnable(r) for v in expand(r)])
    nf = len(statements_of(facts))
    pending = [r["id"] for r in rules if not runnable(r)]
    note = f", {len(pending)} pending the chainer's {', '.join(sorted({r['requires'] for r in rules if not runnable(r)}))}" if pending else ""
    if args.check:
        current = open(args.out, encoding="utf-8").read() if os.path.exists(args.out) else ""
        print(f"{len(rules)} rules ({n} lowered{note}) + {nf} lexicon facts valid · generated file {'fresh' if current == text else 'STALE'}")
        return 0 if current == text else 1
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(f"wrote {os.path.relpath(args.out, TEMPLATES)} ({len(rules)} rules, {n} lowered{note}; {nf} lexicon facts)")
    if args.out == GENERATED:
        from . import manifest as MF
        print(f"manifest {MF.write()['id']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
