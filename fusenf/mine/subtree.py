"""§5.1 END TO END: mine the connected patterns of a run in both views, generalize each pattern's matches, run the
two tests, link the views, and write the candidate records with a summary to read.

    python -m fusenf.mine patterns --run NAME [--min-families 3] [--max-atoms 5] [--max-variables N]
                                   [--exclude-heads A,B] [--keep 12] [--tests full|sample|none] [--summary-only]

    → fusenf/runs/NAME/patterns.lexicalized.jsonl, patterns.shape.jsonl   (candidate records, method "subtree")
      fusenf/runs/NAME/patterns.report.json, patterns.md                    (the run's counts; the summary)

A candidate record carries: the pattern (atoms, typed variables, size, structure labels, cost fields, its shape or
the lexicalized patterns it covers, the largest pattern matching exactly the same sentences), the support
(families of the mining share; sentences, embeddings and the families of the other shares beside it), the
evidence over every matching sentence (how many template instances a match spans, the templates, whether a
restating template's atoms are among them, each atom's truth values, each event's tense, the classes and names
of what each variable stood for), the GENERALIZATION of its matches, a sample of matches with their bindings and
text, and the two tests. Nothing is filtered: template-internal patterns, restated copies, tree-shaped patterns
and patterns that only repeat a larger one's matches are labelled, not dropped.
"""
from __future__ import annotations

import collections
import hashlib
import heapq
import json
import os
import time

from . import RUNS, atoms as A, candidates as CD, generalize as G, lift as L, patterns as P


class _Stat:
    __slots__ = ("size", "families", "datasets", "sentences", "embeddings", "instances", "templates", "truth", "tenses",
                 "atom_tenses", "fillers", "names", "lexical", "sample", "gen", "first", "signature", "restated")

    def __init__(self, size: int):
        self.size = size
        self.families: dict[str, set] = collections.defaultdict(set)      # share → families
        self.datasets: dict[str, set] = collections.defaultdict(set)      # dataset → families of the mining share
        self.sentences = self.embeddings = 0
        self.instances = collections.Counter()                             # how many template instances a match spans
        self.templates = collections.Counter()
        self.truth = [collections.Counter() for _ in range(size)]          # per atom: (strength, confidence)
        self.tenses: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.atom_tenses: dict[int, collections.Counter] = collections.defaultdict(collections.Counter)
        self.fillers: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.names: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.lexical = collections.Counter()                               # shape view: the class symbols, as one tuple
        self.sample: list = []                                             # a heap of (-rank, n, match)
        self.gen = G.Generalizer()
        self.first = None
        self.signature = 0                                                 # of the set of matching sentences
        self.restated = 0                                                  # matches that hold a restating template's atoms


def _rank(family: str) -> int:
    return int(hashlib.md5(family.encode("utf-8")).hexdigest()[:12], 16)


