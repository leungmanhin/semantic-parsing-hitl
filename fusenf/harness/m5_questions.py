"""FUSE-NF M5 question arm — the differential harness (item F; agent-free).

PRE-#50 HARNESS (2026-09-01): measures the RETIRED faithful+bridges serving
layout. Superseded by the consolidation-only design (consolidated view +
query-side normalization) — rework against harness/normalize_query.py before
running at item H; kept meanwhile because batch-1 reports cite its numbers.
For every generated question (QGEN) and its one translated query (QPARSE), run THE SAME
query against two fresh KBs built from the record's FAITHFUL canonical statements:

    arm A (faithful)          = seeded rules + faithful statements
    arm B (faithful+bridges)  = seeded rules + mined bridge rules + faithful statements

The differential absorbs query-parse noise: a badly translated query fails on both arms
and indicts neither. What separates the arms is exactly the mined bridging rules — so a
paraphrastic question answered by B and not by A is a measured QA payoff of a bridge
(attributed by name when the QGEN rewording pair matches a rule's lexeme pair), and any
B-only success on a control record is the fabrication analog. Rules are monotone (B is a
superset of A), so an A-only bind is an engine anomaly -> `query-brittleness`, alongside
malformed queries. Answer checking is mechanical: the `$ans` binding must be the QGEN
gold answer, matched via the symbol itself, a `Name` atom, or the record's
Member/Inheritance/GroupOf typing.

Engine-bug conjunct probes (same ladder as m5_preservation): when a conjunction fails,
if dropping the first conjunct binds -> `bug_conj_reuses_rule_premise`; if every conjunct
binds alone -> `bug_conj_two_conjuncts_share_premise`.

Deterministic; no clock, no randomness. MUST run under the PeTTaChainer env:
  cd /home/manhin/Dev/PeTTaChainer && uv run python <abs-path>/m5_questions.py \
      --faithful <canon.jsonl> [--out <results.json>] [--report <md>]
"""

from __future__ import annotations

import argparse
import collections
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pettachainer import PeTTaChainer  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)
SEEDED = os.path.join(FUSENF, os.pardir, "seeded_rules.metta")
STEPS = 400


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def rule_lines(path):
    return [l.strip() for l in open(path, encoding="utf-8")
            if l.strip() and not l.strip().startswith(";")]


# ---------------------------------------------------------------- s-expressions
def tokenize(s):
    return re.findall(r'\(|\)|"[^"]*"|[^\s()]+', s)


def parse_sexpr(s):
    toks = tokenize(s)
    pos = 0

    def read():
        nonlocal pos
        if toks[pos] == "(":
            pos += 1
            out = []
            while toks[pos] != ")":
                out.append(read())
            pos += 1
            return out
        t = toks[pos]
        pos += 1
        return t

    term = read()
    if pos != len(toks):
        raise ValueError("trailing tokens")
    return term


def unify(template, ground, binding):
    """Template with $vars vs ground term; extends binding or returns None."""
    if isinstance(template, str) and template.startswith("$"):
        if template in binding:
            return binding if binding[template] == ground else None
        b = dict(binding)
        b[template] = ground
        return b
    if isinstance(template, str) or isinstance(ground, str):
        return binding if template == ground else None
    if len(template) != len(ground):
        return None
    for t, g in zip(template, ground):
        binding = unify(t, g, binding)
        if binding is None:
            return None
    return binding


def render(term):
    if isinstance(term, str):
        return term
    return "(" + " ".join(render(t) for t in term) + ")"


# ---------------------------------------------------------------- KB + queries
def statements_of(rec):
    return ["(: %s %s (STV %s %s))" % (a["proof_name"], a["term"], a["stv"][0], a["stv"][1])
            for a in rec["atoms"]]


