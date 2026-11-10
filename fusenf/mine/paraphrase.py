"""§5.4 END TO END — paraphrase alignment: learn invariance and its boundaries together (the decisions of 2026-11-04).

THE INPUT is the labelled pairs of the paraphrase sets (``datasets/prepared/<dataset>.pairs.jsonl``: SICK, MRPC) whose
two sentences both have a parse. The pairs of the MINING share propose; the pairs of the EVALUATION share (whole
families held out) only measure. THE LABELS ARE FIELDS: they never enter the alignment, the classification or the
proposal of a candidate; they mark the near-neighbours of the boundary check and score the evaluation.

    python -m fusenf.mine paraphrase --run NAME --step align      (our side: alignments, round-1 jobs)
    (engine) python -m fusenf.mine.chainer run …                 (round 1)
    python -m fusenf.mine paraphrase --run NAME --step classify   (verdicts, candidates, round-2 jobs)
    (engine) round 2
    python -m fusenf.mine paraphrase --run NAME --step admit      (support, boundary, admission, round-3 jobs)
    (engine) round 3
    python -m fusenf.mine paraphrase --run NAME --step evaluate   (the evaluation, the summary)
    python -m fusenf.mine paraphrase --run NAME --step all --engine-python <the chainer env's python>

THE STEPS
  1. ALIGN every pair (``fusenf.mine.align``): the correspondence of the two sentences' individuals, the core, the
     residual edits; the alignment run again on renamed and shuffled copies of both sentences (the renaming check).
  2. ROUND 1 — each sentence's space (its statements on the resolved view + the catalog's background rules: the
     lexicon facts and the query-stage rules) is asked the OTHER sentence's statements, written in its symbols where
     the alignment makes two individuals correspond and as variables elsewhere: "does X derive Y?" A rule the emitter
     adds beside a sentence's own facts (an adjective's default, a group's distribution rule, a narrowed class's
     definition: ``align.implied_rule``) is not asked. A denied generic ("There is no biker jumping") is also asked as
     an INSTANCE of what it denies (a biker jumping).
  3. CLASSIFY by the answers, per direction: HOLDS (every statement derived at its own polarity), CONTRADICTS (one
     derived at the opposite polarity, or an instance of a denial found), FAILS; per pair: EQUIVALENCE (both hold),
     ONE-WAY, CONTRADICTION, RELATEDNESS (neither holds, the core shares an atom), UNRELATED. Then the CANDIDATES the
     mining pairs' residuals propose, per direction: a CLASS correspondence (kid → child) with one rule per position it
     was seen at, a SUBSTITUTION with its rule; drops, flips and band differences propose nothing.
  4. ROUND 2 — every mining direction that FAILS is asked again with its own residual's candidates as rules: does the
     pair hold UNDER its residual?
  5. ADMIT — a candidate is SUPPORTED by a direction that holds under it alone (SOLE) or with others (JOINT); it is
     VIOLATED by a near-neighbour that holds under it alone in a direction the label denies (SICK: neutral or
     contradiction in that direction; MRPC: a non-paraphrase that becomes equivalent); several candidates together
     make a CONTACT, recorded. Admitted: sole support in ``min_sole_families`` families and no violation.
  6. ROUND 3 — every evaluation direction that failed is asked again with the admitted candidates' rules.
  7. EVALUATE — the chainer's verdicts against the human labels before and after: precision and recall of a holding
     direction against entailment (SICK, per direction) and of equivalence against paraphrase (MRPC), the
     contradictions found, and the do-no-harm count of directions labelled neutral or contradiction that come to hold.

Outputs: ``fusenf/runs/NAME/paraphrase/`` (pairs, sentences, the background, each round's jobs and results,
candidates, support — regenerable) and ``fusenf/runs/NAME/paraphrase.md`` + ``paraphrase.report.json``.
"""
from __future__ import annotations

import collections
import hashlib
import json
import os
import subprocess
import sys
import time

from . import REPO, RUNS, align as AL, atoms as A, candidates as CD, generalize as G, lift as L
from tmpl import answers as ANS

PAIR_FILES = {"sick": os.path.join(REPO, "datasets", "prepared", "sick.pairs.jsonl"),
              "mrpc": os.path.join(REPO, "datasets", "prepared", "mrpc.pairs.jsonl")}
DEFAULT = {
    "datasets": ["sick", "mrpc"],
    "beam": 64,                        # the alignment search's width
    "steps": 400,                      # the engine's steps per query
    "min_confidence": 0.1,             # an answer below this confidence is no evidence
    "polarity_cut": 0.5,               # a strength at or above it is positive
    "coref_threshold": 0.99,           # the resolved view's certain links (tmpl.reason)
    "min_sole_families": 2,            # admission: sole support in this many mining families …
    #                                    … and no violation on a near-neighbour of the mining share
    "background": "facts + query-stage rules",   # the kinship closure (forward-chained in tmpl.reason) is left out
}
DIRS = ("x>y", "y>x")


def params_of(**overrides) -> dict:
    p = dict(DEFAULT)
    p.update({k: v for k, v in overrides.items() if v is not None})
    return p


def _out(run: str) -> str:
    return os.path.join(RUNS, run, "paraphrase")


def _jsonl(path: str) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        return [json.loads(l) for l in fh if l.strip()]


def _write_jsonl(path: str, rows) -> int:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    n = 0
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
            n += 1
    return n


# ---------------------------------------------------------------------------------------------- step 1: align

def run_inputs(run: str) -> list[str]:
    """The parsed files a lift run read (its summary's ``inputs:`` line)."""
    path = os.path.join(RUNS, run, "summary.md")
    if os.path.exists(path):
        for line in open(path, encoding="utf-8"):
            if line.startswith("inputs: "):
                return [os.path.normpath(os.path.join(os.path.dirname(RUNS), p.strip())) for p in line[8:].split(",") if p.strip()]
    return []


