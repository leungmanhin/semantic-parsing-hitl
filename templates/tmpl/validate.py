"""Post-parse validation: a parser reply -> emitted statements, declarations and findings.

One implementation for two callers: ``semantic-parse.py`` validates every reply it receives,
the suite scorer validates every stored record.  Report only: nothing here changes the reply.

Checks, in order:

* contract — the reply is a JSON object whose ``instances`` is a list of objects and whose
  ``unmapped`` / ``issues``, when present, are lists; a null slot value (the contract says omit,
  never null) is counted and stripped before emission;
* instances — the emitter's own checks: unknown template, missing or duplicate id, missing
  required slot, bad enum value, unknown slot, dangling reference, a filler pointing at an
  instance that mints no symbol, a scope cycle.  Any of these stops the record here
  (status ``malformed``);
* graph lints on well-formed instances: a witness no other instance mentions, or a name no
  instance mentions while nothing is reported unmapped (``dangling-referent``: a witness is
  introduced only by a covered clause, a name may stand alone beside an unmapped span; when the
  text is known and the instances' spans cover every word of it — a bare noun phrase as the text,
  "Yusra, a locksmith" — nothing was dropped and the lone referent is exempt), a
  predication with filler slots none of which is filled (``bare-predication``) unless it is the
  content, directly or through another scope, of a scope whose refs slot declares
  ``bare_content`` (an imperative's addressee is implicit), a refs slot marked ``participant: true`` is
  filled (a quality of an action: the clause is the participant), or an oblique with an object
  attaches to it (a prepositional passive with no by-phrase: the leak was dealt with), an optional
  scope with an empty ``refs`` list (``empty-scope``), a reference in a lemma slot that names no asked word of a
  question (``lemma-reference``: a lemma slot holds a word; the emitter renders the referent's symbol there, as it
  always has);
* statement lints on what was emitted: a variable in a statement that is no rule (``free-variable``: a
  referent tied to a rule's range from outside the rule; the statement is not a fact);
* span lints, when the caller supplies the TEXT: an instance without ``span`` (``span-missing``), a
  span that is not a string or a list of strings (``span-malformed``), a span that is not a verbatim
  substring of the text (``span-not-verbatim``); spans are provenance and never affect emission;
* verbatim lints, when the caller supplies the TEXT: a value of a slot the catalog marks ``verbatim`` (a tag after
  a name, kept as written) that is not a verbatim substring of the text (``value-not-verbatim``); report only;
* content lints, when the caller supplies the TEXT — SILENT DROPS, content the reply neither parsed nor reported: a
  content word of the text that no instance span and no unmapped span reaches and no instance holds as a slot value
  (``content-unaccounted``, advisory: ``ADVISORY_LINTS``), an unmapped span with the code G10 (a quotation's wording,
  its content parsed) whose content words no instance but a name and no other unmapped span reaches
  (``quotation-content-missing``); a content word is any word but the closed list ``FUNCTION_WORDS``, a number
  included; report only;
* C9 — every emitted statement types against the substrate with the emitter's declarations
  (needs the ``petta`` package, otherwise ``typecheck`` is ``skipped``).

``inspect`` does everything but C9 (no engine needed); ``typecheck_records`` runs C9 over many
records in one engine session; ``validate`` does both for one reply. A QUESTION (a reply with an instance of the
``question`` family) is checked the same way and flagged ``question``: its records are its literal content, which
``tmpl.query`` turns into a query — no fact of a knowledge base, so C9 does not type them.
"""
from __future__ import annotations

import collections
import contextlib
import io
import json
import os
import re
import tempfile

from . import catalog as CAT, emit as E, typecheck as T

HARD_TYPE_FINDINGS = ("type", "type-conflict", "parse-error")


def _is_list(x) -> bool:
    return isinstance(x, list)