class Collector:
    """The miner's sink: per frequent pattern, the support by share, the evidence over every matching sentence
    (the first embedding of each), the generalization of those matches, and a sample of matches to read — the
    ``keep`` families with the smallest hash, so the sample does not depend on the order of the corpus."""

    def __init__(self, corpus: P.Corpus, view: str, params: dict, keep: int = 12):
        self.corpus, self.view, self.params, self.keep = corpus, view, params, keep
        self.stats: dict[str, _Stat] = {}
        self.shape_sents = corpus.sentences["shape"]
        self.sentence_hash = [_rank(g["id"]) for g in corpus.graphs]
        self.restating = set(params.get("restating_templates") or ())

    def match(self, pattern: str, size: int, s: P.Sentence, ordered: tuple, n_emb: int):
        st = self.stats.get(pattern)
        if st is None:
            st = self.stats[pattern] = _Stat(size)
        st.families[s.role or "?"].add(s.family)
        if s.role == self.params["support_role"]:
            st.datasets[s.dataset or "?"].add(s.family)
        st.sentences += 1
        st.embeddings += n_emb
        st.signature = (st.signature + self.sentence_hash[s.n]) & 0xFFFFFFFFFFFFFFFF   # a sum: the order does not matter
        graph = self.corpus.graphs[s.n]
        src = [s.src[i] for i in ordered]
        atoms = [graph["atoms"][g] for g in src]
        st.instances[len({a.get("inst") for a in atoms})] += 1
        templates = {a.get("template") or "?" for a in atoms}
        st.templates[" + ".join(sorted(templates))] += 1
        st.restated += bool(templates & self.restating)
        for k, a in enumerate(atoms):
            st.truth[k][(a["s"], a["c"])] += 1
            t = self.corpus.atom_tenses[s.n].get(str(a["i"]))
            if t:
                st.atom_tenses[k][t] += 1
        bound = {pv: s.symbol.get(sv, sv) for sv, pv in P.bindings([s.keys[i] for i in ordered]).items()}
        classes, names, tenses = self.corpus.classes[s.n], self.corpus.names[s.n], self.corpus.tenses[s.n]
        for pv, sym in bound.items():
            kind = pv[1]
            if kind == "e":
                st.tenses[pv]["+".join(sorted(set(tenses.get(sym) or []))) or "untensed"] += 1
            if kind in "exti":
                for c in classes.get(sym) or ["?"]:
                    st.fillers[pv][c] += 1
                if sym in names:
                    st.names[pv][names[sym]] += 1
            elif kind == "c":
                st.fillers[pv][sym] += 1
        if self.view == "shape":
            st.lexical[tuple(sym for pv, sym in sorted(bound.items()) if pv[1] == "c")] += 1
        sh = self.shape_sents[s.n]                                    # the generalizer reads the shape lift of the same atoms
        st.gen.add(G.fragment(sh, [sh.local[g] for g in src]))
        if st.first is None:
            st.first = (s.n, src)
        if all(m["family"] != s.family for _, _, m in st.sample):
            item = (-_rank(s.family), s.n, {"id": s.id, "family": s.family, "dataset": s.dataset, "role": s.role,
                                             "atoms": src, "bindings": bound, "text": s.text})
            if len(st.sample) < self.keep:
                heapq.heappush(st.sample, item)
            elif item[0] > st.sample[0][0]:
                heapq.heapreplace(st.sample, item)

    def records(self, run: str, unit_families: dict | None = None) -> list[dict]:
        role = self.params["support_role"]
        out = []
        ranked = sorted(self.stats.items(), key=lambda kv: (kv[1].size, -len(kv[1].families.get(role, ())), kv[0]))
        for number, (pattern, st) in enumerate(ranked, 1):
            atoms = P.atoms_of(pattern)
            c = CD.new("subtree", number, atoms, self.view, {**self.corpus.key, "shape": self.view}, run, dict(self.params),
                       tag=self.view[0].upper())
            c["pattern"]["size"] = st.size
            c["pattern"]["variables"] = {v: P.TYPES.get(v[1], "Any") for v in P.variables(pattern)}
            c["pattern"]["labels"] = P.labels(atoms)
            uf = [unit_families.get(L.canonical(a)) for a in atoms] if unit_families else []
            uf = [x for x in uf if x]
            c["pattern"]["cost"] = {"atoms": st.size, "variables": len(c["pattern"]["variables"]),
                                    "rarest_atom_families": min(uf) if uf else None, "commonest_atom_families": max(uf) if uf else None}
            c["support"] = {"families": len(st.families.get(role, ())), "sentences": st.sentences, "embeddings": st.embeddings,
                            "datasets": {d: len(f) for d, f in sorted(st.datasets.items())},
                            "roles": {r: len(f) for r, f in sorted(st.families.items())}}
            total = sum(st.instances.values())
            ev = c["evidence"]
            ev["instances"] = {"one": st.instances.get(1, 0), "several": total - st.instances.get(1, 0)}
            ev["templates"] = dict(st.templates.most_common(6))
            ev["restated"] = st.restated                                    # matches with atoms of a restating template
            ev["truth"] = [{f"{s}/{cf}": n for (s, cf), n in t.most_common(4)} for t in st.truth]
            ev["tenses"] = {v: dict(t.most_common(5)) for v, t in sorted(st.tenses.items())}
            if st.atom_tenses:
                ev["atom_tenses"] = {str(k): dict(t.most_common(4)) for k, t in sorted(st.atom_tenses.items())}
            ev["fillers"] = {v: {"distinct": len(t), "top": dict(t.most_common(8))} for v, t in sorted(st.fillers.items())}
            if st.names:
                ev["names"] = {v: dict(t.most_common(5)) for v, t in sorted(st.names.items())}
            if self.view == "shape":
                ev["lexicalizations"] = {"distinct": len(st.lexical), "top": [[list(k), n] for k, n in st.lexical.most_common(8)]}
            ev["families"] = sorted(st.families.get(role, ()))
            gen = st.gen.result()
            c["generalization"] = {"atoms": gen["atoms"], "fragments": gen["fragments"], "constants": gen["constants"],
                                   "variables": gen["variables"], "equals_pattern": gen["pattern"] == pattern}
            c["matches"] = [m for _, _, m in sorted(st.sample, key=lambda x: (-x[0], x[1]))]
            c["_first"] = st.first
            c["_class"] = (st.sentences, st.signature)
            out.append(c)
        classes: dict[tuple, list] = collections.defaultdict(list)          # the patterns matching exactly the same sentences
        for c in out:
            classes[c.pop("_class")].append(c)
        for members in classes.values():
            largest = min(members, key=lambda c: (-c["pattern"]["size"], len(c["pattern"]["variables"]), c["id"]))
            for c in members:
                c["pattern"]["match_class"] = {"largest": largest["id"], "patterns": len(members), "is_largest": c is largest}
        return out