def pairs_of(rows: list[dict], datasets: list[str]) -> tuple[list[dict], dict]:
    """The labelled pairs whose two sentences have a reply, with their labels as fields."""
    by_doc = {}
    for r in rows:
        if r.get("dataset") in datasets and r.get("doc") is not None:
            by_doc[(r["dataset"], str(r["doc"]))] = r
    out, missing = [], collections.Counter()
    for ds in datasets:
        for p in _jsonl(PAIR_FILES[ds]):
            a, b = by_doc.get((ds, str(p["a"]))), by_doc.get((ds, str(p["b"])))
            if a is None or b is None:
                missing[f"{ds}/{p.get('role')}"] += 1
                continue
            labels = {k: p[k] for k in ("label", "ab", "ba", "relatedness", "same_caption") if k in p}
            out.append({"pair": p["pair"], "dataset": ds, "family": p.get("family"), "role": p.get("role"), "split": p.get("split"),
                        "x": a["id"], "y": b["id"], "labels": labels})
    return out, dict(missing)


def _token_map(phi: dict) -> dict:
    """The symbols of one side written as the other's: a sentence-level individual as its counterpart, a rule's skolem
    function by the function its counterpart term uses."""
    tok = {}
    for s, t in phi.items():
        if AL.zone(s) == 0:
            tok[s] = t
        elif s.startswith("(") and t.startswith("(") and "@" in s and "@" in t:
            fs, ft = s[1:].split(" ", 1)[0], t[1:].split(" ", 1)[0]
            tok.setdefault(fs, ft)
    return tok


def _ask_term(t, tok: dict, unmapped: dict):
    if isinstance(t, list):
        if A.is_function_term(t):
            return [tok.get(t[0], t[0])] + [_ask_term(x, tok, unmapped) for x in t[1:]]
        return [_ask_term(x, tok, unmapped) for x in t]
    if isinstance(t, str) and t.startswith("sk_"):
        if t in tok:
            return tok[t]
        if t not in unmapped:
            unmapped[t] = f"$u{len(unmapped) + 1}"
        return unmapped[t]
    return t


def _uvars(t) -> set:
    if isinstance(t, list):
        return set().union(*[_uvars(x) for x in t]) if t else set()
    return {t} if isinstance(t, str) and t.startswith("$u") else set()


def _instance(term) -> list | None:
    """What a denied generic ``(Implication P Q)`` denies, as an instance pattern: the atoms of P and Q in one
    conjunction, each skolem function term (an existential of the consequent) a fresh variable. A rule among them that
    the instance's own atoms imply (``align.implied_rule``: the distribution rule of a group inside the denied content)
    is left out — whoever has the atoms has it. ``None`` when the denied content holds a rule of its own: no
    conjunction asks for a rule, so there is no instance to look for."""
    fresh: dict = {}

    def sub(t):
        if isinstance(t, list):
            if A.is_function_term(t):
                k = ANS.render(t)
                fresh.setdefault(k, f"$w{len(fresh) + 1}")
                return fresh[k]
            return [sub(x) for x in t]
        return t
    atoms = []
    for part in (term[1], term[2]):
        for a in (part[1:] if isinstance(part, list) and part and part[0] == "And" else [part]):
            if isinstance(a, list) and a and a[0] in ("Implication", "Equivalence"):
                if AL.implied_rule(a) is None:
                    return None
                continue
            atoms.append(sub(a))
    if not atoms:
        return None
    return ["And"] + atoms if len(atoms) > 1 else atoms[0]


def questions(asker: AL.Side, asked_of_map: dict, tag: str, cut: float) -> list[dict]:
    """The statements of ``asker`` (the side whose content is checked) as queries for the other side's space,
    ``asked_of_map`` writing asker's symbols as the other side's. Statements that share an individual with no
    counterpart are asked together (one conjunction: the same individual in each), when all are positive."""
    tok = _token_map(asked_of_map)
    unmapped: dict = {}
    items = []
    for st in asker.statements:
        p = ANS.statement_parts(st)
        if not p or not isinstance(p[1], list):
            continue
        name, term, tvv = p
        if AL.implied_rule(term):
            continue
        s = tvv[0] if tvv else 1.0
        items.append({"name": name, "term": _ask_term(term, tok, unmapped), "raw": term, "sign": "+" if s >= cut else "-",
                      "rule": term[0] in ("Implication", "Equivalence"), "strength": s})
    out = []
    facts = [it for it in items if not it["rule"]]
    parent = list(range(len(facts)))

    def find(i):
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i
    owner: dict = {}
    for i, it in enumerate(facts):
        for v in _uvars(it["term"]):
            if v in owner:
                parent[find(i)] = find(owner[v])
            else:
                owner[v] = i
    groups: dict = collections.defaultdict(list)
    for i in range(len(facts)):
        groups[find(i)].append(facts[i])
    for g in sorted(groups.values(), key=lambda g: g[0]["name"]):
        if len(g) > 1 and all(it["sign"] == "+" for it in g):
            out.append({"kind": "fact", "sign": "+", "statements": [it["name"] for it in g], "strength": min(it["strength"] for it in g),
                        "q": f"(: $prf {ANS.render(['And'] + [it['term'] for it in g])} $tv)"})
        else:
            for it in g:
                out.append({"kind": "fact", "sign": it["sign"], "statements": [it["name"]], "split": len(g) > 1, "strength": it["strength"],
                            "q": f"(: $prf {ANS.render(it['term'])} $tv)"})
    for it in items:
        if it["rule"]:
            out.append({"kind": "rule", "sign": it["sign"], "statements": [it["name"]], "strength": it["strength"],
                        "q": f"(: $prf {ANS.render(it['term'])} $tv)"})
            inst = _instance(it["raw"]) if it["raw"][0] == "Implication" and it["strength"] <= 0.05 else None
            if inst is not None:
                inst = _ask_term(inst, tok, dict(unmapped))
                out.append({"kind": "deny", "sign": "+", "statements": [it["name"]], "q": f"(: $prf {ANS.render(inst)} $tv)"})
    for k, q in enumerate(out):
        q["id"] = f"{tag}|{k}"
    return out


def _signature(co: dict, ed: dict, al: dict) -> str:
    return json.dumps([co["pattern"], sorted(collections.Counter(k for _, _, k, _ in al["pairs"]).items()),
                       sorted((c["a"], c["b"], c["position"]) for c in ed["classes"]), sorted(s["key"] for s in ed["substitutions"]),
                       sorted((d["side"], d["key"]) for d in ed["drops"])])


