"""Emitter tests: prompt.txt's own worked examples must come out canonically identical, and the
six P06 rulings (2026-09-29) must hold as code.

Run:  /home/manhin/Dev/.venv-dev/bin/python templates/tests/test_emitter.py
"""
from __future__ import annotations

import copy
import itertools
import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
REPO = os.path.dirname(ROOT)
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(REPO, "fusenf", "harness"))

import canonicalize as C  # noqa: E402
from tmpl import emitter as E, records as R, registry as G  # noqa: E402

REG = G.load()
D = "(STV 1.0 0.99)"


def rec(statements):
    return {"schema": "fusenf-parse/1", "id": "test-000001", "run": 1, "sentences": ["--"],
            "context": {"today": None, "domain": None, "prior": [], "notes": None},
            "statements": list(statements)}


def st(*contents, stv=D):
    return [f"(: p{i} {c} {stv})" for i, c in enumerate(contents)]


def item(*instances, unmapped=()):
    return {"id": "test-000001", "instances": list(instances), "unmapped": list(unmapped)}


class Base(unittest.TestCase):
    def same(self, it, expected):
        out = E.emit(it, REG)
        got = C.canonicalize(rec(out["statements"]))
        exp = C.canonicalize(rec([f"(: q{i} {s[s.index('('):]}" if not s.startswith("(:") else s
                                  for i, s in enumerate(expected)]))
        if got["graph_id"] != exp["graph_id"]:
            self.fail("canonical mismatch\n  emitted:\n    " + "\n    ".join(out["statements"])
                      + "\n  expected:\n    " + "\n    ".join(expected))
        return out


def n(i, name, **kw):
    return dict({"t": "E01", "id": i, "name": name}, **kw)


def x(i, kind, d=True, **kw):
    return dict({"t": "E02", "id": i, "kind": kind, "def": d}, **kw)


def g(i, d=True, **kw):
    return dict({"t": "E03", "id": i, "def": d}, **kw)


def ev(i, verb, **roles):
    return {"t": "V01", "id": i, "verb": verb, "roles": roles} if roles else \
           {"t": "V01", "id": i, "verb": verb}


def past(i):
    return {"t": "O01", "on": "@" + i, "head": "Past"}


