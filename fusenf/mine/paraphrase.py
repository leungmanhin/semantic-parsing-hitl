"""§5.4 END TO END — paraphrase alignment: learn invariance and its boundaries together (the decisions of 2026-11-04;
the two-way unit on a yes / no label, 2026-11-12).

THE INPUT is the labelled pairs of the paraphrase sets (``datasets/prepared/<dataset>.pairs.jsonl``: SICK, MRPC) whose
two sentences both have a parse. The pairs of the MINING share propose; the pairs of the EVALUATION share (whole
families held out) only measure. THE LABELS ARE FIELDS: they never enter the alignment, the classification or the
proposal of a candidate; they tell support from violation in the boundary check and score the evaluation.

WHAT A LABEL CAN SAY (``LABELS``). Every paraphrase set gives the YES / NO of a pair — is it a paraphrase: does each
sentence say what the other says (``yes_no``)? That is THE BASELINE: the method runs on it alone, and what it admits
is the TWO-WAY REWRITE (kid ↔ child), an invariance. A set may say more. SICK labels each DIRECTION (entails / neutral
/ contradicts; its yes = both directions entail), and what a direction adds is a BONUS: a sharper boundary for the
same rewrites, the ONE-WAY FINDINGS (dog → animal: what follows, not what is the same — another kind of knowledge,
kept apart and never admitted here), the per-direction and the contradiction scores. A set whose yes was given by a
looser standard than equivalence (MRPC: "at a high level, mean the same thing") is named in the parameter
``loose_yes``: its no still counts as a violation, its yes is not counted as support (a side view counts it).

    python -m fusenf.mine paraphrase --run NAME --step align      (our side: alignments, round-1 jobs)
    (engine) python -m fusenf.mine.chainer run …                 (round 1)
    python -m fusenf.mine paraphrase --run NAME --step classify   (verdicts, candidates, round-2 jobs)
    (engine) round 2
    python -m fusenf.mine paraphrase --run NAME --step admit      (support, boundary, admission, the evaluation's jobs)
    (engine) round 3, and the measurement rounds 4 and 5 where they apply
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
     mining pairs' residuals propose. Per direction, a ONE-WAY rewrite: a CLASS correspondence (kid → child) with one
     rule per position it was seen at, a SUBSTITUTION with its rule; drops, flips and band differences propose
     nothing. A rewrite and its reverse are one TWO-WAY UNIT (kid ↔ child): the candidate proper.
  4. ROUND 2 — every mining direction that FAILS is asked again with its own residual's rewrites as rules: does it
     hold UNDER its residual?
  5. ADMIT (``admission``). THE BASELINE, on the yes / no label alone: a mining pair BECOMES EQUIVALENT under a unit
     when both its directions hold (in round 1, or under the residual) and the rewrites used are that unit's alone.
     Such a pair labelled yes SUPPORTS the unit (a loose yes is recorded apart and not counted); labelled no it is a
     VIOLATION. Several units together make joint support or a CONTACT, recorded and never counted. THE BONUS, where
     the labels have a direction: a direction the label denies that holds under ONE rewrite alone is a violation of
     that rewrite's unit too. Admitted: a unit with rules both ways, counted support in ``min_sole_families`` families,
     no violation. And a rewrite that alone carries directions labelled entailing in that many families, no direction
     the label denies, whose unit is not admitted, is a ONE-WAY FINDING: written to a file of its own, not loaded.
  6. ROUND 3 — every evaluation direction that failed is asked again with the admitted units' rules. Two MEASUREMENTS
     ask the same questions under other rules, each only when it differs: ROUND 4 with the one-way findings' rules
     added (what that kind would add), ROUND 5 with the units admitted when a loose yes counts (the side view).
  7. EVALUATE against the human labels, before and after. For every set: the pair verdict EQUIVALENCE against the yes /
     no label (precision, recall, the no pairs that become equivalent). Where the labels have a direction, also: a
     holding direction against entailment, the contradictions found, and the do-no-harm count of directions labelled
     neutral or contradiction that come to hold.

Outputs: ``fusenf/runs/NAME/paraphrase/`` (pairs, sentences, the background, each round's jobs and results,
``candidates.jsonl`` = the two-way units, ``one_way.jsonl`` = the one-way findings — regenerable) and
``fusenf/runs/NAME/paraphrase.md`` + ``paraphrase.report.json``.
"""
from __future__ import annotations

import collections
import hashlib
import json
import os
import subprocess
import sys
import time

from . import REPO, RUNS, align as AL, atoms as A, candidates as CD, chainer as CH, generalize as G, lift as L
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
    "min_sole_families": 2,            # admission: a unit alone makes yes pairs of this many mining families equivalent …
    #                                    … and no violation on a near-neighbour of the mining share
    "loose_yes": ["mrpc"],             # sets whose yes was given by a looser standard than equivalence: not counted as support
    "background": "facts + query-stage rules",   # the kinship closure (forward-chained in tmpl.reason) is left out
}
DIRS = ("x>y", "y>x")
LABELS = {"sick": {"directional": True},      # what a set's labels say BEYOND the pair's yes / no (module doc): SICK labels
          "mrpc": {"directional": False}}     # each direction; MRPC gives the yes / no only


def params_of(**overrides) -> dict:
    p = dict(DEFAULT)
    p.update({k: v for k, v in overrides.items() if v is not None})
    return p


def _out(run: str) -> str:
    return os.path.join(RUNS, run, "paraphrase")