def run_query(kb_lines, statements, conjuncts):
    """-> (binds, answers): raw bind success + the $ans bindings (sorted).

    The two are distinct on purpose: probe queries over single conjuncts often
    contain no ``$ans``, and truthiness of the answer list alone would
    misreport them as failures (a bug caught 2026-08-25 — probes must read
    ``binds``, the arms read ``answers``).
    """
    h = PeTTaChainer()
    for l in kb_lines:
        h.add_atom(l)
    for s in statements:
        h.add_atom(s)
    q = conjuncts[0] if len(conjuncts) == 1 else "(And %s)" % " ".join(conjuncts)
    res = h.query("(: $prf %s $tv)" % q, steps=STEPS, timeout_sec=0)
    template = parse_sexpr("(: $prf %s $tv)" % q)
    binds = False
    out = set()
    for r in res:
        try:
            g = parse_sexpr(r)
        except Exception:
            continue
        b = unify(template, g, {})
        if b is not None:
            binds = True
            a = render(b.get("$ans", ""))
            if a:
                out.add(a)
    return binds, sorted(out)


NUM_WORDS = {"one", "two", "three", "four", "five", "six", "seven", "eight",
             "nine", "ten", "several", "some", "many", "both"}


def norm_answer(ans):
    a = ans.strip().strip('.,;:!?"').lower()
    for art in ("the ", "a ", "an "):
        if a.startswith(art):
            a = a[len(art):]
    return a.replace(" ", "_")


STOP_TOKS = {"of", "a", "an", "the", "to", "in", "on", "at", "for", "with", "and"}


def gold_variants(answer):
    """Candidate normalized golds: article/quantity/modifier stripping + naive
    singulars + individual content tokens (generous but record-local — the
    binding must still be the query's own `$ans` variable)."""
    base = norm_answer(answer)
    toks = base.split("_")
    forms = {base}
    if len(toks) > 1 and (toks[0] in NUM_WORDS or toks[0].isdigit()):
        forms.add("_".join(toks[1:]))
    for t in toks:
        if t not in STOP_TOKS and t not in NUM_WORDS and not t.isdigit():
            forms.add(t)
    for f in list(forms):
        if f.endswith("ies"):
            forms.add(f[:-3] + "y")
        if f.endswith("es"):
            forms.add(f[:-2])
        if f.endswith("s"):
            forms.add(f[:-1])
    return forms


def gold_match(bindings, answer, rec):
    """Does any $ans binding denote the gold answer, per the record's own atoms?"""
    golds = gold_variants(answer)
    raw = answer.strip().strip('.,;:!?').lower()
    classes = collections.defaultdict(set)   # symbol -> typing classes
    names = {}
    for a in rec["atoms"]:
        m = re.match(r"\((Member|Inheritance|GroupOf) ([\w$]+) ([a-z_0-9]+)\)\Z", a["term"])
        if m:
            classes[m.group(2)].add(m.group(3))
        m = re.match(r'\(Name ([\w$]+) "([^"]*)"\)\Z', a["term"])
        if m:
            names[m.group(1)] = m.group(2).lower()
    for st, sd in rec.get("stars", {}).items():
        if sd.get("class"):
            classes[st].add(sd["class"])
    for b in bindings:
        if b in golds or names.get(b) == raw or golds & classes.get(b, set()):
            return True
    return False


# ---------------------------------------------------------------- bridge rules
def bridge_directed(paths):
    """(premise-lexeme, conclusion-lexeme) -> [proof names], per rule line.

    A bridge fires question-ward when the RECORD's lexeme is in the premise and
    the QUERY's lexeme in the conclusion; lexical collapses ship both
    directions as separate rules, converses/structural rules do not.
    """
    out = collections.defaultdict(list)
    for p in paths:
        for line in open(p, encoding="utf-8"):
            s = line.strip()
            if s.startswith(";") or not s:
                continue
            mm = re.match(r"\(: (\S+) \(Implication (.*)\) \(STV", s)
            if not mm:
                continue
            name = mm.group(1)
            try:
                body = parse_sexpr("(%s)" % mm.group(2))
            except Exception:
                continue
            if len(body) != 2:
                continue
            def member_lex(t):
                found = set()
                stack = [t]
                while stack:
                    x = stack.pop()
                    if isinstance(x, list):
                        if len(x) == 3 and x[0] == "Member" and isinstance(x[2], str) \
                                and re.fullmatch(r"[a-z_0-9]+", x[2]):
                            found.add(x[2])
                        stack.extend(x)
                return found
            for pl in sorted(member_lex(body[0])):
                for cl in sorted(member_lex(body[1])):
                    if pl != cl:
                        out[(pl, cl)].append(name)
    return out