def link_views(corpus: P.Corpus, lexicalized: list[dict], shape: list[dict]):
    """Decision 4: each lexicalized pattern names its shape; each shape lists the lexicalized patterns it covers."""
    by_pattern = {P.SEP.join(c["pattern"]["atoms"]): c for c in shape}
    for c in shape:
        c["pattern"]["covers"] = []
    for c in lexicalized:
        n, src = c["_first"]
        sh = by_pattern.get(corpus.shape_of(n, src) or "")
        c["pattern"]["shape"] = sh["id"] if sh else None
        if sh:
            sh["pattern"]["covers"].append(c["id"])


def table_of(records: list[dict]) -> dict:
    return {P.SEP.join(c["pattern"]["atoms"]): (c["support"]["roles"], c["support"]["sentences"], c["support"]["embeddings"])
            for c in records}


REPORT = "patterns.report.json"


def run(name: str, params: dict | None = None, key: dict | None = None, keep: int = 12, tests: str = "full",
        graphs: list[dict] | None = None, write: bool = True, log=print) -> dict:
    """Mine run ``name``. ``tests``: "sample" runs the two tests on every candidate's sample matches; "full" also
    mines the renamed and shuffled corpus and compares the two tables; "none" skips them."""
    params = params or P.params_of()
    out_dir = os.path.join(RUNS, name)
    t0 = time.time()
    if graphs is None:
        graphs = A.read_graphs(os.path.join(out_dir, "graphs.jsonl"))
    corpus = P.Corpus(graphs, key, params["exclude_heads"])
    shares: dict[str, set] = collections.defaultdict(set)
    for g in corpus.graphs:
        shares[g.get("role") or "?"].add(g.get("family") or g["id"])
    result = {"params": params, "key": corpus.key, "views": {}, "seconds": {}, "tests": tests,
              "corpus": {"sentences": len(corpus.graphs), "families": {r: len(f) for r, f in sorted(shares.items())}}}
    for view in P.VIEWS:
        t = time.time()
        col = Collector(corpus, view, params, keep)
        report = P.mine(corpus.sentences[view], params, col)
        result["views"][view] = {"records": col.records(name, report.pop("unit_families")), "report": report}
        result["seconds"][view] = round(time.time() - t, 1)
        log(f"  {view}: {len(result['views'][view]['records']):,} candidates in {result['seconds'][view]} s")
    lex, shp = result["views"]["lexicalized"]["records"], result["views"]["shape"]["records"]
    link_views(corpus, lex, shp)
    if tests != "none":
        t = time.time()
        pairs = [G.rename_graph(g, seed=1) for g in corpus.graphs]
        renamed = P.Corpus([g for g, _ in pairs], corpus.key, params["exclude_heads"])
        moved = [m for _, m in pairs]
        for view in P.VIEWS:
            for c in result["views"][view]["records"]:
                c["tests"].update(G.check(c, corpus, renamed, moved, view))
        result["seconds"]["tests"] = round(time.time() - t, 1)
        log(f"  the two tests on every candidate: {result['seconds']['tests']} s")
        if tests == "full":
            t = time.time()
            result["renamed_corpus"] = {}
            for view in P.VIEWS:
                col = Collector(renamed, view, params, 1)
                P.mine(renamed.sentences[view], params, col)
                a, b = table_of(result["views"][view]["records"]), table_of(col.records(name))
                result["renamed_corpus"][view] = {"patterns": len(a), "identical": a == b,
                                                  "differing": sum(1 for k in set(a) | set(b) if a.get(k) != b.get(k))}
            result["seconds"]["renamed_corpus"] = round(time.time() - t, 1)
            log(f"  the renamed corpus mined again: {result['seconds']['renamed_corpus']} s — {result['renamed_corpus']}")
    for view in P.VIEWS:
        for c in result["views"][view]["records"]:
            c.pop("_first", None)
    result["seconds"]["total"] = round(time.time() - t0, 1)
    if write:
        for view in P.VIEWS:
            CD.write(result["views"][view]["records"], os.path.join(out_dir, f"patterns.{view}.jsonl"))
        with open(os.path.join(out_dir, REPORT), "w", encoding="utf-8") as fh:
            json.dump({k: (v if k != "views" else {vw: x["report"] for vw, x in v.items()}) for k, v in result.items()}, fh, indent=1)
        with open(os.path.join(out_dir, "patterns.md"), "w", encoding="utf-8") as fh:
            fh.write(summary(name, result))
    return result


