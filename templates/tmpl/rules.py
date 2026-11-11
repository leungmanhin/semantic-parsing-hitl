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

Lowering for our engine line (target ``pettachainer``): ``(: id (Implication <premises> <conclusion>)
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

CLOSURES. A ``closures`` list names a family of RECURSIVE rules by the relation they build (``{id, meaning, head,
depth}``: kinship's ``Kin``), and each of its rules says ``closure: {name, role}``: ``input`` (feeds the closure:
kinship's lifts), ``base`` (concludes the head from no head), ``converse`` (reads one head atom, concludes it the other
way round) or ``compose`` (reads two head atoms, concludes a third). The source states the closure as it is meant —
recursive, unbounded. How it is lowered is the target's: for our engine line (``pettachainer``) ``unroll`` makes it
ACYCLIC, since that line's backward chaining loses deep proofs and its forward chaining revises an atom again and again
around a cycle — the head gains a DEPTH slot first (0 for a base conclusion, d + 1 for a composition of a depth-d atom
with a depth-0 one, below the closure's ``depth``), each converse rule is FOLDED into every base and compose rule (a
variant concluding the other way round) instead of reading the head, and a rule outside the closure that reads the head
reads it at any depth. The unrolled closure is the CLOSURE STAGE: written to its own file,
``generated/closure_rules.metta``, forward-chained once over a text's statements before a question is asked
(``tmpl.reason``), never beside the query-stage rules of ``seeded_rules.metta`` (a closure rule beside its own
conclusions would count them twice). Both are workarounds for our engine line, to re-test after the switch to upstream
PeTTaChainer (whose own gaps with recursive rules are measured in the engine checkout's repros of 2026-11-09).

UPSTREAM MASTER (target ``pettachainer-master``; measured on its commit b6aacc68). The same rules in that engine's
spelling, in a file of their own (``generated/seeded_rules.pettachainer-master.metta``), to be loaded beside statements
lowered for the same target (``tmpl.lower``). Three things differ. (1) The NEGATIVE BRANCH of a deductive rule is
written ``(STV 0.0 0.001)``: on that engine a branch at confidence 0 costs a conclusion drawn over an uncertain
premise most of its confidence (a role carried over a coreference link of (0.99 0.9) comes out at confidence 0.56;
with 0.001 it is 0.9, our line's value, and chains keep our line's numbers), while a branch at (STV 0.0 1.0) would
state that the conclusion is false without the premise. (2) An EQUIVALENCE is ``(BiImplication P Q)`` with ``(CTV
(STV s' c) (STV 0.0 1.0))``, s' = 2s/(1+s) as on our line: that engine has no Equivalence link (it refuses one as a
fact with free variables), and a two-way conditional whose denied side denies the other is what the link means. (3)
Some rules are NOT WRITTEN and listed in the file's header instead: a rule that ``requires`` a capability the engine
lacks (the rules over a sealed clause: loaded there, they stop every derivation of the knowledge base), and a
CLOSURE — its recursive rules and the rules that read its head — which that engine does not yet run reliably (the
repros of 2026-11-09); unrolling is our line's workaround, not that engine's. The lexicon facts are the same.
BEFORE LOADING, a consumer on that engine declares the PREDICATES positive-only (the engine's
``set_positive_only_predicate``): ``tmpl.lower.predicates`` once for the knowledge base, and each text's class symbols
(the ``predicates`` of its lowering) before that text's statements. Otherwise a question that nothing derives is
answered with a prior of low confidence — (0.92 0.001) for a role nobody has — instead of with nothing, and a rule
is read backwards as weak evidence. With them declared, the probes of ``tests/test_rules_engine_master.py`` give our
line's values.

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
from tmpl import catalog as CAT  # noqa: E402

RULES = os.path.join(TEMPLATES, "rules.yaml")
SUBSTRATE = os.path.join(TEMPLATES, "atom-type-substrates.json")
CATALOG_DIR = os.path.join(TEMPLATES, "catalog")
GENERATED = os.path.join(TEMPLATES, "generated", "seeded_rules.metta")
GENERATED_CLOSURE = os.path.join(TEMPLATES, "generated", "closure_rules.metta")
GENERATED_MASTER = os.path.join(TEMPLATES, "generated", "seeded_rules.pettachainer-master.metta")

SEMANTICS = ("deductive", "equivalence")
CLOSURE_ROLES = ("input", "base", "converse", "compose")
CLOSURE_KEYS = ("id", "meaning", "head", "depth", "notes")
OPS = ("+", "-", "*", "/", "clause-event", "!=", ">", "<")   # arithmetic, the event of a sealed clause, and boolean guards (result: true)
TENSES = {"none": None, "past": "Past", "future": "Future"}
CAPABILITIES = ("sealed-term-projection",)
MASTER = "pettachainer-master"                   # upstream PeTTaChainer master (the module doc)
TARGETS = ("pettachainer", MASTER)
TARGET_CAPABILITIES = {"pettachainer": {"sealed-term-projection"}, MASTER: set()}  # what each consumer can run; grows with the consumer
NEGATIVE_BRANCH = {"pettachainer": "(STV 0.0 0.0)", MASTER: "(STV 0.0 0.001)"}     # a deductive rule's failed-premise branch
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
            if key not in ("id", "meaning", "premises", "computations", "conclusion", "truth", "semantics", "reads", "notes", "expand", "requires", "closure"):
                problems.append(f"{where}: unknown key {key!r}")
        cl = r.get("closure")
        if cl is not None:
            if not (isinstance(cl, dict) and set(cl) == {"name", "role"} and cl.get("role") in CLOSURE_ROLES):
                problems.append(f"{where}: closure must be {{name, role}} with role one of {', '.join(CLOSURE_ROLES)}")
            elif r.get("semantics") == "equivalence" or r.get("expand") or r.get("requires"):
                problems.append(f"{where}: a closure rule is a plain deductive implication (no expand, no requires)")
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
        doc = CAT.load_yaml(fh)
    facts = (doc or {}).get("facts") or []
    if not isinstance(facts, list):
        raise RulesError(f"{path}: `facts` must be a list")
    seen = {v["id"] for r in (rules or []) for v in expand(r)}
    problems = check_facts(facts, substrate_arities(), catalog_ids(), seen)
    if problems and strict:
        raise RulesError("\n".join(problems))
    return facts


def lower_fact(group: dict, entry: list, target: str = "pettachainer") -> str:
    """One lexicon entry in the consumer's form: a plain statement (the same for both targets)."""
    if target not in TARGETS:
        raise RulesError(f"no lowering for target {target!r}")
    args = " ".join(a if isinstance(a, str) else _num(a) for a in entry)
    s, c = group["truth"]["strength"], group["truth"]["confidence"]
    return f"(: {fact_id(group, entry)} ({group['head']} {args}) (STV {_num(s)} {_num(c)}))"


def statements_of(facts: list[dict], target: str = "pettachainer") -> list[str]:
    return [lower_fact(g, e, target) for g in facts for e in g["entries"]]


def load(path: str = RULES, strict: bool = True) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        doc = CAT.load_yaml(fh)
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
    if target not in TARGETS:
        raise RulesError(f"no lowering for target {target!r}")
    s, c = rule["truth"]["strength"], rule["truth"]["confidence"]
    if rule.get("semantics") == "equivalence":
        if target == MASTER:            # no Equivalence link there: the two-way conditional, a denied side denying the other
            return (f"(: {rule['id']} (BiImplication {rule['premises'][0]} {rule['conclusion']}) "
                    f"(CTV (STV {_num(2 * s / (1 + s))} {_num(c)}) (STV 0.0 1.0)))")
        return f"(: {rule['id']} (Equivalence {rule['premises'][0]} {rule['conclusion']}) (STV {_num(s)} {_num(c)}))"
    premises = list(rule["premises"])
    for comp in rule.get("computations") or []:
        result = "true" if comp["result"] is True else comp["result"]
        premises.append(f"(Compute {comp['op']} ({' '.join(str(a) for a in comp['args'])}) -> {result})")
    premise = premises[0] if len(premises) == 1 else "(And " + " ".join(premises) + ")"
    tv = f"(CTV (STV {_num(s)} {_num(c)}) {NEGATIVE_BRANCH[target]})"   # deductive: nothing follows from a failed premise (the module doc)
    return f"(: {rule['id']} (Implication {premise} {rule['conclusion']}) {tv})"


def concrete(rules: list[dict]) -> list[dict]:
    """Every rule the source stands for, expansions written out."""
    return [v for r in rules for v in expand(r)]


def runnable(rule: dict, target: str = "pettachainer") -> bool:
    """Whether the target can run the rule: it requires no capability the target lacks."""
    req = rule.get("requires")
    return req is None or req in TARGET_CAPABILITIES.get(target, set())


def load_closures(path: str = RULES, rules: list[dict] | None = None, strict: bool = True) -> list[dict]:
    """The closures of the source (an empty list when it has none), checked against its rules: a known head, a depth,
    each member rule's shape fitting its role, and no rule outside a closure concluding its head."""
    with open(path, encoding="utf-8") as fh:
        doc = CAT.load_yaml(fh)
    closures = (doc or {}).get("closures") or []
    problems = check_closures(closures, rules if rules is not None else load(path, strict), substrate_heads())
    if problems and strict:
        raise RulesError("\n".join(problems))
    return closures


def _head_atoms(atoms: list[str], head: str) -> list[int]:
    return [i for i, a in enumerate(atoms) if T.parse(a)[:1] == [head]]


def check_closures(closures: list, rules: list[dict], heads: set | None = None) -> list[str]:
    problems = []
    if not isinstance(closures, list):
        return ["`closures` must be a list"]
    by_id = {}
    for i, c in enumerate(closures):
        where = f"closures[{i}] ({c.get('id', '?') if isinstance(c, dict) else '?'})"
        if not isinstance(c, dict) or set(c) - set(CLOSURE_KEYS) or not all(k in c for k in ("id", "meaning", "head", "depth")):
            problems.append(f"{where}: a closure is {{id, meaning, head, depth}} (notes optional)")
            continue
        if heads is not None and c["head"] not in heads:
            problems.append(f"{where}: unknown head {c['head']!r} (not in the substrate)")
        if not (isinstance(c["depth"], int) and c["depth"] >= 1):
            problems.append(f"{where}: depth must be a positive integer (the unrolled closure's bound)")
        by_id[c["id"]] = c
    for r in rules:
        cl, where = r.get("closure"), f"rule {r.get('id')}"
        if not cl:
            for c in by_id.values():
                if T.parse(r.get("conclusion") or "()")[:1] == [c["head"]]:
                    problems.append(f"{where}: concludes {c['head']}, the head of closure {c['id']}, but is not one of its rules")
            continue
        c = by_id.get(cl.get("name"))
        if c is None:
            problems.append(f"{where}: closure {cl.get('name')!r} is not declared")
            continue
        n = len(_head_atoms(r.get("premises") or [], c["head"]))
        concl = T.parse(r.get("conclusion") or "()")[:1] == [c["head"]]
        role = cl.get("role")
        want = {"input": (0, False), "base": (0, True), "converse": (1, True), "compose": (2, True)}.get(role)
        if want and (n, concl) != want:
            problems.append(f"{where}: a {role} rule reads {want[0]} {c['head']} atom(s) and "
                            f"{'concludes' if want[1] else 'does not conclude'} one (it reads {n})")
        if role == "converse":
            p = T.parse(r["premises"][_head_atoms(r["premises"], c["head"])[0]])
            if not all(isinstance(a, str) and a.startswith("$") for a in p[1:]):
                problems.append(f"{where}: a converse rule's head premise holds variables only")
    return problems


def _vars(tree) -> set:
    if isinstance(tree, list):
        return set().union(*[_vars(x) for x in tree]) if tree else set()
    return {tree} if isinstance(tree, str) and tree.startswith("$") else set()


def _sub(tree, m: dict):
    if isinstance(tree, list):
        return [_sub(x, m) for x in tree]
    return m.get(tree, tree) if isinstance(tree, str) else tree


def _fresh(name: str, taken: set) -> str:
    if name not in taken:
        return name
    for ch in "fghijklmnopqrstuvw":
        if f"${ch}" not in taken:
            return f"${ch}"
    k = 2
    while f"{name}{k}" in taken:
        k += 1
    return f"{name}{k}"


def _fold(producer: dict, converse: dict, head: str) -> dict:
    """The producer rule concluding the other way round: the converse rule's head premise unified with the producer's
    conclusion, its other premises inserted after the producer's first, its conclusion the variant's."""
    p_concl = T.parse(producer["conclusion"])
    taken = set().union(*[_vars(T.parse(a)) for a in producer["premises"] + [producer["conclusion"]]])
    taken |= {c["result"] for c in producer.get("computations") or [] if isinstance(c.get("result"), str)}
    cv_prem = [T.parse(a) for a in converse["premises"]]
    hi = _head_atoms(converse["premises"], head)[0]
    rename = {}
    for v in sorted(set().union(*[_vars(a) for a in cv_prem]) | _vars(T.parse(converse["conclusion"]))):
        if v not in _vars(cv_prem[hi]):
            rename[v] = _fresh(v, taken | set(rename.values()))
    unify = {v: arg for v, arg in zip(cv_prem[hi][1:], p_concl[1:])}
    m = {**rename, **unify}
    others = [T.render(_sub(a, m)) for i, a in enumerate(cv_prem) if i != hi]
    return {**producer, "id": f"{producer['id']}_converse",
            "meaning": f"{producer['meaning']} — read the other way round ({converse['meaning']})",
            "premises": producer["premises"][:1] + others + producer["premises"][1:],
            "conclusion": T.render(_sub(T.parse(converse["conclusion"]), m))}


def _at_depth(atom: str, head: str, depth) -> str:
    t = T.parse(atom)
    return T.render([t[0], str(depth)] + t[1:]) if t[:1] == [head] else atom


def unroll(rules: list[dict], closures: list[dict]) -> list[dict]:
    """The rules for our engine line: each closure made ACYCLIC (see the module notes) and marked ``stage: closure``,
    every other rule unchanged (``stage: query``) except that a premise on a closure's head reads any depth."""
    out = []
    by_name = {c["id"]: c for c in closures}
    for r in rules:
        cl = r.get("closure")
        if not cl:
            heads = [c["head"] for c in closures if _head_atoms(r["premises"], c["head"])]
            if heads:
                taken = set().union(*[_vars(T.parse(a)) for a in r["premises"] + [r["conclusion"]]])
                dv = _fresh("$d", taken)
                prem = r["premises"]
                for h in heads:
                    prem = [_at_depth(a, h, dv) for a in prem]
                r = {**r, "premises": prem}
            out.append({**r, "stage": "query"})
            continue
        c = by_name[cl["name"]]
        head, role = c["head"], cl["role"]
        if role == "converse":
            continue                                     # folded into every producer below
        if role == "input":
            out.append({**r, "stage": "closure"})
            continue
        converses = [x for x in rules if (x.get("closure") or {}) == {"name": c["id"], "role": "converse"}]
        for variant in [r] + [_fold(r, cv, head) for cv in converses]:
            if role == "base":
                out.append({**variant, "conclusion": _at_depth(variant["conclusion"], head, 0), "stage": "closure"})
                continue
            taken = set().union(*[_vars(T.parse(a)) for a in variant["premises"] + [variant["conclusion"]]])
            d = _fresh("$d", taken)
            e = _fresh("$e", taken | {d})
            idx = _head_atoms(variant["premises"], head)
            prem = list(variant["premises"])
            prem[idx[0]] = _at_depth(prem[idx[0]], head, d)
            prem[idx[1]] = _at_depth(prem[idx[1]], head, 0)
            comps = [{"result": e, "op": "+", "args": [d, 1]}, {"result": True, "op": "<", "args": [e, c["depth"]]}]
            out.append({**variant, "premises": prem, "computations": comps + list(variant.get("computations") or []),
                        "conclusion": _at_depth(variant["conclusion"], head, e), "stage": "closure"})
    return out


def stage_of(rule: dict) -> str:
    return rule.get("stage") or "query"


def closure_of(rule: dict, closures: list[dict]) -> str | None:
    """The closure a rule belongs to, or reads the head of; None for any other rule."""
    if rule.get("closure"):
        return rule["closure"]["name"]
    return next((c["id"] for c in closures if _head_atoms(rule["premises"], c["head"])), None)


def unwritten(rules: list[dict], closures: list[dict] | None = None, target: str = "pettachainer") -> list[tuple[dict, str]]:
    """The source rules a target's file leaves out, each with the reason: a capability the consumer lacks, or — for
    upstream master — a closure, whose recursive rules and readers that engine does not run yet."""
    out = []
    for r in rules:
        if not runnable(r, target):
            out.append((r, f"requires {r['requires']}"))
        elif target == MASTER and closure_of(r, closures or []):
            out.append((r, f"the closure {closure_of(r, closures or [])}"))
    return out


def _for_target(rules: list[dict], closures: list[dict], target: str) -> list[dict]:
    """The source rules a target runs, staged: for our engine line the closures unrolled (``unroll``); for upstream
    master the rules as the source states them, the unwritten ones left out."""
    if target == MASTER:
        skip = {r["id"] for r, _why in unwritten(rules, closures, target)}
        return [{**r, "stage": "query"} for r in rules if r["id"] not in skip]
    return unroll([r for r in rules if runnable(r, target)], closures)


def lowered(rules: list[dict], closures: list[dict] | None = None, target: str = "pettachainer") -> list[dict]:
    """The rules as the target runs them, each ``{"id", "meaning", "reads", "stage", "text"}`` in source order: for our
    engine line the closures unrolled (``unroll``), a rule pending a capability left out; for upstream master see
    ``unwritten``."""
    closures = closures if closures is not None else []
    out = []
    for r in _for_target(rules, closures, target):
        for v in expand(r):
            out.append({"id": v["id"], "meaning": v.get("meaning"), "reads": v.get("reads") or [], "stage": stage_of(r),
                        "text": lower(v, target)})
    return out


def render_closure(rules: list[dict], target: str = "pettachainer", closures: list[dict] | None = None) -> str:
    """The closure stage's file: the unrolled closures, forward-chained once over a text's statements with the lexicon
    facts of the seeded rules' file, before a question is asked (``tmpl.reason``)."""
    if closures is None:
        closures = load_closures(rules=rules)
    lines = [
        ";; The CLOSURE stage of the catalog's background rules (rules.yaml `closures`), UNROLLED for our engine line —",
        ";; generated by `python -m tmpl.rules`; never edited by hand. The source states each closure as recursive rules;",
        ";; here every closure head carries a depth (0 for a base conclusion, one more per composition, below the closure's",
        ";; bound) and each converse rule is folded into the rules it reads from, so no rule's conclusion feeds its own",
        ";; premises. These rules are FORWARD-CHAINED ONCE over a text's statements, with the lexicon facts of",
        ";; seeded_rules.metta, before a question is asked; what they derive is loaded beside the statements, and the",
        ";; question is asked with seeded_rules.metta alone (a closure rule beside its own conclusions would count them",
        ";; twice). A workaround for our engine line (tmpl.reason), to re-test after the switch to upstream PeTTaChainer.",
        "",
    ]
    for r in lowered(rules, closures, target):
        if r["stage"] != "closure":
            continue
        reads = f" (reads: {', '.join(r['reads'])})" if r["reads"] else ""
        lines.append(f";; {r['id']}: {r['meaning']}{reads}")
        lines.append(r["text"])
    return "\n".join(lines) + "\n"


def render(rules: list[dict], target: str = "pettachainer", facts: list[dict] | None = None,
           closures: list[dict] | None = None) -> str:
    """The consumer's file: the lexicon facts (loaded from the source unless given), then the
    query-stage rules (the closure stage has its own file: ``render_closure``)."""
    if facts is None:
        facts = load_facts(rules=rules)
    if closures is None:
        closures = load_closures(rules=rules)
    if target == MASTER:
        return _render_master(rules, facts, closures)
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
    for src in unroll([r for r in rules if runnable(r, target)], closures):
        if stage_of(src) != "query":
            continue
        reads = f" (reads: {', '.join(src['reads'])})" if src.get("reads") else ""
        variants = expand(src)
        suffix = f" — {len(variants)} variants, by the matrix event's tense" if src.get("expand") else ""
        lines.append(f";; {src['id']}: {src['meaning']}{reads}{suffix}")
        for r in variants:
            lines.append(lower(r, target))
    return "\n".join(lines) + "\n"


MASTER_HEADER = [
    ";; The catalog's background rules, lowered for UPSTREAM PeTTaChainer master from rules.yaml — generated by",
    ";; `python -m tmpl.rules`; never edited by hand. Loaded beside a text's statements lowered for the same engine",
    ";; (tmpl.lower, target pettachainer-master), never by the parser. Each rule is a deductive implication with an",
    ";; explicit conditional truth value: the positive branch is the rule's reliability; the negative branch is",
    ";; (STV 0.0 0.001) — on this engine a branch at confidence 0 costs a conclusion drawn over an uncertain premise",
    ";; most of its confidence, and a branch at (STV 0.0 1.0) would state the conclusion false without the premise.",
    ";; An equivalence is a BiImplication whose denied side denies the other (this engine has no Equivalence link).",
    ";;",
    ";; BEFORE LOADING ANYTHING, declare the predicates positive-only: set_positive_only_predicate(name) for each name",
    ";; of tmpl.lower.predicates(\"pettachainer-master\") — every head that states something of its arguments; not",
    ";; Member, not the logical links — and, before each text's statements, for that text's class symbols (the",
    ";; `predicates` of its lowering): declared after the statements they change nothing. Without them this engine",
    ";; answers a question that nothing derives with a prior of low confidence instead of with nothing, and reads a",
    ";; rule backwards as weak evidence.",
]


def _render_master(rules: list[dict], facts: list[dict], closures: list[dict]) -> str:
    """Upstream master's file: the header, what is not written and why, the lexicon facts, the rules."""
    lines = list(MASTER_HEADER)
    left = unwritten(rules, closures, MASTER)
    if left:
        lines.append(";;")
        lines.append(";; NOT WRITTEN for this engine (the source states them; they are lowered for it when it can run them):")
        for r, why in left:
            lines.append(f";;   {r['id']} — {r['meaning']} ({why})")
    lines.append("")
    if facts:
        lines.append(";; ===== Lexicon facts: background atoms with no variables, loaded with the rules (never parser output) =====")
        for g in facts:
            reads = f" (reads: {', '.join(g['reads'])})" if g.get("reads") else ""
            lines.append(f";; {g['id']}: {g['meaning']}{reads}")
            for e in g["entries"]:
                lines.append(lower_fact(g, e, MASTER))
        lines.append("")
        lines.append(";; ===== Rules =====")
    for src in _for_target(rules, closures, MASTER):
        reads = f" (reads: {', '.join(src['reads'])})" if src.get("reads") else ""
        lines.append(f";; {src['id']}: {src['meaning']}{reads}")
        for r in expand(src):
            lines.append(lower(r, MASTER))
    return "\n".join(lines) + "\n"


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="validate rules.yaml and write the chainer's rules file")
    ap.add_argument("--rules", default=RULES)
    ap.add_argument("--out", default=GENERATED)
    ap.add_argument("--check", action="store_true", help="validate and compare with the generated file; write nothing")
    args = ap.parse_args(argv)
    rules = load(args.rules)
    facts = load_facts(args.rules, rules=rules)
    closures = load_closures(args.rules, rules=rules)
    text = render(rules, facts=facts, closures=closures)
    closure = render_closure(rules, closures=closures)
    closure_out = os.path.join(os.path.dirname(args.out), os.path.basename(GENERATED_CLOSURE))
    master = render(rules, MASTER, facts=facts, closures=closures)
    master_out = os.path.join(os.path.dirname(args.out), os.path.basename(GENERATED_MASTER))
    n_master = len(lowered(rules, closures, MASTER))
    master_note = f"upstream master: {n_master} lowered, {len(unwritten(rules, closures, MASTER))} not written"
    low = lowered(rules, closures)
    n = sum(1 for r in low if r["stage"] == "query")
    nc = sum(1 for r in low if r["stage"] == "closure")
    nf = len(statements_of(facts))
    pending = [r["id"] for r in rules if not runnable(r)]
    note = f", {len(pending)} pending the chainer's {', '.join(sorted({r['requires'] for r in rules if not runnable(r)}))}" if pending else ""
    if args.check:
        current = open(args.out, encoding="utf-8").read() if os.path.exists(args.out) else ""
        current_c = open(closure_out, encoding="utf-8").read() if os.path.exists(closure_out) else ""
        current_m = open(master_out, encoding="utf-8").read() if os.path.exists(master_out) else ""
        fresh = current == text and current_c == closure and current_m == master
        print(f"{len(rules)} rules ({n} lowered{note}; {nc} in the closure stage; {master_note}) + {nf} lexicon facts valid · "
              f"generated files {'fresh' if fresh else 'STALE'}")
        return 0 if fresh else 1
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(text)
    with open(closure_out, "w", encoding="utf-8") as fh:
        fh.write(closure)
    with open(master_out, "w", encoding="utf-8") as fh:
        fh.write(master)
    print(f"wrote {os.path.relpath(args.out, TEMPLATES)} ({len(rules)} rules, {n} lowered{note}; {nf} lexicon facts), "
          f"{os.path.relpath(closure_out, TEMPLATES)} ({nc} closure rules) and "
          f"{os.path.relpath(master_out, TEMPLATES)} ({master_note})")
    if args.out == GENERATED:
        from . import manifest as MF
        print(f"manifest {MF.write()['id']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