def inspect(reply, catalog: dict | None = None, reference_time=None, text: str | None = None) -> dict:
    """Contract + emission + lints for one reply; never raises on a malformed reply."""
    if catalog is None:
        catalog = CAT.load()
    res = {"status": "ok", "findings": [], "instances": [], "unmapped": [], "issues": [], "fired": {},
           "null_slots": 0, "statements": None, "declarations": None, "detail": None,
           "records": None, "types": None, "functions": None, "typecheck": "not run", "question": False}
    if not isinstance(reply, dict):
        res["status"] = "not-an-object"
        res["findings"].append({"kind": "contract", "detail": "the reply is not a JSON object"})
        return res
    insts = reply.get("instances")
    if not _is_list(insts):
        res["status"] = "malformed"
        res["findings"].append({"kind": "contract", "detail": "`instances` is missing or not a list"})
        return res
    for key in ("unmapped", "issues"):
        v = reply.get(key)
        if v is None:
            continue
        if _is_list(v):
            res[key] = [x for x in v if isinstance(x, dict)]
            if len(res[key]) != len(v):
                res["findings"].append({"kind": "contract", "detail": f"`{key}` holds entries that are not objects"})
        else:
            res["findings"].append({"kind": "contract", "detail": f"`{key}` is not a list"})
    bad = [r for r in insts if not isinstance(r, dict)]
    if bad:
        res["findings"].append({"kind": "contract", "detail": f"{len(bad)} instance(s) are not objects"})
    cleaned = []
    for r in insts:
        if not isinstance(r, dict):
            continue
        c = {k: v for k, v in r.items() if v is not None}
        res["null_slots"] += len(r) - len(c)
        cleaned.append(c)
    res["instances"] = cleaned
    res["fired"] = dict(collections.Counter(str(r.get("t")) for r in cleaned))
    res["question"] = any((catalog.get(r.get("t")) or {}).get("family") == "question" for r in cleaned)
    try:
        out = E.emit({"id": reply.get("id") or "parse", "instances": cleaned, "unmapped": res["unmapped"],
                      "reference_time": reference_time}, catalog)
    except E.EmitError as exc:
        problems = exc.args[0] if exc.args and isinstance(exc.args[0], list) else [str(exc)]
        res["findings"].extend({"kind": "instance", "detail": p} for p in problems)
        res["status"] = "malformed"
        return res
    res["statements"], res["declarations"], res["detail"] = out["statements"], out["declarations"], out["detail"]
    res["records"], res["types"], res["functions"] = out["records"], out["types"], out["functions"]   # the same, as data
    res["findings"].extend(lints(cleaned, catalog, res["unmapped"], text))
    res["findings"].extend(statement_lints(res["statements"], res["detail"]))
    if text is not None:
        res["findings"].extend(span_lints(cleaned, text))
        res["findings"].extend(verbatim_lints(cleaned, catalog, text))
        res["findings"].extend(content_lints(cleaned, catalog, res["unmapped"], text))
    return res


def free_variables(term, bound: bool = False) -> set:
    """The variables of a term that no rule binds: a variable is bound when it sits inside an Implication (or
    an Equivalence), whose two sides share their variables."""
    if isinstance(term, str):
        return {term} if term.startswith("$") and not bound else set()
    if not isinstance(term, list) or not term:
        return set()
    inside = bound or term[0] in ("Implication", "Equivalence")
    out: set = set()
    for x in term:
        out |= free_variables(x, inside)
    return out


def statement_lints(statements: list | None, detail: list | None = None) -> list:
    """Lints on the EMITTED statements. ``free-variable``: a statement that is not a rule holds a variable — a
    referent tied to a rule's range from outside the rule ("no woman combing HER hair": the hair's part-of link
    names the range's variable). Such a statement is no fact: an engine reads it as a pattern that matches
    anything, or refuses it."""
    out = []
    for n, st in enumerate(statements or []):
        try:
            name, term = T.split_statement(st)
        except ValueError:
            continue
        free = sorted(free_variables(term))
        if free:
            inst = (detail[n] or {}).get("inst") if detail and n < len(detail) else None
            out.append({"kind": "free-variable", "instance": inst, "statement": name,
                        "detail": f"{', '.join(free)} outside every rule: {T.render(term)[:200]}"})
    return out


def _covers_text(insts: list, text: str) -> bool:
    """Every word of the text lies inside some instance's span: nothing was dropped."""
    words = re.findall(r"[A-Za-z0-9]+", CAT.norm_span(text))
    have: set[str] = set()
    for r in insts:
        sp = r.get("span")
        for p in (sp if isinstance(sp, list) else [sp]) if sp is not None else []:
            if isinstance(p, str):
                have.update(re.findall(r"[A-Za-z0-9]+", CAT.norm_span(p)))
    return bool(words) and all(w in have for w in words)


