"""Generic emitter: template instances -> statements, driven by the catalog's ``emits`` shapes.

Nothing template-specific lives here.  A template file declares what its instances mint
(``mints``), the shapes it emits (``emits``), and the substrate class of each slot; this module
interprets those declarations.  Same instances in, byte-identical statements out: no clock,
no randomness, no set iteration reaching the output.

Instances.  An item is ``{"id": …, "instances": [...], "unmapped": [...]}``; an instance is
``{"t": <template id>, "id": <label>, <slot>: <value>, …}`` — every instance has an id.  A
filler value is a reference ``"@<label>"`` to another instance, a bare lemma, a number or a
string.  A ``refs`` slot holds a list of references to instances whose atoms the shape SCOPES
OVER (negation, modality, sealed complements): those instances' atoms are rendered inside the
shape, as one atom or an ``(And …)`` bundle, and are not emitted on their own.

A ``refs`` slot may carry ``consumes: false`` (the referenced instances' atoms are ALSO emitted
on their own: a rule that restates a predication per member), ``bind: <filler slot>`` (inside
this slot's bundle the symbol of the instance that filler names becomes the variable ``$x``)
and ``skolemize: true`` (inside the bundle every event symbol minted by a rendered instance
becomes the skolem function ``(sk_<stem> $x)``: each member has its own event).

Shapes.  ``@id`` is the symbol minted for the instance; ``{slot}`` substitutes the filler (the
minted symbol of a referenced instance, the lemma, the number, the quoted string, or the bundle
of a ``refs`` slot); ``"{slot}"`` inside quotes substitutes into the string.  ``if_filled``
emits the shape only when the slot is present, ``each`` emits one statement per element of a
list slot (``{slot}`` then stands for the element; over a ``refs`` slot the elements are the
conjuncts of the scoped bundle, so a sealed clause can also be stated flat), ``when`` tests
slot values with ``slot == value`` / ``slot != value`` clauses joined by ``and`` / ``or``
(case-insensitive, so ``factive == true`` tests a boolean), ``project: true`` emits the shape
at the top level whatever scope the instance sits in (a presupposition projects through
negation).

Symbols.  A template that ``mints`` a symbol says its class and how it is named:
``symbol: name`` derives the symbol from the ``name`` slot (``"Ilse Varga"`` -> ``ilse_varga``,
duplicates numbered), otherwise a witness ``sk_<stem>_<n>`` whose stem is the ``stem`` slot's value, or the
``literal`` word (``literal: group`` -> ``sk_group_n``), else ``verb``, else ``kind``, else the
template id, numbered per stem in instance order.

Homes.  An instance's own atoms are emitted at the top level unless every instance that
mentions it sits inside one scope; then they are emitted inside that scope (an indefinite
witness under negation is existentially bound there).  Symbols named from a name are rigid and
stay at the top level, and so is any instance whose template lists ``presupposed`` slots when
one of them is filled (a definite or possessed witness exists whatever scope mentions it).

Constraints.  A template may declare ``one_of: [[a, b], …]``: exactly one slot of each group
must be filled (a message that is a thing or a clause).

Truth values.  Every statement carries ``(STV 1.0 0.99)`` unless the template declares
``truth: {strength: [<clause>, …], confidence: [<clause>, …]}``; each list is tried in order
and a clause is either a number (the default) or ``{slot: <name>, values: {<value>: <number>}}``
(the instance's own slot) or ``{from: <refs slot>, slot: <name>, values: …}`` (the first
referenced instance whose slot has a listed value).  A shape may carry its own ``stv: [s, c]``,
which overrides the instance's truth value for that statement (a surface record beside a rule).

Variables.  ``mints: {variable: true}`` mints ``$x``, ``$y``, ``$z`` … in instance order: the
range of a quantified rule.  ``skolemize: true`` on a ``refs`` slot replaces, inside that slot's
bundle, every non-rigid minted symbol (an event, an indefinite witness or group) by a skolem
function of the variables in scope — the bound variable of ``bind`` and the variables of the
ranges the instance references — so each instance of the range gets its own event and its own
dependent indefinite, while names and presupposed referents stay constants.

Declarations.  Every minted symbol is declared with its class, every bare filler with its slot's
class, every lemma with ``Class``; ``Entity`` / ``Event`` / ``TimeTerm`` also declare
``Instance``.
"""
from __future__ import annotations

