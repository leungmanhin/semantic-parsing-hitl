"""THE QUESTION FORM: a parsed question → a QUERY (decided with the owner 2026-11-08: LITERAL parsing).

A question is parsed with the templates of the statement it asks about: the word it asks with is an ASKED referent
(the ``wh`` template) in the slot it asks about, and one instance of the ``question`` family marks the TEXT as a
question (``catalog/question.yaml``, ``catalog/wh.yaml``). This module turns the question's records into the pattern
the reasoner is asked to prove, with the asked things as variables. It guesses nothing about how a text might phrase
the answer: the gap between the question's wording and the text's is closed by background rules, never here.

FROM RECORDS TO A QUERY. The question's instances are emitted as a statement's would be (``tmpl.emit``); after a
context (the sentence-by-sentence mode) as the last sentence of the block's prefix, so the context's referents keep
their symbols. Then:

* RESOLUTION — a coref of the question links one of its mentions to an antecedent: the mention IS that referent. Its
  symbol is replaced by the antecedent's (a context referent's, or the question's own first mention's), and the
  mention's own atoms (its Name, its class) and the coref atom are dropped: the link did the identifying. A mention
  with two candidate antecedents gives one reading per candidate, the coref's strength its certainty.
* VARIABLES — every symbol the question mints that resolution left becomes a variable: an asked word is an ANSWER
  variable named by its word ($who, $which, $how …); an event, an indefinite, a name or a definite with no
  antecedent is bound by its own atoms ((Name $lamine_1 "Lamine"), (Member $quilt_1 quilt)). A constant (a named
  time: yesterday) stays.
* READINGS — a choice question has one reading per option: the option's atoms and the other atoms connected to them
  through a variable. A lexicon test on an asked word (is the asked relation symmetric?) cannot be decided without
  the word: the question is emitted with the test failing and with it passing, one reading each; identical readings
  merge.
* DEFINITIONS — the rule that defines a comparison class the pattern names (an Implication into (Member $y (Narrow
  …))) is no conjunct: the reading carries it, to stand beside the knowledge base when the query is asked.

A reading's PATTERN is its conjuncts — one atom, or (And …) in record order — with the question's own tense, scope
operators and modality as written ((Past $feed_1), (Not (And …))). ``tmpl.lower.query`` writes it for a consumer;
``tmpl.answers`` reads an engine's proofs back into answers.

    ask(own, catalog, earlier=None, reference_time=None) -> {"form", "question", "asked", "readings", "findings"}
    question_of(instances, catalog)  -> the question instance, or None
"""
from __future__ import annotations

import itertools

from . import catalog as CAT
from . import emit as E
from .lower import render

MAX_READINGS = 16


class QueryError(Exception):
    pass


def question_of(instances: list, catalog: dict) -> dict | None:
    """The instance of the ``question`` family, when the instances are a question's."""
    return next((r for r in instances or [] if isinstance(r, dict)
                 and (catalog.get(r.get("t")) or {}).get("family") == "question"), None)


def _coref_slots(catalog: dict) -> dict:
    """Template id → (mention slot, antecedent slot) for the templates that state a coreference: ``(Coref {m} {a})``."""
    out = {}
    for tid, t in catalog.items():
        for e in t.get("emits") or []:
            atom = str(e.get("atom") or "")
            if atom.startswith("(Coref "):
                names = [m.group(1) for m in CAT._PLACEHOLDER.finditer(atom)]
                if len(names) == 2:
                    out[tid] = (names[0], names[1])
    return out


def _leaves(term):
    if isinstance(term, list):
        for x in term:
            yield from _leaves(x)
    else:
        yield term


def _subst(term, mapping: dict):
    if isinstance(term, list):
        return [_subst(x, mapping) for x in term]
    if isinstance(term, str) and not isinstance(term, E.Str) and term in mapping:
        return mapping[term]
    return term


