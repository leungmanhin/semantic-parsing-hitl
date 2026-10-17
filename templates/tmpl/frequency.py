"""Frequency pass: which verb classes and constructions the parsed corpora contain, and how much
of that the catalog's templates already claim.

Sources (no model calls):

* the MINING SUBSTRATE — the records listed in ``fusenf/mining/mining_substrate.json`` (the
  held-out tiers are outside it by construction), resolved to their statements in
  ``fusenf/parses/*.parses.jsonl``;
* the GOLDENS — the statement cases of ``regression/regression_cases.md`` (context and query
  sections excluded).

Counting.  Every statement is parsed; a symbol is an EVENT when it stands first in a role atom
or under a tense / aspect tag; the class of ``(Member <event> <lemma>)`` is the verb lemma.  An
event whose only core role is Experiencer is a STATIVE predication (the reified copular form of
the earlier instruction set: "the bridge is unsafe"), and its lemma is an adjective or a noun,
not a verb; those are reported apart, since they belong to a copular template.  A
lemma is CLAIMED by a template when it is in the template's ``trigger.verbs`` or is the verb of
one of its examples.  The uncovered lemmas are grouped by a rough class guess from word lists
(motion, change of state, creation, …) so the next templates can be ranked by payoff; the
guess is a hint for review, not a decision.  Statement heads are counted by substrate kind as
the construction profile, since not every template is a verb class.

    python -m tmpl.frequency            (from templates/)  ->  FREQUENCY.md + a summary
"""
from __future__ import annotations

import collections
import glob
import json
import os
import re
import sys

from . import catalog as CAT, typecheck as T

TEMPLATES = os.path.dirname(CAT.CATALOG_DIR)
REPO = os.path.dirname(TEMPLATES)
SUBSTRATE = os.path.join(REPO, "fusenf", "mining", "mining_substrate.json")
PARSES = os.path.join(REPO, "fusenf", "parses", "*.parses.jsonl")
GOLDENS = os.path.join(REPO, "regression", "regression_cases.md")
OUT = os.path.join(TEMPLATES, "FREQUENCY.md")

HEADER_RE = re.compile(r"^\*\*\[(?P<tag>[^\]]+)\]\s*(?P<text>.*?)\*\*(?P<rest>.*)$")
EXCLUDED_SECTIONS = ("Context input", "Queries")

#: rough class guesses for uncovered lemmas (review hints, not decisions)
CLASS_HINTS = {
    "motion": """go come arrive leave move travel walk run enter exit return fall rise climb drive fly
                 cross depart reach descend ascend wander march sail swim ride jump step pass follow
                 approach escape flee visit head set_off set_out go_out come_back go_back""",
    "change-of-state": """break melt die grow become open close dry freeze collapse fail stop start end begin
                 finish turn change burn crack shrink expand improve worsen heal recover rot fade darken
                 brighten warm cool thaw boil shatter decay wither bloom sink split tear wear_out""",
    "creation": """build make write paint bake create produce draw compose design construct carve knit sew
                 form invent develop found establish assemble forge print publish record""",
    "existence-aspect": """exist remain stay last continue persist occur happen take_place appear disappear
                 emerge vanish survive live reside dwell""",
    "cognition": """know think believe remember forget understand learn realize consider decide wonder
                 doubt expect assume suppose guess recall imagine plan intend mean""",
    "speech": """say tell ask answer reply claim announce declare explain mention report state argue
                 complain promise warn insist suggest propose call name describe""",
    "social": """meet marry join visit invite thank greet welcome help support defend protect attack fight
                 compete win lose beat defeat vote elect appoint hire fire employ""",
    "copular-stative": """be seem look appear sound feel resemble weigh measure cost equal contain include
                 consist comprise belong depend concern involve require need deserve""",
}
HINTS = {w: cls for cls, words in CLASS_HINTS.items() for w in words.split()}


# --------------------------------------------------------------------------
# sources
# --------------------------------------------------------------------------