import re
import unicodedata

from . import catalog as CAT

DEFAULT_STV = (1.0, 0.99)
VARIABLES = ["$x", "$y", "$z", "$u", "$v", "$w"]
INSTANCE_SUBTYPES = ("Entity", "Event", "TimeTerm", "Statement", "Context")

_TOKEN = re.compile(r'"(?:[^"\\]|\\.)*"|[()]|[^\s()]+')


class EmitError(Exception):
    pass


class Str(str):
    """A string literal (rendered with quotes)."""


# --------------------------------------------------------------------------
# small helpers
# --------------------------------------------------------------------------


def is_ref(v) -> bool:
    return isinstance(v, str) and v.startswith("@") and len(v) > 1


def fmt_num(v) -> str:
    """Numbers as the corpus writes them: floats keep a decimal point (1.0), ints stay ints."""
    if isinstance(v, bool):
        return str(v).lower()
    return str(v)


def render(term) -> str:
    if isinstance(term, list):
        return "(" + " ".join(render(x) for x in term) + ")"
    if isinstance(term, Str):
        return '"' + term.replace("\\", "\\\\").replace('"', '\\"') + '"'
    if isinstance(term, (int, float)):
        return fmt_num(term)
    return str(term)


def slug(text: str) -> str:
    text = unicodedata.normalize("NFKD", str(text)).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", "_", text.lower()).strip("_") or "x"


def parse_shape(atom: str):
    toks = _TOKEN.findall(atom)
    pos = 0

    def read():
        nonlocal pos
        tok = toks[pos]
        pos += 1
        if tok == "(":
            items = []
            while toks[pos] != ")":
                items.append(read())
            pos += 1
            return items
        return tok

    expr = read()
    if pos != len(toks):
        raise EmitError(f"bad shape: {atom}")
    return expr


def holds(cond: str, inst: dict) -> bool:
    """``slot == value`` clauses joined by ``and`` / ``or`` (``or`` binds loosest)."""
    def clause(c: str) -> bool:
        c = c.strip()
        neg = c.startswith("not ")
        if neg:
            c = c[4:].strip()
        if "!=" in c:
            k, v = [x.strip() for x in c.split("!=", 1)]
            res = str(inst.get(k)).lower() != v.lower()
        elif "==" in c:
            k, v = [x.strip() for x in c.split("==", 1)]
            res = str(inst.get(k)).lower() == v.lower()
        else:
            res = inst.get(c) not in (None, False, [], "")
        return (not res) if neg else res

    return any(all(clause(c) for c in part.split(" and ")) for part in cond.split(" or "))


# --------------------------------------------------------------------------
# the emitter
# --------------------------------------------------------------------------


MONTHS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
WEEKDAYS = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]


def reference_fields(reference_time) -> dict:
    """Calendar fields of an ISO ``YYYY-MM-DD`` or ``YYYY-MM-DDTHH:MM`` reference time, for the anchor."""
    if not reference_time:
        return {}
    import datetime
    text = str(reference_time).strip()
    try:
        if "T" in text:
            dt = datetime.datetime.fromisoformat(text)
            d, clock = dt.date(), (dt.hour, dt.minute)
        else:
            d, clock = datetime.date.fromisoformat(text), None
    except ValueError as exc:
        raise EmitError([f"reference_time {reference_time!r} is not an ISO date (YYYY-MM-DD[THH:MM]): {exc}"])
    out = {"year": d.year, "month": MONTHS[d.month - 1], "day": d.day, "weekday": WEEKDAYS[d.weekday()]}
    if clock:
        out["hour"], out["minute"] = clock
    return out


def rigid(r: dict, t: dict) -> bool:
    """A referent that is never scoped or skolemized: a symbol taken from a filled slot (a named
    time), a variable, or a presupposed slot filled (a name, a definite, a possessed witness)."""
    m = t.get("mints") or {}
    sym_slot = m.get("symbol")
    return (bool(sym_slot) and r.get(sym_slot) not in (None, "", [])) or bool(m.get("variable")) or \
        any(r.get(s) not in (None, False, [], "") for s in t.get("presupposed") or [])