class PromptExamples(Base):
    def test_transfer_with_location(self):          # Maria gave Bob a book in the library.
        self.same(item(n("n1", "Maria"), n("n2", "Bob"), x("x1", "book", False), x("x2", "library"),
                       ev("e1", "give", Agent="@n1", Recipient="@n2", Theme="@x1", Location="@x2"),
                       past("e1")),
                  st('(Member sk_give_1 give)', '(Agent sk_give_1 maria)', '(Recipient sk_give_1 bob)',
                     '(Theme sk_give_1 sk_book_1)', '(Member sk_book_1 book)',
                     '(Location sk_give_1 sk_library_1)', '(Member sk_library_1 library)',
                     '(Past sk_give_1)', '(Name maria "Maria")', '(Name bob "Bob")'))

    def test_event_negation(self):                  # Bob didn't cook dinner.
        self.same(item(n("n1", "Bob"), ev("e1", "cook", Agent="@n1", Patient="dinner"), past("e1"),
                       {"t": "O03", "over": ["@e1"]}),
                  st('(Name bob "Bob")') +
                  st('(And (Member sk_cook_1 cook) (Agent sk_cook_1 bob) (Patient sk_cook_1 dinner) '
                     '(Past sk_cook_1))', stv="(STV 0.0 0.99)"))

    def test_prohibition(self):                     # Bob may not enter.
        self.same(item(n("n1", "Bob"), ev("e1", "enter", Agent="@n1"),
                       {"t": "O01", "on": "@e1", "head": "Permitted"}, {"t": "O03", "over": ["@e1"]}),
                  st('(Name bob "Bob")') +
                  st('(And (Member sk_enter_1 enter) (Agent sk_enter_1 bob) (Permitted sk_enter_1))',
                     stv="(STV 0.0 0.99)"))

    def test_indefinite_subject_stays_inside_denial(self):   # A cooper does not caulk the barrel.
        self.same(item(x("x1", "cooper", False), x("x2", "barrel"),
                       ev("e1", "caulk", Agent="@x1", Patient="@x2"), {"t": "O03", "over": ["@e1"]}),
                  st('(Member sk_barrel_1 barrel)') +
                  st('(And (Member sk_caulk_1 caulk) (Agent sk_caulk_1 sk_cooper_1) '
                     '(Member sk_cooper_1 cooper) (Patient sk_caulk_1 sk_barrel_1))',
                     stv="(STV 0.0 0.99)"))

    def test_negated_plural_keeps_both(self):       # The kegs do not ferment.
        self.same(item(g("g1", kind="keg"), ev("e1", "ferment", Agent="@g1"),
                       {"t": "R03", "id": "r1", "group": "@g1", "verb": "ferment",
                        "subj_role": "Agent"},
                       {"t": "O03", "over": ["@e1", "@r1"]}),
                  st('(GroupOf sk_group_1 keg)') +
                  st('(And (Member sk_ferment_1 ferment) (Agent sk_ferment_1 sk_group_1))',
                     stv="(STV 0.0 0.99)") +
                  st('(Implication (PartOf $x sk_group_1) (And (Member (sk_ferment $x) ferment) '
                     '(Agent (sk_ferment $x) $x)))', stv="(STV 0.0 0.9)"))

    def test_attitude_seal_and_projection(self):    # Nadia believes that the bridge is unsafe.
        self.same(item(n("n1", "Nadia"), x("x1", "bridge"),
                       {"t": "C01", "id": "c1", "subj": "@x1", "pred": "unsafe"},
                       {"t": "V05", "id": "e1", "verb": "believe", "holder": "@n1",
                        "content": ["@c1"]}),
                  st('(Name nadia "Nadia")', '(Member sk_believe_1 believe)',
                     '(Experiencer sk_believe_1 nadia)',
                     '(Theme sk_believe_1 (Member sk_bridge_1 unsafe))', '(Member sk_bridge_1 bridge)'))

    def test_attitude_multi_atom_complement(self):  # Nadia believes Tom left.
        self.same(item(n("n1", "Nadia"), n("n2", "Tom"), ev("e1", "leave", Agent="@n2"), past("e1"),
                       {"t": "V05", "id": "e2", "verb": "believe", "holder": "@n1",
                        "content": ["@e1"]}),
                  st('(Name nadia "Nadia")', '(Name tom "Tom")', '(Member sk_believe_1 believe)',
                     '(Experiencer sk_believe_1 nadia)',
                     '(Theme sk_believe_1 (And (Member sk_leave_1 leave) (Agent sk_leave_1 tom) '
                     '(Past sk_leave_1)))'))

    def test_indefinite_stays_inside_seal(self):    # believes a unicorn escaped
        self.same(item(n("n1", "Nadia"), x("x1", "unicorn", False), ev("e1", "escape", Agent="@x1"),
                       past("e1"),
                       {"t": "V05", "id": "e2", "verb": "believe", "holder": "@n1",
                        "content": ["@e1"]}),
                  st('(Name nadia "Nadia")', '(Member sk_believe_1 believe)',
                     '(Experiencer sk_believe_1 nadia)',
                     '(Theme sk_believe_1 (And (Member sk_escape_1 escape) '
                     '(Agent sk_escape_1 sk_unicorn_1) (Past sk_escape_1) '
                     '(Member sk_unicorn_1 unicorn)))'))

    def test_wholly_negative_complement_drops(self):   # said the count did not tally
        out = self.same(item(x("x1", "clerk"), x("x2", "count"), ev("e1", "tally", Agent="@x2"),
                             past("e1"), {"t": "O03", "over": ["@e1"]},
                             {"t": "V05", "id": "e2", "verb": "say", "holder": "@x1",
                              "content": ["@e1"]}, past("e2")),
                        st('(Member sk_clerk_1 clerk)', '(Member sk_count_1 count)',
                           '(Member sk_say_1 say)', '(Experiencer sk_say_1 sk_clerk_1)',
                           '(Past sk_say_1)'))
        self.assertEqual([l["code"] for l in out["losses"]], ["G05"])

    def test_quantified_copular(self):              # All swans are white.
        self.same(item({"t": "C02", "id": "c1", "subj": "swan", "pred": "white", "qword": "all",
                        "dial": "empirical"}),
                  st('(Inheritance swan white)', stv="(STV 1.0 0.9)") +
                  st('(QuantifierPhrase swan white "all")'))

    def test_kind_dials(self):
        cases = [({"dial": "definitional"}, "(STV 1.0 0.99)"),          # Oaks are trees.
                 ({"dial": "empirical"}, "(STV 0.9 0.9)"),              # Lemons are sour.
                 ({"dial": "empirical", "striking": True}, "(STV 0.3 0.9)")]
        for extra, stv in cases:
            self.same(item(dict({"t": "C02", "id": "c1", "subj": "oak", "pred": "tree"}, **extra)),
                      st('(Inheritance oak tree)', stv=stv))
        self.same(item({"t": "C02", "id": "c1", "subj": "square", "pred": "round", "qword": "no",
                        "dial": "definitional"}),
                  st('(Inheritance square round)', stv="(STV 0.0 0.99)") +
                  st('(QuantifierPhrase square round "no")'))
        self.same(item({"t": "C02", "id": "c1", "subj": "spider", "pred": "insect",
                        "dial": "definitional"}, {"t": "O03", "over": ["@c1"]}),
                  st('(Inheritance spider insect)', stv="(STV 0.0 0.99)"))

    def test_counted_plural_distributes(self):      # Both dogs barked.
        self.same(item(g("g1", kind="dog"), {"t": "N01", "group": "@g1", "n": 2},
                       ev("e1", "bark", Agent="@g1"), past("e1"),
                       {"t": "R03", "id": "r1", "group": "@g1", "verb": "bark",
                        "subj_role": "Agent", "status": ["Past"]}),
                  st('(GroupOf sk_group_1 dog)', '(Cardinality sk_group_1 2)',
                     '(Member sk_bark_1 bark)', '(Agent sk_bark_1 sk_group_1)', '(Past sk_bark_1)') +
                  st('(Implication (PartOf $x sk_group_1) (And (Member (sk_bark $x) bark) '
                     '(Agent (sk_bark $x) $x) (Past (sk_bark $x))))', stv="(STV 1.0 0.9)"))

    def test_universal_over_group(self):            # Every member of the committee resigned.
        self.same(item(g("g1", collective="committee"),
                       {"t": "R03", "id": "r1", "group": "@g1", "verb": "resign",
                        "subj_role": "Agent", "status": ["Past"], "qword": "every"}),
                  st('(Member sk_committee_1 committee)', '(QuantifierPhrase committee resign "every")')
                  + st('(Implication (PartOf $x sk_committee_1) (And (Member (sk_resign $x) resign) '
                       '(Agent (sk_resign $x) $x) (Past (sk_resign $x))))', stv="(STV 1.0 0.9)"))

    def test_generic_rules(self):
        self.same(item({"t": "R01", "id": "r1", "kind": "bird", "verb": "fly", "subj_role": "Agent",
                        "dial": "empirical"}),                       # Birds fly.
                  st('(Implication (Member $x bird) (And (Member (sk_fly $x) fly) '
                     '(Agent (sk_fly $x) $x)))', stv="(STV 0.9 0.9)"))
        self.same(item(x("x1", "causeway"),                          # Foxes rarely cross the causeway.
                       {"t": "R01", "id": "r1", "kind": "fox", "verb": "cross", "subj_role": "Agent",
                        "roles": {"Theme": "@x1"}, "qword": "rarely", "dial": "empirical"}),
                  st('(Member sk_causeway_1 causeway)', '(QuantifierPhrase fox cross "rarely")') +
                  st('(Implication (Member $x fox) (And (Member (sk_cross $x) cross) '
                     '(Agent (sk_cross $x) $x) (Theme (sk_cross $x) sk_causeway_1)))',
                     stv="(STV 0.1 0.9)"))
        out = self.same(item({"t": "R01", "id": "r1", "kind": "owl", "verb": "migrate",
                              "subj_role": "Agent", "dial": "empirical"},
                             {"t": "O03", "over": ["@r1"]}),              # Owls don't migrate.
                        st('(Implication (Member $x owl) (And (Member (sk_migrate $x) migrate) '
                           '(Agent (sk_migrate $x) $x)))', stv="(STV 0.0 0.9)"))
        self.assertEqual(out["derived"].get("R02"), 1)
        self.same(item({"t": "R01", "id": "r1", "kind": "student", "verb": "pass",
                        "subj_role": "Agent", "qword": "all", "dial": "empirical",
                        "status": ["Past"]}),                        # All the students passed.
                  st('(QuantifierPhrase student pass "all")') +
                  st('(Implication (Member $x student) (And (Member (sk_pass $x) pass) '
                     '(Agent (sk_pass $x) $x) (Past (sk_pass $x))))', stv="(STV 1.0 0.9)"))

    def test_none_of_the_is_the_negative_twin(self):   # None of the tenants complained.
        self.same(item({"t": "R01", "id": "r1", "kind": "tenant", "verb": "complain",
                        "subj_role": "Agent", "qword": "none", "dial": "empirical",
                        "status": ["Past"]}),
                  st('(QuantifierPhrase tenant complain "none")') +
                  st('(Implication (Member $x tenant) (And (Member (sk_complain $x) complain) '
                     '(Agent (sk_complain $x) $x) (Past (sk_complain $x))))', stv="(STV 0.0 0.9)"))

    def test_connective(self):                      # The latch stuck because the hinge rusted.
        self.same(item(x("x1", "latch"), x("x2", "hinge"), ev("e1", "stick", Patient="@x1"),
                       past("e1"), ev("e2", "rust", Patient="@x2"), past("e2"),
                       {"t": "L01", "connective": "because", "main": "@e1", "sub": "@e2"}),
                  st('(Member sk_stick_1 stick)', '(Patient sk_stick_1 sk_latch_1)',
                     '(Member sk_latch_1 latch)', '(Past sk_stick_1)', '(Member sk_rust_1 rust)',
                     '(Patient sk_rust_1 sk_hinge_1)', '(Member sk_hinge_1 hinge)', '(Past sk_rust_1)',
                     '(Because sk_stick_1 sk_rust_1)'))

    def test_multiword_connective(self):
        out = E.emit(item(x("x1", "latch"), ev("e1", "stick", Patient="@x1"), ev("e2", "jam",
                          Patient="@x1"), {"t": "L01", "connective": "as a result", "main": "@e1",
                                           "sub": "@e2"}), REG)
        self.assertTrue(any("(AsAResult sk_stick_1 sk_jam_1)" in s for s in out["statements"]))

    def test_copular_endpoint_dual_emit(self):      # The wallpaper peeled because it was damp.
        self.same(item(x("x1", "wallpaper"), ev("e1", "peel", Patient="@x1"), past("e1"),
                       {"t": "V02", "id": "s1", "prop": "damp", "subj": "@x1",
                        "trigger": "connective"}, past("s1"),
                       {"t": "L01", "connective": "because", "main": "@e1", "sub": "@s1"}),
                  st('(Member sk_wallpaper_1 wallpaper)', '(Member sk_peel_1 peel)',
                     '(Patient sk_peel_1 sk_wallpaper_1)', '(Past sk_peel_1)',
                     '(Member sk_damp_1 damp)', '(Experiencer sk_damp_1 sk_wallpaper_1)',
                     '(Past sk_damp_1)', '(Past (Member sk_wallpaper_1 damp))',
                     '(Because sk_peel_1 sk_damp_1)'))

    def test_copular_with_time(self):               # Alice was ill on Friday.
        self.same(item(n("n1", "Alice"),
                       {"t": "V02", "id": "s1", "prop": "ill", "subj": "@n1", "trigger": "time"},
                       past("s1"), {"t": "T01", "on": "@s1", "terms": {"Weekday": "friday"}}),
                  st('(Name alice "Alice")', '(Member sk_ill_1 ill)', '(Experiencer sk_ill_1 alice)',
                     '(Time sk_ill_1 (Weekday friday))', '(Past sk_ill_1)',
                     '(Past (Member alice ill))'))

    def test_narrow_or(self):                       # Bob ordered tea or coffee.
        self.same(item(n("n1", "Bob"), ev("e1", "order", Agent="@n1"), past("e1"),
                       {"t": "J01", "event": "@e1", "role": "Theme", "alts": ["tea", "coffee"]}),
                  st('(Name bob "Bob")',
                     '(And (Member sk_order_1 order) (Agent sk_order_1 bob) '
                     '(Or (Theme sk_order_1 tea) (Theme sk_order_1 coffee)) (Past sk_order_1))'))

    def test_or_with_indefinite_branches(self):     # Priya ordered a salad or a sandwich.
        self.same(item(n("n1", "Priya"), x("x1", "salad", False), x("x2", "sandwich", False),
                       ev("e1", "order", Agent="@n1"), past("e1"),
                       {"t": "J01", "event": "@e1", "role": "Theme", "alts": ["@x1", "@x2"]}),
                  st('(Name priya "Priya")',
                     '(And (Member sk_order_1 order) (Agent sk_order_1 priya) '
                     '(Or (And (Theme sk_order_1 sk_salad_1) (Member sk_salad_1 salad)) '
                     '(And (Theme sk_order_1 sk_sandwich_1) (Member sk_sandwich_1 sandwich))) '
                     '(Past sk_order_1))'))

    def test_property_or(self):                     # The vase is red or blue.
        self.same(item(x("x1", "vase"), {"t": "J01", "subj": "@x1", "props": ["red", "blue"]}),
                  st('(Member sk_vase_1 vase)',
                     '(Or (Member sk_vase_1 red) (Member sk_vase_1 blue))'))

    def test_copular_tense_and_modality(self):
        self.same(item(n("n1", "Alice"), {"t": "C01", "id": "c1", "subj": "@n1", "pred": "happy"},
                       past("c1")),
                  st('(Name alice "Alice")', '(Past (Member alice happy))'))
        self.same(item(n("n1", "John"), {"t": "C01", "id": "c1", "subj": "@n1", "pred": "asleep"},
                       {"t": "O01", "on": "@c1", "head": "Must"}),
                  st('(Name john "John")') + st('(Must (Member john asleep))', stv="(STV 1.0 0.9)"))

    def test_calendar_time(self):                   # The festival opened on June 5, 2021.
        self.same(item(x("x1", "festival"), ev("e1", "open", Patient="@x1"), past("e1"),
                       {"t": "T01", "on": "@e1", "terms": {"Day": 5, "Year": 2021, "Month": "june"}}),
                  st('(Member sk_open_1 open)', '(Patient sk_open_1 sk_festival_1)',
                     '(Member sk_festival_1 festival)', '(Time sk_open_1 (Year 2021))',
                     '(Time sk_open_1 (Month june))', '(Time sk_open_1 (Day 5))', '(Past sk_open_1)'))

    def test_measured_order(self):                  # The bus left ten minutes before the show.
        self.same(item(x("x1", "bus"), x("x2", "show"), ev("e1", "leave", Agent="@x1"), past("e1"),
                       {"t": "T08", "earlier": "@e1", "later": "@x2",
                        "gap": {"n": 10, "unit": "minute"}}),
                  st('(Member sk_bus_1 bus)', '(Member sk_show_1 show)', '(Member sk_leave_1 leave)',
                     '(Agent sk_leave_1 sk_bus_1)', '(Past sk_leave_1)',
                     '(BeforeBy sk_leave_1 sk_show_1 10 minute)'))

    def test_ago(self):                             # Leo resigned three days ago.
        self.same(item(n("n1", "Leo"), ev("e1", "resign", Agent="@n1"), past("e1"),
                       {"t": "T08", "earlier": "@e1", "later": "now",
                        "gap": {"n": 3, "unit": "day"}}),
                  st('(Name leo "Leo")', '(Member sk_resign_1 resign)', '(Agent sk_resign_1 leo)',
                     '(Past sk_resign_1)', '(BeforeBy sk_resign_1 now 3 day)'))

    def test_positions(self):
        self.same(item(n("n1", "Thornmere"), n("n2", "Calderwick"),
                       {"t": "C01", "id": "c1", "subj": "@n1", "pred": "village"},
                       {"t": "C14", "id": "c2", "entity": "@n1", "prep": "in", "place": "@n2"}),
                  st('(Name thornmere "Thornmere")', '(Name calderwick "Calderwick")',
                     '(Member thornmere village)', '(LocatedIn thornmere calderwick)'))
        self.same(item(x("x1", "ledger", False), x("x2", "workbench"),   # a ledger on the workbench
                       {"t": "C14", "id": "c1", "entity": "@x1", "prep": "on", "place": "@x2"},
                       past("c1")),
                  st('(Member sk_ledger_1 ledger)', '(Member sk_workbench_1 workbench)',
                     '(Past (On sk_ledger_1 sk_workbench_1))'))
        out = E.emit(item(x("x1", "lamp"), x("x2", "kiln"),
                          {"t": "C14", "id": "c1", "entity": "@x1", "prep": "next to",
                           "place": "@x2"}), REG)
        self.assertTrue(any("(NextTo sk_lamp_1 sk_kiln_1)" in s for s in out["statements"]))

    def test_names(self):
        out = E.emit(item(n("n1", "Dr Okoro", title="Dr"), n("n2", "Kestrel River", kind="river"),
                          n("n3", "Halvard of Sunne"), n("n4", "54 Mill Lane")), REG)
        text = "\n".join(out["statements"])
        for want in ('(Name okoro "Dr Okoro")', '(Name kestrel_river "Kestrel River")',
                     '(Member kestrel_river river)', '(Name halvard_of_sunne "Halvard of Sunne")',
                     '(Name addr_54_mill_lane "54 Mill Lane")'):
            self.assertIn(want, text)
        out = E.emit(item(n("n1", "Alice"), n("n2", "Alice")), REG)
        self.assertIn('(Name alice_1 "Alice")', "\n".join(out["statements"]))
        self.assertIn('(Name alice_2 "Alice")', "\n".join(out["statements"]))

    def test_possession(self):                      # Tom's phone …
        self.same(item(n("n1", "Tom"), x("x1", "phone"),
                       {"t": "E08", "possessed": "@x1", "possessor": "@n1"}),
                  st('(Name tom "Tom")', '(Member sk_phone_1 phone)', '(Possession sk_phone_1 tom)'))

    def test_comparatives(self):
        self.same(item(n("n1", "Alice"), n("n2", "Bob"),
                       {"t": "D01", "id": "d1", "scale": "tall", "x": "@n1", "y": "@n2"}),
                  st('(More tall alice bob)', '(Name alice "Alice")', '(Name bob "Bob")'))
        self.same(item(n("n1", "Maria"), n("n2", "Tom"),      # Maria is less patient than Tom.
                       {"t": "D01", "id": "d1", "scale": "patient", "x": "@n1", "y": "@n2",
                        "less": True}),
                  st('(More patient tom maria)', '(Name maria "Maria")', '(Name tom "Tom")'))
        self.same(item({"t": "D01", "id": "d1", "scale": "hard", "x": "basalt", "y": "chalk"}),
                  st('(More hard basalt chalk)', stv="(STV 1.0 0.9)"))

    def test_group_measure(self):                   # The crates weighed 180 kg.
        self.same(item(g("g1", kind="crate"),
                       {"t": "M01", "id": "m1", "entity": "@g1", "scale": "weight", "n": 180,
                        "unit": "kilogram"}, past("m1")),
                  st('(GroupOf sk_group_1 crate)', '(Past (Measure sk_group_1 weight 180 kilogram))'))

    def test_collective(self):                      # Bob and Alice met.
        self.same(item(n("n1", "Bob"), n("n2", "Alice"), ev("e1", "meet", Agent=["@n1", "@n2"]),
                       past("e1"), {"t": "V17", "mode": "collective", "instances": ["@e1"]}),
                  st('(Name bob "Bob")', '(Name alice "Alice")', '(Member sk_meet_1 meet)',
                     '(Agent sk_meet_1 bob)', '(Agent sk_meet_1 alice)', '(Past sk_meet_1)'))


