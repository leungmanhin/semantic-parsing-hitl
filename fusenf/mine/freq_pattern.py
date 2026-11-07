"""§5.1 END TO END: mine the connected patterns of a run in both views, generalize each pattern's matches, run the
two tests, link the views, and write the candidate records with a summary to read.

    python -m fusenf.mine patterns --run NAME [--min-families 3] [--max-atoms 5] [--max-variables N]
                                   [--exclude-heads A,B] [--keep 12] [--tests full|sample|none] [--summary-only]

    → fusenf/runs/NAME/patterns.lexicalized.jsonl, patterns.shape.jsonl   (candidate records, method "freq-pattern":
      the §5.1 method, the concept paper's "frequent subtree mining" with its binding-aware view — the ids are
      freq-pattern-L… and freq-pattern-S… for the two views)
      fusenf/runs/NAME/patterns.report.json, patterns.md                    (the run's counts; the summary)

A candidate record carries: the pattern (atoms, typed variables, size, structure labels, cost fields, its shape or
the lexicalized patterns it covers, the largest of the candidates with identical matches), the support (families,
sentences and atom sets of the mining share, the families of every share, the held-out counts beside them), the
evidence over every matching sentence OF THE MINING SHARE (how many template instances a match spans, the
templates, whether atoms of a derived rule are among them, each atom's truth values, each event's tense, the
classes and names of what each variable stood for), the GENERALIZATION of its mining matches with a check against
its held-out matches, a sample of mining matches with their bindings and text, and the two tests.

THE HELD-OUT SHARES decide nothing and describe nothing on a record. They are counted (``support.held_out``) and
they check the generalization (``generalization.held_out``: does a class that every mining match shares also hold
in every held-out match?).

Nothing is filtered: patterns inside one template instance, candidates that use a derived rule (the distribution
template's rule), tree-shaped patterns and candidates whose matches are identical to another's are labelled, not
dropped. The summary leads with the candidates that use no derived rule and lists the others in a table of their
own.
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
    __slots__ = ("size", "families", "datasets", "sentences", "embeddings", "held_sentences", "held_embeddings", "instances",
                 "templates", "truth", "tenses", "atom_tenses", "fillers", "names", "lexical", "sample", "gen", "gen_all", "first",
                 "signature", "derived")

    def __init__(self, size: int):
        self.size = size
        self.families: dict[str, set] = collections.defaultdict(set)      # share → families
        self.datasets: dict[str, set] = collections.defaultdict(set)      # dataset → families of the mining share
        self.sentences = self.embeddings = 0                               # of the mining share
        self.held_sentences = self.held_embeddings = 0                     # of the other shares
        self.instances = collections.Counter()                             # how many template instances a match spans
        self.templates = collections.Counter()
        self.truth = [collections.Counter() for _ in range(size)]          # per atom: (strength, confidence)
        self.tenses: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.atom_tenses: dict[int, collections.Counter] = collections.defaultdict(collections.Counter)
        self.fillers: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.names: dict[str, collections.Counter] = collections.defaultdict(collections.Counter)
        self.lexical = collections.Counter()                               # shape view: the class symbols, as one tuple
        self.sample: list = []                                             # a heap of (-rank, n, match)
        self.gen = G.Generalizer()                                         # over the mining matches
        self.gen_all = G.Generalizer()                                     # over every match: the held-out check
        self.first = None
        self.signature = 0                                                 # of the set of matching mining sentences
        self.derived = 0                                                   # mining matches that hold a derived rule's atoms


def _rank(family: str) -> int:
    return int(hashlib.md5(family.encode("utf-8")).hexdigest()[:12], 16)


class Collector:
    """The miner's sink: per frequent pattern, the support by share and — over the matching sentences of the MINING
    share (the first embedding of each) — the evidence, the generalization and a sample of matches to read: the
    ``keep`` families with the smallest hash, so the sample does not depend on the order of the corpus. A held-out
    sentence is counted and added to a second generalization, which shows whether the first one holds there."""

    def __init__(self, corpus: P.Corpus, view: str, params: dict, keep: int = 12):
        self.corpus, self.view, self.params, self.keep = corpus, view, params, keep
        self.role = params["support_role"]
        self.stats: dict[str, _Stat] = {}
        self.shape_sents = corpus.sentences["shape"]
        self.sentence_hash = [_rank(g["id"]) for g in corpus.graphs]
        self.derived = set(params.get("derived_rule_templates") or ())

    def match(self, pattern: str, size: int, s: P.Sentence, ordered: tuple, n_emb: int):
        st = self.stats.get(pattern)
        if st is None:
            st = self.stats[pattern] = _Stat(size)
        st.families[s.role or "?"].add(s.family)
        src = [s.src[i] for i in ordered]
        sh = self.shape_sents[s.n]                                    # the generalizer reads the shape lift of the same atoms
        frag = G.fragment(sh, [sh.local[g] for g in src])
        st.gen_all.add(frag)
        if s.role != self.role:                                       # held out: counted, and a check of the generalization
            st.held_sentences += 1
            st.held_embeddings += n_emb
            return
        st.gen.add(frag)
        st.datasets[s.dataset or "?"].add(s.family)
        st.sentences += 1
        st.embeddings += n_emb
        st.signature = (st.signature + self.sentence_hash[s.n]) & 0xFFFFFFFFFFFFFFFF   # a sum: the order does not matter
        graph = self.corpus.graphs[s.n]
        atoms = [graph["atoms"][g] for g in src]
        st.instances[len({a.get("inst") for a in atoms})] += 1
        templates = {a.get("template") or "?" for a in atoms}
        st.templates[" + ".join(sorted(templates))] += 1
        st.derived += bool(templates & self.derived)
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
        role = self.role
        out = []
        ranked = sorted(self.stats.items(), key=lambda kv: (kv[1].size, -len(kv[1].families.get(role, ())), kv[0]))
        for number, (pattern, st) in enumerate(ranked, 1):
            atoms = P.atoms_of(pattern)
            c = CD.new("freq-pattern", number, atoms, self.view, {**self.corpus.key, "shape": self.view}, run, dict(self.params),
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
                            "roles": {r: len(f) for r, f in sorted(st.families.items())},
                            "held_out": {"families": sum(len(f) for r, f in st.families.items() if r != role),
                                         "sentences": st.held_sentences, "embeddings": st.held_embeddings}}
            total = sum(st.instances.values())
            ev = c["evidence"]
            ev["instances"] = {"one": st.instances.get(1, 0), "several": total - st.instances.get(1, 0)}
            ev["templates"] = dict(st.templates.most_common(6))
            ev["derived_rule"] = st.derived                                 # matches with atoms of a derived rule
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
            gen, wide = st.gen.result(), st.gen_all.result()
            held = wide["fragments"] - gen["fragments"]
            c["generalization"] = {"atoms": gen["atoms"], "fragments": gen["fragments"], "constants": gen["constants"],
                                   "variables": gen["variables"], "equals_pattern": gen["pattern"] == pattern,
                                   "held_out": {"fragments": held,           # the held-out matches, and whether it covers them all
                                                "holds": (wide["pattern"] == gen["pattern"]) if held else None,
                                                "lost_constants": sorted(set(gen["constants"]) - set(wide["constants"]))}}
            c["matches"] = [m for _, _, m in sorted(st.sample, key=lambda x: (-x[0], x[1]))]
            c["_first"] = st.first
            c["_class"] = (st.sentences, st.signature, bool(st.derived))
            out.append(c)
        classes: dict[tuple, list] = collections.defaultdict(list)          # the candidates matching exactly the same mining
        for c in out:                                                       # sentences, apart for those that use a derived rule
            classes[c.pop("_class")].append(c)
        for members in classes.values():
            largest = min(members, key=lambda c: (-c["pattern"]["size"], len(c["pattern"]["variables"]), c["id"]))
            for c in members:
                c["pattern"]["match_class"] = {"largest": largest["id"], "candidates": len(members), "is_largest": c is largest}
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
    return {P.SEP.join(c["pattern"]["atoms"]): (c["support"]["roles"], c["support"]["sentences"], c["support"]["embeddings"],
                                                 c["support"]["held_out"]["sentences"], c["support"]["held_out"]["embeddings"])
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
    return c["support"]["held_out"]["families"]


def _derived(c: dict) -> bool:
    return bool(c["evidence"]["derived_rule"])


def _row(c: dict, atoms: list[str] | None = None, note: str = "", legend: bool = True) -> str:
    text = (c["matches"][0]["text"] if c["matches"] else "").replace("|", "/")
    return (f"| {c['id']} | {c['support']['families']} | {_held(c)} | {c['support']['sentences']} | {c['pattern']['match_class']['candidates']} "
            f"| `{pretty(atoms or c['pattern']['atoms'])}` | {note}{stands_for(c) if legend else ''} | {text[:80]} |")


_HEAD = ["| id | mining families | held-out families | mining sentences | candidates merged into this row | pattern | what the variables stood for | an example |",
         "|---|---|---|---|---|---|---|---|"]

_DISTRIBUTION_EXAMPLE = [
    "The distribution rule, on \"Three women are sitting in a village\":", "",
    "```",
    "(: l1_location (Location sk_sit_1 sk_village_1) (STV 1.0 0.99))       ; said of the group's sitting",
    "(: r1_implication",
    "   (Implication (PartOf $x sk_group_1)                               ; the distribution rule: for each member $x …",
    "                (And (Member (sk_sit $x) sit) (Agent (sk_sit $x) $x) (Ongoing (sk_sit $x))",
    "                     (Location (sk_sit $x) sk_village_1)))            ; … the same again",
    "   (STV 1.0 0.9))",
    "```", "",
    "A pattern such as `rule consequent:$r1 ▸ Location($e1,$x1) & Location($e2,$x1)` uses it: `$e1` is a member's sitting "
    "inside the rule, `$e2` the group's sitting outside it, and both are in the same place — two events joined by a place "
    "only because the second statement repeats the first.", ""]


def _buckets(m: int) -> list[tuple]:
    """Ranges of mining support to read the held-out recurrence by: the threshold, the next two, a middle, the rest."""
    top = max(3 * m, m + 3)
    return [(f"exactly {m}", m, m), (f"{m + 1}", m + 1, m + 1), (f"{m + 2}", m + 2, m + 2), (f"{m + 3} to {top}", m + 3, top),
            (f"{top + 1} or more", top + 1, None)]


def _recurrence(recs: list[dict], m: int) -> str:
    parts = []
    for label, lo, hi in _buckets(m):
        rs = [c for c in recs if c["support"]["families"] >= lo and (hi is None or c["support"]["families"] <= hi)]
        if rs:
            parts.append(f"{label}: {sum(1 for c in rs if _held(c)) / len(rs):.0%} of {len(rs):,}")
    return " · ".join(parts)


def _kept(c: dict) -> str:
    """The class a shape's mining matches all share, and whether its held-out matches share it too."""
    g = c["generalization"]
    h = g["held_out"]
    note = "keeps " + ", ".join(g["constants"])
    if not h["fragments"]:
        return note + " — no held-out match"
    if h["holds"]:
        return note + f" — holds in all {h['fragments']} held-out matches"
    return note + f" — fails held-out: {', '.join(h['lost_constants'])} not in every one of {h['fragments']} matches"