def substrate_records() -> list[dict]:
    with open(SUBSTRATE, encoding="utf-8") as fh:
        sub = json.load(fh)
    wanted = {(r["id"], r["run"]) for r in sub["included"]}
    index: dict[tuple, list] = {}
    for path in sorted(glob.glob(PARSES)):
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                if not line.strip():
                    continue
                r = json.loads(line)
                key = (r.get("id"), r.get("run"))
                if key in wanted and key not in index:
                    index[key] = r.get("statements") or []
    missing = sorted(k for k in wanted if k not in index)
    return [{"id": f"{i}#r{run}", "statements": index[(i, run)]} for i, run in sorted(wanted) if (i, run) in index], missing


def golden_records() -> list[dict]:
    sys.path.insert(0, os.path.join(REPO, "fusenf", "harness"))
    import records as HR  # noqa: E402  (harness record helpers)

    with open(GOLDENS, encoding="utf-8") as fh:
        lines = fh.read().split("\n")
    cases, cur, section = [], None, None
    for line in lines:
        if line.startswith("## "):
            section, cur = line[3:].strip(), None
            continue
        m = HEADER_RE.match(line)
        if m:
            cur = {"tag": m["tag"], "text": m["text"].strip(), "section": section, "block": []}
            cases.append(cur)
        elif cur is not None and (line.startswith("    ") or line.startswith("\t")):
            cur["block"].append(line)
    out = []
    for c in cases:
        if any((c["section"] or "").startswith(s) for s in EXCLUDED_SECTIONS):
            continue
        atoms, _log = HR.extract_atoms("\n".join(c["block"]))
        if not atoms or any(re.match(r"^\(:\s+\$", a) for a in atoms):
            continue
        out.append({"id": c["tag"], "statements": atoms, "section": c["section"]})
    return out


# --------------------------------------------------------------------------
# counting
# --------------------------------------------------------------------------


CORE_ROLES = {"Agent", "Patient", "Theme", "Stimulus", "Recipient", "Source", "Goal", "Holder",
              "Instrument", "CoAgent", "Beneficiary"}


class Counts:
    def __init__(self, heads: dict, claimed: dict | None = None):
        self.heads = heads
        self.claimed = claimed or {}
        self.role_heads = {h for h, e in heads.items() if e.get("kind") == "role"}
        self.tag_heads = {h for h, e in heads.items() if e.get("kind") == "temporal" and e.get("arity") == 1}
        self.lemma_mentions = collections.Counter()
        self.stative_mentions = collections.Counter()
        self.lemma_records = collections.Counter()
        self.records_fully_claimed = 0
        self.head_statements = collections.Counter()
        self.kind_statements = collections.Counter()
        self.member_split = collections.Counter()
        self.records = self.statements = self.bad = 0
        self.records_with_event = 0

    def add_record(self, statements: list[str]) -> None:
        self.records += 1
        atoms = []
        for st in statements:
            try:
                name, atom = T.split_statement(st)
            except ValueError:
                self.bad += 1
                continue
            atoms.append(atom)
        self.statements += len(atoms)
        events: set[str] = set()
        roles: dict[str, set] = collections.defaultdict(set)

        def scan(expr):
            if not isinstance(expr, list) or not expr:
                return
            head = expr[0]
            if isinstance(head, str) and len(expr) >= 2:
                if head in self.role_heads or head in self.tag_heads:
                    sym = T.render(expr[1])
                    events.add(sym)
                    if head in self.role_heads:
                        roles[sym].add(head)
            for x in expr[1:]:
                scan(x)

        for a in atoms:
            scan(a)
        self._roles = roles
        seen: set[str] = set()
        for a in atoms:
            head = a[0] if isinstance(a, list) and a else str(a)
            self.head_statements[head] += 1
            self.kind_statements[(self.heads.get(head) or {}).get("kind", "unknown")] += 1
            if isinstance(a, list) and head == "Member" and len(a) == 3:
                sym, cls = T.render(a[1]), T.render(a[2])
                if sym in events:
                    self.member_split["event (verb lemma)"] += 1
                    self._count(sym, cls, seen)
                else:
                    self.member_split["kind or property"] += 1
            for sym, lemma in self._nested_event_lemmas(a, events):
                self._count(sym, lemma, seen)
        for lemma in seen:
            self.lemma_records[lemma] += 1
        if seen:
            self.records_with_event += 1
            if all(l in self.claimed for l in seen):
                self.records_fully_claimed += 1

    def _count(self, sym: str, lemma: str, seen: set) -> None:
        self.lemma_mentions[lemma] += 1
        seen.add(lemma)
        if not (self._roles.get(sym, set()) & CORE_ROLES):
            self.stative_mentions[lemma] += 1

    def _nested_event_lemmas(self, atom, events):
        """Member atoms on events nested under scope operators and bundles."""
        out = []

        def walk(expr, depth):
            if not isinstance(expr, list) or not expr:
                return
            if depth > 0 and expr[0] == "Member" and len(expr) == 3 and T.render(expr[1]) in events:
                out.append((T.render(expr[1]), T.render(expr[2])))
            for x in expr[1:]:
                walk(x, depth + 1)

        walk(atom, 0)
        return out