def resummarize(name: str) -> str:
    """The summary written again from a run's files (the candidate records and ``patterns.report.json``), without
    mining: for a change in how the summary reads."""
    out_dir = os.path.join(RUNS, name)
    with open(os.path.join(out_dir, REPORT), encoding="utf-8") as fh:
        result = json.load(fh)
    views = {}
    for v, rep in result["views"].items():
        recs = []
        with open(os.path.join(out_dir, f"patterns.{v}.jsonl"), encoding="utf-8") as fh:
            for line in fh:                                    # only what the summary reads: the files are large
                c = json.loads(line)
                c["matches"] = c["matches"][:1]
                c["evidence"].pop("families", None)
                recs.append(c)
        views[v] = {"records": recs, "report": rep}
    result["views"] = views
    text = summary(name, result)
    with open(os.path.join(out_dir, "patterns.md"), "w", encoding="utf-8") as fh:
        fh.write(text)
    return text


# ------------------------------------------------------------------------------------------------- the summary

def pretty(atoms: list[str]) -> str:
    """A pattern for reading: ``Theme:$e1 ▸ Agent($e2,$x1)``; the band shown only when it is not "asserted"."""
    out = []
    for a in atoms:
        parts = a.split("|")
        scope, body, rest = parts[0], parts[1], parts[2:]
        tail = "".join(f" [{r}]" for r in rest if r != "asserted")
        out.append((scope.replace("Implication:", "rule ") + " ▸ " if scope else "") + body + tail)
    return " & ".join(out)


def stands_for(c: dict, k: int = 3) -> str:
    """What a candidate's variables stood for in its matches: the commonest classes of each. In the shape view a
    class variable and the thing it classifies read the same, so the thing is left out."""
    out, seen = [], set()
    fillers = c["evidence"]["fillers"]
    for v in sorted(fillers, key=lambda v: (v[1] != "c", v)):
        top = tuple(x for x in fillers[v]["top"] if x != "?")[:k]
        if top and top not in seen:
            out.append(f"{v} {' · '.join(top)}")
            if v[1] == "c":
                seen.add(top)
    return "; ".join(out)


