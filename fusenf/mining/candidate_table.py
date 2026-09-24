"""Cross-method CANDIDATE TABLE for one substrate (owner 2026-09-24): rows are the candidates the proposing methods put
forward — §4.3.1 proposals (closed units of size >= 2), §4.3.3 passes (joins: genuine, and part-of restatements), §4.3.4
licensed / joint-only / contested unifications (the Tier A instrument; paraphrase pairs exist only in Tier A, so the §4.3.4
rows are the same for every substrate that contains Tier A and empty for one that does not) — and the two distributional
methods appear as COLUMNS: §4.3.2 slot-pair signals and §4.3.5 autoencoder ties that touch the row, each labelled as
corroboration or as a flag. Nothing is filtered; every row keeps its tier split and its own method's verdict.

Reading (owner discussion 2026-09-24): §4.3.1 and §4.3.3 propose (packs of units and of joined halves, evidence = support);
§4.3.4 licenses (its evidence is the paraphrase label, the only evidence in the set that speaks to meaning preservation);
§4.3.2 and §4.3.5 measure distributional sameness, which has three sources the methods cannot tell apart — semantic,
arbitrary (template fillers, names) and contextual — so a pass from either cannot license a rewrite on its own but can
corroborate a row another method proposed, or flag it (a same-class cross-role signal made by participant-swap controls, a
designed-parallel tie). The one family every method reaches from its own side is the Theme / Patient wobble inside a shared
frame, which the prompt already legislates per verb and the controls contest.

Column rules (disclosed):
  §4.3.2  signals of the main block (word texts, cluster cosine 0.85, JSD <= 0.3): a signal CORROBORATES a §4.3.4 row when its two
          slots are the row's two classes with the same head (synonym pair) or the row's converse classes (cross-both), or when its two
          heads are the row's role pair; on a §4.3.1 / §4.3.3 row a signal whose two slots both lie inside the row's atoms is a FLAG
          (the row's own class holds two indistinguishable roles — on Tier A made by the participant-swap controls, the swap share
          shown), and a signal with one slot inside the row names a same-role TWIN class (a lexical twin the row's class has).
  §4.3.5  ties of the adopted point (k 32, cosine >= 0.85, init floor): a shape-parallel exclusive tie whose substitution is the row's
          two forms (or, for a role row, its two heads) CORROBORATES a §4.3.4 row; a §4.3.3 row is corroborated when its two units
          are themselves tied (relation shown); a §4.3.1 row lists its ties by relation and its best exclusive partner (an exclusive
          shape-parallel partner on designed records = the template FLAG).

Usage:
  python candidate_table.py --dir out_tier_ab [--align-dir out_ecmp | --no-align] --tiers tierA,tierB
"""
from __future__ import annotations

import argparse
import collections
import glob
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
RE_VAR = re.compile(r"\$([exf])\d+")
CLASS_LINKS = ("Member", "Inheritance", "GroupOf", "Name")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def norm(atom):
    return RE_VAR.sub(lambda m: "$" + m.group(1), atom.strip())


def atoms_of(query):
    """clauses of a rendered query: '(And a b …)' -> [a, b, …]; a bare atom -> [atom]"""
    q = query.strip()
    if q.endswith(" ~NEG"):
        q = q[:-5]
    if not q.startswith("(And "):
        return [q]
    out, depth, cur = [], 0, ""
    for ch in q[5:-1]:
        if ch == "(":
            depth += 1
        if depth > 0:
            cur += ch
        if ch == ")":
            depth -= 1
            if depth == 0:
                out.append(cur.strip())
                cur = ""
    return out


def parse(atom):
    toks = atom.strip().strip("()").split()
    return toks[0], toks[1:]


