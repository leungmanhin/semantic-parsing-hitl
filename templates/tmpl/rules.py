"""The catalog's background rules: a consumer-neutral source (rules.yaml) and its lowering.

A rule is an inference the parse leaves out on purpose: premises and a conclusion as atom patterns
over the substrate's heads, optional arithmetic steps, a reliability (strength, confidence) and a
semantics. ``load`` validates the source, ``lower`` renders one rule for a consumer, ``render``
writes the consumer's file:

    python -m tmpl.rules                 # validate rules.yaml, write generated/seeded_rules.metta

Lowering for the chainer (the only target so far): ``(: id (Implication <premises> <conclusion>)
(CTV (STV s c) (STV 0.0 1.0)))``. The explicit conditional is the chainer's documented form for a
conditional relationship; its negative branch states the deductive semantics (nothing follows from
a failed premise). A bare ``(STV s c)`` would make the chainer estimate that branch from base rates
over stored facts, which collapses the confidence of any conclusion drawn from a premise below
strength 1.0. Arithmetic steps lower to the chainer's ``(Compute op (args) -> result)`` premise.
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
OPS = ("+", "-")
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


def check(rules: list[dict], heads: set | None = None, templates: set | None = None) -> list[str]:
    """Structural problems of the source; an empty list means it is sound."""
    problems, seen = [], set()
    for i, r in enumerate(rules):
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
            if not (isinstance(c["result"], str) and c["result"].startswith("$")):
                problems.append(f"{cw}: result must be a variable")
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
            if key not in ("id", "meaning", "premises", "computations", "conclusion", "truth", "semantics", "reads", "notes"):
                problems.append(f"{where}: unknown key {key!r}")
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
        premises.append(f"(Compute {c['op']} ({' '.join(str(a) for a in c['args'])}) -> {c['result']})")
    premise = premises[0] if len(premises) == 1 else "(And " + " ".join(premises) + ")"
    s, c = rule["truth"]["strength"], rule["truth"]["confidence"]
    tv = f"(CTV (STV {_num(s)} {_num(c)}) (STV 0.0 1.0))"      # deductive: nothing follows from a failed premise
    return f"(: {rule['id']} (Implication {premise} {rule['conclusion']}) {tv})"


def render(rules: list[dict], target: str = "pettachainer") -> str:
    lines = [
        ";; The catalog's background rules, lowered for the chainer from rules.yaml — generated by",
        ";; `python -m tmpl.rules`; never edited by hand. Loaded beside the emitted statements by a",
        ";; consumer, never by the parser. Each rule is a deductive implication with an explicit",
        ";; conditional truth value: the positive branch is the rule's reliability, the negative branch",
        ";; (STV 0.0 1.0) says nothing follows from a failed premise.",
        "",
    ]
    for r in rules:
        reads = f" (reads: {', '.join(r['reads'])})" if r.get("reads") else ""
        lines.append(f";; {r['id']}: {r['meaning']}{reads}")
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
    if args.check:
        current = open(args.out, encoding="utf-8").read() if os.path.exists(args.out) else ""
        print(f"{len(rules)} rules valid · generated file {'fresh' if current == text else 'STALE'}")
        return 0 if current == text else 1
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(f"wrote {os.path.relpath(args.out, TEMPLATES)} ({len(rules)} rules)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