class _Emitter:
    def __init__(self, item: dict, catalog: dict):
        self.item, self.cat = item, catalog
        self.insts = [dict(r) if isinstance(r, dict) else r for r in (item.get("instances") or [])]   # never mutate the caller's records
        self.by_id = {r["id"]: r for r in self.insts if "id" in r}
        self.sym: dict[str, str] = {}
        self.out: list[dict] = []
        self.types: dict[str, set] = {}
        self.sk_functions: dict[tuple, str] = {}        # (stem, arity) -> the class of the skolemized symbol
        self._names: dict[str, int] = {}
        self.head_of: dict[str, str] = {}               # attachment instance -> the instance it attaches to
        self.attachments_of: dict[str, list[str]] = {}  # head instance -> its attachments, in order

    # ---------------------------------------------------------------- checks
    def check(self) -> list[str]:
        problems = []
        seen = set()
        for i, r in enumerate(self.insts):
            t = self.cat.get(r.get("t"))
            where = f"instance {i} ({r.get('t')})"
            if t is None:
                problems.append(f"{where}: unknown template")
                continue
            if "id" not in r:
                problems.append(f"{where}: every instance needs an id")
            elif r["id"] in seen:
                problems.append(f"{where}: duplicate id {r['id']}")
            else:
                seen.add(r["id"])
            for sname, spec in (t.get("slots") or {}).items():
                v = r.get(sname)
                if v is None or v == [] or v == "":
                    if spec.get("required"):
                        problems.append(f"{where}: missing required slot {sname}")
                    continue
                if isinstance(v, bool) and spec["type"] != "bool":
                    problems.append(f"{where}: {sname}={v!r} is a boolean where a word is expected (an unquoted On / Off / Yes / No in YAML?)")
                    continue
                if spec["type"] == "enum" and str(v) not in [str(x) for x in spec.get("values") or []]:
                    problems.append(f"{where}: {sname}={v!r} is not one of {spec.get('values')}")
                refs = v if spec["type"] == "refs" else [v] if spec["type"] == "filler" else []
                if spec["type"] == "filler" and spec.get("attaches") and not is_ref(v):
                    problems.append(f"{where}: {sname} must reference the instance it attaches to")
                if spec["type"] == "refs" and not isinstance(v, list):
                    problems.append(f"{where}: {sname} must be a list of references")
                    refs = []
                for ref in refs:
                    if not is_ref(ref):
                        if spec["type"] == "refs":
                            problems.append(f"{where}: {sname} holds {ref!r}, not a reference")
                        continue
                    target = self.by_id.get(ref[1:])
                    if target is None:
                        problems.append(f"{where}: {sname} references unknown instance {ref}")
                    elif spec["type"] == "filler" and not (self.cat.get(target.get("t")) or {}).get("mints"):
                        problems.append(f"{where}: {sname} references {ref}, which mints no symbol")
            for sname in r:
                if sname not in ("t", "id") and sname not in (t.get("slots") or {}):
                    problems.append(f"{where}: unknown slot {sname}")
            for group in t.get("one_of") or []:
                filled = [s for s in group if r.get(s) not in (None, [], "")]
                if len(filled) != 1:
                    problems.append(f"{where}: exactly one of {', '.join(group)} must be filled ({len(filled)} are)")
        problems.extend(self.scope_cycles())
        return list(dict.fromkeys(problems))

    def scope_cycles(self) -> list[str]:
        """A scope over itself, directly or through other scopes, could never be rendered."""
        edges: dict[str, list[str]] = {}
        for r in self.insts:
            t = self.cat.get(r.get("t"))
            if t is None or "id" not in r:
                continue
            for sname, spec in (t.get("slots") or {}).items():
                if spec["type"] == "refs" and isinstance(r.get(sname), list):
                    edges.setdefault(r["id"], []).extend(x[1:] for x in r[sname] if is_ref(x))
                if spec["type"] == "filler" and spec.get("attaches") and is_ref(r.get(sname)):
                    edges.setdefault(r["id"], []).append(r[sname][1:])
        problems, state = [], {}

        def visit(node, path):
            state[node] = "open"
            path.append(node)
            for nxt in edges.get(node, []):
                if state.get(nxt) == "open":
                    problems.append("scope cycle: " + " -> ".join(path[path.index(nxt):] + [nxt]))
                elif nxt not in state:
                    visit(nxt, path)
            path.pop()
            state[node] = "done"

        for node in edges:
            if node not in state:
                visit(node, [])
        return problems

    # ---------------------------------------------------------------- symbols
    def assign_symbols(self):
        named: dict[str, list[str]] = {}
        counters: dict[str, int] = {}
        n_vars = 0
        for r in self.insts:
            t = self.cat[r["t"]]
            m = t.get("mints")
            if not m:
                continue
            if m.get("variable"):
                self.sym[r["id"]] = VARIABLES[n_vars] if n_vars < len(VARIABLES) else f"$v{n_vars}"
                n_vars += 1
            elif m.get("symbol") and r.get(m["symbol"]) not in (None, "", []):
                base = slug(str(r[m["symbol"]]))
                if m.get("constant"):                     # the same word is the same symbol (yesterday, noon)
                    self.sym[r["id"]] = base
                else:
                    named.setdefault(base, []).append(r["id"])
            else:
                stem_slot = m.get("stem")
                stem = r.get(stem_slot) if stem_slot else m.get("literal") or r.get("verb") or r.get("kind") or t["id"]
                stem = slug(stem)
                counters[stem] = counters.get(stem, 0) + 1
                self.sym[r["id"]] = f"sk_{stem}_{counters[stem]}"
        for base, ids in named.items():
            for k, i in enumerate(ids, 1):
                self.sym[i] = base if len(ids) == 1 else f"{base}_{k}"

    # ---------------------------------------------------------------- homes
    def is_rigid(self, iid: str) -> bool:
        """A name, a presupposed referent (definite, possessed) or a variable: never scoped or skolemized."""
        r = self.by_id[iid]
        return rigid(r, self.cat[r["t"]])

    def compute_homes(self):
        # content instance -> the scope instance whose refs slot names it
        self.scope_of: dict[str, str] = {}
        for r in self.insts:
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "refs" and spec.get("consumes", True):
                    for ref in r.get(sname) or []:
                        self.scope_of[ref[1:]] = r["id"]

        # attachment instance -> its head (a slot with ``attaches: true``); rendered wherever the head is
        self.head_of = {}
        for r in self.insts:
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "filler" and spec.get("attaches") and is_ref(r.get(sname)):
                    self.head_of[r["id"]] = r[sname][1:]
        self.attachments_of = {}
        for a, h in self.head_of.items():
            self.attachments_of.setdefault(h, []).append(a)

        def enclosing(iid):
            chain = []
            while True:
                if iid in self.scope_of:
                    iid = self.scope_of[iid]
                    chain.append(iid)
                elif iid in self.head_of:               # an attachment is enclosed by whatever encloses its head
                    iid = self.head_of[iid]
                else:
                    return chain

        mentions: dict[str, list[str]] = {}
        for r in self.insts:
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "filler" and is_ref(r.get(sname)):
                    mentions.setdefault(r[sname][1:], []).append(r["id"])
        self.mentions = mentions
        # referent instance -> the innermost scope enclosing every mention, or None (top level)
        self.home: dict[str, str | None] = {}
        for r in self.insts:
            iid = r["id"]
            if iid in self.scope_of or not mentions.get(iid) or self.is_rigid(iid):
                self.home[iid] = None
                continue
            chains = [enclosing(m) for m in mentions[iid]]
            self.home[iid] = next((c for c in chains[0] if all(c in ch for ch in chains)), None)
        self.homed_in: dict[str, list[str]] = {}
        for iid, h in self.home.items():
            if h is not None:
                self.homed_in.setdefault(h, []).append(iid)

    # ---------------------------------------------------------------- rendering
    def fill(self, inst: dict, slot: str, spec: dict, element=None):
        v = element if element is not None else inst.get(slot)
        if spec["type"] == "refs":
            return element if element is not None else self.bundle(v, inst["id"], spec)
        if is_ref(v):
            return self.sym[v[1:]]
        if spec["type"] == "string":
            return Str(str(v))
        return v

    def substitute(self, expr, inst: dict, slots: dict, element_slot=None, element=None):
        if isinstance(expr, list):
            return [self.substitute(x, inst, slots, element_slot, element) for x in expr]
        tok = expr
        if tok == "@id":
            return self.sym[inst["id"]]
        if tok.startswith('"') and tok.endswith('"'):
            def rep(m):
                s = m.group(1)
                return str(element if s == element_slot else inst.get(s, ""))
            return Str(CAT._PLACEHOLDER.sub(rep, tok[1:-1]))
        m = CAT._PLACEHOLDER.fullmatch(tok)
        if m:
            s = m.group(1)
            return self.fill(inst, s, slots[s], element if s == element_slot else None)
        return tok

    def atoms_of(self, iid: str, projecting: bool = False) -> list:
        """The atom terms an instance emits (scoped content rendered inside), its attachments' after its own."""
        return [term for term, _e, _owner in self.rendered(iid, projecting)]

    def rendered(self, iid: str, projecting: bool = False) -> list:
        """``(term, shape, instance)`` for an instance's own shapes followed by those of its
        attachments: an attachment (a filler slot with ``attaches: true``) is rendered wherever its
        head is — at the top level, inside a scope's bundle or inside a rule."""
        out = [(term, e, iid) for term, e in self.shapes_of(iid, projecting)]
        if not projecting:
            for a in self.attachments_of.get(iid, []):
                out.extend(self.rendered(a))
        return out

    def shapes_of(self, iid: str, projecting: bool = False) -> list:
        """``(term, shape)`` pairs for an instance's own shapes; ``projecting`` selects the
        ``project: true`` shapes instead of the ordinary ones."""
        r = self.by_id[iid]
        t = self.cat[r["t"]]
        terms = []
        for e in t.get("emits") or []:
            if bool(e.get("project")) != projecting:
                continue
            if "if_filled" in e and r.get(e["if_filled"]) in (None, [], ""):
                continue
            if "when" in e and not holds(e["when"], r):
                continue
            shape = parse_shape(e["atom"])
            for sym, cls in (e.get("declare") or {}).items():
                self.declare(sym, cls)
            if "each" in e:
                slot = e["each"]
                if t["slots"][slot]["type"] == "refs":
                    b = self.bundle(r.get(slot) or [], iid)
                    elements = b[1:] if isinstance(b, list) and b and b[0] == "And" else [b]
                else:
                    elements = r.get(slot) or []
                for element in elements:
                    terms.append((self.substitute(shape, r, t["slots"], slot, element), e))
            else:
                terms.append((self.substitute(shape, r, t["slots"]), e))
        return terms

    def attached(self, refs: list, scope_iid: str) -> list[str]:
        """The referents homed at this scope that belong to THIS slot's bundle: those mentioned by
        an instance the slot's references reach (a rule's premise bundle does not carry the
        conclusion's indefinites)."""
        core = set(self.inside(refs, scope_iid, with_homed=False))
        out: list[str] = []
        changed = True
        while changed:
            changed = False
            for iid in self.homed_in.get(scope_iid, []):
                if iid not in out and any(m in core or m in out for m in self.mentions.get(iid, [])):
                    out.append(iid)
                    changed = True
        return out

    def inside(self, refs: list, scope_iid: str, with_homed: bool = True) -> list[str]:
        """Every instance rendered within a bundle: the references, transitively, and the homed."""
        out, todo = [], [ref[1:] for ref in refs] + (self.attached(refs, scope_iid) if with_homed else [])
        while todo:
            iid = todo.pop(0)
            if iid in out:
                continue
            out.append(iid)
            r = self.by_id[iid]
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "refs":
                    todo.extend(x[1:] for x in (r.get(sname) or []) if is_ref(x))
            todo.extend(self.homed_in.get(iid, []))
            todo.extend(self.attachments_of.get(iid, []))
        return out

    def bundle(self, refs: list, scope_iid: str, spec: dict | None = None):
        """The content of a scope: its referenced instances' atoms plus the referents homed here.
        With ``bind`` / ``skolemize`` on the slot, symbols are overlaid while rendering."""
        overlay = None
        if spec and (spec.get("bind") or spec.get("skolemize")):
            overlay = dict(self.sym)
            inst = self.by_id[scope_iid]
            if spec.get("bind"):
                target = inst.get(spec["bind"])
                if is_ref(target):
                    overlay[target[1:]] = "$x"
            if spec.get("skolemize"):
                variables = []
                if spec.get("bind") and is_ref(inst.get(spec["bind"])):
                    variables.append("$x")
                slots = self.cat[inst["t"]].get("slots") or {}
                all_refs = [x for s2, sp2 in slots.items() if sp2["type"] == "refs" for x in (inst.get(s2) or []) if is_ref(x)]
                reached = set(self.inside(all_refs, scope_iid))
                for r2 in self.insts:
                    if r2["id"] in reached and (self.cat[r2["t"]].get("mints") or {}).get("variable"):
                        variables.append(self.sym[r2["id"]])
                for iid in self.inside(refs, scope_iid):
                    m = self.cat[self.by_id[iid]["t"]].get("mints") or {}
                    if m and iid in self.sym and not self.is_rigid(iid):
                        stem = self.sym[iid].rsplit("_", 1)[0]
                        overlay[iid] = [stem] + variables
                        self.sk_functions[(stem, len(variables))] = m.get("id", "Entity")
        saved = self.sym
        if overlay is not None:
            self.sym = overlay
        try:
            terms = []
            for ref in refs:
                terms.extend(self.atoms_of(ref[1:]))
            for iid in self.attached(refs, scope_iid):
                terms.extend(self.atoms_of(iid))
        finally:
            self.sym = saved
        return terms[0] if len(terms) == 1 else ["And"] + terms

    def truth_of(self, inst: str) -> tuple:
        """The instance's truth value from its template's layered ``truth`` rules, else the default."""
        r = self.by_id[inst]
        rule = self.cat[r["t"]].get("truth")
        if not rule:
            return DEFAULT_STV

        def lookup(clause, source):
            v = source.get(clause["slot"])
            if v is None:
                return None
            values = {str(k).lower(): x for k, x in (clause.get("values") or {}).items()}
            return values.get(str(v).lower())

        def pick(clauses, fallback):
            for c in clauses if isinstance(clauses, list) else [clauses]:
                if isinstance(c, (int, float)):
                    return float(c)
                if not isinstance(c, dict):
                    continue
                if c.get("from"):
                    for ref in r.get(c["from"]) or []:
                        tgt = self.by_id.get(ref[1:]) if is_ref(ref) else None
                        got = lookup(c, tgt) if tgt is not None else None
                        if got is not None:
                            return float(got)
                else:
                    got = lookup(c, r)
                    if got is not None:
                        return float(got)
            return fallback

        return (pick(rule.get("strength", []), DEFAULT_STV[0]), pick(rule.get("confidence", []), DEFAULT_STV[1]))

    def add(self, term, owner: str, inst: str, stv=None):
        head = term[0] if isinstance(term, list) else str(term)
        base = slug(f"{inst}_{head}")
        n = self._names.get(base, 0) + 1
        self._names[base] = n
        name = base if n == 1 else f"{base}_{n}"
        stv = (float(stv[0]), float(stv[1])) if stv else self.truth_of(inst)
        self.out.append({"name": name, "term": term, "owner": owner, "inst": inst,
                         "text": f"(: {name} {render(term)} (STV {fmt_num(stv[0])} {fmt_num(stv[1])}))"})

    # ---------------------------------------------------------------- declarations
    def declare(self, sym, cls):
        if isinstance(sym, (list, Str)) or sym is None or is_ref(str(sym)) or str(sym).startswith("$"):
            return
        self.types.setdefault(str(sym), set()).add(cls)

    def declarations(self) -> list[str]:
        for r in self.insts:
            t = self.cat[r["t"]]
            m = t.get("mints")
            if m and r["id"] in self.sym:
                self.declare(self.sym[r["id"]], m["id"])
                also = m.get("also") or {}                  # extra classes: a list, or {class: slot} when the slot is filled
                for cls, slot in (also.items() if isinstance(also, dict) else [(c, None) for c in also]):
                    if slot is None or r.get(slot) not in (None, False, "", []):
                        self.declare(self.sym[r["id"]], cls)
            for sname, spec in (t.get("slots") or {}).items():
                v = r.get(sname)
                if v is None or spec["type"] not in ("filler", "lemma", "list"):
                    continue
                cls = spec.get("class")
                for x in (v if isinstance(v, list) else [v]):
                    if is_ref(x) or isinstance(x, (int, float)) or not cls:
                        continue
                    self.declare(x, cls)
        lines = []
        for sym in sorted(self.types):
            full = set(self.types[sym])
            if full & set(INSTANCE_SUBTYPES):
                full.add("Instance")
            lines += [f"(: {sym} {c})" for c in sorted(full)]
        for (stem, arity), cls in sorted(self.sk_functions.items()):   # skolem functions: (sk_letter $x) is an Entity
            args = " ".join(["Atom"] * arity)
            for c in sorted({cls, "Instance"} if cls in INSTANCE_SUBTYPES else {cls}):
                lines.append(f"(: {stem} (-> {args} {c}))")
        return lines

    # ---------------------------------------------------------------- run
    def prepare(self):
        """Slot defaults, and the text's reference time: an instance referencing the reserved id
        ``now`` gets a ``reference-time`` instance, with calendar fields when the item carries a
        ``reference_time`` (ISO date, optionally with a clock time)."""
        for r in self.insts:
            t = self.cat.get(r.get("t")) or {}
            for sname, spec in (t.get("slots") or {}).items():
                if "default" in spec and r.get(sname) in (None, "", []) and self.shape_uses(t, sname, r):
                    r[sname] = spec["default"]
        if "now" in self.by_id or "reference-time" not in self.cat:
            return
        referenced = any(is_ref(v) and v[1:] == "now" for r in self.insts for v in r.values() if isinstance(v, str))
        if not referenced:
            return
        anchor = {"t": "reference-time", "id": "now"}
        anchor.update(reference_fields(self.item.get("reference_time")))
        self.insts.append(anchor)
        self.by_id["now"] = anchor

    def shape_uses(self, t: dict, slot: str, r: dict) -> bool:
        """Would some shape that mentions ``{slot}`` fire for this instance (its other conditions
        given)? A default is applied only then, so an unused anchor is not conjured."""
        for e in t.get("emits") or []:
            if "{" + slot + "}" not in e.get("atom", ""):
                continue
            if "if_filled" in e and e["if_filled"] != slot and r.get(e["if_filled"]) in (None, [], ""):
                continue
            if "when" in e and not holds(e["when"], r):
                continue
            return True
        return False

    def run(self) -> dict:
        self.prepare()
        problems = self.check()
        if problems:
            raise EmitError(problems)
        self.assign_symbols()
        self.compute_homes()
        for r in self.insts:
            iid = r["id"]
            if iid in self.scope_of or self.home.get(iid) is not None or iid in self.head_of:
                continue                                    # rendered inside a scope, or with its head
            for term, e, owner in self.rendered(iid):
                self.add(term, self.by_id[owner]["t"], owner, e.get("stv"))
        for r in self.insts:                                    # presuppositions: top level, any scope
            for term, e in self.shapes_of(r["id"], projecting=True):
                self.add(term, r["t"], r["id"], e.get("stv"))
        fired: dict[str, int] = {}
        for r in self.insts:
            fired[r["t"]] = fired.get(r["t"], 0) + 1
        return {"id": self.item.get("id"),
                "statements": [s["text"] for s in self.out],
                "detail": [{"name": s["name"], "term": render(s["term"]), "owner": s["owner"], "inst": s["inst"]}
                           for s in self.out],
                "declarations": self.declarations(),
                "fired": {k: fired[k] for k in sorted(fired)},
                "unmapped": self.item.get("unmapped") or []}


def emit(item: dict, catalog: dict | None = None) -> dict:
    """Instances -> statements + declarations. Raises EmitError on malformed instances."""
    if catalog is None:
        catalog = CAT.load()
    return _Emitter(item, catalog).run()