def slots_of(atoms):
    """event-centre slots 'class.Head' of a list of atoms (class from the centre's Member atom, else <unclassed>)"""
    cls = {}
    for a in atoms:
        h, args = parse(a)
        if h == "Member" and len(args) == 2 and args[0].startswith("$e"):
            cls[args[0]] = args[1]
    out = set()
    for a in atoms:
        h, args = parse(a)
        if h not in CLASS_LINKS and len(args) == 2 and args[0].startswith("$e"):
            out.add(f"{cls.get(args[0], '<unclassed>')}.{h}")
    return out, cls


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", required=True)
    ap.add_argument("--align-dir", default=os.path.join(HERE, "out_ecmp"), help="the §4.3.4 instrument's directory (Tier A)")
    ap.add_argument("--no-align", action="store_true", help="substrate without Tier A: no §4.3.4 rows")
    ap.add_argument("--tiers", default="tierA,tierB")
    ap.add_argument("--block", default="word_0.85")
    ap.add_argument("--min-unit-support", type=int, default=10, help="§4.3.1 rows shown in the .md (all rows in the .jsonl)")
    ap.add_argument("--corpora", default=os.path.join(HERE, os.pardir, "corpora"))
    args = ap.parse_args()
    d = args.dir
    ta, tb = args.tiers.split(",")
    units = {u["pattern_id"]: u for u in load(os.path.join(d, "patterns2_faithful.jsonl"))}
    mi = [r for r in load(os.path.join(d, "mi_faithful.jsonl")) if r["pass"]]
    ae = [r for r in load(os.path.join(d, "ae_faithful.jsonl")) if r["pass"]]
    rf = load(os.path.join(d, f"rolefiller2_signals_faithful_{args.block}.jsonl"))
    align = [] if args.no_align else [r for r in load(os.path.join(args.align_dir, "align_faithful.jsonl"))
                                     if r["kind"] in ("substitution-factor", "substitution-joint", "role") and r.get("gate") != "FAIL"]
    labels = {}
    for p in sorted(glob.glob(os.path.join(args.corpora, "*.jsonl"))):
        for r in load(p):
            labels[r["id"]] = r.get("labels") or {}
    occ = collections.defaultdict(list)
    for r in load(os.path.join(d, "valuations_occ.jsonl")):
        occ[f"{r['center_class']}.{r['head']}"].append(r["id"])

    def swap_share(slot_a, slot_b):
        ids = occ.get(slot_a, []) + occ.get(slot_b, [])
        n = sum(1 for i in ids if i.startswith(ta) and labels.get(i, {}).get("control_kind") == "participant-swap")
        return round(n / max(1, len(ids)), 2)

    def tier_bucket(ids):
        t = {i.split("-")[0] for i in ids}
        return f"{ta}-only" if t == {ta} else (f"{tb}-only" if t == {tb} else "cross")
    # ---- indexes over the two column methods ----
    ae_by_unit = collections.defaultdict(list)
    ae_by_pair = {}
    for r in ae:
        ae_by_unit[r["a"]].append(r)
        ae_by_unit[r["b"]].append(r)
        ae_by_pair[tuple(sorted((r["a"], r["b"])))] = r
    ae_par = [r for r in ae if r.get("parallel") and r["relation"] == "exclusive"]
    rf_sig = []
    for r in rf:
        c = r["candidate"]
        ca, ha = c["slot_a"].rsplit(".", 1)
        cb, hb = c["slot_b"].rsplit(".", 1)
        rf_sig.append({"slot_a": c["slot_a"], "slot_b": c["slot_b"], "ca": ca, "ha": ha, "cb": cb, "hb": hb, "subtype": c["subtype"],
                       "n": r["support"], "jsd": r.get("jsd"), "swap": swap_share(c["slot_a"], c["slot_b"])})

    def rf_for_atoms(atoms):
        slots, cls = slots_of(atoms)
        flags, twins = [], []
        for s in rf_sig:
            ina, inb = s["slot_a"] in slots, s["slot_b"] in slots
            if ina and inb:
                flags.append(f"{s['slot_a']} ~ {s['slot_b']} (n {s['n']}, swap {s['swap']})")
            elif (ina or inb) and s["subtype"] == "cross-event":
                twins.append(f"{s['slot_a']} ~ {s['slot_b']}")
        return flags, sorted(set(twins))

    def ae_for_unit(pid):
        ties = ae_by_unit.get(pid, [])
        rel = collections.Counter(r["relation"] for r in ties)
        ex = sorted([r for r in ties if r["relation"] == "exclusive"], key=lambda r: -r["cosine"])
        best = None
        if ex:
            r = ex[0]
            other = r["b"] if r["a"] == pid else r["a"]
            best = {"partner": units[other]["query"], "cosine": r["cosine"], "parallel": bool(r.get("parallel")),
                    "partner_tier": tier_bucket(units[other]["ids"])}
        return dict(rel), best
    rows = []
    # ---- §4.3.1 rows ----
    for u in sorted(units.values(), key=lambda u: (-u["support"], u["pattern_id"])):
        if not u.get("proposal"):
            continue
        flags, twins = rf_for_atoms(u["atoms"])
        rel, best = ae_for_unit(u["pattern_id"])
        rows.append({"source": "4.3.1", "kind": "unit", "id": u["pattern_id"], "lhs": u["query"], "rule": f"(Implication {u['query']} {u['meta_node']})",
                     "support": u["support"], "tier": tier_bucket(u["ids"]), "per_tier": u.get("per_tier"),
                     "rf_flags": flags, "rf_twins": twins, "ae_ties": rel, "ae_best_exclusive": best})
    # ---- §4.3.3 rows ----
    for r in sorted(mi, key=lambda r: (r["contained"], -r["mi_bits"])):
        ua, ub = units[r["a"]], units[r["b"]]
        shared = sorted(set(ua["ids"]) & set(ub["ids"]))
        flags, twins = rf_for_atoms(r["merged_atoms"])
        tie = ae_by_pair.get(tuple(sorted((r["a"], r["b"]))))
        rows.append({"source": "4.3.3", "kind": "part-of" if r["contained"] else "join", "id": f"{r['a']}~{r['b']}", "a": r["query_a"], "b": r["query_b"],
                     "lhs": "(And " + " ".join(r["merged_atoms"]) + ")" if len(r["merged_atoms"]) > 1 else r["merged_atoms"][0], "rule": r["implication"],
                     "support": r["n_both"], "distinct": r["n_distinct_shared"], "jaccard": r["jaccard"], "mi_bits": r["mi_bits"],
                     "tier": tier_bucket(shared), "rf_flags": flags, "rf_twins": twins,
                     "ae_tie": {"relation": tie["relation"], "cosine": tie["cosine"]} if tie else None})
    # ---- §4.3.4 rows ----
    for r in align:
        if r["kind"] == "role":
            heads = {r["a"], r["b"]}
            rf_c = [f"{s['slot_a']} ~ {s['slot_b']} (n {s['n']}, swap {s['swap']})" for s in rf_sig if {s["ha"], s["hb"]} == heads]
            ae_c = [f"{x['substitution']} ({x['cosine']:.2f}, {tier_bucket(units[x['a']]['ids'] + units[x['b']]['ids'])})" for x in ae_par
                    if x.get("substitution") and {parse(p.strip())[0] for p in x["substitution"].split("->")} == heads]
            rows.append({"source": "4.3.4", "kind": "role", "id": f"{r['a']}~{r['b']}", "a": r["a"], "b": r["b"], "gate": r["gate"],
                         "support": r["support"], "control": r["control_support"], "rf_corroborates": rf_c, "ae_corroborates": ae_c})
            continue
        fa, fb = atoms_of(r["a"]), atoms_of(r["b"])
        _, cls_a = slots_of(fa)
        _, cls_b = slots_of(fb)
        classes = set(cls_a.values()) | set(cls_b.values())
        na, nb = {norm(x) for x in fa}, {norm(x) for x in fb}
        rf_c = []
        for s in rf_sig:
            if {s["ca"], s["cb"]} <= classes and s["ca"] != s["cb"]:
                rf_c.append(f"{s['slot_a']} ~ {s['slot_b']} (n {s['n']}, swap {s['swap']})")
        if not classes and len(fa) == 1 and len(fb) == 1:   # a role-only factor: match like a role row, by the two heads
            heads = {parse(fa[0])[0], parse(fb[0])[0]}
            rf_c += [f"{s['slot_a']} ~ {s['slot_b']} (n {s['n']}, swap {s['swap']})" for s in rf_sig if {s["ha"], s["hb"]} == heads]
        ae_c = []
        for x in ae_par:
            qa, qb = {norm(y) for y in atoms_of(x["query_a"])}, {norm(y) for y in atoms_of(x["query_b"])}
            sub = x.get("substitution") or ""
            sub_atoms = {norm(p.strip()) for p in sub.split("->")} if sub else set()
            if {qa, qb} == {na, nb} if False else (qa == na and qb == nb) or (qa == nb and qb == na) or (r["kind"] == "substitution-factor" and sub_atoms == na | nb):
                ae_c.append(f"{x['query_a']} ~ {x['query_b']} ({x['cosine']:.2f}, {tier_bucket(units[x['a']]['ids'] + units[x['b']]['ids'])})")
        rows.append({"source": "4.3.4", "kind": r["kind"].split("-")[1], "id": " ~ ".join((r["a"], r["b"])), "a": r["a"], "b": r["b"], "gate": r["gate"],
                     "support": r["support"], "control": r["control_support"], "alone": r.get("alone"), "co_dependent": r.get("co_dependent"),
                     "rf_corroborates": sorted(set(rf_c)), "ae_corroborates": ae_c})
    # ---- outputs ----
    with open(os.path.join(d, "candidates.jsonl"), "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    name = os.path.basename(os.path.abspath(d))
    R = [f"# Cross-method candidate table — `{name}`\n",
         "Rows = what the proposing methods put forward: §4.3.1 proposals (closed units of size ≥ 2), §4.3.3 passes (joins; part-of restatements counted, "
         "not listed), §4.3.4 unifications at gate LICENSED / JOINT-ONLY / CONTESTED (the Tier A instrument — paraphrase pairs exist only in Tier A). "
         "Columns = the distributional methods: §4.3.2 signals (word@0.85, JSD ≤ 0.3) and §4.3.5 ties (k 32, cosine ≥ 0.85, init floor) that touch the row, "
         "as corroboration or as a flag. Nothing filtered; the record is `candidates.jsonl`.\n",
         "**Reading.** §4.3.1 and §4.3.3 propose; §4.3.4 licenses (the only evidence that speaks to meaning preservation); §4.3.2 and §4.3.5 measure "
         "distributional sameness, which can be semantic, arbitrary (template fillers, names) or contextual, so on their own they license nothing but "
         "corroborate or flag. The family every method reaches is the Theme / Patient wobble inside a shared frame.\n"]
    u_rows = [r for r in rows if r["source"] == "4.3.1"]
    j_rows = [r for r in rows if r["source"] == "4.3.3" and r["kind"] == "join"]
    p_rows = [r for r in rows if r["source"] == "4.3.3" and r["kind"] == "part-of"]
    a_rows = [r for r in rows if r["source"] == "4.3.4"]
    R.append("## Counts\n")
    R.append(f"- §4.3.1 proposals: {len(u_rows)} ({sum(1 for r in u_rows if r['ae_best_exclusive'])} with an exclusive §4.3.5 partner, "
             f"{sum(1 for r in u_rows if r['rf_flags'])} with a within-class §4.3.2 flag, {sum(1 for r in u_rows if r['rf_twins'])} with a same-role twin class)")
    R.append(f"- §4.3.3 joins (genuine): {len(j_rows)} ({sum(1 for r in j_rows if r['ae_tie'])} also tied by §4.3.5); part-of restatements: {len(p_rows)} ({sum(1 for r in p_rows if r['ae_tie'])} tied)")
    R.append(f"- §4.3.4 unifications (non-FAIL): {len(a_rows)} ({sum(1 for r in a_rows if r['rf_corroborates'])} corroborated by §4.3.2, "
             f"{sum(1 for r in a_rows if r['ae_corroborates'])} by §4.3.5)" if not args.no_align else "- §4.3.4: not applicable (no paraphrase pairs in this substrate)")
    if a_rows:
        R.append("\n## §4.3.4 unifications (rows) with §4.3.2 / §4.3.5 corroboration (columns)\n")
        R.append("| kind | gate | support | control | A | B | §4.3.2 | §4.3.5 |\n|---|---|---|---|---|---|---|---|")
        order = {"LICENSED": 0, "JOINT-ONLY": 1, "CONTESTED": 2}
        for r in sorted(a_rows, key=lambda r: (order.get(r["gate"], 3), -r["support"], r["id"])):
            R.append(f"| {r['kind']} | {r['gate']} | {r['support']} | {r['control']} | `{r['a']}` | `{r['b']}` | {'<br>'.join(r['rf_corroborates']) or '—'} | {'<br>'.join(r['ae_corroborates']) or '—'} |")
    groups = collections.OrderedDict()   # one md row per distinct merged feature; the pairs that reach it are collapsed
    for r in sorted(j_rows, key=lambda r: -r["mi_bits"]):
        groups.setdefault(r["lhs"], []).append(r)
    R.append(f"\n## §4.3.3 genuine joins (rows = the {len(groups)} distinct merged features, pairs collapsed) with §4.3.5 ties and §4.3.2 flags (columns)\n")
    R.append("| pairs | max MI | Jaccard range | shared (distinct) | tier | merged feature | §4.3.5 tied pairs | §4.3.2 flags / twins |\n|---|---|---|---|---|---|---|---|")
    for lhs, rs in groups.items():
        tied = [x["ae_tie"] for x in rs if x["ae_tie"]]
        tiers = sorted({x["tier"] for x in rs})
        flags = sorted({f for x in rs for f in x["rf_flags"]}) + sorted({"twin: " + t for x in rs for t in x["rf_twins"]})
        R.append(f"| {len(rs)} | {max(x['mi_bits'] for x in rs):.4f} | {min(x['jaccard'] for x in rs):.2f}–{max(x['jaccard'] for x in rs):.2f} | "
                 f"{max(x['support'] for x in rs)} ({max(x['distinct'] for x in rs)}) | {', '.join(tiers)} | `{lhs}` | "
                 f"{len(tied)} of {len(rs)}" + (f" ({', '.join(sorted({t['relation'] for t in tied}))})" if tied else "") + f" | {'<br>'.join(flags) or '—'} |")
    shown = [r for r in u_rows if r["support"] >= args.min_unit_support or r["ae_best_exclusive"] or r["rf_flags"]]
    R.append(f"\n## §4.3.1 proposals (rows; shown: support ≥ {args.min_unit_support} or with a §4.3.5 exclusive partner or a §4.3.2 flag — {len(shown)} of {len(u_rows)}) with §4.3.5 ties and §4.3.2 flags (columns)\n")
    R.append("| support | tier | unit | §4.3.5 ties by relation | best exclusive partner | §4.3.2 flags / twins |\n|---|---|---|---|---|---|")
    for r in sorted(shown, key=lambda r: (-r["support"], r["id"]))[:120]:
        b = r["ae_best_exclusive"]
        best = f"`{b['partner']}` {b['cosine']:.2f}{' parallel' if b['parallel'] else ''} [{b['partner_tier']}]" if b else "—"
        ties = " ".join(f"{k} {v}" for k, v in sorted(r["ae_ties"].items())) or "—"
        R.append(f"| {r['support']} | {r['tier']} | `{r['lhs']}` | {ties} | {best} | {'<br>'.join(r['rf_flags'] + ['twin: ' + t for t in r['rf_twins']]) or '—'} |")
    open(os.path.join(d, "CANDIDATES.md"), "w", encoding="utf-8").write("\n".join(R) + "\n")
    print(f"-> {d}/CANDIDATES.md + candidates.jsonl: {len(u_rows)} unit rows, {len(j_rows)} join rows (+{len(p_rows)} part-of), {len(a_rows)} unification rows")


if __name__ == "__main__":
    main()