def _is_definition(term) -> bool:
    """The rule defining a comparison class: (Implication <body> (Member $y (Narrow …)))."""
    return (isinstance(term, list) and len(term) == 3 and term[0] == "Implication"
            and isinstance(term[2], list) and len(term[2]) == 3 and term[2][0] == "Member"
            and isinstance(term[2][2], list) and term[2][2][:1] == ["Narrow"])


def _variables(term) -> set:
    return {x for x in _leaves(term) if isinstance(x, str) and not isinstance(x, E.Str) and x.startswith("$")}


def ask(own: list, catalog: dict | None = None, earlier: list | None = None, reference_time=None) -> dict:
    """A question's instances (``own``; qualified ids in a block) read after the ``earlier`` instances of its text
    (qualified, or none) → ``{"form", "question", "asked", "readings", "findings"}``. Each reading is ``{"option",
    "lexicon", "resolution", "certainty", "conjuncts", "definitions", "pattern"}``; ``asked`` lists the answer
    variables. Raises QueryError when there is no question instance and EmitError when the instances are malformed."""
    catalog = catalog or CAT.load()
    earlier = [dict(r) for r in earlier or [] if isinstance(r, dict)]
    own = [dict(r) for r in own or [] if isinstance(r, dict)]
    q = question_of(own, catalog)
    if q is None:
        raise QueryError("no question instance: the instances state, they do not ask")
    own_ids = {r["id"] for r in own if "id" in r}
    item = {"id": "question", "instances": earlier + own}
    if reference_time is not None:
        item["reference_time"] = reference_time
    result, em = E.run_emitter(item, catalog)
    emissions = [(None, result, em)]
    if em.asks_lexicon():                                  # a lexicon test reads an asked word: both outcomes
        r2, em2 = E.run_emitter(item, catalog, unknown_lexicon=True)
        emissions = [(False, result, em), (True, r2, em2)]

    findings: list[dict] = []
    options = [x[1:] for x in (q.get("options") or []) if E.is_ref(x)]
    if q.get("options") is not None and len(options) < 2:
        findings.append({"kind": "question", "detail": "a choice question lists two or more options"})
    for o in options:
        if o not in own_ids:
            findings.append({"kind": "question", "detail": f"option @{o} is not an instance of the question"})
    options = [o for o in options if o in own_ids]

    asked, taken = [], set()
    for r in own:
        if em.is_asked(r["id"]):
            base = "$" + E.slug(str(r.get("word") or "wh"))
            var, n = base, 1
            while var in taken:
                n += 1
                var = f"{base}_{n}"
            taken.add(var)
            asked.append({"inst": r["id"], "word": r.get("word"), "class": r.get("class"), "var": var})
    form = "choice" if options else "wh" if asked else "yes-no"

    coref_slots = _coref_slots(catalog)
    links: dict[str, list] = {}                            # mention -> [(antecedent, coref instance)]
    coref_insts = set()
    for r in own:
        slots = coref_slots.get(r.get("t"))
        if not slots:
            continue
        m, a = r.get(slots[0]), r.get(slots[1])
        if E.is_ref(m) and E.is_ref(a) and m[1:] in own_ids:
            coref_insts.add(r["id"])
            links.setdefault(m[1:], []).append((a[1:], r["id"]))

    readings: list[dict] = []
    seen = set()
    for flag, res, emr in emissions:
        records = [rec for rec in res["records"] if rec["inst"] in own_ids]
        strength = {rec["inst"]: rec["truth"][0] for rec in records if rec["inst"] in coref_insts}
        choices = []
        for m, cands in links.items():
            cands = sorted(cands, key=lambda c: -strength.get(c[1], 0.0))
            choices.append([(m, a, strength.get(c, 0.0)) for a, c in cands])
        for pick in itertools.islice(itertools.product(*choices), MAX_READINGS):
            reading = _reading(emr, records, own, own_ids, asked, coref_insts, dict((m, a) for m, a, _s in pick), options)
            certainty = 1.0
            for _m, _a, s in pick:
                certainty *= s
            for rd in reading:
                key = (render(rd["pattern"]), tuple(render(d["term"]) for d in rd["definitions"]), rd["option"])
                if key in seen:
                    continue
                seen.add(key)
                rd["lexicon"] = flag
                rd["resolution"] = [{"mention": m, "antecedent": a, "certainty": s} for m, a, s in pick]
                rd["certainty"] = round(certainty, 6)
                readings.append(rd)
    for a in asked:
        if not any(a["var"] in _variables(rd["pattern"]) for rd in readings):
            findings.append({"kind": "question", "detail": f"the asked word {a['inst']} ({a['word']}) is in no reading's pattern"})
    return {"form": form, "question": q.get("id"), "asked": asked, "readings": readings, "findings": findings}


