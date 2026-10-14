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

Shapes.  ``@id`` is the symbol minted for the instance; ``{slot}`` substitutes the filler (the
minted symbol of a referenced instance, the lemma, the number, the quoted string, or the bundle
of a ``refs`` slot); ``"{slot}"`` inside quotes substitutes into the string.  ``if_filled``
emits the shape only when the slot is present, ``each`` emits one statement per element of a
list slot (``{slot}`` then stands for the element), ``when`` tests slot values with
``slot == value`` / ``slot != value`` clauses joined by ``and`` / ``or``.

Symbols.  A template that ``mints`` a symbol says its class and how it is named:
``symbol: name`` derives the symbol from the ``name`` slot (``"Ilse Varga"`` -> ``ilse_varga``,
duplicates numbered), otherwise a witness ``sk_<stem>_<n>`` whose stem is the ``stem`` slot,
else ``verb``, else ``kind``, else the template id, numbered per stem in instance order.

Homes.  An instance's own atoms are emitted at the top level unless every instance that
mentions it sits inside one scope; then they are emitted inside that scope (a witness under
negation is existentially bound there).  Symbols named from a name are rigid and stay at the
top level.

Declarations.  Every minted symbol is declared with its class, every bare filler with its slot's
class, every lemma with ``Class``; ``Entity`` / ``Event`` / ``TimeTerm`` also declare
``Instance``.
"""
from __future__ import annotations

import re
import unicodedata

from . import catalog as CAT

DEFAULT_STV = (1.0, 0.99)
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
            res = str(inst.get(k)) != v
        elif "==" in c:
            k, v = [x.strip() for x in c.split("==", 1)]
            res = str(inst.get(k)) == v
        else:
            res = inst.get(c) not in (None, False, [], "")
        return (not res) if neg else res

    return any(all(clause(c) for c in part.split(" and ")) for part in cond.split(" or "))


# --------------------------------------------------------------------------
# the emitter
# --------------------------------------------------------------------------


class _Emitter:
    def __init__(self, item: dict, catalog: dict):
        self.item, self.cat = item, catalog
        self.insts = item.get("instances") or []
        self.by_id = {r["id"]: r for r in self.insts if "id" in r}
        self.sym: dict[str, str] = {}
        self.out: list[dict] = []
        self.types: dict[str, set] = {}
        self._names: dict[str, int] = {}

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
                if v is None:
                    if spec.get("required"):
                        problems.append(f"{where}: missing required slot {sname}")
                    continue
                if spec["type"] == "enum" and str(v) not in [str(x) for x in spec.get("values") or []]:
                    problems.append(f"{where}: {sname}={v!r} is not one of {spec.get('values')}")
                refs = v if spec["type"] == "refs" else [v] if spec["type"] == "filler" else []
                for ref in refs:
                    if is_ref(ref) and ref[1:] not in self.by_id:
                        problems.append(f"{where}: {sname} references unknown instance {ref}")
            for sname in r:
                if sname not in ("t", "id") and sname not in (t.get("slots") or {}):
                    problems.append(f"{where}: unknown slot {sname}")
        return problems

    # ---------------------------------------------------------------- symbols
    def assign_symbols(self):
        named: dict[str, list[str]] = {}
        counters: dict[str, int] = {}
        for r in self.insts:
            t = self.cat[r["t"]]
            m = t.get("mints")
            if not m:
                continue
            if m.get("symbol") == "name":
                base = slug(r.get("name", r["id"]))
                named.setdefault(base, []).append(r["id"])
            else:
                stem_slot = m.get("stem")
                stem = r.get(stem_slot) if stem_slot else r.get("verb") or r.get("kind") or t["id"]
                stem = slug(stem)
                counters[stem] = counters.get(stem, 0) + 1
                self.sym[r["id"]] = f"sk_{stem}_{counters[stem]}"
        for base, ids in named.items():
            for k, i in enumerate(ids, 1):
                self.sym[i] = base if len(ids) == 1 else f"{base}_{k}"

    # ---------------------------------------------------------------- homes
    def compute_homes(self):
        # content instance -> the scope instance whose refs slot names it
        self.scope_of: dict[str, str] = {}
        for r in self.insts:
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "refs":
                    for ref in r.get(sname) or []:
                        self.scope_of[ref[1:]] = r["id"]

        def enclosing(iid):
            chain = []
            while iid in self.scope_of:
                iid = self.scope_of[iid]
                chain.append(iid)
            return chain

        mentions: dict[str, list[str]] = {}
        for r in self.insts:
            for sname, spec in (self.cat[r["t"]].get("slots") or {}).items():
                if spec["type"] == "filler" and is_ref(r.get(sname)):
                    mentions.setdefault(r[sname][1:], []).append(r["id"])
        # referent instance -> the innermost scope enclosing every mention, or None (top level)
        self.home: dict[str, str | None] = {}
        for r in self.insts:
            iid = r["id"]
            if iid in self.scope_of or not mentions.get(iid) or \
                    (self.cat[r["t"]].get("mints") or {}).get("symbol") == "name":
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
            return self.bundle(v, inst["id"])
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

    def atoms_of(self, iid: str) -> list:
        """The atom terms an instance emits from its own shapes (scoped content rendered inside)."""
        r = self.by_id[iid]
        t = self.cat[r["t"]]
        terms = []
        for e in t.get("emits") or []:
            if "if_filled" in e and r.get(e["if_filled"]) in (None, [], ""):
                continue
            if "when" in e and not holds(e["when"], r):
                continue
            shape = parse_shape(e["atom"])
            if "each" in e:
                for element in r.get(e["each"]) or []:
                    terms.append(self.substitute(shape, r, t["slots"], e["each"], element))
            else:
                terms.append(self.substitute(shape, r, t["slots"]))
        return terms

    def bundle(self, refs: list, scope_iid: str):
        """The content of a scope: its referenced instances' atoms plus the referents homed here."""
        terms = []
        for ref in refs:
            terms.extend(self.atoms_of(ref[1:]))
        for iid in self.homed_in.get(scope_iid, []):
            terms.extend(self.atoms_of(iid))
        return terms[0] if len(terms) == 1 else ["And"] + terms

    def add(self, term, owner: str, inst: str):
        head = term[0] if isinstance(term, list) else str(term)
        base = slug(f"{inst}_{head}")
        n = self._names.get(base, 0) + 1
        self._names[base] = n
        name = base if n == 1 else f"{base}_{n}"
        stv = DEFAULT_STV
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
        return lines

    # ---------------------------------------------------------------- run
    def run(self) -> dict:
        problems = self.check()
        if problems:
            raise EmitError(problems)
        self.assign_symbols()
        self.compute_homes()
        for r in self.insts:
            iid = r["id"]
            if iid in self.scope_of or self.home.get(iid) is not None:
                continue                                    # rendered inside a scope
            for term in self.atoms_of(iid):
                self.add(term, r["t"], iid)
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
