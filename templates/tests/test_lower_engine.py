"""The lowering for upstream PeTTaChainer master, on that engine: what ``tmpl.lower`` writes for it loads whole, and
the definitions beside the statements keep a narrowed class usable — its noun follows from it, and its parts can be
asked for.

Needs upstream master's own environment (the engine that refuses a narrowed class under ``Member``); skipped on our
engine line and where no chainer is installed:
    cd <upstream PeTTaChainer checkout> && .venv/bin/python <this file>
"""
from __future__ import annotations

import os
import re
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, os.pardir))

from tmpl import lower as L  # noqa: E402  (pure Python: runs in the chainer's environment too)

try:
    from pettachainer import PeTTaChainer
except Exception:  # not the chainer's environment
    PeTTaChainer = None

TV = [1.0, 0.99]
# "A hive progress report arrived. A yellow bike fell. Three young men sang. Post it as a status report." — the records
# the emitter writes for such sentences, by hand: the narrowed classes under Member, as an argument, inside a sealed
# clause, in a class statement, and one that names an individual of the text.
RECORDS = [
    {"name": "x1_member", "term": ["Member", "sk_report_1", "report"], "truth": TV},
    {"name": "x1_member_2", "term": ["Member", "sk_report_1", ["Narrow", "report", ["Mod", "progress"]]], "truth": TV},
    {"name": "x1_member_3", "term": ["Member", "sk_report_1", ["Narrow", "report", ["And", ["Mod", "hive"], ["Mod", "progress"]]]], "truth": TV},
    {"name": "x2_member_2", "term": ["Member", "sk_bike_1", ["Narrow", "bike", ["Member", "yellow"]]], "truth": TV},
    {"name": "x2_implication", "term": ["Implication", ["Member", "sk_bike_1", ["Narrow", "bike", ["Member", "yellow"]]],
                                        ["Member", "sk_bike_1", "yellow"]], "truth": [0.9, 0.7]},
    {"name": "g1_groupof_2", "term": ["GroupOf", "sk_group_1", ["Narrow", "man", ["Member", "young"]]], "truth": TV},
    {"name": "s1_directive", "term": ["Directive", ["And", ["Member", "sk_post_1", "post"],
                                                    ["As", "sk_post_1", ["Narrow", "report", ["Mod", "status"]]]]], "truth": TV},
    {"name": "c1_inheritance", "term": ["Inheritance", ["Narrow", "cat", ["Mod", "farm"]], "lean"], "truth": [0.9, 0.7]},
    {"name": "x3_member_2", "term": ["Member", "sk_memo_1", ["Narrow", "memo", ["Mod", "sk_brackenford_1"]]], "truth": TV},
]
EMITTED = {"records": RECORDS, "types": {}, "functions": []}


def _refusals(statements: list[str]) -> list[str]:
    h = PeTTaChainer()
    bad = []
    for st in statements:
        try:
            h.add_atom(st)
        except Exception:
            bad.append(st)
    return bad


def _upstream_master() -> bool:
    """Is the installed chainer the one this target is for? It refuses a narrowed class under Member."""
    if PeTTaChainer is None:
        return False
    try:
        return bool(_refusals(["(: probe (Member sk_probe_1 (Narrow report (Mod progress))) (STV 1.0 0.99))"]))
    except Exception:  # a chainer that is installed but does not start here
        return False


def _values(statements: list[str], query: str) -> list[tuple]:
    h = PeTTaChainer()
    for st in statements:
        h.add_atom(st)
    out = []
    for a in h.query(query, steps=400, timeout_sec=0):
        m = re.search(r"^\(: (.*) \(STV ([0-9.e-]+) ([0-9.e-]+)\)\)$", str(a), re.S)
        out.append((m.group(1), float(m.group(2)), float(m.group(3))))
    return out


@unittest.skipUnless(_upstream_master(), "needs upstream PeTTaChainer master (the engine that takes a class as one symbol)")
class UpstreamMasterEngineTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.low = L.lower(EMITTED, "pettachainer-master")
        cls.kb = cls.low["statements"] + cls.low["definitions"]

    def test_the_lowering_loads_whole_where_our_spelling_is_refused(self):
        self.assertEqual(_refusals(self.kb), [])
        refused = _refusals(L.lower(EMITTED)["statements"])
        self.assertEqual(len(refused), 7)                # every statement with a narrowed class but the one inside As

    def test_a_things_noun_follows_from_its_narrowed_class(self):
        # the memo is stated only as a Brackenford memo: that it is a memo comes through the kind-of definition
        memo = [v for v in _values(self.kb, "(: $prf (Member sk_memo_1 memo) $tv)") if "kind__sk_memo__mod_sk_brackenford_1" in v[0]]
        self.assertEqual(len(memo), 1)
        self.assertEqual(memo[0][1], 1.0)
        self.assertGreater(memo[0][2], 0.95)

    def test_a_stated_noun_keeps_its_stated_value_beside_the_definitions(self):
        # the report is stated to be a report, and is one twice more through its two narrowed classes: still (1.0 0.99)
        self.assertEqual([(s, c) for _p, s, c in _values(self.kb, "(: $prf (Member sk_report_1 report) $tv)")], [(1.0, 0.99)])

    def test_an_adjectives_default_still_follows_from_the_class(self):
        yellow = _values(self.kb, "(: $prf (Member sk_bike_1 yellow) $tv)")
        self.assertEqual([(s, round(c, 3)) for _p, s, c in yellow], [(0.9, 0.7)])

    def test_a_class_can_be_asked_for_by_its_parts(self):
        query = L.query(["Member", "$x", ["Narrow", "report", ["Mod", "$m"]]], "pettachainer-master")
        sure = {re.search(r"\(NarrowBy (\S+) \(Mod ([^\s()]+)\)\)", p).groups() for p, s, c in _values(self.kb, query) if s == 1.0 and c > 0.9}
        self.assertEqual(sure, {("report__mod_progress", "progress"), ("report__mod_hive__mod_progress", "hive"),
                                ("report__mod_hive__mod_progress", "progress")})


if __name__ == "__main__":
    unittest.main()