def step_align(run: str, parsed: list[str], params: dict, limit: int | None = None) -> dict:
    from tmpl import catalog as CAT, coverage as C, reason as R          # noqa: PLC0415 (our side only)
    t0 = time.time()
    catalog = CAT.load()
    rows = []
    for p in parsed:
        rows += _jsonl(p)
    rows = C.latest(rows)
    pairs, missing = pairs_of(rows, params["datasets"])
    if limit:
        pairs = pairs[:limit]
    by_id = {r["id"]: r for r in rows}
    sides: dict[str, AL.Side | None] = {}

    def side(sid):
        if sid not in sides:
            sides[sid] = AL.Side.of_record(by_id[sid], catalog, params["coref_threshold"])
        return sides[sid]
    out_pairs, no_graph, renamed_same = [], collections.Counter(), 0
    jobs: dict[str, list] = collections.defaultdict(list)
    slow = []
    for k, pr in enumerate(pairs):
        if k and k % 500 == 0:
            print(f"  align: {k}/{len(pairs)} pairs · {time.time() - t0:.0f} s", flush=True)
        tp = time.time()
        X, Y = side(pr["x"]), side(pr["y"])
        if X is None or Y is None:
            no_graph[f"{pr['dataset']}/{pr['role']}"] += 1
            continue
        al = AL.align(X, Y, params["beam"])
        co = AL.core(X, Y, al)
        ed = AL.edits(X, Y, al)
        Xr, Yr = AL.Side(G.rename_graph(X.graph, seed=1)[0]), AL.Side(G.rename_graph(Y.graph, seed=2)[0])
        alr = AL.align(Xr, Yr, params["beam"])
        same = _signature(co, ed, al) == _signature(AL.core(Xr, Yr, alr), AL.edits(Xr, Yr, alr), alr)
        renamed_same += same
        inv = {t: s for s, t in al["phi"].items()}
        qs = {"x>y": questions(Y, inv, f"{pr['pair']}|x>y", params["polarity_cut"]),     # Y's content asked of X's space
              "y>x": questions(X, al["phi"], f"{pr['pair']}|y>x", params["polarity_cut"])}
        jobs[pr["x"]] += [{"id": q["id"], "q": q["q"]} for q in qs["x>y"]]
        jobs[pr["y"]] += [{"id": q["id"], "q": q["q"]} for q in qs["y>x"]]
        xa, ya = X.atoms, Y.atoms
        rec = dict(pr)
        rec.update({"texts": [X.text, Y.text],
                    "alignment": {"phi": al["phi"], "score": al["score"], "ties": al["ties"], "search": al["search"],
                                  "pairs": [[xa[an]["lex"], ya[bn]["lex"], kind] for an, bn, kind, _ in al["pairs"]],
                                  "x_only": [xa[n]["lex"] for n in al["unaligned"][0]], "y_only": [ya[n]["lex"] for n in al["unaligned"][1]],
                                  "kinds": dict(collections.Counter(k for _, _, k, _ in al["pairs"])),
                                  "x_atoms": len(xa), "y_atoms": len(ya)},
                    "core": co, "renaming_same": same, "core_flip": AL.core_flip(X, Y, al),
                    "edits": {"classes": [{k: c[k] for k in ("a", "b", "position", "rule", "reverse_rule", "scope", "implied", "executable")}
                                          | {"x_atom": xa[c["x"]]["lex"], "y_atom": ya[c["y"]]["lex"]} for c in ed["classes"]],
                              "substitutions": [{"key": s["key"], "reverse_key": s["reverse_key"], "rule": s["rule"], "reverse_rule": s["reverse_rule"],
                                                 "executable": s["executable"], "x": [xa[n]["lex"] for n in s["x"]], "y": [ya[n]["lex"] for n in s["y"]],
                                                 "relabels": len(s["relabels"])} for s in ed["substitutions"]],
                              "drops": [{"side": d["side"], "key": d["key"], "atoms": [(xa if d["side"] == "x" else ya)[n]["lex"] for n in d["atoms"]]}
                                        for d in ed["drops"]],
                              "flips": [[xa[an]["lex"], ya[bn]["lex"]] for an, bn in ed["flips"]],
                              "bands": [[xa[an]["lex"], ya[bn]["lex"]] for an, bn in ed["bands"]]},
                    "queries": qs})
        out_pairs.append(rec)
        if time.time() - tp > 2:
            slow.append((pr["pair"], round(time.time() - tp, 1)))
            print(f"  align: slow pair {pr['pair']} {time.time() - tp:.1f} s ({len(X.atoms)} / {len(Y.atoms)} atoms)", flush=True)
    out = _out(run)
    os.makedirs(out, exist_ok=True)
    _write_jsonl(os.path.join(out, "pairs.jsonl"), out_pairs)
    used = sorted({pr["x"] for pr in out_pairs} | {pr["y"] for pr in out_pairs})
    _write_jsonl(os.path.join(out, "sentences.jsonl"),
                 ({"id": s, "text": sides[s].text, "statements": sides[s].statements, "canon": sides[s].canon} for s in used))
    sets = R.rule_sets()
    background = sets["facts"] + sets["query"]
    with open(os.path.join(out, "background.json"), "w", encoding="utf-8") as fh:
        json.dump(background, fh, ensure_ascii=False, indent=0)
    n = _write_jsonl(os.path.join(out, "round1.jobs.jsonl"),
                     ({"id": f"r1:{s}", "statements": sides[s].statements, "queries": jobs[s]} for s in used if jobs[s]))
    info = {"pairs": len(out_pairs), "missing_parse": missing, "no_graph": dict(no_graph), "sentences": len(used), "jobs": n,
            "queries": sum(len(v) for v in jobs.values()), "renaming_same": renamed_same, "background": len(background),
            "closure_left_out": len(sets["closure"]), "seconds": round(time.time() - t0, 1), "slow_pairs": slow, "params": params}
    with open(os.path.join(out, "align.json"), "w", encoding="utf-8") as fh:
        json.dump(info, fh, indent=1)
    return info


