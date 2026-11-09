"""REASONING SETUP on our engine line — two WORKAROUNDS, to be RE-TESTED after the switch to upstream PeTTaChainer (they
may become unnecessary there). Neither changes a record: what NESS receives is the emitter's records as they are.

1. THE RESOLVED VIEW (a lowering for reasoning). Every CERTAIN coref link (strength ≥ 0.99: the parser's "certain")
   and every stated identity at that strength ((Same x y): the identity template) merges its first symbol into its
   second, chains followed; the merged Coref statements and the duplicate atoms are
   dropped; a weaker link (likely, unsure) stays a link for the coref rules. Why: each mention is its own symbol and the
   coref rules copy every role across the links, so a chain of compositions multiplies its search per mention; on our
   line the chainer then runs out of memory or loses the nested proofs (2026-11-09 probes on the CLUTRR trial). The
   question's query is read on the same view (its symbols merged the same way).

2. SATURATION (a runner step). The rules of the CLOSURE stage (rules.yaml `stage: closure`: the kinship layers) are
   forward-chained once over the view, before the question is asked; what they derive is loaded beside the statements,
   and the question is asked with the other rules only — a closure rule left beside its own conclusions would count them
   twice. Why: backward chaining alone loses valid proofs three or more compositions deep on our line. The closure is
   acyclic by construction (each layer reads only the layers below it): forward chaining revises an atom again and again
   around a cycle, and one uncertain link then drags every connected truth value down (story 2 of the trial: 0.06–0.31).
   The coref rules stay in the query stage, where backward chaining is cycle-safe.

    view(statements, threshold) -> {"statements", "canon"}
    on_view(text, canon)        -> a statement or a query with the merged symbols replaced
    rule_sets()                 -> {"facts", "closure", "query"}: the catalog's background, lowered, by stage
    question_job(statements, queries, sets) -> a job for ``tmpl.answers.run_job`` (inside the engine's environment)

    python -m tmpl.reason jobs   --sample SEL --parsed PARSED --out JOBS.json    # one job per block that ends with a question
    (engine)  python -m tmpl.answers run JOBS.json OUT.json
    python -m tmpl.reason report --jobs JOBS.json --results OUT.json             # answers, and the dataset's target if any
"""
from __future__ import annotations

import argparse
import json
import sys

from . import answers as A

CERTAIN = 0.99


def view(statements: list[str], threshold: float = CERTAIN) -> dict:
    """The resolved view of a text's statements: ``{"statements", "canon"}``. Every certain link joins its two symbols
    in one class (a mention can be linked twice — to its antecedent by coref and to a name by a stated identity); each
    class is named by its member mentioned first in the statements, and ``canon`` maps every other member to it."""
    first: dict = {}
    for i, st in enumerate(statements):
        for tok in A._TOKEN.findall(st):
            if tok.startswith("sk_"):
                first.setdefault(tok, i)
    parent: dict = {}

    def find(s):
        while parent.get(s, s) != s:
            parent[s] = parent.get(parent[s], parent[s])
            s = parent[s]
        return s

    for st in statements:
        p = A.statement_parts(st)
        if p and isinstance(p[1], list) and len(p[1]) == 3 and p[1][0] in ("Coref", "Same") and p[2] and p[2][0] >= threshold \
                and isinstance(p[1][1], str) and isinstance(p[1][2], str):
            a, b = find(p[1][1]), find(p[1][2])
            if a != b:                                      # the class keeps the member mentioned first
                keep, drop = sorted((a, b), key=lambda s: (first.get(s, len(statements)), s))
                parent[drop] = keep

    canon = {k: find(k) for k in list(parent) if find(k) != k}

    def sub(t):
        return [sub(x) for x in t] if isinstance(t, list) else canon.get(t, t)

    out, seen = [], set()
    for st in statements:
        p = A.statement_parts(st)
        if not p:
            out.append(st)
            continue
        name, term, tv = p
        t2 = sub(term)
        if isinstance(t2, list) and len(t2) == 3 and t2[0] in ("Coref", "Same") and t2[1] == t2[2]:
            continue                                        # a merged link: it holds by the merge
        key = A.render(t2)
        if key in seen:
            continue                                        # the same atom again (a second mention's Name …): stated once
        seen.add(key)
        out.append(f"(: {name} {key} (STV {tv[0]} {tv[1]}))" if tv else f"(: {name} {key} {A.render(A.parse(st)[3])})")
    return {"statements": out, "canon": canon}


def on_view(text: str, canon: dict) -> str:
    """A statement or a query text with the view's merged symbols replaced."""
    def sub(t):
        return [sub(x) for x in t] if isinstance(t, list) else canon.get(t, t)
    return A.render(sub(A.parse(text)))


def rule_sets(path: str | None = None, target: str = "pettachainer") -> dict:
    """The catalog's background, lowered for the target and split by stage: the lexicon ``facts`` (both stages), the
    ``closure`` rules (forward-chained once) and the ``query`` rules (beside the question)."""
    from . import rules as R                                # noqa: PLC0415 (needs the rules source: our side only)
    rules = R.load(path or R.RULES)
    facts = R.load_facts(path or R.RULES, rules=rules)
    closures = R.load_closures(path or R.RULES, rules=rules)
    out = {"facts": R.statements_of(facts, target), "closure": [], "query": []}
    for r in R.lowered(rules, closures, target):              # the closures unrolled for the target (tmpl.rules)
        out[r["stage"]].append(r["text"])
    return out


