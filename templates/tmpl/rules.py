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
(CTV (STV s c) (STV 0.0 1.0)))``. The explicit conditional is the chainer's documented form for a
conditional relationship; its negative branch states the deductive semantics (nothing follows from
a failed premise). A bare ``(STV s c)`` would make the chainer estimate that branch from base rates
over stored facts, which collapses the confidence of any conclusion drawn from a premise below
strength 1.0. Arithmetic steps lower to the chainer's ``(Compute op (args) -> result)`` premise; a
boolean guard (``!=``, ``>``, ``<`` with ``result: true``) is a premise that holds only when the test does.
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

SEMANTICS = ("deductive",)
OPS = ("+", "-", "clause-event", "!=", ">", "<")   # arithmetic, the event of a sealed clause, and boolean guards (result: true)
TENSES = {"none": None, "past": "Past", "future": "Future"}
CAPABILITIES = ("sealed-term-projection",)
TARGET_CAPABILITIES = {"pettachainer": {"sealed-term-projection"}}  # what each consumer can run; grows with the consumer
_VAR = re.compile(r"\$[A-Za-z_][A-Za-z0-9_]*")


class RulesError(Exception):
    pass


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
                    if h not in heads:
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
    premises = list(rule["premises"])
    for c in rule.get("computations") or []:
        result = "true" if c["result"] is True else c["result"]
        premises.append(f"(Compute {c['op']} ({' '.join(str(a) for a in c['args'])}) -> {result})")
    premise = premises[0] if len(premises) == 1 else "(And " + " ".join(premises) + ")"
    s, c = rule["truth"]["strength"], rule["truth"]["confidence"]
    tv = f"(CTV (STV {_num(s)} {_num(c)}) (STV 0.0 1.0))"      # deductive: nothing follows from a failed premise
    return f"(: {rule['id']} (Implication {premise} {rule['conclusion']}) {tv})"


def concrete(rules: list[dict]) -> list[dict]:
    """Every rule the source stands for, expansions written out."""
    return [v for r in rules for v in expand(r)]


def runnable(rule: dict, target: str = "pettachainer") -> bool:
    """Whether the target can run the rule: it requires no capability the target lacks."""
    req = rule.get("requires")
    return req is None or req in TARGET_CAPABILITIES.get(target, set())


def render(rules: list[dict], target: str = "pettachainer") -> str:
    lines = [
        ";; The catalog's background rules, lowered for the chainer from rules.yaml — generated by",
        ";; `python -m tmpl.rules`; never edited by hand. Loaded beside the emitted statements by a",
        ";; consumer, never by the parser. Each rule is a deductive implication with an explicit",
        ";; conditional truth value: the positive branch is the rule's reliability, the negative branch",
        ";; (STV 0.0 1.0) says nothing follows from a failed premise.",
    ]
    pending = [r for r in rules if not runnable(r, target)]
    if pending:
        lines.append(";;")
        lines.append(";; NOT WRITTEN, pending a capability of the chainer (the source states them; a consumer that")
        lines.append(";; can run them lowers them):")
        for r in pending:
            lines.append(f";;   {r['id']} — {r['meaning']} (requires {r['requires']})")
    lines.append("")
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
    text = render(rules)
    n = len([v for r in rules if runnable(r) for v in expand(r)])
    pending = [r["id"] for r in rules if not runnable(r)]
    note = f", {len(pending)} pending the chainer's {', '.join(sorted({r['requires'] for r in rules if not runnable(r)}))}" if pending else ""
    if args.check:
        current = open(args.out, encoding="utf-8").read() if os.path.exists(args.out) else ""
        print(f"{len(rules)} rules ({n} lowered{note}) valid · generated file {'fresh' if current == text else 'STALE'}")
        return 0 if current == text else 1
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(f"wrote {os.path.relpath(args.out, TEMPLATES)} ({len(rules)} rules, {n} lowered{note})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