def _reading(em, records: list, own: list, own_ids: set, asked: list, coref_insts: set, resolved: dict,
             options: list) -> list[dict]:
    """The readings of one emission under one resolution: one, or one per option of a choice question."""
    sym = em.sym
    mapping: dict = {}
    for m, a in resolved.items():                          # a mention's symbol -> its antecedent's, chains followed
        target, hops = a, 0
        while target in resolved and hops < len(resolved):
            target, hops = resolved[target], hops + 1
        if m in sym and target in sym:
            mapping[sym[m]] = sym[target]
    dropped = set(coref_insts) | set(resolved)
    kept = [rec for rec in records if rec["inst"] not in dropped]

    names = {a["inst"]: a["var"] for a in asked}
    taken = set(names.values())
    variables: dict = {}
    for r in own:
        iid = r["id"]
        s = sym.get(iid)
        if not isinstance(s, str) or s.startswith("$") or iid in resolved:
            continue
        if ((em.cat.get(r["t"]) or {}).get("mints") or {}).get("constant"):
            continue                                       # a named time: the same word, the same symbol
        if iid in names:
            variables[s] = names[iid]
            continue
        base = "$" + (s[3:] if s.startswith("sk_") else s)
        var, n = base, 1
        while var in taken:
            n += 1
            var = f"{base}_{n}"
        taken.add(var)
        variables[s] = var
    full = {k: variables.get(v, v) for k, v in mapping.items()}
    full.update({k: v for k, v in variables.items() if k not in full})

    conj, defs = [], []
    owner_of = []
    for rec in kept:
        term = _subst(rec["term"], full)
        if _is_definition(term):
            defs.append({"name": rec["name"], "term": term, "truth": rec["truth"]})
            continue
        if any(render(term) == render(c) for c in conj):
            continue
        conj.append(term)
        owner_of.append(rec["inst"])

    def pattern(cs):
        return cs[0] if len(cs) == 1 else ["And", *cs]

    if not options:
        return [{"option": None, "conjuncts": conj, "definitions": defs, "pattern": pattern(conj) if conj else ["And"]}]

    def option_of(iid):                                    # the option an instance belongs to: up its heads and scopes
        seen = set()
        while iid is not None and iid not in seen:
            seen.add(iid)
            if iid in options:
                return iid
            iid = em.head_of.get(iid) or em.scope_of.get(iid) or em.home.get(iid)
        return None

    out = []
    for o in options:
        core = [c for c, i in zip(conj, owner_of) if option_of(i) == o]
        shared = [c for c, i in zip(conj, owner_of) if option_of(i) is None]
        have = set().union(*[_variables(c) for c in core]) if core else set()
        picked, changed = [], True
        while changed:
            changed = False
            for c in shared:
                if c not in picked and _variables(c) & have:
                    picked.append(c)
                    have |= _variables(c)
                    changed = True
        cs = [c for c in conj if any(c is x for x in core + picked)]
        out.append({"option": o, "conjuncts": cs, "definitions": defs, "pattern": pattern(cs) if cs else ["And"]})
    return out