def rule_sets_from_files(seeded: str, closure: str) -> dict:
    """The same split read from the generated files (``seeded_rules.metta``: the facts and the query stage;
    ``closure_rules.metta``: the closure stage) — pure Python, for the engine's environment."""
    with open(seeded, encoding="utf-8") as fh:
        stmts = A.statements_of(fh.read())
    with open(closure, encoding="utf-8") as fh:
        closure_rules = A.statements_of(fh.read())
    rule = [s for s in stmts if "(Implication " in s or "(Equivalence " in s]
    return {"facts": [s for s in stmts if s not in rule], "query": rule, "closure": closure_rules}


def question_job(statements: list[str], queries: list[str], sets: dict | None = None, steps: int = 2000,
                 threshold: float = CERTAIN) -> dict:
    """A job for ``tmpl.answers.run_job``: the text's statements on the resolved view, the question's queries on the
    same view, the closure stage to saturate first, the query stage beside the question."""
    sets = sets if sets is not None else rule_sets()
    v = view(statements, threshold)
    job = {"statements": v["statements"], "canon": v["canon"], "queries": [on_view(q, v["canon"]) for q in queries],
           "rules": sets["facts"] + sets["query"], "steps": steps}
    if sets["closure"]:
        job["saturate"] = {"facts": sets["facts"], "rules": sets["closure"], "steps": steps}
    return job


# --------------------------------------------------------------------------
# the runner: blocks that end with a question
# --------------------------------------------------------------------------


def jobs_of(sample: str, parsed: str, steps: int = 2000) -> list[dict]:
    """One job per block of the selection whose last parsed sentence is a question: the earlier sentences' statements,
    the question's queries (as the sentence mode read them), the row's task target when the dataset gives one."""
    from . import blocks as B, catalog as CAT                # noqa: PLC0415
    catalog = CAT.load()
    with open(sample, encoding="utf-8") as fh:
        rows = [json.loads(l) for l in fh if l.strip()]
    replies = B.read_replies(parsed)
    sets = rule_sets()
    out = []
    for block in B.blocks_of(rows):
        prior, _ = B.walk(block, replies)
        if not prior:
            continue
        recs = B.block_records(prior, catalog)
        last = recs[-1]
        if last.get("kind") != "question" or last["status"] != "ok":
            continue
        statements = [s for r in recs[:-1] for s in r["statements"]]
        asked = last["question"]
        job = question_job(statements, asked["queries"], sets, steps)
        job.update({"doc": block[0].get("doc"), "question": last["text"], "form": asked["form"],
                    "asked": [a["var"] for a in asked["asked"]], "patterns": [A.parse(q)[2] for q in job["queries"]],
                    "target": (prior[-1]["row"].get("task") or {}).get("answer")})
        out.append(job)
    return out


def report(jobs: list[dict], results: list[dict]) -> list[dict]:
    """Per job its answers — per asked variable the referents or words, the best truth value first — and the target."""
    out = []
    for job, res in zip(jobs, results):
        idx_statements = job["statements"] + (res.get("derived") or [])
        found: dict = {}
        best_yes = None
        for pattern, lines in zip(job["patterns"], res["results"]):
            a = A.answers(lines, pattern, job["asked"], idx_statements)
            if a["best"] is not None and (best_yes is None or (a["best"][1], a["best"][0]) > (best_yes[1], best_yes[0])):
                best_yes = a["best"]
            for ans in a["answers"]:
                key = json.dumps(ans["key"])
                if key not in found or (ans["best"] or (0, 0))[1] > (found[key]["best"] or (0, 0))[1]:
                    found[key] = ans
        ranked = sorted(found.values(), key=lambda g: (-(g["best"] or (0, 0))[1], -(g["best"] or (0, 0))[0]))
        out.append({"doc": job.get("doc"), "question": job.get("question"), "form": job.get("form"), "target": job.get("target"),
                    "best": best_yes, "answers": ranked, "derived": len(res.get("derived") or []),
                    "refused": len(res.get("refused") or [])})
    return out


def _words(ans: dict) -> str:
    parts = []
    for var, d in ans["bindings"].items():
        parts.append("/".join(d.get("names") or []) or d.get("value") or "?")
    return ", ".join(parts)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m tmpl.reason", description=__doc__.split("\n\n")[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    j = sub.add_parser("jobs", help="one engine job per block that ends with a question")
    j.add_argument("--sample", required=True)
    j.add_argument("--parsed", required=True)
    j.add_argument("--out", required=True)
    j.add_argument("--steps", type=int, default=2000)
    r = sub.add_parser("report", help="the engine's results read back into answers")
    r.add_argument("--jobs", required=True)
    r.add_argument("--results", required=True)
    args = ap.parse_args(argv)
    if args.cmd == "jobs":
        jobs = jobs_of(args.sample, args.parsed, args.steps)
        with open(args.out, "w", encoding="utf-8") as fh:
            json.dump(jobs, fh, ensure_ascii=False, indent=1)
        print(f"{len(jobs)} jobs → {args.out} (closure stage: {'yes' if jobs and jobs[0].get('saturate') else 'none'})")
        return 0
    with open(args.jobs, encoding="utf-8") as fh:
        jobs = json.load(fh)
    with open(args.results, encoding="utf-8") as fh:
        results = json.load(fh)
    results = results if isinstance(results, list) else [results]
    for row in report(jobs, results):
        if row["form"] == "yes-no":
            got = f"truth value {row['best']}" if row["best"] else "no proof (unknown)"
        else:
            got = "; ".join(f"{_words(a)} {tuple(round(x, 2) for x in a['best'])}" for a in row["answers"][:4]) or "no answer"
        tgt = f" · target {row['target']}" if row["target"] else ""
        print(f"{row['question']}{tgt}\n    → {got}   [{row['derived']} derived, {row['refused']} refused]")
    return 0


if __name__ == "__main__":
    sys.exit(main())