def claimed_lemmas(catalog: dict) -> dict[str, str]:
    """lemma -> template id, from the trigger verb lists and the examples' verbs."""
    out: dict[str, str] = {}
    for tid, t in catalog.items():
        for v in (t.get("trigger") or {}).get("verbs") or []:
            out.setdefault(str(v), tid)
        for section in ("shown", "held_out"):
            for ex in (t.get("examples") or {}).get(section) or []:
                for r in ex.get("instances") or []:
                    if r.get("t") == tid and r.get("verb"):
                        out.setdefault(str(r["verb"]), tid)
    return out


# --------------------------------------------------------------------------
# report
# --------------------------------------------------------------------------


def report(sub: Counts, gold: Counts, claimed: dict[str, str], missing: list, catalog: dict) -> str:
    L: list[str] = []
    add = L.append
    add("# Frequency pass — verb classes and constructions in the parsed corpora")
    add("")
    add("Generated by `python -m tmpl.frequency`; never edited by hand. Counts are over the mining "
        "substrate (the held-out tiers are outside it) and the goldens' statement cases. A lemma is "
        "claimed when a live template lists it or uses it in an example. Class guesses for uncovered "
        "lemmas come from word lists and are hints for review.")
    add("")
    add("## Sources")
    add("")
    add("| source | records | statements | records with an event | distinct lemmas | event mentions | of which stative |")
    add("|---|---|---|---|---|---|---|")
    for name, c in (("mining substrate", sub), ("goldens", gold)):
        add(f"| {name} | {c.records:,} | {c.statements:,} | {c.records_with_event:,} | {len(c.lemma_mentions):,} | "
            f"{sum(c.lemma_mentions.values()):,} | {sum(c.stative_mentions.values()):,} |")
    add("")
    add("A stative mention is an event with no core role other than Experiencer: mostly the reified copular "
        "form (\"the bridge is unsafe\" as a state with lemma `unsafe`, an adjective or a noun, which belongs to a "
        "copular template rather than a verb class), plus bare intransitives (happen, rain) with no participant "
        "role at all.")
    if missing:
        add("")
        add(f"Substrate records whose parse file was not found: {len(missing)}")
    add("")
    add("## Coverage by the live templates")
    add("")
    add("| source | claimed lemmas | event mentions claimed | verbal mentions claimed | records with an event whose every event is claimed |")
    add("|---|---|---|---|---|")
    for name, c in (("mining substrate", sub), ("goldens", gold)):
        mentions = sum(c.lemma_mentions.values())
        verbal = mentions - sum(c.stative_mentions.values())
        got = sum(n for l, n in c.lemma_mentions.items() if l in claimed)
        distinct = sum(1 for l in c.lemma_mentions if l in claimed)
        add(f"| {name} | {distinct} of {len(c.lemma_mentions)} | {got:,} of {mentions:,} ({got / mentions:.0%}) | "
            f"{got:,} of {verbal:,} ({got / verbal:.0%}) | {c.records_fully_claimed:,} of {c.records_with_event:,} |")
    add("")
    add("Per template (event mentions in the substrate · in the goldens):")
    add("")
    per: dict[str, list] = collections.defaultdict(list)
    for lemma, tid in claimed.items():
        n1, n2 = sub.lemma_mentions.get(lemma, 0), gold.lemma_mentions.get(lemma, 0)
        if n1 or n2:
            per[tid].append((n1 + n2, lemma, n1, n2))
    for tid in sorted(per, key=lambda t: -sum(x[0] for x in per[t])):
        rows = sorted(per[tid], reverse=True)
        add(f"- `{tid}`: {sum(r[2] for r in rows):,} · {sum(r[3] for r in rows):,} — " +
            ", ".join(f"{l} {n1}/{n2}" for _, l, n1, n2 in rows[:12]) + (" …" if len(rows) > 12 else ""))
    add("")
    add("## Uncovered verb lemmas, grouped by class guess")
    add("")
    unc = collections.Counter()
    unc_gold = collections.Counter()
    for l, n in sub.lemma_mentions.items():
        if l not in claimed:
            unc[l] += n
    for l, n in gold.lemma_mentions.items():
        if l not in claimed:
            unc_gold[l] += n
    by_class: dict[str, list] = collections.defaultdict(list)
    for l in set(unc) | set(unc_gold):
        stative = sub.stative_mentions.get(l, 0) + gold.stative_mentions.get(l, 0)
        if stative * 2 >= unc[l] + unc_gold[l]:
            cls = "no core role (copular states, bare intransitives)"
        else:
            cls = HINTS.get(l, "unclassified verbal")
        by_class[cls].append((unc[l] + unc_gold[l], l, unc[l], unc_gold[l]))
    add("| class guess | distinct lemmas | substrate mentions | golden mentions |")
    add("|---|---|---|---|")
    for cls in sorted(by_class, key=lambda c: -sum(x[2] + x[3] for x in by_class[c])):
        rows = by_class[cls]
        add(f"| {cls} | {len(rows)} | {sum(r[2] for r in rows):,} | {sum(r[3] for r in rows):,} |")
    add("")
    for cls in sorted(by_class, key=lambda c: -sum(x[2] + x[3] for x in by_class[c])):
        rows = sorted(by_class[cls], reverse=True)
        add(f"### {cls}")
        add("")
        add(", ".join(f"{l} {n1}/{n2}" for _, l, n1, n2 in rows[:40]) + (f" … ({len(rows) - 40} more)" if len(rows) > 40 else ""))
        add("")
    add("## Construction profile (statement heads)")
    add("")
    add("| substrate kind | substrate statements | golden statements |")
    add("|---|---|---|")
    kinds = sorted(set(sub.kind_statements) | set(gold.kind_statements),
                   key=lambda k: -(sub.kind_statements[k] + gold.kind_statements[k]))
    for k in kinds:
        add(f"| {k} | {sub.kind_statements[k]:,} | {gold.kind_statements[k]:,} |")
    add("")
    add("Member statements: " + ", ".join(f"{k} {sub.member_split[k]:,} / {gold.member_split[k]:,}" for k in sorted(sub.member_split)))
    add("")
    add("Top statement heads (substrate / goldens):")
    add("")
    heads = sorted(set(sub.head_statements) | set(gold.head_statements),
                   key=lambda h: -(sub.head_statements[h] + gold.head_statements[h]))
    add(", ".join(f"{h} {sub.head_statements[h]:,}/{gold.head_statements[h]:,}" for h in heads[:40]))
    add("")
    if sub.bad or gold.bad:
        add(f"Statements that did not parse: substrate {sub.bad}, goldens {gold.bad}")
        add("")
    return "\n".join(L).rstrip("\n") + "\n"


def main(argv=None) -> int:
    catalog = CAT.load()
    heads = T.load_substrate()["heads"]
    claimed = claimed_lemmas(catalog)
    sub_records, missing = substrate_records()
    gold_records = golden_records()
    sub, gold = Counts(heads, claimed), Counts(heads, claimed)
    for r in sub_records:
        sub.add_record(r["statements"])
    for r in gold_records:
        gold.add_record(r["statements"])
    text = report(sub, gold, claimed, missing, catalog)
    with open(OUT, "w", encoding="utf-8") as fh:
        fh.write(text)
    mentions = sum(sub.lemma_mentions.values())
    got = sum(n for l, n in sub.lemma_mentions.items() if l in claimed)
    print(f"substrate {sub.records:,} records / {sub.statements:,} statements · goldens {gold.records} cases / {gold.statements:,} statements · "
          f"claimed event mentions {got:,}/{mentions:,} ({got / mentions:.0%}) · wrote {os.path.relpath(OUT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