# ---------------------------------------------------------------------------------------------- reading answers

def polarity(lines: list[str], min_conf: float, cut: float) -> tuple[str | None, list | None]:
    """The answers' polarity: "+" (some proof positive), "-" (some proof negative), "±" (both), ``None`` (no proof
    with the confidence to count); and the most confident proof's truth value (a rule's: its positive branch)."""
    pos = neg = False
    best = None
    for line in lines or []:
        if line.startswith("ERROR"):
            continue
        try:
            t = ANS.parse(line)
        except (IndexError, ValueError):
            continue
        if not (isinstance(t, list) and len(t) == 4):
            continue
        tv = t[3]
        if isinstance(tv, list) and tv and tv[0] == "CTV" and len(tv) == 3:
            tv = tv[1]
        if not (isinstance(tv, list) and len(tv) == 3 and tv[0] == "STV"):
            continue
        try:
            s, c = float(tv[1]), float(tv[2])
        except ValueError:
            continue
        if best is None or c > best[1]:
            best = [round(s, 4), round(c, 4)]
        if c < min_conf:
            continue
        if s >= cut:
            pos = True
        else:
            neg = True
    return ("±" if pos and neg else "+" if pos else "-" if neg else None), best


def judge(queries: list[dict], answers: dict, params: dict) -> dict:
    """One direction's verdict from its answers (module doc, step 3). ``weaker`` (evidence, never the verdict): the
    held statements derived at another degree than they are stated (asserted, derived only graded — a hedged
    premise)."""
    held, missing, opposite, denied, weaker = [], [], [], [], []
    tvs = {}
    for q in queries:
        pol, best = polarity(answers.get(q["id"]) or [], params["min_confidence"], params["polarity_cut"])
        tvs[q["id"]] = [pol, best]
        if q["kind"] == "deny":
            if pol in ("+", "±"):
                denied.append(q["id"])
            continue
        if pol == q["sign"]:
            held.append(q["id"])
            if best and "strength" in q and L.band(best[0], "three") != L.band(q["strength"], "three"):
                weaker.append(q["id"])
        elif pol in ("+", "-"):
            opposite.append(q["id"])
        else:
            missing.append(q["id"])
    verdict = "contradicts" if opposite or denied else "holds" if not missing else "fails"
    return {"verdict": verdict, "held": held, "missing": missing, "opposite": opposite, "instance_of_denial": denied, "weaker": weaker,
            "answers": tvs}


def pair_verdict(d: dict, core_atoms: int, exact: int, flip: bool = False) -> str:
    """The pair's verdict from its two directions; ``flip``: the aligned core flips polarity (``align.core_flip``), the
    second criterion of a contradiction beside the chainer's — on our engine line a negated conjunction is never
    derived from its conjuncts, so "not watching" / "watching" reaches the chainer as two directions that fail."""
    a, b = d["x>y"]["verdict"], d["y>x"]["verdict"]
    if "contradicts" in (a, b) or flip:
        return "contradiction"
    if a == b == "holds":
        return "equivalence"
    if a == "holds":
        return "one-way x>y"
    if b == "holds":
        return "one-way y>x"
    return "relatedness" if exact else "unrelated"


def _results(path: str) -> dict:
    out = {}
    if os.path.exists(path):
        for r in _jsonl(path):
            out.update(r.get("results") or {})
            if r.get("error"):
                out[f"__error__{r['id']}"] = r["error"]
    return out


# ---------------------------------------------------------------------------------------------- step 3: classify

def _cid(kind: str, n: int) -> str:
    return f"paraphrase-{'C' if kind == 'class' else 'S'}{n:06d}"


def _rule_name(rule: str) -> str:
    """A candidate rule's name in the engine, made from its own text: the same rule has the same name in every run,
    whatever number its candidate gets, so a result computed with it stays the result of the same job."""
    return "p54_" + hashlib.md5(rule.encode("utf-8")).hexdigest()[:12]