def _subject_left_out(r: dict, text: str | None) -> bool:
    """A verb clause that stands with no subject and no object (note style: "Waiting.", "Logging off."): its span
    is its verb's words alone and, when the text is at hand, opens a clause there. Such a clause has no participant
    to fill, so it is no bare predication."""
    sp = r.get("span")
    span = sp[0] if isinstance(sp, list) and sp else sp
    if not isinstance(span, str) or not span.strip() or not isinstance(r.get("verb"), str):
        return False
    words = re.findall(r"[A-Za-z']+", span)
    parts = [p for p in r["verb"].split("_") if p]
    if not words or not (len(words) == 1 or all(any(w.lower()[:3] == p[:3] for p in parts) for w in words)):
        return False
    if text is None:
        return True
    at = text.find(span)
    if at < 0:
        return False
    before = text[:at].rstrip()
    return before == "" or before[-1] in ".;:,!?—–-)"


def lints(insts: list, catalog: dict, unmapped: list, text: str | None = None) -> list:
    """Structural lints on well-formed instances (the emitter has accepted them)."""
    mentioned: set[str] = set()
    for r in insts:
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            v = r.get(sname)
            if spec["type"] in ("filler", "lemma") and E.is_ref(v):          # a lemma slot names the asked word of a question
                mentioned.add(v[1:])
            elif spec["type"] in ("refs", "list") and isinstance(v, list):   # a list may name instances (a name before a noun)
                mentioned.update(x[1:] for x in v if E.is_ref(x))
    by_id = {r["id"]: r for r in insts if "id" in r}

    def asked(iid: str) -> bool:
        t = catalog.get((by_id.get(iid) or {}).get("t")) or {}
        return bool((t.get("mints") or {}).get("asked"))

    def attached(r: dict) -> bool:                  # an instance whose attaching slot is filled (when: the asked time of an event)
        return any(spec["type"] == "filler" and spec.get("attaches") and E.is_ref(r.get(sname))
                   for sname, spec in (catalog[r["t"]].get("slots") or {}).items())

    def content_of(iid: str, seen: set) -> set:
        """The ids an instance scopes over, through its refs slots, transitively."""
        r = by_id.get(iid)
        if r is None or iid in seen:
            return set()
        seen.add(iid)
        found = set()
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            if spec["type"] == "refs":
                for x in r.get(sname) or []:
                    if E.is_ref(x):
                        found.add(x[1:])
                        found |= content_of(x[1:], seen)
        return found

    bare_ok: set[str] = set()                   # predications an imperative-like scope licenses to fill no participant
    for r in insts:
        for sname, spec in (catalog[r["t"]].get("slots") or {}).items():
            if spec["type"] == "refs" and spec.get("bare_content"):
                for x in r.get(sname) or []:
                    if E.is_ref(x):
                        bare_ok.add(x[1:])
                        bare_ok |= content_of(x[1:], set())
    for r in insts:                             # a prepositional verb's object rides on an oblique (the leak was dealt with)
        if r.get("t") == "oblique" and E.is_ref(r.get("event")) and (r.get("object") not in (None, "") or r.get("complement")):
            bare_ok.add(r["event"][1:])
    covered = text is not None and _covers_text(insts, text)   # a bare-phrase text ("Yusra, a locksmith") is its referent alone
    out = []
    for r in insts:
        t = catalog[r["t"]]
        slots = t.get("slots") or {}
        for sname, spec in slots.items():
            v = r.get(sname)
            if spec["type"] == "lemma" and E.is_ref(v) and v[1:] in by_id and not asked(v[1:]):
                out.append({"kind": "lemma-reference", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']}: {sname} holds {v}, a reference — a lemma slot holds a word; only the "
                                      f"asked word of a question fills it as a reference"})
        if t.get("family") == "referent" and r["id"] not in mentioned and not covered and not (asked(r["id"]) and attached(r)):
            mints = t.get("mints") or {}
            is_name = mints.get("stem") == "name" or mints.get("symbol") == "name"   # a name may stand inside an unmapped span
            if not is_name:
                out.append({"kind": "dangling-referent", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} is mentioned by no other instance: a witness is introduced only by a clause a template covers"})
            elif not unmapped:
                out.append({"kind": "dangling-referent", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} is mentioned by no other instance and nothing is reported unmapped"})
        if t.get("family") == "predication" and r["id"] not in bare_ok and not _subject_left_out(r, text):
            fillers = [s for s, spec in slots.items()
                       if (spec["type"] == "filler" and spec.get("participant", True))
                       or (spec["type"] == "refs" and spec.get("participant"))]     # a clause that stands as the participant (a quality of an action)
            if fillers and not any(r.get(s) not in (None, "", []) for s in fillers):
                out.append({"kind": "bare-predication", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']} fills none of its participant slots ({', '.join(fillers)})"})
        for sname, spec in slots.items():
            if spec["type"] == "refs" and r.get(sname) == []:
                out.append({"kind": "empty-scope", "instance": r["id"],
                            "detail": f"{r['t']} {r['id']}: {sname} is an empty list (a scope over nothing)"})
    return out


def span_lints(insts: list, text: str) -> list:
    """Every instance carries a span that is verbatim in the text (needs the text; report only)."""
    out = []
    for r in insts:
        if "span" not in r:
            out.append({"kind": "span-missing", "instance": r.get("id"),
                        "detail": f"{r.get('t')} {r.get('id')} has no span"})
            continue
        sp = r["span"]
        parts = sp if isinstance(sp, list) else [sp]
        if not parts or not all(isinstance(p, str) and p.strip() for p in parts):
            out.append({"kind": "span-malformed", "instance": r.get("id"),
                        "detail": f"{r.get('t')} {r.get('id')}: span must be a non-empty string or a list of them, got {sp!r}"})
            continue
        bad = [p for p in parts if not CAT.span_in_text(p, text)]
        if bad:
            out.append({"kind": "span-not-verbatim", "instance": r.get("id"),
                        "detail": f"{r.get('t')} {r.get('id')}: span {bad[0]!r} is not verbatim in the text"})
    return out


def verbatim_lints(insts: list, catalog: dict, text: str) -> list:
    """A slot the catalog marks ``verbatim`` holds words of the text as written (a tag after a name): each value is a
    verbatim substring of the text (needs the text; report only)."""
    out = []
    for r in insts:
        for sname, spec in ((catalog.get(r.get("t")) or {}).get("slots") or {}).items():
            if not spec.get("verbatim") or r.get(sname) is None:
                continue
            v = r[sname]
            for item in v if isinstance(v, list) else [v]:
                if not (isinstance(item, str) and CAT.span_in_text(item, text)):
                    out.append({"kind": "value-not-verbatim", "instance": r.get("id"),
                                "detail": f"{r.get('t')} {r.get('id')}: {sname} {item!r} is not written in the text"})
    return out


#: The kinds of the content lints: a word, or a quotation's content, that the reply neither parsed nor reported.
CONTENT_LINTS = ("content-unaccounted", "quotation-content-missing")
#: The ADVISORY kinds: reported like any lint, never a failure — the suite does not fail a record on one and the
#: coverage instrument changes no outcome for one. content-unaccounted is advisory: a word a catalog convention leaves
#: out of every span (a verb with no event of its own: took place, occurred) trips it in a faithful parse.
ADVISORY_LINTS = ("content-unaccounted",)

#: FUNCTION WORDS, for the content lints. A WORD is a run of letters and digits, joined by an inner apostrophe, hyphen,
#: period, comma, colon, slash or ampersand (AtStake's, 18-year-old, U.S, 10,557, 2:05, AT&T): punctuation and
#: quotation marks are no words, so a mark beside a word is never part of it. A word is a CONTENT word unless it is a
#: FUNCTION word, one of this closed list once a clitic ('s, 're, 'm, 'll, 've, 'd) is read off it (it's, there's and
#: I'm are function words, Odile's is a content word): the articles and demonstratives, the personal, possessive,
#: reflexive and relative pronouns, existential there, the forms of be, have and do, the prepositions and the
#: infinitive's to, and the coordinators and, or (both, either): words a span may leave out while the instances still
#: carry what the text says. Every other word is a content word, a NUMBER (a word that starts with a digit) included;
#: so are a negation (not, never, no, nor, a word ending in n't), a modal, a quantifier and a connective (but, if,
#: because, before, when): the list leaves them out on purpose, since dropping one changes what the text says.
#: A content word that an instance HOLDS AS A SLOT VALUE is carried, so content-unaccounted does not flag it: the word
#: as written, lower-cased, equals a word of the value of one of the instance's slots — every field but t (the
#: template's name), id (the instance's label) and span (provenance: the text itself) —, a string or each string of a
#: list, a reference (@x1) aside; the value's words are found with the same word pattern, so an underscore separates
#: them (crack_cocaine: crack, cocaine). An exact match, no stemming: said is not say, and salts is not salt.
FUNCTION_WORDS = frozenset("""
a an the this that these those
i me my mine myself we us our ours ourselves you your yours yourself yourselves he him his himself she her hers
herself it its itself they them their theirs themselves who whom whose which there
be am is are was were been being have has had having do does did
to of in on at by for with from into onto upon about over under through across against between among around along
behind beside below above beyond near toward towards via within throughout amid
and or both either
""".split())
_WORD = re.compile(r"[^\W_]+(?:[-'.,:/&][^\W_]+)*")
_CLITIC = re.compile(r"'(?:s|re|m|ll|ve|d)$")


def is_content_word(word: str) -> bool:
    """A word that is no function word (``FUNCTION_WORDS``); a number and a negation always are."""
    w = word.lower().replace("\u2019", "'")
    return w[:1].isdigit() or w.endswith("n't") or _CLITIC.sub("", w) not in FUNCTION_WORDS


def _flat(s: str) -> str:
    """A text or a span as the content lints read it: with the verbatim tolerance (``catalog.norm_span``: whitespace
    collapsed, curly quotes straightened), and a backtick read as an apostrophe (``…'' quotation marks)."""
    return CAT.norm_span(s).replace("`", "'")


def _parts(span) -> list:
    """A span's strings: the span itself, or the parts of a discontinuous span (a list)."""
    return [p for p in (span if isinstance(span, list) else [span]) if isinstance(p, str) and p.strip()]


def _locate(span, flat: str) -> tuple[list, set]:
    """Where a span stands in the flat text: each part's occurrences that start and end at a word's edge (a short span —
    "it", "a" — never stands inside a longer word), else all of its occurrences. A part found nowhere (not verbatim)
    gives its words instead: they account for the same words wherever these occur in the text."""
    ranges, loose = [], set()
    for p in _parts(span):
        q = _flat(p)
        hits, at = [], flat.find(q)
        while at >= 0:
            hits.append((at, at + len(q)))
            at = flat.find(q, at + 1)
        edges = [(a, b) for a, b in hits if not (a > 0 and flat[a - 1].isalnum() and q[0].isalnum())
                 and not (b < len(flat) and flat[b].isalnum() and q[-1].isalnum())]
        ranges.extend(edges or hits)
        if not hits:
            loose.update(w.lower() for w in _WORD.findall(q))
    return ranges, loose


def content_lints(insts: list, catalog: dict, unmapped: list, text: str) -> list:
    """SILENT DROPS: content the reply neither parsed nor reported (needs the text; report only). The instances' spans
    and the unmapped spans together account for every content word of the text (the catalog's *Spans*); a span reaches
    a word when it covers any of it.

    * ``content-unaccounted`` — content words (see ``FUNCTION_WORDS``) that no instance span and no unmapped span of
      any code reaches and no instance holds as a slot value. One finding per text, the words in text order. Advisory
      (``ADVISORY_LINTS``).
    * ``quotation-content-missing`` — an unmapped span with the code G10, the wording of a quotation whose content is
      parsed, whose content words no other unmapped span reaches and no instance span but a name's (the catalog gives a
      name its instance even inside an unmapped span; a quotation that is nothing but a name is its instance). The
      wording was reported and the content dropped: the first lint cannot see it, since the G10 span covers the words.

    Neither runs when an instance has no usable span (``span-missing``, ``span-malformed``): what the reply covers is
    then unknown."""
    if any(not _parts(r.get("span")) for r in insts):
        return []
    flat = _flat(text)
    words = [(m.start(), m.end(), m.group()) for m in _WORD.finditer(flat) if is_content_word(m.group())]
    spans = []                                      # (ranges, loose words, what holds the span: name / instance / G10 / unmapped)
    for r in insts:
        t = catalog.get(r.get("t")) or {}
        mints = t.get("mints") or {}
        name = t.get("family") == "referent" and (mints.get("stem") == "name" or mints.get("symbol") == "name")
        spans.append((*_locate(r["span"], flat), "name" if name else "instance"))
    for u in unmapped:
        spans.append((*_locate(u.get("span"), flat), "G10" if u.get("code") == "G10" else "unmapped"))

    def reached(w, by) -> bool:
        return any(any(a < w[1] and w[0] < b for a, b in ranges) or w[2].lower() in loose
                   for ranges, loose, holder in spans if holder in by)

    held = {v.lower() for r in insts for k, value in r.items() if k not in ("t", "id", "span")
            for s in (value if isinstance(value, list) else [value]) if isinstance(s, str) and not E.is_ref(s)
            for v in _WORD.findall(_flat(s))}                                 # the words of the slot values
    out = []
    missing = [w[2] for w in words if not reached(w, ("name", "instance", "G10", "unmapped")) and w[2].lower() not in held]
    if missing:
        out.append({"kind": "content-unaccounted",
                    "detail": f"{', '.join(repr(w) for w in missing)}: outside every span, neither parsed nor reported"})
    for u in unmapped:
        if u.get("code") != "G10":
            continue
        for p in _parts(u.get("span")):
            quoted = [[w for w in words if w[0] < b and a < w[1]] for a, b in _locate(p, flat)[0]]
            quoted = [ws for ws in quoted if not all(reached(w, ("name",)) for w in ws)]   # a mark alone, a quoted name
            if quoted and not any(reached(w, ("instance", "unmapped")) for ws in quoted for w in ws):
                out.append({"kind": "quotation-content-missing",
                            "detail": f"its content neither parsed nor reported: no instance but a name and no other "
                                      f"unmapped span reaches the words of the G10 span {p!r}"})
    return out


def typecheck_records(records: list[dict]):
    """C9 over ``[{"statements": [...], "declarations": [...]}, ...]`` in one engine session.
    Returns ``{index: [findings]}`` (only records with hard findings appear), or ``None`` when
    the ``petta`` package is not importable."""
    try:
        import petta  # noqa: F401
    except Exception:
        return None
    todo = [{"id": str(i), "statements": r["statements"], "declarations": r["declarations"]}
            for i, r in enumerate(records) if r.get("statements")]
    if not todo:
        return {}
    with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
        for r in todo:
            fh.write(json.dumps(r) + "\n")
        path = fh.name
    report = path + ".report.json"
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            T.main([path, "--no-infer", "--report", report])
        with open(report, encoding="utf-8") as fh:
            rep = json.load(fh)
    finally:
        for p in (path, report):
            if os.path.exists(p):
                os.unlink(p)
    by: dict[int, list] = collections.defaultdict(list)
    for f in rep["findings"]:
        if f["kind"] in HARD_TYPE_FINDINGS:
            by[int(f["id"])].append({"kind": "type", "detail": f"{f['kind']}: {f.get('statement') or f.get('error')}",
                                     "statement": f.get("statement"), "expected": f.get("expected"), "got": f.get("got")})
    return by


def validate(reply, catalog: dict | None = None, typecheck: bool = True, reference_time=None,
             text: str | None = None) -> dict:
    """Everything for one reply: contract, emission, lints (span lints when the text is given) and C9."""
    res = inspect(reply, catalog, reference_time, text)
    if res["question"]:
        res["typecheck"] = "skipped (a question: its records are a query's content, not facts)"
    elif typecheck and res["statements"]:
        typed = typecheck_records([res])
        if typed is None:
            res["typecheck"] = "skipped (no petta package)"
        else:
            res["typecheck"] = "ran"
            res["findings"].extend(typed.get(0, []))
    return res


def summary(res: dict) -> str:
    """One line for a terminal: status, statement count, C9, findings."""
    n = len(res["statements"] or [])
    tc = res.get("typecheck", "not run")
    if tc == "ran":
        bad = sum(1 for f in res["findings"] if f["kind"] == "type")
        tc = f"C9 {n - bad}/{n}"
    kinds = collections.Counter(f["kind"] for f in res["findings"])
    found = ", ".join(f"{k} {v}" for k, v in sorted(kinds.items())) or "none"
    return f"validation {res['status']} · {n} statements · {tc} · findings: {found}"