def _held(c: dict) -> int:
    return sum(n for r, n in c["support"]["roles"].items() if r != c["provenance"]["params"]["support_role"])


def _row(c: dict, atoms: list[str] | None = None, note: str = "", legend: bool = True) -> str:
    text = (c["matches"][0]["text"] if c["matches"] else "").replace("|", "/")
    return (f"| {c['id']} | {c['support']['families']} | {_held(c)} | {c['support']['sentences']} | {c['pattern']['match_class']['patterns']} "
            f"| `{pretty(atoms or c['pattern']['atoms'])}` | {note}{stands_for(c) if legend else ''} | {text[:80]} |")


_HEAD = ["| id | families | held-out | sentences | patterns with these sentences | pattern | what the variables stood for | an example |",
         "|---|---|---|---|---|---|---|---|"]


def summary(name: str, result: dict) -> str:
    params, key = result["params"], result["key"]
    role = params["support_role"]
    cp = result["corpus"]
    lines = [f"# Connected patterns of run `{name}` — {time.strftime('%Y-%m-%d %H:%M')}", "",
             "§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized "
             "view keeps the class symbols, the shape view turns them into class variables. "
             "Every row is a CANDIDATE with its evidence, not a finding.", "",
             f"- key dials: `{json.dumps({k: v for k, v in key.items() if k != 'shape'})}`",
             f"- parameters: `{json.dumps(params)}`",
             f"- corpus: {cp['sentences']:,} sentences in {sum(cp['families'].values()):,} families ({cp['families']}); "
             f"support = families of the `{role}` share; the other shares are held out and reported beside it",
             f"- time (s): {result['seconds']}", ""]
    lines += ["## How many", "",
              "| view | atoms | atom sets found | distinct patterns | frequent = candidates | tree | join | inside one instance | with a restated copy | sets of matching sentences |",
              "|---|---|---|---|---|---|---|---|---|---|"]
    for view in P.VIEWS:
        recs, rep = result["views"][view]["records"], result["views"][view]["report"]
        for lv in rep["levels"]:
            rs = [c for c in recs if c["pattern"]["size"] == lv["size"]]
            tree = sum(1 for c in rs if c["pattern"]["labels"]["view"] == "tree")
            one = sum(1 for c in rs if c["evidence"]["instances"]["several"] == 0)
            rest = sum(1 for c in rs if c["evidence"]["restated"])
            lines.append(f"| {view} | {lv['size']} | {lv['embeddings']:,} | {lv['patterns']:,} | {lv['frequent']:,} | {tree:,} | {len(rs) - tree:,} | {one:,} | {rest:,} | |")
        capped = sorted({s for lv in rep["levels"] for s in lv["capped_sentences"]})
        classes = sum(1 for c in recs if c["pattern"]["match_class"]["is_largest"])
        lines.append(f"| {view} | all | | | **{len(recs):,}** | | | | | **{classes:,}** |" + (f" CAPPED sentences: {len(capped)}" if capped else ""))
    lines += ["",
              "- *tree*: a pattern a rooted-subtree miner could state. *join*: one thing is an argument of two events, or the "
              "arguments close a loop — what the binding-aware view adds.",
              "- *inside one instance*: every match lies within one template instance, so the pattern restates a template "
              "(§5.3's template-internal label).",
              f"- *with a restated copy*: some match holds atoms of a template whose rule restates other instances' atoms "
              f"({', '.join(params.get('restating_templates') or []) or 'none'}: the per-member rule beside the group's own event).",
              "- *sets of matching sentences*: many patterns match exactly the same sentences (a part of a larger pattern that "
              "never occurs without the rest). Each candidate names the largest pattern of its set; the tables below show "
              "that one, with the number of patterns sharing its sentences.",
              "- All of these are labels on the records. Nothing is dropped.", ""]
    lines += ["## Held-out recurrence, the generalizer and the two tests", ""]
    for view in P.VIEWS:
        recs = result["views"][view]["records"]
        if not recs:
            continue
        held = sum(1 for c in recs if _held(c))
        eq = sum(1 for c in recs if c["generalization"]["equals_pattern"])
        tight = sum(1 for c in recs if c["generalization"]["constants"] and not c["generalization"]["equals_pattern"])
        line = (f"- {view}: {held:,} of {len(recs):,} candidates ({held / len(recs):.0%}) also occur in a held-out family; "
                f"the generalization of a candidate's matches equals its pattern for {eq:,}")
        if view == "shape":
            line += f" and is tighter — a class every match shares — for {tight:,}"
        if recs[0]["tests"]:
            rn = sum(1 for c in recs if c["tests"]["renaming"]["pass"])
            bl = sum(1 for c in recs if c["tests"]["broken_link"]["pass"])
            line += f"; the renaming test is passed by {rn:,}, the broken-link test by {bl:,}"
        lines.append(line)
    if result.get("renamed_corpus"):
        lines.append("- the whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: " + "; ".join(
            f"{v}: {'the identical table' if r['identical'] else str(r['differing']) + ' rows differ'} ({r['patterns']:,} patterns)"
            for v, r in result["renamed_corpus"].items()))
    lines.append("")

    def top(title, note, recs, n, row=_row):
        if recs:
            lines.extend([f"### {title}", "", note, ""] + _HEAD + [row(c) for c in recs[:n]] + [""])

    for view in P.VIEWS:
        recs = result["views"][view]["records"]
        by = sorted((c for c in recs if c["pattern"]["match_class"]["is_largest"]), key=lambda c: (-c["support"]["families"], c["id"]))
        lab = lambda c: c["pattern"]["labels"]                                     # noqa: E731
        across = [c for c in by if c["evidence"]["instances"]["one"] == 0]
        plain = [c for c in across if lab(c)["view"] == "join" and not lab(c)["in_rule"] and not lab(c)["sealed"]]
        lines += [f"## The {view} view", "",
                  "One row per set of matching sentences (its largest pattern), by families of the mining share.", ""]
        top("Joins between events: 2–3 atoms", "One thing in two events, or a loop among the arguments; no rule, no sealed clause; "
            "the match spans several template instances.", [c for c in plain if c["pattern"]["size"] <= 3], 20)
        top("Joins between events: 4–5 atoms", "The same, larger.", [c for c in plain if c["pattern"]["size"] >= 4], 20)
        top("Across a sealed clause", "Something inside a reported or negated clause tied to something outside it.",
            [c for c in across if lab(c)["sealed"] and lab(c)["sealed"] < c["pattern"]["size"] and not lab(c)["in_rule"]], 12)
        top("With a sentence's own rule", "Atoms on a side of a rule (a generic, a frequency, an adjective's implication) with atoms "
            "outside it; no restated copy.",
            [c for c in across if lab(c)["in_rule"] and lab(c)["in_rule"] < c["pattern"]["size"] and not c["evidence"]["restated"]], 12)
        top("Restated copies", "What the label marks: a distribution's per-member rule beside the group's own event. "
            "These lead every unfiltered ranking.", [c for c in by if c["evidence"]["restated"]], 5)
        top("The most widespread overall", "Any structure, any label.", by, 10)
        if view == "shape":
            prod = sorted((c for c in recs if c["pattern"]["match_class"]["is_largest"]),
                          key=lambda c: (-c["evidence"]["lexicalizations"]["distinct"], c["id"]))
            top("The shapes with the most lexicalizations", "By the number of different class tuples that filled the shape.", prod, 12,
                lambda c: _row(c, note=f"**{c['evidence']['lexicalizations']['distinct']:,} lexicalizations** — "))
            top("Shapes whose matches all share a class", "The generalizer keeps the class every match has; the pattern shown is that "
                "generalization (the record's `generalization`).",
                [c for c in by if c["generalization"]["constants"]], 12,
                lambda c: _row(c, atoms=c["generalization"]["atoms"], note="keeps " + ", ".join(c["generalization"]["constants"]), legend=False))
    return "\n".join(lines) + "\n"