def step_classify(run: str, params: dict) -> dict:
    out = _out(run)
    pairs = _jsonl(os.path.join(out, "pairs.jsonl"))
    answers = _results(os.path.join(out, "round1.results.jsonl"))
    verdicts = {}
    for pr in pairs:
        d = {dr: judge(pr["queries"][dr], answers, params) for dr in DIRS}
        exact = pr["alignment"]["kinds"].get("exact", 0)
        by = (["chainer"] if "contradicts" in (d["x>y"]["verdict"], d["y>x"]["verdict"]) else []) + (["alignment"] if pr.get("core_flip") else [])
        verdicts[pr["pair"]] = {"directions": d, "verdict": pair_verdict(d, pr["core"]["atoms"], exact, pr.get("core_flip", False)),
                                "contradiction_by": by}
    with open(os.path.join(out, "verdicts1.json"), "w", encoding="utf-8") as fh:
        json.dump(verdicts, fh, ensure_ascii=False)
    # the candidates the mining pairs' residuals propose, per direction
    occ: dict = collections.defaultdict(list)
    rules: dict = collections.defaultdict(dict)
    for pr in pairs:
        if pr["role"] != "mine":
            continue
        for dr in DIRS:
            fwd = dr == "x>y"
            for c in pr["edits"]["classes"]:
                key = ("class", c["a"], c["b"]) if fwd else ("class", c["b"], c["a"])
                occ[key].append({"pair": pr["pair"], "dir": dr, "family": pr["family"], "position": c["position"], "scope": c["scope"],
                                 "implied": c["implied"], "executable": c["executable"]})
                if c["executable"]:
                    rules[key].setdefault(c["position"], c["rule"] if fwd else c["reverse_rule"])
            for s in pr["edits"]["substitutions"]:
                key = ("substitution", s["key"] if fwd else s["reverse_key"])
                occ[key].append({"pair": pr["pair"], "dir": dr, "family": pr["family"], "executable": s["executable"]})
                if s["executable"]:
                    rules[key].setdefault("rule", s["rule"] if fwd else s["reverse_rule"])
    ids, counts = {}, collections.Counter()
    for key in sorted(occ, key=lambda k: (k[0], k[1:])):
        counts[key[0]] += 1
        ids[key] = _cid(key[0], counts[key[0]])
    cands = []
    for key, oc in occ.items():
        texts = list(dict.fromkeys(rules[key].values()))      # one rule per text: the same rule twice would be revised twice
        named = [r.replace("(: RULE ", f"(: {_rule_name(r)} ", 1) for r in texts]
        cands.append({"id": ids[key], "kind": key[0], "key": list(key[1:]), "rules": named,
                      "positions": dict(collections.Counter(o.get("position") for o in oc if o.get("position"))),
                      "occurrences": oc})
    cands.sort(key=lambda c: c["id"])
    _write_jsonl(os.path.join(out, "proposed.jsonl"), cands)
    by_key = {(c["kind"], *c["key"]): c for c in cands}
    sents = {s["id"]: s for s in _jsonl(os.path.join(out, "sentences.jsonl"))}
    jobs = []
    for pr in pairs:
        if pr["role"] != "mine":
            continue
        for dr in DIRS:
            v = verdicts[pr["pair"]]["directions"][dr]
            if v["verdict"] != "fails":
                continue
            fwd = dr == "x>y"
            keys = {("class", c["a"], c["b"]) if fwd else ("class", c["b"], c["a"]) for c in pr["edits"]["classes"]}
            keys |= {("substitution", s["key"] if fwd else s["reverse_key"]) for s in pr["edits"]["substitutions"]}
            use = sorted(by_key[k]["id"] for k in keys if by_key[k]["rules"])
            if not use:
                continue
            extra = {r for k in keys for r in by_key[k]["rules"]}
            asked = [q for q in pr["queries"][dr] if q["id"] in set(v["missing"])]
            premise = pr["x"] if fwd else pr["y"]
            jobs.append({"id": f"r2:{pr['pair']}|{dr}", "statements": sents[premise]["statements"], "extra": sorted(extra),
                         "queries": [{"id": "r2:" + q["id"], "q": q["q"]} for q in asked], "candidates": use})
    n = _write_jsonl(os.path.join(out, "round2.jobs.jsonl"), jobs)
    tally = collections.Counter((pr["dataset"], pr["role"], verdicts[pr["pair"]]["verdict"]) for pr in pairs)
    return {"verdicts": {f"{d}/{r}/{v}": k for (d, r, v), k in sorted(tally.items())}, "proposed": dict(counts), "round2_jobs": n,
            "errors": sum(1 for k in answers if k.startswith("__error__"))}


# ---------------------------------------------------------------------------------------------- step 5: admit

def label_of(pr: dict, dr: str) -> str:
    """The human label of one direction, as a word: entails / neutral / contradicts (SICK), or paraphrase /
    non-paraphrase for the pair (MRPC). A field: read by the boundary check and the evaluation only."""
    L = pr["labels"]
    if pr["dataset"] == "sick":
        lab = L.get("ab" if dr == "x>y" else "ba") or ""
        return "entails" if "entails" in lab else "contradicts" if "contradicts" in lab else "neutral"
    return "paraphrase" if L.get("label") == 1 else "non-paraphrase"


def step_admit(run: str, params: dict) -> dict:
    out = _out(run)
    pairs = {pr["pair"]: pr for pr in _jsonl(os.path.join(out, "pairs.jsonl"))}
    verdicts = json.load(open(os.path.join(out, "verdicts1.json"), encoding="utf-8"))
    cands = {c["id"]: c for c in _jsonl(os.path.join(out, "proposed.jsonl"))}
    jobs = {j["id"]: j for j in _jsonl(os.path.join(out, "round2.jobs.jsonl"))}
    answers = _results(os.path.join(out, "round2.results.jsonl"))
    under: dict = {}                                    # (pair, dir) → (holds under its residual, the candidates used)
    for jid, j in jobs.items():
        pid, dr = jid[3:].rsplit("|", 1)
        qs = [{"id": q["id"], "kind": "fact", "sign": next(x["sign"] for x in pairs[pid]["queries"][dr] if "r2:" + x["id"] == q["id"])}
              for q in j["queries"]]
        res = judge(qs, answers, params)
        under[(pid, dr)] = (res["verdict"] == "holds", j["candidates"], res["verdict"])
    support = {cid: {"sole": [], "joint": [], "violations": [], "contacts": []} for cid in cands}

    def holds(pid, dr):
        if verdicts[pid]["directions"][dr]["verdict"] == "holds":
            return True, []
        h, used, _ = under.get((pid, dr), (False, [], None))
        return h, used if h else []
    for (pid, dr), (ok, used, _) in under.items():
        if not ok:
            continue
        pr = pairs[pid]
        entry = {"pair": pid, "dir": dr, "family": pr["family"], "label": label_of(pr, dr)}
        for cid in used:
            support[cid]["sole" if len(used) == 1 else "joint"].append(entry)
        if pr["dataset"] == "sick" and label_of(pr, dr) != "entails":
            for cid in used:
                support[cid]["violations" if len(used) == 1 else "contacts"].append(entry)
    for pid, pr in pairs.items():                        # MRPC: a non-paraphrase that becomes equivalent under a residual
        if pr["dataset"] != "mrpc" or pr["role"] != "mine" or label_of(pr, "x>y") != "non-paraphrase":
            continue
        (h1, u1), (h2, u2) = holds(pid, "x>y"), holds(pid, "y>x")
        if h1 and h2 and (u1 or u2):
            used = sorted(set(u1) | set(u2))
            entry = {"pair": pid, "dir": "both", "family": pr["family"], "label": "non-paraphrase"}
            for cid in used:
                support[cid]["violations" if len(used) == 1 else "contacts"].append(entry)
    admitted, status_count = [], collections.Counter()
    records = []
    for cid, c in sorted(cands.items()):
        s = support[cid]
        sole_f = sorted({e["family"] for e in s["sole"]})
        if not c["rules"]:
            status = "note"
        elif s["violations"]:
            status = "rejected"
        elif len(sole_f) >= params["min_sole_families"]:
            status = "admitted"
        elif sole_f:
            status = "candidate"
        else:
            status = "note"
        status_count[(c["kind"], status)] += 1
        if status == "admitted":
            admitted.append(cid)
        records.append(_record(run, c, s, status, pairs, params))
    CD.write(records, os.path.join(out, "candidates.jsonl"))
    rules = [r for cid in admitted for r in cands[cid]["rules"]]
    sents = {s["id"]: s for s in _jsonl(os.path.join(out, "sentences.jsonl"))}
    per_space: dict = collections.defaultdict(list)
    for pid, pr in pairs.items():
        if pr["role"] != "evaluate":
            continue
        for dr in DIRS:
            v = verdicts[pid]["directions"][dr]
            if v["verdict"] != "fails" or not rules:
                continue
            premise = pr["x"] if dr == "x>y" else pr["y"]
            per_space[premise] += [{"id": "r3:" + q["id"], "q": q["q"]} for q in pr["queries"][dr] if q["id"] in set(v["missing"])]
    n = _write_jsonl(os.path.join(out, "round3.jobs.jsonl"),
                     ({"id": f"r3:{s}", "statements": sents[s]["statements"], "queries": qs} for s, qs in sorted(per_space.items())))
    refused = {x["statement"] for r in _jsonl(os.path.join(out, "round2.results.jsonl")) for x in r.get("refused") or []} \
        if os.path.exists(os.path.join(out, "round2.results.jsonl")) else set()
    background = json.load(open(os.path.join(out, "background.json"), encoding="utf-8"))
    with open(os.path.join(out, "round3.background.json"), "w", encoding="utf-8") as fh:   # the admitted rules beside the
        json.dump(background + [r for r in rules if r not in refused], fh, ensure_ascii=False, indent=0)   # background: each
    #                                               was already loaded with the engine's check in round 2, none refused
    with open(os.path.join(out, "admitted.json"), "w", encoding="utf-8") as fh:
        json.dump({"admitted": admitted, "rules": rules}, fh, ensure_ascii=False, indent=1)
    return {"status": {f"{k}/{s}": n_ for (k, s), n_ in sorted(status_count.items())}, "admitted": len(admitted), "rules": len(rules),
            "round3_jobs": n, "round2_directions": len(under), "round2_hold": sum(1 for v in under.values() if v[0])}