def summary(name: str, result: dict) -> str:
    params, key = result["params"], result["key"]
    role, m = params["support_role"], params["min_families"]
    cp = result["corpus"]
    n_role = cp["families"].get(role, 0)
    n_held = sum(n for r, n in cp["families"].items() if r != role)
    derived = list(params.get("derived_rule_templates") or [])
    rule = (" / ".join(derived) + " rule") if derived else "derived rule"          # "distribution rule"
    uses, without = f"using a {rule}", f"without a {rule}"
    lines = [f"# Connected patterns of run `{name}` — {time.strftime('%Y-%m-%d %H:%M')}", "",
             "§5.1: connected patterns of atoms that share typed variables, counted by family, in two views — the lexicalized "
             "view keeps the class symbols, the shape view turns them into class variables. "
             "Every row is a CANDIDATE with its evidence, not a finding.", "",
             f"- key dials: `{json.dumps({k: v for k, v in key.items() if k != 'shape'})}`",
             f"- parameters: `{json.dumps(params)}`",
             f"- corpus: {cp['sentences']:,} sentences in {sum(cp['families'].values()):,} families ({cp['families']}). The {n_role:,} "
             f"families of the `{role}` share decide which patterns are candidates and supply their evidence. The other {n_held:,} are "
             f"held out: they are counted beside it and they check the generalization, nothing else.",
             f"- time (s): {result['seconds']}", ""]
    lines += ["## How many", "",
              f"| view | connected atoms | atom sets found | distinct patterns | candidates | {uses} | **{without}** | tree | join "
              f"| inside one template instance | after merging candidates with identical matches |",
              "|---|---|---|---|---|---|---|---|---|---|---|"]
    capped_all = {}
    for view in P.VIEWS:
        recs, rep = result["views"][view]["records"], result["views"][view]["report"]

        def cells(rs):
            lean = [c for c in rs if not _derived(c)]
            tree = sum(1 for c in lean if c["pattern"]["labels"]["view"] == "tree")
            one = sum(1 for c in lean if c["evidence"]["instances"]["several"] == 0)
            return lean, f"{len(rs) - len(lean):,} | **{len(lean):,}** | {tree:,} | {len(lean) - tree:,} | {one:,}"

        for lv in rep["levels"]:
            rs = [c for c in recs if c["pattern"]["size"] == lv["size"]]
            lines.append(f"| {view} | {lv['size']} | {lv['embeddings']:,} | {lv['patterns']:,} | {len(rs):,} | {cells(rs)[1]} | |")
        lean, text = cells(recs)
        merged = sum(1 for c in lean if c["pattern"]["match_class"]["is_largest"])
        lines.append(f"| {view} | all | {sum(lv['embeddings'] for lv in rep['levels']):,} | {sum(lv['patterns'] for lv in rep['levels']):,} "
                     f"| **{len(recs):,}** | {text} | **{merged:,}** |")
        capped_all[view] = sorted({s for lv in rep["levels"] for s in lv["capped_sentences"]})
    lines += ["", "What each column counts:", "",
              "- *view*: `lexicalized` patterns keep the class symbols (`dog`, `run`); `shape` patterns turn each class symbol into a "
              "class variable (`$c1`), so one shape covers many lexicalized patterns.",
              "- *connected atoms*: the size of a pattern — the number of atoms in it, each tied to another by a shared variable (the "
              "same event, thing, time or rule). A row counts the patterns of exactly that size; the `all` row adds the rows up.",
              "- *atom sets found*: the number of occurrences the miner looked at — every connected set of that many atoms inside "
              "one sentence, counted once each, over the sentences of every share; a pattern found in 500 sentences contributes 500 "
              "here and 1 to the next column. A set is only looked at when its smaller parts are already frequent (a pattern cannot "
              "be frequent unless its parts are).",
              "- *distinct patterns*: the different patterns among those atom sets. Two atom sets are the same pattern when they "
              "differ only in which events and things they name.",
              f"- *candidates*: the distinct patterns found in at least {m} families of the `{role}` share (it has {n_role:,}). Each "
              f"is one record in `patterns.<view>.jsonl`."]
    if derived:
        lines += [f"- *{uses}*: the candidates in which at least one atom comes from the rule that the `{'` / `'.join(derived)}` "
                  f"template adds for a group. That rule says of each member what the sentence's other statements already say of the "
                  f"group (the example below), so such a candidate shows how we write a plural down, not something the text adds. "
                  f"These are labelled, never dropped, and each view lists them in a table of their own.",
                  f"- *{without}*: the other candidates. Read these first: the four columns to its right are about these candidates, "
                  f"and so is every table of a view but its last."]
    lines += ["- *tree*: a pattern in which every atom hangs from one event or thing, each thing sits under one event only, and the "
              "arguments close no loop — what a rooted-subtree miner could state. Example: `Agent($e1,$x1) & Patient($e1,$x2)`.",
              "- *join*: every other pattern. Something is an argument of two different events "
              "(`Agent($e1,$x1) & Experiencer($e2,$x1)`), or the arguments close a loop "
              "(`Agent($e1,$x1) & Coref($x2,$x1) & Patient($e1,$x3) & Possession($x3,$x2)`, as in \"a woman is arranging her hair\"). "
              "This is what the binding-aware view adds to the tree view.",
              "- *inside one template instance*: in every match, all the atoms were emitted by a single template instance of the parse "
              "(one `activity` instance emits an event's class, its agent and its patient). Such a pattern repeats a template's own "
              "output and recurs because the template does (§5.3's template-internal label).",
              f"- *after merging candidates with identical matches*: candidates that match exactly the same sentences of the `{role}` "
              f"share cannot be told apart by where they occur — typically a part of a larger pattern that never occurs without the "
              f"rest. Merged, each such group counts once. The tables below show one row per group, its largest pattern, with the "
              f"number of candidates merged into it.",
              "- Every one of these is a label on the records. Nothing is dropped.", ""]
    for view, capped in capped_all.items():
        if capped:
            lines += [f"CAPPED ({view}): {len(capped)} sentences reached the limit of {params['max_embeddings']:,} atom sets at one size; "
                      f"their counts are a lower bound.", ""]
    if derived == ["distribution"]:
        lines += _DISTRIBUTION_EXAMPLE

    lines += ["## Held-out recurrence, the generalizer and the two tests", "",
              f"A candidate *recurs* when it also matches a sentence of a held-out family. One family is enough, so the share is to be "
              f"read with the support beside it. The *generalizer* computes the tightest pattern that a candidate's `{role}` matches "
              f"share; the held-out matches then check it.", ""]
    for view in P.VIEWS:
        recs = result["views"][view]["records"]
        if not recs:
            continue
        lean = [c for c in recs if not _derived(c)]
        lines += [f"**{view}**", ""]
        held_all = sum(1 for c in recs if _held(c))
        if lean:
            held = sum(1 for c in lean if _held(c))
            lines.append(f"- recurrence: {held:,} of the {len(lean):,} candidates {without} ({held / len(lean):.0%}) also occur in a "
                         f"held-out family; of all {len(recs):,} candidates, {held_all:,} ({held_all / len(recs):.0%})")
            lines.append(f"- recurrence by mining families, candidates {without}: {_recurrence(lean, m)}")
            eq = sum(1 for c in lean if c["generalization"]["equals_pattern"])
            tight = [c for c in lean if c["generalization"]["constants"] and not c["generalization"]["equals_pattern"]]
            line = f"- generalizer: the generalization of a candidate's `{role}` matches equals its pattern for {eq:,} of the {len(lean):,}"
            if tight:
                checked = [c for c in tight if c["generalization"]["held_out"]["fragments"]]
                holds = sum(1 for c in checked if c["generalization"]["held_out"]["holds"])
                line += f" and is tighter — a class every `{role}` match shares — for {len(tight):,}"
                if checked:
                    line += (f"; {len(checked):,} of those have held-out matches, and the class holds in every one of them for "
                             f"{holds:,} ({holds / len(checked):.0%})")
            lines.append(line)
        if recs[0]["tests"]:
            rn = sum(1 for c in recs if c["tests"]["renaming"]["pass"])
            bl = sum(1 for c in recs if c["tests"]["broken_link"]["pass"])
            lines.append(f"- the two tests, all {len(recs):,} candidates: the renaming test is passed by {rn:,}, the broken-link test by {bl:,}")
        lines.append("")
    if result.get("renamed_corpus"):
        lines += ["The whole corpus with every individual renamed and every sentence's atoms shuffled, mined again: " + "; ".join(
            f"{v}: {'the identical table' if r['identical'] else str(r['differing']) + ' rows differ'} ({r['patterns']:,} patterns)"
            for v, r in result["renamed_corpus"].items()), ""]

    lines += ["## Reading the tables", "",
              "Each row is one group of candidates with identical matches, shown as its largest pattern.", "",
              f"- *mining families*: the support — the families of the `{role}` share in which the pattern occurs. *mining sentences*: "
              f"the sentences of that share in which it occurs.",
              "- *held-out families*: the families of the other shares in which it occurs.",
              "- *candidates merged into this row*: how many candidates match exactly these mining sentences (1 = only this one).",
              "- *pattern*: `$e` is an event, `$x` a thing, `$t` a time, `$c` a class (shape view), `$r` a rule of the sentence; the "
              "same variable twice is the same event or thing, two variables are two. `Theme:$e1 ▸ …` marks an atom inside the clause "
              "that is the theme of `$e1` (a reported clause), `Not ▸ …` one under a negation, `rule premise:$r1 ▸ …` and "
              "`rule consequent:$r1 ▸ …` the two sides of a rule. `§1` stands for a clause in that argument place. `[graded]` and "
              "`[denied]` give the band of the statement's strength (no tag: asserted).",
              f"- *what the variables stood for*: the commonest classes of each variable's fillers in the `{role}` matches; fillers "
              f"with no class of their own (names, pronouns) are left out here and listed on the record.",
              f"- *an example*: one of the sample matches kept on the record (a `{role}` sentence chosen by a hash, not the most typical).",
              ""]

    def top(title, note, recs, n, row=_row):
        if recs:
            lines.extend([f"### {title}", "", note, ""] + _HEAD + [row(c) for c in recs[:n]] + [""])

    for view in P.VIEWS:
        recs = result["views"][view]["records"]
        groups = sorted((c for c in recs if c["pattern"]["match_class"]["is_largest"]), key=lambda c: (-c["support"]["families"], c["id"]))
        by = [c for c in groups if not _derived(c)]
        lab = lambda c: c["pattern"]["labels"]                                     # noqa: E731
        across = [c for c in by if c["evidence"]["instances"]["one"] == 0]
        plain = [c for c in across if lab(c)["view"] == "join" and not lab(c)["in_rule"] and not lab(c)["sealed"]]
        lines += [f"## The {view} view", "",
                  f"One row per group, by mining families. Every table but the last holds only candidates {without}.", ""]
        top("Joins between events: 2–3 atoms",
            "What the binding-aware view adds that a rooted-subtree miner could not state: one thing in two events, or a loop "
            "among the arguments — kept clean: no rule, no sealed clause, and the match spans several template instances, so "
            "the pattern is not one template's own output.", [c for c in plain if c["pattern"]["size"] <= 3], 20)
        top("Joins between events: 4–5 atoms", "The same question, the longer joins.", [c for c in plain if c["pattern"]["size"] >= 4], 20)
        top("Across a sealed clause",
            "The scope question: something inside a reported or negated clause tied to something outside it. A tree miner "
            "cannot state this either, and a scope error in the parses or the emitter would show here first.",
            [c for c in across if lab(c)["sealed"] and lab(c)["sealed"] < c["pattern"]["size"] and not lab(c)["in_rule"]], 12)
        top("With a rule of the sentence",
            "How the sentence's own rules relate to the atoms around them: atoms on a side of a rule — a generic statement "
            "(\"There is no …\"), a frequency, or the default by which an adjective's narrowed class implies the plain adjective — "
            "together with atoms outside the rule. A rule mis-scoped by the lifter or the emitter would show here.",
            [c for c in across if lab(c)["in_rule"] and lab(c)["in_rule"] < c["pattern"]["size"]], 12)
        top("The most widespread overall",
            "The plain top by support, any structure, any label: what dominates the corpus — mostly a template's own output, "
            "which is why the tables above exclude it.", by, 10)
        if view == "shape":
            prod = sorted(by, key=lambda c: (-c["evidence"]["lexicalizations"]["distinct"], c["id"]))
            top("The shapes with the most lexicalizations",
                "The two levels (decision 4): the shapes that abstract over the most lexical variety, by the number of different "
                "class tuples that filled them. A shape filled by hundreds of tuples is a structural regularity of the corpus, not "
                "of a few words.", prod, 12,
                lambda c: _row(c, note=f"**{c['evidence']['lexicalizations']['distinct']:,} lexicalizations** — "))
            top("Shapes whose matches all share a class",
                f"The generalizer's own contribution: where it says more than the pattern — a class that every `{role}` match has. "
                "The pattern shown is that generalization (the record's `generalization`), with the outcome of the held-out check.",
                [c for c in by if c["generalization"]["constants"]], 12,
                lambda c: _row(c, atoms=c["generalization"]["atoms"], note=_kept(c), legend=False))
        top(f"Candidates {uses}",
            f"The artifact set, last: the candidates the *{uses}* label took out of the tables above. Unfiltered, these would "
            "lead every ranking.", [c for c in groups if _derived(c)], 5)
    return "\n".join(lines) + "\n"
