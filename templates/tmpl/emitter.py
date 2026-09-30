"""Deterministic emitter: template instance records -> logic statements.

Everything a parser used to decide by hand and that is mechanically decidable lives here:
symbols, witness numbers, truth values, proof names, operator nesting (P06) and projection (P05).
Same records in, byte-identical statements out. No clock, no randomness, no set iteration.

Nesting order implemented (registry P06, all six corners ruled 2026-09-29):
  0 referent atoms      typing / Name / decomposition / group / count / possession
  1 predication         event class + roles, copular atom, relation atom; a sealed proposition is a
                        TERM in the attitude's Theme slot, not a wrapper
  2 attachments         status, times, ordering            (inside whatever layer 3 builds)
  3 denial bundle       one strength-0 (And ...) per denied eventuality; copular = strength 0 on
                        the (tense-wrapped) atom, several copular atoms bundled together
  5 rules               Implication; a denied rule is strength 0 on the rule
  6 link atoms          connectives: top-level, positive whatever the endpoints' polarity
"""
from __future__ import annotations

import re
import unicodedata

from . import records as R

DEFAULT_STV = (1.0, 0.99)
ENTITY = ("E01", "E02", "E03")
EVENTLIKE = ("V01", "V02", "V05")
COPULAR = ("C01", "C14", "D01", "M01")
PREDICATION = EVENTLIKE + COPULAR + ("C02",)
RULE = ("R01", "R03")
TOP = ("top",)


class EmitError(Exception):
    """Records failed the R-checks, or a composition the emitter cannot render."""


class Str(str):
    """A string-literal leaf (rendered with double quotes)."""


def fmt_num(v) -> str:
    if isinstance(v, bool):
        raise EmitError("boolean where a number was expected")
    return str(v) if isinstance(v, int) else repr(float(v))


def render(term) -> str:
    if isinstance(term, Str):
        return '"' + str(term).replace("\\", "\\\\").replace('"', '\\"') + '"'
    if isinstance(term, (int, float)) and not isinstance(term, bool):
        return fmt_num(term)
    if isinstance(term, str):
        return term
    return "(" + " ".join(render(t) for t in term) + ")"


def camel(words: str) -> str:
    """'next to' -> 'NextTo', 'as a result' -> 'AsAResult'."""
    return "".join(w[:1].upper() + w[1:].lower() for w in re.split(r"[\s\-]+", words.strip()) if w)


def name_symbol(name: str, title: str | None = None) -> str:
    s = name[len(title):] if title and name.startswith(title) else name
    s = unicodedata.normalize("NFKD", s).encode("ascii", "ignore").decode("ascii").lower()
    s = re.sub(r"[^a-z0-9]+", "_", s).strip("_")
    if not s:
        raise EmitError(f"name {name!r} yields an empty symbol")
    return "addr_" + s if s[0].isdigit() else s


def _slug(text: str) -> str:
    return re.sub(r"[^a-z0-9]+", "_", text.lower()).strip("_") or "x"