def _record(run: str, c: dict, s: dict, status: str, pairs: dict, params: dict) -> dict:
    """The shared candidate record (``fusenf.mine.candidates``) of one §5.4 candidate."""
    n = int(c["id"][-6:])
    if c["kind"] == "class":
        atoms = [f"{c['key'][0]} → {c['key'][1]}"]
    else:
        atoms = c["key"][0].split(" & ")
    rec = CD.new("paraphrase", n, atoms, "lexicalized", {"alignment": "fusenf.mine.align", "polarity": "three", "tense": "key"},
                 run, params, tag="C" if c["kind"] == "class" else "S")
    rec["pattern"].update({"kind": c["kind"], "rules": c["rules"]})
    if c["kind"] == "class":
        rec["pattern"].update({"from": c["key"][0], "to": c["key"][1], "positions": c["positions"]})
    proposed_f = sorted({o["family"] for o in c["occurrences"]})
    sole_f = sorted({e["family"] for e in s["sole"]})
    rec["support"] = {"families": len(sole_f), "sole": {"families": len(sole_f), "directions": len(s["sole"])},
                      "joint": {"families": len({e["family"] for e in s["joint"]}), "directions": len(s["joint"])},
                      "proposed": {"families": len(proposed_f), "directions": len(c["occurrences"]),
                                   "executable": sum(1 for o in c["occurrences"] if o.get("executable"))},
                      "datasets": dict(collections.Counter(pairs[o["pair"]]["dataset"] for o in c["occurrences"]))}
    for o in (s["sole"] + s["joint"])[:12] or c["occurrences"][:12]:
        pr = pairs[o["pair"]]
        rec["matches"].append({"id": o["pair"], "family": pr["family"], "dataset": pr["dataset"], "role": pr["role"], "dir": o["dir"],
                               "texts": pr["texts"], "label": o.get("label") or label_of(pr, o["dir"])})
    rec["evidence"] = {"labels_of_support": dict(collections.Counter(e["label"] for e in s["sole"] + s["joint"])),
                       "scopes": dict(collections.Counter(o.get("scope") or "" for o in c["occurrences"] if "scope" in o)),
                       "implied": sum(1 for o in c["occurrences"] if o.get("implied")), "families": proposed_f}
    rec["tests"] = {"boundary": {"pass": not s["violations"], "violations": s["violations"][:20], "n_violations": len(s["violations"]),
                                 "contacts": s["contacts"][:20], "n_contacts": len(s["contacts"])}}
    rec["status"] = status
    return rec


# ---------------------------------------------------------------------------------------------- step 7: evaluate