class Rulings(Base):
    def test_corner2_tense_inside_copular_denial(self):   # The loft was not a legal dwelling.
        self.same(item(x("x1", "loft"),
                       {"t": "C01", "id": "c1", "subj": "@x1", "pred": "dwelling"},
                       {"t": "C01", "id": "c2", "subj": "@x1", "pred": "legal"},
                       past("c1"), past("c2"), {"t": "O03", "over": ["@c1", "@c2"]}),
                  st('(Member sk_loft_1 loft)') +
                  st('(And (Past (Member sk_loft_1 dwelling)) (Past (Member sk_loft_1 legal)))',
                     stv="(STV 0.0 0.99)"))

    def test_corner4_link_positive_over_denied_endpoint(self):
        self.same(item(x("x1", "latch"), x("x2", "hinge"), ev("e1", "stick", Patient="@x1"),
                       past("e1"), ev("e2", "oil", Patient="@x2"), past("e2"),
                       {"t": "O03", "over": ["@e2"]},
                       {"t": "L01", "connective": "because", "main": "@e1", "sub": "@e2"}),
                  st('(Member sk_latch_1 latch)', '(Member sk_hinge_1 hinge)',
                     '(Member sk_stick_1 stick)', '(Patient sk_stick_1 sk_latch_1)',
                     '(Past sk_stick_1)', '(Because sk_stick_1 sk_oil_1)') +
                  st('(And (Member sk_oil_1 oil) (Patient sk_oil_1 sk_hinge_1) (Past sk_oil_1))',
                     stv="(STV 0.0 0.99)"))

    def test_corner4_denied_link(self):             # not because X, but because Y
        out = E.emit(item(x("x1", "alarm"), x("x2", "battery"), x("x3", "wire"),
                          ev("e1", "sound", Agent="@x1"), past("e1"),
                          {"t": "V02", "id": "s1", "prop": "flat", "subj": "@x2",
                           "trigger": "connective"}, past("s1"),
                          ev("e2", "snap", Patient="@x3"), past("e2"),
                          {"t": "L01", "connective": "because", "main": "@e1", "sub": "@s1",
                           "denied": True},
                          {"t": "L01", "connective": "because", "main": "@e1", "sub": "@e2"}), REG)
        text = "\n".join(out["statements"])
        self.assertIn("(Because sk_sound_1 sk_flat_1) (STV 0.0 0.99)", text)
        self.assertIn("(Because sk_sound_1 sk_snap_1) (STV 1.0 0.99)", text)
        self.assertIn("(Member sk_sound_1 sound) (STV 1.0 0.99)", text)     # the event is asserted

    def test_corner4_temporal_relation_inside_bundle(self):   # The bus did not leave before the show.
        self.same(item(x("x1", "bus"), x("x2", "show"), ev("e1", "leave", Agent="@x1"), past("e1"),
                       {"t": "T08", "earlier": "@e1", "later": "@x2"}, {"t": "O03", "over": ["@e1"]}),
                  st('(Member sk_bus_1 bus)', '(Member sk_show_1 show)') +
                  st('(And (Member sk_leave_1 leave) (Agent sk_leave_1 sk_bus_1) (Past sk_leave_1) '
                     '(Before sk_leave_1 sk_show_1))', stv="(STV 0.0 0.99)"))

    def test_corner5_neither_is_two_denials(self):  # Bob did not order tea or coffee.
        self.same(item(n("n1", "Bob"), ev("e1", "order", Agent="@n1", Theme="tea"), past("e1"),
                       ev("e2", "order", Agent="@n1", Theme="coffee"), past("e2"),
                       {"t": "O03", "over": ["@e1"]}, {"t": "O03", "over": ["@e2"]}),
                  st('(Name bob "Bob")') +
                  st('(And (Member sk_order_1 order) (Agent sk_order_1 bob) (Theme sk_order_1 tea) '
                     '(Past sk_order_1))',
                     '(And (Member sk_order_2 order) (Agent sk_order_2 bob) '
                     '(Theme sk_order_2 coffee) (Past sk_order_2))', stv="(STV 0.0 0.99)"))

    def test_corner5_denied_or_is_rejected(self):
        it = item(n("n1", "Bob"), ev("e1", "order", Agent="@n1"),
                  {"t": "J01", "event": "@e1", "role": "Theme", "alts": ["tea", "coffee"]},
                  {"t": "O03", "over": ["@e1"]})
        res = R.validate(it, REG)
        self.assertFalse(res["ok"])
        self.assertEqual([f["code"] for f in res["findings"]], ["R8"])
        with self.assertRaises(E.EmitError):
            E.emit(it, REG)

    def test_corner6_or_inside_seal(self):          # believes that Bob or Alice took the key
        self.same(item(n("n1", "Nadia"), n("n2", "Bob"), n("n3", "Alice"), x("x1", "key"),
                       ev("e1", "take", Theme="@x1"), past("e1"),
                       {"t": "J01", "event": "@e1", "role": "Agent", "alts": ["@n2", "@n3"]},
                       {"t": "V05", "id": "e2", "verb": "believe", "holder": "@n1",
                        "content": ["@e1"]}),
                  st('(Name nadia "Nadia")', '(Name bob "Bob")', '(Name alice "Alice")',
                     '(Member sk_key_1 key)', '(Member sk_believe_1 believe)',
                     '(Experiencer sk_believe_1 nadia)',
                     '(Theme sk_believe_1 (And (Member sk_take_1 take) '
                     '(Or (Agent sk_take_1 bob) (Agent sk_take_1 alice)) '
                     '(Theme sk_take_1 sk_key_1) (Past sk_take_1)))'))

    def test_ordering_never_crosses_a_seal(self):
        out = E.emit(item(n("n1", "Nadia"), n("n2", "Tom"), ev("e1", "leave", Agent="@n2"),
                          past("e1"), ev("e3", "arrive", Agent="@n1"), past("e3"),
                          {"t": "V05", "id": "e2", "verb": "believe", "holder": "@n1",
                           "content": ["@e1"]},
                          {"t": "T08", "earlier": "@e1", "later": "@e3"}), REG)
        self.assertFalse(any("Before" in s for s in out["statements"]))
        self.assertEqual([l["code"] for l in out["losses"]], ["SEAL"])