def lexemes_in(texts, lex_res):
    out = set()
    for t in texts:
        for l, rx in lex_res.items():
            if rx.search(t):
                out.add(l)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--faithful", required=True)
    ap.add_argument("--out", default=os.path.join(FUSENF, "questions", "results.json"))
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    manifest = json.load(open(os.path.join(FUSENF, "questions", "manifest.json"),
                              encoding="utf-8"))
    bridge_files = [os.path.join(FUSENF, "rules", b) for b in manifest["bridge_files"]]
    stratum = {s["id"]: s["stratum"] for s in manifest["sample"]}
    faithful = {r["id"]: r for r in load(args.faithful)}
    kb_a = rule_lines(SEEDED)
    kb_b = list(kb_a)
    for p in bridge_files:
        kb_b += rule_lines(p)
    directed = bridge_directed(bridge_files)
    bridge_lex = set(manifest["bridge_lexemes"])
    lex_res = {l: re.compile(r"(?<![\w$])" + re.escape(l) + r"(?![\w])")
               for l in bridge_lex}

    rows = []
    for s in manifest["sample"]:
        cid = s["id"]
        qpath = os.path.join(FUSENF, "questions", "%s.q.json" % cid)
        if not os.path.exists(qpath):
            rows.append({"id": cid, "status": "no-questions"})
            continue
        qrec = json.load(open(qpath, encoding="utf-8"))
        rec = faithful[cid]
        stmts = statements_of(rec)
        for q in qrec["questions"]:
            row = {"id": cid, "qid": q["qid"], "kind": q["kind"],
                   "stratum": stratum[cid], "question": q["question"],
                   "answer": q["answer"]}
            if q.get("reworded"):
                row["reworded"] = q["reworded"]
            qf = os.path.join(FUSENF, "queries", "%s.query.txt" % q["qid"])
            if not os.path.exists(qf):
                row["status"] = "no-query"
                rows.append(row)
                continue
            qtext = open(qf, encoding="utf-8").read().strip()
            try:
                term = parse_sexpr(qtext)
                assert "$ans" in qtext
            except Exception:
                row["status"] = "malformed-query"
                row["bucket"] = "query-brittleness"
                rows.append(row)
                continue
            conj = ([render(t) for t in term[1:]]
                    if isinstance(term, list) and term and term[0] == "And"
                    else [render(term)])
            row["query"] = conj

            binds_a, ans_a = run_query(kb_a, stmts, conj)
            binds_b, ans_b = run_query(kb_b, stmts, conj)
            ok_a = bool(ans_a) and gold_match(ans_a, q["answer"], rec)
            ok_b = bool(ans_b) and gold_match(ans_b, q["answer"], rec)
            row.update({
                "binds_a": binds_a, "binds_b": binds_b,
                "gold_a": ok_a, "gold_b": ok_b,
                "ans_a": ans_a[:4], "ans_b": ans_b[:4],
            })

            # engine-bug probes when the conjunction fails on B
            if not binds_b and len(conj) > 1:
                if run_query(kb_b, stmts, conj[1:])[0]:
                    row["engine_bug"] = "bug_conj_reuses_rule_premise"
                elif all(run_query(kb_b, stmts, [c])[0] for c in conj):
                    row["engine_bug"] = "bug_conj_two_conjuncts_share_premise"

            # bridge attribution: query lemmas (conclusion side) x record lemmas
            # (premise side) against the directed rule inventory
            rec_lex = lexemes_in([a["term"] for a in rec["atoms"]], lex_res)
            q_lex = lexemes_in(conj, lex_res)
            fired, reverse_only = [], []
            for r_l in sorted(rec_lex):
                for q_l in sorted(q_lex):
                    if r_l == q_l:
                        continue
                    if (r_l, q_l) in directed:
                        fired += directed[(r_l, q_l)]
                    elif (q_l, r_l) in directed:
                        reverse_only += directed[(q_l, r_l)]

            # differential classification
            if row["binds_a"] and not row["binds_b"]:
                row["bucket"] = "query-brittleness"      # monotonicity violation
            elif ok_b and not ok_a:
                if q["kind"] == "paraphrastic":
                    row["bucket"] = "bridge-payoff"
                    row["bridge_rules"] = sorted(set(fired))
                    row["pair_in_inventory"] = bool(fired)
                else:
                    row["bucket"] = "bridge-supplied-literal"
                if stratum[cid] == "control":
                    row["bucket"] = "control-fabrication-analog"
            elif ok_a and ok_b:
                row["bucket"] = "answered-both"
            elif not row["binds_a"] and not row["binds_b"]:
                if row.get("engine_bug"):
                    row["bucket"] = ("engine-bug-suppressed"
                                     if q["kind"] == "paraphrastic" else "engine-bug")
                    if q["kind"] == "paraphrastic" and fired:
                        row["suppressed_payoff_candidate"] = sorted(set(fired))
                elif q["kind"] == "paraphrastic":
                    if len(conj) > 1:
                        row["failing_conjuncts"] = [
                            c for c in conj if not run_query(kb_b, stmts, [c])[0]]
                    if fired:
                        row["bucket"] = "uncovered-rule-present-unfired"
                        row["bridge_rules"] = sorted(set(fired))
                    elif reverse_only:
                        row["bucket"] = "uncovered-rule-wrong-direction"
                        row["bridge_rules"] = sorted(set(reverse_only))
                    else:
                        row["bucket"] = "uncovered-paraphrase-inventory-miss"
                else:
                    row["bucket"] = "query-brittleness"
                    if len(conj) > 1:
                        row["failing_conjuncts"] = [
                            c for c in conj if not run_query(kb_a, stmts, [c])[0]]
            else:
                row["bucket"] = "binds-wrong"            # binds but gold unmatched
            rows.append(row)

    json.dump({"manifest": {k: manifest[k] for k in
                            ("qgen_sha256", "qparse_sha256", "bridge_files", "canon")},
               "rows": rows}, open(args.out, "w", encoding="utf-8"),
              indent=1, sort_keys=True)

    # ------------------------------------------------------------ report
    n = collections.Counter((r["kind"], r.get("bucket")) for r in rows if "kind" in r)
    buckets = collections.Counter(r.get("bucket") for r in rows if r.get("bucket"))
    lit = [r for r in rows if r.get("kind") == "literal"]
    par = [r for r in rows if r.get("kind") == "paraphrastic"]
    lit_ok = sum(1 for r in lit if r.get("gold_a"))
    par_payoff = [r for r in par if r.get("bucket") == "bridge-payoff"]
    L = []
    L.append("# M5 question arm — differential run (item F)\n")
    L.append(f"- questions: {len(rows)} rows ({len(lit)} literal + {len(par)} paraphrastic); "
             f"QGEN `{manifest['qgen_sha256'][:12]}` QPARSE `{manifest['qparse_sha256'][:12]}`; "
             f"bridges: {', '.join(manifest['bridge_files'])}")
    L.append(f"- literal baseline (arm A answers with gold): **{lit_ok}/{len(lit)}**")
    L.append(f"- bridge payoff (paraphrastic, B-only with gold): **{len(par_payoff)}**"
             f" — named rules: "
             + (", ".join(sorted({r2 for r in par_payoff for r2 in r.get('bridge_rules', [])}))
                or "none matched by pair"))
    L.append(f"- buckets: {dict(sorted(buckets.items()))}\n")
    L.append("| qid | kind | stratum | bucket | A | B | question |")
    L.append("|---|---|---|---|---|---|---|")
    for r in rows:
        if "qid" not in r:
            continue
        fmt = lambda ok, binds: "✓" if ok else ("bind" if binds else "—")
        L.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            r["qid"], r.get("kind", "?"), r.get("stratum", "?"),
            r.get("bucket", r.get("status", "?")),
            fmt(r.get("gold_a"), r.get("binds_a")),
            fmt(r.get("gold_b"), r.get("binds_b")),
            r.get("question", "")[:60]))
    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print("-> %s" % args.report)
    print("rows %d  literal-baseline %d/%d  payoff %d  buckets %s" % (
        len(rows), lit_ok, len(lit), len(par_payoff), dict(sorted(buckets.items()))))


if __name__ == "__main__":
    main()