def step_evaluate(run: str, params: dict) -> dict:
    out = _out(run)
    pairs = _jsonl(os.path.join(out, "pairs.jsonl"))
    verdicts = json.load(open(os.path.join(out, "verdicts1.json"), encoding="utf-8"))
    answers3 = _results(os.path.join(out, "round3.results.jsonl"))
    adm = json.load(open(os.path.join(out, "admitted.json"), encoding="utf-8"))

    def after(pr, dr):
        v = verdicts[pr["pair"]]["directions"][dr]
        if v["verdict"] != "fails" or not adm["rules"]:
            return v["verdict"]
        qs = [{"id": "r3:" + q["id"], "kind": "fact", "sign": q["sign"]} for q in pr["queries"][dr] if q["id"] in set(v["missing"])]
        return judge(qs, answers3, params)["verdict"]
    report = {"params": params, "align": json.load(open(os.path.join(out, "align.json"), encoding="utf-8")), "shares": {}}
    for role in ("mine", "evaluate"):
        for ds in params["datasets"]:
            prs = [p for p in pairs if p["role"] == role and p["dataset"] == ds]
            if not prs:
                continue
            block = {"pairs": len(prs), "pair_verdicts": dict(collections.Counter(verdicts[p["pair"]]["verdict"] for p in prs))}
            for when in ("before", "after"):
                if when == "after" and role != "evaluate":
                    continue
                table = collections.Counter()
                pv = collections.Counter()
                for p in prs:
                    vv = {dr: (verdicts[p["pair"]]["directions"][dr]["verdict"] if when == "before" else after(p, dr)) for dr in DIRS}
                    for dr in DIRS:
                        table[(label_of(p, dr), vv[dr])] += 1
                    pverd = pair_verdict({dr: {"verdict": vv[dr]} for dr in DIRS}, 0, p["alignment"]["kinds"].get("exact", 0), p.get("core_flip", False))
                    pv[(label_of(p, "x>y") if ds == "mrpc" else p["labels"].get("label"), pverd)] += 1
                block[when] = {"directions": {f"{a} / {b}": n for (a, b), n in sorted(table.items())},
                               "pairs": {f"{a} / {b}": n for (a, b), n in sorted(pv.items())}, "scores": _scores(ds, table, pv)}
            report["shares"][f"{ds}/{role}"] = block
    cands = CD.read(os.path.join(out, "candidates.jsonl"))
    report["candidates"] = {"by_status": dict(collections.Counter(f"{c['pattern']['kind']}/{c['status']}" for c in cands)),
                            "admitted": [c["id"] for c in cands if c["status"] == "admitted"]}
    # what the admitted rules changed on the evaluation share: each direction that came to hold, with the rules its
    # proofs used and its label (a direction labelled neutral or contradiction that comes to hold breaks do-no-harm)
    rule_of = {r.split(" ", 2)[1]: cid for cid in adm["admitted"] for r in next((c["pattern"]["rules"] for c in cands if c["id"] == cid), [])}
    changes = []
    for p in pairs:
        if p["role"] != "evaluate":
            continue
        for dr in DIRS:
            before, now = verdicts[p["pair"]]["directions"][dr]["verdict"], after(p, dr)
            if before == now:
                continue
            used = set()
            for q in p["queries"][dr]:
                for line in answers3.get("r3:" + q["id"]) or []:
                    used |= {rule_of[t] for t in ANS._TOKEN.findall(line) if t in rule_of}
            changes.append({"pair": p["pair"], "dataset": p["dataset"], "dir": dr, "label": label_of(p, dr), "before": before, "after": now,
                            "texts": p["texts"], "rules": sorted(used)})
    report["changes"] = {"directions": len(changes), "by_label": dict(collections.Counter(f"{c['label']} / {c['after']}" for c in changes)),
                         "list": changes}
    report["contradiction_by"] = {name: dict(collections.Counter("+".join(verdicts[p["pair"]].get("contradiction_by") or []) or "-"
                                                                 for p in pairs if f"{p['dataset']}/{p['role']}" == name
                                                                 and verdicts[p["pair"]]["verdict"] == "contradiction"))
                                  for name in report["shares"]}
    with open(os.path.join(RUNS, run, "paraphrase.report.json"), "w", encoding="utf-8") as fh:
        json.dump(report, fh, ensure_ascii=False, indent=1)
    with open(os.path.join(RUNS, run, "paraphrase.md"), "w", encoding="utf-8") as fh:
        fh.write(summary_md(run, report, pairs, verdicts, cands))
    return {k: v for k, v in report["shares"].items()}


def _scores(ds: str, table: collections.Counter, pv: collections.Counter) -> dict:
    if ds == "sick":
        tp = table[("entails", "holds")]
        fp = sum(n for (lab, v), n in table.items() if v == "holds" and lab != "entails")
        fn = sum(n for (lab, v), n in table.items() if lab == "entails" and v != "holds")
        contra_true = sum(n for (lab, v), n in pv.items() if v == "contradiction" and lab == "contradiction")
        contra_found = sum(n for (lab, v), n in pv.items() if v == "contradiction")
        contra_all = sum(n for (lab, v), n in pv.items() if lab == "contradiction")
        return {"holds_precision": round(tp / (tp + fp), 3) if tp + fp else None, "holds_recall": round(tp / (tp + fn), 3) if tp + fn else None,
                "holds": tp + fp, "entails": tp + fn, "contradiction_precision": round(contra_true / contra_found, 3) if contra_found else None,
                "contradiction_recall": round(contra_true / contra_all, 3) if contra_all else None,
                "neutral_or_contradicts_holding": fp}
    tp = pv[("paraphrase", "equivalence")]
    fp = sum(n for (lab, v), n in pv.items() if v == "equivalence" and lab != "paraphrase")
    fn = sum(n for (lab, v), n in pv.items() if lab == "paraphrase" and v != "equivalence")
    return {"equivalence_precision": round(tp / (tp + fp), 3) if tp + fp else None, "equivalence_recall": round(tp / (tp + fn), 3) if tp + fn else None,
            "equivalent": tp + fp, "paraphrases": tp + fn, "non_paraphrase_equivalent": fp}