def _json(path: str):
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


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
    reverse: dict = {}                                    # a one-way candidate's key → the key of its reverse
    for pr in pairs:
        if pr["role"] != "mine":
            continue
        for dr in DIRS:
            fwd = dr == "x>y"
            for c in pr["edits"]["classes"]:
                key = ("class", c["a"], c["b"]) if fwd else ("class", c["b"], c["a"])
                reverse[key] = ("class", key[2], key[1])
                occ[key].append({"pair": pr["pair"], "dir": dr, "family": pr["family"], "position": c["position"], "scope": c["scope"],
                                 "implied": c["implied"], "executable": c["executable"]})
                if c["executable"]:
                    rules[key].setdefault(c["position"], c["rule"] if fwd else c["reverse_rule"])
            for s in pr["edits"]["substitutions"]:
                key = ("substitution", s["key"] if fwd else s["reverse_key"])
                back = ("substitution", s["reverse_key"] if fwd else s["key"])
                if reverse.setdefault(key, back) != back:
                    raise ValueError(f"a substitution with two reverses: {key[1][:120]}")
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
        cands.append({"id": ids[key], "kind": key[0], "key": list(key[1:]), "reverse": ids.get(reverse[key]), "rules": named,
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

def directional(pr: dict) -> bool:
    """Do the pair's labels speak of each direction (entails / neutral / contradicts), beyond the pair's yes / no?"""
    return bool((LABELS.get(pr["dataset"]) or {}).get("directional"))


def label_of(pr: dict, dr: str) -> str:
    """The human label of one direction, as a word: entails / neutral / contradicts (SICK), or paraphrase /
    non-paraphrase for the pair (MRPC). A field: read by the boundary check and the evaluation only."""
    L = pr["labels"]
    if pr["dataset"] == "sick":
        lab = L.get("ab" if dr == "x>y" else "ba") or ""
        return "entails" if "entails" in lab else "contradicts" if "contradicts" in lab else "neutral"
    return "paraphrase" if L.get("label") == 1 else "non-paraphrase"


def yes_no(pr: dict) -> bool:
    """THE BASELINE LABEL, the one every paraphrase set gives: is the pair a paraphrase — does each sentence say what the
    other says? Where the labels have a direction: both directions entail. Elsewhere: the set's own pair label."""
    if directional(pr):
        return label_of(pr, "x>y") == "entails" and label_of(pr, "y>x") == "entails"
    return pr["labels"].get("label") == 1


def units_of(cands: dict) -> dict:
    """The TWO-WAY UNITS of the one-way candidates: a candidate with its reverse (``"reverse"``, set when they are
    proposed), numbered in the order of the candidates' ids. ``{unit id: {"id", "kind", "members": [candidate ids]}}`` —
    a member keeps its own one-way id."""
    seen, units = set(), {}
    for cid in sorted(cands):
        if cid in seen:
            continue
        rev = cands[cid].get("reverse")
        members = [cid] + ([rev] if rev and rev != cid and rev in cands else [])
        seen.update(members)
        uid = f"paraphrase-E{len(units) + 1:06d}"
        units[uid] = {"id": uid, "kind": cands[cid]["kind"], "members": members}
    return units


def round2_verdicts(pairs: dict, jobs: dict, answers: dict, params: dict) -> dict:
    """``(pair, direction)`` → (the direction holds under its residual, the one-way candidates of that residual)."""
    under = {}
    for jid, j in jobs.items():
        pid, dr = jid[3:].rsplit("|", 1)
        sign = {"r2:" + x["id"]: x["sign"] for x in pairs[pid]["queries"][dr]}
        qs = [{"id": q["id"], "kind": "fact", "sign": sign[q["id"]]} for q in j["queries"]]
        under[(pid, dr)] = (judge(qs, answers, params)["verdict"] == "holds", list(j["candidates"]))
    return under


def _families(entries: list) -> list:
    return sorted({e["family"] for e in entries})


def admission(pairs: dict, verdicts: dict, cands: dict, under: dict, params: dict) -> dict:
    """Step 5 on in-memory inputs (module doc): the events of the mining share, the status of every unit, the one-way
    findings. ``pairs`` by pair id, ``verdicts`` = round 1, ``cands`` = the one-way candidates by id (each with its
    ``reverse``), ``under`` = ``round2_verdicts``.

    Returns ``{"units", "unit_of", "pair": {unit: {"sole", "loose", "joint", "violations", "contacts"}},
    "direction": {candidate: {"sole", "joint", "violations", "contacts", "unlabelled"}}, "status": {unit: …},
    "side_status": {unit: the status when a loose yes counts as support}, "one_way": [candidate ids]}``."""
    units = units_of(cands)
    unit_of = {m: uid for uid, u in units.items() for m in u["members"]}
    loose = set(params.get("loose_yes") or [])
    need = params["min_sole_families"]
    U = {uid: {"sole": [], "loose": [], "joint": [], "violations": [], "contacts": []} for uid in units}
    D = {cid: {"sole": [], "joint": [], "violations": [], "contacts": [], "unlabelled": []} for cid in cands}

    def holds(pid, dr):
        if verdicts[pid]["directions"][dr]["verdict"] == "holds":
            return True, []
        h, used = under.get((pid, dr), (False, []))
        return h, (used if h else [])
    for pid, pr in pairs.items():
        if pr["role"] != "mine":
            continue
        (h1, u1), (h2, u2) = holds(pid, "x>y"), holds(pid, "y>x")
        us = sorted({unit_of[c] for c in set(u1) | set(u2)})
        if h1 and h2 and us:                                 # THE BASELINE: the pair becomes equivalent under these units
            yes = yes_no(pr)
            entry = {"pair": pid, "family": pr["family"], "dataset": pr["dataset"], "label": "yes" if yes else "no"}
            if len(us) == 1:
                U[us[0]]["violations" if not yes else "loose" if pr["dataset"] in loose else "sole"].append(entry)
            else:
                for uid in us:
                    U[uid]["joint" if yes else "contacts"].append(entry)
        for dr, h, used in (("x>y", h1, u1), ("y>x", h2, u2)):   # THE BONUS: one direction, under one-way candidates
            if not (h and used):
                continue
            entry = {"pair": pid, "dir": dr, "family": pr["family"], "dataset": pr["dataset"], "label": label_of(pr, dr)}
            alone = len(used) == 1
            for cid in used:
                if not directional(pr):
                    if alone:
                        D[cid]["unlabelled"].append(entry)    # no label speaks of this direction: recorded, never counted
                elif entry["label"] == "entails":
                    D[cid]["sole" if alone else "joint"].append(entry)
                else:
                    D[cid]["violations" if alone else "contacts"].append(entry)

    def status(uid: str, count_loose: bool) -> str:
        members = units[uid]["members"]
        if not all(cands[m]["rules"] for m in members):
            return "note"                                     # no rule in both directions: nothing to admit (a rewrite
        #                                                       that is its own reverse, a swap, is a unit of one member)
        if U[uid]["violations"] or any(D[m]["violations"] for m in members):
            return "rejected"
        fams = set(_families(U[uid]["sole"])) | (set(_families(U[uid]["loose"])) if count_loose else set())
        return "admitted" if len(fams) >= need else "candidate" if fams else "note"
    main = {uid: status(uid, False) for uid in units}
    side = {uid: status(uid, True) for uid in units}
    one_way = [cid for cid in sorted(cands)
               if cands[cid]["rules"] and not D[cid]["violations"] and len(_families(D[cid]["sole"])) >= need
               and main[unit_of[cid]] != "admitted"]
    return {"units": units, "unit_of": unit_of, "pair": U, "direction": D, "status": main, "side_status": side, "one_way": one_way}


def _name(c: dict, arrow: str = "→") -> str:
    """A one-way candidate as words: ``dog → animal``; a substitution has no short name."""
    return f" {arrow} ".join(c["key"]) if c["kind"] == "class" else ""


def unit_name(unit: dict, cands: dict) -> str:
    return _name(cands[unit["members"][0]], "↔") or unit["id"]


KEY = {"alignment": "fusenf.mine.align", "polarity": "three", "tense": "key"}


def _member(c: dict) -> dict:
    out = {"id": c["id"], "rules": c["rules"], "positions": c["positions"]}
    out.update({"from": c["key"][0], "to": c["key"][1]} if c["kind"] == "class" else {"atoms": c["key"][0].split(" & ")})
    return out


def _unit_record(run: str, unit: dict, adm: dict, cands: dict, pairs: dict, params: dict) -> dict:
    """The shared candidate record (``fusenf.mine.candidates``) of one two-way unit."""
    uid, members = unit["id"], [cands[m] for m in unit["members"]]
    U, D = adm["pair"][uid], adm["direction"]
    first = members[0]
    atoms = [unit_name(unit, cands)] if unit["kind"] == "class" else first["key"][0].split(" & ")
    rec = CD.new("paraphrase", int(uid[-6:]), atoms, "lexicalized", KEY, run, params, tag="E")
    rec["pattern"].update({"kind": unit["kind"], "two_way": True, "members": [_member(c) for c in members]})
    occ = [o for c in members for o in c["occurrences"]]
    proposed = {o["pair"]: o for o in occ}
    counted = _families(U["sole"])
    rec["support"] = {"families": len(counted), "sole": {"families": len(counted), "pairs": len(U["sole"])},
                      "loose": {"families": len(_families(U["loose"])), "pairs": len(U["loose"])},
                      "joint": {"families": len(_families(U["joint"])), "pairs": len(U["joint"])},
                      "proposed": {"families": len({o["family"] for o in occ}), "pairs": len(proposed),
                                   "executable": len({o["pair"] for o in occ if o.get("executable")})},
                      "datasets": dict(collections.Counter(pairs[p]["dataset"] for p in proposed))}
    violating = [(e["pair"], e["label"], None) for e in U["violations"]] \
        + [(e["pair"], e["label"], e["dir"]) for c in members for e in D[c["id"]]["violations"]]
    supporting = [(e["pair"], e["label"], None) for e in U["sole"] + U["loose"] + U["joint"]]
    proposing = [(p, "yes" if yes_no(pairs[p]) else "no", None) for p in proposed]
    seen: set = set()                                     # the pairs that decided the status first, then the others
    for pid, lab, dr in (violating + supporting if adm["status"][uid] == "rejected" else supporting + violating) + proposing:
        if pid in seen or len(rec["matches"]) == 12:
            continue
        seen.add(pid)
        pr = pairs[pid]
        rec["matches"].append({"id": pid, "family": pr["family"], "dataset": pr["dataset"], "role": pr["role"], "texts": pr["texts"],
                               "label": lab, **({"dir": dr} if dr else {})})
    rec["evidence"] = {"directions": {c["id"]: {"entailing": {"families": len(_families(D[c["id"]]["sole"])), "directions": len(D[c["id"]]["sole"])},
                                                "with_others": len(D[c["id"]]["joint"]), "unlabelled": len(D[c["id"]]["unlabelled"]),
                                                "violations": len(D[c["id"]]["violations"])} for c in members},
                       "scopes": dict(collections.Counter(o.get("scope") or "" for o in occ if "scope" in o)),
                       "implied": sum(1 for o in occ if o.get("implied")), "families": sorted({o["family"] for o in occ})}
    directional_v = {c["id"]: D[c["id"]]["violations"][:20] for c in members if D[c["id"]]["violations"]}
    by = (["pair"] if U["violations"] else []) + (["direction"] if directional_v else [])
    rec["tests"] = {"boundary": {"pass": not by, "by": by, "violations": U["violations"][:20], "n_violations": len(U["violations"]),
                                 "directional": directional_v, "n_directional": sum(len(D[c["id"]]["violations"]) for c in members),
                                 "contacts": U["contacts"][:20], "n_contacts": len(U["contacts"])}}
    rec["status"] = adm["status"][uid]
    rec["side"] = {"loose_yes_counted": adm["side_status"][uid]}
    return rec


def _one_way_record(run: str, c: dict, adm: dict, cands: dict, pairs: dict, params: dict) -> dict:
    """The record of one ONE-WAY FINDING: its id is the one-way candidate's own; never admitted here."""
    D, uid = adm["direction"], adm["unit_of"][c["id"]]
    d = D[c["id"]]
    atoms = [_name(c)] if c["kind"] == "class" else c["key"][0].split(" & ")
    rec = CD.new("paraphrase", int(c["id"][-6:]), atoms, "lexicalized", KEY, run, params, tag="C" if c["kind"] == "class" else "S")
    rec["pattern"].update({"one_way": True, "unit": uid, **{k: v for k, v in _member(c).items() if k != "id"}, "kind": c["kind"]})
    fams = _families(d["sole"])
    rec["support"] = {"families": len(fams), "sole": {"families": len(fams), "directions": len(d["sole"])},
                      "joint": {"families": len(_families(d["joint"])), "directions": len(d["joint"])},
                      "proposed": {"families": len({o["family"] for o in c["occurrences"]}), "directions": len(c["occurrences"])},
                      "datasets": dict(collections.Counter(pairs[o["pair"]]["dataset"] for o in c["occurrences"]))}
    for e in d["sole"][:12]:
        pr = pairs[e["pair"]]
        rec["matches"].append({"id": e["pair"], "family": pr["family"], "dataset": pr["dataset"], "role": pr["role"], "dir": e["dir"],
                               "texts": pr["texts"], "label": e["label"]})
    rev = c.get("reverse")
    rec["evidence"] = {"families": fams,
                       "reverse": {"id": rev, "violations": len(D[rev]["violations"]) if rev in D else 0,
                                   "entailing_families": len(_families(D[rev]["sole"])) if rev in D else 0},
                       "unit": {"id": uid, "status": adm["status"][uid], "violations": len(adm["pair"][uid]["violations"])}}
    rec["tests"] = {"boundary": {"pass": True, "n_violations": 0, "contacts": d["contacts"][:20], "n_contacts": len(d["contacts"])}}
    rec["status"] = "candidate"
    return rec


ROUNDS = {"after": 3, "with_one_way": 4, "loose_yes": 5}      # the views of the evaluation share and their engine rounds


def step_admit(run: str, params: dict) -> dict:
    out = _out(run)
    pairs = {pr["pair"]: pr for pr in _jsonl(os.path.join(out, "pairs.jsonl"))}
    verdicts = _json(os.path.join(out, "verdicts1.json"))
    cands = {c["id"]: c for c in _jsonl(os.path.join(out, "proposed.jsonl"))}
    jobs = {j["id"]: j for j in _jsonl(os.path.join(out, "round2.jobs.jsonl"))}
    r2 = os.path.join(out, "round2.results.jsonl")
    under = round2_verdicts(pairs, jobs, _results(r2), params)
    adm = admission(pairs, verdicts, cands, under, params)
    units = adm["units"]
    CD.write([_unit_record(run, units[uid], adm, cands, pairs, params) for uid in units], os.path.join(out, "candidates.jsonl"))
    CD.write([_one_way_record(run, cands[cid], adm, cands, pairs, params) for cid in adm["one_way"]], os.path.join(out, "one_way.jsonl"))
    refused = {x["statement"] for r in _jsonl(r2) for x in r.get("refused") or []} if os.path.exists(r2) else set()

    def rules_of(cids) -> list:
        return [r for cid in cids for r in cands[cid]["rules"] if r not in refused]     # (each was loaded with the
    #                                                              engine's check in round 2: a refused one stays out)
    admitted = [uid for uid in units if adm["status"][uid] == "admitted"]
    side = [uid for uid in units if adm["side_status"][uid] == "admitted"]
    sets = {"after": rules_of(m for uid in admitted for m in units[uid]["members"]),
            "with_one_way": rules_of([m for uid in admitted for m in units[uid]["members"]] + adm["one_way"]) if adm["one_way"] else [],
            "loose_yes": rules_of(m for uid in side for m in units[uid]["members"]) if side != admitted else []}
    sents = {s["id"]: s for s in _jsonl(os.path.join(out, "sentences.jsonl"))}
    per_space: dict = collections.defaultdict(list)
    if any(sets.values()):
        for pid, pr in pairs.items():
            if pr["role"] != "evaluate":
                continue
            for dr in DIRS:
                v = verdicts[pid]["directions"][dr]
                if v["verdict"] == "fails":
                    premise = pr["x"] if dr == "x>y" else pr["y"]
                    per_space[premise] += [{"id": "r3:" + q["id"], "q": q["q"]} for q in pr["queries"][dr] if q["id"] in set(v["missing"])]
    n = _write_jsonl(os.path.join(out, "round3.jobs.jsonl"),
                     ({"id": f"r3:{s}", "statements": sents[s]["statements"], "queries": qs} for s, qs in sorted(per_space.items())))
    background = _json(os.path.join(out, "background.json"))
    for view, rnd in ROUNDS.items():                           # a round is asked only when its rules exist: its
        bg = os.path.join(out, f"round{rnd}.background.json")  # background file is the sign
        if sets[view]:
            with open(bg, "w", encoding="utf-8") as fh:
                json.dump(background + sets[view], fh, ensure_ascii=False, indent=0)
        else:
            for stale in (bg, os.path.join(out, f"round{rnd}.results.jsonl")):
                if os.path.exists(stale):
                    os.unlink(stale)
    with open(os.path.join(out, "admitted.json"), "w", encoding="utf-8") as fh:
        json.dump({"admitted": admitted, "rules": sets["after"], "one_way": adm["one_way"], "one_way_rules": rules_of(adm["one_way"]),
                   "side": {"loose_yes_counted": {"admitted": side, "rules": rules_of(m for uid in side for m in units[uid]["members"])}},
                   "rounds": {view: bool(sets[view]) for view in ROUNDS}}, fh, ensure_ascii=False, indent=1)
    tally = collections.Counter((units[uid]["kind"], adm["status"][uid]) for uid in units)
    return {"units": len(units), "status": {f"{k}/{s}": n_ for (k, s), n_ in sorted(tally.items())}, "admitted": len(admitted),
            "rules": len(sets["after"]), "one_way": len(adm["one_way"]), "side_admitted": len(side), "round3_jobs": n,
            "rounds_to_ask": [rnd for view, rnd in ROUNDS.items() if sets[view]],
            "round2_directions": len(under), "round2_hold": sum(1 for v in under.values() if v[0])}


# ---------------------------------------------------------------------------------------------- step 7: evaluate

def _round_answers(out: str, rnd: int, params: dict) -> dict:
    """A round's answers, read only if every job has the result computed from the job and the background as they stand
    now (the runner's fingerprints): numbers are never made from a round that was not asked, or asked before a change."""
    jobs, res = os.path.join(out, "round3.jobs.jsonl"), os.path.join(out, f"round{rnd}.results.jsonl")
    ids, _fp, valid, _stale = CH.settle(jobs, res, os.path.join(out, f"round{rnd}.background.json"), params["steps"], dry=True)
    if len(valid) < len(ids):
        raise RuntimeError(f"round {rnd} has a current result for {len(valid)} of {len(ids)} jobs: run --step engine{rnd} first")
    return _results(res)


def step_evaluate(run: str, params: dict) -> dict:
    out = _out(run)
    pairs = _jsonl(os.path.join(out, "pairs.jsonl"))
    verdicts = _json(os.path.join(out, "verdicts1.json"))
    adm = _json(os.path.join(out, "admitted.json"))
    answers = {view: _round_answers(out, rnd, params) for view, rnd in ROUNDS.items() if adm["rounds"][view]}

    def verdict(pr, dr, view):
        v = verdicts[pr["pair"]]["directions"][dr]
        if view not in answers or v["verdict"] != "fails":
            return v["verdict"]
        qs = [{"id": "r3:" + q["id"], "kind": "fact", "sign": q["sign"]} for q in pr["queries"][dr] if q["id"] in set(v["missing"])]
        return judge(qs, answers[view], params)["verdict"]
    report = {"params": params, "align": _json(os.path.join(out, "align.json")), "shares": {},
              "labels": {ds: {"directional": bool((LABELS.get(ds) or {}).get("directional")), "loose_yes": ds in (params.get("loose_yes") or [])}
                         for ds in params["datasets"]}}
    for role in ("mine", "evaluate"):
        for ds in params["datasets"]:
            prs = [p for p in pairs if p["role"] == role and p["dataset"] == ds]
            if not prs:
                continue
            block = {"pairs": len(prs), "yes": sum(1 for p in prs if yes_no(p)),
                     "pair_verdicts": dict(collections.Counter(verdicts[p["pair"]]["verdict"] for p in prs))}
            for view in ["before", "after"] + [v for v in ("with_one_way", "loose_yes") if v in answers]:
                if view != "before" and role != "evaluate":
                    continue
                table, pv, pe = collections.Counter(), collections.Counter(), collections.Counter()
                for p in prs:
                    vv = {dr: verdict(p, dr, view) for dr in DIRS}
                    for dr in DIRS:
                        table[(label_of(p, dr), vv[dr])] += 1
                    pverd = pair_verdict({dr: {"verdict": vv[dr]} for dr in DIRS}, 0, p["alignment"]["kinds"].get("exact", 0), p.get("core_flip", False))
                    pv[(label_of(p, "x>y") if not directional(p) else p["labels"].get("label"), pverd)] += 1
                    pe[(yes_no(p), pverd == "equivalence")] += 1
                block[view] = {"directions": {f"{a} / {b}": n for (a, b), n in sorted(table.items())},
                               "pairs": {f"{a} / {b}": n for (a, b), n in sorted(pv.items())},
                               "scores": _scores(bool((LABELS.get(ds) or {}).get("directional")), table, pv, pe)}
            report["shares"][f"{ds}/{role}"] = block
    cands = CD.read(os.path.join(out, "candidates.jsonl"))
    one_way = CD.read(os.path.join(out, "one_way.jsonl"))
    report["candidates"] = {"by_status": dict(collections.Counter(f"{c['pattern']['kind']}/{c['status']}" for c in cands)),
                            "admitted": [c["id"] for c in cands if c["status"] == "admitted"],
                            "one_way": [c["id"] for c in one_way],
                            "side": {"loose_yes_counted": [c["id"] for c in cands if c["side"]["loose_yes_counted"] == "admitted"]}}
    # what each view changed on the evaluation share: every direction whose verdict moved, with the rules its proofs
    # used and its label (a direction labelled neutral or contradiction that comes to hold breaks do-no-harm)
    names = {}
    for c in cands:
        for m in c["pattern"]["members"]:
            for r in m["rules"]:
                names[r.split(" ", 2)[1]] = (f"{m['from']} → {m['to']}" if "from" in m else c["id"])     # (a substitution: its unit)
    report["changes"] = {}
    for view in [v for v in ROUNDS if v in answers]:
        changes = []
        for p in pairs:
            if p["role"] != "evaluate":
                continue
            for dr in DIRS:
                before, now = verdicts[p["pair"]]["directions"][dr]["verdict"], verdict(p, dr, view)
                if before == now:
                    continue
                used = set()
                for q in p["queries"][dr]:
                    for line in answers[view].get("r3:" + q["id"]) or []:
                        used |= {names[t] for t in ANS._TOKEN.findall(line) if t in names}
                changes.append({"pair": p["pair"], "dataset": p["dataset"], "dir": dr, "label": label_of(p, dr), "before": before, "after": now,
                                "texts": p["texts"], "rules": sorted(used)})
        report["changes"][view] = {"directions": len(changes), "by_label": dict(collections.Counter(f"{c['label']} / {c['after']}" for c in changes)),
                                   "by_rule": dict(collections.Counter(r for c in changes for r in c["rules"]).most_common()), "list": changes}
    report["contradiction_by"] = {name: dict(collections.Counter("+".join(verdicts[p["pair"]].get("contradiction_by") or []) or "-"
                                                                 for p in pairs if f"{p['dataset']}/{p['role']}" == name
                                                                 and verdicts[p["pair"]]["verdict"] == "contradiction"))
                                  for name in report["shares"]}
    with open(os.path.join(RUNS, run, "paraphrase.report.json"), "w", encoding="utf-8") as fh:
        json.dump(report, fh, ensure_ascii=False, indent=1)
    with open(os.path.join(RUNS, run, "paraphrase.md"), "w", encoding="utf-8") as fh:
        fh.write(summary_md(run, report, pairs, verdicts, cands, one_way))
    return {k: {view: v[view]["scores"] for view in v if isinstance(v[view], dict) and "scores" in v[view]} for k, v in report["shares"].items()}


def _ratio(a: int, b: int):
    return round(a / b, 3) if b else None


def _scores(has_direction: bool, table: collections.Counter, pv: collections.Counter, pe: collections.Counter) -> dict:
    """THE BASELINE SCORES, for every set: the pair verdict EQUIVALENCE against the yes / no label. WHERE THE LABELS HAVE
    A DIRECTION, also: a holding direction against entailment, the contradictions found, and the do-no-harm count."""
    tp, fp, fn = pe[(True, True)], pe[(False, True)], pe[(True, False)]
    out = {"equivalence_precision": _ratio(tp, tp + fp), "equivalence_recall": _ratio(tp, tp + fn), "equivalent": tp + fp,
           "paraphrases": tp + fn, "non_paraphrase_equivalent": fp}
    if has_direction:
        tp = table[("entails", "holds")]
        fp = sum(n for (lab, v), n in table.items() if v == "holds" and lab != "entails")
        fn = sum(n for (lab, v), n in table.items() if lab == "entails" and v != "holds")
        contra_true = sum(n for (lab, v), n in pv.items() if v == "contradiction" and lab == "contradiction")
        contra_found = sum(n for (lab, v), n in pv.items() if v == "contradiction")
        contra_all = sum(n for (lab, v), n in pv.items() if lab == "contradiction")
        out.update({"holds_precision": _ratio(tp, tp + fp), "holds_recall": _ratio(tp, tp + fn), "holds": tp + fp, "entails": tp + fn,
                    "contradiction_precision": _ratio(contra_true, contra_found), "contradiction_recall": _ratio(contra_true, contra_all),
                    "neutral_or_contradicts_holding": fp})
    return out


VIEW_TITLE = {"before": "before", "after": "after (the admitted two-way rewrites as rules)",
              "with_one_way": "a measurement: with the one-way findings' rules added (they are not admitted)",
              "loose_yes": "a measurement: the two-way rewrites admitted when a loose yes counts as support"}


def _cell(s: str, n: int = 220) -> str:
    return s.replace("|", "¦").replace("\n", " ")[:n]


def summary_md(run: str, report: dict, pairs: list[dict], verdicts: dict, cands: list[dict], one_way: list[dict]) -> str:
    al, labels, need = report["align"], report["labels"], report["params"]["min_sole_families"]
    two_way = [ds for ds, v in labels.items() if v["directional"]]
    loose = [ds for ds, v in labels.items() if v["loose_yes"]]
    L = [f"# §5.4 paraphrase alignment — run `{run}` — {time.strftime('%Y-%m-%d %H:%M')}", "",
         "The pairs of SICK and MRPC, aligned on our side and classified by the chainer (our engine line). WHAT IS MINED is the",
         "TWO-WAY REWRITE: a difference between the two sentences of a pair that, used in both directions, makes a paraphrase",
         "pair equivalent on its own. It is rejected when it makes a non-paraphrase pair equivalent on its own or — where the",
         "labels have a direction — when one of its directions alone makes a direction hold that the label denies. The human",
         "labels are fields: read by the boundary check and the evaluation, never by the alignment or the verdicts.", "",
         "## The pairs and their labels", "",
         f"- aligned pairs: {al['pairs']} ({al['sentences']} sentences)",
         f"- left out, a sentence of the pair was never parsed (it is not in the parsed sample): {al['missing_parse']}",
         f"- left out, a parsed sentence gives no statements (nothing mapped, a reply the validator refuses, or a failed"
         f" call): {al['no_graph']}",
         f"- the renaming check (both sentences renamed and shuffled, aligned again): {al['renaming_same']} of {al['pairs']} identical",
         f"- engine round 1: {al['jobs']} spaces, {al['queries']} queries; background {al['background']} statements"
         f" (lexicon facts + query-stage rules; the {al['closure_left_out']} kinship-closure rules left out)",
         "- THE YES / NO LABEL every set gives (is the pair a paraphrase: does each sentence say what the other says?): "
         + "; ".join(f"{ds} = " + ("both directions labelled entailing" if v["directional"] else "its own pair label") for ds, v in labels.items())
         + ". Pairs labelled yes: " + ", ".join(f"{name} {b['yes']} of {b['pairs']}" for name, b in report["shares"].items()),
         f"- labels with a direction (each direction entails / is neutral / contradicts — the bonus checks): {', '.join(two_way) or 'none'}",
         f"- a loose yes (given by a looser standard than equivalence: not counted as support, its no still counts): {', '.join(loose) or 'none'}", ""]
    L += ["## The chainer's verdicts against the labels", ""]
    for name, block in report["shares"].items():
        L += [f"### {name} — {block['pairs']} pairs", "", "pair verdicts: " + ", ".join(f"{k} {v}" for k, v in sorted(block["pair_verdicts"].items())), ""]
        for view in VIEW_TITLE:
            if view not in block:
                continue
            sc = block[view]["scores"]
            L += [f"**{VIEW_TITLE[view]}** — " + ", ".join(f"{k} {v}" for k, v in sc.items()), ""]
            if view in ("before", "after"):
                L += ["| label / verdict (per direction) | n |", "|---|---|"] + [f"| {k} | {v} |" for k, v in block[view]["directions"].items()] + [""]
    L += ["Contradictions by source (the chainer: an opposite answer or an instance of a denial; the alignment: a negated",
          "statement flipped word for word): " + "; ".join(f"{k} {v}" for k, v in report.get("contradiction_by", {}).items()), ""]
    for view, ch in (report.get("changes") or {}).items():
        if not ch["list"]:
            L += [f"## What changed on the evaluation share — {VIEW_TITLE[view]}", "", "no direction changed verdict", ""]
            continue
        L += [f"## What changed on the evaluation share — {VIEW_TITLE[view]}", "",
              f"{ch['directions']} directions changed verdict: " + ", ".join(f"{k} {v}" for k, v in sorted(ch["by_label"].items())), "",
              "directions per rewrite used in their proofs: " + ", ".join(f"`{_cell(k, 60)}` {v}" for k, v in ch["by_rule"].items()), ""]
        if view != "after":
            continue
        L += ["| pair | dir | label | before → after | rewrites used | sentences |", "|---|---|---|---|---|---|"]
        for c in sorted(ch["list"], key=lambda c: (c["label"] == "entails", c["pair"]))[:60]:
            L.append(f"| {c['pair']} | {c['dir']} | {c['label']} | {c['before']} → {c['after']} | {_cell(', '.join(c['rules']), 90)} | "
                     f"{_cell(c['texts'][0] + ' ‖ ' + c['texts'][1], 400)} |")
        L += [""]
    L += ["## Examples of the verdicts (evaluation share)", ""]
    for verdict in ("equivalence", "one-way x>y", "contradiction", "relatedness", "unrelated"):
        ex = [p for p in pairs if p["role"] == "evaluate" and verdicts[p["pair"]]["verdict"] == verdict][:4]
        if ex:
            L += [f"**{verdict}**", ""] + [f"- {p['pair']} ({p['dataset']}, label {p['labels'].get('label')}): {p['texts'][0]} ‖ {p['texts'][1]}"
                                          for p in ex] + [""]

    def what(c):
        return _cell(" & ".join(c["pattern"]["atoms"]), 160)

    def example(c):
        ex = c["matches"][0] if c["matches"] else None
        return _cell(f"{ex['texts'][0]} ‖ {ex['texts'][1]} ({(ex.get('dir') + ', ') if ex.get('dir') else ''}{ex['label']})") if ex else ""
    by = collections.Counter(f"{c['pattern']['kind']} / {c['status']}" for c in cands)
    L += ["## The candidates: two-way rewrites", "",
          f"A candidate is a rewrite with its reverse. SUPPORT: a mining pair labelled yes that the rewrite alone makes equivalent"
          f" (admitted from {need} families on). VIOLATION, by the pair: a pair labelled no that it alone makes equivalent; by a"
          " direction (labels with a direction only): a direction the label denies that holds under one of its two directions"
          " alone. A CONTACT is the same with several rewrites together: recorded, never counted.", "",
          "| kind / status | n |", "|---|---|"] + [f"| {k} | {v} |" for k, v in sorted(by.items())] + [""]
    order = {"admitted": lambda c: (-c["support"]["sole"]["families"], c["id"]),
             "rejected": lambda c: (-(c["tests"]["boundary"]["n_violations"] + c["tests"]["boundary"]["n_directional"]), c["id"]),
             "candidate": lambda c: (-c["support"]["sole"]["families"], c["id"])}
    for status in ("admitted", "rejected", "candidate"):
        rows = sorted((c for c in cands if c["status"] == status), key=order[status])[:40]
        if not rows:
            continue
        L += [f"### {status} (the first {len(rows)} by " + ("violations" if status == "rejected" else "supporting families") + ")", "",
              "| id | rewrite | supporting fam. | loose-yes fam. | violations by a pair | by a direction | contacts | an example |", "|---|---|---|---|---|---|---|---|"]
        for c in rows:
            b = c["tests"]["boundary"]
            L.append(f"| {c['id']} | `{what(c)}` | {c['support']['sole']['families']} | {c['support']['loose']['families']} | "
                     f"{b['n_violations']} | {b['n_directional']} | {b['n_contacts']} | {example(c)} |")
        L += [""]
    L += ["## One-way findings (labels with a direction only; not admitted, not loaded as rules)", "",
          f"A rewrite in ONE direction that alone carries directions labelled entailing in {need} families or more, with no direction"
          " the label denies, and whose two-way rewrite is no admitted equivalence. It says what follows, not what is the same:"
          " another kind of knowledge than an invariance, kept in a file of its own (`paraphrase/one_way.jsonl`).", ""]
    if one_way:
        L += ["| id | finding | entailing fam. | its reverse: denied directions | an example |", "|---|---|---|---|---|"]
        for c in sorted(one_way, key=lambda c: (-c["support"]["families"], c["id"])):
            L.append(f"| {c['id']} | `{what(c)}` | {c['support']['families']} | {c['evidence']['reverse']['violations']} | {example(c)} |")
        L += [""]
    else:
        L += ["none", ""]
    side = [c for c in cands if c["support"]["loose"]["pairs"] or c["side"]["loose_yes_counted"] != c["status"]]
    L += ["## Side view: a loose yes counted as support", "",
          f"The same admission with the yes of {', '.join(loose) or 'no set'} counted. Every two-way rewrite that such a pair supports,"
          " and its status in both views:", ""]
    if side:
        L += ["| id | rewrite | supporting fam. | loose-yes fam. | violations | status → with the loose yes | an example |", "|---|---|---|---|---|---|---|"]
        for c in sorted(side, key=lambda c: (c["side"]["loose_yes_counted"] == c["status"], -c["support"]["loose"]["families"], c["id"])):
            b = c["tests"]["boundary"]
            L.append(f"| {c['id']} | `{what(c)}` | {c['support']['sole']['families']} | {c['support']['loose']['families']} | "
                     f"{b['n_violations'] + b['n_directional']} | {c['status']} → {c['side']['loose_yes_counted']} | {example(c)} |")
        L += [""]
    else:
        L += ["none", ""]
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
    """One engine round. Rounds 1 and 2 ask their own jobs over the background; rounds 3, 4 and 5 ask the evaluation's
    jobs (round 3's file), each over its own background — written by the admit step only when the round applies."""
    out = _out(run)
    jobs = os.path.join(out, f"round{min(rnd, 3)}.jobs.jsonl")
    bg = os.path.join(out, f"round{rnd}.background.json" if rnd >= 3 else "background.json")
    if rnd >= 3 and not os.path.exists(bg):
        print(f"round {rnd}: no rules to ask under, nothing to run", flush=True)
        return 0
    if not os.path.exists(jobs) or os.path.getsize(jobs) == 0:
        open(os.path.join(out, f"round{rnd}.results.jsonl"), "a").close()
        return 0
    env = dict(os.environ)
    env["PYTHONPATH"] = REPO + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    cmd = [python, "-m", "fusenf.mine.chainer", "run", jobs, os.path.join(out, f"round{rnd}.results.jsonl"),
           "--background", bg, "--workers", str(workers), "--steps", str(steps)]
    print("engine:", " ".join(os.path.relpath(c, os.getcwd()) if os.path.isabs(c) and c.startswith(REPO) else c for c in cmd), flush=True)
    return subprocess.call(cmd, env=env)


def main(args) -> int:
    params = params_of(beam=args.beam, min_sole_families=args.min_sole_families, steps=args.steps)
    steps = ["align", "engine1", "classify", "engine2", "admit", "engine3", "engine4", "engine5", "evaluate"] if args.step == "all" \
        else [args.step]
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