class Determinism(Base):
    ITEM = item(n("n1", "Maria"), n("n2", "Bob"), x("x1", "book", False), x("x2", "library"),
                ev("e1", "give", Agent="@n1", Recipient="@n2", Theme="@x1", Location="@x2"),
                past("e1"), {"t": "T02", "on": "@e1", "const": "yesterday"})

    def test_byte_identical(self):
        a = E.emit(copy.deepcopy(self.ITEM), REG)
        b = E.emit(copy.deepcopy(self.ITEM), REG)
        self.assertEqual(a, b)

    def test_instance_order_does_not_change_the_graph(self):
        base = C.canonicalize(rec(E.emit(self.ITEM, REG)["statements"]))["graph_id"]
        for perm in itertools.islice(itertools.permutations(self.ITEM["instances"]), 0, 5040, 97):
            it = {"id": self.ITEM["id"], "instances": list(perm), "unmapped": []}
            self.assertEqual(C.canonicalize(rec(E.emit(it, REG)["statements"]))["graph_id"], base)

    def test_proof_names_unique_and_well_formed(self):
        out = E.emit(self.ITEM, REG)
        names = [d["name"] for d in out["detail"]]
        self.assertEqual(len(names), len(set(names)))
        for nm in names:
            self.assertRegex(nm, r"^[a-z][a-z0-9_]*$")