class _Emitter:
    def __init__(self, item: dict, reg: dict):
        self.item, self.reg, self.P = item, reg, reg["params"]
        self.insts = item["instances"]
        self.by_id = {r["id"]: r for r in self.insts if "id" in r}
        self.order = {r["id"]: i for i, r in enumerate(self.insts) if "id" in r}
        self.sym: dict[str, str] = {}
        self.out: list[dict] = []
        self.losses: list[dict] = []
        self.derived: dict[str, int] = {}
        self._names: dict[str, int] = {}

    # ------------------------------------------------------------------ symbols
    def _assign_symbols(self):
        named: dict[str, list[str]] = {}
        for r in self.insts:
            if r["t"] == "E01":
                named.setdefault(name_symbol(r["name"], r.get("title")), []).append(r["id"])
        for s in named:                                   # insertion order = instance order
            ids = named[s]
            for k, i in enumerate(ids, 1):
                self.sym[i] = s if len(ids) == 1 else f"{s}_{k}"
        counters: dict[str, int] = {}

        def wit(stem):
            counters[stem] = counters.get(stem, 0) + 1
            return f"sk_{stem}_{counters[stem]}"

        for r in self.insts:
            t = r["t"]
            if t == "E02":
                self.sym[r["id"]] = wit(r["kind"])
            elif t == "E03":
                self.sym[r["id"]] = wit(r.get("collective") or "group")
            elif t in ("V01", "V05"):
                self.sym[r["id"]] = wit(r["verb"])
            elif t == "V02":
                self.sym[r["id"]] = wit(r["prop"])

    def fill(self, v):
        if R.is_ref(v):
            return self.sym[v[1:]]
        return v

    def _bare(self, v):
        if not R.is_ref(v) and v not in self.P.get("constants", []):
            self.derived["E04"] = self.derived.get("E04", 0) + 1

    # ------------------------------------------------------------------ indexing
    def _index(self):
        self.status: dict[str, list[dict]] = {}
        self.times: dict[str, list] = {}
        self.orders: list[dict] = []
        self.links: list[dict] = []
        self.ors: dict[str, list[tuple[int, dict]]] = {}
        self.prop_ors: list[tuple[int, dict]] = []
        self.sealed_in: dict[str, str] = {}
        self.denied: dict[str, int] = {}
        self.o3: dict[int, dict] = {}
        for idx, r in enumerate(self.insts):
            t = r["t"]
            if t == "O01":
                self.status.setdefault(r["on"][1:], []).append(r)
            elif t == "T01":
                for key in self.P["time_term_keys"]:
                    if key in r["terms"]:
                        self.times.setdefault(r["on"][1:], []).append([key, r["terms"][key]])
            elif t == "T02":
                self.times.setdefault(r["on"][1:], []).append(r["const"])
            elif t == "T08":
                self.orders.append(r)
            elif t == "L01":
                self.links.append(r)
            elif t == "J01":
                if "event" in r:
                    self.ors.setdefault(r["event"][1:], []).append((idx, r))
                else:
                    self.prop_ors.append((idx, r))
            elif t == "V05":
                for c in r["content"]:
                    self.sealed_in[c[1:]] = r["id"]
            elif t == "O03":
                self.o3[idx] = r
                for c in r["over"]:
                    self.denied[c[1:]] = idx

    def container(self, pid: str):
        if pid in self.sealed_in:
            return ("seal", self.sealed_in[pid])
        if pid in self.denied:
            return ("deny", self.denied[pid])
        return TOP

    def _placement(self, endpoints, allow_bundle: bool):
        """Where a relation between eventualities lives: top / a seal / a denial bundle / lost."""
        pids = [e[1:] for e in endpoints if R.is_ref(e) and self.by_id[e[1:]]["t"] in EVENTLIKE]
        sealed = [p for p in pids if p in self.sealed_in]
        if sealed:
            seals = sorted({self.sealed_in[p] for p in sealed})
            if len(seals) == 1 and len(sealed) == len(pids):
                return ("seal", seals[0])
            return ("lost",)
        if allow_bundle:
            den = sorted((p for p in pids if p in self.denied), key=lambda p: self.order[p])
            if den:
                return ("bundle", den[0])
        return TOP

    def _entity_refs(self):
        """entity id -> the containers of everything that mentions it."""
        refs: dict[str, list] = {}
        self.ref_pids: dict[str, list] = {}
        current = [None]

        def add(v, where):
            if R.is_ref(v) and self.by_id[v[1:]]["t"] in ENTITY:
                refs.setdefault(v[1:], []).append(where)
                if current[0] is not None:
                    self.ref_pids.setdefault(v[1:], []).append(current[0])

        for idx, r in enumerate(self.insts):
            t = r["t"]
            current[0] = None
            if t in PREDICATION:
                where = self.container(r["id"])
                current[0] = r["id"]
                for vals in r.get("roles", {}).values():
                    for v in (vals if isinstance(vals, list) else [vals]):
                        add(v, where)
                for ob in r.get("obliques", []):
                    add(ob["obj"], where)
                for key in ("subj", "entity", "place", "x", "y", "holder"):
                    if key in r:
                        add(r[key], where)
            elif t in RULE:
                for vals in r.get("roles", {}).values():
                    for v in (vals if isinstance(vals, list) else [vals]):
                        add(v, TOP)
                for ob in r.get("obliques", []):
                    add(ob["obj"], TOP)
                if "group" in r:
                    add(r["group"], TOP)
            elif t == "J01":
                if "event" in r:
                    current[0] = r["event"][1:]
                    for v in r["alts"]:
                        add(v, ("or", idx))
                else:
                    add(r["subj"], TOP)
            elif t == "T08":
                place = self._placement([r["earlier"], r["later"]], allow_bundle=True)
                where = TOP
                if place[0] == "seal":
                    where = place
                elif place[0] == "bundle":
                    where = ("deny", self.denied[place[1]])
                add(r["earlier"], where)
                add(r["later"], where)
            elif t == "E03":
                for m in r.get("members", []):
                    add(m, TOP)
        self.refs = refs

    def home(self, eid: str):
        r = self.by_id[eid]
        if r["t"] == "E01" or r.get("def"):
            return TOP
        refs = self.refs.get(eid, [])
        if refs and refs[0] != TOP and all(c == refs[0] for c in refs):
            return refs[0]
        return TOP

    def e08_home(self, rec: dict):
        pid = rec["possessed"][1:]
        refs = self.refs.get(pid, [])
        if refs and refs[0][0] == "seal" and all(c == refs[0] for c in refs):
            return refs[0]                       # a link stated only inside a seal stays sealed
        h = self.home(pid)
        return h if h[0] in ("deny", "or") else TOP

    # ------------------------------------------------------------------ referent atoms
    def _referent_parts(self):
        """container -> [(term, owner, inst, tag)] for typing / group / count / possession."""
        homed: dict[tuple, list] = {}
        counts = {r["group"][1:]: r for r in self.insts if r["t"] == "N01"}
        for r in self.insts:
            t = r["t"]
            if t == "E02":
                s, h = self.sym[r["id"]], self.home(r["id"])
                parts = [(["Member", s, r["kind"]], "E02", r["id"], "kind")]
                parts += [(["Member", s, p], "E02", r["id"], "is_" + p) for p in r.get("props", [])]
                homed.setdefault(h, []).extend(parts)
            elif t == "E03":
                s, h = self.sym[r["id"]], self.home(r["id"])
                parts = []
                if r.get("collective"):
                    parts.append((["Member", s, r["collective"]], "E03", r["id"], "kind"))
                if r.get("kind"):
                    parts.append((["GroupOf", s, r["kind"]], "E03", r["id"], "groupof"))
                for m in r.get("members", []):
                    parts.append((["PartOf", self.sym[m[1:]], s], "E03", r["id"],
                                  "member_" + m[1:]))
                if r["id"] in counts:
                    parts.append((["Cardinality", s, counts[r["id"]]["n"]], "N01", r["id"], "count"))
                homed.setdefault(h, []).extend(parts)
            elif t == "E08":
                h = self.e08_home(r)
                homed.setdefault(h, []).append(
                    (["Possession", self.sym[r["possessed"][1:]], self.sym[r["possessor"][1:]]],
                     "E08", r["possessed"][1:], "of_" + r["possessor"][1:]))
        self.homed = homed

    # ------------------------------------------------------------------ predications
    def _status_atoms(self, pid: str, target):
        """Status as separate atoms on an eventuality symbol / function term."""
        parts = []
        for st in self.status.get(pid, []):
            stv = DEFAULT_STV
            if st["head"] in self.P["epistemic_heads"]:
                stv = (1.0, 0.9)
            if st.get("word") == "should":
                stv = (0.7, 0.99)
            parts.append({"term": [st["head"], target], "owner": "O01", "tag": st["head"].lower(),
                          "stv": stv})
        return parts

    def _wrap(self, pid: str, atom):
        """Status as wrappers around a copular atom; returns (term, stv)."""
        stv = DEFAULT_STV
        for st in self.status.get(pid, []):
            atom = [st["head"], atom]
            if st["head"] in self.P["epistemic_heads"]:
                stv = (1.0, 0.9)
            if st.get("word") == "should":
                stv = (0.7, 0.99)
        return atom, stv

    def _time_atoms(self, pid: str, target):
        return [{"term": ["Time", target, t], "owner": "T01" if isinstance(t, list) else "T02",
                 "tag": "time_" + _slug(render(t)), "stv": DEFAULT_STV}
                for t in self.times.get(pid, [])]

    def _role_atoms(self, r: dict, target, owner: str):
        parts = []
        roles = r.get("roles", {})
        for role in self.P["roles"]:
            if role not in roles:
                continue
            vals = roles[role] if isinstance(roles[role], list) else [roles[role]]
            for k, v in enumerate(vals):
                if role not in self.P["lexical_roles"]:
                    self._bare(v)
                parts.append({"term": [role, target, self.fill(v)], "owner": owner,
                              "tag": role.lower() + ("" if len(vals) == 1 else str(k + 1)),
                              "stv": DEFAULT_STV})
        for k, ob in enumerate(r.get("obliques", [])):
            self._bare(ob["obj"])
            parts.append({"term": [camel(ob["prep"]), target, self.fill(ob["obj"])], "owner": owner,
                          "tag": "obl_" + _slug(ob["prep"]), "stv": DEFAULT_STV})
        return parts

    def _or_term(self, idx: int, j: dict, target):
        branches = []
        homed = {}
        for term, _o, inst, _t in self.homed.get(("or", idx), []):
            homed.setdefault(inst, []).append(term)
        for v in j["alts"]:
            self._bare(v)
            atom = [j["role"], target, self.fill(v)]
            extra = homed.get(v[1:], []) if R.is_ref(v) else []
            branches.append(["And", atom] + extra if extra else atom)
        return ["Or"] + branches

    def parts(self, pid: str):
        """All atoms of one predication with its attachments (layers 1-2)."""
        r = self.by_id[pid]
        t = r["t"]
        if t == "V01":
            e = self.sym[pid]
            ps = [{"term": ["Member", e, r["verb"]], "owner": "V01", "tag": "class",
                   "stv": DEFAULT_STV}]
            ps += self._role_atoms(r, e, "V01")
            for idx, j in self.ors.get(pid, []):
                ps.append({"term": self._or_term(idx, j, e), "owner": "J01", "tag": "or",
                           "stv": DEFAULT_STV})
            return ps + self._status_atoms(pid, e) + self._time_atoms(pid, e)
        if t == "V02":
            s, subj = self.sym[pid], self.fill(r["subj"])
            key = "T14" if r["trigger"] == "time" else "L04"
            self.derived[key] = self.derived.get(key, 0) + 1
            ps = [{"term": ["Member", s, r["prop"]], "owner": "V02", "tag": "state",
                   "stv": DEFAULT_STV},
                  {"term": ["Experiencer", s, subj], "owner": "V02", "tag": "experiencer",
                   "stv": DEFAULT_STV}]
            ps += self._status_atoms(pid, s) + self._time_atoms(pid, s)
            flat, stv = self._wrap(pid, ["Member", subj, r["prop"]])
            ps.append({"term": flat, "owner": "V02", "tag": "flat", "stv": stv, "flat": True})
            return ps
        if t == "V05":
            e = self.sym[pid]
            ps = [{"term": ["Member", e, r["verb"]], "owner": "V05", "tag": "class",
                   "stv": DEFAULT_STV},
                  {"term": ["Experiencer", e, self.fill(r["holder"])], "owner": "V05",
                   "tag": "experiencer", "stv": DEFAULT_STV}]
            sealed = self.seal_term(pid)
            if sealed is not None:
                ps.append({"term": ["Theme", e, sealed], "owner": "V05", "tag": "theme",
                           "stv": DEFAULT_STV})
            return ps + self._status_atoms(pid, e) + self._time_atoms(pid, e)
        if t == "C01":
            atom = ["Member", self.fill(r["subj"]), r["pred"]]
        elif t == "C14":
            self._bare(r["place"])
            head = "LocatedIn" if r["prep"] in self.P["containment_preps"] else camel(r["prep"])
            atom = [head, self.fill(r["entity"]), self.fill(r["place"])]
        elif t == "D01":
            self._bare(r["x"])
            self._bare(r["y"])
            x, y = self.fill(r["x"]), self.fill(r["y"])
            if r.get("less"):
                x, y = y, x
            atom = ["More", r["scale"], x, y]
        elif t == "M01":
            atom = ["Measure", self.fill(r["entity"]), r["scale"], r["n"], r["unit"]]
        elif t == "C02":
            s, c = self._kind_stv(r)
            return [{"term": ["Inheritance", r["subj"], r["pred"]], "owner": "C02", "tag": "is",
                     "stv": (s, c)}]
        else:  # pragma: no cover
            raise EmitError(f"no predication renderer for {t}")
        term, stv = self._wrap(pid, atom)
        if t == "D01" and not R.is_ref(r["x"]) and not R.is_ref(r["y"]) and stv == DEFAULT_STV:
            stv = (1.0, 0.9)                     # the dial reaches every kind-level claim
        return [{"term": term, "owner": t, "tag": "is", "stv": stv}]

    def _kind_stv(self, r: dict):
        P = self.P
        conf = 0.99 if r["dial"] == "definitional" else 0.9
        if "qword" in r:
            return P["strength_by_qword"][r["qword"]], conf
        if r.get("striking"):
            return P["striking_strength"], conf
        if r["dial"] == "definitional":
            return 1.0, conf
        return P["bare_generic_strength"], conf

    def seal_term(self, vid: str):
        v = self.by_id[vid]
        atoms, kept = [], set()
        for c in v["content"]:
            pid = c[1:]
            if pid in self.denied:               # no polarity inside a seal (registered G05)
                self.losses.append({"code": "G05", "detail": f"negated content @{pid} of @{vid} "
                                    "dropped: no polarity carrier inside a seal"})
                continue
            kept.add(pid)
            for p in self.parts(pid):
                if p["stv"] != DEFAULT_STV:
                    self.losses.append({"code": "G12", "detail": f"sealed @{pid}: truth value "
                                        f"{p['stv']} of {render(p['term'])} is not carried"})
                atoms.append(p["term"])
        if not atoms:
            return None                          # wholly negative complement: no Theme at all
        for term, _o, inst, _t in self.homed.get(("seal", vid), []):
            if any(p in kept for p in self.ref_pids.get(inst, [])):
                atoms.append(term)               # typing survives only with a kept predication
        atoms += [t for place, t in self._relations if place == ("seal", vid)]
        return atoms[0] if len(atoms) == 1 else ["And"] + atoms

    # ------------------------------------------------------------------ relations
    def _relation_terms(self):
        rel = []
        for r in self.orders:
            a, b = self.fill(r["earlier"]), self.fill(r["later"])
            term = (["BeforeBy", a, b, r["gap"]["n"], r["gap"]["unit"]] if "gap" in r
                    else ["Before", a, b])
            place = self._placement([r["earlier"], r["later"]], allow_bundle=True)
            if place[0] == "lost":
                self.losses.append({"code": "SEAL", "detail": f"{render(term)} dropped: an "
                                    "ordering never crosses a seal boundary"})
                continue
            rel.append((place, term))
        self._relations = rel
        self._links = []
        for r in self.links:
            term = [camel(r["connective"]), self.sym[r["main"][1:]], self.sym[r["sub"][1:]]]
            place = self._placement([r["main"], r["sub"]], allow_bundle=False)
            if place[0] == "lost":
                self.losses.append({"code": "SEAL", "detail": f"{render(term)} dropped: a "
                                    "connective never crosses a seal boundary"})
                continue
            if place[0] == "seal":
                if r.get("denied"):
                    self.losses.append({"code": "G05", "detail": f"denied {render(term)} inside "
                                        "a seal dropped"})
                else:
                    self._relations.append((place, term))
                continue
            self._links.append((term, (0.0, 0.99) if r.get("denied") else DEFAULT_STV, r))

    # ------------------------------------------------------------------ output
    def _add(self, term, stv, owner, inst, tag):
        base = _slug(f"{inst}_{tag}")
        n = self._names.get(base, 0) + 1
        self._names[base] = n
        name = base if n == 1 else f"{base}_{n}"
        self.out.append({"name": name, "term": term, "stv": stv, "owner": owner, "inst": inst,
                         "text": f"(: {name} {render(term)} (STV {fmt_num(stv[0])} "
                                 f"{fmt_num(stv[1])}))"})

    def _bundle(self, terms):
        return terms[0] if len(terms) == 1 else ["And"] + terms

    def _emit_denial(self, idx: int):
        o = self.o3[idx]
        # sealed content is the seal's business (dropped there, G05): it never reaches top level
        targets = [c[1:] for c in o["over"] if c[1:] not in self.sealed_in]
        if not targets:
            return
        kinds = [self.by_id[p]["t"] for p in targets]
        extra = [term for term, _o, _i, _t in self.homed.get(("deny", idx), [])]
        if all(k in COPULAR for k in kinds):
            terms = [self.parts(p)[0]["term"] for p in targets]
            # corner 2: tense wraps each atom, the denial bundles the wrapped atoms
            self._add(self._bundle(terms), (0.0, 0.99), "O03", targets[0], "not")
            for term, owner, inst, tag in self.homed.get(("deny", idx), []):
                self._add(term, DEFAULT_STV, owner, inst, tag)      # typing stays top-level
            return
        first_event = True
        for p, k in zip(targets, kinds):
            if k == "C02":
                part = self.parts(p)[0]
                self._add(part["term"], (0.0, part["stv"][1]), "O03", p, "not")
            elif k in EVENTLIKE:
                ps = self.parts(p)
                terms = [x["term"] for x in ps if not x.get("flat")]
                terms += [t for place, t in self._relations if place == ("bundle", p)]
                if first_event:
                    terms += extra
                    first_event = False
                self._add(self._bundle(terms), (0.0, 0.99), "O03", p, "not")
                for x in ps:
                    if x.get("flat"):
                        self._add(x["term"], (0.0, 0.99), "O03", p, "not_flat")
            # rules are emitted with the other rules (strength 0 there)

    def _emit_rule(self, r: dict):
        P = self.P
        verbal = "verb" in r
        if r["t"] == "R01":
            prem = [["Member", "$x", r["kind"]]] + [["Member", "$x", a] for a in r.get("restrict", [])]
            premise = self._bundle(prem)
            range_kind = r["kind"]
            conf = 0.99 if r["dial"] == "definitional" else 0.9
            strength, _ = self._kind_stv(r)
        else:
            g = self.by_id[r["group"][1:]]
            premise = ["PartOf", "$x", self.sym[r["group"][1:]]]
            range_kind = g.get("collective") or g.get("kind")
            conf = 0.9
            strength = P["strength_by_qword"][r["qword"]] if "qword" in r else 1.0
        if verbal:
            fn = ["sk_" + r["verb"], "$x"]
            cons = [["Member", fn, r["verb"]], [r["subj_role"], fn, "$x"]]
            cons += [p["term"] for p in self._role_atoms(r, fn, r["t"])]
            cons += [[h, fn] for h in r.get("status", [])]
            consequent = ["And"] + cons
            what = r["verb"]
        else:
            consequent = ["Member", "$x", r["prop"]]
            for h in r.get("status", []):
                consequent = [h, consequent]
            what = r["prop"]
        if r["id"] in self.denied:
            strength = 0.0
        if strength == 0.0:
            self.derived["R02"] = self.derived.get("R02", 0) + 1
        self._add(["Implication", premise, consequent], (strength, conf), r["t"], r["id"], "rule")
        if "qword" in r:
            self.derived["C03"] = self.derived.get("C03", 0) + 1
            self._add(["QuantifierPhrase", range_kind, what, Str(r["qword"])], DEFAULT_STV,
                      "C03", r["id"], "q")

    def run(self) -> dict:
        self._assign_symbols()
        self._index()
        self._entity_refs()
        self._referent_parts()
        self._relation_terms()
        # layer 0 -- referents
        for r in self.insts:
            if r["t"] == "E01":
                s = self.sym[r["id"]]
                self._add(["Name", s, Str(r["name"])], DEFAULT_STV, "E01", r["id"], "name")
                if r.get("kind"):
                    self._add(["Member", s, r["kind"]], DEFAULT_STV, "E01", r["id"], "kind")
            elif r["t"] == "E05":
                self._add(["Inheritance", r["compound"], r["head"]], DEFAULT_STV, "E05",
                          r["compound"], "genus")
                if r.get("mod"):
                    self._add(["Inheritance", r["compound"], r["mod"]], DEFAULT_STV, "E05",
                              r["compound"], "mod")
        for term, owner, inst, tag in self.homed.get(TOP, []):
            self._add(term, DEFAULT_STV, owner, inst, tag)
        # layers 1-3 -- predications, with their denials
        done = set()
        for r in self.insts:
            if r["t"] not in PREDICATION or r["id"] in self.sealed_in:
                continue
            pid = r["id"]
            if pid in self.denied:
                if self.denied[pid] not in done:
                    done.add(self.denied[pid])
                    self._emit_denial(self.denied[pid])
                continue
            ps = self.parts(pid)
            if pid in self.ors:                               # one (And ...) fact holds the Or
                self._add(["And"] + [p["term"] for p in ps], DEFAULT_STV, "J01", pid, "or")
                continue
            for p in ps:
                self._add(p["term"], p["stv"], p["owner"], pid, p["tag"])
            if r["t"] == "C02" and "qword" in r:
                self.derived["C03"] = self.derived.get("C03", 0) + 1
                self._add(["QuantifierPhrase", r["subj"], r["pred"], Str(r["qword"])], DEFAULT_STV,
                          "C03", pid, "q")
        for idx in sorted(self.o3):                           # denials that hold only rules/C02
            if idx not in done and any(self.by_id[c[1:]]["t"] in PREDICATION
                                       for c in self.o3[idx]["over"]):
                done.add(idx)
                self._emit_denial(idx)
        for pid, r in self.by_id.items():                     # a denied C02 keeps its companion
            if r["t"] == "C02" and pid in self.denied and "qword" in r and pid not in self.sealed_in:
                self._add(["QuantifierPhrase", r["subj"], r["pred"], Str(r["qword"])], DEFAULT_STV,
                          "C03", pid, "q")
        for idx, j in self.prop_ors:
            subj = self.fill(j["subj"])
            self._add(["Or"] + [["Member", subj, p] for p in j["props"]], DEFAULT_STV, "J01",
                      j["subj"][1:], "or")
        # layer 5 -- rules
        for r in self.insts:
            if r["t"] in RULE:
                self._emit_rule(r)
        # layers 2 / 6 -- top-level orderings and links
        for place, term in self._relations:
            if place == TOP:
                self._add(term, DEFAULT_STV, "T08", "order", _slug(render(term))[:40])
        for term, stv, r in self._links:
            self._add(term, stv, "L01", r["main"][1:], _slug(r["connective"]))
        fired: dict[str, int] = {}
        for r in self.insts:
            fired[r["t"]] = fired.get(r["t"], 0) + 1
        return {"id": self.item["id"],
                "statements": [s["text"] for s in self.out],
                "detail": [{k: (render(v) if k == "term" else v) for k, v in s.items()
                            if k != "text"} for s in self.out],
                "fired": {k: fired[k] for k in sorted(fired)},
                "derived": {k: self.derived[k] for k in sorted(self.derived)},
                "losses": self.losses,
                "unmapped": self.item["unmapped"]}


def emit(item: dict, reg: dict) -> dict:
    """Records -> statements. Raises EmitError when the records fail the R-checks."""
    res = R.validate(item, reg)
    if not res["ok"]:
        raise EmitError(res["findings"])
    return _Emitter(item, reg).run()