def summary_md(run: str, report: dict, pairs: list[dict], verdicts: dict, cands: list[dict]) -> str:
    al = report["align"]
    L = [f"# §5.4 paraphrase alignment — run `{run}` — {time.strftime('%Y-%m-%d %H:%M')}", "",
         "The pairs of SICK and MRPC, aligned on our side and classified by the chainer (our engine line); the residual of a",
         "pair that holds under it proposes invariance candidates, admitted only if no near-neighbour holds under them. The",
         "human labels are fields: read by the boundary check and the evaluation, never by the alignment or the verdicts.", "",
         "## The pairs", "",
         f"- aligned pairs: {al['pairs']} ({al['sentences']} sentences); without a parse of both sentences: {al['missing_parse']};"
         f" a reply the emitter refused: {al['no_graph']}",
         f"- the renaming check (both sentences renamed and shuffled, aligned again): {al['renaming_same']} of {al['pairs']} identical",
         f"- engine round 1: {al['jobs']} spaces, {al['queries']} queries; background {al['background']} statements"
         f" (lexicon facts + query-stage rules; the {al['closure_left_out']} kinship-closure rules left out)", ""]
    L += ["## The chainer's verdicts against the labels", ""]
    for name, block in report["shares"].items():
        L += [f"### {name} — {block['pairs']} pairs", "", "pair verdicts: " + ", ".join(f"{k} {v}" for k, v in sorted(block["pair_verdicts"].items())), ""]
        for when in ("before", "after"):
            if when not in block:
                continue
            sc = block[when]["scores"]
            L += [f"**{when}** — " + ", ".join(f"{k} {v}" for k, v in sc.items()), "",
                  "| label / verdict (per direction) | n |", "|---|---|"]
            L += [f"| {k} | {v} |" for k, v in block[when]["directions"].items()]
            L += [""]
    L += ["Contradictions by source (the chainer: an opposite answer or an instance of a denial; the alignment: a negated",
          "statement flipped word for word): " + "; ".join(f"{k} {v}" for k, v in report.get("contradiction_by", {}).items()), ""]
    ch = report.get("changes") or {}
    if ch.get("list"):
        L += ["## What the admitted candidates changed on the evaluation share", "",
              f"{ch['directions']} directions changed verdict: " + ", ".join(f"{k} {v}" for k, v in sorted(ch["by_label"].items())), "",
              "| pair | dir | label | before → after | rules used | sentences |", "|---|---|---|---|---|---|"]
        for c in sorted(ch["list"], key=lambda c: (c["label"] == "entails", c["pair"]))[:60]:
            L.append(f"| {c['pair']} | {c['dir']} | {c['label']} | {c['before']} → {c['after']} | {', '.join(c['rules'])} | "
                     f"{c['texts'][0]} ‖ {c['texts'][1]} |".replace("\n", " "))
        L += [""]
    L += ["## Examples of the verdicts (evaluation share)", ""]
    for verdict in ("equivalence", "one-way x>y", "contradiction", "relatedness", "unrelated"):
        ex = [p for p in pairs if p["role"] == "evaluate" and verdicts[p["pair"]]["verdict"] == verdict][:4]
        if ex:
            L += [f"**{verdict}**", ""] + [f"- {p['pair']} ({p['dataset']}, label {p['labels'].get('label')}): {p['texts'][0]} ‖ {p['texts'][1]}"
                                          for p in ex] + [""]
    by = collections.Counter(f"{c['pattern']['kind']}/{c['status']}" for c in cands)
    L += ["## The candidates", "", "| kind / status | n |", "|---|---|"] + [f"| {k} | {v} |" for k, v in sorted(by.items())] + [""]
    for status in ("admitted", "rejected", "candidate"):
        rows = sorted((c for c in cands if c["status"] == status), key=lambda c: (-c["support"]["sole"]["families"], c["id"]))[:40]
        if not rows:
            continue
        L += [f"### {status} (the first {len(rows)} by sole-support families)", "",
              "| id | candidate | sole fam. | joint fam. | proposed fam. | violations | contacts | an example |", "|---|---|---|---|---|---|---|---|"]
        for c in rows:
            ex = c["matches"][0] if c["matches"] else None
            exs = f"{ex['texts'][0]} ‖ {ex['texts'][1]} ({ex['dir']}, {ex['label']})" if ex else ""
            what = " & ".join(c["pattern"]["atoms"])[:160].replace("|", "¦")
            L.append(f"| {c['id']} | `{what}` | {c['support']['sole']['families']} | {c['support']['joint']['families']} | "
                     f"{c['support']['proposed']['families']} | {c['tests']['boundary']['n_violations']} | {c['tests']['boundary']['n_contacts']} | "
                     f"{exs.replace('|', '¦')[:220]} |")
        L += [""]
    kinds = collections.Counter()
    for p in pairs:
        e = p["edits"]
        kinds["class"] += len(e["classes"])
        kinds["substitution"] += len(e["substitutions"])
        kinds["drop"] += len(e["drops"])
        kinds["flip"] += len(e["flips"])
        kinds["band"] += len(e["bands"])
    L += ["## The residual edits over all pairs", "", ", ".join(f"{k} {v}" for k, v in kinds.items()), ""]
    return "\n".join(L) + "\n"


# ------------------------------------------------------------------------------------------------- driver

def engine(run: str, rnd: int, python: str, workers: int, steps: int) -> int:
    out = _out(run)
    jobs = os.path.join(out, f"round{rnd}.jobs.jsonl")
    if not os.path.exists(jobs) or os.path.getsize(jobs) == 0:
        open(os.path.join(out, f"round{rnd}.results.jsonl"), "a").close()
        return 0
    env = dict(os.environ)
    env["PYTHONPATH"] = REPO + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    bg = os.path.join(out, f"round{rnd}.background.json")
    cmd = [python, "-m", "fusenf.mine.chainer", "run", jobs, os.path.join(out, f"round{rnd}.results.jsonl"),
           "--background", bg if os.path.exists(bg) else os.path.join(out, "background.json"), "--workers", str(workers), "--steps", str(steps)]
    print("engine:", " ".join(os.path.relpath(c, os.getcwd()) if os.path.isabs(c) and c.startswith(REPO) else c for c in cmd), flush=True)
    return subprocess.call(cmd, env=env)


def main(args) -> int:
    params = params_of(beam=args.beam, min_sole_families=args.min_sole_families, steps=args.steps)
    steps = ["align", "engine1", "classify", "engine2", "admit", "engine3", "evaluate"] if args.step == "all" else [args.step]
    for st in steps:
        t0 = time.time()
        if st == "align":
            parsed = args.parsed or run_inputs(args.run)
            if not parsed:
                print("no parsed files: pass --parsed", file=sys.stderr)
                return 2
            res = step_align(args.run, parsed, params, args.limit)
        elif st.startswith("engine"):
            if not args.engine_python:
                print(f"the engine step {st[-1]} needs --engine-python (the chainer environment's python)", file=sys.stderr)
                return 2
            rc = engine(args.run, int(st[-1]), args.engine_python, args.workers, params["steps"])
            if rc:
                return rc
            continue
        elif st == "classify":
            res = step_classify(args.run, params)
        elif st == "admit":
            res = step_admit(args.run, params)
        elif st == "evaluate":
            res = step_evaluate(args.run, params)
        else:
            print(f"unknown step {st}", file=sys.stderr)
            return 2
        print(f"[{st}] {time.time() - t0:.1f} s", json.dumps(res, ensure_ascii=False, default=str)[:3000], flush=True)
    return 0