class RegistryExamples(Base):
    def test_every_example_validates_and_renders(self):
        import json
        count = 0
        for tid, t in REG["templates"].items():
            for ex in t.get("examples", []):
                it = json.loads(ex["records_json"])
                res = R.validate(it, REG)
                self.assertTrue(res["ok"], f"{tid}: {res['findings']}")
                out = E.emit(it, REG)
                self.assertTrue(out["statements"], tid)
                C.canonicalize(rec(out["statements"]))
                count += 1
        self.assertGreaterEqual(count, 20)


class ExampleHygiene(unittest.TestCase):
    """HARD RULE: regression sentences never copy instruction examples, and the other way round.
    No registry example sentence may occur in prompt.txt, the goldens, or any corpus."""

    @staticmethod
    def norm(s):
        import re
        return re.sub(r"[^a-z0-9 ]+", "", s.lower()).strip()

    def test_examples_are_fresh(self):
        import glob
        import json
        import re
        seen = set()
        for path in [os.path.join(REPO, "prompt.txt"),
                     os.path.join(REPO, "regression", "regression_cases.md")]:
            for piece in re.split(r"(?<=[.!?])\s+|\n", open(path, encoding="utf-8").read()):
                piece = re.sub(r"^[\s>*\-`\[\]a-z0-9_-]*\]\s*", "", piece.strip())
                seen.add(self.norm(piece))
        for path in sorted(glob.glob(os.path.join(REPO, "fusenf", "corpora", "*.jsonl"))):
            for line in open(path, encoding="utf-8"):
                if line.strip():
                    for s in json.loads(line).get("sentences", []):
                        seen.add(self.norm(s))
        text_blob = self.norm(open(os.path.join(REPO, "prompt.txt"), encoding="utf-8").read()
                              + open(os.path.join(REPO, "regression", "regression_cases.md"),
                                     encoding="utf-8").read())
        clashes = []
        for tid, t in REG["templates"].items():
            for ex in t.get("examples", []):
                for s in re.split(r"(?<=[.!?])\s+", ex["text"]):
                    if self.norm(s) in seen or self.norm(s) in text_blob:
                        clashes.append((tid, s))
        self.assertEqual(clashes, [])


class RecordChecks(unittest.TestCase):
    def codes(self, it):
        return sorted({f["code"] for f in R.validate(it, REG)["findings"]})

    def test_shape_and_unknown_template(self):
        self.assertEqual(self.codes({"id": "a", "instances": []}), ["R1"])
        self.assertEqual(self.codes(item({"t": "Z99"})), ["R2"])
        self.assertEqual(self.codes(item({"t": "E04"})), ["R2"])        # slot-level, never a record

    def test_slots_refs_lemmas(self):
        self.assertEqual(self.codes(item({"t": "E02", "id": "x1", "kind": "book"})), ["R3"])
        self.assertEqual(self.codes(item(x("x1", "Book"))), ["R6"])
        self.assertEqual(self.codes(item(ev("e1", "cook", Agent="@nobody"))), ["R4"])
        self.assertEqual(self.codes(item(x("x1", "book"), x("x1", "pen"))), ["R5"])
        self.assertEqual(self.codes(item(x("x1", "book"), ev("e1", "read", Reader="@x1"))), ["R5"])
        self.assertEqual(self.codes(item(x("x1", "book", extra=1))), ["R3"])
        self.assertEqual(self.codes(item(x("x1", "book"), {"t": "C01", "id": "c1", "subj": "@x1",
                                                          "pred": "old"},
                                         {"t": "T02", "on": "@c1", "const": "today"})), ["R4"])

    def test_unmapped(self):
        ok = item(unmapped=[{"span": "sharply", "code": "G02", "construction": "degree adverb"}])
        self.assertEqual(self.codes(ok), [])
        self.assertEqual(self.codes(item(unmapped=[{"span": "x", "code": "G99",
                                                    "construction": "y"}])), ["R7"])

    def test_composition(self):
        self.assertEqual(self.codes(item(x("x1", "rope"), ev("e1", "snap", Patient="@x1"),
                                         ev("e2", "fray", Patient="@x1"),
                                         {"t": "L01", "connective": "after", "main": "@e1",
                                          "sub": "@e2"})), ["R8"])
        self.assertEqual(self.codes(item(x("x1", "rope"),
                                         {"t": "V02", "id": "s1", "prop": "damp", "subj": "@x1",
                                          "trigger": "time"},
                                         {"t": "C01", "id": "c1", "subj": "@x1", "pred": "damp"})),
                         ["R8"])
        self.assertEqual(self.codes(item({"t": "C02", "id": "c1", "subj": "swan", "pred": "white",
                                          "qword": "several", "dial": "empirical"})), ["R5"])


if __name__ == "__main__":
    unittest.main(verbosity=1)
